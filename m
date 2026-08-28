Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AA5392836
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908639; cv=none; b=pNk1O2XvCiXQk0OiECzZ3/48TlopOn+10IUqK0BpxXz566S2CBa5CP7x8Cv80hlXbtuS0kVn+NkgHKtF9X1LlsLkuvpLsK21uTXJGMbSLD/7QwQ84CwzqGIBXwrLimMiCWckuOHvboD/nnni2hd34egLyDDecBfwVfceOxjKOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908639; c=relaxed/simple;
	bh=3FrLH+0C7daMBZPnHBNvaeUPA2qlgt8k3aEGalt3feY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFTuOMp22pu1NAGoZrDmmkVJes2DXzKSawsh2eWSBmN9fbawc1Ubo/wL+VoCLMWaSbcEW0P1zABEI5iUyyiGdHza9sfFFrX3WECEzzfyMNwRd7Tqcca1V7LEr8zfCsitgGp4sOFEKkyrLP3urF8i7YanPCOztOkiRTW6aa2Je30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F1CsX9Zw; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F1CsX9Zw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3FrLH+0C7daMBZPnHBNvaeUPA2qlgt8k3aEGalt3feY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908635; v=1; x=1788513435;
 b=F1CsX9ZwHcQC6oJd6AaWvUVo6OTtZr0iR28vvO0ElXf6GjoLQmOEy8hYuhUtgsl4ePKTOFwl
 x6QDj6vxvAtkpGoVdd7K3MpHZ947PPhM8xeKY69WMTWMK+LwNld5Jik84fmSe5aUzRTg9Zn1gif
 V/SXSEK1r54B/Z2Zzm2ZZIiQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bdfa41f5886f001d;
	Fri, 28 Aug 2026 09:17:15 +0000
X-Mizu-Trace-ID: bdfa41f5886f001d
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: brauner@kernel.org
Cc: jack@suse.cz,
	kees@kernel.org,
	cyphar@cyphar.com,
	containers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn,
	cui.tao@linux.dev
Subject: [PATCH 2/2] userns: don't clear the install target map on map_write() failure
Date: Fri, 28 Aug 2026 17:16:59 +0800
Message-ID: <20260828091659.358700-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091659.358700-1-cui.tao@linux.dev>
References: <20260828091659.358700-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

At the out: label of map_write() the destination map is also cleared
(map->forward = NULL; map->reverse = NULL; map->nr_extents = 0)
whenever the write failed and the extent arrays had to be freed.

However, the destination map is written by the successful install
block above, which has no failure exit; every error path reaches
out: without having touched it.  A second write to a mapped
namespace is also rejected with -EPERM before any parsing happens,
so the clearing can never roll back a previously installed map
either.

The three assignments just zero an already-zero map.  Remove them.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/user_namespace.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index e9e04ce167df..cef5e71779f6 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1104,9 +1104,6 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 	if (ret < 0 && new_map.nr_extents > UID_GID_MAP_MAX_BASE_EXTENTS) {
 		kfree(new_map.forward);
 		kfree(new_map.reverse);
-		map->forward = NULL;
-		map->reverse = NULL;
-		map->nr_extents = 0;
 	}
 
 	mutex_unlock(&userns_state_mutex);
-- 
2.43.0


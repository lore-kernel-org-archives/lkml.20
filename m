Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7630A4582C7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150024; cv=none; b=r98r45dk9DfcQ4pfcmE0CYVNg62m3rKCk3msyHGQPU0RW8G3HC+vwDiD+Ek1SRlkPVUV6nnBEFF9CweNNJZzibSckPX6fW4V1NQfj7q/Qbl0+KJBSiPksAj6qRyKSeh4lSium8BL0YUPURO7T4gecDDIpBLk9YDssueNaOAgvnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150024; c=relaxed/simple;
	bh=k9aG9NTkR7tpemffxDmXEZwtXKod1QtjoReQI2SCkBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rI2k7YOnwA8kS6+G3uOrLssDeBxXAZDu/pq4KyHQr1frF54Donk/OQehb1dhB4Db8k3Dw1CgEvWg2G4I2Jp2WwBCYEWy4xD7vOKufxiWRZ5RrLcR2KUo8K4Ohn5xeE1Ha4SA8WwNWjSI5BDZHXQ7NYkwvkuhJntQVcPjhpJceMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J/z0kt74; arc=none smtp.client-ip=91.218.175.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J/z0kt74"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k9aG9NTkR7tpemffxDmXEZwtXKod1QtjoReQI2SCkBg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790150020; v=1; x=1790754820;
 b=J/z0kt742TFxLpovStKf0O+akIPH4+o8/vh41bbVE2ersnWXwa6vWRKbvSyL6VmpFhfQ8Lys
 tuwrHceC800dj2JzRbEvRrWHzos0ciJ21eYqN8Xim12UzPDlEp2n9fP2HUGWgrdRD5B9ETsht2T
 V+0K0whnZBZy7Zar5f0IBsng=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9c474bbbc8b6e084;
	Wed, 23 Sep 2026 07:53:40 +0000
X-Mizu-Trace-ID: 9c474bbbc8b6e084
X-Migadu-Flow: FLOW_OUT
From: John Garry <john.garry@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	John Garry <john.garry@linux.dev>
Subject: [PATCH] mailmap: Update addresses for John Garry
Date: Wed, 23 Sep 2026 08:53:24 +0100
Message-ID: <20260923075324.1382927-1-john.garry@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Point any employment addresses at my personal dev address.

Signed-off-by: John Garry <john.garry@linux.dev>
---
Andrew, please consider picking this up, Thanks!

diff --git a/.mailmap b/.mailmap
index 1f5540bc33f1..bf1e77d60092 100644
--- a/.mailmap
+++ b/.mailmap
@@ -457,7 +457,8 @@ Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
 Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
 John Crispin <john@phrozen.org> <blogic@openwrt.org>
 John Fastabend <john.fastabend@gmail.com> <john.r.fastabend@intel.com>
-John Garry <john.g.garry@oracle.com> <john.garry@huawei.com>
+John Garry <john.garry@linux.dev> <john.garry@huawei.com>
+John Garry <john.garry@linux.dev> <john.g.garry@oracle.com>
 John Keeping <john@keeping.me.uk> <john@metanate.com>
 John Moon <john@jmoon.dev> <quic_johmoo@quicinc.com>
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
-- 
2.43.0


Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF073EEAC4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518583; cv=none; b=H9pGEq95s1+IqHlV8IVkxQ9GmCjx3mBZVfCr7sEbIeffN6V7DrZU8G6FUavvEk9njWMir9aoW6BmWKwtN2E2JOfLVt8zjLQ3xmAZ0C35dAcl4pNRV2xMnPK8mLxx4goJakaJkzlj74gZ83zUSeAeg1ixc8Cwmft94e+poak6npY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518583; c=relaxed/simple;
	bh=8w3ux5dxQF/VaWUODYk/SATXtztTxPbRqIt+6Pe5jMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UJTMwupTM0eCljdT4ay0ZJQyUi/ku3buPxzezvSVydXSE9jF09qWjG2AJP/558kI3WMLHxaQqHP6VMIzTEvH9lIc/SENmZX4JTg5rujAAZlzR/9kbwEwAPwaoN5lIXUS867g/E3eUtuZjX8d7qdfACSCchuHv1WAHzlwO9nyti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es8aQSD7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es8aQSD7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96c92c0980so563274a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518580; x=1789123380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4a4L7BNv+LxG4ZtAuwYin4s42kbMGqQiy86Ml9znP8k=;
        b=es8aQSD73GRS22fS7DLOIzOMF3yUToukkn+NTVn5v9cnJYoYlDlKST4njnzhhWwhYz
         jyh5MxHqQtaMK2lqnIGEnihPQP30b1eWqLnd5J+U9r4l6j5bO5mLMDWu9hTbf3ZUU1eh
         kP2nHT77YYtxzt+OvGp8e5DiyFxtBBeAiHe+cCxNsd9ZG5UxySThDkRXQ9Oh1HWl5Dar
         4q/QCLs0o2BuAn21qTfyQ8FpQE2ZiUS3rWN+N56ocbVmXNYlipm0hOWo+mdWi1xqXoHr
         QFhOVbHMfJWpg2Q9oj15wCicqy4c8Hd1wY/tcH3aK9nHWfm1509LwftVxVIYmYARPj2T
         yM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518580; x=1789123380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a4L7BNv+LxG4ZtAuwYin4s42kbMGqQiy86Ml9znP8k=;
        b=I1yu7PUHgC372e3EoexP3fQ/tcxB+CkUnDWQ9pEuJeDE9omPOiSEgXhDXAhTzo3kYw
         vyr3xBMGU1i2J/w38OgDwpgdjNSItxlWp6x8ebthVo0uvntt0+goGbr8/GgqGBSweHC7
         4TgxRa95MNZT9zn1we2kvmcRAGGRTnnb6L2Qz24SyUGGS+2M9Vy472tK3jTlpXxSvpOV
         B52lyzjKHo8e1PZ3nhbJikcpz0a7lHmXLvsS5g48NpyyqB/ugwfSab+Y/lFXwYxtxDGs
         vZnlWRfBodBz14wf3gTE42KcrRZZpcGNi1ZKtkimKMrjkTa7nL8yvfWns1IV5tsURrVJ
         oUPw==
X-Gm-Message-State: AFuF++kqPUWe5h1ypQ5A7EQCfS2kCs7gw0impL1rbrKD9pjCTOjpeZOO
	zdDiZO/2w5DEDnvJXzoUn4oBPByj//w6/6NWx+06gKNqtJyRrfhdK7rP
X-Gm-Gg: AYBFou0fWc+FuPO0PRXr/dO2zBuxK8Vrt8hq2lUUGgBijrroNwo9X7r59CRKvZT6wtV
	cfkeuqBW2ynzvAHHgB7ZBRwXIGde5qv6IjRVFSTFL/qbr2kzhs01l0emvz+uDLqcpiDfSXj2bEW
	eJFMRSFLKmy6XROfNJJpdxym7LWJhbFYdwEDGIvP3fB/RXQP29GP8/tORKuTNP5V92xu9qaTVdI
	Cr10u/xXlPl+w7+FIgB1Nr1uChgtmzMyf8HlVUlanwSzv/qLHD18Akfya6OBvF/svhOiRLJdIAm
	td0bVuaGOAtuzo7md+TS0OMIAHc7heSwnUilEnkMWAUiP/g0lzYYH7SWT2oJMbipCnEwDbQw7XN
	dBOH9RQH6xrf8Ys7uSuYpb4OUErY+2pw1VbqAJzYU47jydEM5rso8pQP7DHs1FxWXY+GkciKzTH
	ayojzgEzh7XOqyzpCONisR8kgaA24Tpg5FaPfhXK5YQHT6iWvx2n4nHrSG348zzbR5/8iKJMh4Z
	Tj9+1Hb1VbyfzkLQLk1Jvd8Hgk=
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr8682700a91.2.1788518580475;
        Fri, 04 Sep 2026 03:43:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm5981759eec.19.2026.09.04.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:43:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] memcg: fix typo "memroy" in comment
Date: Fri,  4 Sep 2026 16:12:53 +0530
Message-ID: <20260904104254.16103-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "memroy" to "memory", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/memcontrol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 7d1c0ce189a8..488dafe54d77 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -258,7 +258,7 @@ struct mem_cgroup {
 	atomic_t		kmem_stat;
 #endif
 	/*
-	 * Hint of reclaim pressure for socket memroy management. Note
+	 * Hint of reclaim pressure for socket memory management. Note
 	 * that this indicator should NOT be used in legacy cgroup mode
 	 * where socket memory is accounted/charged separately.
 	 */
-- 
2.48.1


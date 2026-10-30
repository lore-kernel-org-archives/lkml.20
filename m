Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331198;
	b=2oJZJWzYCP5EAWaz4wEKXDBlWUYEHENU0mg9B8cKJswXlG+KeEKqspsJTul68rvaN6Ka
	 BCAEDlXBaruviWOkEawOJCafCNueXWGcKS8Azy4mcS0i6O3aMiRleuFSZQxXyCynGCAh9
	 pzABz31Y7ZsHFrfyT/bDOboRlo9e9ZI3yY9Cfwscd+GrvmNtFtUz2yH1vH1O334b68YOn
	 mMjjl63SgUSErBVTSmiGKElTUIoNczd8V3AYHFEok4nGyCQNxzWVokIS/c6LHZUGRrgpa
	 PY6ENAZgYK5sNS/2cb9OGPq/mnsNkJUTnkPVIbNKEgjAkq1hnsjli+nlEVUKnho+yeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c1EF8TuhBh0bP0+JMlUsrkZ4srW7BPLAHvin7dAYTws=;
	b=k/Dr5hQpBCh20W0y4FFNr4sQciCobuWScnmD57jng++sJyYd9DBb7ju/L22IZoUdUVYX
	 CjiPU/bskRlluZWukIstOmscZAz1ii+hOsLu84QNO5rg2gbaVbek4DjXNWUIgrue5Dxc/
	 p582Jx4M+aoppaC18dDYaYBbZ7gZSjLLFk2xqrrdGxz+jHWf5ZdlS+Md7yJPSUY4RqYMJ
	 r19lTYc7UO7c4piQR9VWgvRWCcrkxbUKbjlonaMVhwlsmLv7PJB5GvEHv3y251CvjXoiv
	 N4IiSWWVIYwtdOTFCAg2o+Lqcj7p7DpePA6R8BC9KprCgS/hjorUtqAu9trVpw6ZZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AO6t4VdM;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7438D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7438D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AO6t4VdM
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so202556a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331198; x=1793935998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EF8TuhBh0bP0+JMlUsrkZ4srW7BPLAHvin7dAYTws=;
        b=AO6t4VdMJzdHRO8xbmcDL8U2gznu11et7yRIZnJzTkzMgZyRKT9b4eWhL7Y6kkgmZh
         K1ZaiVx8HIpuLfHi6KutG/ECRkGOcrSRLfVm1ITWPD0hOlsazLIzMnwxqyeSWoU000Gf
         yfCFkvN+ExIfR65JgHFixRd6kUUEuCbfrVPwLlMLmvTbS68W18LKF/CQf1XiM01r4TiB
         y0dvS0AmlIpRWj9K9TeIP535yAWEIv7lcfEUPqbGILmNxA3075PN47Ci8hlLy9vRxoOk
         5LAn+1J3x9w1AgxftoaFDDVcOevVSEsNSj/vexlfz9cX58lJ70TvtUCjKUaZCT8WMDuq
         Vurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331198; x=1793935998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EF8TuhBh0bP0+JMlUsrkZ4srW7BPLAHvin7dAYTws=;
        b=ss4D318MK7dCVqTJUp+iHESYm+ujV2mJe2zEaqGaSN3LhzCPN2ypkKDO2M+hL/SRmJ
         QseapzAv4gXUCqiwnXBjn7cO5DbUVUpqgFdEdSyq26R3kGwEShrIiwHaC6ypynUaQm4q
         olSk/0pSzP3Uu/pOtmCXEQ78nCUD6UddPwXiSkwiVFHcVbm04UcMn2yGT00E3LCd5aYT
         PWB3Or2+FiCB8d5TJ+xyeq1pLUBYBmXErol5RKPdXxM79xd+esEEmFklaPIDtqsgzqUp
         xf2QR4fjdESSbxYmVh/+PNZcURAl3TbpHzrWsbHK1rCMBQtwsJqT4LwFYpckRNpHXI3z
         IDig==
X-Forwarded-Encrypted: i=1; AKwUvBzfKBHOtd4U+3tySMU1pCUBtkvz7w52rZ5zcwFWl8Odq0qdMvzXPiudzib2u4oatTUeEW39ZWWydjLQkPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+bfqvG9+hIdIZRrbH8YaTd1F1JePwjQxgz1Uiuv7EQNE7KDPp
	gnoWP4TxbA0pjLirnySlgLZLOv+fF64Uqj6y6QMRXrptMLytX4SJCiyibXqpg8t3u6o=
X-Gm-Gg: AYBFou1JTIfH7m9EVu1bhZ4Lzs/hmlBucYp4yTVabgfHfzRQvXZuzyzu9aA/z2yHl25
	aTPxF0li61aU6hBJNhzE6xq8e4exHSa2+0wME3N7Cr+sbz9Xq8QeF7yJ3+Mx+kMBrNlFWqk18wP
	JdszvWrRAwQpA6Tjufe8NFyp95JEHmfl0R2R4wNeXnUaSL+iGhgxXaf/mAwwEd+QdX6TOxGRFWS
	9fH49NhoFbSuTAuyPrmBckQSVzESVOsmouj89IRKWY/9Ee9OJ1vfIdRd7v5jqgQ1WGpWgP5mqNQ
	hjk3WC7kV9VeNHuCDgl9tN67gaRJC8M0M4sh6a73HR9TGHko29I6nSTCGPOzIjeW3cOuLfimJH5
	7h24lajR1zA22CQRbVKPMaPZKFvOL1KE/f47oSIep8sgKnxnJy4Yq3MhpAKZqn8JM6clHtiAzyn
	g4wewd36wYc705+qg43Co8eSR2SkJo8TxoOPprZ7tGofEQyDyCZQXbdWYAlaPCU873u8fUR2Fkb
	/4iQkP2GnXuLnmRESboYwC6eE+HrjuUQ2piecQMtyOAIPeBcgN+os9jJodQVQwnJsWgskas9EJh
	FA7BhgLVsf9wBO5jS6GKJrb4c2120NpppiwA4KSbcxPktJo=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr583318a91.17.1793331197821;
        Thu, 29 Oct 2026 20:33:17 -0700 (PDT)
Received: from kdev.. ([187.15.154.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm1970602a91.11.2026.10.29.20.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:33:17 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com,
	syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Subject: [PATCH] cred: mark the copy in prepare_creds() as a data race
Date: Fri, 30 Oct 2026 03:33:08 +0000
Message-ID: <20261030033308.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_creds() copies the old cred while other tasks may be changing
its refcount. Mark as data race.

Reported-by: syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee58b040032d8bed63d9
Reported-by: syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=557fdc985d6ac3831e14
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Compile tested with gcc and clang; the KCSAN instrumentation of
kernel/cred.o was checked before and after.
 kernel/cred.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index d01df40a9a386..d212db445c138 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -189,7 +189,7 @@ struct cred *prepare_creds(void)
 	kdebug("prepare_creds() alloc %p", new);
 
 	old = task->cred;
-	memcpy(new, old, sizeof(struct cred));
+	data_race(memcpy(new, old, sizeof(struct cred)));
 
 	new->non_rcu = 0;
 	atomic_long_set(&new->usage, 1);

base-commit: 881f19c2ffbc73f351b257e09c71e6059939b770
-- 
2.43.0


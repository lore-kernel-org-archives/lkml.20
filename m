Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634145;
	b=Wf+lluny5P++vTf/UtGK5oj11+X+VRfTFITd5KKb5b24cW7kBqyy4+yBp24AQtlZ+7pC
	 b/8UToComIvWAcgWW8/+q2kOidxT3n61z2mGuGBX0Kl9uinvv3O2rZc6FwszxnHvckxC+
	 r7uH4gTIiRhMo+CmYJQnG42eKW930lxbbExjr3COpPu+Vg5kpU2+f/giGOxhJliTtfUTH
	 mJkl1jEVAoKgeheeafnGBlneIQS2lNq7kuYKaLQmgIgeD5eKza54VLydWLppItAQ3tEzg
	 ZioT7O7JQcp9gIOk7D+hLUbQpSBVavtfecHM9ijI3+FvZKBs4SC4Sv8Rw4bElTPfLAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ve8LQXErwjekEnlC8HaEebRUb/hYJ6j4geIEUpqGkS8=;
	b=uN5qXUEUt8bFXypUWzRVOAgqjO1K+SwZUVUDmgWsD8iOaanmJvH7WupMtpoWpjEg9gzx
	 /7u1YtYwUyhRNcKD0rrUmCTolYg3Hnb5bfkIEbmKuNgIFD0uW2JRd4Dk62N6h31qDCFbX
	 HV10JeixDy8KbUUaw5CoAVcP44+cTyop7h27dcGugLOnLNKnWqrEe/YVfsKEUHLc86T6f
	 PmhK9DV6RMPtCYBLgQCchOAKsGbzBNIS2LupbHm9oJwsklT5+KTD5GBe1ogJqwsUCshVc
	 fY65P22F63zTTZeeU6uB8e7PxVNsaviHvK+zFFDCFwmVl77XpYsJxuGbYX1PPBpHpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Orn/JN7t";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0643C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0643C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Orn/JN7t
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso880397a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634144; x=1795238944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ve8LQXErwjekEnlC8HaEebRUb/hYJ6j4geIEUpqGkS8=;
        b=Orn/JN7t9fOucPl7ceF3yd0u3iQTyWwHzGp8O+tD42xrqqhk4cObgjFazLsmjELN5Y
         ClCJ3ySaZeW758xChrCK9jipAJIpoNncFYu1MlL6YU1skCWDKKKRFWDKvgB/6sLm+HLv
         thnevQF3HvvKv9r9AicS54L446SdRWiD3o3ifL85pG/cKBZeCnItidCpFOHE3/6qTLnx
         CVrV5NJYLFnyOx84bstkwcrQO2toRAUnHtquL1PsGJBVX7NOUmWRUFUH8UYBRQmslFBr
         AJO10oOglbHsrVld0nQS8k4aqqazwhUN7Pv2gncZcTO4vYpoWltPBi7R1j29zxEDHosR
         vjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634144; x=1795238944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ve8LQXErwjekEnlC8HaEebRUb/hYJ6j4geIEUpqGkS8=;
        b=ya9ddq/HPKTBrGh3WU4BzW6Sh0+pvYk+pmciHpwxXB50jpWWFc96gPguX8HlPd2Yiy
         MloMEzrwJCYzEAKFUpSqGA5AQgtgQUZ6rYSSyzQP3Hu4f4UZJtkJ3Royzy3zbufTxF44
         A8c+lZFw4xmiBjyPCnEnKE0PpZ8LLG+DS3QoFHKyWfaxV8bF1cjFMHtPUVhHFNtkqCAo
         qnIkZFZcUYTehoUDNCffSbPC3h775GBanh6kcNz9+vTK2eGhwws3q9nlqqPgDNtz7gSv
         dWQMwD0UFunjUeb/+FtNu/VLZJmmE45P6ubk/taxl46d+TJ9aml7ktUPh9YKPekkDEeF
         yB4A==
X-Forwarded-Encrypted: i=1; AL+hErE3oBgp8bm6z/UToHVlnKgij9STgnAN9+yN7dqqfDXpXkgKI2Olb1/J3ul6ats27Gmzb8voFFUXKFHcHOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fhI9MiW5axMWdlfY/M8Y1V80kVMcxbc7xmecjMVD4iCNOiJd+
	573tIO/bUgYrE3mVAPesZgqPTiyQEti+c8XrkxwYZ6scuwOcgdJFvMnP
X-Gm-Gg: AYBFou2eZbX9N4AN2dnC2PahlahAzQUYUnTpG59GdXxTBF08QZ/ppkPGUlGhdQhtye+
	fqYqnuQUf4+CZ66USPNTukNoHBKaskkf4viaTa9E9JGXdiSU9yta6x6YJ9sU1/4CX5PJNbSy/ml
	RP78QYob9XZ6oW+0bKv1xsesK0OQGgq5UUHmZcqIeWm0TCV/iozQF9VYorhWkX+h3rlKKpm9SMU
	k8+qw53pMeG/gQZ7oV3Xbxj+XiL5IiTVGNc/HOUQMxOkyVKGClqGEyS8Ha+Mlk2g25XlZ8UvT7e
	JhRJKvHuZtsw11UaEyyJBIOktT6Pn2so4zBOV1OEpaXWZ9IQtcjtByGtB0Vlh2HHdHifpqJDJ8/
	EOwYX4b7X1l+ja8ljJrK7RPAkdqvt2AaWZkOGKJQTtHoruUitvg8QukAlkGnP/cmgzUFCqSxBQ5
	O8bwlNNhppfNuku4OIm3okhfmJlHZX7HAgbtV3Q5bZoUhWG7GO9ofAfPseph/dheUQcxBEL4Spf
	mLrNjO26wSy1xnM42yXrOBe0HJMhZKHTNZqtpIAFWaeA+2N8xof+4Zko24zyY1x4e1vsNinl5C9
	eqqhrVL60xN9s+lPVMKRa62WILLqi7xr/rTLgIHuY3MoRNF4ZkE1oyvpOZeKQHA=
X-Received: by 2002:a17:90b:57c7:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b1b07fec19mr4789871a91.3.1794634144313;
        Fri, 13 Nov 2026 21:29:04 -0800 (PST)
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm7157339a91.17.2026.11.13.21.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:29:03 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com,
	syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Subject: [PATCH v2] cred: annotate data race on non_rcu when copying a cred
Date: Sat, 14 Nov 2026 05:29:00 +0000
Message-ID: <20261114052900.7-1-bbnpreetsingh@gmail.com>
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

prepare_creds() copies the current cred while another task can be in
get_cred() on it, clearing non_rcu. KCSAN reports:

  BUG: KCSAN: data-race in io_prep_async_work / prepare_creds

  write to 0xffff8881046cea68 of 4 bytes by task 3646 on cpu 1:
   get_cred_many include/linux/cred.h:222 [inline]
   get_cred include/linux/cred.h:238 [inline]
   io_prep_async_work+0x9b/0x3c0 io_uring/io_uring.c:367

  read to 0xffff8881046ce9c0 of 184 bytes by task 3645 on cpu 0:
   prepare_creds+0x71/0x550 kernel/cred.c:192

The race is harmless. non_rcu and usage are the only fields that change
on a published cred, and both are reset on the new cred right after the
copy.

Annotate the copy with data_race(). prepare_kernel_cred() makes the
same copy, so annotate it too and switch it to memcpy() to match.

Reported-by: syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee58b040032d8bed63d9
Reported-by: syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=557fdc985d6ac3831e14
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Drafted with Claude, an LLM coding assistant, from the syzbot reports.

 kernel/cred.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index d01df40a9a386..d9ab1cb4230a8 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -189,7 +189,12 @@ struct cred *prepare_creds(void)
 	kdebug("prepare_creds() alloc %p", new);
 
 	old = task->cred;
-	memcpy(new, old, sizeof(struct cred));
+	/*
+	 * Another task can be in get_cred() on the old cred, clearing
+	 * non_rcu. That and usage are the only fields that change on a
+	 * published cred, and both are set fresh below.
+	 */
+	data_race(memcpy(new, old, sizeof(struct cred)));
 
 	new->non_rcu = 0;
 	atomic_long_set(&new->usage, 1);
@@ -573,7 +578,8 @@ struct cred *prepare_kernel_cred(struct task_struct *daemon)
 
 	old = get_task_cred(daemon);
 
-	*new = *old;
+	/* Same race as in prepare_creds(). */
+	data_race(memcpy(new, old, sizeof(struct cred)));
 	new->non_rcu = 0;
 	atomic_long_set(&new->usage, 1);
 	get_uid(new->user);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)


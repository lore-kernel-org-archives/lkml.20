Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605402;
	b=1fxxUjR8RRcUxCrbmTwJSO5yF1K+29dEnyUmwz188RfEdUEqRzdrJ6XuYmZ50PEwVwva
	 bXdPmopibfPnx6S0GAT1gJvAU6vq+Xl3j8ht+b5XS2Ue+YRwjFqg3bI45/YtXRLf2LIUd
	 uEb4R08iBx57Bdckj2IncunFHkThbXxeDyaDOiLwDmXypAS2nFiN/3vcSAPODI6AFgVsC
	 /lU284GikJLlxjhG4plKx441PsIuiGkQq1WasvxMpy6ppRYGVMTiha246ruU2PAMwroT+
	 8ByvXaCW9ecF2v690ExXqkmgiKB4HhrnPpaxxdwJVE7WtqQ0qRTwfvjcl/ZxCI0WYUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ILZGqeePK3tN5s5Fa4xyHKs3r5hIM8Fdn/roa97zOY=;
	b=RdKAxL2mRykVk9rISFaD81xRQx6tij40jHmjyhgsXxUlXhA9e3Vu8HE7va14olxMwoT7
	 wagOYRafmHETo/pLAe0fJQIcLGeSN78LDrN8MEkh0E4MHJgjiOjSDnKtmlcUcMj+WrpHl
	 a1YLLhBDi+hy7Evb40gO1CFz5/Rch0oSDsEt1aggWA0Xzz/Tkul+NjwAuKTR/MJvzYynY
	 D1Xp+vsy9V25mUdZJ1O2hJUyVGmm1iUenPKDTpxj1ZP1VLHFJj2XX3URZcHVEY1k1sHN7
	 OG5qxEHAZNU+lIGe4OYUtLzystk9D0No4WxUwx/p4aqVCfa1nZCO3SW7vdF/8WBNjrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=XQ8MzsJf;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF13606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=XQ8MzsJf
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-17bc533fda3so1222089c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792605401; x=1793210201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ILZGqeePK3tN5s5Fa4xyHKs3r5hIM8Fdn/roa97zOY=;
        b=XQ8MzsJfm7hVLaVVmJxcZ6cCv2OpnZhEPS/ixp+1iyeH7bdd67uqG1H1T22iN81Vpj
         IqdFpLXy+hex8KLmaifYYxCctnfDmCSeb6G/AZ2ct0NJ7cUn6kLJdQhpKeFcQ0KzF1QO
         MaQCpyPrutkdj7djQwJeI99nmLRhJMs07Kkrf+Y/qy+Vl6TpSthXMSA1odxP9ZiiAWfJ
         jkVxSyB/XBfrqpb4OYXbXcDz52Ok2oaXNuR2p6KUICorES9mE3pSIOIZVbHrA+dpsHBI
         /8OuhiCIh+NdJvgh0zzCsMwPSjQK1TE+TJk+8qxNr4sz5wUBSb29H8lSMda6j9GbB8EB
         l/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605401; x=1793210201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ILZGqeePK3tN5s5Fa4xyHKs3r5hIM8Fdn/roa97zOY=;
        b=a+6+etfLoKNy0DNGLiHzS2rUoRBFY4BF9uNEuQ2EnYGmCcPFqiCcDGMd1zowg00XhT
         g2iTFF/cnzR6zKdwlmC45ZB7V+0ng5wdnA4cigueC/Qr5VUOqr9Dwwz00jLfT47rDxt6
         Jywwgzyb/ZNlZJ83VXxfyWS5czVNQZhDFZILdgRkA7sfcxWlQFPdkkMzfaPcJxZ96ww8
         a1SRI/xJYQMVzY9QSV6USw5Sr/yQbQ0ZVqCHCA8iMrWwkVxybCGJbgEQxIYgOr3wbI21
         t/aZ2DCPhtSCZwCdeuqv/A96R6/+Zt/CYvhgcwLvS2N59askJzF3YFJ5MXy6T+Y5YJiO
         dDmw==
X-Forwarded-Encrypted: i=1; AKwUvBxdsfRdSVlEttav4Q92IEYQyJu/Hqn6KpfLZsXr1PpLl6KeX3Tbl4+fjx4TQXfDszvkjCvLBiNo4Ez/5Qo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPbK99DtV4/9ESsFILGkjYNQCXxNZfX2MtDZuxLl+DENbsuU3H
	vVIKCQv5eLq09dXSK/59F57mICVjE5M/exUOpZJnCUiLP2w6FLoO1C7U5KW5cEbGqoE=
X-Gm-Gg: AYBFou1HLUBrhc1k15PpaZPKBIFnbe2d2RQZKmfUvCrlxkXkzaz1eQ4HCXQh1/GTRHc
	r3BK3UhLxolh+/dJtJ8syFYiMEURy4IPEXuhzM1+7pcPgfxkOT801U1MFORX9jHBQ6BmO8VSlkN
	Qb05sD++TLtGMX9vXMQZlFaodT59QLE2qZjgH/2B9ogHR0iHtN67DiZU5yZPoMAGauyWC0jsa65
	o0wv703ELvURYN3wU1vv7qBoVhm/244/NF7lrOPw9xMb1BLdOe7Kge/hw1Re5bgy9gMA0L7lyJA
	m0nUlGK3pJOV7H4f/Yu2TlLXwQWQMHZB3M2hIV70e36wwtFvZfMSRa6G+cWFT/nzv7iRZ4zepIz
	TgZrI8Sg5Kr4QnQM3XUHWGbVj6Ea/NKzO4kG7z8K4NJ5Jrc+RhYecuDucGjdavnVAZ1XOE4FfyH
	I81p9HigEPEqctdoGMHUonmutXIpJCygaHEzrrFNp0AMCrasnWZA5k+MazlFjLrIRLkuGLOVNR0
	C2IMlVSRukipljioiurvFbNz34UJlgs/2bKfRmbfqyHvdgiH1Wjx+uzBUtHnPAk3Xw8Tsk1JYXD
	pd8eZ8tsSeIs1I3zDe8mBf4zlbUfhDT+i4W0U7D8vJgGXlnPcboi
X-Received: by 2002:a05:7022:928:b0:151:6e80:baa9 with SMTP id a92af1059eb24-190a4ffadbbmr4178212c88.12.1792605401167;
        Wed, 21 Oct 2026 10:56:41 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm7736763c88.14.2026.10.21.10.56.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:56:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: alison.schofield@intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	djbw@kernel.org,
	icheng@nvidia.com,
	iweiny@kernel.org,
	jic23@kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ming.li@zohomail.com,
	vishal.l.verma@intel.com
Subject: [PATCH 6.6.y] cxl/mbox: Clamp mailbox output allocation to the payload size
Date: Wed, 21 Oct 2026 13:56:37 -0400
Message-ID: <20261021175637.1655-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
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

From: Richard Cheng <icheng@nvidia.com>

[ Upstream commit 8a13db9f899d149c3aab24abcb668121cfda5a4f ]

CXL_MEM_SEND_COMMAND bounds the user's in.size to the mailbox payload
size but leaves out.size unbounded, then cxl_mbox_cmd_ctor() calls
kvzalloc(out.size). A large out.size drives a huge allocation, above
INT_MAX it WARNs and taints, and with panic_on_warn=1 it panics.

The transport __cxl_pci_mbox_send_cmd() already clamps the response copy
to min(out.size, payload_size, device len), so the output buffer is
never written beyond payload_size. Clamp the allocation to payload_size
too, matching the RAW path.

Fixes: 583fa5e71cae ("cxl/mem: Add basic IOCTL interface")
Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
Reviewed-by: Koba Ko <kobak@nvidia.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
Link: https://patch.msgid.link/20260624144147.53997-1-icheng@nvidia.com
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Assisted-by: LLM
[ Backport to 6.6.y: Use the target mbox and mds objects for the upstream
  output-size clamp. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-93186 to 6.6.y.

The code changes match upstream with the target mailbox object names. See
the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 drivers/cxl/core/mbox.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 059e95e086205a497eb5f6c863a4bfc29c1c16c9..278a11657d8b7516533749bc8c1ce3eb933848cf 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -359,11 +359,7 @@ static int cxl_mbox_cmd_ctor(struct cxl_mbox_cmd *mbox,
 		}
 	}
 
-	/* Prepare to handle a full payload for variable sized output */
-	if (out_size == CXL_VARIABLE_PAYLOAD)
-		mbox->size_out = mds->payload_size;
-	else
-		mbox->size_out = out_size;
+	mbox->size_out = min_t(size_t, out_size, mds->payload_size);
 
 	if (mbox->size_out) {
 		mbox->payload_out = kvzalloc(mbox->size_out, GFP_KERNEL);

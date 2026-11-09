Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216549;
	b=zkU2+F3Egc3p4p6hOB7o+tuGqNGwcdj/WOFQPE8KwmetoBjiBDBZ5T/mDHsEwlQIdyd7
	 SVCIWNOsklwQv9ZMR9opB1AZHhzVa7Y46OYKp33ChVNxzz+zkoEpZJqCRRdtobYUEqGpW
	 4HM1VTkfVPwDZpyXrBMlVVou2QRXmGA+aq18QPolGkQBzFaWwA/5Uwtok1dQTxhXuNyAX
	 nwvbyqk4XupmLU7Sd+zgwLDrNdhFdiUqr6KxF0oyrdhgVovUbMUgHpTYRZb/Qm0n5/IcX
	 VCGDhLNBMlKE+837gZ6eV0cws1Q4U2R5bv1Fcyof6cSAoYjwg9FluCTfkrQRU+5ncEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MlPpXHGQmMTRzRR6JQE6PvYGk6NnpKFFc4r+AoGuyFM=;
	b=L8J4qcx03udekD3Rha/hfAKijEUxDpC9IbcsDfxaVGGahw6aiuVgFmKoW4bpb71rFewV
	 +82SiYF8iyO4AZ3sOa3VqolhUnRI1Ukxx8j7zmndjVjzJuhN/4D/0GpNxS3RpRkYZi09R
	 vH6Fl31TO78ahwCRPwQMXDV/83w7S1vIxv9FdDVxmZsoMw90pvu60pIUgQuQMxqHF+Nhx
	 p9d595EFmRrCeD/m0B/S6jiA1StgxfAltC6diDdLN7FDFCbakAPbZ/W75ygKHjWYhWPJq
	 G7Mh8GF8e81Jk8tkAJJQXUCpCqu3Kv0Rl61TqjvqHuBkO72MkbxYiWR/4WRWi8h2uNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeDMrrGP;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22BE60A5BDA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22BE60A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeDMrrGP
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06e79e152so272941b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216548; x=1794821348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlPpXHGQmMTRzRR6JQE6PvYGk6NnpKFFc4r+AoGuyFM=;
        b=VeDMrrGPFDw3Ukg5QkZBevZ7ryDTXO/KoaQ82CprffedrPD95w+liomfeUNXGv39YJ
         9kN7Hhc6Hf8N3Oiod/8nmzJYaV/5+Yf11Af/sPoWf8KYgri5UEBsnJYIJu555UFN8ary
         CbExgPkfvUymOFthnbocOVvddYtUO+O0kuDsAEItYBsXDfEeVIIRrdHxzvWXd0oeRVQT
         NHKCpB1U3Tf5aKrc0vropD+0vVgBo8KsAzUpqXIhAWn9ozX+40dvi5xp9CJ4+b5UcOj6
         OHhFzixk58HURo9bgAbQXfhCr4MrE01A3FnoHCKZlV6Sj2KoDT3Yz560DbdMA7kedj7C
         PHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216548; x=1794821348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlPpXHGQmMTRzRR6JQE6PvYGk6NnpKFFc4r+AoGuyFM=;
        b=fURFTIYTuNQvfhzPPxA03/QFkLhfqWZw04erLwSqEotHNWwoD4xPegjqEWlohy69K7
         Wp3/Lmdkv8L6hOZl40S0OmDyiAAkmPbXaxpz21SnfhE9MtZRf50Wxhm2fVj1t/BtlHFH
         sUp9gicYSJ6JQyKRfV2i/MhcEaCPd6WFqz7umMFAiWzOqywQGvqEBIWhw+ClHTSp/Afq
         OQYg+lUp6tGMq+grClLpJee5avbuDLNWjPAYlJGHG0UuGUFYd3H9oNOsr8N5dxa6Wks9
         A+om5CSiWlje4Et0V+cy4imONvUy2V77QqxsKBqwQarPi0Cxyx2grYfOi+NWhXvr3WFQ
         AIBg==
X-Forwarded-Encrypted: i=1; AL+hErFsGM5/dRT0xj9k3awBdXprEG8DcZsmj4goSJjCJMq71s4Hyf1AP0Wl2S7B9KWkGTNSZoSBkkK7piwGKX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WpF+2N7vbkZzGwwQt0V9lGdc6Y0i2dUAkm5zRfIl642o8kRdR
	la/YeJOXTbb9ZtmwsS0IzO2A53LAOZQu9DwTyipZxj301xlgc0w/AzzA
X-Gm-Gg: AYBFou1LdSNpXxtikKI+q9dEwe+AmT5C85vT+ZGjwXmGMr3QxEKDQHRmId1HMVpzBsp
	YTVVxga0m3xOKlnBdzXSacvTfa8CMVHFJg12IVk/jC1p86PDayGQmAJZv4aiku+/uRCO8mcTn47
	TLztBvG72NzL9zrEzhNtmqjDDGdAyPZmK/L0PtitVo/l6mt2R1EVJzJ23iuQZEy5CTDf41Q2s41
	SjPEfc1YFaQGGvnroTmYn7lqs/2oP3R2wqFm00VV6P2TVreA+uUjEYsXvpmUFMELtmsvO/sWpis
	xmep9ZOQamVqwrm1MCMJslmDwfdD4PunE8Ldb0+x9QQ7/DZQDof9TyWpTPCy7UoaX2+iww9Z6jc
	in+uZAkqFEfC0UWG5+euDnT6RiQw2KosXxqyMTAwYMt8w0CiTy3i1J+gc53ybuaoXdMKWnKhfii
	Jufcd3fGcvVAtB5u8grDU3+uYxe1KrZ/EFGyTNarmxH4ujWsuX8ulBQBq1IIeqOZfLTf3nJOyFf
	EPlRBA87UWKJtavBwNB2fUjXtrhIOH3291blrHST+Pf5oz+yqZWmQGubR6ESmfYFJtM8xV8KIk0
	wA6dmThd7GBGOUMO/jo0FO4kbyVvRYlsqJLO+3vywL68Eary8qgsfGZ1K5cFvHI=
X-Received: by 2002:a05:6a00:13a1:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8b6717aef6dmr2691634b3a.41.1794216548030;
        Mon, 09 Nov 2026 01:29:08 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e55e85sm1103778b3a.17.2026.11.09.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:29:07 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH 1/1] scsi: target: Skip zero-length protection SG allocation
Date: Mon,  9 Nov 2026 17:27:36 +0800
Message-ID: <20261109092744.822646-2-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109092744.822646-1-pkfxxxing@gmail.com>
References: <20261109092744.822646-1-pkfxxxing@gmail.com>
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

A READ(10) command with its TRANSFER LENGTH field set to zero, sent to a
LUN with protection information enabled, can select TARGET_PROT_DIN_STRIP
while leaving cmd->prot_length at zero. transport_generic_new_cmd() then
passes that zero length to target_alloc_sgl(). This reaches
sg_init_table() with no entries, so sg_init_marker() accesses an invalid
last entry and causes a target-side Oops, which can also lead to
use-after-free during subsequent iSCSI connection cleanup. A logged-in
iSCSI initiator can trigger this on a FILEIO LUN with protection
information enabled.

Require a nonzero protection length before allocating its SG list,
allowing commands with no protection payload to proceed without an
empty allocation.

These issues were discovered and fixed by Qihoo 360's Tulongfeng
multi-agent system.

Fixes: 5835812f13e5 ("target: ensure se_cmd->t_prot_sg is allocated when required")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---
 drivers/target/target_core_transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 927861c30..4cda1e610 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -2841,7 +2841,7 @@ transport_generic_new_cmd(struct se_cmd *cmd)
 	int ret = 0;
 	bool zero_flag = !(cmd->se_cmd_flags & SCF_SCSI_DATA_CDB);
 
-	if (cmd->prot_op != TARGET_PROT_NORMAL &&
+	if (cmd->prot_length && cmd->prot_op != TARGET_PROT_NORMAL &&
 	    !(cmd->se_cmd_flags & SCF_PASSTHROUGH_PROT_SG_TO_MEM_NOALLOC)) {
 		ret = target_alloc_sgl(&cmd->t_prot_sg, &cmd->t_prot_nents,
 				       cmd->prot_length, true, false);

base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1

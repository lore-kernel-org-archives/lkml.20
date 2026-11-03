Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696778;
	b=xsSrShOefbLQAczUVKZUK7nKndlQD/YJ8tuspNvmm3w02xOZtpPnSAcuxlztVuyE7ZUA
	 Rzt5GKrlaCOp1NO0T847CfDPaXaFs/m2pFehRZV6EkTghT/lvqfvwkVbnklHS7/6SJJqT
	 /ohiiqvdmp72msKy9PlnXCRy3rSy6Yw/CPhDkeRlMtDFIP9q50uqYrqz3IMeieQkDq5Ld
	 7KVJ4Ve1qHaIID2GwcoXJq5jLzPPms7iqvAl5F3WnWq4aHUJ4s5UnGLmOBWNJmR5LuEEU
	 YxfHTxGvf0HpaIvp/sbcX2cJ6XRIqxNUtQ2rRPKn8owpFOpaf4RzF4AP1CBsT2H2OAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9lFCXTcwJ2/S1f+iB/HTt5pPGXsXRaFio0hPDI73Su0=;
	b=p8BVj5NBMXkrphlsGOW1/W20ILRzTMLVLqmw57Umac9WzXpd9+H+u/FtBYX5Cd6JZkAb
	 TdNUHBRPl8h5YgNX41Q04U0FDRNEmj/osHXp143icXAWA/JbVAzqcbmYTli+yFmYCCFRP
	 88mmUch9NQvabA+e0h+vd5yQnG1I8rXgGqC8M47C3z850QPjOVEmpZoyix9OfStBMEjrQ
	 H2RbW3ja+bAWWTpSYQkBeJqZnIGz2r1GuCdI8OsEogswt4xZCBndARzMkK2rmx0y6GPvx
	 oZqzCMX6+5wK8ziv0KR/vJatrPtLeNBonhSicd28SpwslkBCcHQipB9SHvShtmWFgdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSN9pJgV;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9388606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9388606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSN9pJgV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1da913so338346f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696776; x=1794301576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lFCXTcwJ2/S1f+iB/HTt5pPGXsXRaFio0hPDI73Su0=;
        b=mSN9pJgVR60xMtPLiJN7dAqf2qUbHNy/y4SFY1hRRnjvtgSqpW6KoR5azB8qwcNxeu
         7VVwZSNy6umTbk9EHuDkPKmUVLEJ629GD46Qeq/YgcTfZJdqxb8p/cQWICMx/5EtW/Tx
         GQN/QcLvWRs8TE50UDjVLo22mibvoLitUMXj75ljABnZ7K0mUa+BGhCOqxvUvh1TJah8
         D6uuihXGnxBa6nTxkZVEcmHFpJhWRtGmX9jAZLQzp9SIX5L5INM4v5xzl3alpU/pmlfI
         qaSMV0bkUq8UdeS5JHT2GBqGMskPGGLtJRZ42dO8nBVYJ5Yc5KWy4ru9unYiWkc83izk
         lk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696776; x=1794301576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lFCXTcwJ2/S1f+iB/HTt5pPGXsXRaFio0hPDI73Su0=;
        b=KSE3Cnmr4wlr6shjfXXXOlHbHRqhCc17sCSU0U+7KN/caRpLKJquRXYA2Nq2YTVE8r
         S1t+U/Gda/yyCqafjBz0NCgly9Ka2QgAfyhMgo7ZMSFkEB24/+ZG+11zZ63AXn2QN1fS
         aHSQ3D2ogy83aM3a8WSzZA3SMc/5tvZ0KqGBGSTOmCusV7OjYF+bKYg5a9GCwTsgHqdB
         Nf0pY0GtjaVnGT0lOK/ubfzD+8FR0Av3z2vwBrIYrb6Fz4Npz2b8Zs2/rTGk1aG0A6dV
         ARUdI9CD3764dWbgECSU96GI5BDr3PKl0AlRZxiMhs8ROYVJLNq99/2AfXT4cnVcPVGS
         5k5Q==
X-Forwarded-Encrypted: i=1; AKwUvByAptHl1e0Q/j59s4uR6XBeTLvT19oxyzV+Hskm4Qgg+D3dDjX7bgCqqCI9vKSM14Vx0QD1ikcUyzINahQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gNQjYZoLwFYIx1LbDfTMEtMOwGW82q9HgSTr1q1sJkawiJk2O
	d1YDC5dQopAVrC1qJllhhPUswtQuyfGo2nCMcpJoYtdgjGls9KqbFvIW
X-Gm-Gg: AYBFou1w15WaMv/InEeRXbp+qDuJ7CHhffKeJLMu9mLI/xQUBfJ8v6kDqEMjxnPXEiz
	0IeEVLZ6htIQUYSN0c42FSMktCAecefpYTHmamJJB7ahDaBrsAwsdSRVSvirMQ2M4v6BTxYgmCM
	mwsy7rnwJzlU6xbXMlIod46Ji95Fre5yUHB6Q38BZtO8jTTDsH1ptOODN7C9F9L/WCqs0CdJnRZ
	ltUsJFi3PVxb82ghVubtqbCSgLCQGdd8ZdF37OmK06+hYlsQXhZS2xlFr0FFcBaeQ3GphYqNljb
	WFBJfX+xOlyi6S9xkEko3dD83NKRCY8Qy0fNcM+ViJ+87mvgZ5IjzOCjNWcDndO8wayxUNDBn5p
	HUahZcehEoXn8oCYCL3QEkoL8jbSdXFTbrf41OlHSZwiRLWQ0BkHpFMcge/Ktif7Iea+1AZh26U
	Iu9XD36qx3XWf69E2fNGiid/pI3vLu4iRGy2seeGMRNkIaUPHPu5Fo2vNNnTPevFmj9zUce6xUW
	1/a+FrcqxHYnmWePrhGGcEJ+WkFFtdnjyKMp1r5igI4+tDWnc/b2GHpnkD98xt9AZfeKkWjiXbt
	f9Re21prgMtYX58rEqn+GOVNXSE=
X-Received: by 2002:a5d:5e81:0:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-48e64cccf13mr38780322f8f.22.1793696775893;
        Tue, 03 Nov 2026 01:06:15 -0800 (PST)
Received: from thinkpad ([2a06:c701:4745:6c00:243c:3b07:905:b6b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm23837723f8f.49.2026.11.03.01.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:06:15 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: jstultz@google.com,
	tglx@kernel.org
Cc: sboyd@kernel.org,
	mlichvar@redhat.com,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] timekeeping: Refresh auxiliary base before offset validation
Date: Tue,  3 Nov 2026 11:06:05 +0200
Message-ID: <20261103090605.1292660-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

timekeeping_forward_now() can advance an auxiliary timekeeper across a
second boundary without refreshing tkr_mono.base. The negative-time
check in __timekeeping_inject_offset() then uses the stale base and
rejects valid ADJ_SETOFFSET adjustments with -EINVAL.

Refresh the derived timekeeper data before calculating the current
auxiliary time, as aux_clock_set() already does.

On 7.4-rc1, a valid negative adjustment fails at the first second
rollover. The patched kernel accepts all 12 tested rollover adjustments
and continues to reject invalid negative offsets.

Fixes: 2c8aea59c206 ("timekeeping: Add auxiliary clock support to __timekeeping_inject_offset()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/timekeeping.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..6d55cecf86ee 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1775,6 +1775,7 @@ static int __timekeeping_inject_offset(struct tk_data *tkd, const struct timespe
 		struct tk_read_base *tkr_mono = &tks->tkr_mono;
 		ktime_t now, offs;
 
+		tk_update_ktime_data(tks);
 		/* Get the current time */
 		now = ktime_add_ns(tkr_mono->base, timekeeping_get_ns(tkr_mono));
 		/* Add the relative offset change */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


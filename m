Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575842;
	b=TSF7CdSw46tSpOJ472H2PqH0yFheKXbwrYkQq6nCK0tqjICVFUAvWkhzjXlhdWBJ61xr
	 /eQCemTa6FAMaNaee8U7uynDMf7ZV2MHBJOkHnfubScfFZLixxuH6GEsNEok7QAM6hPuX
	 vO+eWFHm/Iu7CtR1vdv5wTcXoUxwyzS/ac+H8Do9xGhp0JRZR4ngaqNyghzVYr90f9oea
	 uqgJSw0yrnLzStn/ShDI5TucxdPI1gKkS91MLge9LdhL5qz/Gl1HbS8jnXUDqxamZMbf3
	 1pGktz/69OHVzBofYTodUMbBDR1A1A4z4iAVa9yVK2lwPQfQKBVLCIXAQtb2x0jS6pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1mDee8fRVwNUSS62hfCgOdMly0KHJWoEHw3uq1wP+dM=;
	b=WFpoR4zuKmRFxepvYLxD4+ZIFWG68p8LVGGEMLNh6U2TH/hcjK6SmMaBupednNhLo3m8
	 ueaXPVWF/PFidq5A385svkiNMvZoP10V4UPg/qAvRj25Wj/nF785vWEOmAF31zC0eooz+
	 EoMbIEStF6v2Ihb2m7JMvIjiqIoF3Iocx+ZzqO2kcpMHRz8/HIxrQTnLikknzWUhvcB17
	 72xiLsSrqysaO/WvTAkiQWOxPkss/We75FuOyyV1x9uQD62K1DRaVWr7a7N41lobgVZEp
	 U+QpIljQPkL3FrKgPPiuUO/HQYwJ8v8dCaoRVfCD5PbyDz0mk9yGIOMgg/YxpingqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Src1xL7d;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE183606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE183606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Src1xL7d
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso335777a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575841; x=1793180641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mDee8fRVwNUSS62hfCgOdMly0KHJWoEHw3uq1wP+dM=;
        b=Src1xL7dJtcD+mW+4kphC0vx+JMq83KXMH7usEwmz9UqBfkDiDbWNHsEfnycXz6ud9
         7VivyaxWw+ti00pkjfGK1MlvcmRnSq5gh2DOZe1/MkXLfzQ9CwFQo4aQ2ySO4JfEQmgg
         0kKaPeUdtyv+tdFE3MQcZveKQZQbg1Rm0a0jfYnlKuRomlWGdsohhjfVVyUNem/FuDZQ
         UOQ7jOtGhCzQwc65ruy2qqcKfbCFMfIvZf/jvwcPlUURw9h0goYmGrC4AXueXh1ipwzs
         YlYj1nXfSkGmLs83iusDHVYQG6yPl3bWUdwQLSAOWrFOjvo3JzVOZqQsBPeWon4Lgbxu
         S/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575841; x=1793180641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mDee8fRVwNUSS62hfCgOdMly0KHJWoEHw3uq1wP+dM=;
        b=TS80A+w1D1oR4bnJ5BXR3RpFtgZBQqEQqV6Yd2S4vDD65LeHL53crn3cOzNPmMLNZe
         CmF6t+Gm0VumPkfRWnBCHY01iWWboTw4UwmlPyAidtHso/u7N7vXtjOEzzZS6pB+KFT6
         KFcPBWVofHPKl21ESAD3p/eIXxbMYZ2Q9R3hWqM54A8YgaabCMXeSyuuPWfnodlNTj8P
         vMGXjZZqFMsR+O4FjwOZ/FhH114jT3YyDX9EreISfYdx60SHMQsPVtxN8PtDvp353Pe3
         Y+OTTLgSID7dKnHnI5O58t8pxA6CdHoNcvZRghn9sthSm5pBCFqLq6iR9F5GE6dOFDpN
         4Lqw==
X-Forwarded-Encrypted: i=1; AKwUvBxlhPTw3xY//HLU+y8E9IJowiAxlx2wwFRbyD0ysR+OUMAeFNgduk5caKR/kWpGqOLvuEC0DatDtOC7Ha4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+Egr5gA76rdkZPjSpcaFiVJXHaO714ArGVvxrmiHoROE4QFUN
	XTQ8XrFFwfKD9HP6zV11Dt8PqQvNzLRF4/9k4QlJqSpIbEO83dyqW6et
X-Gm-Gg: AYBFou0spO/nLuaqIJmBfpYrNVCWDWLx2VCqMH/NSlV29saJixIbNEErCBqIPNiCtAX
	1kK5PKFMiVGJHL43IilTbcoGRFlfLYLBbA3J2xNYFNb+rOAyLN6P0CP3fHZuYg1h0tZBwY4vuPT
	ZSHxE23D0T9ZZiidzfzz5/X2M4lf/SXV/h/GXJbfF3kqOJGGhmVG/t+j0EechXWs5lctrrZ9kIY
	BQTP7bP5sHDtMmmgf6wYM43228nrX6CPzld0vzAhYcHkqI6bE/AyDyfbx7wDmG8Jj/xa5sLhKML
	1MY6lSqVcubOeFkIfh/kXNWF7G1baIBlOHFxYM3ZzC3gEnJu8OeCNAqgmC9V2G4tTOgbT2d+O84
	wKbWmQyA501XxBQPc070e6HUuNYbirFRmfMtLY6tO/RedxABXPMICe5WXrwDtwWf+Tg0jOOybIU
	aMCGpp7zXzlZuPCB7K6dACgj7X5XX24RwJaYVrmn9w9P7ZwEUfle2vpJOyoTr4kEZSrZfvIf5zB
	+ON93e02HJfXivDqqoHsr6mWMD7b8euadtcQTPsIbCEGCfEwu5oUgI=
X-Received: by 2002:a17:90a:c887:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3ad86e980d9mr1157973a91.10.1792575841069;
        Wed, 21 Oct 2026 02:44:01 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021d29bsm3644438a91.4.2026.10.21.02.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:44:00 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>
Cc: James Bottomley <James.Bottomley@suse.de>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] scsi: target: validate REGISTER AND MOVE TransportID length
Date: Wed, 21 Oct 2026 17:43:34 +0800
Message-Id: <20261021094334.198599-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
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

REGISTER AND MOVE has a 24-byte parameter-list header followed by a
TransportID.  A 24-byte parameter list with a zero TransportID length
passes the existing tid_len + 24 check, then the handler reads buf[24]
for the TransportID protocol identifier, one byte past the received
parameter list.

A TransportID is at least 24 bytes.  Reject shorter TransportIDs and
compare the declared length with the bytes following the header before
reading buf[24].

A malformed PR OUT sent through vhost-scsi triggered this read on a
KASAN kernel.  The command is now rejected with INVALID PARAMETER LIST
before buf[24] is accessed.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_pr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
index 25b1bcacc0c8..ca1a2802aa22 100644
--- a/drivers/target/target_core_pr.c
+++ b/drivers/target/target_core_pr.c
@@ -3226,10 +3226,11 @@ core_scsi3_emulate_pro_register_and_move(struct se_cmd *cmd, u64 res_key,
 	transport_kunmap_data_sg(cmd);
 	buf = NULL;
 
-	if ((tid_len + 24) != cmd->data_length) {
-		pr_err("SPC-3 PR: Illegal tid_len: %u + 24 byte header"
-			" does not equal CDB data_length: %u\n", tid_len,
-			cmd->data_length);
+	/* TransportID is at least 24 bytes. buf[24] is its first byte. */
+	if (tid_len < 24 ||
+	    tid_len != cmd->data_length - 24) {
+		pr_err("SPC-3 PR: Illegal tid_len: %u for data_length: %u\n",
+		       tid_len, cmd->data_length);
 		ret = TCM_INVALID_PARAMETER_LIST;
 		goto out_put_pr_reg;
 	}

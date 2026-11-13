Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587147;
	b=Bw0gN64oj7GUHh11JYdb5e9PqRvLE7R1AeNVIS5PWWkuNtCDIfpC2Pazh1AJgcVtAGNi
	 Xnz3TkXZ8fne/mdypR009/JRUFC4LNhdDLZ0njHjKTzT2Y3l3IuRYsLQT3fF3F/ikodN9
	 Rw/+Wru1ChL0FLY/DF1tnaIK6fpBTz5eXFrbORMnMeue9niNxrmNYRjDANfRm2S9WiBap
	 6PjT3T3Yecz3PgMNL7rnwNvOi7tMlNBcqYPnhpexrCRZf564PVJCXRHP/yokdufqI2kP8
	 /oaz4xQLRtkyl3X9bZYnQ0hpkhVcVwqryEIY67A7a1iprN0JbmQXcybZqOIal43hhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UBaROJez7pNp/JJU9doXAN32l9sh+oAK5l3zeHDvhjo=;
	b=NTwB4n+sx0lH142E2jOGDGJCrufrhtoHcy0LC+O/LXEgyKiQKLQLiggASun/ogSv9D/G
	 NRss7YfZhx3jr7xe4/wiBRX83K52by+OnJKyibwWzHbGBVsPs2wCxH3k/7HGtHRLX8JfL
	 r6bc3cfhgcuyPWJhfgt508ZeUsxoJxp+QCC7bj5u/o27MKkiKbBAKCTPzArj0Uwttq3U7
	 15t2xXKZ5qkThHCKXVbBDCS15hIEg+IBUfSEyledJUW2MV84CoM/bc6hGWglruhbCVzL9
	 T6J010cuNWbK86UbT1yKwd3iyCjqzr7R2rubkq4PrrauAe7EQIAyKTX9ltzDKQMyQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4a2hNq7;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADAB606A8A7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADAB606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4a2hNq7
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-886e61fa30fso529005b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587146; x=1795191946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBaROJez7pNp/JJU9doXAN32l9sh+oAK5l3zeHDvhjo=;
        b=u4a2hNq7+gVeqxfL+84E6F7KwiRUyPoR91hiBdY2qM8DxWAyg3tET1mMhmqOSKtc9+
         mzt8JZRDlfvhnGapQY2Iz047j5NjageUO8JbpcqES5vz8F/tsrTvC6cPB8RiaI0iAhd5
         RIjJz9X61Hw9YEioLHCthFU6g8aoX+Nw67AiVFxfCHaxQ6DOx7G2aoRUET1pd/zBXIs5
         e1r8tPMiinH18TFy7ylEKhNVAIsBazBhx4W4CI+lfBayz2iPtk2FsJkt4wqBPdZT4tBU
         RuHvnQKOoXqqQNUiKoYzpQLk596pZuD7ohVMij0ZwbZVwteLpsJzbH4M7lwcFVPBUfTo
         0JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587146; x=1795191946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBaROJez7pNp/JJU9doXAN32l9sh+oAK5l3zeHDvhjo=;
        b=K298EZ5XCfOypeDVQEspRFaP7G0ytgZJ1wxJ9ZYlOh53eaNDEcxLZnZBi0jok3isq+
         m1tlTXBDEexG7swt8FSETSc4Cy7zcn1Almef4VhowivXOT/0ulPoEZv2oCbfF6qzqjMq
         QBdGbXLZJF/sLjOph0Nb103OFRfTIfaDeQhfvU6HU0aoG5KG6MbiVucOZRgzWxJBYec5
         6cIn9lhuWxnViOUzSYusNAHWBHS/OUyOqemYYf0U8/HLnH7CDTxfmwc6dsiqIOEyGWP8
         lyuiFj46lBHG0T7xKVqwgy0vumkzkmGCQTYGPNDsv2F60lQ+ml6ZcWL1vRbDjSWknKyW
         jRzA==
X-Forwarded-Encrypted: i=1; AL+hErE0+tXvIkoriOjz+3wWKt4hXOFJmkGqbw8uY8lW8E9zidUm+h9fGq6wpAWYP0vhCfDHk3XnL/CW+rgsag8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQsqBsLDePU5BmNbV5KaIfhUGt1lRbGdCdwHQVDRKZk5/aoh+
	YE4TahyLVIYTYe1GyZUB2w/5f1NAqtWKuqCDpnIuPEekpLkMZ9upOk0W
X-Gm-Gg: AYBFou0JEWTqJdKm5+Ews/d+YEk3K7TJSM4Cu1MJod9nebUUfElURQzg8gGM6zQNlfs
	gnD/ueWp2zVgYBZNhDkwI8TUzofn2ohRXc9R9capO/Wxsr6tUtcgE6NG5m/wD2dbYGuvG+U0pQE
	8lwe/A1Pe7JIA220ysF5eY8/heYL/BdHEgbk6F7tQP/rgw4yuWSHenESMu5j77fbS9BMfd9Lsw3
	WevbvOhFEhFncDNh7fqSqCiiScY30xyG9X72eznuk6Xux0eeCEDQKhokcB7abUTt65W8xMtcvPy
	V+NvL/XLr0N5JaBeMQmFtzEceEqqSpwm09vZBQ8+O3DBEFo3C730W+o51Y3FPJNNG8Hw/ukNdUg
	8w60AxJTbopVdB9olPsJL/N+5UOoAPZLfeoTKpn8lqo6Hs9ttecMqn9lkfDreuhIJm/ogfY4f10
	iDdP2XOTvuJ9rsxtceibMDnI+HtYlI+ygZp83U80I81YDjROIZGFBcaRCw75H72ay1GWYiftuXg
	S4WZy/NUKMdmHDIxmszQ6cF03orSaruIK5C8gHj5RIa11LVzshz0Ft2GIQy0gSayUSzcKJoMZBy
	T83E6myCcBBwKII/ro4=
X-Received: by 2002:a05:6a00:3985:b0:87d:cc3d:fad4 with SMTP id d2e1a72fcca58-8beb753d183mr2710685b3a.54.1794587146024;
        Fri, 13 Nov 2026 08:25:46 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243c34dsm1376800b3a.41.2026.11.13.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:25:45 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: kashyap.desai@broadcom.com,
	sumit.saxena@broadcom.com,
	shivasharan.srikanteshwara@broadcom.com,
	chandrakanth.patil@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: megaraidlinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] scsi: megaraid_sas: Fix NULL pointer dereference in megasas_complete_cmd()
Date: Sat, 14 Nov 2026 00:25:24 +0800
Message-ID: <20261113162524.162899-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
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

MFI_CMD_LD_READ and MFI_CMD_LD_WRITE commands can be submitted through the
management ioctl interface, where cmd->sync_cmd is set and cmd->scmd is
NULL.

However, these commands bypass the sync_cmd check in megasas_complete_cmd()
due to their placement after the fallthrough statement. As a result, the
completion handler may dereference cmd->scmd, leading to a NULL pointer
dereference.

Move the MFI_CMD_LD_READ and MFI_CMD_LD_WRITE case labels before the
sync_cmd check so that synchronous commands are handled by
megasas_complete_int_cmd().

Fixes: c4a3e0a529ab ("[SCSI] MegaRAID SAS RAID: new driver")
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/scsi/megaraid/megaraid_sas_base.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 602173fd313a..5e1aeec96a4d 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -3635,6 +3635,8 @@ megasas_complete_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd,
 		break;
 	case MFI_CMD_PD_SCSI_IO:
 	case MFI_CMD_LD_SCSI_IO:
+	case MFI_CMD_LD_READ:
+	case MFI_CMD_LD_WRITE:
 
 		/*
 		 * MFI_CMD_PD_SCSI_IO and MFI_CMD_LD_SCSI_IO could have been
@@ -3646,10 +3648,6 @@ megasas_complete_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd,
 			megasas_complete_int_cmd(instance, cmd);
 			break;
 		}
-		fallthrough;
-
-	case MFI_CMD_LD_READ:
-	case MFI_CMD_LD_WRITE:
 
 		if (alt_status) {
 			cmd->scmd->result = alt_status << 16;
-- 
2.43.0


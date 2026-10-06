Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1533D9525
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279278; cv=none; b=dhByxzpefgHEn2tdV9L7MDM6ktL988CfU9Saj17IvVoL0F0MFmgU0pEyppEBHoNK01ZbNA1PwnHcRYfE5/xk0ICMk5xsoNzMLFleWB//tU3xRjoRVuTD1Gfk7xIx2q1Uq5VYjnemjRj/WQZHZivW5103ZoD4IXAVlET12Sp51S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279278; c=relaxed/simple;
	bh=47mvSsNpNg+ZUpTtA1w32TuEcUfLQ7Pkxvdyz5/ll2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q0jCFCqdB/1TrXFIzseQCg0CWHVif2QExrxks5nQINhVykZXDkR8Eoq2y3NMKSutBWCAxWuceeIvaMzdYE3+ra3gFL9tYNt/qZJnhZV7qQd7x55OyxYq7XSEMPXtMvmvA6K3v81iW5tmM76AhsVlh4lhqWbYTYIqMqJYauzruwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNjbQM3B; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNjbQM3B"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso892589a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279272; x=1791884072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qY0yv79M9ElE8fm/ELF5xq7iGxut3qQ2nfq4dYz2/7I=;
        b=nNjbQM3Bi3UXY1uqcUNZFy6k4XyHXltvZZzwPBDIP/D6Zp2GnwPZTELphKDLyYij1v
         GfxqZtOO0W9meXWURWr4QBtk+XkmloaMwm7gGI2saDeQUOjDZkW4z8nieb42ldxn+fBp
         ViaFASdCZTqEYFDpBb7PmlquyN9xVDOstAg28WGv/DbXmliS0E67ZB2/B+1/xf3S/Ox7
         jfMQpAT1k7Xzm+1iqp0AIjqhW0b9+IAR1pWp7xylU3yw1YC2Jm5W8/7+E2Esrxsgf54k
         ySdUcS0XgKV2jxlIAUds8Da/Y5BuVobCvIBjZEWBGxWvnnd79yWDeMM3JQvqa9e/1ra5
         ZS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279272; x=1791884072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY0yv79M9ElE8fm/ELF5xq7iGxut3qQ2nfq4dYz2/7I=;
        b=oXFhcBK4v+ElJeXJjnbKLBPFu3otXgRiIAVktHh9c42Wu6Azcyg0YTF3yHjaa61IPV
         RVRnb36krlbE9LF2elaTl7OoOPW8ca6d4K1LKjc35bhVcagu67X1mptHHk5WuWO94oKB
         zWmDrFE2MJyZszRvgLhHuTxbhk9oD7kbTo4zeMPmY5DivcrxQR1tJgN9MapFSkkiBx+H
         XSWmzBNiL1xdiPjCOZJaIxb7PrA/bO8IMxwB/VNAgJoAKWa/dzfCHwO4gq0PrbBv1Jun
         ALjRYZvbpwaOxp484I52fISQtPKb1QpUnYdoO9AskdXWwGV9X8GAMHXmqZ74TeTtqp0G
         Knag==
X-Forwarded-Encrypted: i=1; AKwUvByw1/84z96VJcYsboRs+dJyUEMK6oYIwfIlQwcoh8MuDTUThq7DEv18m2EpsTQrhaR2L2f9O2QfHcThvuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7fO8rb5tDiUugKqStaLkK+Zi0m7Z1SdmWVm4/d+aoIEPYpO33
	Sd4Zg2jlhUyv2UNxFE+a5udrm2RByvpEFdet1DXR0wXlYr7bZFQ0D7P5
X-Gm-Gg: AYBFou2soTISmgv2TJSjTHvrFZIM6i9Vf7U5vfF8ACvu8X2QvTzyiUHAryfS4Rgco3v
	ij37N5SDIqIuvFwDg3VgiR6tdq+znuYj/3b8y0qexfA7UzY3m9EMwlAqxv69Euv3YipJrk8iICI
	8X8Xk73TbmnFgQESELSNo1VWOx3ztGOu2TOJOkh7pdAio0X5bu69m+KfMz30haJ2GaohkZaFJ/I
	wCblqa9sircW50kGGk3Q2dhqMcMYXLrWnyT2o83IXTRtG+KB0t7+yn72umIWoKDIEJayhE1h5V+
	B1i/RxO5qItTPK5Gd5r8VG2Su7rhYc+oqJfUsf56IDFU76JeHLNEvneI2LjQIsNvN+84XXq0myO
	Te5TGsHKHYNo2HB8wIIv7Eh98ihPEFtXzMBm144Te5ltkn1/Qu71PYRDjWsJOfg+PNxuLrhIqi2
	t3IVAxbSZ+OMCIDsrwYgYmPbM6dqp8U5E7buGwodNOtoMI3LxRtMu3pcEg1V8iXY9ykuZ71w==
X-Received: by 2002:a17:90b:4a0d:b0:39e:6ec6:f4d0 with SMTP id 98e67ed59e1d1-3a87267ea3cmr712031a91.8.1791279272186;
        Tue, 06 Oct 2026 02:34:32 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:31 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>
Cc: Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	James Bottomley <James.Bottomley@suse.de>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH 3/8] scsi: target: reject a short SET TARGET PORT GROUPS list
Date: Tue,  6 Oct 2026 17:33:33 +0800
Message-Id: <20261006093338.27342-4-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006093338.27342-1-physicalmtea@gmail.com>
References: <20261006093338.27342-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

target_emulate_set_target_port_groups() accepts any parameter list of
4 bytes or more. The walk then reads a 4-byte descriptor whenever any
byte remains. A 5-byte list reads ptr[0] and get_unaligned_be16(ptr + 2),
which is buf[6] and buf[7].

Explicit ALUA is enabled on a new target port group. Access state 0 is
Active/Optimized, so that read is reached. vhost-scsi keeps one sg
inside a page. Five bytes at page offset 4091 end on the page boundary,
and the port-group id is the next physical page.

A legal list is a 4-byte header plus 4-byte descriptors. Reject a
length that is not a multiple of 4 before any port-group state changes.

KASAN reports:

  BUG: KASAN: use-after-free in target_emulate_set_target_port_groups+0x1dc/0x540 [target_core_mod]
  Read of size 2

  target_emulate_set_target_port_groups
  __target_execute_cmd
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd
  __target_submit
  target_queued_submit_work
  process_one_work
  worker_thread
  kthread
  ret_from_fork
  ret_from_fork_asm

Fixes: 0d7f1299ca55 ("target: report too-small parameter lists everywhere")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_alua.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
index 140154d93c43..e2439f2e468a 100644
--- a/drivers/target/target_core_alua.c
+++ b/drivers/target/target_core_alua.c
@@ -283,9 +283,9 @@ target_emulate_set_target_port_groups(struct se_cmd *cmd)
 	int alua_access_state, primary = 0, valid_states;
 	u16 tg_pt_id, rtpi;
 
-	if (cmd->data_length < 4) {
+	if (cmd->data_length < 4 || (cmd->data_length & 3)) {
-		pr_warn("SET TARGET PORT GROUPS parameter list length %u too"
-			" small\n", cmd->data_length);
+		pr_warn("SET TARGET PORT GROUPS list length %u too small or not a multiple of 4\n",
+			cmd->data_length);
 		return TCM_INVALID_PARAMETER_LIST;
 	}
 

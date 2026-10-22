Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653534;
	b=1RX3SrwMysyvX5PKv0JyOkEhH7NElxtqfJqP/2fcnhx7uZlLy+Vw8TEerepLjcJq0RTi
	 rTrW+baKIc8Uagz9oCO/6rmVZqbkiM99sqtiIwFu4y9UNP+Pgz8XNGu7N+LOxp2csTTOS
	 OcKfRllj5btUwF9emfSRJWy37zg095GP4AxEiep17S0geYBHa53LmB2iUNgbHfdVutlfl
	 Jefps2uX12Ku/HM+faR/+9DAZtGUpEG0m2TD+X7LTpISdR99H1tykXyiy6Ja/OYuS6/tL
	 iDCegOY8XPUOOYZG97UvkFmLq2rr2zF52SekvIgYDMU0kVs8MLm46uqD3BB5LdZx1mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653534;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gPiE3QWjmwTsVpl3XFuxTwOhK5xMwryQhv8LE68/7Gw=;
	b=INP4ETaayUm5BI6++HCDQh9iH/aINtZrykTy+Exzjq2E5zGwkPS3EYvcpsgYuzF9iS6F
	 17zLMe8+4ZOz9zw6NsMkPC/Uf1Cm9nf9zVS2bkxaEdoHj6TBhn+uxgbFBKHF9A9xnHrdl
	 i2JZKNGO+E+l9CuEplsMPBgNc8WxSYz4d5wqzNTC55QHhxL36aI2923KsBwfuRQyQikYk
	 Bmj880T6Yk0CpsSXvs7xsynZbuF3SVp6cBFMzOWtXuh1D6Bjjeg6ZxL3wbF/KoX3XTwlE
	 xnfK7Pdrw+JqQuJ5xKK+cJuRK+ulI9iZID5PQtk6TVTiyf19VDgcqixSrd7Vsjhyk1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LnUiiXeB;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7A3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LnUiiXeB
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd69954c755so976327a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653533; x=1793258333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPiE3QWjmwTsVpl3XFuxTwOhK5xMwryQhv8LE68/7Gw=;
        b=1/YMlldZP0a+wpuO1PN7D8sf9MYeiFI1svY4qrxMqi7UAeB9tYscewHvZOL2JCv3jP
         FcJDPaRHSevc4wvP4xF4BS0cPg7NyObv9LmnyJHT8lea08LtVkDIdfPc3w9ns31HmfjN
         2/mGjArshI30UhYQBSm85lwZMi+0e/JnIc1IvNvf1ToWao0hrmzrvzAmROE3RRUBlVV+
         XIqplJm2Vwv2cugmQQAuEZd+5EwOFfi3Qv3B9pR9M+AIVMGb9l5uOuf8uJV9feRXkzvu
         UFM31uXnfvL8kukbM4fOTY4Yr5bzuNb8emACwVmQPvLZQQoqOsVj7OuotrDCon720iZM
         EA5g==
X-Forwarded-Encrypted: i=1; AKwUvBwaAz6t8aVJytBRiflsclknV7aykIO8GU+vnqQc5ITPOEwFKqUymbU4iImBwSbqRnvOwa2CD73n56zArn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgETxkBknJ1LipJQtOoe0dLd+qyI95pso5voyt3XdLZyQqC2n9
	5UmbsG1sTBPAAIcr2Ls04AfXpcd/Hmgp6sqFayyj0KPxzBaph/oJY6Huo6tW60WR4r/lonZJl2+
	33Q+0Ijlwz2foGvLfzLqm6yPdoqnChP3UcfQOjq95DPO+vzQcLvvj/XwjEfEA0ZFKGGdnLOAiL6
	lnz+fGJfC9i9Qp7uvQyUJqKb7bO8iFccSyjWU4oB9XX2PItZL+iXslLKCJ8nuBIJdf8r2v/po9+
	nkaOggdsN69M7o=
X-Gm-Gg: AYBFou1sbD3AbpQoA141e2kqx7pVAvqeIAu32j25MesnsXtXEQwCgAiie/Mm03Jr2QE
	wf2zmapFzrzkhnKauLoOO4sUbnKt7QhSCqZ9bJdECN/DZEkDfHVhl1fNHDLpFfL2n8iaECQw9g5
	BgmicAPiyN1kM7cU2WZtSaS9VmAbFPu8ehnhN1phSCjg1jEAUf0tRB6Z2FOdJ3+ln8CIUBhdAen
	55Lzw/VX7lnjaGp8GGXtBTOk0+KHKN8q/Cgf8BzhneciAr92VRHmIbxQS+1uzXcJM7PIYWbhXLZ
	0mczWOZmHkG/FIT2OVU0OLLX0D8N4gwH8cbUHsP3RZ967HAo7biFCn+tBJHwZdpdP/oatGKzsPd
	bTxIdpE9RNfYssNJtXjUSzipEamgXo3osEOMXwGhSz9PlLdESxlYevvC24j77dd5K61KNLA8Gvv
	IQSNjrK/0IF/rp0+QKcdHHciLGpWzMrHcElQ==
X-Received: by 2002:a17:90b:5810:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ad87087a43mr3353829a91.58.1792653532619;
        Thu, 22 Oct 2026 00:18:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada4897b9dsm1512890a91.4.2026.10.22.00.18.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:18:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3959170eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792653531; x=1793258331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPiE3QWjmwTsVpl3XFuxTwOhK5xMwryQhv8LE68/7Gw=;
        b=LnUiiXeBcWdhkli1TdvatmlNUvP8ZQu6TwBKT16lKjDzOTvangXV2lMJeaHG5f1AvN
         uHch5HLep8jkIpcMK4GZThi9+iH7CAYud4i2a68WJXwxe0I1jwEx8FjMFpTEq/63H/lR
         KWqQ+rQZ8oq2ZciZCTNdHeMvdnQs+efllJmPE=
X-Forwarded-Encrypted: i=1; AKwUvBxA28GCCGUROK9Bwj03dHoXBgPY1oi/YEowWS7r4x2QXllTjOAKu0lzcc31i21e0p4fHErbtpYTUcqlR+M=@vger.kernel.org
X-Received: by 2002:a05:693c:20d0:20b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-368c6b9e87bmr1870310eec.14.1792653530923;
        Thu, 22 Oct 2026 00:18:50 -0700 (PDT)
X-Received: by 2002:a05:693c:20d0:20b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-368c6b9e87bmr1870282eec.14.1792653530184;
        Thu, 22 Oct 2026 00:18:50 -0700 (PDT)
Received: from matt-workstation.dhcp.broadcom.net ([192.19.38.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm13687638eec.23.2026.10.22.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:18:49 -0700 (PDT)
From: Matt Wang <matt.wang@broadcom.com>
To: vishal.bhakta@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Matt Wang <matt.wang@broadcom.com>
Subject: [PATCH] scsi: vmw_pvscsi: add boundary check for cmd_map access.
Date: Thu, 22 Oct 2026 15:18:40 +0800
Message-ID: <20261022071840.8655-1-matt.wang@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The context value provided by the device in a completion is used to
index into cmd_map to find the command that was completed. To prevent
out of bounds access or completion of an inactive context, check that
the context value is in-bounds and that it maps to an active context.

Signed-off-by: Matt Wang <matt.wang@broadcom.com>
---
 drivers/scsi/vmw_pvscsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/scsi/vmw_pvscsi.c b/drivers/scsi/vmw_pvscsi.c
index 151cac9f9..49d1950a7 100644
--- a/drivers/scsi/vmw_pvscsi.c
+++ b/drivers/scsi/vmw_pvscsi.c
@@ -201,6 +201,9 @@ static u64 pvscsi_map_context(const struct pvscsi_adapter *adapter,
 static struct pvscsi_ctx *
 pvscsi_get_context(const struct pvscsi_adapter *adapter, u64 context)
 {
+	if (unlikely(context == 0 || context > adapter->req_depth)) {
+		return NULL;
+	}
 	return &adapter->cmd_map[context - 1];
 }
 
@@ -550,6 +553,11 @@ static void pvscsi_complete_request(struct pvscsi_adapter *adapter,
 	u32 sdstat = e->scsiStatus;
 
 	ctx = pvscsi_get_context(adapter, e->context);
+	if (ctx == NULL || ctx->cmd == NULL) {
+		dev_err_ratelimited(&adapter->dev->dev,
+				    "Can not find mapping for context %llu", e->context);
+		return;
+	}
 	cmd = ctx->cmd;
 	abort_cmp = ctx->abort_cmp;
 	pvscsi_unmap_buffers(adapter, ctx);
-- 
2.52.0


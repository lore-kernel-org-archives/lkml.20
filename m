Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653550;
	b=js+5Zndcvq9HzC+ARohl7e+d04s0xUF5cyLpwdyj0E0tXA1gnn9gc7XmqCmDu1BOsneT
	 dewOEyauB+C1ReGCwt6AxAKXCy2wFiYMDQR+eYSvb5ScWWUKZfYBoORqu3TkDw1QmKjMJ
	 ptl9QJx8WnBG3cwZ+ptpbJT4rA6IWQUKH0vp6zHXM+odqKQYid/W0uwNHPJc5xCm3H+JO
	 REp8brHxTlqGaXVnuq/bdwlsrtBgKSsj6bJtt7UFQblqmm5q8f9kZ5d9grJ2z31WDdrBr
	 el1uFGlIZZ3Cz/XwIQh7Ngy7jWELIHc35l4nwrFFZsi3S9XY8ZPPzQ65GftZzsotTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653550;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=mb0Xuw2hsRE9Rh0sEojEm3qW3tIg9er9OBi3tNQNZUc=;
	b=ffOIkgfVdwdvV09DJK9ekFGSokeYUpYZrrBNixN9/nBYvzngxFpDgLFs8kLA3Q62AHwe
	 XOnF6PmwqmnNZYpaUvCiaYDcd61Vr7DjuShfyz4XveXIwIjHxORFvcRWgylAO3+4DG9cp
	 LRZf6Zo8B95DRFUeEVrGistmBoCN1rkZBhKWm+jb/pJJULs1UYgFGxrlFUoOsImguEwMB
	 V/c3o3Ooa2EwOe4khSUv1Y4bLPa4CU+jUFlWK1Dvjt8dl4Low8+qxWbgQ4Obh4M3E1azn
	 740cd5WFXqZ+QQ0635NOXywQSasuiLj9c6DbXqJYtlRzGWhmRvk+Mw6VOeh+sN3niEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Am00/wPD";
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Am00/wPD
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f2ed2541aso57596485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653549; x=1793258349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mb0Xuw2hsRE9Rh0sEojEm3qW3tIg9er9OBi3tNQNZUc=;
        b=gPVr80u12ib/74vvs8256/Hr9gQ5qOl3Q70jeT3TwfWBvUz3sUUT9bl17KZ88rp2lj
         l1D1y9EfLzxeKU5M4N4YZvL++t/iWf+/KtneEkTV+ZaSh54noqQ1BBIPCddhzk1OGQu/
         Tg/QrnYuzG2hoviWlOqhYiwlAGhApe1SmZKVb1sbWeveD7X0fpq+fERJuw0dUByjQJZq
         VmSi8wvxBNkLtsIxQx9X1G+Cy+i+KOJl76HeDJdpY/jo7sHE4vLaxZcmJHQlGnHiiH9f
         Mgs5Yhbs81cad/rfXExgUH2JTlL2sQzdqmnDVtui4ZQfwXhQVF9vFtbtfd1AbWgwv43w
         rHYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTrK8Y10eJEFvSdAa3tCi/dPXpYpDy4R838hjRkwCsdkkQ3O9LRRc+1+NFkClz/LL9XnZk7mN4F4ZuEWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxdxBT277wh/0m7TR46LdAUB3HjzEIdiBqrJjs+8jisxaFqGkj
	NaxweHSDrVi0DpOAcqCvE8CzHAK7egr4ErspIOrHmAFH/ky+Q29QB1BptwwMyGOQeVGcJMH+L0Y
	wfWYknYJ7iP/LBWz450gm2t0uKXJDE0tsF+y0D/Lck9PjiRn/LUJZ4qT703ooXK8dBB5czlmhwe
	c9YsfXH5BLfVlCq+uAbDxtHWT2nej3QnpSxoIYCKUu7rwMWc4tPrnObZMelYdeZ6LT1ihZ9nh6L
	j1qe+65Y0imDKI=
X-Gm-Gg: AYBFou1DBjBnlBYBHsK1YmQfSRKPSGSpW5YK+enWm1MHqoeZH19ITlKTzBeTi1JxE/l
	HyFHurMjImwHfDsSoKMwIpJ6z1oEkcUIbM9kMnW3vnK8QhDwUk7Mtme3MK04a7b7XNyJcpDK8AH
	pea46kl008as5iDpQDpQyMncB44sB9C0+5PlnfkDTIzHgkvDanBWEnCdFfvFlK+8jZcKiAVRRoE
	Xri3moi0GAk+L4Qg99K0s1Nmiv96iClMebzFfyOqj/tQeHP0cm8a03kMmL+d6H7VOZzOB/Qreky
	JjCXwChdFaC+QIq2Z8NJY66eIGVQ4/wiwvp2SXyTMMMPK87zz9wO+yKXHOeyqKyJAsv/8XWdnOV
	L2BXO6WRzqtFKTahkApOfk/K56Rz/q1rSExy4my4+C0yWeHtqqRiXcxwvRu13FuP7v5KSY4ONBz
	vEFbrP16aVRQ6MJgIUmELxhseHpmvQNOWeTw==
X-Received: by 2002:a05:620a:8082:b0:93f:eed:ea4f with SMTP id af79cd13be357-93f62720fd0mr250887185a.41.1792653548660;
        Thu, 22 Oct 2026 00:19:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f56de5df1sm84956285a.13.2026.10.22.00.19.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:19:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso918534eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792653547; x=1793258347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mb0Xuw2hsRE9Rh0sEojEm3qW3tIg9er9OBi3tNQNZUc=;
        b=Am00/wPDIWBGzmaaThjF2RGPXELEyDc/dNj7tCjcRmBMhTiD6lLPcluzUIZ3pvgp0a
         zoDvZ4i+0EhWSy31mFSz0trIwvSEVehCmViouaYfJ8If3ELbd1FpQV388eQOvXbAwK2g
         OTyQyyp4sEf73LbMp2eX+NziRp0EDhIy+cwh4=
X-Forwarded-Encrypted: i=1; AKwUvBz8DrnXCEzEHrcsdJGTdVa9zwUDFlC4I0xCeSTiRvjCeBC6U4Jg0VAXQEpqg/b7/lTDgrStg1cBccNGn7w=@vger.kernel.org
X-Received: by 2002:a05:693c:8809:10b0:359:fb64:11d7 with SMTP id 5a478bee46e88-368af69cd3dmr2002274eec.11.1792653547229;
        Thu, 22 Oct 2026 00:19:07 -0700 (PDT)
X-Received: by 2002:a05:693c:8809:10b0:359:fb64:11d7 with SMTP id 5a478bee46e88-368af69cd3dmr2002239eec.11.1792653546572;
        Thu, 22 Oct 2026 00:19:06 -0700 (PDT)
Received: from matt-workstation.dhcp.broadcom.net ([192.19.38.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm15650049eec.15.2026.10.22.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:19:06 -0700 (PDT)
From: Matt Wang <matt.wang@broadcom.com>
To: vishal.bhakta@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Matt Wang <matt.wang@broadcom.com>
Subject: [PATCH] scsi: vmw_pvscsi: clamp on e->dataLen in pvscsi_complete_request
Date: Thu, 22 Oct 2026 15:18:58 +0800
Message-ID: <20261022071858.8674-1-matt.wang@broadcom.com>
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

When calculating the residual bytes, clamp dataLen to the buffer length
before the subtraction. This prevents an overflow if the device sends a
larger value than expected.

Signed-off-by: Matt Wang <matt.wang@broadcom.com>
---
 drivers/scsi/vmw_pvscsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/vmw_pvscsi.c b/drivers/scsi/vmw_pvscsi.c
index 151cac9f9..8e2c1b20f 100644
--- a/drivers/scsi/vmw_pvscsi.c
+++ b/drivers/scsi/vmw_pvscsi.c
@@ -548,6 +548,8 @@ static void pvscsi_complete_request(struct pvscsi_adapter *adapter,
 	struct completion *abort_cmp;
 	u32 btstat = e->hostStatus;
 	u32 sdstat = e->scsiStatus;
+	u64 data_len = e->dataLen;
+	u32 data_trans = 0;
 
 	ctx = pvscsi_get_context(adapter, e->context);
 	cmd = ctx->cmd;
@@ -590,15 +592,16 @@ static void pvscsi_complete_request(struct pvscsi_adapter *adapter,
 			 * returns zero dataLen with non zero data - do not set
 			 * residual count in that case.
 			 */
-			if (e->dataLen && (e->dataLen < scsi_bufflen(cmd)))
-				scsi_set_resid(cmd, scsi_bufflen(cmd) - e->dataLen);
+			if (data_len && (data_len < scsi_bufflen(cmd)))
+				scsi_set_resid(cmd, scsi_bufflen(cmd) - data_len);
 			cmd->result = (DID_OK << 16);
 			break;
 
 		case BTSTAT_DATARUN:
 		case BTSTAT_DATA_UNDERRUN:
 			/* Report residual data in underruns */
-			scsi_set_resid(cmd, scsi_bufflen(cmd) - e->dataLen);
+			data_trans = min_t(u64, data_len, scsi_bufflen(cmd));
+			scsi_set_resid(cmd, scsi_bufflen(cmd) - data_trans);
 			cmd->result = (DID_ERROR << 16);
 			break;
 
-- 
2.52.0


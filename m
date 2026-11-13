Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559231;
	b=k59T8maXIwIFKPizD6kjsHiBKGqQSU23WEjU7JkfSXVW0NAs45/GkVMTEFisdUZ17uRe
	 1GptT/mlTihCapR2HXfACK03u9l5ArX7ZP6RNEXOgVttYeP1bb+tngZukGNd54C+E9A9f
	 8JVXQbMWnivPImOUPgjEoqw3ikR/r52fF/lZJWplz/h6qW90syan893E1iXumneJ2hrv2
	 yTVDZcVw+0FtYcV7YdkmjQNuojgL2tldw/gjVasPp9plO4kK3+cV/+mhx/QCGzEqZUDqQ
	 3L6mxORlzefQT2cwkDC6lFvHGXqEjnbyTzHaZ9GLJJVMIN0cnme0gLpC3x0G06+gdEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6HjmYTtzj67gEj1W3Fr4INGR7fSq4j0RNLKw8boe0iU=;
	b=2A5kPDjScEeK7Z+XJBCskzJkUbMksioMy9YxOZ88ecLFnYGm3oQ5nsD1sC+4R10M9IfF
	 7Hy734BDt022B/KwT4hmD1UCGHsKIAjfMSAocSj/QWfCoZrqhd8wsOHuqbJ2jFNOIji4U
	 Zd1JI6rH0+y2pUir3JnktMcvWbGR9s0/yN/hhsNQWAtxt3+/o3plDpwR0pIWbGzX9axsj
	 VUhHRX1XBQCHa0PCVrmGIxK1CSWSsSJ00s360JVZaD6shRT2Oz+gVAG/FOJ7rL9Vk6YSm
	 C8OKhmMPTGNcnnZj38tn48m7q4pm/xjcnSVk8w61GnAbtXuWanI7IbSAWdySQwSFqvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFQ3NMFD;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3B60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D3B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFQ3NMFD
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06e79e152so297641b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559231; x=1795164031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HjmYTtzj67gEj1W3Fr4INGR7fSq4j0RNLKw8boe0iU=;
        b=HFQ3NMFD/HeHqYJQZncUggUrOcMsaYsc6YJAUjDIsCZEZ99XBDbk8eKvWDF+Gnnrcd
         svJJ+NI70TLXlxc0n1QkUdGBFgOEAeAAGvKfgKVnZl+v92VHhDFwUFx4TBLOXVvLojUP
         LEeHLydP4SIxStMQasLl51rfhBqfGqbnVX/t31+VgC2V3srZjG78WS+xEx032q57Teu6
         Hwf4POH4kZXxDBFsy75EYAKphlXWF//aw+m68zUh5aRduOGg9nW4UfkfnUh2xIVQ42Nq
         UwxFv/yTP1Yf95db/kKvzRb8Yjd52tHxSyekeJBtDKAzgsZJobPigb34M/u+Vl2afuEP
         iaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559231; x=1795164031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HjmYTtzj67gEj1W3Fr4INGR7fSq4j0RNLKw8boe0iU=;
        b=P+2LpOwenmZ6AQSoh+8nQcQjdgtpXmM98OP8qY7DRKKrydRESS0v7wqFoHhr7WLWbU
         v5lGGZ4uPbJC9PV4AEHaU7Bcde/xDrw3R+1IMUvS3kqb5Ok1sbNeGd05B5eNs1+MiRbU
         sdW0AgO9BoU01EzoRzewxtjtYxzBEmT+WRIxqkqyZAwO4SmPviu8iacitBwxAuD76YXL
         KI3qVavkbndhHGuWRFNiml77aOa82pcZTDApoSfjBIYFuQ2x6iagREqmwv42LgEWThg/
         y3uMO4u/UbD6YHgvXTBzDN8ttEMVcC9hunKsoNO5O3VdmjKSi9Ic00AJGYDDPuDXlX+W
         z8QA==
X-Forwarded-Encrypted: i=1; AL+hErGPjCwa8MLRkYwRjU4Wq9osuNemLkFIBQRYRnxFYwmwDsHbyJ6Il5Tt2ENn/wazxdzJYnGgk92cuRuCqDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80ZQK40kytO/2EJ2ZRq3pMqSdP7yc3zyionNRjfqsYmc/F8fAJ
	M0Fgx63k1Gdug0kbAdHifi0nLd1lsbDxymUSMzSuR4ywETdfKWIsP7hW
X-Gm-Gg: AYBFou3GIHoAM7GiFCd2S8vGGiJ6fbVlp/b/TbpqWFFSn+wDuv9FYirCDrVDV+MNet1
	vtBUR7FUV/AWxHX/8YHv5T0CWL6eJ81wxsLcvRaTzRINjfB1O+EtUKIEjp93ym9K72hkOkjEMs9
	5N37VnZbQ1WAaS2pQ2cF/tSe9ifc7BZcm7xdN2+egwCG8htCKo/dr8nsnKOjpkQ97x9D6OAnK8u
	Fhv0MhfMLZNtRwonbKCo4LwyOEIaU8MF1T/LLFo19sENAwrP1aOHe5n4LE7RA9Fp8Cy5Yn21nJu
	mZpRccsYGTd35IWbGxy2HZ+Lx8w2U19vE0s0/wNE1cbKguRStBnGuiVs+CnNAt5+KdfEt+GXYdf
	f7S+gjOb0HFTr5cqJ9lcrcdmdbbJxs2Js6Q5dgUWnoRzB4SqHHEpesv4ecn2xRhsdcr0w+lGkzs
	9WJUdMdrdTDSHRzbYG7PU2j17tkP3lU/fmINlirsLaSYUfdaOyWFDGntEyykGoIdq1uRa/QPzqN
	uYu7tC/0o1aB/ITMoGcW9y7ot6OomLlqEkWzd270dFU7RnO/FfFzYVjLvamt6e3ZCUkkk6wZzX8
	zS9c3FRaXkdO5qwIIyr4eIl6OSN9/P9EBUmtwD5rbw==
X-Received: by 2002:a17:90b:4410:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3b1b0b9a342mr1279723a91.63.1794559230508;
        Fri, 13 Nov 2026 00:40:30 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25a365asm1264855a91.1.2026.11.13.00.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:40:29 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v5 2/3] scsi: target: Clear all control read scatterlist entries
Date: Fri, 13 Nov 2026 16:38:41 +0800
Message-ID: <20261113083848.1517595-3-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113083848.1517595-1-pkfxxxing@gmail.com>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com> <20261110052827.963143-1-pkfxxxing@gmail.com> <20261111065342.1282709-1-pkfxxxing@gmail.com> <20261112094138.1390409-1-pkfxxxing@gmail.com> <92a82300-a454-4ee5-a191-0ce5a2ee58c7@acm.org>
 <20261113083848.1517595-1-pkfxxxing@gmail.com>
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

__target_submit() only clears the first scatterlist entry of a control
read buffer supplied by a fabric driver. Control CDB handlers can leave
response bytes untouched, so later entries can retain stale kernel data
that is returned to the initiator.

Clear every supplied scatterlist entry before command execution. Use
sg_zero_buffer() so entries spanning multiple pages are handled as well.
Keep clearing the full entries, including any part beyond data_length,
as the existing code does for the first entry.

Fixes: 944981c7e106 ("target: Add control CDB READ payload zero work-around")
Cc: stable@vger.kernel.org
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
 drivers/target/target_core_transport.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 927861c30a..267f5e2cc8 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -1633,23 +1633,16 @@ static int __target_submit(struct se_cmd *cmd)
 	core_alua_check_nonop_delay(cmd);
 
 	if (cmd->t_data_nents != 0) {
-		/*
-		 * This is primarily a hack for udev and tcm loop which sends
-		 * INQUIRYs with a single page and expects the data to be
-		 * cleared.
-		 */
+		/* Control CDB handlers may leave response bytes untouched. */
 		if (!(cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) &&
 		    cmd->data_direction == DMA_FROM_DEVICE) {
-			struct scatterlist *sgl = cmd->t_data_sg;
-			unsigned char *buf = NULL;
+			struct scatterlist *sg;
+			unsigned int i;
 
-			BUG_ON(!sgl);
+			BUG_ON(!cmd->t_data_sg);
 
-			buf = kmap_local_page(sg_page(sgl));
-			if (buf) {
-				memset(buf + sgl->offset, 0, sgl->length);
-				kunmap_local(buf);
-			}
+			for_each_sg(cmd->t_data_sg, sg, cmd->t_data_nents, i)
+				sg_zero_buffer(sg, 1, sg->length, 0);
 		}
 	}
 
-- 
2.43.0


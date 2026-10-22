Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675791;
	b=zxZ6RPvh8N9d3aFqolrgXJOeFiuYAApqsuhNOdnvUBeaMdXYm6YKKxDE/Xcf1RW1rc+c
	 tF55ixJ7Oh5YrOe0pYEYV4Inn3lS+EGX+OP4t91N7qJfCXkhYDdlhvyMzBnfdDxoybKbV
	 Ys3IroSCmy9CBeFkRAG+og99CJyRkqMzFJgXKd8v7WbDmgwpv19LOpwbTfUlpp8MI1t4O
	 LSXF3egjD/eRZsGorOD2vs2FWSH+xfh7ef+fp6GxfzTXMpT4BylBYOd8NTfQv4xwLCGwN
	 6LdrKpWsnb5tU0W1iUN4SF/r6b+xaQSMkC8eByPUUixGvzlYM7rhEKtzkkX36lQE8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uw/cd/kzkyBkXI5zP9mLCKnmK/pe1xDS1i27lZNCuU8=;
	b=yX0x+buufXRq43wscpsBbl59p3a/iA8cSeyzh9MsdYGiYiiPNzb/Qg2DRGvXSKcjPwgc
	 Drcm9aKxWWLa5XI+ZKwjEhMFumcj4wG2fCv8yLYoGYS3qpCsWPHzFCjDML2DSF4LpDx2c
	 ulm6+41wQZJmLul5suSGayKNvi05zp5V6G8ALrXHuwo/tyYgKKQPb00WUV7eWl+KTlxYe
	 C9bofA3BSezr0Vh3gk5iwy8aXQdrQou+OCbScCabcSYnRo22Yujvr4mxuYX6oQlWOvjxs
	 KsvDNdopqLFKyOCKBhlnn9mk59nQUGgrymYhLOYk0GwRRA9aPquA6baXTM0G6NWmlLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ipuvz17g;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DA60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654DA60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ipuvz17g
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so14230225e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675790; x=1793280590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uw/cd/kzkyBkXI5zP9mLCKnmK/pe1xDS1i27lZNCuU8=;
        b=ipuvz17gBC95kOVuKeV8CG7qMCObc3Hv1GIQOefBpcMEVvP4wpYsinPtkcTf4+f+7S
         BEE25OFnwn9cTYD5nNdaqMtgURwb3KzTwOoOfkaVgoQmIRT4ERTSynpfQ7mhk/abx0m+
         uxWHmYgUhiFFmJ0RRZyDqj6G2i2GN6pFcxIT+gyZARSS69l9bEpF5lsKra3+949ENMwE
         uovnljcGIsQzsCfzBqW39f0L2w/XuLGdfdedtfm5bYHSnBF2VsvTfXc9VcUST94fHUhU
         CzRrP6hUqxm5Ksc0gXan5enk+8cdHBFLmHufmuJxqOeBf+i/ui7b+BR5xklFQ3GEVOq5
         C8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675790; x=1793280590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uw/cd/kzkyBkXI5zP9mLCKnmK/pe1xDS1i27lZNCuU8=;
        b=KKhA+fUaNm2LPm8vUtxm+CTR11nF5n2VazuIaqjAYXf2qSYXqFoc3VofcQ11jMTTqg
         E0mlgK1NlLazEeilpzrc9k7Dn06/v9/uJHYuKiYCPpXHhyds5YZtZddkedWvcE2G+dno
         PmPpMvDuOukNbxjI6vWW+y8LbG8s/QSV9tqTBT48Tmn6SiLMApYaaVKLTzc872z12CPZ
         FEX7QzDJ4qDM/sxOI1zlJVx5g1/NRFZwQ7lL0oub6fLt6xpnEVLjJYR8ElRQPwrhnOa5
         7Ft8jerTIXFx2kJVIKE4UqV+ajJRSaATVEweAMGwTwXCpy0cmsChqLyrwu/NH8HuT1M1
         iCjA==
X-Forwarded-Encrypted: i=1; AKwUvBxsfWjlw1J4L2lGDyHFa84XLKul9paLjreJ7XOUomnYJYrT+YApMNTB3ABi4jRAGT3JKsOpd2mQlOEBAO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwlOLc4OVRYrSZfQy6UfYdIAXd0NU1+ifMdfa4Ve3VNVTIMLrp
	UWxRjAwbezsyrQT67gX3rolDiulDJfBIZqx9+k7HwLZAhOQ/7bXccvCl
X-Gm-Gg: AYBFou1qM9fy6tv0XkD0caG0npnaCpt8BCHCv0l8X/FBoLBCeXIFo5wLPO03gzES4en
	je26gh1pwgMD9zOOVRGnBoqab+g1h9TocFHsOUoWFx2g31fXq1pTCeqd7CnIrbH3Xc3u0DoHi6x
	wUyNCMKw6hZ+7Kgw7hncgx5JqvmpNXv0bnP0U1sK4+fddPl0fKsaas8yehHPkzwhIOuPV6M7UR+
	aowky754QddlPv5/p4SE2FgL3zM1/icfRwZc/3Nt8vIrkt0zGzgl6s0Oick4DKsksyhX66Mqop+
	Gjt7iwxhmIhoJXlf+B1jjXOyqZ1Myx9tLjQCH8z6ac4YezG7fVU/ZG7CaLU/X/u/XcQ9uJduKko
	5HDWTUQYgGp5W/98xPqXL+UHrqMU3qqY2j/J/9LtVHhjzZhqNQxp+KGOuYmHjIi9Xp0kzAGIBpo
	RbnX8I2NQnwCGXBSGD+TkYP6BDPl1/+YCx+Na2HVccpeBxbuqU5bFDslOsjfekYipXUh/UqiHc7
	FxLeeomcTBFV2dHhZVMEe73QfZNc6kqy3ZP20V9epMvGs9wl9689MBkaTmexNd9fvZQmay523Zb
	rDMm0ZzA94BBwzv/0af3glTgSA==
X-Received: by 2002:a05:600c:46d3:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1fdd15be9mr114440055e9.15.1792675789631;
        Thu, 22 Oct 2026 06:29:49 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm108832715e9.5.2026.10.22.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:29:48 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Justin Tee <justintee8345@gmail.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	James Smart <jsmart833426@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] nvmet-fc: only send read data for successful commands
Date: Thu, 22 Oct 2026 15:29:30 +0200
Message-ID: <20261022132934.3592924-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132934.3592924-1-parri.andrea@gmail.com>
References: <20261022132934.3592924-1-parri.andrea@gmail.com>
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

When a read command completes with an error,
__nvmet_fc_fcp_nvme_cmd_done() still pushes the whole data buffer to
the host before the response. nvmet_fc_alloc_tgt_pgs() allocates that
buffer with sgl_alloc() and no __GFP_ZERO, and a command rejected by
nvmet_check_transfer_len() leaves it untouched, so the host receives
stale target memory.

The buffer is as large as the data length in the command IU, so the
amount of stale memory returned is up to the host.

The tcp and rdma targets send data only when cqe->status is zero (see
nvmet_tcp_need_data_out() and nvmet_rdma_need_data_out()), so no nvmet
command can rely on returning data with an error status. Do the same
for fc. The ERSP then reports a transferred length of fod->offset,
which is 0, matching what nvme_fc_fcpio_done() checks on the host.

Tested over nvme-fcloop: a failed read command no longer transfers
data and still completes with its error status, and successful reads
are unaffected.

Fixes: c53432030d86 ("nvme-fabrics: Add target support for FC transport")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/nvme/target/fc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index eecdffefa24fa..b95893adae36c 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -2487,11 +2487,11 @@ __nvmet_fc_fcp_nvme_cmd_done(struct nvmet_fc_tgtport *tgtport,
 	} else {
 
 		/*
-		 * try to push the data even if the SQE status is non-zero.
-		 * There may be a status where data still was intended to
-		 * be moved
+		 * A failed command may not have filled its read buffer, so
+		 * only push data for success, as the tcp and rdma targets do.
 		 */
-		if ((fod->io_dir == NVMET_FCP_READ) && (fod->data_sg_cnt)) {
+		if (fod->io_dir == NVMET_FCP_READ && fod->data_sg_cnt &&
+		    !cqe->status) {
 			/* push the data over before sending rsp */
 			nvmet_fc_transfer_fcp_data(tgtport, fod,
 						NVMET_FCOP_READDATA);
-- 
2.53.0


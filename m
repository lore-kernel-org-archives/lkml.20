Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798106;
	b=YuwA/yzCKcxBnkC7ZYRWLni5Vjc5kvF5LN1FY8E4OQ2Im+56UrY6jiDAqeXkpfsuRExa
	 AD2uli3paP2t7XmDJpyw8YQfuLV+bvWpovuvfWbyD5Vvkm0LBr+7qWRPy9JQ18Qgrp/J4
	 tIRg0vIevaZRUlqR/l4SZoJMOj7l+zwI+TzXoxjgkq+jiNt/wBUS20Kg/gbKRtKYMp3RE
	 rJTk9RRTIkR8C7g+xyaZg5ZgOuvCzJINS86jQp4hbBnNv8790cO/TWiYn5ccff5sz3A8p
	 +LYf6Hsi1o20PtvqjP9+lTB1fUht2aqychUDTK9jXfFOLD+Z5Jy7wwFGBk0/AX8/l7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9yLw/WRCc0A3tXBtnMdNXih0KVmDX6sXBP0GZLNu6xw=;
	b=IhvzvWjONG20A/ooF6Ani/klrutUqw61NYofA56KOkHGNp+RZkZQp0UNxcLm/tQM9Qh9
	 ePbKHRZr2QtkKY7Kwue4FRABFIizvK/uhh+JNEPWDDY9P531Cc0LYzkK3kwBw3bxpY4O4
	 juNrBLxk4w5OMWlfaYhbsn0IRdr/3gWUJayWStIEm7tBDhBd06HsOGhYuzw9nydvirYis
	 pnSD9jkWZDrfeQT7IDWg2LC19GD7NMyT41yfPaMYjTw83nSjpjFn10Qw8J2qgiMOKRGnF
	 h26o9SiFnglUTh6sTB0OiboO6GLPxHERE8wr4ElV5RjD/o7OCiJqwFoax+9V4GvCs5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9iF9kp;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF0606A8A1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DF0606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9iF9kp
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so870771eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798102; x=1795402902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9yLw/WRCc0A3tXBtnMdNXih0KVmDX6sXBP0GZLNu6xw=;
        b=sd9iF9kpJwxa1VQzevX1dTaoID8Pa30ReWCDLPJmBSbUyY6xnKcAKlmhn19lEVJSQ6
         imGeI6NTtdIo9tSo6QY4d5BFyiU9r98SzL3YS70SoiNq0Pgt3FlMc/BZ/GB19Kn76qgO
         xAbRBwiYzszsYWt47JHmRnRh3RmwK1ax9j4wOOK9rCuYTJi11jrkk8xsp04Ap5MmSh6u
         nDjedpehZ19r5oJ9zmg0hW2Akr6OcR+/VHixwUNLMu9t3pCmCzeKMckfSeWiy76czYMg
         g3DMoWzuemA9b3UGGOwGFSbfK/fflj+sggpd1DIOFHYz95mTkvSP8XhihGb9DrxV1xf0
         u2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798102; x=1795402902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yLw/WRCc0A3tXBtnMdNXih0KVmDX6sXBP0GZLNu6xw=;
        b=WomcgN6SVBThU+oeSakUO4nGZCMcK498PJ4AEggcjj5aZdRJrm+oYT8LCls9RjaAar
         GasZueTzhu5OFbfx+5y35P1wUHTbF5W5293RVLocd3qaxx+vuOeAi4kR4K7/mkbISdj9
         bduUpBZ0E86AwDJDLR3LmZ4lTgd78dD5F08em06EKjLbtJFRWc2/siK8OKT8f43xCoSl
         TmSotIXN+1lDRuFMQB3HEnOGqt4KotxBIw0pThzxA013gHnJ+6ZzLtZ0prh5mRf0pMoc
         5fmUFf3ixnSTMXah8dwhUJwWG5ZE0l77lrEY5/JsqCRRfQooKf8536wBcNcE8tmRZ0ct
         kNgQ==
X-Forwarded-Encrypted: i=1; AL+hErGI7JsE2ljTRY1ELS7uu7cMoBwHop4gmZNkEvWtuufc4slFN3gyTL4LIGHbzu1z+zXZJmV9+MK70LXxgkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6ebf+zMNBC5xkoiKVSYmNtSpUsu3HfabWPwlCY7aXOQ4mIFt
	6crI/oQE5h5+8ZHuGVJkapyDe0v/GYEFD5CvMNL2B4vfQvUOYRKTMrkq
X-Gm-Gg: AYBFou1fBTWliZ+gvfwFyi/9UDfb3sSxFZJ2DgbGYq7lX5hJho2o97s0hXs4r1AybwW
	vto3AWdydT7ZVR5ToHIbnGUCR/zFnadmgY5sx2DOJV3rWmAEF/z2zJ6mjmXyRguDi7r0dHcXF/K
	Snsy+B+KGIdxW491K3akjTmEG44yEIkE19K/WwQZovRQ4ylTZaax84Hwmd+pgjSwhAEbix9yaMl
	Bi2BkeK6ANX7sqTLLStDtgLaIuQx1L8deGoW0/JaNb/VOQZ0iVFRCvbZIOiOHcY0GufSJU6StRE
	6ozZU/yzQCIRMzJmU0mQCaVqQrH0uRfS5bIk5Uph+uuPBql4l5QWq8SIUV98en7ktxFXJqarrgU
	LpENk6RFMw6lbEC9w2YYHKXWEe+PkQclMbCDI+qrgVDOPhUYNDx22B7sFLSHpFgUoLTZXy7m6QM
	DGO0UgFFTSkPZ5eCzLrXp77zdkxXw4uOexRk4EqUSVwsW1wtakb82qUfJ+ooZ34MJsID51LfX74
	xq1CIhVYuAVPGHuAaKtGfbhzp0svA/UfCvDsG8oEEEUpI7wMbnQqLQNWZSPdLbDF6PkbQjVSRHf
	b5AH6ONt6ANnOz6hTeerDTl659NfnfW+kexI5VSbY7TE+kIrEAU4tbGOHBI5McJZNTXq6khXWM9
	EPBEmwW0iKVgp/ME/pA9QDbDsk34ByLtUdjZSYw==
X-Received: by 2002:a05:701b:21c5:b0:1b5:514:6a23 with SMTP id a92af1059eb24-1b505146aa3mr8786867c88.13.1794798101579;
        Sun, 15 Nov 2026 19:01:41 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm29479863c88.14.2026.11.15.19.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:01:41 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: yishaih@nvidia.com,
	alex@shazbot.org
Cc: jgg@ziepe.ca,
	skolothumtho@nvidia.com,
	kevin.tian@intel.com,
	leon@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] vfio/mlx5: Fix an unwind issue in mlx5vf_add_pages()
Date: Mon, 16 Nov 2026 03:01:30 +0000
Message-ID: <20261116030131.15346-1-dennylin0707@gmail.com>
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

mlx5vf_add_pages() gets a pointer to the page list of its caller. If
alloc_pages_bulk() fails after some of the pages were allocated, the
unwind flow frees them with

	__free_page(*page_list[i]);

The index is applied to page_list before it is dereferenced, so only
the first page is freed. For the other pages the code reads the memory
that follows the page list pointer of the caller and dereferences it.
In both callers this is a dma_iova_state that is still zeroed, which
ends in a NULL pointer dereference, and the pages are leaked.

The pages are allocated with GFP_KERNEL_ACCOUNT, so the allocation can
fail, for example when the memory cgroup of the task is out of memory.

Dereference page_list before indexing it.

Fixes: 089803c40193 ("vfio/mlx5: Enable the DMA link API")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/vfio/pci/mlx5/cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/mlx5/cmd.c b/drivers/vfio/pci/mlx5/cmd.c
index 04180035a7fe..8e8514f2660f 100644
--- a/drivers/vfio/pci/mlx5/cmd.c
+++ b/drivers/vfio/pci/mlx5/cmd.c
@@ -518,7 +518,7 @@ static int mlx5vf_add_pages(struct page ***page_list, unsigned int npages)
 
 err:
 	for (i = 0; i < done; i++)
-		__free_page(*page_list[i]);
+		__free_page((*page_list)[i]);
 
 	kvfree(*page_list);
 	*page_list = NULL;
-- 
2.43.0


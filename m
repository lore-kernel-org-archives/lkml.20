Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478300;
	b=ZFz42wFNjz/RJPSc7hITK/Xxu7pnUCAxxMK1pOvUNrhJsZV0otdMbWryZeJdYY3dyqqO
	 Lb2c+s9+ZbLtsyIAfoOWnC2j+1HaKDuOu9iTZ1KCss9KcBa0hH6U07XR06+LY9m2OD8N2
	 RXtwBDSOkSV3G2wt2DY8Ned3bSeRTcLJSOtj/vnOZkS0ccz7TeqIFfQZ0LakAsA73rlQy
	 MV3ZCpxj4KwOPYSGepYRsIThm5uPfGnkagEs5h2OkCYIzqIwcvBlajw9SJ4y6Xsvbb7f4
	 W7APgzg80pABUqV1hMNFUFNYD0HIom9Y/2U87pF3EA1tC1+hnt1O7Nx88urpbJrOziA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
	b=uZtwG4E7mf2Ynw6TsK2rQ/Z4q4vwBEIbpypavt1G4oJ5IkzoO1mNFOIpzBqm2lAeUWRB
	 XedWKjx/X/xvuQS8eh7ng6UQr0/XVbvIerjGEhU79n9au37Wo606HqwyfVxQ3aYJnAmWT
	 yaFizJLH7cStWFcEmUWQ7EIVwPSqO0zKSj6exjHQ2lgP9/EoMFD9GdDoKrbmppMMlLXtq
	 hmk+pgFcwBLvGU/baxNbhbtMj0JkD2KaXdngjkL+FJYVz7Gqzj4JeEtRKF4bzjDzwds6a
	 u9K5yLdss3ratuFoIf25Lt1qfQQqerW4kU6KYnOdD4j3VbblFsNq1zuRhLHbdtmyAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB44606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB44606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2312562f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478299; x=1793083099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=QaGhlh+qQ+oivF5NfN36r2CTE+g/j1KuWE6VhvG8SpnMY7oKim0rNol7iJgN+tE4q+
         MVlQpnipcyxlqpwmar/PD2chWtmknUqsiFTkO95BEUKl+W+bmK7z+5Ejvn3Knxol0zJW
         +H7W8MM0hXObP7E+nRMiN/x3VU2/SMm9MnXUrpLB75C0uA/gHT7Gt/AUhm+yDZ7Ras+0
         ZK9TXDLd2/cWIECm6xd0LZX4E6isxEz2x6c7pyJ8X+r11X822uKwIxtxpdTR7SkeL8X8
         DEbKf83bpzYLaXDwQuA0Mo9CX1RlYqnWWXfj9IhXu3zsR3klycLE/+CSjcazcoPtDdFB
         Z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478299; x=1793083099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=Vq4mFEZgXlpMr2zNhjLmcurk0kmJ+6mqozJeDY3QShOeTkHqMno42YB9S+clLF7kGQ
         E1uxkKXakZATZqCFRCaSAABeD9y/AqGLxRM1+aZnM0n7M1SGyXzozu3/7g1hHOJXVaGp
         eDGL/vFEqmOMfV693MhS9tPxwE2fuhjYsriB797JF9uinflH3J1uVimVXp8CpaSnWRIe
         ooic0Hl8aYQlDdA4FuQhWTqmHDbq7I6bon9sjgdt1A9H1TeaJCr1pBTWF8o5Fs7vl4Oh
         YMptx44/rGYQBndAcvbRFPFLof14hTerNaXkU98i527IIKROZjQh1aQPbVTtl2cOhQ/C
         dykg==
X-Forwarded-Encrypted: i=1; AKwUvBzI1qAtaIIu1vVGakqbo17aKtqqDmgWa9bc1aZDFqWz6TZHSvOPdBQPpRy2eg62ZC8PxB6luV3NYSRXIJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr/fCsR/rYZHQYiPjXL5BDh0ZNxKmweFI3zjfMgl3wh8nw9Vf5
	5g8gb2L/ZUhCl+9A3tRGJ7/v5BLZZoqerydM777TeKu4SAu35lKcDLB5
X-Gm-Gg: AYBFou0248PmgT8QjS/1B41TuMPfzIPN+VXyO73Ucq4cguwZ5uWwSJ4ICh5/g/GBqn5
	ImEOSzHqMLelmDFD0sWak+6AAd282hl1eDaHL3byBYSkkxQqlgDDLzf7A2G77VayHUbLS70aDxx
	c3YwzvpZ87dPcOu0QKDxXtt7ptXYWWuVh0qRUzc01MWwGXtcXrcNZDqNm8uLsUYA2l5lLQz01pO
	HHoq5Gx9v9KjeyWcMQCUiMUHFzkk1jP01CmtCJ9jFAQRkckQ+TL4t1DQELPgHT7B+CLU6pLlhzN
	GCJaxU46mkTRqRBr4A8CyCyZ6uPpgl3A7U2RFnI0dztdK//h3S0w4Xv/cZIC+7W0Wdd4kvzsOn8
	r+9PshY+zMZPvbiQN6nLPhc7+zPjNdW5d7cAzFGBkXxnpjFJdkoSa07xquuOSjenDQEmjSXXNVI
	CwORE2tz9qkmBV2zETuiTlixjhSmk7FHnmtaAAU8qxMREzh0hKrK2oDNIrSioB7/jeJgcyV4jYV
	RelGWP402/sLjrtybx54TAWoqAW1jWY1G/RXUYweB0Thc6UW0Mj1xws1+ldtgkGA96lLTNMOt1w
	VqW/2xpTPkw7Z1xBGatMQsBCNio10KxSVneMo99Ze/KBiOeYW6k92pdGvRBge9zCt5T2Qo9+pU9
	tTLYAidzYp58p
X-Received: by 2002:a05:6000:4694:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-48e07fb6991mr13514200f8f.52.1792478298615;
        Mon, 19 Oct 2026 23:38:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 1/6] iommufd: Preserve DMA-buf pin errors
Date: Tue, 20 Oct 2026 08:37:40 +0200
Message-Id: <9a3912ce01cfd1205daeb13b57de47aa8f27f076.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

If dma_buf_pin() fails, iopt_map_dmabuf() replaces its error with
PTR_ERR(pages->dmabuf.exp_phys). The newly allocated pages object still
has a NULL exp_phys, so the function detaches and returns zero. Its
caller then accepts a DMA-buf pages object with no attachment.

Keep the error returned by dma_buf_pin() when unwinding the attachment.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 98c2a8027..0b32c65af 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1510,10 +1510,8 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	}
 
 	rc = dma_buf_pin(attach);
-	if (rc) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	if (rc)
 		goto err_detach;
-	}
 
 	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
 	if (IS_ERR(pages->dmabuf.exp_phys)) {
-- 
2.39.5 (Apple Git-154)


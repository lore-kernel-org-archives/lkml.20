Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285404;
	b=j7FtjsIcdGqfYLXlOqOrXO8F5OQIGNOR+3A3b8PUFNYgk8WQum/105U7UM+BEWtV8QIj
	 SJtKL3d29/d0gcl9fs25N7/CqNuV7Msc8LpKBHxhl4uVqeMC4DmsQefL158hAh5oSRmb3
	 JVeoP4mDFq5EW+3ZCKbVzqf8XHCozhl3sqOWHjMNdsj/MsCI2F2vFBj0I7Xu72Zm068rh
	 4suLLoGY25OVVV65UOmMLd96jKYRDprAoklh/nLuBlKiX/fENWR2jbYjEON79A8bEBnAY
	 qt5ujEC7K0FVuIx+CacJkPWYvr1M7mQ4SbQokUZw8gNeVssOX528EM+ZtB+es5+PKQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
	b=QFoq9PG8vEoYGPj3xis/slaXS+tuRgbWJMUB7kZNT6+pTzi46ZYzN4b2kNuXcILT91fJ
	 QPWaBSdeEap3BjvMnKYVC7NHSp+PEqVBc10WfZxWEKRkMx6WxKhIZ3rwRfCEQQPrGTo4y
	 TziuwdvDnbZqg56jzrhCIsb6Cta4yaCy9KGGvVCaJ2va+y/fEanYmOeixcFsdffepdFNd
	 c2jty6nFylMwhs55FjWdvBTgQtlEuQfi21pB44gDkQSk/F0Mrfa7OcDhx/QSv5BmJIfnM
	 CpOQVpzDv6mwpdTCcD6oGXOl31Nx3H7OwNTunKufbxWs3M7SNjifdkBuIoOkPtQXZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4+MrLOs;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65771606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65771606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4+MrLOs
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20533285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285403; x=1793890203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
        b=a4+MrLOsd9lAxrEAXdStaB2oVHOwqOXcdlUK00gbccB4ZRkS0/lcWillWoFIdBBeRN
         Ykq18IBUjeWxK7QjMws9JnzcjK+7ee5zX0WuhTYzo6KVq4uwfRalwbofTSR8F5JDgugD
         rcK//saMRXGf14fZDWzxU/4KZ8pFGJVuDrmW0DWybtMu20xLLA1kRM/CsqxQZ9/nLncZ
         ZaNFw7dDVohZyIoHnzj61MibvJPwEnzMBiFpD/zW2J7Ej4qcTA/cDNMPjuNuV4IWhOZO
         NU3joP9FIL0jNXZOOJp1es8ONPJEzm8U2S3E3pjn7w89VC83U7GefLPjUFAF2kVNQ8Wr
         RM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285403; x=1793890203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
        b=Qifr59lIhad5Sz7846RLsICJ0fv0r2qgCGlkiq61UNopQ1dbFwHXFxKoc9J6VXhkLr
         E1USpqIhWQZEhZ1uxbRIMsO3TelM7dkSngEoSKMHQS7umNO+nBl6RfH8QDev0edyATnI
         h1f4mg+KTaBeVEHhFNmn1EEpn9nMiR5c2UCnhsm3lYnPpAeFTsjtVUhWavu9y1+bl1Zl
         JhTHT2s4QhsKoeGZBj3eOdswjT6jmTHdLK7Pcr2XST4h7k6g3cVYLdNRs5d8tJ0vSFES
         mhlpNnfoT2+OybIZQYo0IHjYdCox4eo1XfdS+AmBVBv2x89mlikrDkMGNT+8S8N3LRn3
         PdrQ==
X-Forwarded-Encrypted: i=1; AKwUvBygkgLf9C2edr2S0UTlVeQHv/ebNL4KelswUddLyaMzgO49282Eqn5hHU3ruF/DEHU+zubfLLOOCP8NnSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj/3PzjX+Owg63PX60cUpDWJsdeYppWgdBmUyYQaReNPcT6tmm
	k0TvwWuLftGIYzy8bj7PDxQoIW6vLWTLaJve+sEy1G8hmGL/iWZKqHXq
X-Gm-Gg: AYBFou2CdrxElDxkydeTupY0AIllGfiz63ioF/Mpo6Ln6a8gV7VFpZ+KT3mBFaNYeDo
	EhfVX78QhUCRs3Yt4GtRxcNoI2KrS+q3ljAOFi00Arb2IUjnZlf5z04IA9nK/qOFCKAYwR9L9Ju
	xdcTOjQXdjNqOH+Z0miWLH2ytBGH5ABGkZ1JwvMop5rPlrirwNYZMEKaKe9f4VGvFwaCov3Iccq
	7ziciaA3u9XqaK4klEgkj6YiPFphjvh+VYTMtvJP7v9YSSQnncpTrep1N4HrEOLjH9bQWXB7q/Q
	Pp7lOxrkWjVGtywFwBkoh7YHzULjYW34pcXb0chifYBEca5V4/EAGdBR0uzumq8xaxakQChX60M
	jh30MydEBV4DK9/BbbTX1pcg8xcRRk3+4PSPFPdVP41toT2cfuukDe6QfeA6Crw3bys1w6TBDsQ
	vBVdPu//6J0jSU8AkLf8Q+aOrlRiy8n9f8mhNjSDXA9ewcUjbd01OieIcJp3f+kO80BSymM3Emq
	u/vcI9j7+GQsusWT7y7RI4qGcZk2vOdKzZcLWfwEUxxjZQp2Y7LAbqEwt6MkuLAQpzypDrC8kNQ
	nmbZPpDfmRkrLqH9olIgUQ/EnRN4t58lBACbCx5Y8grOLRxvZiWP
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr131784155e9.15.1793285402509;
        Thu, 29 Oct 2026 07:50:02 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([213.137.73.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f4188f4sm67280775e9.4.2026.10.29.07.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:50:02 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Javier Martin <javier.martin@vista-silicon.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] media: mx2-emmaprp: return failed buffers on bus errors
Date: Thu, 29 Oct 2026 16:49:57 +0200
Message-ID: <20261029144956.1632798-2-thnkslprpt@gmail.com>
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

emmaprp_irq() resets the PrP engine on a read or channel-2 write
bus error but leaves the source and destination buffers queued.
v4l2_m2m_job_finish() releases the job without returning either
buffer, allowing the same pair to be scheduled again.

Complete both buffers with VB2_BUF_STATE_ERROR before finishing
the job so userspace can dequeue the failed pair.

Fixes: 8091cb7d9ce6 ("[media] MEM2MEM: Add support for eMMa-PrP mem2mem operations")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 drivers/media/platform/nxp/mx2_emmaprp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index d51a621007788..f957383e8df55 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -354,6 +354,10 @@ static irqreturn_t emmaprp_irq(int irq_emma, void *data)
 		(irqst & PRP_INTR_ST_CH2WERR)) {
 			pr_err("PrP bus error occurred, this transfer is probably corrupted\n");
 			writel(PRP_CNTL_SWRST, pcdev->base_emma + PRP_CNTL);
+			v4l2_m2m_buf_done_and_job_finish(pcdev->m2m_dev,
+							 curr_ctx->fh.m2m_ctx,
+							 VB2_BUF_STATE_ERROR);
+			return IRQ_HANDLED;
 		} else if (irqst & PRP_INTR_ST_CH2B1CI) { /* buffer ready */
 			src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
 			dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0


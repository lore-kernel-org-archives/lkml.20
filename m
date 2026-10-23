Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742221;
	b=EzL3tfOEYqonhwQwZf3yrgPXu/67IMn85xdcRt9KXfWMKrLfd+ysHFTM0NED+HzxpKaN
	 k9k+39MqQDGNooUJhsuf29tiAup04M45M9xTB5zzPaX//BaBBcBUcmdvtkS2svGVUzA2i
	 6iTFaMm74BuI1cWx3S2y1OVY9VZaGyDIMSU2HzvvxisPwj48jn+1sQSfcGpwK/Lk9S6su
	 RS69ALLnnHzziu3PMf+Ehh+ifdr+V/zWpbQ8aL7CbW7n6afQee2Qx51nSpme6e0oPKg5e
	 zdxD54iEtsbn9uaHwQogAfKBeJV84OugbIcPtk/N7OzYebdAir3pOKbb2IPmGTMBmYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
	b=qP6QLQKWew0PWVyHzxnuwObcG6kY9kLMO4OmhdikiF85IlCs3AqGiqNWctMou2oibNDv
	 OwefQpLaT47VcW3aSJuacVt1nBXKqxTcrdASsyX+tfkr9XVs83cRqwoi6yVSRjfrplE8/
	 Rux6GrNlNXNznKYgvnqFkQAMk36RB8IXsBw+k9gwy8JP4zc/gtfOq90HA50ffczgYskpg
	 l1v+BKV5X0QjEb0NGXz3KsinKnkaFpF4zTTEvdNssqncT+1tgQOu/oR5ANKzIXpDbIVq+
	 +iRQ4OQ33cRQ9EqETQW2ujSsoj9nmmuzUd5RmOYxSu+cmYDqdAoJj5jjM9on8bl5T4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H4mB6t58;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265B606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D265B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H4mB6t58
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so4381245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742220; x=1793347020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=H4mB6t58pxgfP+ppNNFRv3pZRW4mTFBNw9XqK66C7GI+AimbnSEdss2FJOj0jcGELq
         XkuuKogcFKzR7GpXPz1gA+Sp93E187AIR4+mJwkBbrHOacSsQ/wxRoPKaCOJcQi2bHNT
         AMIj6PoXZuUKRj8KnjzbztOOvBNz5Kwo9DkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742220; x=1793347020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=PN+zIXL944142AvR3yhz8vwwl4TTyTvcyqNUh/k4VZHf5vdfPoEIDKw0SHjle8/jS+
         rWDj/7IAKCRLhVTgpKqyKtDf8mjVX9s9kz3QTcvkNgBEffQnM0ezOCUG/eFAyAkE1rdZ
         t7QEBpoHjTHtQO8zVSZAEgHnrADcgPNxoA4K7e6BBhZs4xw7bkHPfN7IilmuyUt2Dnzs
         0T7TTJZqUoYs2I5aAaG30IPhfpOTqFJnLG7wKTMT1lbXIzYPt4TQ2Ir/eql3HmKxbLaa
         DItGrdiRuunk4CaWuPfO/5xTfJJyWAzNfvyWSvA5mpuL8ifCoAB0CL/1TvjUAij438Qd
         pa1A==
X-Forwarded-Encrypted: i=1; AKwUvBxlg3FcwJqe27qN++/7/5zsj6rCVcj8AsZls9jJDT8E/z35jZn70ZS2wAWl9ELkB1Cji0CcRmbqul9Babs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+wU4g7rgn6U5jr/CtaaoKjUO3c0EG9sDCSYPlIZysqj3ZqEfd
	VMORSazr2ZTBCvHDoeVF8+JT4+fKwJz6iNn7bJvD/IrMO4MwwN8nKO0SnZLAN+zU+A==
X-Gm-Gg: AYBFou2bz1ENrzdi6mPaU1e1TbiZkbInsL5DBmi1QJD0dg1FpbA4WHIDBRqvsNl6dx6
	k1Y7+d3hfzRAFspzueOWV0R4znW9wTyOFtaPadSto2btYjrd0126Q/x8jq+SBIYM0ntY+5sYSvE
	S7UCkV/GimkOQSCioQzadpKHSJ0xpyclw0o++4c0AnkvXDAjZhVcsxjMmQlCenZwjDA3HHd7ENO
	sueq9Vc9t7dmpfQQAGFEbfPTT8Mhj9naAR/Xh5wIBkSFOAzuOobjiYoFZDH5G1F03/fjZerjlvA
	+PigvgZUOV82n8hroR8aGqYzoLE3F5qGBj4nfK9UjXJdcHVO8nqsQTJfttvAx7+cP4dHmvqUGH3
	QIvcI2XutArpucGgahX+QdDaIKemuCV6HzQXUNy7OgD1bMlU2Cx/1TuCzsan/gwhBy+L37D2lIm
	WXhkec1/HRe6I5YpBgmrVkBuVA8niTM8L20qQKoatey6zCfggP+O3rK4oaGzO58UrJqnn9ukhP5
	oFcp7Tc/zhG2deuWpZMjDWPR2Fasw2r1UgxmMVkRhr2XTd8OVVk5mer04rSzrsougiZFRFvVYSd
	1iS5osFke3gsrk64qNtaL56vtnQ+VyEUEXB+Y7Q=
X-Received: by 2002:a17:90b:4a92:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adce7a6682mr1200815a91.22.1792742220188;
        Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Fri, 23 Oct 2026 15:55:20 +0800
Message-ID: <20261023075642.3671805-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
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

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Remove the source buffer from the ready list and return it with
VB2_BUF_STATE_ERROR, complete the request controls, and manually
complete the media request before finishing the job. Look up the
request before the address check and log the error before returning
the buffer.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..402d20572f2d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,23 +342,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
+
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	if (!bs_src->va) {
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
 				  vb2_src->index);
+		v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		media_request_manual_complete(mreq);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
-	/* Apply request controls. */
-	mreq = vb2_src->req_obj.req;
-	if (WARN_ON(!mreq)) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
-		return;
-	}
 
+	/* Apply request controls. */
 	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
 
 	/* Keep a reference so that if the processing completes before this function
-- 
2.56.0.257.gf7497c7d27-goog


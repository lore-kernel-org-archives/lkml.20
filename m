Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70AC481FA1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390134; cv=none; b=gfmNiXKEd6dXWlY7ItkaTiLMZQBAVo3MfyikmLwSDVibrvXVP2WZfinVz519w9C0N2TTbX8ENkCSUooDlPI7Twjno6zFm8L3jb9pWE9yJYOuDrmml08VLMTs8/f1x92/m8vBV8gqk2ZamSu3EFJgQDgkKmAp/8Iwsew+xIunwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390134; c=relaxed/simple;
	bh=u/ZBF+fLtixjixloXlpeTmmNjEnLve2rGgEsj7PNjy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+GVGLRtw+dXBZmZyvPlwJEOZF/znBOPUr2SnfJBColpiDLrqy4OTy2m5BYbqX1yQ4iUfieLlqub6DcLHEaR7XFpWKQltPqKUnbBpRFKaD5e/aShZMJTUqem4+3ZM43fF7Q4EE3WlMBczRGOESiV9jfxwQBIHeEsFNnbxzDij2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P/XpDm36; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P/XpDm36"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so3243302c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390132; x=1792994932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=P/XpDm36Y47wG0qF93W1ZSvv3MHkuLQmnS6UCkWhyc9nLHu70L6Nus63xBrPTCcJxP
         hyXRIzuqEaWUlcMdeLTfCkHa0q10VPD1R14bXue2DBUAlWTyC5pRwxttrIZgiBvINYFW
         3nrzMpvvN7MsWOolOI9Jzzp/G/GQGtGyh3hJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390132; x=1792994932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=VfvMCD4neiIGxK5g8piF81kI8gAyrO01GKSJ0Z7X5efaSWVxLpG9XvtdGKU8wBfcAb
         28ru1e2cmyVd2hSrxfGhi7RI7z4WNFF44mhxjvSFweoBFbBduJZtHYUe20IG5xOpc402
         WJe+GXdHKE0ifmv9bmTT7lMbpAja0mGX7XK3C0KvEXQ0gf1WZgyTWEUeAWTZonkEGtNr
         e9xvvsZFCo8Bt7QUqSXIDxkysA8mGFI6HAVN0lwPNugK1CGg/PMtH3Xe4wupUcu1IANG
         6wicP6agAEBPpY62NiHUXTCLzJOE1nzgEdGklsAiOPpuZXWSbWeWDnoNF6pEEsSUoOm0
         oKCw==
X-Forwarded-Encrypted: i=1; AKwUvBwWtUqu6tsrWNfE9vHsDNqwOL5aYV+hh5K21cBEysATBvhBQusvS43CmW0Z01TiFE3vgXen5ges2V2/dis=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZDjv/hZFI7uTouY1bXTOsmRebNi3/TDHNgOQB0Hq0Vc4qwqBi
	8KbH9lFfzS74UmnPYwxyzenYI7AnY4Qm5dSqcydzgf80fNeqCndvyMJYmGOJflcjFD3RZtWHF2f
	Wtg4x3w==
X-Gm-Gg: AYBFou0I2xBOLT3GiiB5rC/ktyve+5nxMKmbqN2GaeQafxwZok47TNgieRLB0fNpuVU
	w27TazqkX57tTkHAPdOmwq6j5Qo2Ldjrf1quxl5Qv8wQq6x7uVkVro5gygAYu6xcUneGf0VxOHF
	KC2CdkBTiynI8iNDnk/PkssS1YYZBqfnRiBg24vUDfffoPVJwrwFBxcDp9TRU6uiPDnDAWyrLpj
	5PYeVAbFEzZh95pp8ShfSSH92Kn1UcB9hPyodhYgNvE0yT9Np0/iMnXwTDrafmj/mkrvUsKlDeO
	Jf16uqjgGEpXGqL/Q3YfZwWF6v1F8pibbcOA8Gt10pKVqb0SMS6VMP7BpKWCYn3qrSjLdHeD2Nt
	ue3cCB9oUphlXk/4uY6tuzaIBLkF0YxGa+JGzj5W1b8ZOUjgrW8TEbfq5Duy2PF+gPnz9aizcrg
	peyGNBJvY1TLLtZDerQQmRrQo2kwulwCbLiblkF3fG2YOKF85xpekpfyYu2Mq5jSRaWpgnXACJO
	AoRUDBXtDaKkIYnlkCDU0T2FzkYF36CEeHEXIY5Ol/phXKT6VcPRxu6+kruedPULQR0Eg==
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-18514a0bc6amr14145162c88.44.1792390132416;
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Mon, 19 Oct 2026 14:06:19 +0800
Message-ID: <20261019060825.4163770-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
If vb2_plane_vaddr() returns NULL because the buffer has no kernel
mapping, the worker finishes the m2m job with the buffer still at the
head of the ready list. v4l2_m2m_job_finish() then schedules the same
job again, which fails the same way, so the decoder never makes
progress.

Remove the buffer from the ready list so that the job is not scheduled
again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
back. Print the error before that, as the buffer must not be touched
once it is returned.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..a4cbb7c76998 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
 	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
 				  src_buf->vb2_buf.index);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-- 
2.56.0.176.g3575e65682-goog


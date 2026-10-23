Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742218;
	b=4oAFx0YFOwz8mR8Xggx3OlzhFDvsYI6KX8n17ynysk4jnPpEhJxdhvj1UETxhY+JwnFM
	 mCIETlxDDy0GoJfJix2ptYlzfCrU604f91hp36gZATboMxQijF+APm8n1PEIG61CACXVd
	 otU34+upvNSTO6rFToZqYDnz3ADbdD9N2qfJNrmrW1CpsJp0eJAtTwyJab/Ofz5elCsNd
	 2kt1G5GB/G+joNPdS6HenYesGU/S+9fuAeSFL5tQPsnebqmXEcv1XeR5GvV2EvmfCpwQ8
	 2cdsZQ6uLEUiLXBfgX5Nu0qldbuaZtXYnYehUrzc492Rb3gHC0RwGQuVh0YIhX/bDTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
	b=uVA0H9AY6I9w6+8KRHjfdqwqYMAkWUH3azUv9ffiODPxXn6oV8ykfssfkxP+O7TdKGHv
	 vmjyM9tJbBq6b6QFFvCrC5Z7wlHCdo4/ZMpLRhxrgAhqSee478Rj3GXxoQCISz/oiBFtF
	 qCl5rcCH4sPkaeFdQlKeb8TkOUKeWSAJSjhwu/GR3WaHaWusF3riIH9G0lEHqzgUfVYdZ
	 L3AiwH48Vzev8RARuSlLlEjBG2uY/YpezHAFwfWPuSZ8OPG5Y43g8CsldXPvmwjxoRHLv
	 yPW7OEqQDsRey/CP3SXSNQ6fJ9HyqKb420OlHVoi7JXO8dWNRFyirvpAy6kZnikaCFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jGnnObPY;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D03606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jGnnObPY
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e977109392so3085605ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742217; x=1793347017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=jGnnObPYA2oLEKIe6zozk3DBXy91jTUskWtKKiHbJCBwJYhpmAkV5XvFqcA3Xbi876
         IkzN6UCHc9ZtgCiQH1ZQrApz3B23d2tzTRBn8WVQnqRRjjvlhjumUnLJANsper8pz9CO
         ZhrtvksFHQNNUShXfZqUgd9k9fEYgiblvrGFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742217; x=1793347017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=Wlfpy2XbJCvssKMLurOJYv2fjt2eJlrm2KnCQ09slPBI1hOKh+QcFX2SG92Cd7UA71
         EQanIXQ0FHipFkq8SmY63rWoYmA9GdJYNvMX63heevsNRsHVqholawctNbIstCBTus8n
         L4MLdR4WC8OeY7zEElpMslvO+l5Fs0fSs1Rm0jsdp625fMmbvhI+eMFNj077qDMAPdO3
         77iffB2QZqpT/iVQbjU6xHCBJQcRyYXzeqvnNk6gZ5E6yqfzkEUEcXyAzKT00QO0HWoJ
         DDjFB8SZ3sY4EI4LpAHDBUkieW4Xa6zd5do80q2OhrdrCePb620gzTH3qEIdG9U6oyFd
         cLww==
X-Forwarded-Encrypted: i=1; AKwUvBwI21mCP7MYkO3d/EQtujNH+DLN7aqA12knMAvcMw1ApIvY6LIh7LVCfiqRuhLGqmEAmJqwujGyo/RHDfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkhU6/y3EnKdOMv7zPPF2nQXrPqylrXt47uAawsXNpM0+2Jn1u
	+XpkQNJGvI5QHZp1/Lc8lH+uGJSsAD7nvUOsknd4gpvq3w3mUAwnCJJmZBK9n9CUFg==
X-Gm-Gg: AYBFou0H8tR9DFjNMscgdRKR5P9uIBF1TdMKTmowCoRpaKLTkLSWU0VDRSBdcd5uEM/
	t8Ae+W3aXIAgNyye6tDEQvYqKOC1MNS7h1RpaZQjqct/2xKxkOiwpbLitZGyScKr2qniYC/7lYm
	AZmschocOU9wZGTSAIBdHDwFeGYVIjpV1M8RXdOJN5jB/HX4hJAtr7+UnJsx5ruMG5loskNJCPG
	fyDxt5FdtigkQ3TlbwaHPP7E0xTBFMGb7iphHuALTAOnFb9aFCLc0JTBcXsZTSvBKn8v0qpcbUe
	7wS+cQQa06l7DjaXlLY/wCr/S77OkUAH0noFbWTaNGY+htl1wAYQMWu8QoVcb8PB9b1Y1Sog8IK
	zwmqzpZr7suNTNgZY9N/HaKnfB+nWxnwjab2zf6x97Vhk00Wkby/T5rijezedtAPntNEpHrcIPe
	+6O/T20hLgbNIJndwsybXV2luFgHTn4vxY82Fy47V2sQou6PGIGf8/ewOXcaWqIHYkWtaJxLyoh
	F1jqCzXWXtVEixijp52FYfia+h+d+mGL/ucX46hhoihdm04MtxdA2T/zI11maP3nZh95E7orX4k
	ZJh5dBHeo4mVHboRrrgo/MnHMlCwlehuZgX2MJyne7/Xf9IgMzw2AiVwx6Co
X-Received: by 2002:a17:90b:3143:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3adce135020mr1195926a91.63.1792742217327;
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Fri, 23 Oct 2026 15:55:19 +0800
Message-ID: <20261023075642.3671805-2-fshao@chromium.org>
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

(no changes since v1)

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
2.56.0.257.gf7497c7d27-goog


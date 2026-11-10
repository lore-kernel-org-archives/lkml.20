Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295112;
	b=0s7uIqjTYwCN6ScmoGJ71+B3Zs6AKL8PazaVHqURJFjskmlIAs98euOTXkGS6UArE3Lh
	 xMeIwiX+zfNscd8+rKYcBFHxmSjSI/OXJ5SC5zoecmlPQwn5KOhOBRsqdRbSyyaDz0sHZ
	 Z1NfBscRxobJtMY2G2UN+TPAyag1Lv2dmXy7IAwUJtYcuTywSVWCvcG74FuSyScfpCj9b
	 sexhVdpzE3qgOCOW8/nqME7TcghZlRlHU+IMDWxqU2pGDSPplDphyGAhW2EHex2nv0C0X
	 mmWB/UvDYpBs/aT3tYwkZWUKAQevhooleFX5lvuV+Z1l4if+XKOvedemhxa1+O2DcVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295112;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=;
	b=VQG/fOCuIqFvtI++wfTUgjeCjfAHbqT2ZTUDk6Ht0QAa1o99RTVIST5NH+1tFIwPO45C
	 Xj1IJ1umLl6HJ/fiah8ycvex8bDJOcOZhKnQowupkp3o54PwHlfv9kjbd2AuL087dtvck
	 kimzubEx29NuG/0lYtSps6r6TdFSRMz2hkH/yAR5OjEPJ81LJTefX5LVGpZkrvZk+MKox
	 b9vuSO7I2k9/RorkXn7DOl0lOKtKTaZzCv9bg6WvAHLab1tdBujDTZtUA3G/OGHJNZKj9
	 12iQhBy9jzVkTddKSWuAQFf4PKqpstFErZH24kubPQLUMXYKllX4H835bsr27vEwYFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iItqnJb2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58F606D63E;
	Tue, 10 Nov 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iItqnJb2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=cXu1xgZF+kgpmr6ufbSneTMqBtw6IhYUpByRoRKnxZYbgh4eKNT70U7pk5h243i4o/3j
	 fR4yN3k6SlJ8dgKqdFdJq7U3x3/pT9sEqs1EEeFpAPHKaRJLUdkkUZIiw/ogqxeNg+29N
	 67j4pzVBuNYnxrisgmIwYno9j2vKA4E1JJpeBcFEjmJnwyZfmipF2bxjSlwlucF0Het8b
	 SFp9o/ncTpui27LfN7e4rRtABplBFGWjp7cpobq0HonlPmfRDPJTLlfIGDki1/cqeh9xT
	 deYM/71priL1AQoHY5IObZo8HINAxyX3xC08/IWzARAV3KFNwHISZXkZSCGwKZI/7qA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=;
	b=QOXsC/u0hyAQoejpml8+uUllPE7WRsbnGyS9dHMFsT9UOdD1S4gCkSai07KhhFxyQkVl
	 hdEBxzUq5qKCqUVeyzqsflua7IGLE/qHhRRzSd054u10sxKh8x7i/0O783DBSCgC7k7N6
	 x01qSArBzipEK0rUrvo0lNqVwlklQkN+ELbZvtbjeqU2AbIaXZPOC43PvR7dLXzrfr9Yr
	 7wcTBOEzLDQtmoJFFIYBjlLNeDFRHORxMtQoTFPJsFUYO5ygejxH0IKng/8rrLzvjrhD/
	 t/oqGFB1KHwK7/4g/TCw+wvdlhSOcARiwDDcS8BHNaUcyUM88/nqIbggySSn+OK9tlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E87081F008A5;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iItqnJb2Ts0Zy2ZnVdidJbhm8v0n2LpDVNogtmEXbYV4RI2QM+7TCSvAW/icNwKaK
	 iEj3fndZSB+rMtrEWk1YKDKd3sXEoDmp6j4utLg/lNP/pQcpfVABk/DPkBwuGzI1N5
	 rRpIRnlMikuGShuNHUeOO4rtw8509XS3HrSOESrUwQGXIgUUDjtWboN0BltxreCPh4
	 ZVHqDqTvL5jmODDTl4YRMVdN18T3E3pqDuOcFCo5usgBZIg1cKc2wlCABjfjVXS8EH
	 ozUWkzmo54FbD7qmG0ed/87yVb69Ft89lrDFD7SZCb1p1JltQPeooeE1Kh6hTpQw+4
	 jube0AG26S4cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B6DA489A9;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:31 +0000
Subject: [PATCH 2/2] media: rkvdec: vdpu381: Compress the co-located motion
 vectors of HEVC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvdec-colmv-v1-2-012b84ea43f7@gmail.com>
References: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
In-Reply-To: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=1292;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=aR2E6mm8VmFdhqxcYYQcTYrdQAfdhAGApJk/FfwVCSs=;
 b=Nvipk1pBnacMtoHPhiijMXW93iXUPSvrqtmt0lMr1tJZacZiL4eED7FMRpbuGsIKUa1Msib3t
 TFp4Pa0RMT0Duq3WRTpwMMWQ0EvjVbUxGJdFEv3Dw+olWBZPvBj1N1O
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Like for H.264, store the co-located motion vectors of HEVC frames
compressed, which the vendor code (MPP, hal_h265d_vdpu34x.c) always
does. The previous commit reserved space for the compressed layout.

On RK3588, a 24 Mbit/s 3840x2160 HEVC stream (240 frames, x265
ultrafast) decodes at 104.6 fps instead of 98.6-102.8 fps, and the
decoded frames are identical.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45b..2473c176b319 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -404,6 +404,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	/* Set HEVC mode */
 	regs->common.reg009_dec_mode.dec_mode = VDPU381_MODE_HEVC;
 
+	/* Store the co-located motion vectors compressed, as for H.264 */
+	regs->common.reg012_secondary_en.colmv_compress_en = 1;
+
 	/* Set config */
 	regs->common.reg011_important_en.buf_empty_en = 1;
 	regs->common.reg011_important_en.dec_clkgate_e = 1;

-- 
2.55.0



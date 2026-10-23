Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798714;
	b=NnUAEBlQowxAw1vH1Qj3MsTgVnOIaRd2Ljtntcm1VBSFCwjgjkPYVG5YmxxZnOVTLKaK
	 nYvzCb2GLayKhLf4EyVVofxik7Ij0qlo52mr9wKWQHXMwdGG3vu998YF9GEOpx3D+WdAV
	 3RHIkuti27N39HoROy1uPKDF+Z9XDzsubywh7GFuTG0p9fhyaiiJ9ZJbrvlTgZas3VOGS
	 2M6z+i4Nl0eXtpqLSBv97B664zj45suxTti6Yjiwc2w25IXcwQKIv6wHLZmHWbnBsBCM2
	 42457h852I/m7hL68b7+8WW5PPSPOByxaT3ttaLje40UDPSoax1cgHAQAchq6RHDbjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=dV1xxdymGwLFjdGD2rTDWGL+L+S16QJyHFeplzRBtnJfn0/hTW8nAicIG8uZW6p43INL
	 wTzBV49VR+dtzNW3dKp4iQyHgSiTjdD1h/ViGsFHY+MVQB7lSgelhcp0AVND+9APA5fRg
	 Jqm95PpM5yvZ4psjDfVn0Ndi4MQmBX+3P+jybJmCgdaiiP064+awamn8c0ib1inrmU0ZN
	 AzgrN7J7vNwGGkXloJwwWXHWGl63Dr7MqJ70ttqR/++LaVBAPWyfcXjX1aqEmpjCHYcAl
	 AP+TQ8/NGSnglryDci3FV/YfYeq24nkakBZHvKL5qStyXLR86K6NZkIxGYqowF1pn3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4UAn0Ic;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD5606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AD5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4UAn0Ic
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f55a53898cso645867b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798713; x=1793403513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=P4UAn0IcmbG4TKPL5B7PSEMxE/hzhWK30fdwhR1zlTmj50+x2j5tC0kkR1xTzVhsZ3
         cDnNBiO+Oy3rkR/NwqgWSQoV0UHc8YPQk6eNsaEQh6J4UMEtastpUQE1Vu/ylyOS2N6G
         dteJ1UBlzz5Xfuktw3yReIkvPi6sFZ8zvUaoTfVBjoAopXYHAN87/HHzryk/yWJO7X9Q
         MFMF+lArsuCIivGt/trPKNkb5fItEgvfH4ehlrNNdTQmWFDA3WH8lcOKQDMvrQaMuuYR
         kKETWRd+LOdkb4qaOKlOWrVc6so7NJz7nNePTuHLlqMF8T+l9GeviN6pN2y0ewcDb5Ws
         T+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798713; x=1793403513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=OetJAlQgw2474JE4PeP+NStB3x3aPpraAVIkSvjwdack7ih1UETyFD79t7+UC+AsNs
         EXqCdzT61zeNsyuwE3yHqyMhVh7qZO0+ofy6gA/+sO9Cfi9nAtAO76vqPpgUmAOit/c4
         EKeMtbaKGAbkiCiChRp3H7ZFyVkgT4V7ADBakquBoA0UT+3n3fe0fJ3V0RWlhpK2fjRz
         +7YSNBIIIRUOnO6YBKj+whrUZXM00abf0rARK+p0vtN07KiiM7tb4wYYhIVkVYadM/Hy
         7KwjeJbGx46hRVeH7I9sXvMPqx9yt7zAo+hNa3N15O4oR4yKMnJBRuNSY0rfn6gBLRqU
         Gypg==
X-Forwarded-Encrypted: i=1; AKwUvByuGbze0hDWDhSzmL7CXEeckT04G/wTPd6HzxBCc2rVjQv6MpPN4GTtaKFiVGN0P8sh8wPbVgpfAQc6e0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtypW9deoOfI8LOZjETwoPNzGuTSPumZy54sw1wBgDQ9erbMcY
	kpshMQaq58ei+hiXJTvRWrUF/gDEvoJVTamk4tEcO0yJKNwNmOvor3+H
X-Gm-Gg: AYBFou03P8PyGk+8hAtKFDPZgvvjyN/wWsVvvhkMQLbNds3VGqj/g5GLaQ3dTXxCUvn
	11g6945trAZSo6x+nS1VegkuGuF7MxNLwwDc3fG7IGljduRCvuhIslWUIMKEWlb42AgQaklaaZD
	0aIBX92kcSUKwj7O77yELYgDfO81epGWCywVXNAvz0e+qnitmJ9Q4tG0TzFkMMVNp+AthF7nR++
	YvmlQRmL9D+dtBYTjuqiIOvecV/P1W0ejtBt5RiltUUUma92UzFecoHFi/aqt972527HVieFSjv
	tgg1LdFVgGk8gxOc5X3Hv8FFoETQ/OZMSxFYbzYduulXLPMQc9CfQ6piAqYXH1AJHjMSRpFNFeU
	8AXYXDEMwLX5ZlETLCdYHSBMubOvTpYoVNZsN/wEabKRQY/3A6iBCUx8YLsetPX2wze1/SgYhpw
	9tPB8fZKECd0ApH2RV3YTHKp00Fp3k0dgpPv4OHz+4LIZ04zT8y4EWrdwTnvZU3kjTnN5qpyyE/
	AwzWiXrdbefPwdkdge70FNr5d289SuKaq/e5xMXktFeGt6ggJWlcvZRGqwL9kC0WlA7F0WqIUHg
	G4mwsurahe7EIrmZgIIfhLzNtMkpEhG7u/uxkaIMqEHnGh/K7PfTTRosznqkbF2XlqyJpqIrjsH
	FMuhKKY5QiymXwV/phmi28WtcEZc+dP9F+zLwqT2ddhBSE6wIomOBTi3CmSeWXTCtAqWNd10BMR
	T7n90=
X-Received: by 2002:a05:6808:c1b4:b0:4ea:b0ab:b753 with SMTP id 5614622812f47-55c0028c346mr545139b6e.50.1792798712613;
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:20 -0600
Subject: [PATCH v3 1/9] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-1-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


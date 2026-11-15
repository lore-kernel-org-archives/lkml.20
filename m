Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727194;
	b=YD6NmAKg5Jk4cHFjDcEOr+FNDZEMq6iSiSI6aa55VchPFPH4zHHp3noPAl9XUqW+/AJ3
	 GYFqfLbsPBeCHFRwEMUgerupvMgVzOWW4GHLODH5TrP4iGvq6fp3qXSpjaJyteeFL8zwF
	 +6dVhhaZIKtT8sO4QCsFTqzbzVb7DSE3/Jf1XRQy4243mVVWBDmxTYQMeWViW3bJL1yJa
	 +KoYFa2N366xRLG2TwgrariaS0m2A35efq5VIWN/M9t0eDxIaLF4RioeLG9mB/q8RraVa
	 Oqff3OQJ4MvjG0TGxuWJMq+ZPCdUh0uWiGVrhL+2D6jTFTIzeNb03bgbOtFElwSHr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
	b=rrgogjt4O0xpewH+s9irWfDiPodkYmEsigngarlCmzv2XNj8AJ6gBU1Kdhhg5LNU/UMs
	 tCy2qSVO0b1LB+dTMon/hO6IO8CIaI5qsbZw8P9KXlD5LGa5VcjwJBdP06VGqC7k+dHbN
	 iV2w80kHncmvG5PxAfL5zRXZ7bpWs5Or4JPifvu8FGauBuknel9IZEewEHQDUi/8WwKP2
	 p7szT0kP/XuTjhAL3O6Gd76jCqc5mlHVdoqb5Ki3tCi2kd1ElFPe7fva3nHwNHhUqUmpc
	 Cu4F41CnTCgcYxYM4hCjlHEX0zt3enRTYP7tqcskeioKRZTmahqWGszUPEUfq8sHiKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceYAJYjk;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936860A3825
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9936860A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceYAJYjk
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716c0217635so3515242eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727193; x=1795331993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=ceYAJYjkTQE+MYaav3vU0DXG3mM4qLnM/7WEl09HG8qfVIon/Pa2fjcGYoxVkzUJB0
         YSzh3u6CxFDsSXjM5oKN6+Lklm6zB+AxWgEielSZgXCO8U//Dw2SGyjY1h3Tu6PEQTs3
         NISiOlin3w/1Lh/8R2+ZtNnFfnf5hJ05lVbo7mf6uFOaXWgI9+ERgrZIItse+iKRWVmM
         a4Z6Tn+Mn6GYLFkWxckyqM1nOB4O5Y50OJA/nKmV+b53K/vOtp3PW8BJq5ggyxNpI1Hj
         yeaa/ydlgHLcRNwIsFAJRIXgyG44HWwNOJSDDFgVpllx6dx3XujIkbjCa3pcBIc3hxO3
         o4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727193; x=1795331993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=Qr+Qv0iq9zY4AeQJibLFCryhRJFLOnLH+Rsq09MmskFkN74lgms6DR3us6mmGQYKGc
         aB7IY8YUoBzNjttxCCM2CTHoNYuU/J6Tt3BVpMcyPvOH+PZ7GfVJcI6s9BLXHtADYdOV
         fioEfoOFIztsXMPbkrTX2g/BDRt9LpO3ZBaZvvlDSxiJ4CiFPxprb0dfRNh/SwMxg3hg
         qOqq/FMaFKHo5wXm92uaYnoxZaQJ778Ma7XtQ4MtEQQCm5Cal/0D8+dM7F8Q7U7y4tKH
         GGjNvU0097hWQOFk0GnaFqmA+PK4N8twdXEGjBWvo/WcEFlJpA06aunH+Sn7IUxSOtA4
         pQEQ==
X-Forwarded-Encrypted: i=1; AL+hErFEZ5NcurL/caJloPlmTf+dJcmOgnHwhVZOXGPAE11XTJa0xmJXldfpUWXFc4vOblUOQXx6McbzJ1dGb6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P01MnngM+BX0IlHLzOqdhn0xklYNxkmVV89utRRRPQUP2AZ3W
	/1lpv34G1enmqR9WBZWUom+UG9ztwAxhs5YWo9TCcTeAfy+HDUkbuFOU
X-Gm-Gg: AYBFou3zfF8hDptA+tlufE5lsfwfDWYKYhA+nbtOqQt0pMhrQl2F2ZKDWb0vjilX4Al
	U5d8RX1oFSqtceCn/MoF67katKbnN+jNlHYnY8pd2sWqFWZhV0KqrKuQ3spOipcs6WZdfAS/dQ7
	P9lNcog4KCUi3eubwwa1ANyDBg7SvUyOuko3G3RwaqGdzVsKWeD96yOMhoOdmFjew4QUitL3JmU
	I+q5h/poS0H8Fzk2OLy8JDG0Igc8lbG+btLo2MKGaUtqSETHbSSuYVv8GpO+J74PLaHiGC/AeIR
	71T1wsrPFK6lXx0ng4ZnDT/ug3iU01Fes0bUgHPeN3UBCN3qeXxwBpfMYgg6zfzjMt7TeKk91ks
	FUGmWK63YOjTbxmAjSKOrMH8fLBPlkhtrsYHGuzS9E71/a7whSKDt4nCbf5YKioORZ0zky+bgYf
	zchwoZkM34QkszST1cT89gRz+WS2Tdtvl54UGu2hZx8z3EXCI4tCUVOs6WQMc69JqwP5Bj4pBhU
	a2UCAGC9jLq+UWlTp6MjY3XLgf3ZsdEdv6n2W5GWrqcXGV5kE3iDWUUvejm4NAhc6e/BUUNxGlV
	RRPD3NLDDE5KcevBbT4J7/9lT7hmu26GvrEfXXLAv1cz+KiUv2yOiNQUtVWZ5WyxfcitTW9WfU2
	KbzvnUIsfTTVdUm74mKy65+3H/zOu6n0Xe+clxrnxHv6AX+i6+Dp9mzM8fFMrUCpbwtP6YAqGhd
	80DMfIGhrnuvGoztfwaM2EmcPOdyHBgnq+wZR6cP+TDffIB8lTKAg=
X-Received: by 2002:a05:6820:5604:20b0:713:da3b:9530 with SMTP id 006d021491bc7-71ab5277f0emr2419543eaf.44.1794727192611;
        Sat, 14 Nov 2026 23:19:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:42 -0700
Subject: [PATCH v7 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-9-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The controller tasklet can detach completed descriptors and invoke their
callbacks outside the channel lock. Terminating the channel does not wait
for those callbacks, and there is no device_synchronize hook. A client can
therefore reuse callback state or release its buffers after
dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Fixes: b36f09c3c441 ("dmaengine: Add transfer termination synchronization support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 56a422ba14c1..6f863fae7455 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -923,6 +923,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1290,6 +1303,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0


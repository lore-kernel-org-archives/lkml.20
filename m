Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648072;
	b=2KlduKtcFBnWng4ymAKTqFnU6O2Lc8jVhG3gsFO3sK2+/kOQdN3CssF8ciCgNubZqt77
	 eeN3UOASXQhfWnXPF+xK+BkbvEwKELW41NQbI9VacxmknczEWmKkM4U2CzWTXRP4X0dXW
	 NfYH77GIA7G+sHA+ewd1oKOTdl7McsxdkCAZpOZv43o7n5+o1km+IgMN04RtiBDtpsu97
	 0YwDVh+FQcXxHXMRc9rWt9EReNGgqn47dZzsvoCCtUKSMj7ZrQ37IzHNad9ky3uKrJnxr
	 /pPRE5KReiehkDdEpKed9BXBDGeB2FaIgIU8F4j2tXirVGEjzhxiJmGwF4Huzv2hy6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
	b=zpsbZY5CyhfgJllmK4YCNL6k2wlmSBcDK8Ur/YHBL7xAJ06naOBkqzkGF5bra5zST1Zk
	 oREmrDWZsMIjnpIaAZEJFeT8pC/q186AwsRJck9gxwXqbtQa1qlmlTZwkZ2wRBi9QIjlu
	 DtA+8v9V1ICw+mwoFwvBpeo6lDveQe89i8LVujMqiEHtDOAdnGoHE7ltdf9KZ2n9s0Dpu
	 36IP9TAQZJCy+fkHfEPFpHmv+uFJsobLwY8OvbDax/DfevgiN02ndQLvbyBW8E564jqy0
	 DrlFrxbm4iuV81SBRIPcagoKsRKJl3QS/hA9VpYpnJszgVa4WIg8EhDmfPREhbRe/kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/60DwL5";
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F56082BEA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8F56082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/60DwL5
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af81963f35so2477703b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648070; x=1794252870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
        b=w/60DwL5Y7C3vZq9JCCHjJvYFnBubeM4Rvk+gaJG4NTblKEeL1GkyQse48O3iN6sDa
         XDQKAWlKmDBsY+D57dGRX+MXPCrJch7xOvhSwy0+jpj6GQ8m1P3ZBl0QNZjxt/GdXfr9
         dZwONHCdXjfKfCaOHBp2fKyWX4flvq7+FSNrZCAzFNJRGKMc5NPbMQ6ar3cPD/Ezhno9
         WmMJY4DuZZCcEKFswANKuRuTD8ahYHpoZ27zmaIaD+lsQZR0xsEViZchVRCir3vivl3j
         ERe4Y2B1jDXd3+e1DeB7qaBCijMkuw3zEQ6O6M2akKP/71vUHUbmmHUKK3kwWoDrzAHN
         xxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648070; x=1794252870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
        b=ViedQ/rn+dr/eSfkcCBVFVxurJ/351jJUpHYqlawOL6T7xaAe4wAC5dEeTkhB6ogGH
         tSHjTe1iz+ztRjl/jSTkb5gVoU2JnEXvc61oJ1ht/9iv1Gx2neBDRMHcWaE38LzIOCGu
         zYwJb3glyOiVZ05O7FG1YCp81WcMkF9NlwPCYjB5dYT2xXk2S1iUJiZIEVJelAw/UGLw
         16dO0qV5C5ZDnmyfg4wSDtPpQwU+0a/xx0DFur20DXCNiyzmHMAfDDuoPoanY0v/pC0H
         gjmxY0Lv2VZijFPKGJNjCzpoahnqR4W/PE7fQDbtKxDB5ZH6VK+MQSIng+djKLtMAEAj
         Uf0g==
X-Forwarded-Encrypted: i=1; AKwUvBzBeDLUQdB1SZuK2Q/F+fPlC1FPZJ6JIPN9OmqtqV1xtfaGXQoiM0vfpXaPDv/aBMPN+8VnRPaBdP/NXGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDIKSaVRi1SCPOELY/jluyOzv82lLO56k9JHPMz6G05UaiPN35
	68j75w4RzC8gLW+8ZEINWByGfdyQRXJ2X6TpIoGaPfDNdNIpYi6OkmIH
X-Gm-Gg: AYBFou3JHAq6WHdctXZLTyC+I7rEUxNZbcQ3Ue6iHlQEK5zZ8EDQRtglzNZ3wxOZ0Pp
	4AWWzWJ3CpJ9/Dh4Cqzr7lDrqYqmJlygslR7pzwnypgQxFuWxTUdhlyQ1vlwyRqlmg2aHxC63N0
	OFseo8w0t6gZCMWCTGQy37q40E75Nu2bHG22iLfyIAOTNPpIL7zYAqZi/rbTgtkgbvUmdr9lHcQ
	ZJNtLxl1JvR7IMrW7hEVkOh2OHKIR4Nj/NhsFK5kteAvF1fnVqONv3DqWNTQNLiRvL1cDdht0qr
	aT7phJb+rx9oPdAbUzLH2njDmKmCLNLy4rRPr0S5ot135u9G+rp7GvCgAeHQAluvE7wLd9dCmhV
	0NuRtraZxgS/8/wgwuobTFZVtJ+31EFvUDD/McRNfuHdZudw/bUow3VeLomesBVINmjjX8om+Xg
	bmFduy69MutPLJidoCU3xo6ZdsrkXzYCUOou9gUF6pJNnphvPCrBQRa8HApoKbV//Vg2aeBJchE
	YtxWtBBbrGckr3UuPbP3gY6Pdi5UYC4L0oKrDUoZube0txBDwFoskTKUvk7NRlrmFBhHo83blmI
	j92Kn4yw2INFPdYAIfdr7wbyQ0j1A5uHkfl9vvpbFbGpsWRbOXHPrs6rZTw1TjRTRaR5Y+ebGZh
	5QmCyo0kaN8GZzKGW1XmZs3Jbl6jlMh7mMYHNNadOsiN2REPnZ0nREvP2y9woZ8kaQoPYAmtHRT
	k1mOv6D1zmDayt+JN9Zv1bSyQaCc/jgW2IoweSJZdkN5gpwyvbC4o=
X-Received: by 2002:a05:6808:5395:b0:55c:836:5955 with SMTP id 5614622812f47-5640dfcca02mr6963810b6e.44.1793648068831;
        Mon, 02 Nov 2026 11:34:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:21 -0700
Subject: [PATCH v5 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-9-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
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
index 339ca85952fa..6371b9156882 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -897,6 +897,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
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


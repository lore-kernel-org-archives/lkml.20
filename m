Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407348;
	b=V0SN5cC0bbKsO2CuKbxNA2jI/4xbjQD0l0Ay6lR9KoZfamb1lqMmoic893/HNlogKkSy
	 G2+RHIbDH4gvkRlV4GeX+UtZ1ZHA176WkLQMzwFa/sRsMVNm46TUUabhlBPcJmWoE0EM2
	 TOFuWGNZFyrfLP+Ouivbb94V/Poz7VvQx6XKi7hMJ5JMzI6KeJ72HUX3Hfg8XZj45EoxA
	 mpXa1nXbFlMT6rDMQIAr2UY+UIfVvQNGjWrjcLbUDdrDsiEdo+e59ynpju71U31cIVSrp
	 Kowvl3vdgtlkdBt6ISXVmezWt/yPmdtwIs7vF1v1oZvwIDJnW3OdUC7Wh3PvgTRT7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
	b=1c8TmHMHaXeag5LW1Xa8Epc9UM7n+adGS7nZwVwqUVqilGnW74pFWHoudl7nJIlRFmd6
	 icQImZmYy2S/heSO/HYSbde4E2e2C1ox3vUwvFbsxYHDABlaJFNPQksfDriL8bihSLesg
	 6nBJXtt25Rkmj7xLG7MGPTQ4qrG06BlEye8e1ijzaLh+vkP1jNs6EnVe5cfTQgOmQclpW
	 Z2Ze7j9ndbMymBSNe8qgwGkTm7GXb3aXrBX4mE4U43L/lSZjDbpSRWMN2R3hjFKNngz+P
	 6ieQWd2OxQ0N22tmxQQIIM+XRT6RZEXWkvPm+OFDyvonbx9grCEZEvVG8Hut2+HcSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQVXeJRK;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C60606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQVXeJRK
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a18fc7a38so531829eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407347; x=1794012147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=HQVXeJRKbHbH+PENXZA/vCBb2n2Fj8A8OXTpVl4KqYXjAGH7NmwgR/rs2vLlP5zMeQ
         zTO0FQgL3wsI0+LGyjeTt5wfgmc8U0SYkaZWc61SEYjnOsa6pid4wVYj8VdHTXYR6Eg0
         CqJkMVAPtRb1BThWTwYNdOEiPzd237Oq3ornsmLQWKzXbQ/yEP611wLzZsM1NRAd8oeQ
         UfGuMopjl0SdGxPQjVePmIBXpNgUT2Gl15O566nUHBzGIR84CdJZVCNSwbEBOcBOeX5a
         FZPimCcxZWQ987Tn4L19fBe5mGR0FeJ2dHL6FNkanrfQz70X/0hSLc3c+k6ODU3AMmwg
         L2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407347; x=1794012147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=lanRtGtV0bbxuEF3/4J5z0FOBqSGiCNO4w5PPjcRBVNvRxgkdtloUCdNEUi2ppKx0n
         pv80WhBe/DN0VTroqHb6wYwCZSdmO2dMqR7Yg6tUB59qddjFVKhwUnjYdyhGyvLWmogN
         xv47phH2jBPhmTP8hW0Ce82+SBa+Qs8QIHFDnA/9sZVWLdJjQZu2gssX7h5VmHHPbzfQ
         8fvM38ghVZQthZGkIy6bFzlew0xryt139z8Mnz7GuPzirE34eY1fAC1b2rSHfRLPC7b9
         HipBIcagUtNvW4btNRnCuoJMHw1piXDPB3CBhN7cHrD7LzHNKtAq0qYA8VUmIogDExkU
         PKDw==
X-Forwarded-Encrypted: i=1; AKwUvBxUGcFdRfTDYl70NNeZmyUvu/gonRGf3+gfx5InFgS2p3JAF0V81S5N2ShXfdSd7VpvYGxUthR5WFnSY8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCf/8mKIvDZVpOZdE3c2rwrzgz7lc+dcDDLeVpLAJZQjZ765uA
	YBvyJ0q8DfstAAohnqjwXJfpMEUp+2wokk6yk8dwMaqki8tAnOkyTodh
X-Gm-Gg: AYBFou2VG8YDIr6qfV5KYrcnwq+bt2aRxrWW9rnj6LXnLphoRGnoqOt2ViEi8cQ91Hg
	RICa3/mKzc0guy10lORHvn8k4AaJrh98FGj8eU+BSYQXQyipt+Snqfzhy38kzNUmX/z8OVP//a+
	njXGBB0ubNI0w3NuxHHnInIN70R01fVfTzqiIO/fXLeQhyymqzCQ3z3JvU/1M6ubEGsag0dxu25
	j9C2v8RnhQ4UbhCZTJV1goGKYLFLtE4h/1fUpP3kGEBDlcazGPdvt3T+CfBn4sh/3ekjSE5QAqb
	1vQF3HPjlnGc7+W4UXqZT5+oDF7G6IfUVtX9Iaufu6akfW32YPaXHmHeFtVI5pml8Pk1D6+GxZz
	MVdBChJtQjSAH5c0wCScw9KtQAPX+XWGpSpk+YTHCXa7CMq3/AE9dwi92c1HQGgAbm7Qs712PEn
	HHHRwBLoYQTS8E9JZJbB7lKXKrWR4XYg1mEgmhA/pnUnMk+rjk3/7y3KZKfr9LCvzEJPdVjXA+7
	9cT6P5EaDTwqjrC5P43QmUlkTgh19e8wglF3qO7ZB1ybsQ7A7aqgnETCmp2CYAWW0OIF6cUtHgC
	iQSZZr9j88QNfGN23YwlFrLcKGSlSttxAeM7xrBC2fDM9N2tb4FIoEIwMKC6DZbbkwSWR6cEYOw
	+XeTRY4xIfqIgSr7nX2UNjtvzyo7/6rC8LhJhA6nKUWp1xXJ/cXWcAtnD3D4oQ89rUlhe+ILEqj
	AJ58m76L5nibufAxpAzLld+TmuzKF96dABWtvj
X-Received: by 2002:a05:693c:65d1:b0:36a:3407:26ed with SMTP id 5a478bee46e88-36a4243cd68mr5338049eec.34.1793407346852;
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 1/2] tty: serial: samsung: pause the RX DMA channel in stop_rx
Date: Sat, 31 Oct 2026 00:42:16 +0000
Message-Id: <20261031004217.3340610-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004217.3340610-1-samarth.colleges@gmail.com>
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
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

In s3c24xx_serial_stop_rx(), the driver pauses dma->tx_chan before
reading the residue of the RX transfer on dma->rx_chan to determine how
many bytes have been received. Since pausing the TX channel does not
stop RX DMA, additional bytes may arrive before the RX channel is
terminated, causing them to be omitted from the data passed to the tty.
This also unnecessarily pauses an active TX transfer, which the driver
does not subsequently resume.

Pause the RX channel instead, following the existing handling in
s3c24xx_serial_rx_chars_dma() on the RX timeout path.

Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 4eeef149b..2f6c69bec 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -553,7 +553,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
 		ourport->rx_enabled = 0;
 	}
 	if (dma && dma->rx_chan) {
-		dmaengine_pause(dma->tx_chan);
+		dmaengine_pause(dma->rx_chan);
 		dma_status = dmaengine_tx_status(dma->rx_chan,
 				dma->rx_cookie, &state);
 		if (dma_status == DMA_IN_PROGRESS ||
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344721;
	b=jH6Z6ODqED6wx/er0/pNnjp6luAOkqq2eAerg45BeQ4/1EBk3KKFtr9helspX0mxgXB9
	 mqvlB66vH0sKuLnJNW5SOGGn8/ZIKPrAcIy1ZYhuDCa3+hU3cVZKwUQqi8q/MLIMtu9FQ
	 fj0VZL4eckIQxSwrFs9zdnvNjQccRMqWMxSEI8U5FwTCMcY60pPn/MQU42kttUcamx1LY
	 CItpvcKqANFAPTWurxEaVU6KiN2FfVbNfcUtbOP1JA6DG66wcEGQKV2yJFzRe/nJvXQlb
	 X5rqEeshnH69nNrir6mSuNi1S1wk3bitANp69WAe18NrRPl6ROwy4oViNeJtOc+Hoew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
	b=KWHv9p2O0pxt9De7OWUi8eVhtdiSaT2crvSUYV689YqiiibaLjJ0GHNb7UnWk/70+GN6
	 nfKc3weZ2Bteb/u0xts+s8qv0J1oHXnXrJK3ZCyeIr47K5sGyzHAQNH8hsR8ySP/FEf/0
	 75Enc5AM4I1TN7SYgjBgWrSLkiyrK0YTl3lzVAnAHX9uFf8jczV3eKaCYrxtFNIokGqFI
	 IIYMc5biYDWOyTXHOcFaP5g3cHKLQ8HXzqMsdc+Iaw/Mhw9JlwQr0H93r+PzyvTmebFDk
	 Ke+FvolXKC9pGQojB+ZIxUXzpcZ289kQWg09QV7FM4+WnNM85jSR1ekppGsPQiD/k4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="PZdH/bDB";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57722606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57722606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PZdH/bDB
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1497624eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794344719; x=1794949519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=PZdH/bDBU0lpZSlz4yodAHwL9jtp4rhFJ8Q1un4mwvO/Ewao3DxkA1kNgF5+cfG5o3
         LufBZBRx1MhkyneStZl7gy+ur90mFuYctHSOJeuoc/CscRm/3ELlZtO49Twv/eVa60LP
         Hqnk9yTRpBGM4BiBsPW15Ac9x6q6bxrizHrKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344719; x=1794949519;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=LHWwDE1RwJ/GSGFkPui1Hyom/Ke1UVl37N6a1xA7bs7zajIuucLNrGbMKMlr+Gxtph
         UIiXr9QpyqMnPgvmQASdDco6RRDspqO+F23zU9nWvDAQZljT63xIW7Z4jatU/q++K7NZ
         z5oeUQ9ysHj2JqEOGXnb67MmBaiaP8mcBu7kGBgqSS6ZvQDNDmlcyuIe6Vx0g4zYZ1Ej
         7bPBgACp4S8vknAuI/25MgadbjVgJZK1s94pG/tY231DByt+bNi0i+7jpUuu1FgV2QQx
         v0IKcai85/jXE3FPAb8RrWAyxjYDvCEnl2g44YVr4CxHPqrepLix5JETR/X+ENOkrkg7
         hvZA==
X-Forwarded-Encrypted: i=1; AL+hErFmuEgufjs46vq6a33uFVP0940ncJkLgR+1LH7XzHGUUEmVzPEMNs8q9OV3U5dH0ThKLl6Grlht0jYOHcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CYJrm+3D/8SBcU3f7PQlT57G60bGUtbAw07BTYCsLWsz8zCwf
	GW8Hg9hjNSb0VY3FH0FpCrO8gY252rILiRW2NrHXIlWrfczOkhw9MwYc8PmVBSFCNg==
X-Gm-Gg: AYBFou0yFsdZdH9W0JkUqsmhjhIaU+AuG1ZPSIxdl+wtA/EjrieWPQ8JFUfbgbne8Ua
	eW+1GcFrlGc7NsC+G2UUrlV35tRN/636AEfFMlrFcezFbfWiWCEDFt4/zyC0Uk/eANxYNr4dCOf
	fQouAGO7VpEL/O40lMHvUhiw2n0fEi46ELVrxtLZqBCrHCubfNJayWR2NYsvFsjtFd5BZ7pLltI
	t9R3cAHLdUsw+owgpBqXxMJ0K8RtWxqtmtu6fkXCAERI14f1E4hCAt+4uyqIF18omnN7Cj7iaBz
	F+HMtrITMJF85r+lh0shJ7pHs5m/SNuEPwaMRqLI50b7Fb2Fx3xSpfBHvyhk0BAiXrL/BHH+mUe
	+yoKkkkpeWqbWVCvYiTBBnpj+eRl8NeIBiLl5tF+GaT3CZFl5zeVBoiLXLbbV4+nHSDTqLO2B3t
	/NDeve8dLaJ6awMFCn6eXGLgp1n3E23bsUri9FcVWHWUcPM1gXzXv67VchHIV073drOlVxgapxh
	317QKqeV0rVZ7wkbuW1x4Diove9ay58+XJ0DjDHRZC3t8KqI3NSvtIrSIO5foNIPfN/gpqfR/6z
	Z9EF3t8oaELltFybJU599x3C0jm4goCSgSjNSaRgg/QFomPeRnH1mvbsLI8LFbGJmk9AeFTuwSb
	+rUn+w8djAzrKBe5qCVb0qZTxINifEAiwXz+ykg==
X-Received: by 2002:a05:6820:c44a:20b0:6d9:979e:22ad with SMTP id 006d021491bc7-71917934e44mr119108eaf.54.1794344719257;
        Tue, 10 Nov 2026 13:05:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (57.128.170.34.bc.googleusercontent.com. [34.170.128.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb62443sm2856553a34.6.2026.11.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:17 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v11 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Tue, 10 Nov 2026 14:05:14 -0700
Message-ID: <20261110210514.1091741-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com> <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 09, 2026 at 09:00:22PM -0700, James Hilliard wrote:
> After one second of unsuccessful pause retries, stop the transfer with
> dmaengine_terminate_sync() outside the port lock. An indefinite wait could
> otherwise leave a request/response peer waiting for data that is stuck in
> a partial DMA buffer. Report that recovery discards the pending payload:
> without a stable residue it cannot safely be copied. Keep rx_running,
> rx_pause_pending and rx_terminating set until termination has stopped DMA
> and drained its callbacks. Then restore receive handling and allow another
> DMA descriptor, without latching a permanent PIO fallback for a pause
> timeout. This trades the stalled transfer's data for continued reception.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

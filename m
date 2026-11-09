Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241302;
	b=TkSTIZZg55vOkClmjope+0fhdGmtA0xmvGcPHvuUnJMn2QNCbLjvR0i+sKTsUnBSV5wn
	 9TNh2eZYBW5VHmLWSDuFIpu3OIFDnBz3raz4qSQe/7pd4aQusNwjrwrk1odotgVPJyZqk
	 YKZR5UDMgMr4Yp6kIvJHWg3ZXp5JBokuHuH2wA2W2C3oJC+nY9mTZDDuNTPRIva62LUpw
	 BBdwnh/T+aQmwPQCaR8c6sh4k1uHZUXLTfXuHq4cUP1v8hMMg79Xw7rhbuKGFD9mEalZV
	 50W5UWDfK0g1E4yqyYy4HAQLsSIwMjrcydGLxUp+s9JF9uTvoGyhCRDRKVVITZNHkQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=KhDddEoBIhoyoN7s63YuvZYv3ulbN4+R1b3xKE4PIyFSo9M6kw1m4LswF2VIOdj9ley3
	 xGY0Scls5Btm0z2sEAnSpoHF9Ntj2PwS23xAUkMUPJZbDt45f2/7pbUCA3I0MS0eW9vDK
	 Tgs0AVtA5bK1hZsRuAQ7veprWFr/1s191dGPy1fqdzUgcXtZIiICqffp7Ht3zgNIejFyN
	 LoAYRp3cZM7u80mxJM9f/aO+UN6/Zwqw1dUkHDyYF4ffYYFVdk72Pk0fkp8TPgMAW4k8Y
	 k9ZRtc8M7q9VWSjsUCjUSoX1egVgPXnvQJUE4weoc2dqISTM+cnFUYDWKSKzLKi8qYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BYUY8iUp;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B8606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6B8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BYUY8iUp
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a85c656c58so727118fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794241300; x=1794846100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=BYUY8iUpoxJgXZvZRp6w1aavyM9A0ceNhMCb3GG+Imdaio8Mv3jFnLEGzoeNCZ7p5N
         g1X4197QMDdpQQ5f/IoXf3xJJx/VNN1+ADO+vIkqjpfL6ZUs43s8PLxfE0gWS6xHSJZH
         AJjMa/9vyARtwnThslbLsg0L+IG7+amY8DQyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241300; x=1794846100;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=rMpxe6YR1ZVNzxxTW8OadxS+GVppa0+qza0NP9+Unop5N1BcsrJ4jmK1k3lrm10QzF
         z+PogeM4Fo8zPy+4dbGIADa+0ZEgXfVMg079VBpFGnvdlSl8zj1qOWS8uGL+mEoxISfc
         Z/dGDGF2VtdnlOb06bBunkJZoRqHcH6m709aANLfhp8jVZlpxJ8mHSTjkvNatLPYcA9f
         r/fUtB99vgY9N35zf8e8H3+X+XfD+K1SG0ECXofQ2ekq8bJLwNybkz1SAToDPKtjal0t
         5uUkgjnczbyfJBEax0OD26ojqNnNjH4/EruQThWHfKV++N+4QWckonQAa3WXzYbAXjqm
         8ZhQ==
X-Forwarded-Encrypted: i=1; AL+hErFoLuwWT6SPKrmr4V0XtUzj5XkGyVEgyarNjf7QCCnci4PARPAR9f0q+BIFH9NLfvk38wBan631rkO0QFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Daho03SbvieYsNSsqPtfjrS1shtZNKvhV27PWjt4D1Zyled49
	Jwt0jldtTfQuhkytk+WSP0MV0Mc4MlFobVKtnUbTaJdCrgAwsIbIitXMKudqb7EBDg==
X-Gm-Gg: AYBFou2JrLfMdrj9qofNU/0mJPtngtWNwo4qHOObKtoknzLbB6lZn6c+pOCKzWZhGpZ
	iJz40UvrJlyFFaZhpoMgEYR0SLJjckZU+ELKeezt7WptguQUureb4Xky+68n+n3m9tLuKNhlN8P
	XIUaA8Rd3PMluQTFmj/5hkRtM5WsGKSYAJ97AU2cKQRi5scBIxhsyxVAhF55vU62xiTR3BRXgnt
	YB5cFVCZKxsmmcySKTB0+ZOcZpWdo8D3+hP/4/W6uOOPFl78zsf16IOXmm+vGGpJDC7natJVsi1
	4pCchsVHKEEoB84bcOokrfPH9IEOuWrA98v2pKncsePq7QCRMxhfUha+O/CS8ShjdVAEziY0Ebk
	Xx7ZaIyLKb/1/yA3E7l8JG4Y1cVv5ibzS7Zmvtw/24dprvzi2Zq5qdUz1SGAIrmXIDR9PkWMsIk
	36UewL1wCD9hc7fbIiIgZUMaN6ilA0yDd+oDcOOS1eAGL7/HhD9rBoUnV6xGIgh+QDbuZ+ScNuS
	MNmcSRBdf7u3X8T6OP3aO4qP4bhAkvMj5Zr4/uAM5+XqdyKR8QG4eDNTi5MsLokHI6iGvXnv++s
	lGkSRFtKnV+EA3lEtj+sf6o7re0IMHdjWqbmHjzz3gamnK6j2omf0heeM5y29Uh8NUd/NEBbTN7
	9694aNfiOdGBCFeOYq3RxCEXImLMnNQ2PdZjv
X-Received: by 2002:a05:6871:3321:b0:4ad:2386:45ca with SMTP id 586e51a60fabf-4adecba6a5bmr2379052fac.55.1794241300604;
        Mon, 09 Nov 2026 08:21:40 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade694062csm5510676fac.8.2026.11.09.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:39 -0800 (PST)
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
Subject: Re: [PATCH v10 8/8] serial: 8250: retain DMA resources when termination fails
Date: Mon,  9 Nov 2026 09:21:35 -0700
Message-ID: <20261109162135.906262-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com> <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
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

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

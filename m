Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660910;
	b=K4QNikb4EUw+OFRONLcX7Lfy2muS4tRi7ilU6xIXSc/jbzHXWZZZ4vEbH6w19v0sF6ym
	 /LXhHc/Lt9tDOyVVYhH1s37EXU+UumdxIR5/qXk+E9mylJtQhdva/ko+HkFLZ8Mo46NrJ
	 2PzLuXWl4rEMrUfzaQp+bYTec/cm/vl4GCK1N/prUEsBMKko4g9rnZjPqTGDeBpt8dydS
	 yGjpQ7FlgUuWnS8fHAajlw30iCO/YR2AvycwTrxYv5y7r1TzJaa8EcUUin/ER9LCa3nY6
	 ONIgiD79BVcUY8Ban/Ng9dr2y2XWnGCjQrET5rlM6XZNxX56Ib4uD801rzXTP+gSlMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=;
	b=YYb8Z6I07WcKZzMog4uRLyA3ze2urMh4Fa4ihZwS7kHa2KsOFkTZitBmUkvFH0DQhR0Z
	 Q3f6G5WHEhDhAS9xh0RSd+Ohd4roVQwdfwFZnNwdPXfl2jVc9oZqsxyu2VarMt94bykqE
	 gS6UJIYj15YZo+SvPiRBjwpclIUz2TOYPK8K/1c6jgJo0fl6VTS/HI7pUS2gXSH396sB0
	 NWhLojQ3FhgxL717KC4JGhYHCWvzkiyXcirSrBjADOpFtEyTQTzGorFgRGkRYEhRBiTjo
	 tuiqCzM1OvK0+4ITphplbxhMCzoPPZz0lt0CvD3FhzkTs1yOgEi/X3gPatBR/1DU/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="PJ3Q6Ow/";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA9606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=PJ3Q6Ow/
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f6295304dso1639023eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794660909; x=1795265709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=;
        b=PJ3Q6Ow/yGYfFa7Vm+cSR4ycIax/mRn1SybqO76yWhPktwr8NBG0e+5alDCSfdnWUR
         rQlyYxmqLAZnSeJnfPLTknFFvvXuODjEWtE5LwD61dVRfEUhyhK09njJoCIed8hviEms
         35g8877IO3ATyTgwYEavO9vOyg+fuZkp4KOdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660909; x=1795265709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=;
        b=KtjVG+5CFZqPrVuOTXwAdNKwHJQIlAuvZk7YUvBFBEQrIASfhN4w2kNsnlcqwmIDub
         Ixmq09DPSfTNfSz3mpawPE9/VZoSDXmoNqfeRAH8+lGpoTmO63L9xEhps+dYyoFSZtw3
         23PmwQzl7ntJxR6WjqVJ1cp/i2CuDWN4CHaJs8g58vIKJw62chkTrnfBxK1NIUHiEJ+U
         1rgAwPs3fjeFbGdMcON0vP+esIkuDFBMe48NIE932M7k4aafp2wEGAGX/Ts6MrfrHSdt
         rDNv+iMmCf2anMZ5gTcjxgoDon46NOhy+xI7rBdlXtxVtMbky9D0OwzKt6TAGHHd441T
         j1Mw==
X-Forwarded-Encrypted: i=1; AL+hErHBH1nAImKemetbgY1WKN4she88PzV4ECxdK25KQinVm9eSAbKNvWh5L/CdAPI46jfGKdsBxjJiukoussA=@vger.kernel.org
X-Gm-Message-State: APuU4Z87NQx8cs4BFogQvpjMxe+37DzZdeDr8dZjmaioH+v70CmHEq7S
	dT1PC2q9gcCbbz2RCOqnMgfkhMXlFaFm721sPxz7gwKuo/GjwIEd4Uyy7EbqB/39hD4=
X-Gm-Gg: AYBFou2m+Hor5vSX2K6skY+KSMBJLG9W/j6UWQiz2f8PsjIaQjLhEBtI8ApSnX0vdp5
	vXdI9ev0XHewt8DQgeTPQJSGJf5ivem6vybKsmMWgjvNbxIO0WBMenc4tUMpk8mche2O7xUSGPx
	bCtS4I8DHRZFUv4g2HHtEXr5LMFy5v3/EN8ZV4p3xv4mbnwEkDBQb8aQdNF/amPOr2ve1FxT6Ck
	onQqqw4+RhS9vrR6TFB361lUUaqJLCyfmqs4iDOac6p1zAy4gyh6s/doXdM+JOi48Gt5gYP8BlL
	lXYyCU1tNIzab8kCBjxZDu2Sdd+42rQRCVC6wraMN5PnUhmSEXiniK3igRsrzzSQfVIyZD8+hhJ
	YiLcSjmHlk6NAUI9M09RC4gV4cCEsAz1W+8kxKH1E+jyzZZ9S5dsPyTivdYT1udhM7B4kR5ZoV7
	52UAHoAax0RyBRLw1pB8bVrAl2Tneipp/BB8WwSMH2Ogof4iybDlIBl6lF6kPXRNo85XetWWGSi
	1JM5QDIg434DaFvQEXAm9EL5lnl1qBZU5Odt2KGUv++kTFlso8nyGeD4VIO3DXF21ATkflbGwEd
	Dv1dAkFb1PYA/3q5SAerHFVjpyik6l93AgE3s0gSqadmLgBTBXKAGGvhhGqQrNyHqZZ84UBbqJK
	eHLH7IHRWcjlJ
X-Received: by 2002:a05:7301:1528:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-37966d4077dmr4508914eec.26.1794660909271;
        Sat, 14 Nov 2026 04:55:09 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm15904809eec.6.2026.11.14.04.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:55:08 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de,
	finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] pmdomain: rockchip: switch off the subdomains of a regulator domain at probe
Date: Sat, 14 Nov 2026 21:54:53 +0900
Message-ID: <20261114125459.10030-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com> <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
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

On Sat, Nov 14, 2026 at 04:04:59PM +1300, Jiaxing Hu wrote:
> Mark a regulator domain and every domain below it as off when it is
> added, and once the subtree is complete, switch it off from the leaves
> up. If a subdomain fails to switch off, leave its parents on and warn.

This also changes probe on RK3588, where npu, gpu and vcodec are
regulator domains, so I booted it on a ROCK 5B+ (backported to 7.2).
It boots as before: the NPU and GPU work, the video codecs probe, and
there are no new warnings.

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, ROCK 5B+

Thanks,
Sidong

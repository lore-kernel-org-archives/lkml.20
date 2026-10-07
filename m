Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37386427A04
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363280; cv=none; b=tYOwc+MmxenMzPcTQT2d3y1HQqw1PP/AxH85n1GSC0pOOgnTheALarKtxrb5Gv2qZa+cAVcV2138YIknfY26EU+Pm6X9OemiMYBYAZoRNUh0WWYgctbV3Q4EjuAgLAleGMHQhQ5jkxjhEvXTb7GOZt+ZoCIpTIAWKoABUlPB8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363280; c=relaxed/simple;
	bh=ns5/UMhLGw+gH1o3rceBplxKe2Bd6QRnvxxVs9U2EY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TNhnQpSmyt8xNRxnUuHhW8zYlEXA5wLglHLFqW1vxYVNK04f6t/ZkElM5WICO14dgmw4UgTY7cF7HSFKKtyDtLY3xxHnbkpo5FbmbXZvUrD9fqix6N+QXXrupcv+SQC/AzLUhq7fvG1RzExBHjmJCWBuq1hr1/2TK11u3TelqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ERHFbE6V; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ERHFbE6V"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso36728015e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363277; x=1791968077; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=ERHFbE6V1+V/7VOdb1ufLNWhqdmMi/ZZmRNdq8Uk87mYA6D/Usafy2JxF+pgfZmZan
         AineRSrkWlAew5VIfIiwgRR8T7fycBN/YAIkSXH2y89euS/CmzewIE2wYT/3RC/+/Msu
         y+PPyue6d1wnkAejn0wg7epoDyxjmHHveXhsl2vDw4vKuIsUGWW2UU4XFdAVNLsXbm5k
         JGX9w5idpyYFEV5KfOHelBVOieVU2THKbI7ji+y1eVF3ZCAe07qPcEmnXBfDOcpJ3Dhv
         HXGAtec1XdKMxZZj4Hd2jF+/PeCC1QAZoQD77QWDampIkt/v3BXOPLUNQVjSbyllxQ6A
         WVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363277; x=1791968077;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=cyuvtQp1KaFXW9p2bBmrKP6TCJ0AtLgEhy1QQQ4BDHRTOUBWqIl1ZjWNRFcCSA/OwO
         /vfmLKSvZm6GLUIBwgyidJThAbLzQXES9J9E/LtOVh21qWpmASveDJLlcBdIY5FD0+Z6
         v1q6bDJdSKGwWao6NjdFXk2Fd79EpN2YU6MpLQ3e0f3BV9Fc3mRDx2Y3tI9AsanaO1nn
         6o/vEA0sAUkf+sgQ57em8v5AvwMOYWKGIDz45/wXTZtOD9DAo3IgvGe1Nn3kCzTprwQe
         U+BtXJQ180RSaOjQuXPZU5PFkc9Mo3CtzwQyNM6PaCTdiJHbKEJVA4rb0dwBosOm/YBT
         tMmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgqe5MQExlhxR8CCEGOLVAahoTRzmc4yOP7QIugKLtvlQvkHPELqPilFYHR1tP64f/P0N79uLrHq6kPeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++khtXFzkgz782A4duXTBLxP/h95PWlEZsN/WkHgrFYls+waS6xE
	cmUeHBvlYuNMCkuAUc4Ni28h9JG64MFlpVkWyJDyE/+PWc5KfsP/vzPozQdXk8FpMw4=
X-Gm-Gg: AYBFou3Ria+esR+mjBlCXTlMkejyK3Y5qtCaQcqYinDFJ2AddlAjfRABifUJ/x3X0mr
	pKu675rxr41RWTjlwvxOzHJ1xCwV4EV+fwqa+0zWWffAqiH/PfU4/Hn2ez6cP/Hv8RXgpu/rZPq
	Oo29T5MoKMp1Dj/XsKbpeX/pK7itpTi6Mz4iqEOOosdCZ2X1ZPiRql29gDIzWUpDKxkFJAq44lp
	uVEBePFV2KaWPDxDTtBmfy9tqNd/CM5xjv24LEyRK70PIa4L+Oq4W0UhMw4rkRazVcq9tYfQpMX
	leVvXKyM9VUf3pUnmThQahaFMtnop/ZSqdMp56kg3cT7SUs84chxXrZNX1Z9cQxjcd2ep/UDCYn
	4rE8UdZQfJ81/T/TLvqulfy5PTnNaohGV69NkG3R2WYB5aD4KCEL4LDrM3s8Jb2IrjGxjz3OHl1
	56JANcNkeYHPoLZ8gw7/Fhm1jxCKMO9s3UwlObJCURxyZgbzgNbCefurX03LNpdSHzzGTBParRG
	xGGkBwGp56B7Fw=
X-Received: by 2002:a05:600c:1551:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1804436c7mr20240445e9.16.1791363277470;
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5df75sm119201005e9.15.2026.10.07.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
In-Reply-To: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-7-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:54:35 +0200
Message-ID: <1jwlrtyjp0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.
>
> What's missing after this to get capture support working is to connect a
> capture capable codec to the SoC. For example to test these changes an
> NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
> custom hat board.
>
> The following additions/overlay are required on top of
> 'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:
>
>     &sound {
>             audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";
>
>             dai-link-1 {
>                     codec-1 {
>                             sound-dai = <&sgtl5000>;
>                     };
>             };
>
>             dai-link-3 {
>                     sound-dai = <&audin 0>;
>             };
>     };
>
>     &audin {
>             status = "okay";
>     };
>
> Then, from userspace:
>
>     $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
>     $ arecord -l  # find the "FIFO Capture" device
>     $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

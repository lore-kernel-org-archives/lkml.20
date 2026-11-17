Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913842;
	b=0kiY1vttYlhmShkodZQi0Esgelusbfxekop651VgahqCk28zNnKIonTcFeSawCqkNJRd
	 v1mzrAsXwRNpw5eejF3/lPbq/rMT4eg77lqUWQZRXqttKEevQ5kj7f2I2AcdkXzVCaGOk
	 ogrfxlIQsAWHNrUiy8jx7wM9hMIZnDwauW3O4UsK7hbaHlGPPTP9UbxZq2+6ggckHIVW3
	 CBqlgMe10VwDEjVgJPjB6P0MoqpR8uBo7+I7vUPf6Tal+cLVWsesYPRLffKeFolyI6I84
	 CKGy3kEXm85n/PfaM3uIpFUITZJ0du9bFixK0bT3dUP3e7ABzpIbahy2TvYOClJHQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913842;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ahM/P/idi1IClfIdMjJVwjzYB76O8a82NQvzY5p1FKI=;
	b=ZfAy5piNhw5Tqm4F4RfYhI0kxqYWGRFS0ZF4DCoBKif6gUtZ0ddgsYXdjhri1A8iDo89
	 iD6WClk0AM+bfjnbwmWZXQAkSDt1l9Xj6GPO1B46WnEUi2jIFZ46XKpKsCEUr5uD2DPG7
	 IjrWxmjujNtx6Dq14nun9KNHwCw6Okzjc1ImSVVpdkUCQBWunjNNt6ZgkExovtibvCvAH
	 S/IZRO4ZbfhNXOgUBLWaGy7+wlNtzXCyVt6SR+R6YoOomXKV9iC63sfYNxiqRZFnC5P8m
	 4cQi5ry2AjL05ztvJ4OXCfLLXuBBf8FyL9AMf0vAWZEoqbC0jdJtnbZPghnJhRkuyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lcoA3U+t;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C3606A31C;
	Tue, 17 Nov 2026 11:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lcoA3U+t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913840;
	bh=TsYVa8isDVataCZgNzSJYbWDvnoB0Lq+O1qTliUZPco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lcoA3U+teuYzs2jPvFXgWSwLi96f5Dn7/ylXITEs6Lo19EEPT+wJt6/uztcAR22BG
	 +KI+EEyoncZOoAzhnny98sf+OBaCvyHLEvuam5WS3VjCUK5aira2qhdv4LmhGgUnkc
	 UOcwJsFofIScApVAlIrsaCeA4HHvqEUomYvvl1VQTWcidsmKkBRc413NkyP64HSPro
	 UP7qhzP6LRoI7iVyIkxCzXrx9NFaZ0jU7ho7Lgba2E5s2gEuzbrEN0w7k5cDX/RGmA
	 rlHB3DvCpLg0s4LT7WdQ0zf27JWbBvXIbF5KQSuC5Zpy2cuZw68nmWqcjuCUUL9qmz
	 Mt42friiwnmwA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3F5717E07F6;
	Tue, 17 Nov 2026 12:10:39 +0100 (CET)
Message-ID: <7bde7e86-3b4f-4f76-9d6e-0a98216ce740@collabora.com>
Date: Tue, 17 Nov 2026 12:10:39 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 21:59, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


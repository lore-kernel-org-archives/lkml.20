Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808400;
	b=g4/33HYxjmA754mTiTLcrXSCFzFPG9nPMvQFr59eT+y0s9mMj5iS+k+2fSymtR8DwG+6
	 e1i9e2R1A416KYWdol5Pnl3skBIBTpKunRrvruZHV5dYpwwd+9V7ulFBTaoUmEtKiOhwH
	 McGblO8GIZNnGf0RLWSQ7lzf4UI6Myh4NGX9on9jn6mUiNGkcMV6Vhwo09AtKUcqOrIQk
	 bIHVoyjxaR1haLu6nZYOxMuPDyqTip0+Ui7Htp4DNq3GZqkur+FHOxRDrx2Y+l3qOPrzr
	 rEYJJzHvI6fMVEr5nlDiXvBXZFKvkmw0a/g2y6TGflx62fYMV+ciOIOA0ypykOKyKtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808400;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eOwVzLDlfkSi0YjT0f74v9O8KdDB1ij1EtqULwicacE=;
	b=LX1alAm5Bt4R6ki47oJfrJUsOgs5egaQlUg/adkgO/FyH5+VSI91cSj3fdABOTmPZ0mq
	 bNMKxg3qo1Z/CxfC/VR9AQ+I/BvX1tXvd5NJ15Ojhs5qJbo/ahNlzWIBbaQlQS8OSpylz
	 iuKiv1kUSZjylVafrt+hOAnzgtLgOGQmI6xQZ9jzM0VVBe25hyB8KpPKaERc8ww+cDPZh
	 BxyYGP42ngqVFZ9gtMSGAeUk/i57Cut5w7w25sb3A845f5FpXr1gLxrFz92H+tzfhkoIm
	 I7GKOASRzhdTQSTH/YdKp62ar6pYpurkcJtZLHCJxjdN7WNpYOgplrS5DtoNiw1zZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=TwOO+z+j;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=TwOO+z+j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uD+FCsVNWp52CztDUUMpqbHdeuM/UhgnchIo9AuSFIo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794808396; v=1; x=1795413196;
 b=TwOO+z+jKYjM86XFMVDXDuL2cjaE82pQmDTN7JRQrB02YFu7dIb8e4k/sGM/XZZoe2nThUPv
 sBUCtpqbYjG/nkvdoS4IHupxsrUjA0zliRA9Miewb42NRHwwPcwX9uF3veOzM47oxdwQ+wzYbdO
 5nP+4ae/Jqhi8z2UqQgT8lGk1mG6cA9tL6yqLL+ROyxkRVoNCi3+RG35o43dw/ZoeY46oVqWd7D
 Z5jbfjz+IcfHkrRBtfL8dSv8UgTM4pO48Bt/o1cn1CWnrLaAE8IQvEOCfhNvRa+GC1ueD+eH9fE
 YICScMx6KwoVq4yNSd1Sf04lPnZeZaheFhDZ/z+8Id0bQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dc7e3a2922be0e4a;
	Mon, 16 Nov 2026 05:53:16 +0000
X-Mizu-Trace-ID: dc7e3a2922be0e4a
X-Migadu-Flow: FLOW_OUT
Message-ID: <fc99d887-dabe-4461-906e-c40fed5d1889@packett.cool>
Date: Mon, 16 Nov 2026 02:53:11 -0300
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
 <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/26 12:49 AM, Bjorn Andersson wrote:
> The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
> Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
> CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
> of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0,
> 2.5Gb Ethernet, three USB Type-C ports, four USB Type-A ports, and HDMI
> output.
>
> The HDMI output is driven by the eDP output through a PS195 HDMI
> converter. The four USB Type-A ports are connected to a GL3590 USB Hub,
> on one of the USB MP ports. The Ethernet controller is attached on PCIe.
>
> Introduce the DeviceTree for this board.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> [..]
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hid@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> [..]

Where's an onboard i2c keyboard physically located on a desktop mini-PC? o.0


~val


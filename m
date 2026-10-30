Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373027;
	b=bOrhOzNloNogVevuC1Pj3yAwsETGd/xRTOk/hjEppF68jltkvvcsAdN7h7mn9thZK0+V
	 L+Tqk7NgCgbpOjMwdXb3xOaHBXAuNdfTpG2mHATI5J5Z2CCuwCepixm0Lz5Ie2Xav9IwM
	 ED7/+PFkm4Rc5bR5Nr84bK8XtO3nkslQWbm2GXmLpuD8qoj12jNbHMN+/LDg4CVK7joGZ
	 InIZh93O0E3rIBq43n68P5id1Aae9V2A6KNJ6kSIDQejcQ0qZOKWbhrMZNFVhLcHhR/Zg
	 Z7Ifv68M1yAAPatBLUoW/LKhhsEMxfo2j5BdX1Xb1nnSSemZm7ALzHeo0Fp0oZ9tVqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373027;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=;
	b=jtjHFWEtUMMbxp071CnB2NUUcRL2qMR8WWPaqy/5Ea0wGs5JZN+yqTQO9OPPn8jj6a2s
	 XG4A+4BSBuWfJ8JQclYVKZaUKdRI8vmhA6gnNdHlo7KgC8yL+5QnohNtTBgLzwbLYhyXn
	 pHgDhwxXMurbQSxBlqyM+WgFNX3m2RII0Doc0TfHjlmtaVmLjeyNPE40EIRS97AkZlYvo
	 10f0jU+bB7eUUe2uAVYk4jhPxkIgHdxfk0DTJj9GKwSTT4zL16kej5BXkr/SB6nDvo2UA
	 7qFcp6iG5u3sayEuntYGQ21OCK0UbKKns5W8D5m4ruTcpBx3+ccKiVTdbdsRdLZOsCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RjVIgmCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAB606A322;
	Fri, 30 Oct 2026 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EAB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RjVIgmCE
ARC-Seal: i=1; a=rsa-sha256; t=1793373005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l2OyCf0tiJGeMLyKQmnA/k2lxLUpwrcd2F0ZIhifaSwLHHwqO2KwHSNcEFQpMaHNlYXTTJmdI4iXw7+aD3N2MvLd5y0Y8iO8ZnnjGYh0DyLnD9faRyAY6x3awEiSP477+CaGgqH9vDi5HkTsQ0hCFI9IowA8iq6Z/gd3C6b5ofc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793373005; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; 
	b=PcEaetO0knlMfJket7z8i/SkBEKduaSB3zdNn06toYxnhktOvh4EG9Inp3qU4HlaU8CxLTFnAfKAQSi0R0jnaMYv5aBjPreHyesqyo5IPJVLkbtUxTVCj71A88bAh/EA38pKCble0x+fSCThZ1r++s5lYbd4RkZZtr3loVMxAMU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=RjVIgmCEUVFEGqO23Co1WdR+lY69arY5m0Q8U+3SjKSU/Brnadrsm7sYS17Iw9KScewwqMR0KLb05GRdukcIsbITDeUsSNpJfH97wpAkA46COQoNUJUjgQUeauPSSTX96wUwBg7tWlK24Q7A4ly+XwJXKtCxl/HgNyfg3+eOS20=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1793373003647307.92338041764765; Fri, 30 Oct 2026 08:10:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:10:03 -0400
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <wbieganski@baylibre.com>
Cc: <zhentao.guo@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
In-Reply-To: <179337024629.131241.9227206619077693683.b4-reply@b4>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com> <179337024629.131241.9227206619077693683.b4-reply@b4>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi,


---- Le ven., 30 oct. 2026 10:24:06 -0400 wbieganski@baylibre.com a =C3=A9c=
rit ----


> Hi,
> I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
> 'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.


That reminded me, is that firmware in linux-firmware?


Nicolas

>
> RAW NV12 frames at the decoder output were visually OK across typical
> resolutions and H.264 profiles (main, high, baseline) with and without
> B-frames in the stream, also with I-frames only streams. I used Gstreamer=
's
> (ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
> buffering (on the capture queue only). Input bitstreams where
> FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.
>
> Decoder (and the output) remained stable with simulated (non key) frame
> drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
> filter).
>
> The performance at max resolution, tested with 'filesrc ! parsebin !
> v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
> outputted frames divided by the total execution time).
>
> Tested-by: Wojciech Biega=C5=84ski
>

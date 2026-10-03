Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D22E736F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034504; cv=none; b=lKRRPt2VkLMkIkQZqUQBnuP4BV8xcM/qkMyn0hn/3FbBN1JOQqVtGhr03hM3rQEJs4sxK3O4aUChEJWrG+eQh/zlB+9sJe8GamnB01TDaRz6ElfaKf6hazBf0X/0T9QehkD40LFhM7W7taq8GXSGTcc4j0G1h5T5sb+An1EaBdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034504; c=relaxed/simple;
	bh=C1SoZRWMm9QQUHCO+0Fst8MvFhjfBGxqT/CM1AD9+KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5q4n/zqje2TOCC1r3p4htKsdHvU6u1t2DzOz8F63iO9vonppcmJ8hjEkfmQSSo7Pcfa9k5kJ71mn13g8Xy0+qZTshH/AL3vXSr26mVWPMrhPl+qUJ5K58OkJ5nLZA2s7gS94JR+8kD1+auimtNdXR/rxpCPNNWINk8lrnkHYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PVn1TM0/; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PVn1TM0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791034499; x=1791639299; i=wahrenst@gmx.net;
	bh=C1SoZRWMm9QQUHCO+0Fst8MvFhjfBGxqT/CM1AD9+KE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PVn1TM0/Ly2o/hEC7x7tFBYeLASVMQA/xh24oxJE2xjzqO/Q2IQpwQjmjPdvYS6K
	 LpdJgWz1IRQoCMLx1d/ZASUYo1Ax/ZedcCPqwq4I9OqwofayjLQQsvSxCZO4OunXn
	 Oj5rF8ZjxpmMvco7KLNy3GZfYHPVSB/dS0mpswrs6UAww3vDY/B5Ai2RPsw+J2XZx
	 1Uv5CSP6bSh85jG5gIs5gnapWfD2RPJCOcTvpO6LedGVkXY/pm7Pcow5bPjhhp5C7
	 rEZa5qmsiTlETMNRcGAnm2Ppao8fPKq5K5J1jwm++myIT3YSMm/szG73I1NPH00o+
	 9j+4RFgsEyqIloRvFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1weULp0bvW-00hEDZ; Sat, 03
 Oct 2026 15:34:59 +0200
Message-ID: <c8688475-32a4-43d2-8cbe-936cca079e53@gmx.net>
Date: Sat, 3 Oct 2026 15:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [2/2] firmware: raspberrypi: Clean up local formatting
To: Markus Elfring <Markus.Elfring@web.de>,
 Triet Hoang <triet.hoang.dev@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
 <ce9aae9e-bb67-430e-9e2e-83b27265f489@web.de>
 <ef540a61-22d2-475c-a5bb-a7df8b44ee19@gmx.net>
 <16e2af34-9db3-4167-b6ef-1b3751fec7be@web.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <16e2af34-9db3-4167-b6ef-1b3751fec7be@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RtghGzBA9Lk7LWV11cypSs1vrhT/YwPqiU8Lw33SMdGf4T3kDVz
 +u0dhwuB9YSCUuHKOqKX6jAhnAELSF80E1TZNjkTgsXQ4LIP9PohdEew7/fOcSzD534qGgI
 jo9EjcCCTSw69+GbbvuP/FRaf1cAAMDMHd+/g1u8qlOC6rzFDWG4M45Bv/OrZL9lRyWDtqQ
 iIooeuDmDImVNP7j97u6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ULoRsjC7Tj0=;kPSXdtdhNJ1c6FXa/hHGv+VVMr8
 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
 lb0/PDIxRkMHgFUn9FaSeCl/HA==

Hi Markus,

Am 03.10.26 um 13:17 schrieb Markus Elfring:
>>>> Add=C2=A0a=C2=A0blank=C2=A0line=C2=A0after=C2=A0the=C2=A0local=C2=A0v=
ariable=C2=A0declaration=C2=A0in
>>>> response_callback()=C2=A0and=C2=A0fix=C2=A0the=C2=A0indentation=C2=A0=
of=C2=A0the=C2=A0UINT_MAX=C2=A0return=C2=A0in
>>>> rpi_firmware_clk_get_max_rate().
>>> =E2=80=A6
>>>
>>> See=C2=A0also:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv7.3-rc4#n88
>> sorry=C2=A0but=C2=A0I=C2=A0didn't=C2=A0get.=C2=A0What's=C2=A0the=C2=A0p=
roblem=C2=A0about=C2=A0the=C2=A0commit=C2=A0message?
> =E2=80=9C=E2=80=A6 and fix =E2=80=A6=E2=80=9D
>
>
> I imagine that another known advice can eventually be taken better into =
account.
>
> =E2=80=9C=E2=80=A6 Solve only one problem per patch. =E2=80=A6=E2=80=9D
thanks for clarifying. The link pointed to a different line.

Best regards
>
> Regards,
> Markus


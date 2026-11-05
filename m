Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793895494;
	b=bj0nqSduiyR0FTtiNfgU8yLdsO1prL/gCHZ+MMxOVFKxe6THyK06n6/ney2+hcQuqUAy
	 PBcW4FA1KSElnbFO2Q3FgYV5zuR8ZPWQvw8+Mgfc4US+4UW/Wfs0pFDfSYwcjZ5/L0IhU
	 JdeVGrqd7ftdjkkzQkncmiZAT/yWe+zngmwfTwRzTjC/3CssRw6tMthxssAdj8bWid/c3
	 vAfYfrmrD+9+bEYZS7QyN+ov1fMBdgceULxZmIO6M2JvlmtNNq8NujuKd+C63ZolOikE8
	 GgPlo5ZHz1fNG79/Voa0Hv8wXsxTLJPkOvocbRGWMIqG0gX2iGlXe9gq41yATzdS51w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
	b=KbPVuc4YwwrQppuo4O9076UsxmAnGjRKAXJ37d/ICos5XJrlcb+xjz0HhNdXqN1yPT6s
	 UdnysB0qIPBjJGLfSObpB3G1DoMMkShYm6k/5UqZGSvAGk2wDpfXooN7R7kn3zm8Z8hKb
	 LIj/gHefTxhe4m1B1Crcb0SVchMd3s/XuOFc9+CZMs8L+UAWu4/lmTnPRDugKL/q4gUfv
	 Jeq3Ssj2KUdKeXtJFsCaPjM7VIUEKg9cKciGgOSyXTWaTfuzrwf03eobEQvAIcZeIu3Jx
	 xmX5HUuCL18yrp7i3lEttSR8wDRUg+cGo30xTROT1Xlj9GMrVxHNrQ7ieMqNwx+X6SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYPPa2uN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A2606EE9A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0A2606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYPPa2uN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQN6e1040533
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=; b=TJ5E9oPfEBfB/Uap
	OuMLttHgoJ+Ljst9nb794fGPdkaPnHil3RfUJcmQvkWZSdqnuC9jeImWBkK/H0v5
	KBldy6ubniZQcXsBd9AK7iC3WEOr4dOLVhm0Z4fG4SIbBuKbiMBrO+0WbSbx9vPc
	a+G8Ecljd4M0CkHKJW54TQYVbtdoXJL2dc+0dxz76RuCwN0k1uGRZ33XrMxhJUSV
	TrX4X0vpYEitqqlmkeAwy8btJ/eQI/bZlMRhlURrEgFkNKpKRuEpXEX743unYEnz
	eygLe3trZZQ/pV0ZfXAugabZdM2QQSvm4QQSZRA1RtJhGZx0Vi1m1sk4jMj0+tmA
	0uPIUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdah7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:18:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so416793485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793895492; cv=none;
        d=google.com; s=arc-20260327;
        b=En7FPO/S6ITXqDP722yujgbYG1/4o1wqGBgqP3TniY9I3eaCBJeUQEUQExW1ExqIpw
         Cyk3z/H7HCGS4MUcbv+VPNH3BK1PdeLIDOaxKaYa6HvHxuTCdqh7HgnthORu+uWBD9Ao
         Zdg+35A4K1MyJiv9GUKMdJDwYpzpistjrEtjV4l8NqlyEgzZhPwjvFxJ54YPCsKym0R/
         nkwWG8mTkSqbS8mmeZdAcl9zJwyX10y3rNbt1kTQkt16xffzPDfu+qhYq23XSZmhTVEx
         u+MZ0wUUtmTIEDLmwoZfNTfJFZXLaU54aQilXvjocZdDhJ49HIrlCVsPo56/IWvVPiXg
         p3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        fh=+v20Uoypfk/O3SM+dYQOZKuwVwKAfQY6KLn+Tt1snQ4=;
        b=rD87ytfkJAG+FoSv/MUyHsCXnGPcWoGNJQLqGrz8rn+uBd5AakzXpoOcOTDJG5GOIe
         EpRsXRGRfTsjAxPalh71XlLBKY3c5z7+aswwejHPCM41PqD4Obi5uajm3LLSEgiAc44M
         jXMXwbTb0NPzIeDJauZBUaa6J9MCMiMNm5SvJlDEJJDXIYIGzNQshG3XxeCTS6x6Qiky
         kdPpnRMvHTB/6aBrs4eOQt1fw7r8kZJX7EHlRuk2MuC7XT3WBak6USvH0gFf5y0lSFFb
         Kl+oTnR8x70beESvyWU1etsLpbRjr6BLXvU6qd7nBElNZZRE/GPPVzhflXsDYg0XOcn+
         zjyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895492; x=1794500292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=XYPPa2uNbpAm2KapZeeRonOZjUVriQB1nR9w9OXy+GiWjM8RrsYngiUSthq9V1706O
         v2s5B//ay7+na4kyVZ43xrVBAaT5+4XHy8KYTkXRAS1GkoKqE+dCpwe7pIoZtxDEGjGw
         7spnJGBY5xwzutDKwYMGS06mlZxqNuekoYRY8x/ityhJB5sWXKdgNTDo3YJEffi426WC
         RSz6BuXAhM9Kb2j7AE5dORa4Cn+UxbO2+SiIEtGm2yayKXJiM73btstbjLagz3eUnGiq
         p+Tc4dROU7hMP75XssbzpeV4eL4a7ARGSNha/uImOdH0hiJ7b19nWL78youNkA3uPSB0
         UrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895492; x=1794500292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=qcoa6RtAUoUDMKwVKDVab3AyN3pVxHPIV0IffduAXsmTPwPpU2Ryax9OJ/huPngvVF
         geodzHveqNoPsqrB5x58RGHgSw/JKGX4Puj0f2q24DdOIxWb3fMp3nOj8uKrObHfCz3A
         EKfG34MQ8iuqakaq58ENyx3s4TYSMWB/fE0tFcVaiKOW7pDIi6vXwafIO6BYahRkBVdy
         fov3iMjyEfoeylJE25a3DJUrfevyb71XJHS3bHGN0Ixf/gFQAXaPg9MvkBV/3WNh40G3
         JYxo9fGvTXJWfVVNpKIqpiFMMVHSa0ie/DDbDBPYr9O3C8DJTBg8d9hCrwVgcdMHH7AS
         w1Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxu0RneiNnT7/hhBxcx61oQp1B4gVA1L2ln3TtlZ97gjtIJCD0iQf0TFPwyNSKItJj1Nkq3hZ0o8IUYOCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tCrBjcSOZGfZYkHO14eM1jR7cRdWTgQ8pulpJtyun/VNYns4w
	iQoc2hC36mET8r3bCYoZUukvVkcxI0lVvR1/XIb5TDLZa7MS7dGIxTaSyZX+SAvESsRqu4ofshA
	HsB8TcAgYQ64hwuBnTokm2+sP8O1t+gDOILXMhw2L9OzZ+BSH3VRznMeiQTOUrm3uAPuN9r8SRs
	vF9x9kai79Pllz8uOvPVazPkRi2LCP2iXQCa/s6l9MWg==
X-Gm-Gg: AYBFou0nsdfU/F3f+dERGGzIlDT2sQsrQPGPazTNDnMvJ5cjakvNLYDnfceJBITQkm9
	2PouwQxXZ5Uya59mAZWSLuEGXqHRSnlzJUCYwJiyMlwEQxbveZXrcf9lh0chjzIDi8odav4S2Zj
	oLoo9zFYdyBwa3JxjgIG9Qh0L/0zUToCQjJTbjuz8112+0eUzLJSh3uKI98YhiNSHgxPRyIYajR
	GJ/0EybbHfGssiRwi00WH5qF+McSoVJ3Mot/74qJz79aaN+zpZu0F+FM6xPKCqTgb+OEVrKKd8=
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id af79cd13be357-944217942dfmr3213719385a.55.1793895492358;
        Thu, 05 Nov 2026 08:18:12 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id
 af79cd13be357-944217942dfmr3213713185a.55.1793895491627; Thu, 05 Nov 2026
 08:18:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org> <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com> <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
In-Reply-To: <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:18:00 +0100
X-Gm-Features: AclHuK8YSQ-kFGWQeNw5tClylojuV0W0oBaKhzme8TxRz7tVIdZ33iLLr-iQkJ0
Message-ID: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecac45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=oudGAjWChX48PZ3fjK8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: edTkS2pUjJefbB1ZJ05AlMP8tyc-X28F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX/Z+LfukHqjH6
 xL9kmsEt9M+Bmo0hZIvzeRZnml9Tn+pUgivqwFORsh87s3Xa2VjKME9FEHq5D8k/6oOEO3J75mU
 gVqjs8CSYiKwVjT5YTS9BCi46YskYgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX7M/4KKnleqc7
 diq7cXDkBeW5HHKgQbQj0IF2xqZP3s3SWTpO+ShOasLNlUZXIBTLfueBAt/yTi5ARA7+rB36qJr
 2tNsZcyVuEgAaffARNGAgwb2xcjZhXjilEbfSCbh1wPKyhjx/w7iPAFDr8XxTmuql37JfowGo9L
 rD0ij+kSDB+lFumg+9TnJmZWTXHs6t8OM9UciH+OL8p8H28NmelpEgn4GDAfPhZ00G+Q/R/q5at
 VYhfnCdDG4SHcMx/0AqEbBcqww/RRxz41FgMMwgr8Gw6op9CghzKvxsRt0jXrNZOTdu2i8mfG5j
 Ylhg0WKi1sHeWEd0cweqtEaErTJNLvXaTy7/LWRCPv9+lmw6jJnYXLep6wH65bO+FA39ffsmwaQ
 DVi4/N7TYbXv4Jr06kWW3puyZYccoEagmEm2eNieLqH4etxhPB3hl+LQVY7SNhy9vgqcMgyXY+F
 VwAhauAPNy/ZhrV7vsg==
X-Proofpoint-ORIG-GUID: edTkS2pUjJefbB1ZJ05AlMP8tyc-X28F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050064

On Thu, Nov 5, 2026 at 4:46=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 05/11/2026 14:01, Loic Poulain wrote:
> >>> The CSIPHYs are connected to the CAMSS input ports, which can then be
> >>> multiplexed and routed to different CSIDs. The mux identifies its PHY
> >>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as th=
e
> >>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> >>> connected.
> >> I could not find that information in Glymur HPG, but maybe I looked
> >> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I =
am
> >> looking at wrong device description/interface...
> > Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> > (CSID_LITE0-1). These blocks select the PHY source to be routed by
> > programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
> > PHY_NUM_SEL field in CSI2_RX_CFG0.
> >
> > If the CAMSS port ID matches the PHY index, the port ID can be used
> > directly as a routing reference, which keeps the implementation
> > straightforward.
> >
> > Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> > makes sense. In that case, the driver would simply maintain an
> > internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> > } to PHY indices { 0, 1, 4 }.
>
> The media-graph informs which PHY connects to which CSID. The
> port-number in the DT really only identifies the fact a PHY input exists
> - it should be considered a mux in front of the set of CSIDs with the
> media-graph being the route.
>
> Since the route is runtime selectable, the media-graph is the boss, not D=
T.
>
> You can try this on any CAMSS device right now, PHYs connect
> independently to CSI decoders.
>
> PHY_NUM_SEL is derived in the driver, not taken directly from the port
> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>
> More work should be done to represent the fact-of-life - the mux. This
> was discussed extensively in the standalone PHY series.
>
> The ports being numbered with the PHYs was a consequence of the PHYs
> living inside the CAMSS node - which we have the opportunity now to
> break with and should.
>
> Port number in DT should just be a linear 0-X for the number of PHY
> inputs. Which CSI decoder that port routes to is still a runtime selectio=
n.

I think we're all aligned on that. Point was not about describing the
runtime muxing or routing to the CSID, but rather about describing the
CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
block (MUX input).

So yes, we could argue that the port ID itself has no inherent
meaning, but it acquires meaning through the convention we define,
since we still need a way to map DT ports to CAMSS input IDs. What is
really changing here is the convention used to describe that mapping.
So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
inputs { 0, 1, 4 }.

If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
the ports are associated with their corresponding INTF numbers, and
interfaces that are not present are simply omitted. As a result, the
port numbering contains holes, for example {0, 4, 5, 6}.

>
> Honestly I don=E2=80=99t see much value in continuing to treat port numbe=
rs as
> hardware mappings in DT now that standalone PHYs have landed.

As long as it is clearly documented in the binding, that should be
fine. We will need to introduce a mapping table for platforms that do
not expose the legacy PHY numbering, or otherwise derive the
corresponding information from 'somewhere'.

Regards,
Loic

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592576;
	b=MAbBvweY77jxyg0oT33ZnigXKRMznRk+u5JGHXAGfBQubVaU5j/1BEeutFBLxmfq85Om
	 Df6eTJWCdoNZVNpaA21NacY5VuyRAnE5E+haRyIewynFuUhgf55DXQCEY+EX8WIXfcgcp
	 G3bYCgyqVNtORzSWMDGMOK3D6kYthFBSuxm7i0UyvC5N7M6HmnUekOXtPa62bFE+dFBgT
	 d0iYmojpy2QqGvIjOEdpOB3hHwdOQnOJMoyK212lsWxPiedFTQfg3tI6HXHvuzuihWUsJ
	 EnesvcFBZES24ud+MiqLcl3GB1tUxHAO0K9EtJgs3uSqN1UmFzsw1V6UKdoNmO1VgYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
	b=RU5AJvULWv0gLGqcbYiKRHQFftb1uSdzUoq8j71KFO0ZFpN6i3h40J98yCbsvRv3MqGH
	 sr1Uelqp3DPkgZXubElcf2pZv4Z3k3v2kHErI577c0nAVyA1yy/sRp76IAwk4TE3ea4XI
	 ilj0N9mqGyurifigHPzTehuuHQqGAOpGC+3Rv33/iKmy4RlSF0qQi4xu9mem09FlmWkct
	 7IR85ysABvEBWy66b+LVBTQzqeXmbe20qGPKj0nlRzf02Gr+QuISN78n2Cl6iC0lehQop
	 Gl0Jgcb+2Zsv08Zv/cVv9a+tXWxe1GlKbdZL0twZJJTevP4PJSAgr2aftVgoTpbGj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E660A2639
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92E660A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFBYF515653
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=; b=npG3JVPex9jt6z10
	QuZIaEnlHy40zUnbeFPSTkYUmeMDGFZCXcebettzkxQbnZqXYb1i17KBG/KDiysh
	UelSLZXKjkX/RyEf17chZpDVJSP5F5OrerMgAeXCQOciEjkHGbYyXvTJ/wSzwf5b
	7I4hQsZzIda/5wP6dgYsd3XUw4yeXQ7u8dhF9I6Hb3aPNQ7wMnGjaudfezCAgk+G
	M4rwAjpOd00qImACEhz8A1xLA2Q5bbM+bpxB85kz9yQwp3CTMxT+fYRGXbChb/VK
	rmjLEx+/xW/y0UITXFQEkJY9uJ6zQPq54qDgy7HF9QrtTdJyppbceRbGD8VsAU+r
	80lMdg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr8gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35d7e79abedso55716eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592573; x=1793197373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=iZtr1oK9aLkpe7Au87SRx4LXNHm+fI3gxsHJ16TVwtpr2T2BtpPfCZhMuJaWe5Iw2I
         VOfJh+93At0+46yAqHroSszhSA5UnmUkKHEvJAcAqFgkJbFftxHYyVnGZbAXqHnDo/Zf
         ew1jN59GbR2F7FVkgid6FYDePkrXw0KhZrS9Tfr23HXvvJG9OqGoUy5NvOsullhls2TQ
         wgPDamDSvfCU3JTN7Ow9XlK8P5PwBkNHxTtGYF4Pxxgsd3nC7K1+AWdnny8m6NyW6FBc
         iFWFw8tLFh+Frdxc5WGH9gtLQtrhBfaezMv9vro2U8jAm9JjyhRBFJgRb41LZiC/y8AP
         gzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592573; x=1793197373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=0IEGWu+hoyd/FHPUR1rbGdBrocR+QfiRjzRJV0NDPZFSmhPqGNozi+b12jlR7wbUyZ
         XclpsWKfDka2unONpqajb+iYBo96iZDhE+eUdxFvfw6j1d3Hmnvd4jpqmTOhUiNm3gKk
         HmWyRnlw49y7DO9fY21tjbWiakjSduClX37C0l5D6xnKJKCS+LsqG4NncHoY+o8A9KbV
         WL4uJfEuYB/xw+bJJFV+kkFoOnV+3BtoGwT/B3YlpdZcamxEXgLprXKAv2SgFfXE6Lln
         zzvploxu6/6AvjDaw2os+V/qyxboPhueSy7Op2k43vTOAZ+cvN0gdLUmjEI6MAC1tfK+
         g/ow==
X-Forwarded-Encrypted: i=1; AKwUvBydj2RZNrpnR6cfiVCORIlTgDxSnfWrPP+EyUQGOFlCLHpkK5tbN7qM3qXpUY50Ejzu+9FMsxZ8E0nVucU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTC7SYP+Q036tIC83bjNfB80bekt6q7vBbKAJas+E81wd48Vco
	js3YROj1xMhNfGK+HftdUeBQoNoI7SAE6RFm1rDAxY5Ap3UpW96uSb+R4X1Ylz98rOIZy2PJwX/
	V+pQCLanpWONp2cndUAaV65E1L88g758ayUUf/jIGuPOIKj4SEOhcreZKN4T4C0AcVEI=
X-Gm-Gg: AYBFou3aGLB/LeICLi7kGGjkdFAHOPimThJFRK1U+iyPLmwFuREl/DXJ2AyfG6fUVQg
	W7NhWsOu0knQ6nAb0FiTm7qsP2ZyVf8VHGtkk5prQfD/3GCfpxP4VxmZU4e/VslZkj8ruj3EWWA
	6HpoJ+kvBsdmxnAgmi0ieVKEZdR5bJS+IMM5g27Kzf2r9zOmSBa9ZA2oJEhlJKJlQf2FsOmno19
	Gb7BubaBqoa4Refa3/LbMgcTNWgm/IS1R0J2Wdr+DihkqQnh/8wzuJZVGHGr4ZBCdPLS8sr/ifF
	cppZDD/cz6YqoZesHg4dz2eTZ0ex8cuGJVEPAgaStI+2qCHuReQOR8n1D5J7w47bqh16z0hZBa8
	0O5b4GbC+LiNZ/kh4Msvp8t1UoJ70iLvlVdtoOjZcRtisWQdm8FfOsltrPbmUXBUXJFkW7QRLgu
	r/X0g+X5xdzUzVLag9E5VkhpdKUiEgNpy1Ld3qcho4doVDSQEhTSw=
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156129c88.2.1792592572931;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156022c88.2.1792592572043;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:51 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:49 +0530
Subject: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and touch
 GPIO drivers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1137;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wKRFTCBJIBMmNDY89gm1Ek35up9XQQNdIjIma7SHnF4=;
 b=0bZgy1KRlsumildNKdSdrtd+3ObPSv+aCKqiaI3pmsuFxXukpbKiDMIQXPRvPcNqNvwmsviKd
 MV0zGyK0DJHCPB8x8c36kDrYTQpLaoxVrIouWd1foll7OmwigRFK+Vl
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: RkZhkmu5BsHE02KoJ8L69fShctJHWo4Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8t/LR9X8fZKR
 7P46cEenQ1D9Sq5h3/YpRksJaIZazSalavxUk6qYJEm71eKH/OsTNdAEO4lJRYc7dEYPmeyA7Sr
 OUHwVsBEQpQCVvnbuf5+WtcNv04ayz0=
X-Proofpoint-GUID: RkZhkmu5BsHE02KoJ8L69fShctJHWo4Q
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8cabe cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX4YJeyPSiRfhG
 alLIAkj33pdWrXEdCR4KuXXHPAgLJhLspJAmsZ/iYzoWsi2Ge8bQ3DY03BSR1AX0TZDkQRsGQ+X
 +FRHPc3TE5c3rwii4bznpU2oL86Jirq1u2DH0bQS2EkTXSuauciZuKKhFoZyszF6y5iGSFvdNWq
 QsgV1kwO5vhjASvpC3RRT/pdO1XDMkR7uhNC9QXFDio7651OVarT6hboRX40r4P0USqFFvUq9/U
 uBEz1hGFVbfrR7hN4WCgoXURR1H1Ell0DK/j5u2yq5oFgoDS7DRHXoyx51dV0JsngvgMG10i66v
 RMqWDo8A9T22ANJtdn44tZvEEJ9/rswemlP+zSo02tdXUFEyAXiJdId3PQvdrGBslhGRnx/NfPi
 5T0y0wYX9bjnjhoWMlqur3R/ALaAo0nDnAjTAJ0A3p9tSNKVeTv+1qe/InLrAJTaU77dvdKraF3
 w22NGk50OyTy0kFPJnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Enable the Waveshare DSI touch GPIO/backlight controller driver and the
Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c4c47a44af9..73c07961f655 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_GPIO_SYSCON=y
 CONFIG_GPIO_UNIPHIER=y
 CONFIG_GPIO_VF610=y
 CONFIG_GPIO_VISCONTI=y
+CONFIG_GPIO_WAVESHARE_DSI_TOUCH=m
 CONFIG_GPIO_WCD934X=m
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
@@ -1032,6 +1033,7 @@ CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
+CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793366333;
	b=4/DC6/Uu+mSqNUlxZQNKcL8UCNiVxxX+Z0OkjT1fERp2hR5nx+mMPCqof3ScmeQl2pPj
	 mhXS9XnNMtifiwSvFEpabUjwrt+8D+3CvoX2PuaLMIZmkr4B9drHgY7XUlcB4jCW//f0E
	 ujXfCUnYFvV5O7PYT5jRfgKM+HDLyjUUm/mlNoToaedALlE2bgGRvjmajs24Y8R6KmUVP
	 v9K/SSdH/TVlwq7Q/prOAQbL7nTswgSCnfsjOoJ3nYkaW7qOIg3sQkPC53l3ILWigcw12
	 Yl2V4KXLcVArp2iLrfcFIcfJgtuAfQ/pjdhGh1fkQlB/8c4noqsnsP4QL2snBcY7SKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I9F4PgUiWvCLXxBWaz2QhvThbcivC5DZGj5f2Lhfiqs=;
	b=sx7kcaVU5Uxq998l/MnA0QrZCTpovXYoHEAbumYVoHmAVwZBUZxAn9AUny+a9bx55uoC
	 rHn+4a1/sPCxFiudC/uC41QeCdpWa55F9gRiRC1D+XV+9Bwl8tNTTaBLC+STnA1ZeKbs+
	 6dJ1jjqFC/ysDmu65w9vXCl9kNE1EsEepbL66I8V2BlaA2W+a2EXS+MI0QfMOEXzO0WQS
	 29rr4qw3kfnPjRd7x29yEvRO7X88ymPw9B1FrUVDGS+6cjvFZTKwJikplRGP8tYNKvBkN
	 +HQzG9p0F/+IHiEaeK+zY+av4/hkemF1+j75/YUMBFziOxR/ZkHO4Pglsb4qhnSga1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fsov0qdt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icmZr5TL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5A606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fsov0qdt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icmZr5TL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGEeS2784204
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9F4PgUiWvCLXxBWaz2QhvThbcivC5DZGj5f2Lhfiqs=; b=Fsov0qdtrSbyOPTD
	tpWGXP5VIT1bofJ2qk0j9PjVA8jdUe16N1U9H2z4OC4e6mNaNeV4vOz6YzlbzGm6
	zav1mFXL1/ADn6bb4+H5x8PHU9jNI/2O5KxgyIdQt6sC3Ni7nBcvH5usGNJwYQRz
	mdjAg02OYD/stqKRTzrQNk7KlTlGTwzDMxj8v3GUE2Wtn5EmzaU4aHWqjj9MB8cj
	oI6NKu6L2g4GslhVzfhsC+i3H4SKmseo+95JHV7/Pooe3CDYjWB5NOgyeZBg/Pyk
	eH8jyrbN+Nk4EjoMMHkuyFoSIR1XDf2SCcCY5cBSgh34KKBP//LhwEESpsLh7yWE
	COnrpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk68f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:18:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso7065515ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366330; cv=none;
        d=google.com; s=arc-20260327;
        b=CzBWwGsk2LPIFmCh2ynT2pOYpHidRlIGKFQi2RWqZpz+dz/MCbXxWs4kOsBQXCZ1om
         F3P/PxsvcxVlxt81bv/CVlCJTsFUnlUblHoES4sP/orKZn45e8GQSLuMlaMYBpLBLJXA
         NgBzjO1cKbZh4I+mGRsAEamnTw8dxrjAYfSolJIiyQESl5ZMQ9xFp5GPlI77UeGRbpn3
         Z2SO6mh99/KSo0Zlcy2pm+5ig/dFxCqutMh0qBB8jNlunBSKW1vEDaISBJI5LXNzKxyb
         jbLbaGfVnCKeDCFi79CKpmNLsATkH6pmE2wk/YqzjphMzA2M8DCNcQvSjklRvO+LEpnj
         Qnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9F4PgUiWvCLXxBWaz2QhvThbcivC5DZGj5f2Lhfiqs=;
        fh=3mVGyr1kbXdtdJJ+z4/jzjqeFouY0qKd3qvDhasLlMI=;
        b=Lh75AKutgUh7c08J5kuCeF9BBoTlJNq+a3R0Frizd0NkYYM7KLWgeXcNeW6dNNmoH2
         EPwNR00TuW1wl1jOTfD96cKvxLGY2WL0oAxE4s+eVf2lV11BBWa6TL5gSwbhS+HpxXXZ
         R6fvlzRm3w9Q/U3CB9l0gF8KLbIme47O5N3s6zvq71Tofvs7+6rmzVLsFgmyKNeg/dIm
         28bgKoOk1lwodzeNAd68Iip/6ZS5HMJw8oEOGdhwKqKZgeWz24XMJtj1AMAGeVYTK3Lo
         82wrv9x4lmGekuk3kjkODD5xAwG7Lj8hSRtdQzZTnDyJZmTsTYurw2VUWZflOcWtJfRa
         WgpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793366330; x=1793971130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9F4PgUiWvCLXxBWaz2QhvThbcivC5DZGj5f2Lhfiqs=;
        b=icmZr5TLIvPRirhc9OwDuWWXpH4YWnyBp7bSUqWq3DQcOgsvwleExBfT8Ah1afBwgH
         qClqeeBpXjz7tJTG61zxtWAz+7HeNgwcQ1j7VNuxVlyjcb5Zm02KhpBt8+uzsULKkggk
         dg4sahz6yU+N9aMsGXg52tvISL9oLgQOmM7JxqJTfWGbv+NcrxNYq8VnGLpTTWPPKsra
         mxjvM9Gwya/xoVgQ8dS4CbVDq657d5SpE4OjxrT5TPJDIlZOi0i6Jz51aKjVJzSbKzap
         C6Y96xfeDzIA8lB7OSFiVvLpehVStrtTDR4KCs4TBHZwrhmY+hh7S+K1uuishA5M6pPi
         2lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366330; x=1793971130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9F4PgUiWvCLXxBWaz2QhvThbcivC5DZGj5f2Lhfiqs=;
        b=evpENK0ueUc4GHvSuIdUKek77LpUlkOyYTvdFKQwz3XERbIig8XtHFAvMwjEcEK+ZA
         BxOFd01znr1rLA0VBR5M1NsjmajZzkAIhJ+03JcezmzzCjTPm/vKkGt3CYHkOoO7iGnc
         9o2k/0yEFrpl33OqG90fzv7E5BTBn/Bcoz8AJWMuIYNS1QA2DGtjLrvjzEcUgxcVr/70
         ZbNNm08FGFSENUqPSKZg1nlRGiQEhZe/PIOr9NEI0G6GEt/6t321If6jVkOYtIkE7J8P
         UA2xMfJpCPBOJQb6w1tC7L+CLFx+l8Ur69J1o6uhZTDdHNP4amV0978c1vOcJWdZmttP
         sbiA==
X-Forwarded-Encrypted: i=1; AKwUvBypOZeGw6OZpKd2Cl7MQf8hlMBw2fALhIW9h1xDyoofwZP1i3nOBoDskNtzrV5OferA9RLLpDgYVdnI8u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAoe34u8oIeS3qmXHI/+QcknaNYq1Z9MIC4apat8zCsvvqCDXO
	/qE2vtadaVnmlS2K6zwRH0ulGtIMQdI22Xw/WcO2lkJL2kZ7O2L0NdSMkCYKthZZK747mHqp8SO
	6Ou8Q/2Fd6wHcIMMVqlgsMy4chKRUSgY4nByk1k5mJ1PZv5wx95WT3FB23cxqNWB6C2cZ3fZdye
	/LtvpQC8ijPgFXBrg6enlwtkTgIET7clodjjtwvKz+LMihR/vttQ==
X-Gm-Gg: AYBFou3divnqr1Kitw2uH0GubhdKGE9mSvCJxu6nO9KLLU1uLaGiUXBkXF+8fWPL3W4
	emK6FzhMaVYrL/6RDl+kTEdS5wM0Duj+Ftxp5Klq9TGPPwSykubULf4QwJ1mKXXmhD0lSUBsMZI
	DBvfy31lbCZrx4UowoSzD3K2K0RU4jQ8NOpngQzxR5sqKEuodIe3nyee47CA==
X-Received: by 2002:a17:903:17c7:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2eb36402557mr24870375ad.2.1793366330250;
        Fri, 30 Oct 2026 06:18:50 -0700 (PDT)
X-Received: by 2002:a17:903:17c7:b0:2e5:54c6:e5c9 with SMTP id
 d9443c01a7336-2eb36402557mr24869445ad.2.1793366328408; Fri, 30 Oct 2026
 06:18:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027122417.954133-1-rojer@rojer.me> <20261027122417.954133-3-rojer@rojer.me>
In-Reply-To: <20261027122417.954133-3-rojer@rojer.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:18:36 +0100
X-Gm-Features: AclHuK8RBgkCr7jl4JBb6oTf6EbYW4CCDNkhsUxb25Kl-Zu1Zto_wQZjQNBeLLA
Message-ID: <CAPx+jO-EpqidMPXsC9RnEtBkSg26r7p+amyE_TC6kLmW3j7Ssg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: core: sdio: skip CMD11 if signalling is
 already 1.8V
To: Deomid rojer Ryabkov <rojer@rojer.me>
Cc: ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com, llj@rock-chips.com,
        Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4993b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8 a=puenUtlPAAAA:8 a=s8YR1HE3AAAA:8
 a=5Nzor_QV3Lqk5mHo--IA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Es8Hv8gd3kOWKGUR-0Xs:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: O07Zt43Da_s2BeBvB7MRG1KL2mX9B_b0
X-Proofpoint-GUID: O07Zt43Da_s2BeBvB7MRG1KL2mX9B_b0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX/j+izo5wWr2d
 1Ucob/B5tvtfaUMbndTZQxwQf+WOGrABY8Q5POGhrH8pscBMoIhYfIOlxS89DKDej9252Zk3EjR
 0flkq6MZTmijBNXYq0lcLRrdit08H1nxrhDDWc7MUwxfX4PAQoBr1LkjX1J3Ljxy/j/1w6wqKu9
 vM9Ju5rX+b2+/jUfSV1SqjaQ3Zh1ibYk+gGQfAtL166a4ZWt+PXIO7g8w2igdmZId1jZc+M0Eor
 bOeDW/lb90SBd5ffZwwhTvMFC1EfmQoL2WJ3wA4h0wo/X1Zom378DOIvff9WeDkwFoOz3EdBpQQ
 1yYfQfmlGROp4DbEia4OVqqd99/FXQehPVz2YcEGOmadDT2WfUcl6yW0jlOoWu80KaZq9s3xacM
 ZrkaokA6lPhK2MHN+1Am2p8LICefvuHA65GcFPd09/+9LfQDWgV4hDTfuDb/M/ncoYIBhgsYym+
 6t1aRUFjAvuymasgL5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX6NtO+yMJaGoi
 GBl3L589pXLOW3du+s1ThMoRaDwNKvXQYPrM2VHI+/NpWXOaeRnuk1BRz3zEnkd+GtX55zYvIcA
 ++A/oUI45byJKHCIb5IKvO5s+fkBtZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300052

On Tue, Oct 27, 2026 at 1:24=E2=80=AFPM Deomid rojer Ryabkov <rojer@rojer.m=
e> wrote:
>
> Per the SDIO Simplified Specification Version 3.00, section 3.1.2, a card
> whose signalling is already at 1.8V must report S18A =3D 0 in the R4
> response, and the core relies on that: it only sends CMD11
> (SD_SWITCH_VOLTAGE) when S18A is set.
>
> Some cards don't follow this. The Realtek RTL8822CS (as fitted on the
> FriendlyElec NanoPi R2S Plus, where the M.2 SDIO bus is wired to a fixed
> 1.8V vqmmc) answers CMD5 with S18A =3D 1 even though the bus is already a=
t
> 1.8V. CMD11 then times out:
>
>   dwmmc_rockchip ff5f0000.mmc: Unexpected CMD11 timeout
>   mmc_host mmc2: Timeout sending command (cmd 0x10202000 arg 0x0 status 0=
x90202000)
>   mmc2: new high speed SDIO card at address 0001
>
> and the card ends up in 50 MHz high-speed mode instead of SDR104.
>
> The SWT6621S misreports S18A the same way; there, the failed switch
> leaves the card unable to initialise at all (error -110) instead of
> falling back to high speed.
>
> When vqmmc can't do 3.3V, mmc_set_initial_signal_voltage() has already
> fallen back to 1.8V by the time CMD5 is sent, so the host knows there is
> nothing to switch. Skip CMD11 in that case. ocr keeps R4_18V_PRESENT, so
> mmc_sdio_init_uhs_card() still runs and the card is tuned to SDR104:
>
>   dwmmc_rockchip ff5f0000.mmc: Successfully tuned phase to 64
>   mmc2: new ultra high speed SDR104 SDIO card at address 0001
>
> Hosts that start at 3.3V are not affected, nor are compliant cards that
> report S18A =3D 0 at 1.8V. A non-compliant card that does need CMD11
> before entering UHS at 1.8V would now fail UHS init; with the previous
> patch it falls back to high-speed mode and keeps working.
>
> This relies on the fixed 1.8V supply being described as vqmmc-supply.
> vqmmc is optional: without it, the host can't tell that the bus is
> hardwired to 1.8V. Setting 3.3V then "succeeds", the core believes the
> bus is at 3.3V and CMD11 is still sent, so the patch doesn't help. Such
> boards need to describe the supply (e.g. a fixed 1.8V regulator as
> vqmmc-supply) to benefit from it.
>
> FriendlyElec's BSP for this board works around this with a card
> quirk, MMC_QUIRK_BROKEN_ROCR_S18A[1], matched on the "realtek,rtl8822cs"
> compatible, which drops the switch request whenever this chip is
> present. The misreported S18A is the card's fault, but ignoring it is
> only correct when the bus is already at 1.8V: on a board with a
> switchable vqmmc the same chip would then be run in UHS at 3.3V. A card
> quirk would need knowledge of the board's supply that it doesn't have.
> The core does know the current signal voltage, so handle it there, which
> also takes care of any other card that turns out to behave the same way.
>
> [1] https://github.com/friendlyarm/kernel-rockchip/commit/aee62cf7ae16b5e=
de6c6d92a8ee20e796482754e
> Cc: Jensen Huang <jensenhuang@friendlyarm.com>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Tested-by: Longjian Lin <llj@rock-chips.com>
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>

This looks good to me, but deferring to apply until we sorted out the
potential issue in patch1.

Kind regards
Uffe

> ---
>  drivers/mmc/core/sdio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 6787fdf1c53..a986ee04ba2 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -737,9 +737,11 @@ static int mmc_sdio_init_card(struct mmc_host *host,=
 u32 ocr,
>          * 1.8v, the card sets S18A to 0 in the R4 response. So it will
>          * fails to check rocr & R4_18V_PRESENT,  but we still need to
>          * try to init uhs card. sdio_read_cccr will take over this task
> -        * to make sure which speed mode should work.
> +        * to make sure which speed mode should work. Some cards (RTL8822=
CS)
> +        * set S18A regardless, so don't send CMD11 if we are already at =
1.8V.
>          */
> -       if (rocr & ocr & R4_18V_PRESENT) {
> +       if ((rocr & ocr & R4_18V_PRESENT) &&
> +           host->ios.signal_voltage !=3D MMC_SIGNAL_VOLTAGE_180) {
>                 err =3D mmc_set_uhs_voltage(host, ocr_card);
>                 if (err =3D=3D -EAGAIN) {
>                         mmc_sdio_pre_init(host, ocr_card, card);
> --
> 2.53.0
>

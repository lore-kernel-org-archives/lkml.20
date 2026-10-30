Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346832;
	b=Lv16Ol9fznAglSuHBdShuRlmHb4hZmcYdq5azZQ6hmj+NX2Ot+V8wys64d1Qi8fU6AXy
	 fhNc5BGaTp1aNBUTPmuDvxeAgcOiptT/8ie6ncQhyJ2heIKX4S+tf5VgeILUR2KnlqFNX
	 xjptCTbgQJgdvLfl9PubLY7v57cPovQ0sdJijuMKG/523yRZhLBMFjvjgp2rkap+h03LW
	 IdKwrGjXmAaBTDfHPV0C/y9qy9u6hYLnWpfTDQYL1LasvAXL7W6OELPyNUlpdP0N9b7jk
	 x7yREmwej7Jf0AUJ390ItlW2snrXQOQbMtYbxYpQhQwkFJh6pZzWT9E4Y46BpJTvzKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NcUKI/JdjawBplQszTuPDd/jbVzlRqz2Iq7B2hO8QVk=;
	b=NYAZlLCVL6NHuci3qVAsf3tbm+l88JQYpXi/FH+7NlVc7m8yeHM7GIF4PLKCy6NcLgy9
	 ThCvsWheAN4xiAqCCsdyuGrgq8es+6kEaaFhAbERcHbLyqAhYJ7UVkMoOxuYcO5i9F1c7
	 EZ2g1SvR8byjX4ngZBwm6s86z4sP8Sy4xKpR5frROLZQGn7M1zjhQQ0D+cX+j/dgGm9Xo
	 3stMUK8QVfGn/EtRERQNtwNJuO9820u6YnnkIckkhqAOBkHEp9ByxfOPZyobjB1lIHtVQ
	 Dv023p3AzGZ4elBVGYXQczDuOxaTPyo9b08nyc77d8WCrT42F2fr7uC1P2lTmVTu33A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="py4x1+/4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVl6KrXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py4x1+/4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVl6KrXV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0m71266534
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcUKI/JdjawBplQszTuPDd/jbVzlRqz2Iq7B2hO8QVk=; b=py4x1+/4bTBZWV7S
	8fqBCgCHynF3TCgZR/SWB8ArinjwETcLeI/FMzApeCfFfGuqRBnUKyZMYjGrIJZw
	P1bR07HB/A3297P7wS18YN/ILMJNrCo3kmED+EnwnlZIQ82Pdv8UHNoUBsFxd1d3
	WsDJh47s/j8Ou4S/Nj7YJWy9A6ldEG6/8AycHKPUrQhVWC71xH7coetgsm+FgtUG
	ucLwNvgxbisLr3lz4m0mhGfgSOgc6e9PPR6M+gbcDr4s7SjkKbaBNC20BXsfuWuH
	jKE32Igte+JmllKwstcZQPCwpB6yXzEsHY6IRcN11uqGwQ6BRU/K2oVq9Fu6wGyu
	LfPoBQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1wm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:53:50 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679aa1bb496so731983d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793346830; cv=none;
        d=google.com; s=arc-20260327;
        b=PfJny30ETXKniKiRhyKzRhieWJatLij1jNddn9BZkPTXNyZ/Fdph99Vn+BtRZnysc/
         UL0iBuJadOCuAacnpGkfHLQ22CZVL/5aWRDpkJ5ekENTPPlQKOOl4Hs4C46daoPP+m4c
         vFWpHPcrePLPw9dS3iW4ofJ35IJBSQEQaeLdU80gaUsor4knl3Q+s+SZYze2kJVLL2X6
         Q9vI7Kbs5VoDdDNZfm/KxC9LdR1Wo9hoMu11p7Tof0c+pJ2T3Fsc+zGAK6rILynjJDVY
         +Vsb5y/nZxZdIhoohprGs/w6NGcJP7VcFRR8AAXgv8umGQEjWTz6x5n9Fo7ql5cztStE
         uyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcUKI/JdjawBplQszTuPDd/jbVzlRqz2Iq7B2hO8QVk=;
        fh=U59N+OBj9ceQpfyve/Ns/dEu9KgOHsYZayxx3ZRm2fo=;
        b=bXO8I/ENoAlBIoaPYvw/qDXM3cMHz6CVO7fz68TWol63DF4mtWYG8EQIsZZpDy8arU
         dZp9bB4+ZK1XK2SBWFU+hegTZHMK4AP6GTz2ZcSXnLygbDOHrNo6rCknrocgHvCfVdYG
         KnAScEbLKSQFvFQfN21o3dlkIFif8NKlqh4CC9VyOnKe7icns5Tk/J4Ef0khbGf58C4Z
         h6P4MPV1vxbmZ6eJAgELmcrb75sKeuiZ83/ayaJDvAbK6rlbpowAFdA5StsqwkitEgu1
         WnLQFooTjc+/1/VdEBra1QnVJsCVSemugyrGH+bsTFSa7uVxyQYYt7JaQuRJzMFNcmx3
         45IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793346830; x=1793951630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcUKI/JdjawBplQszTuPDd/jbVzlRqz2Iq7B2hO8QVk=;
        b=JVl6KrXVVHVd4TTaSllKW6dR8Rjo6FyGNBLSeBj4p4OeucxAP0ogEY0Q4ui+URy3Vu
         7CfHTu/LdNJq7FPpVs48FVRtHz4xyxOfFhdBs5gYJP6WXSK5VQ80mq1qm31MG5reXnfn
         fobcruM9SaM/JftYXXPayQw6/l2Wuehw8S70ufqhjt7ThAv7wb9IdXixORTHapxQ8Vcu
         p3rXsJ7BLcd67dUeKEOWl7FDbqW5Qsl7a+Je1i4iwv5Gs9qRjV028yjQjI7NT2eBzlxp
         tgx6S0aGcQWP/StHgtQKqbPbCEqXmfci6/cSQHjidR9OgRQBuSQmI5464P0FKYQtnL73
         E9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346830; x=1793951630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcUKI/JdjawBplQszTuPDd/jbVzlRqz2Iq7B2hO8QVk=;
        b=q2ATWDW+xAvQivH/WjY+IBiQkqlUNmZN7laOD9UFglu8CmTfNk1/uLBrK4QfdXK82v
         yrXPR1UTuuDNHACWNSkGQOiIPinXaIU5gq5dJz5AGVjYoqVS7MY+pbofmiqAYAhXJuP4
         Qu6VS/OtSF8wgVp5sn77Ltn9ONkPRxVN4xMrh+LPaaPniJbCv5sk1rU5zvgdwxLfjOLr
         oOZz9KVXyIOSVoD/JLQbxkVPC+enH6vP18tQmulBI/3xZMoR+Y7tKLekJRL6rTNx7NNJ
         YYDo6KtKOx0cAG1U9zDiMFNO6ksOmkheXLWwWb/buVTRBVudqiRrNgs8DF30YkO2+9fe
         KGsQ==
X-Forwarded-Encrypted: i=1; AKwUvByOcnffXb/DMw2XWwOxOcFlQtuNX+n2hautwMn2g94sjej795t6ljTzOzhN1Wo4NZ+9Ydx7mYhzsBm0rtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhk133MZHJlH7NNAq4IYCMhkTohAAPdm++XBaeRSmLf69zvAaM
	wFN/RzMd7sUX7LJF2gMLQrUlMaSrACCpN5hZkwbKNq0+Gdfz1H2/WR2TrjNgAqIYo6YEpYWdHQp
	PvxFL2kXSsa3YA0uu77yGwkevgAQ6nohaJYHxe8cnyAK23nHu755WWb+hjBkSkE24iANg2R/KGI
	/OGgwXERuEmFc+bbSem2za8RyG2sfRIZm3giARPajx736NU8bYZqQ/
X-Gm-Gg: AYBFou0/SoBlxd6WYn9+sQgeNUEreJgQ4OJMRsXFZlUEKNRMpVWp4nIe5LsTHXyOiuZ
	WxK/4ZBTNWWusRetVzFdHHzQRA+7zQJ0FVN+8b8oytWzSojqfSDP7q4/paDbJiHu7XscKo/qg6P
	HwzyHSVY59wxXncWpPN5lMtGDu9nApOoxb81NUlmX1FH4ctkhpznszsyfsGQ==
X-Received: by 2002:a05:690e:1487:b0:677:c8f9:73d3 with SMTP id 956f58d0204a3-67ba50a89a0mr1180175d50.75.1793346830057;
        Fri, 30 Oct 2026 00:53:50 -0700 (PDT)
X-Received: by 2002:a05:690e:1487:b0:677:c8f9:73d3 with SMTP id
 956f58d0204a3-67ba50a89a0mr1180150d50.75.1793346829417; Fri, 30 Oct 2026
 00:53:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-aquantia-support-5gbaser-v3-1-f1f9346553d0@oss.qualcomm.com>
 <b87d66ca-dbd3-412a-9ebc-055f8e6f9a6f@lunn.ch>
In-Reply-To: <b87d66ca-dbd3-412a-9ebc-055f8e6f9a6f@lunn.ch>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:53:37 +0800
X-Gm-Features: AclHuK8Ikwa6ly_OXK4n2rwx6KaDD_xdAJZgr6Thjfs7_nY4U9Sd1s932qFQXNo
Message-ID: <CAPTcHHTmGGC22ng9z7Ct8XjXjEDDukYBc8hDv3ku6t6O_Cnn_A@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: phy: aquantia: Add support for 5GbaseR
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfX5Ue8gO6m8GfK
 5DkurMRSZgZXwUIUr8gvDZAS2iO7wVIeXvopzXvLsZ1pnQMfnTItsM53j83j+tO+rYW2Z+WI2Sv
 I0e8pK/MF+zqvrIy3AjhQmGxv/Cm5OP5cpZ7+nP88ZogFIiJAQ3ZgxDQ7C2snccpbQIFtsIeWDA
 DbbQdv4i8ELnJBfojM3t2393kEao+6QBNs+0njw/Qa6KduLPgzPEHqiWxk9vnHVLkknDpJc2lOu
 0JbwRknJ71Tky+sojK34LBuFPtEzSnDP5ZNLOmdOUSzZA76jk7QwceXj8gxX0tqHwaFRWNO2SLg
 a2MWDKYLwJEfkX4JckGjvqkUuLI7pyOwgLj8PpjLJDxUfAC+GnsqGtSIwQQV8VrC1Z4D6wwbYUF
 RbWaUzJCxqmuOji+GH8P4uaYZsBc5NiwhtKYCNiBR8I4QrUrxw9N2nKd+baRECETkk5e7mIs1zK
 mm7+IEKfz7IH24tmlIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfX+9aA2YokDjL3
 9MCxo2xEJLoES61lsXgH9apeUUoZ7J7ylAKbh5c9je9Ruez1JxbLmzt8FB72AxQKjQpGZGPrgdr
 6obOmgkEObeAUk5u0P8Pd14l3cJn2Kk=
X-Proofpoint-ORIG-GUID: FLtK2kQKPjUpxQggRuJSs4JDy0kUFT-L
X-Proofpoint-GUID: FLtK2kQKPjUpxQggRuJSs4JDy0kUFT-L
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae44d0e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=sxNmbdBMPtiPP6CAsAIA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300031

On Thu, Oct 29, 2026 at 9:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > @@ -786,7 +790,8 @@ static int aqr_gen1_config_init(struct phy_device *=
phydev)
> >           phydev->interface !=3D PHY_INTERFACE_MODE_10GKR &&
> >           phydev->interface !=3D PHY_INTERFACE_MODE_10GBASER &&
> >           phydev->interface !=3D PHY_INTERFACE_MODE_XAUI &&
> > -         phydev->interface !=3D PHY_INTERFACE_MODE_RXAUI)
> > +         phydev->interface !=3D PHY_INTERFACE_MODE_RXAUI &&
> > +         phydev->interface !=3D PHY_INTERFACE_MODE_5GBASER)
>
> This is sorted based on speed. So 5GBASER goes earlier in the list.
Will fix in v4 =E2=80=94 kept the interface modes sorted by speed.
>
> >  {
> >       if (iface =3D=3D PHY_INTERFACE_MODE_10GBASER ||
> > -         iface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> > +         iface =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> > +         iface =3D=3D PHY_INTERFACE_MODE_5GBASER)
> >               return RATE_MATCH_PAUSE;
>
> Please keep this in order, 10, 5, 2.5.
>
>     Andrew
>
> ---
> pw-bot: cr
Will fix in v4 =E2=80=94 kept the rate matching conditions sorted by speed.

Regards,
Hongmei Xu

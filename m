Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311392;
	b=MHWPwTJyj2D3seqJ5zTo/f/UjvRdR+iF54ciErwRAHUiC45Qzp1A5Ky1+V+1/grFQko9
	 XLBovLH0BZaKgvc2ZaLirr71j/Q5nl9gq1PJNFaN8PSw2llSJS/s6YTHZ4f2CGpc7uSAB
	 Yo2Ctcx5icSVZB6xkrHeJ4kgZcsQlBOXxlVKvJEfZq6JqemuqQjYbzvtl1pxAmDMvuiBY
	 /ofmnrXhenigLKChs6HI1DCOqmhOnx3k8B7z1o4z57wlnkjY9EB/GFxQz3LOl8QYZHcGc
	 syRwZtpBOB7Z6mEP85at0Kd+7lFcgsJ0GQtWl7JDYUrTcf7m3y1OEaZVVJVmnTvxBuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
	b=heRk/mr6iYCfxnhSOMO214INpy1fFSFnPp7ba7lTluOs+rnOjeCnXxfKpVMLFh9mg2OL
	 obj8I2EyHT0DkxJcUUCHbLBBCn7WlZayytdSI4f6L4GWAU9cIj4ggQ3k1+hIASYtlRsoV
	 VS8jWHgebs/Ay9gSkB47AR4QqcQ3XxrwV3LWBbnyNUHMF0/wJEvdmlSPwwj/nv980UeZe
	 /THKMPkI1PNsNnxhPc3pgjJfESSj2QDosvPmWUvMM4nHv6QOS+UeV2eLbpQktG2/QJ3fL
	 UQHXWu5fhvz9/4ffohRcxrWUvUgD3z3W6Pyrx7J2UVsC/kS8El7HA+xg1IH1WjrjBxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osPyt+7g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLL2Uayj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F679606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F679606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osPyt+7g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLL2Uayj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9sep3228409
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=; b=osPyt+7gO87BqXgo
	kNGr/upeu6G4kfXdw2aX0zXqPXCmquPlDq7nH1cAvHfynsrirh3/rsThl/93nwqb
	iukmzL/WJs7n7I7lwidTzPDRmCg5cmNJtyL5G1g3vaqwABcV8Lds5fyuMnC9T0rV
	r6/BOXltqjtxg2woCn6C/SA01smybM/L5NPV5LAQWJh0PTG+/a4vVY37VvDW7M1L
	oK0mps8+EelvvEFw9hKqN2uasifsRwfnnFgTgIzuZtBRJp5nSKUWMd4L0l84Tg6o
	0yEYhHgHuumeCFndoioCnqeRab3Hx0oxWoCqYF/DQ+KePgOUpjwwMGHQM3RZ/wTD
	LrFieg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8v8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:49:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1705983a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311390; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBlcNYvLckqyTKQ1m0pnVIlll8QXWq0ap6i5QIbWLH5YHDgpRIdjMI6iEp5XmTO5h/
         W03LU36wP9fXQ+ZZ+tYgqN1hD1P9kZSwqH8JPv7H75pg1H+C503ac4eZJRQOuD3QvE5V
         gMgivhloP7r4s9y50rq6rISVRS2ojK85GjD84QGZl90itqFHzfg5FiaXDMflFV0bLLEw
         c7VFeeGcKIcJLJakeEnbFs9eek/mv2KtyjZfnv/nDLO+DpGFa8osvuAw1WPr3Ju1Tr6U
         6IvUOziURmu3awg4sdJnffQHrgTOdJmz2wyoOFbFNbX6y9OQvJUqMbvHTwGKFl2d/A3+
         PoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        fh=tpPqt3DTlTx43V2huPsyLV7dxz8E0VmnJfRIf23HWIU=;
        b=EKf587x3EkmyqbK1FTu0XD0VLx6ubA5PTPDm0v/nWH9kTHyTuVPCoUK8U3+8t94Rz9
         HYOtZ81UYX8N3TdYRNbuivGktJbvgT4MIqwJXntH4vmrbxReWUeq7gaSrsetjcqXAHTH
         6Fkhj7HTvrFjkoB/4VXXauAlhF+xr0a3R/pKMkLDeQTmbeAVZfawcv2eGVtXYesAdb4Y
         5qTKw3VHh/IY1ohEk2LYM+nxpK8qLslOdIcsGnIFEc/AG+1Vjfohyq5csH0bEsS0gBkq
         yh0+c572sqJbMEJZLpYTFJlkmsCbsQvtj3zAMymNgjt7L5oYKUsUk0a3fj5uQL/tv81V
         ULNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794311390; x=1794916190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=OLL2UayjF3qHpWrSsh5L67U4QRIopN16Hqpfy5Fd8k9MDKgnBGQqs65UeLttv8Dbmg
         C34lINP3bhf6+KPcmsrt8G2/cShuI4dOC2G7guQAgtpaP05+mgD+C0gEBChaJoZ/v88s
         ZSjDGZlOBAKLeVltfobKtW4kw63ZoAy0YEX3akaT4X3DrkD8ZS9VjniepSbXusDhfxJV
         leJMQRha2U6q8AC6uFskLf8Hmlrs14+kdvolYB/wl0Z/GO/2yup8mT9xNSz0Ocf4X3hi
         p8UGtJ/aQCAE418LrLdNXFfwTj3xiSUfZKCRGJ9+fqivf/8PtsdMqgO4utlx9liYd0Tz
         OXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311390; x=1794916190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=Ujp8bYBD7P0EtTNrP5X+IJ0eXJ1orAYRPXmzeUHJouzUruXgt8HwnKZPLwYzAzvNye
         5/X7omPZGb/YrHwSlPKB75Jw7h/3c9gBvF8/QHYvQcg4o2ino6yEQOGcbZ8z71EqeHhZ
         5q8AbUxZYHxQfv8TLn3iXWC1+Xp/Gxup5n4sykgrVqfc42FiKC2ZBjBTRMKvhOY3h4vm
         j3s6Ph2kcLj0V7HY/C+N2tXQoO/F4r9lGt1Kdzr6Dk5Hue5Jb/+/qlcyTgPCcmxcBK8R
         nPj+5uEMwY5+YMSDm8HK9dvL9lcoQ6cJ1LDwDwcBsXoEi3YDqQWMe4Uter/vMkAz5s6C
         +g5g==
X-Forwarded-Encrypted: i=1; AL+hErH3xaoHnog9neXEIFu50iSjEwfLJqLsXNQ/XC4mnmo9gBoAHVuRzMdWeWLQUEW4j6SAmFPaTEWXmaV63go=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LhoRsSeo1kczDCk+dcPVgOYOTN3Xo6cIe/ruYpml4JOWZFJ6z
	wwmCWMBTEskY7VTCCsr/3J19+akH+A0dfL0pgl/g88QtJrIiP1VohJ+1F9VN/lI+y4Ap9lkKzpD
	DlpkfqqDxZ9Kzo2o7rubQ3WRPqsKcjjLfBTXRIYbwgiVK8U4MHCi3o6iKC3OTXvKB1Q71X6r0RX
	yUhfx4X3YigZ/4e70v7s3tkQuE0dw5egDOQQ/YM0QfoQ==
X-Gm-Gg: AYBFou1Gua9o/6zVDcmAUh6MhIJ6ogwScUn6CQFFB/cL9dSTkmVe8mR5YTsk1Va4NI0
	eWnkWIJv0gJXCdfokpPvHd7+ZoJjWutkoxo12rhQy6MKWa1YhIF4pZoYtkJ0zghNIG6Xuey7R5U
	Du/72FbwL0koTN+sivd3ihBMti/vrXjRMsSbUc4INbxh2+z0ICqKFCJb6Hsg==
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b1669f84c5mr2551048a91.0.1794311389487;
        Tue, 10 Nov 2026 03:49:49 -0800 (PST)
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id
 98e67ed59e1d1-3b1669f84c5mr2551032a91.0.1794311388919; Tue, 10 Nov 2026
 03:49:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
 <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com> <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
In-Reply-To: <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:49:37 +0100
X-Gm-Features: AclHuK94rNqkXJQ-LJt7eo296GzqJBUJ5kGEs9mLdz46FPtkzJbBx9mV1nByLpQ
Message-ID: <CAPx+jO996hZ1H+RTYeVc66PCvnYOV=m3PNY4Xjcc=+jdcBVXwg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: tam.do@manyhobbies.com
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zS_T9NFJbbS8SW0nI7uE69EVTWt04jY_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX+FAll+1SL0jn
 j8+6EeMt+Lcf5qPtDDr47EP2JgYgrlDFXjYH4sevxbjkqlYmr4UZ8IqUjZzoghWld8/6Ny7skxz
 Ygzf6ulEYUKu2CBjRlkC/ZajA9UllOQ=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af304de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8 a=EUspDBNiAAAA:8
 a=hraAJGsaz5TtD8VhunUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-ORIG-GUID: zS_T9NFJbbS8SW0nI7uE69EVTWt04jY_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX69qPxXhA+n4K
 PlPH4UoY/BM5OvRx4aznZqm6uxdS03urtgElE10JZOQUPPuvoD/r24nx7huEGOC4oAjvy1yFawh
 HxmmDHJ7Hu+HTEUjaTSwlBdQJ+dcJCu0ZlzTz2v/JMAyrE9OjwPJPNcwai2tmxGkLmmlQmci0BA
 kgXTIhRQCp6QmTVwKvcOwWTOHb224Zz0+Sar4NcEXDV+kMsrth0Z6uiq7dJpxm7N00j9KWgJOal
 VNxNikFrCMVpkpqxuvTkdnwEE8htP/J76daNdxqM4QGMARuo/pqO4OuDLpvgiA7XeiIQFEzQBd2
 fVhe5TdgKoRef2mlVtFkJ2Ml5Vfj9MWVDX5aYHsoOKLVR9pKTjtzkIGjgsaJgo3VGyyd8PmsL49
 C8k+W/KUcfVbz/HFGHy5D2u/w/Q4UpjGAE4SayOGQ41lOFNmh6AAiGq8OCQB2KCXOzjpLTpq/My
 Opz918uWt33H+/O8NOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100047

On Fri, Oct 30, 2026 at 11:41=E2=80=AFPM <tam.do@manyhobbies.com> wrote:
>
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
>
> Yes. It's the first update after probe, from the MMC_POWER_UP set_ios:
>   sunxi_mmc_oclk_onoff+0x17c/0x1a0
>   sunxi_mmc_clk_set_rate+0x1c/0x2c8
>   sunxi_mmc_set_ios+0xe4/0x144
>   mmc_power_up.part.0+0x40/0x150
>   mmc_start_host+0x90/0x9c
>   mmc_add_host+0x6c/0xa0
>   sunxi_mmc_probe+0x35c/0x478
>
> STAS already reads 0x206 there, before anything has been sent to the
> card; on good boots it's 0x106. So the card is holding DAT0 when Linux
> takes over. These are warm boots from the vendor firmware and it
> happens on roughly half of them.

I see. So perhaps check DAT0 during the probe and make a reset already
at that point instead?

>
> The supply explanation in the commit message is wrong, sorry. The rails
> are up ~20 ms later and the command is still pending at the 750 ms
> timeout. From then on every update times out until the controller is
> reset. Rebinding with the card idle never hit it (0/20 tries).
> I'll fix the commit message in v4.

Thanks for the explanation. I will wait for the v4 then.

Kind regards
Uffe

>
> Tam
>
>
> > On Oct 30, 2026, at 8:48=E2=80=AFAM, Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
> >
> > On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com=
> wrote:
> >>
> >> If the clock-update command times out it stays pending in the
> >> controller, and every later clock update times out as well, so the
> >> card cannot be initialised until the next probe.
> >>
> >> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> >> its supply comes up during the first clock update.
> >
> > It would be nice if you could elaborate a bit more on what goes on here=
.
> >
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
> >
> >>
> >> Reset the controller on timeout so the next attempt can succeed. This
> >> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> >> time, so write REG_IMASK from sdio_imask under host->lock, as
> >> sunxi_mmc_enable_sdio_irq() updates both under that lock.
> >>
> >> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on=
 Allwinner sunxi SoCs")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Tam Do <tam.do@manyhobbies.com>
> >
> > Kind regards
> > Uffe
> >
> >> ---
> >> v3: take host->lock only around the REG_IMASK write in
> >>    sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
> >>    jiffies with interrupts off. The return value stays unchecked, as i=
n
> >>    sunxi_mmc_runtime_resume(): if the reset itself times out the
> >>    controller is wedged either way.
> >> v2: held host->lock across the reset (not posted)
> >> v1: https://lore.kernel.org/all/179307312104.39863.1237281416347284875=
2@manyhobbies.com/
> >>
> >> drivers/mmc/host/sunxi-mmc.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc=
.c
> >> index fe4c0f6d73f3..55313780d06d 100644
> >> --- a/drivers/mmc/host/sunxi-mmc.c
> >> +++ b/drivers/mmc/host/sunxi-mmc.c
> >> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_h=
ost *host)
> >>
> >> static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
> >> {
> >> +       unsigned long flags;
> >>        u32 rval;
> >>
> >>        if (sunxi_mmc_reset_host(host))
> >> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_ho=
st *host)
> >>        /* Maximum timeout value */
> >>        mmc_writel(host, REG_TMOUT, 0xffffffff);
> >>        /* Unmask SDIO interrupt if needed */
> >> +       spin_lock_irqsave(&host->lock, flags);
> >>        mmc_writel(host, REG_IMASK, host->sdio_imask);
> >> +       spin_unlock_irqrestore(&host->lock, flags);
> >>        /* Clear all pending interrupts */
> >>        mmc_writel(host, REG_RINTR, 0xffffffff);
> >>        /* Debug register? undocumented */
> >> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_h=
ost *host, u32 oclk_en)
> >>
> >>        if (rval & SDXC_START) {
> >>                dev_err(mmc_dev(host->mmc), "fatal err update clk timeo=
ut\n");
> >> +               sunxi_mmc_init_host(host);
> >>                return -EIO;
> >>        }
> >>
> >> --
> >> 2.39.5
> >>
>

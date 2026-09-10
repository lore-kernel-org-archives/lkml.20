Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE54A0924
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056338; cv=pass; b=g3TRJzzNmrZIa9WxeQv+TUzq0RoELBjiSsUoyJGVFX/hrl9t9DYSon2CFH0MkK4mpMW7Bb4eiATDMwCwRFKVKw4LEG+GQatrVQXcKsR9W5Pgxx64dJh0WSsFY5Ga126Duyar0J4CIldjMVpxmxpwkn+dfhC9FD777mz5WhpQxL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056338; c=relaxed/simple;
	bh=54RhIuHDDM2GaGWdALTnNLwdvOShYkecjrdFePcvKsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nt1ki+IHsARsiYM7pHdAA3qqMalx9unts5UkIQLFHWQxLIXxWvMIGIdaXfsd1P+OA9Q2JIeFr02kXchttfPFFIhhNfCjwdI4yHo3EHTERZC3TMb/avUA5xHDdqXcWmlNitR5rokov3OnEwwQfuoTetgw9qJujcem8VDVYaVj3AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEm82QXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5+sncIB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEm82QXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5+sncIB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4KCZ1494228
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18M6Eo0NvxWAhenUsNXlgY3oGJusJpfPkNsLbndCZAc=; b=FEm82QXfrEs56Zqf
	GVpHaSODOL9WG7Sc3sc/WukGuOhKHK5SCTtQ6zX0dsaAcJ+Tpkg717pGFIyIcD3X
	JsknAGVCp1DFvCAXmMdy6oWEk68FM3HkjxzZoQ8ilCGjS6qTylrvD+AjLVCmqGrc
	mUXet3TJIWTuitbEUzD1Q92xSZYwZlNhhNX+OuaIo3XxHO/HauDWgF9L1iNycL9/
	oVtQ+L+/sS9N9a0LdWJwR9v2PUhjC5f/2XNzavNipcCv+/e9iVUqXjdqqrG0Kzfo
	XbwlLLL1MzyRbIIIz5u/RVJbHlivz+8KRlZQVYbc8Wpj/nuvuacyghqX3mcYpnUs
	j/Gn8g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9ruby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-869d78c3c52so967717b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056335; cv=none;
        d=google.com; s=arc-20260327;
        b=Cb0fRr2WF/gFTrhbd2KcUhlhBPEZPV2iDwbZFwhehoHWapH5OLZm31r1A1sBaeePPB
         gWV4Ls53OUe2Tmy4PnK1FJsXhAa60wLN30jsoMCRXmc4frscxVmuHmJM3Ee1FxXYHvPe
         g/VXCKjT1l79hBo0bm/gGOD2Uzknw4Mwh9/Kb+pYC6l7g+N0MKFpif4lloLwjwC9koKX
         PxpmXOXC5Fy7xIKbHzeZGqSxQRqfQKMTAyUpCJdJVLibaWYrDo/ZquA+3WGWSFH+mEw5
         Wa2xmUIpa58sWb0sxiqQOU7hN+OrtIsXka8+qBzdQjVUNXOb0RWc/Q3bTOIdpttFBKPN
         7WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=18M6Eo0NvxWAhenUsNXlgY3oGJusJpfPkNsLbndCZAc=;
        fh=NeenuwCY+Ado+e/dJ/NUVq/N4mi2ls0J3ncPWSM6NFY=;
        b=aoSJomkuzGRsPF+vmsRuj2sWwqeYz+CdrtWSuHTSgNDhwGP/NFTinjQal0hVpL1CWn
         9XJLxlnvhj0Vxx2EuJKgsOEiKd4l7EeNw/4RmxgaGT1VlzRsgZ6LIGip5bZLNTnpF2Gt
         M2H5JUUKGbv5XOym5koqX0H+AHlTRNlZxaQwy3F7tcUCqjMh/MhhEIj7VVrFLQVAuK4v
         YDMErN3+bnbBwXcE3vPVlLiWd11Db7guj2OAPGtSxjHXnx7QDKqx9mFuRYrO+S0FE9pR
         dpGuoksZBk9X6HF88yWNQvyZxSlnaIGJIbC7FbH2jJvYBNK7WGIcKt3pnJ7HKNL0INHe
         4Pfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056335; x=1789661135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18M6Eo0NvxWAhenUsNXlgY3oGJusJpfPkNsLbndCZAc=;
        b=R5+sncIB1H2pwhLmCfhwLUT3aP8x4Dt6qGII+noKqk3ktpcbUuXy6S4XofWnfRUPTr
         nFnBfWfZaH/WZ0J3DS3h/eVmZWDhf/p8lIc/r/WmGrYe+UDf36d3H/vCmKESuKOnFd0z
         Yp2hRWzCdf5GwZVQWuOEEIk5PyTrl7ov73BP2tzy8cch9oG1lUxGrcobhJOhIKYxi83Y
         p5+Ifk572q+HPxLQj4f3yqIHO3Rye9QtWzayWx1jHu8LGkjKVe2uncD1ZcASbWiPyJNW
         bZ2wDYtC2fMUQl+q1EE+QX66TYCpeJwqUjXbMXTkGrJg4J00XhmBpt/XJ8EkXZSZnbdB
         k+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056335; x=1789661135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18M6Eo0NvxWAhenUsNXlgY3oGJusJpfPkNsLbndCZAc=;
        b=WIhgkiKP8MGCVl1KX1pUdjvqbX0bYB6lep05KiQkTutxWyB4qkZtyBGsYSTXlucNtS
         2Zwx1jMUYv5NJzieAEyvzpblq/W1SaTQMMbZSksFCnTO4V+LVSe2poFENOygAVspW3jk
         EqUZgCel5FafmFUnBfTabq55BqEVXGGXSR59mrj5hmoIFOZjtl/zeiwHaOBEHU0NqZ1G
         +9iFtHPoPiYvfUyVfQSv3dnSLeDaVNZ9LDybCewFTnXv8Aj2X2bt/261GViO3kJEq5/8
         OllwSehRFOWvZRRvsvIuYJFz/U/G/ziJPwze47KacpNIlpcCHFxA9go5ZZzhir82iPdp
         ZW7g==
X-Forwarded-Encrypted: i=1; AKwUvBywIQ/6IGm81HzLeoZDVHfs1vdeV5L2hfG4e2mA628J9RWqReJJj4N/4SL9dZbLwte+VJOO/i21esRNGWA=@vger.kernel.org
X-Gm-Message-State: AFuF++nyP9Rl8eoKWQg+jXJHSa46edPoCWdoEaigZ4lhHA23rOZyYmfR
	qViZMNaCqmdtmawADYZtNny1ICl7pd2H1OTXApfPNTe5LeryhsD4hsxArg0LRGqKEMyLnQkKBIZ
	fktDx1/vdjxh/Q+CM+RxSRmPTi7KhbrCoOdHEiG4zP6lpvEpxBKydZyLA+TjZlRHWsmpe64gTU5
	2gIqGNCM+SAo4LBRIq1ruTh1MHJ9pfTELU2zy5iFOOMg==
X-Gm-Gg: AYBFou0d7jB07Y9Vkjc+m1f1S+4LCid4OENiS7p9wKR4Hh9iRs5Im2foHbDipG41qdQ
	IOexVSyIeuZ+gxrtBFmez61vWKOiWkgYUk8MUI917RoNCaT01/o7kmLpwardte/LeLRn6b1QSlC
	jABhI5I9zLCjQy/FiiqMn6gB8HAIePcI6bChdvbdZGZ/UuE3f+zHOj9uptvg==
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr14709196637.14.1789056334532;
        Thu, 10 Sep 2026 09:05:34 -0700 (PDT)
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id
 adf61e73a8af0-3dacbeed903mr14709128637.14.1789056334124; Thu, 10 Sep 2026
 09:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-sdio_uart-v1-1-2cf3b1352c35@gmail.com>
In-Reply-To: <20260822-sdio_uart-v1-1-2cf3b1352c35@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:20 +0200
X-Gm-Features: AcwNN1WTNJQE_bI3tDsx6RveXi9DnvcQ_k6yd2A9MyqwIo3F1VzkjjIGkFm6OsU
Message-ID: <CAPx+jO-rNTcPM=sgY6w4epUhvThPDzKRDmQgWM619+J=yZ+TUg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdio_uart: fix xmit_fifo leak when the port table is full
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
        Alan Cox <alan@linux.intel.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX3XXTWuZwSRWo
 yegCorcuBI7B+r1YWKJEhjW2Eb9PcPQtqmTOiCISRo1hHXHfQH+5JqKCZ73AETvL1Ix390OqeWV
 nEhyTGoaFiyEF6dbsIZGc5aHajPMQoInL+5NdrNF/xXoHaG/7NUXIrp5f8HDY3EwEe3raATxpZJ
 qp0KT6hOUAkFmSZ/Jn2mwhLyPmRAQNPtOYSpuSTqU8KIP69AA5mmFAC7WJbGRlHeDmtkNPa1CL3
 aQ2Ed7OhWwEVVaL9Uld57zSqUJb9tJ3b0fnV3l3DkI1oqqLqvy+XKTZjA+y7up78UcNYa9iwTcy
 Ua9InqSciTgtJkMf3dNKJgjw95mIyT4mjKUH7SFXfO92CW/r7hy85wVdq6O3Y3RxQ2cRh8jPzho
 UVxufMVGLPBWND7aEfOH4Ne6XzMWjhKMAzUxLlKhTUiMZrC66h2VHZXmmrplrLG1Ri0kYek0Gpw
 zIMVqzY7oQf1bgnMNJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXzIa9YSSww2do
 X2kotdxzTCTLxjHMySJ+bEtgnctXke7XP5cb/2k713SrRhBOPXGIfxsuwqpFWkgp9WOHnLQjGTS
 xAnYgR/MmRhGxVZ9VZjkKDjcvMWYglo=
X-Proofpoint-GUID: 1cbGd9vsaViH_wNobmhAqvO4mHdZBj6P
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2d54f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=UZU69nzyrOPdbO5r1bMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 1cbGd9vsaViH_wNobmhAqvO4mHdZBj6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100195

On Fri, Aug 21, 2026 at 8:58=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:
>
> sdio_uart_add_port() allocates the transmit fifo before claiming a
> slot in sdio_uart_table[].  When all UART_NR slots are taken, it
> returns -EBUSY with the fifo still allocated, but the probe error
> path only kfree()s the port, leaking the transmit fifo.
>
> Free the fifo in the failure path of sdio_uart_add_port() itself so
> the function retains nothing on error.
>
> Fixes: 8b197a5ce7a7 ("sdio_uart: Use kfifo instead of the messy circ stuf=
f")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/sdio_uart.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
> index 7fd5dedf3ac0..705163c42972 100644
> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -104,6 +104,9 @@ static int sdio_uart_add_port(struct sdio_uart_port *=
port)
>         }
>         spin_unlock(&sdio_uart_table_lock);
>
> +       if (ret)
> +               kfifo_free(&port->xmit_fifo);
> +
>         return ret;
>  }
>
>
> ---
> base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
> change-id: 20260822-sdio_uart-a702d7cc5eb4
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

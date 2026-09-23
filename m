Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9193481AA0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165554; cv=pass; b=gJwiSjlGAq/FpnxNilWgHFi8FohunKR41WttseAwuOSPiN9jBrwERblO07ICjqvfAaV7zak+J5v/EAyHE1Ay2Ux8eOPkJItEeXDF+SKjZU43hOuaoyxzwSVaZN7sZO0CCRmpM1WafhzkJT8MP2BxVpAFqGOahZmfnJc24JpyeYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165554; c=relaxed/simple;
	bh=otl8liIb8W8IWl9VhhkrAOQ4oieAS8mQOQ3oJNhRrPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhAdjSDvqDT91XxKDpHEkcoFqjF+eY2n/fGpJChKhpPYmuSqqLUIZdFd05vmr5ax5WZT1/Qeh4/AFr1t/Dg4FKrLgH5F/bGPW532S/CiT5vTLWZ82YkPSm6oSkDTec7Ideb/h1aK5VEXwZR2xL2+nlRWWSWfpePo4raO9KlzaA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ng/mumkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC/MlAkp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ng/mumkP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC/MlAkp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbvod3029285
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=; b=Ng/mumkPNmTwMVxr
	KDEczxhCcBHu0SPYMHfl1XD6OpmyhbbSAaOBYgcj6DOTpqB7516LIONMW0BCMtND
	bfMX/E+RVovSWDdTQWLyVly0kdNGMw+gmhbBPciZR4kwOUocTudjSTCSky2j+Ncr
	Ga0b1T0/EG+/R/pXlLbohmeeG5XpJP6+Jbr512R5cYWQIvmGjL0sRTWCHSo4ZvPj
	OMQw7v4/xvkFqXUjKT3NNXH4fCE8hopPX9d07OnpGCH46NXnPjaxrp24SdZsC9PB
	MeXMs4uixQx+UInUDebGVMVAxE9SraG9ganD+4VqjHlADW4nLoJ0MfnXrBu1JiXL
	/SHvFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarqgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1155831a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165550; cv=none;
        d=google.com; s=arc-20260327;
        b=b3xAuOHADcYHQq7v1ar6Fn9xo6GKXgG8uzc1PmMqm7WrcB7wsCK8hu1QarzFTD5Ciq
         DdST55c8kXku9nzOn1VRNTnOmEiMEu7AVKwGAmbSpFDdio7+/n984k9IscQ73PlOGKe4
         hPwA8fs6PJA6LGqV3vTysjR78J2e/ZBBavfz9xLomxxQBvf4KrFREWTsY4EMsL/iO/gr
         OkwAwtE3bwdIm6gLalcW4a34oaki9kE8r24X70YVeD1qKBx1IdbaW1D+UMYOQsUtscYB
         zJtE7mxIeaMEc2R+gYAGMjtvNK2I/ZEqHrQ9NHCZF6+vmedqxi+HyFpNUY75z1Poz3LT
         FGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        fh=q3KLAU2UZJSP5SV0XEdW7TKzwZL8sgIXlA3O+LVEdRs=;
        b=WV2Rc5y0H42+YPa8Am0jr7chahOSU7UO9vOHSIeFdc1vJjIs3LNvPgycSU5K6PXOOD
         MH5yb+QmYueKJPe9/k18PJ1CS4Lr2+t7e50c7pJ1rzS2/kwHxGKMnww9U4UeFS4wvAQl
         9Mg1fExlm7h9MA+YD6nL5Vhv/CWzuxfdKD0N0jN5VIyZAUtAchvUqIqECKb7/2Qr/JAH
         MDR79F80NZQoHq2nkMm0AukYleNpAIIxgi4+viLHONSAjTWKN2oay3fj8QCoIUyn9ZNR
         ePK9ml5syToM34KRyGyHRMhxSykiA2QtiGg6Yz1nUm+7j//2+/8TuMMSkPxoHh4f5oj7
         XcsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165550; x=1790770350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        b=gC/MlAkpLvFeTOfaZ1XZLVOQreAXyYOUntO4m2bneufuoQHAStia7ruOeZKVv2KAzb
         qc6ID84sZraMGp7k3MVZlsAEj52wTw88ltmo9tkyXCePLudYSf+8hbgIVfNmNp5pZ/l8
         O93k56lqJXuoyXZiYNGRvohrRt1Pk7rYWsrmg5MyGWOgwaA1qjLdi3J0w40JhMOIueYr
         63Z7W75r5JpDQoK2lXU/M22Rmdq+uR5QPdd6NQhKvGN6gnj8C3tFJvXosIrAGufqoNT0
         j5jBoUBe4g97p/niP5H6D2umtRS5bYsgqhcAjNtTlY3ceW/FuoCd9YI70/86KabnxYEw
         D8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165550; x=1790770350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7V7ql5bnTlujjDYznFGFQp5Hg4A7cbqQcUtRXp+0cs=;
        b=zfpLjxz0AWpVl3QKBTsKOylh7uhG41W8ZLH0AcFQaa+/lxn8Msuw1YMgfMPn0i25Xg
         aKJ5H6l7Wt9yxoNtDz/FAzMNFbW0uWC8wQbBHxss4O2NFj9kTU2P6nOon+0YvEJ36p/Q
         kKe0LXu7+6eEMI2unJTRG5YXXC+FI3fPNjK/IcdaTJD5iCTCFz3WTclPZUoPJmI6Avnd
         bARnT7G8RvY80LdBpi8/si2hlCugmYyqpTfbWr7MW7daSARMS2HrhQWnY88WHilNqBep
         zA/W+mhrCAeWE6Z14wtb9RUsrvUTsb7dQjZOYYyzSaN4bD44r+/JM1l/USqRH64Zs+AL
         7UqA==
X-Forwarded-Encrypted: i=1; AKwUvByq9E3BsjZ8NWbSkeJwMb01X1uae4UxzpdCubucnktlvgDgDnY+yIabyRVh+DYb0x/KqjSIOscNcsq0DdU=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Q4RwksPN7/lQT2lrErsMO9hHbbAqIr3WZL+bX0w+C5QR07qz
	4128r3IcK+Pjwd04MX/J4N/i8wR09+NAYX2Zn9YDiIDXyLgYh+HelV2nxqMQrAzSWfw5QA0Ssdu
	waMRZZ6jSinBah+s/iCqsP/L/uYox4dY+vtVqQ1kELQtfSnU7MFztPWcPMg+Teo+UW/L66JhNHh
	J1mZFCZkFMb+ex9/k4o7uqesPH1LPVGaNzQTb/1tXX4A==
X-Gm-Gg: AYBFou0W0SQSoBmTAA67HfXnkHjxhRFehjlkKQAHDPIRUAg2VZUCdy67xx0dSRXNEyr
	UjMQe0IqKZNSe+9JMpQBxJBQp0OdkVnZ0TtgxLt1ux441UkC89I+3jvBr/v24/g9cvLF6VCjsyN
	3VaMvJiQzI4pcxxc5dB+avLuAuAoLi2nLxyrxgGZ5KeZQhB/Q+MjC0BsUifDzg7MfjfTNn
X-Received: by 2002:a17:90b:3f0e:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3a07e5606a5mr2042120a91.24.1790165545299;
        Wed, 23 Sep 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0e:b0:39e:59a0:46b5 with SMTP id
 98e67ed59e1d1-3a07e5606a5mr2042073a91.24.1790165544489; Wed, 23 Sep 2026
 05:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com> <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
 <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
In-Reply-To: <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:12:11 +0200
X-Gm-Features: AcwNN1U1n7SQ18uSpUqLgK21GdYB7lBiWF4g5o3P6GVe9OMu93MP2iK1mK9PKiE
Message-ID: <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX8fjCO44vnZ6X
 LMxohU+jkIvYi/945IE8tO6EgQ5O7izq9Uh1vfM0hjUD8Uej2eomOMefYaFYMHzp9CxiXh71lSe
 yGYQfnvQdxshxq+2XQj6NBpAuFzpyldTBe++OkrqRCeMVPwem5C33f6ERuUCyQKOSrtsI/TmFHg
 4DDsklq64iHOvr2Xn+dWmmPDSdRM7H6MwS6gRN05p6UlFkENHhA4DAPWjc13kHM7oDXSO9GXFR2
 fWPBFDQCD5HmExWQFCttT4zx2RiqfGTZ0gqLtEPLfilcEpAn5Lgt7Lg+/gbBabFeqK1a5W8lQiK
 C6/0k5aotea2xQo/IEQqekuoJHroRq0HZBvQuI2zp0rWzd85udLjm2/tRRc9v0VtIC6KNbH5jqt
 2D51HGvcQFRPtQWUElaI1cz6YM4kkenxxfK3e7f2sARHIIMIXY7acoAoIuoZrVszoGxiS/dT6rW
 4UPK65fJXwdr0jWFUDw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3c22f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=tBb2bbeoAAAA:8 a=yC-0_ovQAAAA:8
 a=gynxR62fjgbsPHoWIaoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: TwuLojSvGBbXojMvVh5wfJ8TMUZXixo_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXw5/uhVecqvYj
 GhJLoybSI0pGA9b5effJMeCWdK8YGR6rcSuzHW8uTWWbCVO/RbrBgshutzz3zOnhsAM1bm7hcVa
 kV7de/8gLGecAlSPcK5rAk91hTdFPwo=
X-Proofpoint-ORIG-GUID: TwuLojSvGBbXojMvVh5wfJ8TMUZXixo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 23 Sept 2026 at 12:33, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
> > <ayman.chaudhry.kc@renesas.com> wrote:
> > > Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> > > to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G=
2M
> > > v1.3 SYSC, however it lacks the A2VC0 power area.
> > >
> > > Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v1->v2:
> > > - Added space before closing brace for `ca57-cpu1` area
> > > - Updated include path to SYSC dt-bindings
> > > - Added Reviewed-by tag
> >
> > As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
> > Add r8a774a3 SYSC power domain definitions", I will provide a shared
> > branch with the dependency to Ulf.
>
> Alternatively, I can just collect all pmdomain patches in this series
> in renesas-pmdomain for v7.4, and send a PR for that, similar to what
> I do for clk and pinctrl.  Up to you...

Usually I pick the corresponding power domain DT bindings and share
them via an immutable branch called "dt". I would prefer if we could
keep doing it like that to avoid confusion and special cases.

Note that I already have a couple of patches queued for the renesas
power domain driver this cycle and whether this series conflicts, I
don't know.

That said, I am planning to pick patch1, patch2 (both shared at the dt
branch) and patch3. Would that be a problem for you this time?

Kind regards
Uffe




>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

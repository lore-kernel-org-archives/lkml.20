Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792481278;
	b=szgVJAW969mMuZQ9PZLV55hCyQi9CCJwHQV/On8y+5Q3hZmAB0cp3HSg+McELlcWq0NY
	 JWWUR9GDH79pPebV6yXX7uNS5Ikc0qXa+McqxkfdebKjb36lTWPHwTGn9A//zjhagCPrl
	 FMTUb4p6cTZvflrd980sTNWt3YQA8OEAegzTasNCVJOhLKET7corkxxFMZUMWbofLXvH3
	 QiymWCySpu6iBcgnhDhsmvbGKD2VgYjT5VgpX9VQ2pG0YlesnF0TYfupqtItfd+CokUvG
	 gLzYGiW9xMq8A211XGFgKc2338pucGS7nkfaqXfYf1JSQEyyiMGV87unpxw0SUpMMSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
	b=AYWAxNE98elQm+Y8LswVQBRRufQ/J8jAen+7srm1IC0988cTOmF283csHVk06AvXeSrE
	 xAl1sNi0jd6C4xGxQy9LwOw6iMttJqiShJ4kcN4C0YT//Tdq5pGTabhof5rbqYgp7PxSn
	 a2lC+OhXmIdNFh+gZQz0U5AKc55AkKvbFT5sluYB4MewqkR7kTm/aBQWBNTFN9IIsSDs8
	 oQ2BmAJNkRBEthWvxlMFHlPwRNIYCmvAEbcLlPzAAtiDkI0VHKaI2SXTbbEZUTCu0kiD2
	 szVvf7/ZA9XZ4PZFUBnlIATZKCOmXUnHW/qrcMu+lcaxRxoX37PRCNiO6r/IZyuo5YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsUUgMmk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB0606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9DB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsUUgMmk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAbN1211018
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=; b=JGMTvWOlYgDWwsR4
	px87J5+exc88G4hmXIZIwtukYLxRO914Z4LsmKcoNegLaS2ElQ/TQ7t8F69p1CSe
	Bm4DAxTy1ck9PbnyM1mSBympoFSqVOkR3XNjstFzb0Jddht29FnN0hdAb4n0dbIy
	NpZTu0uBCXhwG2BXT9a3g8+9m1b7Futb5aSRY8x/W/R+Rb7wBK5HksyotzZBDvU1
	9zj+xbfHza6SMMsKlck/LOuqY2APMA94D3G7jUIMT86nH/LS429AmPyqGd/dIT8j
	ZmssFiysJeDA9oTvkU2c96rKltdnbkwBrh+ar+CgO/70aIW+1vz5XmB3+PlYwlZY
	Al2OVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1ckx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a2de2cc1so38177416d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481276; cv=none;
        d=google.com; s=arc-20260327;
        b=PoTh+y1rq3cbWPMSeK4Wak7SvTqfhQas/yp/4ZQB3RAeOzvlHH0c1u1Y6yPN6aDDf4
         mcUpRoXO4D3F1F3rSWqAzwbyLMaf5109JPRHIRl9UxszHkkgqEhf2J4VSwSK+sp1egrD
         y5CSmvnWQhFtp4Vl9zI7SQJO8hpak1r70ACpIuIisUc220+5Mrnd9jChkdihAQmEnzuh
         4ug5jObHUenhvlXW/0+XxCdug4LhMiTV04Dr4tlPoE918a/sKR5unKLGrCs4FO6f4bR3
         s4lfb80HrddoEK5hhVZ9rZqNDn1zzSKJ4IlhEWatrxsHoI2r9zhLhQobojGkJp8VBPkr
         Dntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        fh=5QCwuwPymyl9aRgu/PuBqvF7gToL7T83C0vq9R2oA2E=;
        b=U7ff1UF28WB33P+Uotkz1XL2soDb61bVVYMx9dnOLAZJctBGj8HLmNLWNHCEhiD+PY
         Tfmx00m2M6IQfNlRZCoa9OWZ1a/t3d68B/pOkN0L6wBYvW07ZYyi0rlenN1nvaMKm10N
         fpQSh1M7ElC2Bp7syzIvelW5MBBl3/GaPmb8Sp0SEstXY261HjMEzVXc5Vb8Kt6W+3/Z
         IC1rXUY6XfMkMNYoVqgGuuOw60TxQTc4F7YQYzISL5MR7fLIecpDe/XMH381C/fahTZt
         MUlbUdXk7h2bEe0+Qb8Xwl/b5FmKGZDl/2IKEIdHGkLgmuo2lS2zyHoX7Y413uIfHb63
         OOEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481276; x=1793086076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=HsUUgMmk0b65hZxUGTsKmWWmrqC2vVSWE6HZ1B9CP5iTl6oH6q/SGCPnhWE0Py3czf
         nnh1Q7Ppqk3mVCFbAXqGUA93GqAucPNjq8BlkUJv6b0CUEhDS3vTD/7Jo96E0FhRE5H3
         nkTDlOw2GQZRVUV9lpXaj0mCYj1kaf1QAT7cJVi8VvgrLWXPhkGmesTWvKWHKLcXFao2
         UciWKhuFo7baRbNavt+bRYBWz5Ek7hrYpIK7Nr43lUbsoO9Eehutw72gmOaMWxbjBrXo
         jD4nL6ALeETVRi93zXkmtTuTDvnoPsTMtXU2YlfGnprkwze0/dEJbtSKVzpHfLUKvyf+
         EeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481276; x=1793086076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=ERsa9Q0w4sFxu3HfwixyJs7UIQ8fO18jq5oWxf81twOM2hoeECOYfVhBh+xsdQfphA
         TlOLNYF1bQtFE1LsxdsUqKrqOsRS0giPs9hXLWg7vcm+S/eNkcyNQ1N3M9BPrbhwPrs/
         45npq5IhYHGCI3Xj6zJbGYWBkTLoLY88vpOhbjlho+b9u+Ln5Xk27TYfP6sUPpGakLas
         MlGESTONQOLnpnuoR5LU2f75omIqdl38kaXIXkhpWzalAHYuFsDYIq8SxFiMvS31MrIn
         jumS40uVaz26NPBDJf56uRgMc5ywFRm9Yl3ZlxRxu3onGzkHFHSoYxuoEUjJxm2Ka+B2
         9hpg==
X-Forwarded-Encrypted: i=1; AKwUvBzcY/lF4++nS6zlCcByPIcplS+pBCwz67rKQMoh1Lf4+YE0KSDYeYWgjQmfBKooMRz18f73j0QIglxay8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2WBXCfeG4JuAB7wFxSUeAmIvli1UOJ691Rvbn0jDn4+7l/g10
	T9II0QKYzEo36ElBhB1TJwCuNG3YHt0OgNVGhkkSEKD7dN7Ad0Oj7Witg2QRRn4ndWIHzgWQeEL
	jVN+2pJLYNYzWEZuaDjgg4OLIpJcGyL40z2j4czHR0d2t64bOGti4IQePoa0zk0OqOHnUO544AA
	vPfcDbYNK+HXAIgW5rKa+gJAHDm62cZ2g4WZlAXCuiFTpVrwJNxCnt
X-Gm-Gg: AYBFou2GDEperc0T8vClIvgAVo87koJ5xMNJhLvFW6RAAH2wFXcRW9cT/KtTB4nxQll
	w08DvpwDeF6/9ao8V2TKD7kkt8uil6WHmpTF3q/knT8+mcr4Jw3FNi6odypKz9Cn4ssxgvHP/e2
	EtOgiPZ+mq5/D+KjP7YfNSm4gH+kbjF3E1vZap+mm6ygtjMf6u9XTaG6xqFx6qowyD3nYh3ZZLi
	UQTD/UlOn3xGcnXsGmsTJPV/2r3w/XPCKHqwLTnMCFsBTgcA0j/C9tsn03YLlXjy/uqVqqAPa0=
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93f29b7fa60mr1609173685a.12.1792481275967;
        Tue, 20 Oct 2026 00:27:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id
 af79cd13be357-93f29b7fa60mr1609170585a.12.1792481275371; Tue, 20 Oct 2026
 00:27:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com> <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
In-Reply-To: <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:27:43 +0200
X-Gm-Features: AclHuK-6GBMcAS-d0BXDcZveUx2q3Jcid6zCI09TYG0U3nhdIt1a8EQqHNimECY
Message-ID: <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iiPiPyAKwr29FG8fT4vlJs06xmvasWoO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX6cEfPF/yWSht
 /v5lGlQy4w7nD57KQklMj/rleJPY71VD7c/htMxhFNZB3FyesV+6odapMTV1u+BicNLmWMU5hUV
 iLN120Z+FsdsiSL+eEtYgLNpRkg9z5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX88H02GOQnnQq
 oQfilREgbLaIUU3Voh/f1gpEP0G6S1zQaUDVBjfisGge1cdYrVmWzn3EqA5klTFAIjizbl/kAvJ
 QAeS0mxsYbbvcTEuIHDirDErNDsBoCypqdlY5hoFN7bBNANhJ5dfzgk+y/KbPzLdBhdmJz8kOVa
 3e/kXVE4SOF9YQrWEb8P/hLk1sqov0bwPfPYDtzmMQF9sV+qpW7MukX22T33IULbejY3DRq8LBc
 cnaGE26zES0RfyeyzDHD/6VDUj0+TkoR+ULQ6DjYIDq5+BFJs9cgbuOYdZ+mcTyMdhg6R0EDFki
 CDVGbf8hgyw28s+pnLOMVBmTdfUyp5s5v1mbavuNw2/E1fJlAl9DuNTBtWfsY+jmsIwJz5+Y486
 LEQN1innKbJoEovwSVwECISR8R/n/fU4K6YgijM8u1WYmKf0OZR/Qy8si7LkWRzPn4SH6tCD0SQ
 NmtYIAEupXpFzTwZH6w==
X-Proofpoint-GUID: iiPiPyAKwr29FG8fT4vlJs06xmvasWoO
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad717fd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=8Bi4WqdHlDIZjTcgTq8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200029

Hi Slark,

On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
>
> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >> For some MHI devices in some specific scenario, the default value
> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> This may lead to some unexpected problems.
> >>
> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >
> >Qualcomm
> >
> >> Qualcomm also suggests us to update this for all MHI devices.
> >> Since this setting has affected some existed kernel versions, it's
> >> better to be applied to stable version.
> >
> >This looks more like a workaround than a proper fix. It would be
> >helpful to describe the underlying issue, including the timing and
> >sequence of events that make this necessary. In principle, either the
> >device can be suspended at that point or it cannot. Relying on a
> >delayed suspend feels fragile and may end up masking the real problem.
> >
> Hi Loic,
> Honestly, Qualcomm has been analyzing for over 2 months and still hasn't
> identified the root cause.
>
> Actually I have explained the reasons behind the events to Mani in anothe=
r
> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.9570-=
1-slark_xiao@163.com/
>
> From Qualcomm's perspective, 2 seconds is not enough for their default de=
sign.
> They recommended us to update this value to 5 seconds and Mani checked th=
is
> internally as well. So we decided to update this 5 seconds setting to all=
 MHI devices.

Thanks. I'm really surprised we still don't have a more precise
understanding or description of the underlying issue. That said, I
think it's reasonable to proceed with this as an initial workaround.

Could you please send a v2 that introduces a define for the 5000 ms
timeout? It would also be helpful to add a comment explaining that
this value is required to accommodate the 'late wake-event issue'.

Regards,
Loic

>
> Thanks
> >>
> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime P=
M")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host=
/pci_generic.c
> >> index 7193a384cca4..40735beb46cb 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *id)
> >>
> >>         /* Allow runtime suspend only if both PME from D3Hot and M3 ar=
e supported */
> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> --
> >> 2.53.0
> >>

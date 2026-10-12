Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31F46E01E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796716; cv=pass; b=EHYlRBtOBYNBFhDwFHy9sAVjsXc/7ZefEcjdg/67ubshWhfpbZAmZNB/DnSRNH6Zs4vDUjV5aZyh90Wak02091wGlJt/S0gPaiP06/evhTfg3TVFzxeoSZ/b1RX5tnhVeJP04sfGXbaoRnjtjrX3dfgbYvMOb08SP8fcpO33EOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796716; c=relaxed/simple;
	bh=iykpEjmfj3py3tFXqIO/8lYbrm7769mPGBoqduQDNAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5JtU0+9Z8ywumdn0hoDdQhp66y1s3m1gpdlYWGEWMK+EIM+Us738DhXq4DQ8SvkZY29HhKK1wEWC1/J1x6bL2tFfoqJJhDdNUE9shJtP+lVQWCN3mepW8PRxrHG+d14krgVdohMVbUZQdWXauzh437wAPl+SzA8jX4J66pnd5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZEUZ4QDW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAR24yYa; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZEUZ4QDW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAR24yYa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kg3S1592897
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=; b=ZEUZ4QDW3pKDaaH7
	enBOUXI9Cq57lG1SlOQWSR64rd4k4Vn0jnbDl98nPvkBTB2fs1m6Q10/PUlmp1z0
	7hheaqgadDA/cQ65euiX0Y74PYwtwwpWDD9XRP9YJ6N0Os5/gw2NfabXFL/LguGR
	oRnJk9ysCSqzVD3DoergKQKt2TgiKrSRaVLqmA7NFIe5K69Q5JEpKIk0nBWBLIX4
	WOZIkHxm8CGUahlk9ve7k9DPYhTq5nsxBcOBmk9emXglguNy/70Xn/GBR7cK9c8X
	z+7DpRNbOOBQechsolEEEgcXGKGrIwhf03lLSOsoKAxPc3TKDtJuunrmz35ntu/d
	Jsx0ew==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0ycw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:34 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0a8c1b87dso4465977b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796713; cv=none;
        d=google.com; s=arc-20260327;
        b=RS657k4EJs15kxO7ZW2qyho40vY/BJM8YjyaBmeMg1ZVOd3lpuNsam9GoQ8n8/uK6n
         WvuF6QKkZf7xIhGqvA42RKjom97Yp0P2iG1sTSW46HoR8Hfm63G1jsJ0IO45xxIrIWz5
         wZSCWokIL1nHVGsm++gp/aHaiLdacOpkHcyJK3E2g6SetkDfh+2OEgKVv1iuvDPgzIiJ
         NkEYfbxetXYS+m2+MKXueFLTb3ktBqOkCL+lEHQY+Jb+5eGGNvI6t7AX835JHjnwvyVz
         OJMZCGSSoPlv806/YoILQ5bDRoK/xfWEuwj6DNAQDHCU9swl9u3n/t/87nPv/CMDDM7R
         nH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        fh=u/FIgKXvup/EsDdAJWzkOnLls8Re0IB5PQTyDB+A8+8=;
        b=SytMb5BTbdWviY8UWm79ewD5d9GxXTMS5mq7xeR0AYg7mRZ929GekA9FcW92mYuCiX
         dyGp/dx9Pgg6BI/UeOcxdDzANqDeCG/tgFRfO4g2WGjhsYmbcbMxu/kjTsFlqlA/Nw/S
         beHaw5/vKQtiPE+SKaP0dM6jDKAxAFuWqD/E6MZd/1wvmCZPVqyhK4eWvUVtBhCfXyr+
         fmrBxkT7G1kikEo7nFQFVwMVY4BnuxVzxQX1v6jkyUa7/WryLEcwsm8nCL6/bomuT4ov
         ivsWMMe8K5004NYRGEqsY3wACsAf9zzQE8d5RNpQaA4KtxfjrSsnsTMwoJ6NOJwtVGSH
         p0MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796713; x=1792401513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        b=bAR24yYal6XUk7ZvLf/XZoit1cwCxiz0H/qXlgJjdigQDVIYxKyda5jNSbidHIEeBD
         NKsVdwXe0D5KPJBdi0ODNS5Qg3XbZiE1lwct3sl5nYOx3+ace7WSxN5s4whMXOS5xeZO
         8D4dw70lxLVGwkDR79TVu4SDhatmoXb/BPuQmzNAkRWArZMVifUFTK4lrlGMgHKpNizD
         C1xdESrEyFMm2+jcC0Yeta5xPf+DrHJ6yHPCA+N95MQ/mLokknjN42NArXahx4s6NZ66
         Y5h0Tnkt/J7DLmplT1j/EGjpnKHeJVTEcQFGeNZ0YSvQ7CxGEoq8HGNNWoA5urIGVu5l
         qJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796713; x=1792401513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        b=tGCccIm+mg6a2eDSROPPrf6nyJnz2JkCCow7LAZOq9IBhprKOC5FK5akb8any3Mfps
         btk2EeSExficdWulmF2XjheVQJdfbS2UsQ7B7gdZ8sLKjsAlfb7J4DV25HinPFD2hZT5
         PKiwkTPZnwmeuejUoNEN1NmE+O+G1DTRBg5rxDmly5NrCtHSgLGuyF9SKNopJ3IJ58LO
         h/9oWKgj5fyXGbzQFoFE2Ddh4+bEeDscFf8+hdBKwmlJbsO9Okab1kAEnxFxQD6yIgRJ
         WmEhV475F7Uj04AluMMgyLgwJYzN2ngSBcA0iCJgqnd8gy+8FQ77RkwYjYD3+n/8y6ek
         LACg==
X-Forwarded-Encrypted: i=1; AKwUvBwt5MzsJVXQLcF5m6lD0SclIUTG2G7k13ZbfBYirKpa6aPhYFZn2SeH+rYrBEe9As2OiuszY/DUQPLlTJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2roWyJhnnqeP/mwbZ3sJ54IvRV1Qlgm+1CaMQoIO/vSFnerms
	Co52vhIjZFseoqlr18g/pgH91cyzVuLCTRefRekMim59VzRSKRg15M7lt3QXvbabhtHXObVC98a
	f0UOeMTa9bXEgUQeRxLCjxSLRYD6JAaRTat+zhjZV9zJLCBHU2Mzyq/LstG9yf1QbONcLjsk4sa
	Ea9XjNZ27aFqtmLdgEeRQLOqV4ES2Cgxc+LI49W0hfTQ==
X-Gm-Gg: AYBFou3kEQK9Wd6dhEOvPgKxz71Nzu2zjOIWw3LHqfGQvq57GgtC5kRhxPheBhY0WZe
	jsqWzfP8035g6ysTeQJe5u6NisBW8+L4hKYeInzyLKJ3HWzia/BK2wSbHGSXbnhOjs3kX2Kr4m9
	LsOqZzuM9oDcAuV3uoFwyreZUzuGzDgWQI7050RE3n4jFjsffeDskNZJ31DAI=
X-Received: by 2002:a05:690e:12ce:b0:677:be91:d866 with SMTP id 956f58d0204a3-67936279c3emr3691383d50.47.1791796713540;
        Mon, 12 Oct 2026 02:18:33 -0700 (PDT)
X-Received: by 2002:a05:690e:12ce:b0:677:be91:d866 with SMTP id
 956f58d0204a3-67936279c3emr3691374d50.47.1791796713019; Mon, 12 Oct 2026
 02:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com> <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
In-Reply-To: <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:48:22 +0530
X-Gm-Features: AclHuK8cie94nVha9kpPm0-A3e2nKzEU2Wbgvp8ortr_R4B7h9niD3vVrzhaPm8
Message-ID: <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: mukesh.ojha@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        harshal.dev@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acca5ea cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=5OJEbP_EH8M4abXODLEA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX4YkwQA4+ZeZd
 ui3sopeAiXX3aRSlHyPlobH4Rj/CaG+ceIybGzzWutW3hmsQ3ykmfcCuUAHIfy1YtTBb+MdW4OO
 WYxg1D4WX0LDjg25ZjGKug2iJ7ijE1CKXebokY17lNguuEMuGmwbJm42MpuFD6oSzQEU8Iuxcum
 OHEsFF37XPmOUK6BqWxh3wsJCJt7VJOc5h6ItlcWuzLPzqbi3Mcae7sJHWOVh4lS9YBNpg1ooTm
 g8yr6742ZXqhSrAR1A/e2xj38bCEsDf1+VAIgAbPxsTU9IljHpjiAj+sSwfvc5DRtDN1RO8zPIm
 sdtIpzQKW+9eIzbmoLDGxeBByvEd7qBApvN2tImU6EVeco9ZYswNydphKEKXq1JuaiT6gSkg/FU
 DKaUftnX2AeIyR1x+gULrQkiXpmD9SjaQ4hx+ug7UQCxjOUybFTam8M/tABPNX/34p0N30HtVbH
 204yf4+/OT+eb/LGDsw==
X-Proofpoint-ORIG-GUID: 2zvJCK-JhBZ1BZvW5YbxVjufZe6f_NGg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX8xkj877/eHch
 0z6A68Cj7jyVPd4IJQ2UyxHFRZk5uZxDxObQGVKNqfxiCQxr/+knxa5QuzCg34I0d/N6F4Z3rik
 LsNH3GXhMbCuXmB+TZxmYlF4fc6Fd34=
X-Proofpoint-GUID: 2zvJCK-JhBZ1BZvW5YbxVjufZe6f_NGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120036

Hey Jorge,

On Mon, Oct 12, 2026 at 1:33=E2=80=AFPM Jorge Ramirez
<jorge.ramirez@oss.qualcomm.com> wrote:
>
> On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> > Stopping a remote processor clears its cached resource table pointer
> > but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copie=
s
> > from NULL when the firmware has no resource table:
> >
> >   pc : __pi_memcpy_generic+0x110/0x22c
> >   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> >
> > Zero the input size when the table is NULL so the copy is skipped.
> >
> > Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qc=
om/qcom_pas_tee.c
> > index ac33a00687aa..a52a7df385ff 100644
> > --- a/drivers/firmware/qcom/qcom_pas_tee.c
> > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct de=
vice *dev,
> >               },
> >               [1] =3D {
> >                       .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > -                     .u.memref.size =3D input_rt_size,
> >               }
> >       };
> >       void *rt_buf =3D NULL;
> >       int ret;
> >
> > +     if (!input_rt)
> > +             input_rt_size =3D 0;
> > +     param[1].u.memref.size =3D input_rt_size;
> > +
> >       ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> >       if (ret < 0 || inv_arg.ret !=3D 0) {
> >               dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err=
: 0x%x\n",
> > --
> > 2.54.0
> >
>
> could  we merge this? as mentioned, it  protects against blindly
> dereferencin a pointer that might be null. I submitted another patch
> that should address the issue in a higher level interface but regardless
> I see nothing wrong with catching it here as well.
>

I would rather prefer to error out to the caller rather than fixing it
here. Doesn't tee_client_invoke_func() already error out or it causes
a kernel panic instead?

-Sumit

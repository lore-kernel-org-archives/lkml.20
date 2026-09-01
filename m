Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5FD383305
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273108; cv=pass; b=lh4QqlsZJjAx/cBQEeYGV+0p1F/X/cgpZX30QfFLq8GhDaGmv/NaauflwL5CxPMzIpBFl1gBgjDqV8mxwHurIN5qWsZCVbzvpHezI9rRr7eepDOaKqlFraxVBBgR/vhWqx/lu4j15l7sYnaf0vrh+8ROpCTL0ui/55w94e1Sfvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273108; c=relaxed/simple;
	bh=CL+Fm//7PJAuTWNWRctOu0wP9tKrbcMfws3PNuylb8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfc3bzTneFTaauyWQOyNMIj1gfAmDkowUoqJt2wmFHSdkrZgmb42jOWnMBN761QmZHBShM4bSX19kf8oiVwvr36ppAVrFaZyYBgMBb8IlMGx9OE+CqozceXDGCe+ueoSRuT5f+O3pdJRZKlvdKL+ScDlcBruwvszm9971CgdNEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWKV/Sbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHUJpS+J; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWKV/Sbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHUJpS+J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8pXL2646929
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=; b=TWKV/SbgV9p0gmBq
	Ix/czCMtVc6C+fPEUJMX/wN5rmWOaY2sWrV8k3FCPsPVdBHPZds82x79UGxpCqCp
	/pVpjTMlX8ruOOfAB4pzE0il1Minieoe88KD9Sw4VJi1bgOh+zoS/6IfzDz5g8KM
	J4padN2WR4QivG/XXxD+bL//mbXyEPOzB4v81QzF5er6+cvoinwDYAqvjPEBlKjb
	fjX5HcnJIoAASFUUS/1g6Hq2e6QJhqKeo3LNE8Ut9OkR3ueWUadOU0OQD4ljSMCK
	j2mGoFWfUxYrnESW4/FvIxt6z6yf87rCmLVgMvOg92INvotvppxD5od8KkAFNDZv
	mmzjXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ftsq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:31:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8535cdc2433so897499b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273104; cv=none;
        d=google.com; s=arc-20260327;
        b=Tq8ErpX84lRXtGk881Xm3Fk8ShYDjs90wb02JdyrREqrx1GSNm3gyEbjOkY6d8b3CP
         tGNSWSz503IjsDkSF4ACwMcw5dLMSVYBQkQM6qWXpoRZefx+/aiWDznSwL1TJ/6Y1qjV
         MiE8WPQZnpXUgj4V8lONaZCm8FNJXxF4Lmyk5Bvo+DjefGYEHzkBochzW9cjURqxTATJ
         1ae4ZIBt9TmY3F7Q3ECCYY9AyDD815G9AUmhDCde68/QbivYSbhHbXU8H31hX+ZOSYot
         LL8sTnKy8Sal05OAoNy4GrLrEV24v+jOl+ofqX9wEBgnd34uadqJpMWqs06AG4rST6/R
         Mj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        fh=1H9MN0bCgX8eHT4nZJ+HRbuh8+Rlgn45iW3cpwATua0=;
        b=hRbu/K3twWppLLe6ZFk2wI92GYf1R18Ghmv+yEV9Ezznyiplxw9OFrtCsjZGuJjYtt
         2Z+4NgWnQHQSm1WR3CMWbJ0WONteD1d/lOMmsKRsGgQNRx6t5oAdoO9MbYdP642LlpgD
         B6EyuUeVst18sUc1bPXhbFvEnoWJ5/XzhoIOOkippFPzzM9EfTlgfx9ZA2FSm8mJ/HSt
         x3L2ekN1HLQxqLQ3GIoEKzVDpKDMfIBiORmv18lIPdH62Uz0IPLL2FXj35wMaMkumL0s
         bzmUOzeB8UG2xm9L3geddXREe3qpG8SgSPdjB3vA9i65+SgUH+Aud8yhZykcwL/VAIup
         XPhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273104; x=1788877904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=MHUJpS+JNG++WoSWrEusvWGQMqlLb+1WmCAkp+miG6kasuPoeE49mS8n7EzTVE2WUl
         s95CVfOFKfNjrElcCawac1ADbMDyc8E32+S0feYuZoYFvsar7b1F4KT8ixYVsoGrEzSh
         6VHSl0jYgm+3WW8E9FjvQFb2czYam8VpCI3nQLMCkz5xAqEgDHkFpfuIQph89MTzBSC5
         E/cfUPjZuZkHiZUfZdXQrFo9OD56US+ILdg8evX8Enajd9ij5XyZLZM/Bs91xmFiG62B
         UJANEaiKgCk3ahQGG3i6rxwj5D+ewO0pdoTwlIGI+54ea5lCe/vO+BTCaZeyBW+Lo2Do
         FSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273104; x=1788877904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=UDs2KyClL1jfiHUoDgOLlRrCeel3GtU1LKnsY6fu00fQ/YPZGClOpXxgzgtQK3wZZb
         dMczO7X1FNoJa/0yoQFSqGfZG+1A5QR2BhONkBVkRUjdFt1cB4piQQjmAs/qgY6U3m42
         s+XQ6bmKrbKg5CKB9oSqRvyw9wy1/UQih5I0f8azucup8Q3x2mx8rTcF4FIiOngyPPUf
         scvEzyVskfzAc8tPycvBbTvJ2kMFqab8yLaesy5kAEqCA8MtS7g9kaUXBFmsE7y9I5tm
         uDiIQBlPczw4xqAMbCTmGaVKgfWN+z2jkV6RnKyV8QhtmpY9xeLSzAMFpuA+nsYKGSdg
         qO/g==
X-Forwarded-Encrypted: i=1; AHgh+RoLDnukY9puULnwa4K7+72oci5nAId6rmq1NDQGz2CidavlgTRWVfrpIJkdbmmwV8bI+tXR9MgQTpT1bR0=@vger.kernel.org
X-Gm-Message-State: AFuF++mE3cwKUw5OCpJMU6NXsxL+8ySjOkk27EmU8YQ5vXJN1mk/VCBS
	YH9wqj4kda8J4kNd7AzDOvPhc75EPzMT6/IGFsJqv4elDdtuUtdWdz3sWmo+VPw1v9sLgoVg+in
	QC/sZvLcS6NOKfK7AM+pp7Nf6qNDEL6DRlbFiE30b15P/iH8TDIb1JEaGo6TE5FROVsb7NVsHKH
	kR4CK4QzIS1F9f2Tfv8BxI+6tEKF/O7EC5kTNNxPOrBw==
X-Gm-Gg: AR+sD13GpvZ/j40Xko/CFvFg2C0lXBDMbN93EPuGUVBLbCtx9hSmBoCgs69EmfpQNrb
	H1m/WgFwxKKi3krjLtd88Zayn96cyHJesirJNUBMY7ETbbFKo3AbYvDY4h2shE5Ubszakqlyqcu
	OpyvxlumXFR23O9ycPUYsLy+QYxOyiwzHjBv0u2DR4ukeAgCPjnj0ql6FHpw==
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-85bcacec88dmr5179014b3a.12.1788273104270;
        Tue, 01 Sep 2026 07:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-85bcacec88dmr5178917b3a.12.1788273103642; Tue, 01 Sep 2026
 07:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:32 +0200
X-Gm-Features: AcwNN1WwQtMTDpu5tktdI1Fc85e8Ltr3tWd5G78kHHK2UXE66ekj0IR3sGBbeCc
Message-ID: <CAPx+jO8HQj4PtBScf-w+nQz-9xe+7QxZLMtp=J=sFSwEHVLL_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yyVGxocjBWiDGfFaL321OkhlHJS2Keut
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfX/2SW0b6xC8dI
 yvgGt8CrldutLKmIM9+TPH2NkH5I9DryzYrNt6Zq39mLnfSCEcTkyd9QWCJrA9Rs1/Vi7Upc87s
 w1Qo6UxwMsUgx8+Efi3OBJVYR7Rs984=
X-Proofpoint-ORIG-GUID: yyVGxocjBWiDGfFaL321OkhlHJS2Keut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfX7zEgT+XuFELB
 mIc398BOLg2KF+e91Y3D+Xd4Sy4Ms5t9Bdya1HkVkTogE82bsNd1lCHtC6VKNpFWdQOG15eEFlt
 825+Ai2Vl+T/wobFB6qovaUuojm1nDMkaDoVTyKHS4lsSpOlpLokcyakGJoY4DLGsWmKH5WR4CN
 UAZVJydLhdrrXCiQxA6a5FnTeE52G3tyuRPNTHIybwcXpyHfnLMaXckjdKy6jtBEfg5H8qeXniK
 /rcUYwU2QM1dy9gkAfX1T4eGQn3BFR2fYujvxchCy6e5W+SsBcxZv3h1LrYCSJRhCZVucglhDwM
 AspYBu7pFOLguLFYT/L672Bz7rNtWnxgvFH/VFJciz+kEa3e1Y7AuZohy6IH0CsuSY27c9WwXwY
 F5dckYlloK6KcEhSJGye7HdPtdECKPUWwEkCWJq9rReMjkxGZ4ljsI7J78e9H5oInFzuLK2jbN/
 DWA+F6N0sAzkgMdY5CQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96e1d1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=iiyz0f3IVUh47B4zfGIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010129

On Thu, Aug 27, 2026 at 7:59=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

This is already in v7.2. Please rebase your series.

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>

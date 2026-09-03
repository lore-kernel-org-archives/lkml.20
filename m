Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EA4A1387
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437455; cv=pass; b=bYgvsuNr4eHYD2knZQQlyMOFyHGe8XUxRqGwC0Mn7oUbXAL0S4qjvdrx+Q/EM3zVSKNZ1Ej7d0TtT+ejMO6+OdQINzhZESscWiGbNBDN/h5gIpBJ9ItaFJ7uP5WMQdyH0JBxfx2viDTTXlLrePecUVeB9LRKDlmKMNMIyhwn7bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437455; c=relaxed/simple;
	bh=hnNXpCXji6zf15Fguebf1c9k1bZfBsYb7wHW3Egg3ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtSMBhEXWpNH52TY+eaXDhvGBofnnnUfIdzwnLkHEmyR0qGB9dN1Pj+FrilQWcTdoW47L/z/e4dyy3WgcxFKzDVCFGO1xGD+UT68sDwbr3SVMwg0EVQXyJaDwOTHn8jjVMWRmK2sdHBvoPnrrO2lupO9DFOCPG5e4/f+GY5GrEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pamFi43F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ph+8Ufz7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pamFi43F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ph+8Ufz7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTpNZ211444
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=; b=pamFi43F4zHnQ82j
	Q6+siTw2JB9UfBcuQ2veG1bJIBRnGC7e1ceJNC8IoU20lBNz8uYg88pSMxhVQFXF
	2b1RxyFpyhW1imbd6i7PbQ4BVSM5ZJX72s97o7pQ+g76rZPfoAwzblyOYeHkHnIz
	tjWD2ztCb+olcEhchgHBV9VGXyYpUZZh5BW4trpck/uqQoLSo48m8jPTdE1iGsD6
	3mfz2u6pbJOIdSnk5BIyc8VVWKpwDSTwd/rNwqh+0pBFO+MQtHwM/Yl5z/pz4AkO
	McssQdtjQ9aiWGsFMEHNwKKVekBLoi4BgTk3SB4li7puoN21AuePbfhQJKbRUra2
	QdgyPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k854h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:10:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7293f13c6so31616985ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437451; cv=none;
        d=google.com; s=arc-20260327;
        b=QfEkJj54F1+6dDCqeNzlSyt/SjlZ3/w8uOb5DLOW/csRCQggJRpmmRN9d05+Ne0Onr
         gqeN4mmalzMILbFWGtR6q54BlmPJw2wjLwwPoNTqEVlrQrkiyHuhq0RnMK8BUM32nFZx
         eypWfsWEoyrPvlFh6ySAvSqbghPOn9JnDJD89gsPLhJftvIkvmdKYab/zCJJ/DoUnN2R
         S1lXHOUcpcfJsqwxtsocHip7I6MrTLLvpxi6P3qpoh4DVOq+yUZRKBPQKJWWsH0LitBF
         zbXLw9P/Tqt00Gehg2H2CmIKjY1Jp1HCPnxjoOIiukjK2fc3UuCttT57mx1eByPeev+B
         kIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        fh=xYs4w7IXtBcjSP9oW50TwN4pWTOu7HzCy4cBnfmLZXE=;
        b=DLPhyGxSAYN+NnFcHIvNeU1ijZ8uUMiyVAtVCRMpBWjYiIDOL5/Np9lcc0XRSe+YkZ
         AzhsCpHZk34AgS0mYpEdizckcC8D+FuIw9S7mZOymPnksmc3JmO+uqm5mZ6bnrX1M7PD
         YHOKdyZWD//JCBD5iy593pWzKmBLu3FjixfoFKDUlf0GeS+jS6qYC2e7PNnS1fcOVij6
         wUk5NAACj8wAw1zvvddVB7MhHKgHWw8yYnCmwivr6o5qNBlA4i7yomUziq6ffLXBMBjX
         27Yoa6WPxUpnrW9SO1/gYtlmaM0GX6hGy6m2FdbA1d3WwsYns5pTwN9l9fvikVTVjnf5
         eErg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437451; x=1789042251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        b=Ph+8Ufz7t/M7cnAWbUIQK425wtIIKr0o4pSYKg0CqLoa/BWSbYvZqXtffLc9c/NJ0f
         ak7yjRariCelji60koTYQYW/zNF7eoglYWxEvZpUU6Uv0K3VZ57O4rHMk5S/VQdgU8Bh
         fnOr/YuEPlUrTgwHlWh8YRjoIDRzgTWO/uoIf+FzZY9xx89ta/sXbUfJXYh5gwC6AvJF
         uD6CRBlWquR686KSRt2ohA5uH+MC326H7Z9cHnsDJEIKKhNFTuBTdAWzgZaT88Fglonc
         tuvHzYED1cl4G3jGcvJc3gAP5olbtr8AdABdFTbqfdoLTRocRCXKcbt7dev5mVfvRx0o
         V+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437451; x=1789042251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        b=XJbWzm/Drju7i0k2fRW+yhAoqGQ1MLea0pbeafP8gLwZl34B+aXCN6OrrzRdeonjKU
         XmRljeSB24Vfu4+6Ja8TNOZQCUs+ORHonOCxKN1aUUet9cWZ0KbO5oR9CQBH0OOA9HV5
         4MdU82adDP9+lQeBub5I/SK+xxA/NTEBt3Wc/es6i5IVkjbR3syFtTI5bwPK97nA9fFS
         h6Gs2lJe2vCwdCDWSR53vh5JIoekWWLhYdONeF16/Uyb79IC3gPdm+6Zm9OhY/X8vKDL
         GHLEomVbiSV+HuLkXn12e57A3fF8TtBe3N1TAhG5CjI7H325ndX/nuM+Em8CqR4pqLAk
         FYlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhyET/M936gkCGjL0D8iPhlwZXbKWeq/GuFMkVgXBxhL5nCQSXgEKSm10Ebpltdv+a0rWiMov76ElUfBE=@vger.kernel.org
X-Gm-Message-State: AFuF++lFxQkQWmTBikgmlSekCB+8gYPfke0MJi97qcXPGVRZq/3QaN1b
	c/qE72CFxvsph0qUSh3ZCCJZBtm9G/CjoBZcV8rhVAMVxUcfMor9jHdUHKkmZ5oECrWygM9/9Bn
	Uh046RESSXuLpK3iL+Yyf42ESCdfnNQffERvl1/WA558oGPI6rq4JFI4R/l6M7+sDDpniLA4xGg
	wxrzoasItnr5ZMRJhgUrHlNToFDqJn60yACeFuikvvAw==
X-Gm-Gg: AYBFou1upd51HMcIXwhJohbv68sYQSBJZsg6H+lVBQoeC6fv8JQ5FTGtFAndnDCOOIl
	Mfi9deqrpnc663MALTVd9ooV+6rTVCio91OVOud5+EMV8eTpm6IJn7whe93o0aBbafRBz/rW1Uv
	xFcwaIxX9orukGg0dPKXIN1aK/3WCviB7d1WuNeAZwOQKsfCL8axgr1rcnyA==
X-Received: by 2002:a17:902:e947:b0:2da:c09d:b5d2 with SMTP id d9443c01a7336-2daec5f4a05mr171421465ad.3.1788437451008;
        Thu, 03 Sep 2026 05:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:e947:b0:2da:c09d:b5d2 with SMTP id
 d9443c01a7336-2daec5f4a05mr171420605ad.3.1788437450509; Thu, 03 Sep 2026
 05:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com> <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
In-Reply-To: <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:10:38 +0200
X-Gm-Features: AcwNN1UpqhcrP8XuT2dq_C4AZNGB-kG49zty_zs5rwD8pwTsxOtau1KLx0kmPkA
Message-ID: <CAPx+jO_jfkRyFjB35wKGs8N-hjXtq21kuOD484F8U0TL16sWqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: igaYwf4I53RH0oVGAEZnlQ0bwnPk1kaS
X-Proofpoint-ORIG-GUID: igaYwf4I53RH0oVGAEZnlQ0bwnPk1kaS
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a9963cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=7CwLG3W57V6vwtOQApUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX087rFRHEH9ql
 dOIQsJFyeceL2ph/42XEk4s04DSidB544KOK9pV6JmqZqexxh6rFEAg1v2aCRl2seNfw6e05kkv
 Jw20ASKYca0MTYGLRT4F3Sq2yNiCMZ7BHpMO+gFMiqad06VbJRod1bXyeBfH0elCVkYYGGesVxP
 WPlkr/uTFu3xB8+pGeucJRFS0FTmFaroXqsPv50yhv71I9s8obVP0VH+CDvrffHKrvmh9AKC7ws
 +fkS1AhHSc4Asdu4n0npk8rkhojsURWZYRDE0JPAPsQn/66Jo8X2sQJKcChBIaz6v5znQcXv+tP
 dSofFMIy++CSqzqtEfcQkuzfPTgHKCkfbg3EyUV5Ue322nzmw5yRMuRuxdmkLNhQPupA6lT1Sjm
 Y4UdTqP6absUjVLQBfWmje/6ciN8jJQrVDqlNAYJYQFLOeaugt/qys1MU2vhVmwVya6xrDqlSeY
 HvMK6Ak//V9/WsPTEhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX9IeLm5sJTCx6
 5qFqFU8RP+C97ywYJ9B3+xPJ1ohWgTykYj7WJ76QMbHGeXlXNFlYDpmzf4HM5I3ISJJ/1MzxAeN
 SKPKyPfibb6cFSD+9gKWOskbR0FrOmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030105

On Thu, Sep 3, 2026 at 2:00=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wrot=
e:
>
> Hi Ulf,
>
> On 01-09-2026 16:44, Ulf Hansson wrote:
> > Let's rename the internal function genpd_status_on() to
> > genpd_status_on_unlocked() to clarify its use.
> >
> > Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
>
> Optional:
> An additional line explaining why this otherwise unnecessary rename exist=
s:
>
> Rename the accessor to leave genpd_status_on() available for a lock-takin=
g wrapper
> introduced in a future commit.

Yeah, good point!

>
>
> >
> > Changes in v2:
> >       - New patch.
> >
> > ---
> >  drivers/pmdomain/core.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 842c4169e290..6ac1ce18fda3 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_o=
ps =3D {
> >  #define genpd_lock_interruptible(p)  p->lock_ops->lock_interruptible(p=
)
> >  #define genpd_unlock(p)                      p->lock_ops->unlock(p)
> >
> > -#define genpd_status_on(genpd)               (genpd->status =3D=3D GEN=
PD_STATE_ON)
> > +#define genpd_status_on_unlocked(genpd)      (genpd->status =3D=3D GEN=
PD_STATE_ON)
> >  #define genpd_is_irq_safe(genpd)     (genpd->flags & GENPD_FLAG_IRQ_SA=
FE)
> >  #define genpd_is_always_on(genpd)    (genpd->flags & GENPD_FLAG_ALWAYS=
_ON)
> >  #define genpd_is_active_wakeup(genpd)        (genpd->flags & GENPD_FLA=
G_ACTIVE_WAKEUP)
> > @@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> >   * @dev: Device to get the current power status
> >   *
> >   * This function checks whether the generic power domain associated wi=
th the
> > - * given device is on or not by verifying if genpd_status_on equals
> > + * given device is on or not by verifying if genpd_status_on_unlocked =
equals
> >   * GENPD_STATE_ON.
>
> Since we're fixing this anyway, It should describe comparing genpd->statu=
s with GENPD_STATE_ON, not the macro
> which expands to that logic ;)

Of course, my search/replace logic was too lazy.

>
> Anyway, nits only, LGTM otherwise.
>
> Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
>
>

Thanks, I will send a new version to address your comments!

Kind regards
Uffe

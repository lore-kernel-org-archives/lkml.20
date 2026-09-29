Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811839AD34
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669515; cv=pass; b=nDc1+nzPYyjs73PLsm4tGwu8OBNNxNMk+l1rL/XDRFtS62tkNyJJfA2vG1n9dCXKumq5OCK77E50TGFu5klOZHa01nMnukjdfwySY76X6yn3M0EvH6vFN8SCNzcln3csUIyKOiXdt4vAMpG9ahgpv6mD4LsdGvObk88RgpGDhXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669515; c=relaxed/simple;
	bh=HoGjfIBERBjuLlbfWX6YofwkC+7tgErkdW19lovibhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb69OnrMubXJ89ANl0vhIWMsbYErfbJ/a0olnoYM21zrut7hmKgYmLUkSvhibiYoCc+mVs2mazaT7R8U5BDLVrGTpBGiIS9UirWwsiz6LvmJqSAtpfpOOVyzshOUVovW51K180SV52n3RfW/YFVBCbjOvgtF3THjDa6tOn19xC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvTAuSg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4ZvLf5a; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvTAuSg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4ZvLf5a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ToSV3220592
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=; b=CvTAuSg50oMo9/0m
	xDDnOPZtJSEth9eBTCxnaJUwER+mJqKf5oQYYR/cDGCX8LR9CZUvS+Puwkd5S+v9
	6COfMrg8zEspOP6N20tApNPlGc9pJyb+OXj48kgMeA/rPErxFsP1m6cAbGlybrNT
	ZpYY6fd9BkAXlj0doSXoS2uMaQWFN0KKrXgUKys1DMU3pYv6idIu3CSTxnwe0AiB
	mZNQlcFd3wy4AOygJYyru59JYssZM6jug95kHc8ZXEJt+Ibz3MiJMbeH9zzVJ6+D
	F3+LkeygJ+5CQn7tbO6QwOjmcwg0oWDlYw2xD/Njz+qO7qguy9oTscF+QZQNIxha
	sOiyyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw23006-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:11:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so1111694885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790669511; cv=none;
        d=google.com; s=arc-20260327;
        b=k+lVBUIeZBICqn473+ZTOPl8iQ8AaiFotRLo88X4ZCAO4mhPlIcWVDkB9rfLA9WzTq
         crx8M7pJqrlXyjbkD8C5VEjKNmZ1RExDQakQMgYcG4PVvibIwc9vlUKJ721IqyoylC15
         fv7qpYkM62BZqDx5yP3P6PM9mWAcjEuG28gWKGWWtFurxQypvPDkF+ACH6zDoNXV4fRp
         3OlSiskPoi3IBVHBy1qcvJ0c8U4CCVOumVgNjkZQ1BxHIO8be9xMVwtvWshFTwcfwKbf
         0ocR/4rygzW3OcqusEkcK4n4O6fDdXv/S74EUtuwn1daLj6Ymy+D8G+GCh+qyEN0u5PE
         qVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        fh=DAHKbbIe8BoULKVb8lNrIMOoZOBUGDtZD4thfypw8LE=;
        b=TrTeb33aIKWrjI9t99ug8sgvNA9xK+JaESidIpfOgn5HRgJo0JLl3yC/FPeG7GFFWN
         UcWS8PbQfk2zhLaHeKr292A6raAK30iU0M84TEzuuNqUBqEe79u3HrnzwOP09m743lOX
         sHxVPd5auZAFi/zmFT01PEdZy47ucnOZJurp+j2Of2XK18lEkD/2TFV0VdOUmIf/0UY0
         OcQmVjVeDeWj6VX8HMPeyd5qDbGjCisgRhYpH0hn/PQMFQO1r2/fUfOaoiGUopHOJXpL
         oQyrgxY6WXcuQKfmzsJGvxgK35moZkR/XpCK1Fj+G1gXhbTraYRxAOCZrVorxd7hvL3n
         TjqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790669511; x=1791274311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        b=j4ZvLf5ax4lVT84HxkgL+fbE148GHNAsZ2HWyYd64EzZRSZSRf6KiVqTCSwvBEHAj0
         wQhOuBvogI+VJgXVZg2W7cadcB3xJKJC3tZjR7OHY/ixTYYx/5j11oztcZucchM2FyVa
         l8J5dO/UR7xJjote1fjXO6pMPNUXC/O4rFQbvqgzV+jEo+e/49SXHd8EI9CV2wVAig9g
         EORArIp6RHXDTQ51v7SQtTwNJNBHRRzs02DY4QJ7hIXRi+plCHXYYlmrLIezec16DWTO
         qw1dPLUVKMAyALpi9AfkBMzL+t73go4/UPlVv5aNhmSWmCJTUqaDSD8Zcp5u1PLVop6T
         CA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669511; x=1791274311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        b=UkDmvUZl3YngUyyRUqaAZBuOnOHsutq0Q8UoHiZeXgsTXENXHGl5WWwCp+Rx1/Gezj
         XK+s3KpOwX33QIHAAhoKjCLEC/V8G9Ha4guELoZns4lS8cjYHttqaXznlxdnULv/fsev
         /5YjYtwGQR1uji4mloYn72Rxte/tOi49XbMPlyUq0+unzAob3BzIdxGH13KW56uXzU3Z
         GyhC2Py/3K8L5PvAw8QVahveuVmLfW7OAl4IPwUFZzppW5WYg7YJJYHeLhzkbFQt1AMv
         stOmUvGvVaSNBBFVw6evQKggg/vOfB6Sc1a2QBTNc71KOV0dsKbDPQ0UVJEcJkpRzZrO
         Hqow==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2Sov0QAWprf7jY3u/qLw37HsjHb2p8kxCe+N7odmkiLe4nt2mOQCj5zW8SNN3Pw6toJkzCDEiDvCGBw=@vger.kernel.org
X-Gm-Message-State: AFuF++nhLAoFKPxKGj9BU7N+xX17ekZvqtQKYhQcSSZUttRA3BkGHAsX
	l7Uue6nOXRV0cPF1Wd/RmoRHVJoJinn2/eAB7JH4s6IeCT/yVuVNsZR291Biaki9SEgVMbpSHsM
	yQC/Q1gwf6rMLPJPzIgfITiyLjckJVS1y0EkUmLK0GiviSfUjz7FMBj8z/4B/zIgUpukK5C3KG9
	8cYJ6f2jEUDELGthFckXzLWBIdKuzHEwq7dT0GRqqG2w==
X-Gm-Gg: AYBFou27zTCOFugn9ARynVxE9KSPLaS/Dz9n++sHh89/ZjPgNEmfNZii5Oc5dJM1Yz2
	L9siEWfnLvw6fC8nr9aaHZ02hvSIzmVTKlMOQGzo2uEw8RxquOz+G3hSM3aUnzZb0HswaQT8jgR
	ab0Ckrm81OqOUjR3gF384Ch02Z3uiY1/nx3mW9lplUZBJqe0NfFWS+Fz241nYT9IIv/Kp4+Iggs
	PldH5mFvgkYvcZll1LzY+7SlX0y+rk2snTi9jynlcS/sjjoVimiVeebe/PMgRiBOFcsrCkZgaY=
X-Received: by 2002:a05:620a:2621:b0:93c:75f3:e146 with SMTP id af79cd13be357-93c75f3e31amr1222359685a.33.1790669511518;
        Tue, 29 Sep 2026 01:11:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:93c:75f3:e146 with SMTP id
 af79cd13be357-93c75f3e31amr1222357085a.33.1790669511064; Tue, 29 Sep 2026
 01:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
 <20260927-cci-clk-fix-v5-5-4cd498559ae5@oss.qualcomm.com> <arrymkYqBOzLrgnV@zenone.zhora.eu>
In-Reply-To: <arrymkYqBOzLrgnV@zenone.zhora.eu>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:11:39 +0200
X-Gm-Features: AclHuK9tROaSuZGwrgXYftuCTCCZsm9VQ-ThGHIjlFm3D2BpIHH4ATLe6l7ae24
Message-ID: <CAFEp6-3F94+Ve+7cj8Pgu+HMq6=RfHEFksJ1eG-4rcpG+ODW-A@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org, konradybcio@kernel.org,
        stephan.gerhold@linaro.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb72c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=eW-YW5vREpMiMjnL-pYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: q0XuGBUCid9_OZf9Us-pKNVCf_s5BEXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfXxbTuqWCE/tii
 xGHrgiqI6Hge3oWP7FneVYAbuFP6nStusSq7hal4dUUq0jhRXW39YYIXcAB93LXRnVqgAAgCQaN
 7re6CfhdB82oJDRZkVLPn7n6gFmrvp476q5tsYiNcuO+EWijEOTCQv4C6ttX/Ay2w7D6mSuO72W
 u+ZPsOSuTq62h4yBRRdjUcpfHVHzxp4EeDZoNAv2m7vRBpZxXDuWTb45A0teE7m3xRoLkBAc+9C
 RIjQK0FNCfWr7oac5CkLDak5tK0zZ3GcaE7cKWRxtoh3nvij1lt4waCQegvubrBnZs7WBxX2UEP
 iaHKKZlRHj1f7CH6uZPYX/ao/Pp3NJWUwxVIR8mBVzCsptmiemE8ProrW4LHNsrRfA+7Im9ZHce
 wqx8tzysebPI10fP2gosu2T+uzbZtYgqZIUPzv+v+DkGkZ40n5uX8CdOoNDcHM2fqVM1cmLKBo3
 fT7GWgclwtP9tgq8dGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfX86vY72O8aqW6
 5cyCPWUQcY+QH5bw3UynJkeVr9d3ZPnA3Gri8wzve/RBAXf5N5zsfz01cBJlQjigr79owPU+Bqc
 5sfAnskFZXDg/QbOnQENoQRPUhtDDXY=
X-Proofpoint-GUID: q0XuGBUCid9_OZf9Us-pKNVCf_s5BEXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290032

Hi Andi,


On Tue, Sep 29, 2026 at 1:28=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Loic,
>
> ...
>
> > @@ -318,7 +319,7 @@ static const struct hw_params *cci_get_hw_params(st=
ruct cci *cci, int mode)
> >       unsigned long rate =3D clk_get_rate(cci->cci_clk);
> >       int ri =3D cci_clk_rate_idx(rate);
> >
> > -     if (ri >=3D 0 && mode <=3D cci->data->max_mode && cci_hw_params[r=
i][mode].thigh)
> > +     if (ri >=3D 0 && mode <=3D cci->data->max_mode)
>
> why are you removing the .thigh check here?

Because it is now redundant, the mode content is already validated
during core clock selection in probe. At this point, we only ensure
that the mode value is a valid index.
This follows Vlad's comment:
https://lore.kernel.org/all/CAFEp6-1GCa2t3wBznoF-HnmtNCUSsshnWnrv8O6R2_06Kq=
gKQA@mail.gmail.com/

>
> >               return &cci_hw_params[ri][mode];
> >
> >       return NULL;
>
> ...
>
> > +static int cci_set_core_rate(struct cci *cci)
> > +{
> > +     struct device *dev =3D cci->dev;
> > +     unsigned long rate;
> > +     int ret;
> > +
> > +     ret =3D cci_get_required_rate(cci, &rate);
> > +     if (ret) {
> > +             dev_err(dev, "no CCI clock rate satisfies all masters\n")=
;
> > +             return ret;
> > +     }
> > +
> > +     ret =3D dev_pm_opp_set_rate(dev, rate);
> > +     if (ret) {
> > +             dev_warn(dev, "CCI clock could not be set to %lu Hz\n", r=
ate);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Sanity: The hw_params timings are only valid at the exact
> > +      * expected rate, verify what landed on the hardware.
> > +      */
> > +     if (clk_get_rate(cci->cci_clk) !=3D rate)
> > +             dev_warn(dev, "CCI clock is not at expected %lu Hz\n", ra=
te);
> > +
> > +     return 0;
> > +}
> > +
> >  static int __maybe_unused cci_suspend_runtime(struct device *dev)
> >  {
> >       struct cci *cci =3D dev_get_drvdata(dev);
> > @@ -678,6 +739,19 @@ static int cci_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
> >                                    "failed to get CCI clock\n");
> >
> > +     ret =3D devm_pm_opp_set_clkname(dev, "cci");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI OPP clk=
\n");
> > +
> > +     /* OPP table is optional */
> > +     ret =3D devm_pm_opp_of_add_table(dev);
> > +     if (ret && ret !=3D -ENODEV)
> > +             return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
> > +
> > +     ret =3D cci_set_core_rate(cci);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI clock r=
ate\n");
>
> The error logging is a bit messed up here: you either print here
> or in cci_set_core_rate(). Besides why is a warning there and an
> error here? I would just print error in cci_set_core_rate() and
> return here.

Right, will fix that.

Thanks,
Loic

>
> Andi
>
> > +

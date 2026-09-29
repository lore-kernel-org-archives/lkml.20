Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595194FD797
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676213; cv=pass; b=L3cPe5tlykrcanMxOUajN7UYHO9LGXCCvVHxzqukIS2V43RoZFJ8PGqGZduMV1RF3snj4JgFgDOJQw+c61c+rg8byWHStg2kgEkV3h8mvPtPSrmoSOdCAyiGEzacrbrR854jMrOlVAHC+cfaHmDkS7MMShyX23JNQRvhE4WW8jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676213; c=relaxed/simple;
	bh=428tXCbvtfrk+2zlh0uwJkqz4i0sMFragXvVb9rwGLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCMHYBLdRRcXcRZj9UZgM/4nr+Mu6/snQk+ObLlx/zcjum0HiPb1/0bA/cF5agKrbYC5HlRfz/iIuOrhCj81VLk6wyZM+/kSb3V89Sk9tt5YKHtEqSWNAxWu3oFsGNAnqQHIMBBZKViKJrCQmkX+l4q2Iu6yenfEKFCbxc+fF9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRRIX5+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXIQ3xzp; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRRIX5+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXIQ3xzp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tr1g3220763
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=; b=WRRIX5+wX7JM4mWz
	/tShCvtr9UJWqMeykDUccHF6LMsQpbqWmaVY12gZj/uEzZtP2j0opy2dRARb7xGA
	Fo0ktIRt7YSHn/D6MjrZon8SnLkUJ/AstmOal1R+1+OeTNTCCi39evHFEkl9CbK2
	4RdnU9cMBMhmjqNzUbe6n+yIpNLNhSJI3W0kRAxxbRH+iz2r6nI3Dcv0g0yodmZl
	inAmX/2fOHsCv27Y6V99QtXHabEaF3WKabjsWsDpn9N8OwfTOjudVGJkjsTN3uU5
	uiRikW+Z07x6qwiRk7WFxz9pCZujAdfqgjMWkvpwaWloN5YdoVVAIT6cR/1rVYyO
	uFXdBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw23ek2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:03:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so731307885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676205; cv=none;
        d=google.com; s=arc-20260327;
        b=sgk2Z9uGlTYKsQLjvffPwjF3wCjfQ446COMXgppf2yxeAAWpgHSCoF0fxJIEv8QZZz
         pmTjzGmbIeE4U8PMMgfeeqGeOuFRxmblDvaHsyIdg9LzP5Pk98u3u8tIjb0DAnSeQwwV
         lGWa4EOJf6q8XbueDxTSPvRkgGdzmWon/B5SMZ4ldb/kctkjTLkKtVJEIjmA1KwW2HDO
         Vsq6S/xI75U6UCcf/6ERqIYeBwnN4fwngpChuPShmnvsFJs3YM0hKHfvJUgDZDEwTCSZ
         TQxobVE67XDTarWJMivmwev8H0l4ulonHq8bAvY0cn+xeELeeyIVg1b0f93Jhz0Fe+fh
         E/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        fh=PBXIBGUo0rYBy9DcYPiJits9ctggkZNRBnMmVM+Dj08=;
        b=lf0K11WYzeG9KfmcMtvvYmEYnLK/Io5oym0apUL9B/erWRUPznRgpYQLUnGSyvnS3u
         +bKdR+UgWnjYxde+kwuh5HS/QyXLi/VjgYIFoihISiHMfGyoNYoW5sIMbqnfXo1gyFKC
         BjSBpR5FFQwyoOOWzQml40dnFae5buqJc9yA3ItS5KBySlSFN6oCxxdcKokRI7CU568J
         dGUXudPqtDgvupiTah3TM2Nvl0OjPPw7xsjwJm99MfBjA3EjebL4cU/Nus22xdDoCEqG
         eSwKJFvKcSCow/bMmQLua3R7l4AMJ676wC6iawOtd3NZRM+D91rTy8w2PyFHbQyViUf1
         FJtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676205; x=1791281005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=XXIQ3xzpCLCifScGQY/i4EzKS9Xo0Ff9FyJuZohg0ayu/OjBmSjYA5G4VfM+l73Mkp
         Ufs+X/5p5Y59t711G29B/dnfCa5CFuSJekUtgvaMlZNUQG6LCwwe6V8UUR6gmYY5shaN
         m2TaEX7AR60fi0MbAcNkmuy3VBg+FEbwNKgVJO70MgsoODXYaVG6WjRqS7TpOMAEjYO4
         vkxvxEQjpmcYY53Wht+Kwn8VtdIGofQHLQwN4SlilvazUIKRSFZxU42Rzt9DlcgyvMFv
         gsenduSDHM6m9l2tuv46S6gww+8DWSkLVHx/qluFpsi0ERL+V+VYtquA0R0iAnCFM3Fy
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676205; x=1791281005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=T5/RgpWnLc1p6JbgebeHbMbQfdkyuOkWFvYnLXbT9DlJbIthptfhFZAvA+VKhMSLeF
         hxofMVp038ylalZMANwZRq3r+j84q0QtkyuZ+hy9J5szge9+uKEeLBrA1YS05t7fC09L
         7fvnjXI0H+UVL9FtTLRTj6hCzDQSOaHRxx5wjRweNE4JN3O9UIZ+C/Nlg+PU6vy3iVl6
         TGK1tES51iXynmjftyXk31xLhpyVnfaIDhL/DSg4VQijq0CG8SU0J3oJKhJhTMe6FkqZ
         sWtvrVJEnaBbP3nla6LMG+3UkTaO0z7+qBK1LpgrTrpcIjnjyyMnVEa5zRINYFul6iBr
         hZng==
X-Forwarded-Encrypted: i=1; AKwUvBxCyzAAg8z1WebVwS7/G6pARwGFJNb0hWo+3AyWlgM6lhQGenNr/55YSp3TqKQ4YvuH1jmox2hGHyEoDEc=@vger.kernel.org
X-Gm-Message-State: AFuF++lXfIG4ZyP7ggwEoq2dGEilL/aXjFzzS1Fg0szc4GmIZnuJnqyb
	TS4+fvCUjljpXwFhkWVBY+98nIWRTWebuytGM949ZnhzQTW/Y4e0hmRAYy5UbA1GcqPimalkyEj
	gE/+hrYJr5iMtFL10sHHfrs7Ko/hxi28DGtI4H6bdWlAH5VJeyY2TWpPwOZvkQ1rnwbJutD7DpL
	xrHwuv8iTafOWRDcRyfvGYSEVpz+BA6AURphzT1IIyUw==
X-Gm-Gg: AYBFou13SPwZJfizA337YKQePbe6UZRS9PIBevhh6CE2WR5B+KsQRYfwodlV5tjX4Mi
	ETw/OdCOVEjbfhzmI5Qs/Umcns7veElzm4wGRtxLAC5TpBKe6cgFbH4CWSBIABskrfWzW/Sc095
	qQH3D2a7SvDcJL5odzHKfhvR8BwLQ1c28nJv32cjZ8psAT6Ckorji+onrmCTvMpQOvYgdY0JXOU
	XkEC9L37AG3kPKOtp+UcDXk8PFJkaUmy39gGhHfTe3vk5DaAmqa3/Ppm6pW90qoR8UilxGFjSTP
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c43cd61a7mr2588126585a.42.1790676204619;
        Tue, 29 Sep 2026 03:03:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id
 af79cd13be357-93c43cd61a7mr2588119585a.42.1790676204086; Tue, 29 Sep 2026
 03:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com> <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:03:13 +0200
X-Gm-Features: AclHuK8hrus5ifIhd0kBrHEFVRgKNmcLi6GGy2VwQ0rTLUBWrWRbn9i9ZtKBjZc
Message-ID: <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb8ced cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=k-oZKQUuCPdrsXQy0KMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: g9ra9eAkzHDBR8DoaOPA9B3c9pzPJGT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX9SfufUNzOZHq
 +Q+mq36U+Jc3PqbJHdI2fo9S37/cf3RRFn82wvEHW8h8baczW3ZSqBOC4YWD54LuJmuAVpDvS0q
 t6ZRv5b/x31u1z3mvsidybK9qELkqqyLY2ffO7BdQbkoobBGQf0Ax/d7CC3IFG7dLZ826oInxO2
 Z0VcQvIFcGABnqaehXXeoUCcLw7Uc7W51Xs4CfX41Gx2uUrdW+CZ1wX+kbaPDmLjzfGQGnx/EWE
 PUUu8zPfZ4X4MvPNLsCe336fBYeMpQQlNSja98Bdqo3VyTmSZhYi9oiCEYRN0N7A8grz6oep0ve
 dDJGB5kt0Ym2Rz7g+VPi7nF0ZXv1YnMcsEUvsLgy3TwKTdQqBxr50Afec23CE0Vj2499iGF7TOw
 Ag+BT6CNxs5xmvuOmHsq1DnrVGcP3Q6zBLmyUVKhn77TshknJgjYRtk95fu5xvRvLgSYAC2j8wn
 qgIbq7Y2GcRJGkfZ6WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX++VWgeQ7V5wL
 v0QhD1P22z90nBv8xUv5s+MSxVwora4XBvZ91SetyOYg0/9tSSbamVKxXc5S9+VUhboVls5dFOI
 ZoE1q2pxW3OT2xo/3+kg1oRNI9HU8Q4=
X-Proofpoint-GUID: g9ra9eAkzHDBR8DoaOPA9B3c9pzPJGT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290039

On Fri, Sep 25, 2026 at 8:21=E2=80=AFAM Yepuri Siddu
<yepuri.siddu@oss.qualcomm.com> wrote:
>
> RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
> power path in hci_qca did not need to explicitly manage the clock.
> With proxy vote removal, each consumer must explicitly enable and disable
> its required clocks.
>
> Extend the pwrseq-based power path to acquire and manage an optional
> WCN clock. In qca_serdev_probe(), acquire the clock using
> devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
> after a successful pwrseq_enable() with proper rollback on failure.
> In qca_power_off(), disable the clock before pwrseq_disable().
>
> Targets that do not define a clock in DTS are unaffected since
> devm_clk_get_optional() returns NULL and all clock operations are
> guarded accordingly.
>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..489a059e519a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>         }
>
>         if (power && power->pwrseq) {
> +               if (qcadev->susclk)
> +                       clk_disable_unprepare(qcadev->susclk);
>                 pwrseq_disable(power->pwrseq);
>                 set_bit(QCA_BT_OFF, &qca->flags);
>                 return;
> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev =
*qcadev)
>         struct qca_power *power =3D qcadev->bt_power;
>         int ret;
>
> -       if (power->pwrseq)
> -               return pwrseq_enable(power->pwrseq);
> +       if (power->pwrseq) {
> +               ret =3D pwrseq_enable(power->pwrseq);
> +               if (ret)
> +                       return ret;
> +               if (qcadev->susclk) {
> +                       ret =3D clk_prepare_enable(qcadev->susclk);

Why is susclk guarded by the pwrseq? They seem unrelated to me.

> +                       if (ret)
> +                               pwrseq_disable(power->pwrseq);
> +               }
> +               return ret;
> +       }
>
>         /* Already enabled */
>         if (power->vregs_on)
> @@ -2472,8 +2483,14 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>                          */
>                         if (IS_ERR(qcadev->bt_power->pwrseq))
>                                 qcadev->bt_power->pwrseq =3D NULL;
> -                       else
> +                       else {
> +                               qcadev->susclk =3D devm_clk_get_optional(=
&serdev->dev, NULL);
> +                               if (IS_ERR(qcadev->susclk)) {
> +                                       dev_err(&serdev->dev, "failed to =
acquire clk\n");
> +                                       return PTR_ERR(qcadev->susclk);
> +                               }
>                                 break;
> +                       }
>                 }
>
>                 qcadev->bt_power->dev =3D &serdev->dev;
>
> --
> 2.34.1
>
>

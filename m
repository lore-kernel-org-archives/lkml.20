Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742137D124
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258476; cv=pass; b=ocLhptOZIP7fIzO908oI6IlgNEoN8PWxm53i07cCLh4Tfj80P3qM838iWV5iS3jahdT5WXvbGu4VnBZGufzCF4MdftZvnRm5s6NPztUBvqivRALJPK0Q35k1c5d9u/uZcYg/8tv92diyw7TVo9ZlNau5jtdFFBP/0+1sgM3N6rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258476; c=relaxed/simple;
	bh=I3C8+LJfgclA827uj4Soi1Cyi3ZxJhmbO0Ll3OMgiP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWMzAEoP69K4JTWoIuXUxe155NG8HdnPMw3pFGvOJ1gAbytesYMz2WdO7XG8PrYMNoBU8C9rEVRJQQEQFJfna0squDhcI8Wm174bH1YnutBa5XSMWduLP070gC3MrJtxCdZWSfNmG7Trh7XrMRD4eFANsR0Hq+gjH7r6/2/mVH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/qih16h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+GEsJXD; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/qih16h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+GEsJXD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4q7a2386282
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=; b=J/qih16hvmWr/aDJ
	iFkMZA8r4dRevB2A12ZnmJByLJBKINDtIxv4oWsM05cb/HhtslyZ5djQPl+XngT+
	nM1zH47Hu9OtCV6qNTU/eAzAB9Vr2MPqqqX/19Ec6/mwSfpC7c8EqHoWUCsglvsO
	GpPOgY2f7r0o2/uys27jhFEK19uzrFfLCm8Ri1exIBGPhdrrKbEF67+SK0kS5RMd
	OpRldW0hkaSOee9uuYohBdNW1FhUz8iuldXx45dQJO1+zIOUynCnpbZehbvMX98e
	odTZP0rfk5hymgd2T4PWuK2FY4SJePCYZMtMM1oyzI3sBiR9XFGHK12mjyi8Swfd
	o27FvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtu4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so1059182a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258472; cv=none;
        d=google.com; s=arc-20260327;
        b=l9/ljTa4RHApzlCP+MZfNEcarePTS0vcJpviBeHpeVijFUyJSwODIBwvCclmxNbZSk
         WlYfq6BA011wCS1E+EbuN50hZB9CVx4uwws909EId6UcLOhp87dn6kQK7BRpAskRjVzX
         51aoIwl5gytXZKM9WAd5uk4oP2I2fvZ5akxMVUVseK2CAs2qL3rkatIwHu0mjkSTAqZ+
         RABeAcXfncCMLscKWXXOmn4UP4ixtyjgJ6bZse73wtssbbG1cJ4muaR01eE+RhDmUtKz
         ZFJyc+ItH6DBc7oZf7hOhDsuaEUeLAyOizi06CsaheeohDcqXplF1sCa8jaYrP9iOavy
         LH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        fh=fMVqqij6DYo5N3lPZsYJHUgQ7oXDnUp4H0TWj23XLds=;
        b=e2oEwrqAUe+Z8CNBO85LfOd47Dd0aoNKqvnOc7NlLrh1Pb1ueoV/FabEyGN+qZkPER
         wsyLAKTWo85sHzCv79k0l2vfXwZVLgDky740ezIK0ED4BMJPwRuepk4ajvNiyW7VgkR3
         FV/jGvCl8JHfYys6HSTFHIGktWEHNGkZEyFb+nYMEchV/s3PE7qkD1tyfw94XtLDG1WR
         Mp+LOai+ZlvmSs0Mu1QFQFFZwhojMkXkLNRCcVUNdzCA6fNABuzTlKBdsfuBf4dbw/U/
         ia6V9H8EgH4ZKNQQKMwA3eQJdRjfanxbjJ1AuESPcwXxLN9hJ/BBxb4BzuxvW8Sybcjh
         exig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790258472; x=1790863272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        b=K+GEsJXDfnXz7xu17h9nCACljjB+7WOrw90y6LrbUS12FTUp7ujDM1i/775n5Z5ie4
         OP0shQX9IFaxx8j2a8WV5kG6/mI6wyLhAfvb0VFp7f2L0QYECalG1AapIDxBzNaV3uSu
         6MX3DiFRDrZ/5BRHUuzcdVcV/RJwJvBsd+U+HPshIOmbu88IBWFd/DiiPytpuNwxPq/7
         y/eysp2CqCbvvh5X79Nr3fjeg9JBP3sbO0hHhzmUG1g37cyTtGMS6cJE2n8vjeZ0rTMn
         zbrdoKqlEPN8AmPirvRxjVHKSH5qT43aD0l7MxUM1H1SkfMbR4VoxwxHXue8btwoWo7L
         43ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258472; x=1790863272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        b=MiLIOo7AY1AkMj1O6cW+O4uYNwmlKD6waHEENxf8KBxjjhOQOh06SZHSD9EqjsLTmS
         5KvK0YpkalYUKsskK1LusVWeCrQ1ZayajEjIwJL9Y24J6HCb4xtXcbjx0ETndRBAUvdm
         C1WecQaOT3dRZ0PMc8TjS1Tj1+dG9nrbOcLecbyuTpP0FXI+nnOkyad09aDXJZriycOQ
         /sYTIlAX+XXS9Nh2MIuel8Cx6eeOoF3ksutwwAsl2E0SqISqxuR1S1RAvM7v0j2f/Gu0
         MY6IOOzRyq7zusJCU6/J+Hlwtwu68CbFLiwpVC6sNWbaa4GxYk7AFwXuQXRO6Yvhgg6m
         LNdg==
X-Forwarded-Encrypted: i=1; AKwUvBwq+ltmcGwmjq3s4GDqwwsfVBrbmDYUfjg9rwjpySaIfuKy3HIGvgtGMbxnDvPVBh81OEhwPelNoyubjl0=@vger.kernel.org
X-Gm-Message-State: AFuF++kbhLc162ctrWOhv+wTEBUzot9PO25YkwccIvxkaZXKcQ+EsUnx
	nPxvOPuFimdfLAfnBExDrAV9vjLMAJ/iqJUhsM9ry641JQ1uBalojJHCarKEuHCxkcmYnJyynKS
	EF+4XxG1AV46rqeQ+2fEvLHg1DO/Psk+6yPo6Hi9jeSV7kvKt7EbAu6sakNuN4gOISQbmgi18yK
	PimsTfNISXkXdfk20LzQRYES2duXsUb8Ffq/vanDFr0A==
X-Gm-Gg: AYBFou1VbT5m0qIJYqhlTLsNO2vzZaaqvsP5vG9CFPCkH9aH52SFmbJ4CGOQMeSCw8m
	AMEhobrEdZPyjk16Njp09B7ysRZlSGt3OoSW9kFbys1BFVsIN4I6nxynyP8HcFNa6GEqEa5EIip
	TFDH+qbX3VSQAQS0yqUhdpMEai84fe6/9Z6u9FCXmQ4BDXX08pjnh44914VQ==
X-Received: by 2002:a05:6a21:9211:b0:3dd:a009:317f with SMTP id adf61e73a8af0-3de0e8cf50cmr2292861637.39.1790258472064;
        Thu, 24 Sep 2026 07:01:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3dd:a009:317f with SMTP id
 adf61e73a8af0-3de0e8cf50cmr2292816637.39.1790258471383; Thu, 24 Sep 2026
 07:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923174711.1283986-1-briannorris@chromium.org> <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
In-Reply-To: <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 16:01:00 +0200
X-Gm-Features: AclHuK9_LJN_Pz_e_vxq4yQal5Z7fnTX7prwt3aNxfp-JOq6nVdTbmWlsg1EK9U
Message-ID: <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab52d29 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=cm27Pg_UAAAA:8 a=J8m5VRO1IUQSW3TZF-oA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: JYcvKexuGJLElE8RUgBefuN_LnHoU_HS
X-Proofpoint-GUID: JYcvKexuGJLElE8RUgBefuN_LnHoU_HS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX+WYN4nYocAW5
 NDT2n3zik0UWvdfder2qZ86n2me4Z0FPV8G/HHIiCVfTdNVHO7HXkyIkf4aOlGxZ5LZqva0HB7z
 ReCu91xuUe8/DXw3bZXK9v13QGEWGbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX0Yk1QlN3utFL
 r2LjTd6Y+ccvro/AsFsQJBPdSaU2L9xBkHgopBYX5WHJJK3VaMPxIcRnaUViiBGMjpfgJyz1fnU
 t6FVvAcUhr8CTM4lo2NowvpQQfp3SBQQfXWtJVLSJdEcCNO/wbKCTeVq0X7KpARSheGiP87+exh
 /0EwycXPrCvGw2XxYZBHY/FxuVuw8n/ltk9brDfpQmKO9wELDkN7NSdY4mlQO1ekpsae450L2nG
 NR9XXvRY2ikOuAbcGPLDRjJ+XEtoqZY0EhvxAEeNTmDNNhr/6ZXtkZPHL3LhSn815gXnsa7da94
 oFM/WTv65KAaQ6QL6v55gcBOQeuGzBJ7+1C9a17co5gcITSjcYRbbK999qZCBxydewYQs+MNi9a
 ECZD6VZm5D5bZ8COqO0kbky2XYtRgijgnNhXlx1bncZoB5q8ROuX4zy833ZFwVyti4Jk5EhTprQ
 GtqgMWng0GR/J2yw+Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240057

On Wed, Sep 23, 2026 at 7:47=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> There are several small errors and omissions, as well as new updates
> (pm_runtime_resume_and_get(), devm_pm_runtime_enable()) we should
> incorporate.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> (no changes since v1)
>
>  Documentation/power/runtime_pm.rst | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/run=
time_pm.rst
> index 39fdeeda7a1e..352cdaf0650d 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -238,6 +238,9 @@ It is safe to execute the following helper functions =
from interrupt context:
>  - pm_runtime_set_active()
>  - pm_runtime_set_suspended()
>  - pm_runtime_suspended()
> +- pm_runtime_active()
> +- pm_runtime_status_suspended()
> +- pm_runtime_enabled()
>  - pm_runtime_mark_last_busy()
>  - pm_runtime_autosuspend_expiration()
>
> @@ -249,6 +252,7 @@ functions may also be used in interrupt context:
>  - pm_runtime_autosuspend()
>  - pm_runtime_resume()
>  - pm_runtime_get_sync()
> +- pm_runtime_resume_and_get()
>  - pm_runtime_put_sync()
>  - pm_runtime_put_sync_suspend()
>  - pm_runtime_put_sync_autosuspend()
> @@ -258,7 +262,7 @@ functions may also be used in interrupt context:
>
>  Initially, the runtime PM is disabled for all devices, which means that =
the
>  majority of the runtime PM helper functions described in Section 4 will =
return
> --EAGAIN until pm_runtime_enable() is called for the device.
> +-EACCES until pm_runtime_enable() is called for the device.
>
>  In addition to that, the initial runtime PM status of all devices is
>  'suspended', but it need not reflect the actual physical state of the de=
vice.
> @@ -287,7 +291,7 @@ enabled earlier by calling pm_runtime_enable().
>
>  Note, if the device may execute pm_runtime calls during the probe (such =
as
>  if it is registered with a subsystem that may call back in) then the
> -pm_runtime_get_sync() call paired with a pm_runtime_put() call will be
> +pm_runtime_resume_and_get() call paired with a pm_runtime_put() call wil=
l be
>  appropriate to ensure that the device is not put back to sleep during th=
e
>  probe. This can happen with systems such as the network device layer.
>
> @@ -315,7 +319,10 @@ removal of their drivers.
>
>  Drivers in ->remove() callback should undo the runtime PM changes done
>  in ->probe(). Usually this means calling pm_runtime_disable(),
> -pm_runtime_dont_use_autosuspend() etc.
> +pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
> +devm_pm_runtime_enable() during probe, which automatically takes care of
> +calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon =
driver
> +detachment.

As I have stated in earlier discussions at LKML, the
devm_pm_runtime_enable() API is not entirely easy to use correctly by
drivers. It means that pm_runtime_disable() gets called at some point
*after* the ->remove() callback has been invoked, which can cause
problems, unless the driver's ->remove() callback has managed things
correctly.

My point is, the above makes it sounds like it's easy to switch to the
devm managed version, while it certainly isn't that straight forward.
Not sure what that means for the documentation though. :-)

[...]

Kind regards
Uffe

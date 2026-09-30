Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176A33938E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783068; cv=pass; b=MXfJgVqul+aUPgcVXMr6c94c9s88wR1Ef2bvivwVKFpt9HeNBOT3xJAFUVFZZcc1lMPE/yUBYtTN2nbTCdZtEdrQYBPYmmAl649L3HnnK8574xf4a2PJhBw8/8bFO0IQVwoYWsEERW7Pt6TnxRcwWT8sij3MYhCe7GA3E3ASHrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783068; c=relaxed/simple;
	bh=damBzxG+fn4m3ZeH5aFlurkQ/0yU3qlYJQG+bVWoujs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqQZ4Q96eGvJy2RJFUb20aeNcbU83sdAGVxXmtet/tQVb9bNXRVacCLsaZ3vsbkBAtlu7sVo6HfMjg67NBvrjSQan1eWD7pDb6F1WzCtH4KcVBmAzLaglyrGgtQAGKit6/+ZUWYZltZz9CkZeRsQKrOGcWttA+GVcoGznvmJYEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSVCp4zq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an3bgkaZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSVCp4zq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an3bgkaZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxtgo2404723
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+t3oags9ojBBG5hv4c71YSluCEXo6cKQ0qthqidNfU=; b=CSVCp4zq/nInEzIA
	edbbtIDb0beiW5ml/235qQGBNWpt585iC/U7I0v4a6zGzSR3QLpdTUcZjRJLlIHz
	H2RmOFqJuLHH+8mumSXW2oJKQyng5umd+9VpchfGuQuMFWX3MN1SuwPg7NuN3xIL
	Q+z0PoXK0L5WrkVuRxH/o337t0lZJWVHwovruQcSO8IkmHJLzB7bWgJRIDBg+BI5
	2/NJ/YZNVdR1Lt5s86jjkFjAsKBu4jkrwpDenVxsmKZcgkUKLJJiHvXuU3TJgHQz
	7Gi3QI9Yh9QbHaMYM0OxlpHiVdBIzP/n6iZ+1jrPMKXjoWnAzFpP9l9W0vHPowmH
	PYjuJQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c25m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:44:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86261e66700so4123835b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790783059; cv=none;
        d=google.com; s=arc-20260327;
        b=RQ37dA/e4hqxEXRoPLWLn9w2lcJKWmk7kfFxrVvXxP64gTgiS80vsLozUOuykIRkWi
         h2G/vaTDtka79cqnMievZiyatxt/VeCbkeu2HCd5edZOYhAk8d6KYWChwfU2Nw9WjyW7
         wTusVJOV6jDpKDkcmRZG7QgmJ1L2bRduzA2A6D9hAmwo5B1JnrFEM7W9BZDJkX2EtFxn
         mGlGSwRVGu4tEhpzEBHerbqd5urBGk8lNXgJXebN+V1Akipfj3D3sb+iU2Itrm4KhS0m
         ftTiRf70WWNB7o3/e9dqGTf1j5OxZnlKHFejxr3s2DkGVVpeLHugPOcMuO4RIEhuM44D
         YmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+t3oags9ojBBG5hv4c71YSluCEXo6cKQ0qthqidNfU=;
        fh=qECAgLltJgSdg5NXp0JHL6n5epVn6YWmdq1f78JHClo=;
        b=pwe+rF2flpH/qywlbeAu0FTyZSPcylQUoXQubiemqqiUHTGVVVqg7fEPFVO6oJgfjT
         qV4ejfGngDKotmD0sZc7UJwsv8vMPpc5/OcQFYnD4QoBsqVD1dWsGFpAVUwqRXmBdQdr
         0Nuj6I8Ji4F7HDTJwclRwUE2SLNbTDL3QII+z6bG+Xx0axVdeyl15rltlNreJ2fe7/Bf
         szzY6FMaXDsT/D2gni3BmHiJkQowGDrGnIcBbmQqDGmOSIH0EqgeqwO5sbIzHnkehWtQ
         ge9yqHEfMWyCcxwYvX5M7+WUk2nqI6PUgTcJo3sBAOhbmRxwcdTSHFmQfw/Y5O45EEZ6
         81/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790783059; x=1791387859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+t3oags9ojBBG5hv4c71YSluCEXo6cKQ0qthqidNfU=;
        b=an3bgkaZtV465UYIDwbAoBOKq31VPRab8vEIRpwKTDVSELbccbA+Qc4POLkn2hx68b
         HdYNzXU/8niK0Ofev3Q2pWKDsIIB441aDuod5gpqxA/ijUPQ9UqzBwsFf4iEYH8pqtt8
         LZzzX6aMqXZYLWm1Or/Fv2CsjaVIIi26tSK1fB/2unyPaGmMT2zVlt6axwiCxWsIBi1U
         XQZdp2m87FWBk3EXeq6tR03r89cvIAGblzO9pj8Oo9NY+z0c8OSLOel7npTat35cc/Rz
         nx78AGtl0EBMEixtgY6G/QYGutSCA/lwXZ2GIraKpASoXMYojonxVceJqX5oLuYrLb40
         9/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783059; x=1791387859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+t3oags9ojBBG5hv4c71YSluCEXo6cKQ0qthqidNfU=;
        b=J9h/r5lp/53tpHv/9tzy4non4JDHpw01H4axevXvFu7+Sc3vFZ5xIdqBtp8+12Cayv
         3yVyPzGYwIiMUKudGFpcws0EQ+i92E0g67Sxte3MtMKnYnVQx7aOyjwdeAZLMWeJ12TQ
         wz8VpiHlaiqa+WMTirpddnMO4n+matJKE8B6PuFnDzQ0F0lt0zdjsJYTFoT7XIxeAtbO
         vmWVdofDE5ZbwVHTX7DUNnmiViSqSlWzTcJGciM+h6oyqr6IJeI1DvFDjI7ayzAhrFZm
         RohDmSNagad+/b5Q8ZRytD/s+KjRZCZbebuMdV1wxRCPjBz0f01aUT3B8pr8tp+UTR+n
         ul5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6k6ZVWmX9rITNTOLNPoTaVHaN2Zco8e2YZxrDYt5T3gosSso1XKYOArZ+TmiX7yxTjiXyia/DZedAT0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nWi07zZ4yPBDnbfMShDkpiTukfZqP83Y0HnmckPp6HHNGhEWVS
	/mrBmVDSW1a6MSfpzEXfw8ok3754M3rfQvka3ysYEM3F7JvKAB+kgzsSem1yk01svtXhLHEcaIZ
	+6BLYIb9UU8W2JvFjThDB27K0nxWsgLHZOgEbjqeQCWrbKJE0Hac5ivlYcSHaTe/ubWgEZxYkbg
	QhbtguiH52oA4GDwckAejtcGs+2RutIVZM42wrqB5jwA==
X-Gm-Gg: AYBFou2NzxJTQuPjPDsRwrUC/NHk9xU6v1Qjq4LwHtgE9taNxITXDVPtvVwJ7uUfF/j
	KhsUdEZ3BeWHHo2qHyhnR8PV+xkz4f3rFs7wpxecSUT5IQE+Bd2EnH6mHzBu8tPNEHlmG81zoIE
	fne04zVyfSgY6Fr1MlDHFToSbegah1dE8gfUCKMmKpOHl0enC5SVgFBme/VQ==
X-Received: by 2002:a05:6a00:1d93:b0:82f:38df:681c with SMTP id d2e1a72fcca58-887477b090amr1428407b3a.6.1790783058997;
        Wed, 30 Sep 2026 08:44:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d93:b0:82f:38df:681c with SMTP id
 d2e1a72fcca58-887477b090amr1428374b3a.6.1790783058280; Wed, 30 Sep 2026
 08:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930025044.104824-1-briannorris@chromium.org> <20260929194956.v3.7.I45a794e4452e3df22419acdd8f11e2b788b3413f@changeid>
In-Reply-To: <20260929194956.v3.7.I45a794e4452e3df22419acdd8f11e2b788b3413f@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:44:07 +0200
X-Gm-Features: AclHuK-vSgUuZfyztG-XM3sRstvPqGYOBe5EhRZhnG8uAIC9nY9bBuEtL3UJ-qI
Message-ID: <CAPx+jO-1UO5WbLxWa1tiE4KmZW8BoHAgwNDGw0YR-7mxd_BF0w@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] PM: runtime: Expand introduction with core
 concepts and structure
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Doug Anderson <dianders@chromium.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MiBTYWx0ZWRfXzNZhJkdSGHpS
 qdwIbI9fz6buyGep2IqaodbGrHqWvu6AWsHt0RxoJ+q0ioJJ4uMkVmA1KXkuzqlJgRMOKLMWS/m
 a3L3Uy23vmBAB/G3qy1TmeNyOe9a2vA=
X-Proofpoint-ORIG-GUID: 3Ay6iUWbgTo-36osAY8IaCo3fyyg7pos
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd2e53 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8
 a=VJfNW8GwkHAFg5Y_f4cA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 3Ay6iUWbgTo-36osAY8IaCo3fyyg7pos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MiBTYWx0ZWRfX5vUVCY3LFuyW
 B7JCGaxHY+usF+RUc3tPk6WdOepC+HoYYmnFo1/LjQ7TUl8rzSKyZmbvzWB3u+YpjOK5FmIl7Z4
 4EYTRhuqJM5dvj98CZ/A9PBW29KBS8F5Lu2vp/C5FXJP7wcHkGB7buTE38aM34CdHDjdpwONFnH
 gtNJfnTDc2eWm/QIysLKPHUcdSBZnhDv2yRWhgt+MVvcjnzGMBWgiHRG+ZWl0nmMLfum9ys6A0d
 zxdFj4Kt+FcZehGPcAkZ8lcTLNJATzMfK8RnQCSiIqIopATcnk8ftLURjL/8uDsyBSjaKL6KADm
 lm30ZC8L+kvav9xz6UlkUTzSnZ7gF00ss3+hlBm/xmVqVc7ORuQ6+6x8HfbUMTm2GE6iwTW/5H7
 IR6RX/xRCJMoa4BS2wH4QghGS5iqS/j/HWIKwSPrypXB6bNm+eFYKqdcWXuZSF9vi9p3otKz6NJ
 UE89J3CAtLADHW23zAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300062

On Wed, Sep 30, 2026 at 4:51=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> I commonly see people have difficulty learning how runtime PM works
> because of the following key points [*]:
>
>  1) there are several boolean concepts in runtime PM, with somewhat
>     similar meanings:
>
>      enabled / disabled
>      active / suspended
>      allowed / forbidden
>
>  2) if these concepts are documented at all, they're scattered across
>     the kerneldoc or Documentation/
>
>  3) the runtime_pm.rst docs don't make any attempt to ease a reader into
>     understanding the concepts, and instead jump straight into how it's
>     implemented (queues, 'struct device' fields, helpers).
>
> Let's try to remedy this a bit by discussing the core concepts and
> highlights at the top of the introduction, and introduce a few
> sub-headings, so it's easier to navigate different aspects of the
> introduction.
>
> While shuffling the intro around, I also see that the existing text
> largely mirrors the layout of the following sections (2, 3, and 4), but
> does so out of order. Reorder those, and point to section numbers.
>
> [*] In addition to API complexity. I count 61 pm_*() helpers, 7 of which
>     are variations of put() and 8 of which are variations of get().
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

I guess Rafael may have some further comment on this one, but from my
point of view this looks fine. Please add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>
> (no changes since v2)
>
> Changes in v2:
> Address review feedback around descriptions of "enabled" and "active". I
> know not every point of discussion was settled, but I hope this updated
> version resolves many of them and provides a better basis for further
> improvement.
>  * Avoid calling enabled and active "orthogonal"
>  * Describe more of their inter-relationship
>  * Prioritize talking about "enabled" first, since that's the first
>    concept a reader should know about
>  * Brief mentions of parent/child and supplier/consumer, and dependency
>    handling
>  * Other tweaks
>
>  Documentation/power/runtime_pm.rst | 103 +++++++++++++++++++++++------
>  1 file changed, 84 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/run=
time_pm.rst
> index 68903d93a3e7..c63fbf0ff862 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -13,31 +13,96 @@ Runtime Power Management Framework for I/O Devices
>  1. Introduction
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -Support for runtime power management (runtime PM) of I/O devices is prov=
ided
> -at the power management core (PM core) level by means of:
> -
> -* The power management workqueue pm_wq in which bus types and device dri=
vers can
> -  put their PM-related work items.  It is strongly recommended that pm_w=
q be
> -  used for queuing all work items related to runtime PM, because this al=
lows
> -  them to be synchronized with system-wide power transitions (suspend to=
 RAM,
> -  hibernation and resume from system sleep states).  pm_wq is declared i=
n
> -  include/linux/pm_runtime.h and defined in kernel/power/main.c.
> -
> -* A number of runtime PM fields in the 'power' member of 'struct device'=
 (which
> -  is of the type 'struct dev_pm_info', defined in include/linux/pm.h) th=
at can
> -  be used for synchronizing runtime PM operations with one another.
> +Runtime power management (or runtime PM, sometimes shortened to RPM) all=
ows
> +individual I/O devices to transition between high and low-power states
> +dynamically while the system is running, conserving power without waitin=
g for a
> +system-wide sleep state.
> +
> +Core Concepts
> +-------------
> +
> +Understanding runtime PM requires distinguishing between several pairs o=
f
> +related but distinct concepts that apply to each device: **enabled** /
> +**disabled**, **active** / **suspended**, and **allowed** / **forbidden*=
*.
> +
> +* **Enabled**: To use runtime PM to manage a device's power states, it m=
ust
> +  first be **enabled**. If RPM is never enabled for a device, it general=
ly
> +  stays inactive from an RPM perspective, and the PM core will ignore it=
.
> +  If it is enabled, the PM core can manage the device status (see **Acti=
ve**
> +  below) according to its understanding of whether the device is in use,=
 and
> +  perform state transitions via the appropriate PM callbacks
> +  (->runtime_suspend(), ->runtime_resume()).
> +
> +  Each device has an internal disable counter (``disable_depth``) which
> +  determines whether runtime PM is currently enabled. Devices are initia=
lly
> +  registered with runtime PM disabled (``disable_depth =3D=3D 1``), thou=
gh some bus
> +  types (such as PCI) may enable it before driver probe.
> +
> +  To opt into runtime PM, a driver first ensures that the device's recor=
ded
> +  status matches its actual physical state (for example, by calling
> +  pm_runtime_set_active() if the device was powered on at probe) and the=
n calls
> +  pm_runtime_enable(), decrementing ``disable_depth`` to zero (i.e.,
> +  **enabled**). Runtime PM may be disabled again explicitly via
> +  pm_runtime_disable() or temporarily during system sleep transitions.
> +
> +* **Active**: The PM core tracks a device's runtime status as either **a=
ctive**
> +  (the device is operational, having completed its resume callback or ot=
herwise
> +  marked active) or **suspended** (the device is idle or in a low-power =
state,
> +  having completed its suspend callback or otherwise marked suspended), =
along
> +  with transitional **suspending** and **resuming** phases. When runtime=
 PM is
> +  **enabled**, state transitions are primarily driven by reference count=
ing:
> +  drivers call pm_runtime_resume_and_get() (or related variants) before =
using
> +  the hardware, to ensure the device is active; and pm_runtime_put() (or
> +  related variants) once work completes. When a device's usage counter d=
rops to
> +  zero and its dependencies (children or consumers) are suspended, the P=
M core
> +  can suspend the device immediately or after an autosuspend delay.
> +
> +  Besides driving the state of the device in question, a device's runtim=
e
> +  status also affects those of its dependencies =E2=80=94 its parent (if=
 the parent's
> +  ``power.ignore_children`` is false) and its linked supplier device(s) =
(for
> +  links with the ``DL_FLAG_PM_RUNTIME`` flag). An **active** device hold=
s
> +  reference counts on its dependencies, preventing them from suspending.
> +
> +* **Allowed**: System policy and user space govern whether dynamic suspe=
nsion
> +  is permitted through the concepts of **allowed** and **forbidden**,
> +  manipulated in-kernel via pm_runtime_allow() and pm_runtime_forbid() a=
nd
> +  exposed to user space through the ``/sys/devices/.../power/control``
> +  attribute. When runtime PM is forbidden (``control`` set to ``on``), t=
he PM
> +  core increments the device's usage counter, forcing the device to rema=
in
> +  active regardless of whether the driver is idle. When runtime PM is al=
lowed
> +  (``control`` set to ``auto``), this reference is dropped, permitting t=
he PM
> +  core to automatically suspend the device whenever its driver and child
> +  devices are no longer using it.
> +
> +Notably, runtime PM also has a feature called "autosuspend." This is dif=
ferent
> +than the ``control`` notion of "auto" (i.e., "allowed"). Autosuspend is
> +described in more detail in `Section 9`_.
> +
> +Implementation Structure
> +------------------------
> +
> +Support for runtime power management is provided at the power management=
 core
> +(PM core) level by means of:
>
>  * Three device runtime PM callbacks in 'struct dev_pm_ops' (defined in
> -  include/linux/pm.h).
> +  include/linux/pm.h). See `Section 2`_.
> +
> +* A number of runtime PM fields in the 'power' member of 'struct device'=
 that
> +  can be used for synchronizing runtime PM operations with one another. =
These
> +  are covered in `Section 3`_.
>
>  * A set of helper functions defined in drivers/base/power/runtime.c that=
 can be
>    used for carrying out runtime PM operations in such a way that the
> -  synchronization between them is taken care of by the PM core.  Bus typ=
es and
> -  device drivers are encouraged to use these functions.
> +  synchronization between them is taken care of by the PM core. Bus type=
s and
> +  device drivers are encouraged to use these functions. They are covered=
 in
> +  `Section 4`_.
>
> -The runtime PM callbacks present in 'struct dev_pm_ops', the device runt=
ime PM
> -fields of 'struct dev_pm_info' and the core helper functions provided fo=
r
> -runtime PM are described below.
> +* The power management workqueue pm_wq in which bus types and device dri=
vers can
> +  put their PM-related work items. It is strongly recommended that pm_wq=
 be
> +  used for queuing all work items related to runtime PM, because this al=
lows
> +  them to be synchronized with system-wide power transitions (suspend to=
 RAM,
> +  hibernation and resume from system sleep states). pm_wq is declared in
> +  include/linux/pm_runtime.h and defined in kernel/power/main.c.
>
>  .. _Section 2:
>
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>

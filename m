Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794657020;
	b=iN3Ti6Q8e+4ul25U92BMEJFWgeTekOVet1JFXEFEl2xNnmVDFCfGpJRxQspkviRgaANp
	 P2Q/HUMVs5wUsPen4K11K2Lvyu7JPUM4qw6ANnLVPnM/bcjoCsg5eAUjyG2HceKPvEVYT
	 2NtaQ50lK6jJz3n7URSVBefglJP5Dh6k6T9RKMQK3AwrSC7C5Kb/Bg6cbi5kzBW/4l0jY
	 GGy0lTDgHROnUNBKPaYPGyvN0ahUbNvd2w/vm9IDrIhOumhMDD+ITuAkW1r+yVgEXno6W
	 jogRjjNhlE69Z3R+zUklElqHBV7FLdqzLjPX0bPKln0TeLOYcaK3HZRlHWqbJPtSKDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3WT+t3FInytvXm1mhUrW8IU5slGuhWBT6i903Bgr7MA=;
	b=uBwG3vvbmrlq+tbgPU1jaHF7JAJdO+ty/i1qKXQCV29J0nwMXOzbCi8Ga1dsI0d3bB7j
	 rmV7aM/SUn5SEw5ICP1M2W9KO9iPR77LQNlnnIqHHuCG2wsl7wY9xZNZy7n3w86KgwnIl
	 ykd6wcJOXFEKO3HZTpLciyAw82MkUNSW5sEZjR/mvEYzP0gvCqIfRhTqR1eTaAbHItih7
	 G/1F4mNcn27czKOiKVaUJtGVFvVsAHAZoRyLTk48+k7/P2mKg6OSAE2rGvZZCIbJoNQ/k
	 aHc/J2K2QGTs9KgnTN2zbg1of/hT7GG1GATTI7P50Lv6cjhqE6NX3P7HVYohFdTA6sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evgrxfI2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Agj4Y+w8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC37606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evgrxfI2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Agj4Y+w8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wUGe3276583
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WT+t3FInytvXm1mhUrW8IU5slGuhWBT6i903Bgr7MA=; b=evgrxfI2jraTFdFB
	Zux+Ealuwzn/cNDaiX/6G4yXxBo3JwZm1xS4OyzRKtgngeW5vOMYostRzGgD2vUb
	ys4yhJgD0dSd9bz93SFAT5lXVbsxYDkCRhySJQAs2nJf6zAALm1lgqSbHopb9/jp
	LT1JA6dnIyOtlKMcuVsIFh2cKeOfkyJ3ZcQx3GKyG7GIM/g8mcCXP4jbxvPOTmHn
	vLXZ/Iw9/xE8AgvfnYxyPXaQ9ZVjpuS9t+roL0zs31SCABLXal7SckTveiMZ/1WM
	Ue29HHOoK/nCzPWe98nLyqszHUUZL2cvH/BhmiM1/JVGalS+g8Fca0g/V3M3O3W+
	nh9Ehw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgsjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2099175a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657018; cv=none;
        d=google.com; s=arc-20260327;
        b=eDwtVYPqXJyKrP53Oswm7leb4QKArW5VTe5etUdgWd6ySlalHEUvqbjdlBbghGQW1N
         EOeXE8i1alCbwVhrQb7LHbarrOtKGkzyaKTkc8zl7jGewuMLfEBiR1YxK7nCSOrl6V23
         PiO39uwrtEXiMHOZ/WLHP5Jlw+SITtfDGwfjTxDE31Z+J89z10izUCSfQx0hLZQRvRfx
         yDe3cb8RBg/+JIUvhW1fjNL4uYTSKN53kAtdg3vmu+VOHM+6HCAHIETzOdAb9A3x80zd
         TcILNGHlWR6ty9K+CqLD619CLxq09eXwWLcFwGyCBMp67zFHiMqL3hHmie5i/OQxYzsM
         Dpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WT+t3FInytvXm1mhUrW8IU5slGuhWBT6i903Bgr7MA=;
        fh=QdZTYZEPf9a9kYuttzYhlXfefDD1Yo1fL0JGYJoTFJg=;
        b=svxykLnQgJV7vDQb+OG2LtgzRonDJTZgDslgo1IFCBkee3aV6SLp/pYxqZOSybItwi
         Qt6OCYjp5pXLYICG6F3rWbzz3ESc8MQIoEWpbtBl1l4N1/9X1XzTD/qiOkNFSU+LdgpW
         6Dk4zDVIgZRYeZMrcuWdJnZnGTuLpkOKxaXhFVOy6SwBHACX9+VVQyxtPZEzJXaXXDtW
         JEIHEKACKQ8UNcOl3hV8yxJJBlYliUMXdBjpjnRkSALwl2KIU+E6HppmxJAZJfF1ZiAZ
         HnfEsEdxMIDvF7+jSQicYpG74bbo6q8ExtAm8PmrnUaM+N9J0LR1zjc4LUP603Ytn8Lk
         i0Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794657018; x=1795261818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3WT+t3FInytvXm1mhUrW8IU5slGuhWBT6i903Bgr7MA=;
        b=Agj4Y+w8gMjXoViCM/a2gHLHpJnfeB+T5S4nufSB7yl/TwdfR4epJII7whF4ww8/NA
         l7FrlKZQjtRT3cEvTYJ1Y22gyJ7ebh+lxbGu82MJYdiIPItvE+iNr2Jk2sYCgVjtZqEG
         hX9O5+4Vv1Ar29O/Vivnh9qav5rcNg2trJXY942ooIOf63xh5r5tpt9EDmF8RSEJUh4L
         911xOsaWErfKtD3N18yLz/wb6tLEGUx3s+YVRT8wbGAtfGp4YA4uogGs0HQOP4pUeiXV
         xGPdd7iqM4HSe8O81mfxLgkuo53Acv2wH9wU7KhtLGeeB0LsAdI9EKf5evQqWw3MBlZA
         4OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657018; x=1795261818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WT+t3FInytvXm1mhUrW8IU5slGuhWBT6i903Bgr7MA=;
        b=1pwtvQjcNMsHp+auuGy6gl8KBr1QuMg9MZdU6ulIr4MXhVuti0MuKT8J2sWbYSIxOJ
         e2JnI1Df9L+vfNLNsbBlnzGHK0wjPJbN733uOIkO1cSSTSCJlKtoF0WKuCkfjeH9bE+D
         5Ea2FRNlnQ5XHl8AMY3W7H3ChUQg9YFfnuTug/mTKJxqANopNjThLRXPWwY1XWlCVm07
         iV/0/aILXvdf6gLyIdfcdOIouqHZdQ7zohgXh8BmlGSDDx+5+e07V9mcI/wivaIi17Fw
         /rH8o/UKoL4qexmhjdC6XYvknkWSv6T3giMPO0tGYfUfIKFrgtLo7sHzJF9Bf+2NZtT9
         1sAw==
X-Forwarded-Encrypted: i=1; AL+hErHkoYA6QdvVaFjnKGhCykBMBBrpJm47opt0JtErHJjUc20BusxgEJic3zwLieTqiTo3m0Xjwfu5UWBDHpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Iv/B+G/WfoLW20+f0zQnSBcFj2kmQHxCWdtC6yaOI/T/QwQA
	siJYm6lJoW0HVGF0u5Ron2gQSmzX+n+nqLynsbTlxYo4VjxMOv0IQ2MCXmq2Tje8xx2fTGwANdl
	/9o717NrncNqjSlF47xmOxjEWOrhpUq5qHyNaCsGxUG3j8QkWbHojBtBHG/Ar7fxv9UOg35OvO6
	axCHvncxpTeXh8/iiRevawXM1kgc4f8NWnU6B7DXo6s1aYqBvSaA==
X-Gm-Gg: AYBFou29dDcZLhG8XcJ6adPdayPR2yhjy3B25gPPhCUYXL266VqvmM5AgaFppt68zJK
	Z78q7II4fYBPA1d677O14px87Qf6kQDSHLW3gp88IByN6B6JqJYUceyrIF/WNCbjne5c3/eqhom
	/YG/P4IBAG4Xh0f8UUHeb4tSQO64oKOnQLxrhKNTGYuJ3X7aCoVgTHD2mJxA==
X-Received: by 2002:a17:90b:5910:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b1b0cc8f69mr3190567a91.29.1794657018090;
        Sat, 14 Nov 2026 03:50:18 -0800 (PST)
X-Received: by 2002:a17:90b:5910:b0:3ae:3b3d:c617 with SMTP id
 98e67ed59e1d1-3b1b0cc8f69mr3190554a91.29.1794657017610; Sat, 14 Nov 2026
 03:50:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112172241.1.Ibe6dddf06a4b7e5b24af24dc85d053e36f940549@changeid>
In-Reply-To: <20261112172241.1.Ibe6dddf06a4b7e5b24af24dc85d053e36f940549@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:50:06 +0100
X-Gm-Features: AclHuK8CFmz3CQfa1T8ayq82nkVg2Q-hgsilrxt1aKjTCJE48ykohO33UTlirlo
Message-ID: <CAPx+jO-FRXoNjiCRuvfR+eG2fK3mxSb2RVwAsqAaWFoWH6+Mkg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Skip SET_SUSPEND_MODE when OSI is unsupported
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        dario.binacchi@amarulasolutions.com,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af84afb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=rMreS1aEiTCX3J7MmsgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX3LJTeDEQopE8
 XO12z+A5VuQX+P8OylMALNIeN0GAsxRhH4tgaezKTia89Bgn8uaFLwy4RD072nnpWvrmA/APQ0Z
 hovEy17Rn7gDt2qjy8m8v9QLBjVR1vU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX8LyuGRSALhoC
 P3ZQnCySYrXyLo2RiDCx/vk2e/TMfLHBM47iuqjjRSG3PzBTmLYTJkv0VWzAhfKWi/bLM/WZQrj
 H6Y0Utsf4Wlp88iyn/c8COzHs8ukQTFc7c0KhTUtwxrGgxsCXiSh4DdcEYAfsSC36C0RE0ShhMy
 elvw5uf9n1R8F3mo2tMsHbQMCRIbDSpyTEzEiSx8rW1FiQHoqSQTBoYCP3eOt2BoTX343FtByIh
 +Jwu0lAqSH1AcMeUgR5jS6XpIjZFach4TaX+UyuOPMHyhbRFRAiE7VY1T6uwk1Xesne2pVtxAOU
 p32nlmmVSx+47eaYFOHMNGDf2TsD3BAjNrrMxhmtRniZ5kxU5z97jvgsZVQ1Xd7KkXub+QcKjbj
 AFW2LY6DIragiXayPqlMPAAHIJnI1ZJArpVB7rg67pNMFoZVdgcnOJ31SCdyXipdcIpX5hI7VRm
 tEXZEbnSHa/17M1snmw==
X-Proofpoint-GUID: VMw57qyycCGZiXTetA9TIQVAWpgXNTcX
X-Proofpoint-ORIG-GUID: VMw57qyycCGZiXTetA9TIQVAWpgXNTcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140046

On Thu, Nov 12, 2026 at 5:23=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> The PSCI cpuidle domain probe calls psci_set_osi_mode(use_osi) after
> creating the power domains. When OSI is unsupported, this still calls
> SET_SUSPEND_MODE to select platform-coordinated mode. Firmware that
> does not implement this optional function may return NOT_SUPPORTED,
> causing the probe to fail with -EOPNOTSUPP.
>
> When OSI is unsupported, the PSCI specification allows the OS to assume
> platform-coordinated mode. Skip the call in that case, and request OSI
> mode only when psci_has_osi_support() is true.
>
> Fixes: 12acb348fa45 ("cpuidle: psci: Move enabling OSI mode after power d=
omains creation")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Hi,
>
> This patch replaces the previous patch [1] in SCMI lib
>
> The PSCI specification v1.3 describes the PSCI_SET_SUSPEND_MODE with:
>
> "
> 5.21 PSCI_SET_SUSPEND_MODE
> 5.21.3 Caller responsibilities
> The caller must be able to cope with the following error return codes:
> * NOT_SUPPORTED, in which case the calling OS can assume the platform
> will work in platform-coordinated mode. In this case,
> the PSCI_FEATURES feature flag 0 for CPU_SUSPEND is also 0.
> "
>
> This patch implements the expected behavior:
>
> PC mode by default when OSI is not supported, i.e. CPU_SUSPEND
> (optional) are not supported; PSCI_FEATURES(CPU_SUSPEND) return
> NOT_SUPPORTED or return psci_func_id Bit[0]=3D0 for OS-initiated mode
> not supported.
>
> When OSI is not supported PSCI_SET_SUSPEND_MODE (optional) can report
> NOT_SUPPORTED and by default the platform will boot in
> platform-coordinated mode.
>
> [1] "firmware: psci: handle unsupported SET_SUSPEND_MODE in PC mode"
>     https://patchwork.kernel.org/project/linux-arm-kernel/patch/202610291=
91624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid/
>     https://lore.kernel.org/all/20261029191624.1.I5f8f3d75a566b72250d629a=
c6f43cf0d387c0218@changeid/
>
> Regards,
>
> Patrick
>
>  drivers/cpuidle/cpuidle-psci-domain.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b943e..eed9ad94659a 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,10 +159,12 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> -       /* let's try to enable OSI. */
> -       ret =3D psci_set_osi_mode(use_osi);
> -       if (ret)
> -               goto remove_pd;
> +       if (use_osi) {
> +               /* let's try to enable OSI. */
> +               ret =3D psci_set_osi_mode(true);
> +               if (ret)
> +                       goto remove_pd;
> +       }
>
>         pr_info("Initialized CPU PM domain topology using %s mode\n",
>                 use_osi ? "OSI" : "PC");
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> branch: master
>
> --
> 2.43.0
>

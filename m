Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19474CA787
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553123; cv=pass; b=fPHQQR+t+K4rIEmZYKmqqx2DV8671hr7tEnGmwNdm2Jsd7ThSM+VKrJG0dYJBQ0jfQduS26p7cxCelXY7/PxkPUqI7Zs4ayIddiFH81TyWolZncVmQ5Iz6hjLkf0XQBif4AR7wS7EnnQXDoXDoDRrQdFT5M3M1oZ3I8RrNSoy8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553123; c=relaxed/simple;
	bh=KlpZ4C0QQdv2EApImmTIaLHJ1hkTLasWN8lwuqZplfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na2HUa4BeyHZhNRfT5VOdtwDD64p+Jn8eFh/747xdbkiRGZfuY0wHz8J2kGS2MUpQ1+vUy4ncNSKy9kyJK3hc+2in+GqmDNjNeTB1epcs28eel+5Dw5VK2W8YkD4tY3q0DVH1pWV+KL3ibmQzIFvX+WHtly23cS7S1ZNVC0NhI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPiNzVCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRFsXw75; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPiNzVCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRFsXw75"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92rWR2122516
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSR5EOGHcLdXyZAnVrMn+XyqdBGVNfkPcLIWWuDPkWo=; b=GPiNzVCMH+ZeUP9A
	uSspZ9ihshyuZvEwAjs5fyDGQDVtt42buciCHKFvCJCtZxh0jiT/hg0vG9Z54Yzr
	5fuORHgosgbGnX7g38g52Y4vg/8GsJ37wopKXy7Kio5ZMs3bNG1csOD3lDGWLi42
	L9R3H5IEmItJF2+QnCo1bVdf2x9pyVNAp1QfVkPC3a+fogxZQ/91LwXyB+4CgxKY
	QLuKlUEkjzDjLRsf+p4Rt0Bv/x4Kkdu4ckBC0K8OPj0g6ss7xO6kqpSeZcwuKfZv
	Z6EaQfmVi8AlraOX37PLYMVteKKBnV18EpoNA0NI55uRZhYUenT63u1/FeTsfI5R
	9R+wtg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7hdu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:05:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so13865720a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553114; cv=none;
        d=google.com; s=arc-20260327;
        b=IylE14Q/kW++7n0QBXPKnk+O/G5la7kAUf9HZJo4IIqwnotobQ/PnGo1nON/fcqXVZ
         52FgXDI1SZE4hfwa3AqMgd1s6+3Tf9aRlDxQSNiBzV649hV7w3uoGzV2yisC3DMXrLZd
         AUn72A9O5BSsR/pPML128PLD0xT1R5OxPkC5DzLQEkS0RDg/IyLBAsT6iGEYVwkF+Hnv
         eyV17anfZRQk2xdL1KAN5jn18jb1+MNtHWa79kSdrmoXOqFKA9sHrrUgjcd9A7G5xYWJ
         gBLwrbCpvtp/r5sHOMX8W4nv5qXSkp2KJNNOV45WBIzxzqoP5oOMBhPm+8JuFFt2dquz
         XpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PSR5EOGHcLdXyZAnVrMn+XyqdBGVNfkPcLIWWuDPkWo=;
        fh=U/QfZ04XYc5Z/z1dWBEzH3BkGOkpi6OnP75uiMeD7DU=;
        b=OGpBxoJbheN0WVzgw61KbY5YDObomBu7/b/1AGo0sik5Ks0/K36MNtPpu0N9JFxNpr
         C+lDRda9DZcY+f5fxZ9+XcEoIBWixm099BGYPhBgRLE5leTZBJAlqu/XVC+IIexP+2Te
         SaV73PwmIWpharzSXppCt9Rv2LNi1ewfWjX7cVUHNSKZz3RYElMuRd2JaxqNquyrLGlv
         RMz57Tgs8z6eTQlwN7PfbcfFkKjjQxcGmWtZt7F+8w/wud4uGYNehMzphhKQdY5nH7ZT
         Cc9D/qQf8BkiY061PCwlB10ieGZpQ1g6lC07TN4DbUAo5tvEPM04U1uLHG4yxmC7k/rb
         3UTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789553114; x=1790157914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PSR5EOGHcLdXyZAnVrMn+XyqdBGVNfkPcLIWWuDPkWo=;
        b=KRFsXw75SN1UEL7uLDgejqcY/EFjefDRCgBw7AkKzDGuVUYXwD0+VREc6o1jnjueNo
         XFg0lWMxksR3JECI4Sst6Bul/YpLtRJanZZwPu9RQQs96EhUhUY7Wh20SmUYvGU/OmCv
         JeKikb96Wb5WIY/00a6NE3mWiXzv0OLeDTDH7xb9MCfbMN9etRYrU045pZ4P2Dd47R5g
         EV28PF5ZzGkuAitmSWJh68Ub8AHr7JZXwM34kOS68fZZd4p9bt2fEIE48GdKnOa26u0l
         1+pkteHX3KQfTeOq7QWFkU75GVyvmOxKp8QjGYH5GU2NKzSL8ASyx1jLT4NNSMDQYIh0
         ZWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553114; x=1790157914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSR5EOGHcLdXyZAnVrMn+XyqdBGVNfkPcLIWWuDPkWo=;
        b=VpQ6RCCe5VGoBRIkSJN39JizFWyctGlbNW3lTPBUZVznJ5GQeMIP4UBhKCn+EieQcx
         pEkXiIcetssfny60Z6SQYvy/A7IB4WolRZloWV9mjS/MtKK+DO/Vr3ZNmzzMGJhjIMZ3
         oP++QKJAsSLM6ehrEUjEULKDXYhcXtdbmD+ENRfEif7/PFPLmdQU5Xb1OTtyQ206kC3T
         ai32nNv7r2XhjrqJODt1oJAzfv0s4OOzQZHFM5Nru7sTpT1z1/zsDCCkT8sUP11OdcuU
         Urr0nVjVM6ptVqMh0tsqCWK9mmA2TV2mkJ3EH12NdWC7lJteE2T5EHu8OV247vyiduyC
         Ci1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFU6y7uv6kTCjz5oy7zdhCac+8okLxkjftYfa4mash2nKGkI4V5zWqytW+BKViPqIEGo085sjEGpggdSc=@vger.kernel.org
X-Gm-Message-State: AFuF++nG1i+VuN3oVd3tMNqwiVQQyERu5XRe5nQZeRhi5MeZIRu3M9ID
	pXRqDPFrNPztuNoeKGiA3bjT/eDGVy8Hp77OIPTIaJS26md+46WxNS+1fkTaYotEIMOM0XmCSF2
	Il9tAt16CgrEvgraupVj+WKnrhDe9rjGmgzfhylTkpyffwt5Hk5WrR+LyUt1gq1gbJBGNZuaGT8
	0IQmv1ccov5ZVC0vy+yXIOpftE50KHjt9wjWnF3CtA6w==
X-Gm-Gg: AYBFou2S54u+HwDvi3dJ6CncDC6sqOCS1biYpfTmE4xtj02aYi7Hg/s6nm4DxNR0Adb
	8MM5owI/R6s3o/vthfIW0qTMrY5eBK83SStnmea8O207GCYMfSW2f5wPfeYNVTjfn7cAqETi2fK
	oMD7PFnsBST6nEAJRvTHEg9XTUZGxlvyrf0XQq6zhEOpJ/3ZKFXsYt8MGVrA==
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr4834698a91.0.1789553112553;
        Wed, 16 Sep 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id
 98e67ed59e1d1-39e1df8d6b4mr4834324a91.0.1789553110438; Wed, 16 Sep 2026
 03:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
 <20260826-topic-lpm-pmdomain-device-constraints-v5-3-28cbf43f7e38@baylibre.com>
In-Reply-To: <20260826-topic-lpm-pmdomain-device-constraints-v5-3-28cbf43f7e38@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 12:04:59 +0200
X-Gm-Features: AcwNN1WI-MdWn8rAblKl-alZ71Ey8wbhj5YrVkwbn7F-hMM0YrftV2KIH8INN4c
Message-ID: <CAPx+jO98X6dr20r3o7iHUq7zrjsDy+6YDM=FiO6MOkpCJFfhEA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] pmdomain: core: add genpd_for_each_child() helper
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: EYxeSfo1VAdfqiphCf1JtW7HzPPZLanG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzMSBTYWx0ZWRfXwQotwuFqIm0O
 YtVk6+mDAz+BztVEXuzKZkpjXLAcP4bZuFdA9VmWYcay4icVouFGhcY8x6rQO1HCj9qJLSasnAh
 sefFJ7RAuvUUD9ZZcVcI/DaYjPwqcswF8I03ZBG1FWIXwH3OF8rGcWRSZgGgQtT84jeQNY8lVlw
 f6r2yu+6meCBGakKpAvGMdRx+QO18Xgx6bjEdfCsKeVqQyht0EDbnf1vEJtF6RgXLf6DXDQkDGa
 9PyMzKIR23yWMwEbDMTEtvNC7uF9wDVbyZuAHjb2eTgyoq1tiGhs4Rc03Ldzq24vm5IV3mdK5o1
 76PAwC/FCb1EYU1LShVeWAcflxjc21eB1dEmeIvBWWHEPmqINiMRnlvrDd+b+BpbdmTbYJal42Q
 uZhNzOvAOh0a+D6oyUOPDASAI0ZYAS6kc8zNC/ivlG3tOF+/xHg90mauUoyX/3Y/GV1QbqzxYoP
 JTCRaGlwibrjOi/iAlg==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa69da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8
 a=gpB5Iu8SvZwnZuIWQ9MA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzMSBTYWx0ZWRfXzeL9/K2QMFPg
 qWHK/4e5CMP+FDui8qd6B9rAfuS34NI3dZ6I0OJGibp3mz7kU0bbWhWlE8+9dhEXv0/MOORV4r4
 P2nruxoUV4NMkTzgFtXUM6Ii7+TBVDs=
X-Proofpoint-GUID: EYxeSfo1VAdfqiphCf1JtW7HzPPZLanG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160131

On Thu, Aug 27, 2026 at 12:23=E2=80=AFAM Kevin Hilman (TI) <khilman@baylibr=
e.com> wrote:
>
> Add a new internal helper function genpd_for_each_child() that recursivel=
y
> iterates over all devices in a PM domain and its child domains (subdomain=
s).
> This helper is useful for governors and other core PM domain code that ne=
eds
> to examine or apply operations to all devices within a domain hierarchy.
>
> The function takes a callback that is invoked for each device, and suppor=
ts
> early termination if the callback returns a non-zero value.
>
> The helper is defined in a new internal header drivers/pmdomain/core.h an=
d
> implemented in drivers/pmdomain/core.c, making it available to other PM
> domain subsystem components.
>
> The first user of this helper is the cpu_system_power_down_ok() governor
> function, which uses it to check device QoS latency constraints across th=
e
> entire domain hierarchy.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c | 45 +++++++++++++++++++++++++++++++++++++++++++=
++
>  drivers/pmdomain/core.h | 17 +++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..ff27369d9a97 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -24,6 +24,8 @@
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>
> +#include "core.h"
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>
> @@ -276,6 +278,49 @@ static void genpd_sd_counter_inc(struct generic_pm_d=
omain *genpd)
>         smp_mb__after_atomic();
>  }
>
> +/**
> + * genpd_for_each_child - Recursively iterate over all devices
> + *                        in a PM domain and its subdomains.
> + * @genpd: PM domain to iterate over.
> + * @fn: Callback function to invoke for each device.
> + * @data: Data to pass to the callback function.
> + *
> + * This function recursively walks through all devices in the given PM d=
omain
> + * and all devices in its child PM domains (subdomains). For each device=
 found,
> + * the callback function @fn is invoked with the device and @data as arg=
uments.
> + *
> + * Note: this function is inteded for use by the core and governors,
> + * not for pmdomain providers.
> + *
> + * Returns: 0 on success, or the first non-zero value returned by @fn.
> + */
> +int genpd_for_each_child(struct generic_pm_domain *genpd,
> +                        int (*fn)(struct device *dev, void *data),
> +                        void *data)
> +{
> +       struct pm_domain_data *pdd;
> +       struct gpd_link *link;
> +       int ret;
> +
> +       /* First, iterate over all devices in this domain */
> +       list_for_each_entry(pdd, &genpd->dev_list, list_node) {
> +               ret =3D fn(pdd->dev, data);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Then, recursively iterate over all child domains (subdomains) =
*/
> +       list_for_each_entry(link, &genpd->parent_links, parent_node) {
> +               struct generic_pm_domain *child_pd =3D link->child;
> +
> +               ret =3D genpd_for_each_child(child_pd, fn, data);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static struct dentry *genpd_debugfs_dir;
>
> diff --git a/drivers/pmdomain/core.h b/drivers/pmdomain/core.h
> new file mode 100644
> index 000000000000..a296134d4005
> --- /dev/null
> +++ b/drivers/pmdomain/core.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Internal header for PM domain core
> + *
> + * Copyright (C) 2026 Kevin Hilman <khilman@baylibre.com>, Texas Instrum=
ents
> + */
> +
> +#ifndef __PM_DOMAIN_CORE_H__
> +#define __PM_DOMAIN_CORE_H__
> +
> +#include <linux/pm_domain.h>

I don't think this is needed. Instead please make forward declaration
of the structs we need. Like:

struct device;
struct generic_pm_domain;

> +
> +int genpd_for_each_child(struct generic_pm_domain *genpd,
> +                        int (*fn)(struct device *dev, void *data),
> +                        void *data);
> +
> +#endif /* __PM_DOMAIN_CORE_H__ */
>
> --
> 2.47.3
>

Kind regards
Uffe

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C264F6493
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555484; cv=pass; b=jX8Ch43FdQ51xhwSsjp1x5gyAtJrqJ8Dhs5T/m+JdY/CLx7C7vd5aHkwCfBAqifgkWlrFLGg10WY8ePx3S/A2/xArRAZF5MYLg71uXYr9qvD8nacBB5cDiyt4aoJyoJjAxteSxTp+XNJyyaVnd6gqG9Zjyrrm6ImQD0AjVW3mas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555484; c=relaxed/simple;
	bh=t3edYH2dAigivGId7bqN7noCiMnep0+qs+Sg8AmKu+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvRXFedEtsPa/pRJQgNsNSfud5rYcEzq48Uq+qsf/X+qQdCJzsdvttleiwWu3NmFzWZ9SKwUSid0PUomrJmvJUDcQed53/2kZtqlBG3ppOlMO3jcYGWBW1eNbeKUalWRiS7KJzCQDigE6rEQTgZvwylQqvNEF7Bh08wxnDbeCJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZ6rf+w/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHitcd5J; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZ6rf+w/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHitcd5J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92nK0978264
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y78+lX6853THQh6jPcfwva/3VXgIgZTi+BGi02lDQZU=; b=gZ6rf+w/JxrYaFon
	cAmk0VrD2q8pKL0OPvZ3al69fUVfVzDvkNnCHE6Qlv8nv34ChsLpavY203CRAB0x
	93GWKMN1JcVWg4bOhdajrp8/xoC/6LY9wvXR/zJQ5wenH8WaD9vs8A8SQdePID/x
	lm23etvWY5Hb8wWgXdIEg2Sb0ra+LbbFwxNZxdZHtiYbuPJ5DTd+8IjMODWM7Hex
	xXZJF/SEN9zjbw03BPLeo2Z4JV+7E2nVLFvizlijXCM3gJ87d5OmcY7UPhOAsx39
	HHanUQYp5RWi08xs+NvgtA3ZWMYw+OzW/3q9nKB2imUVIvCmlHKTJu473C37frjI
	tguuxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rhem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:43:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so66345295ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789555438; cv=none;
        d=google.com; s=arc-20260327;
        b=e+8jm6GutwM0sw20hquLgEJp8yPjPrg0FtNOPHo9NkwIqg2Nmj8P5uWsQJs+28VLT/
         BTZVGTgLlyUzTtHb4f70CcrRy5iASVOabtodz1GSu5SSBByIgwDYsMrNTiIn1T3Glde6
         9o1A//5xB+SDRh3Y0IDw016vjfZOI1UlcZRyv8fXha53VSOSUlGNavPkNiNZznWimepi
         UVTQFw7NN8+LDzPgX5AtAXklyY4a1JiG0KemffJbz08YUTsBoJv3wNyM0j96npQEVnom
         mavjES/XTIwrDl6Icphlv7Dhi2QUcpisnjLe8JUbJOHtCEFOgx1pN2eFfAq0UsOR4czC
         DjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y78+lX6853THQh6jPcfwva/3VXgIgZTi+BGi02lDQZU=;
        fh=+vBPuJoFL2j3bXakybVknZM8R+5lYkz7wrAkxnY+ML4=;
        b=NmaADj2HYTG6xvoEZwj8nzedml9pn2KaV4Tv4JH9PceoveDnf9y3OHWsSoYTInJESh
         dtqN/4oczzLKy/9amQzGYhOfh4z1T3UEJADsuKnK2XaA2mmbjtyQjohwVcnkRcFqpyQ+
         zOEVZQhGL6sU21JOyN2C5N+4XcRArfhJix0oJx/oeIrkX0wGaRxvw/djA08yP0zxUhKH
         5qqH70CXkDfpYPt1bjXtiyk7osJXLKla1RkBKbA2BJp1+SbzQFMtFX/xLNz/aIivistg
         aT7cxbMIwiNX6NncPvahUOcY524kPJLd3PL0SHFn7ZoFutBKP+YlVb2tEBALQKj6a0jx
         tmLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555438; x=1790160238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y78+lX6853THQh6jPcfwva/3VXgIgZTi+BGi02lDQZU=;
        b=jHitcd5JsTA9hU27MfOt4sX8PixgUDakuNFD1erGzcEyrtczrfCdX/yIza7e+XTwaM
         yfFh1TzUdoCKKJ6Z8TF5W7dfmxPqaYItzF7qUCu362Yonv2FzPUc+40XsqrXm/7XSaKU
         0K1VUROLxYhlYtZAI5RTiJ/Kef/CNTBi36BVjzCFVDk63jPwTPOC555IeD4Q94WT9LHK
         o+hoDObpVPK5OiHJXPR8OdA1w5ROEJDzZtxIsjBVeW80bNnwZGvoSEbyVyNm/30rOMSf
         7auVBa/ngOw1EbopQCBYQQKbvsDEeQG5GjlcW5LnTBQE3rQ8f7zv6WD2KnHIUODuU6oH
         LBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555438; x=1790160238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y78+lX6853THQh6jPcfwva/3VXgIgZTi+BGi02lDQZU=;
        b=AzwuAGIY/SyidOC02pKUbq5eXnnD+bBitY9/nJ1NwMdvib0uKo2kiCNFvroJWhL5mg
         +ZOp1rjx1hW2+X1BzmpGdQe+izGKVvLTNDqrLdCBoMBKCy5vXvtk2G39GtkyL8ko3uBp
         KMYaPL72P31bjQp8WPe+6pZlpy9KPqtVNemkbLP6b54R0fSK76fX8XkJbxg8+MCqBVa0
         v80VpUxQ7eES0xMef999Ib3PpLMvodlsQaumjXWSFmPjHD2rj5VuCbVjWBiAg1ssb5Za
         xXA+owZTSD1i29etVjB8bm2AltKEdehruK51EjYf7uwX+fTAtuDE7SYcbD52bM/5OpT0
         qvOg==
X-Forwarded-Encrypted: i=1; AKwUvBw2jLB+tgsRptQk05n54Nc8NPqB7mA13SZWhjL4jrCJJGPQm7ULP0TtlPc8K3NGckukvhzYH+mAt+eH9mY=@vger.kernel.org
X-Gm-Message-State: AFuF++nUV/bZdJnS7Kg9ZqNBt9i7oZ/jQ6SchLU1cabRU9iOoll6Lang
	DCeTOfkH1YFc/vnpX0eIfCzItEHPAINM7jQ0T8R2OdJ6E7ft5KzK6LJy5MCISD6rUAXAC16Vf2R
	Ug7gfRWefrXv4bQwVQWqnhGUjXpM4IM2XQtZObOSKjuN36QO9eQds3kqG/vHozMIWW9q79EN7WJ
	d5dJ9dtRoJOKbPkgDM2tzjiaMQ4440zHzmC2ewmThl7Av9LrQphQ==
X-Gm-Gg: AYBFou1WCF+GHi47dugaKmyL1zRAPx9aHxjjG1XTknh1PHK1Xa1CmyjzhLXcd9RHHL2
	Z+quG3vIoXY1aP5KMKC9G2UubfnK3IokGpF5pHE6XeYuh/C5T4NonOpJgPjeUhSkiVYRlTY0T5L
	n73UrYqx+IbDgKfj2dvyIfoVfgJTzXELlf3E3ilymOkmV3d0GIUDsZAaFiMw==
X-Received: by 2002:a17:902:db0c:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2dd8dc0a434mr43262655ad.2.1789555438333;
        Wed, 16 Sep 2026 03:43:58 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2dd8dc0a434mr43262135ad.2.1789555437854; Wed, 16 Sep 2026
 03:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
 <20260826-topic-lpm-pmdomain-device-constraints-v5-4-28cbf43f7e38@baylibre.com>
In-Reply-To: <20260826-topic-lpm-pmdomain-device-constraints-v5-4-28cbf43f7e38@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 12:43:46 +0200
X-Gm-Features: AcwNN1VkH7KPswGrczeol-ocx85P_bczEGyw91JrnZAhKZTlY_XQFiC5DnHJBfA
Message-ID: <CAPx+jO8UWa37s0XSZN2gGjcBrYOR9i_YMyZ8QWqkHoXrqVkorQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pmdomain: add support system-wide resume latency constraints
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Kendall Willis <k-willis@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfXzfW7cUVq/+xy
 UjFehF4IyBIMkq//kUc1AT7p2jZhBBQqy0+xIEK998H9YnK1iAthRlhdOKvfBFSRa+UoNNZ+mi2
 +ioT+k7+IlLal2uPMqylGWt4NQnxoegNn5HOddl93Dji5pYcbCGlXWGbWQ9Jg4r05XlFbaTgPl+
 b4lmWbQmCLzLT9aSB1snjU2fTB1pfflmttoXRtdTLsH1PvIOkBbTlE2ER4skeIeP7mKDH2EbSQn
 nTQ+bc25yGUF6/1/Qva222MBJfsxo48cKvrRidpSwvQZBRHv0+mkidm+iZAlc8MVdc1dWQ3RYKY
 KjfA9UpA39/S7Ko6wzOPFHDKOwxSwJKEWRXZMk5KldfSSx/FaCFjuiaqfeqG8sTMCSPJcckXoqN
 EvnRRD4DEGjpkdrzlpN6FpFItod1bkjoqk2HhwwmqXnxT7MUXLM5U+HiHGnVj4wj98RhoTHFl4J
 r2pbrqTtvwurqvzSbAQ==
X-Proofpoint-GUID: sYibwnVuPCAxrggv9ND-n5u2rg557mb4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX5ym3sy7DyKZ3
 JEm9F8LlEYHahUk4pdeqxFn90q3YxQiU0o6BrPRsCut/Oo8vKTfb0l9UjBev/ZdKYIaZlamUw0Z
 Dr2RSo+LWhMZmZq7V4l7xkZi6aYT7uE=
X-Proofpoint-ORIG-GUID: sYibwnVuPCAxrggv9ND-n5u2rg557mb4
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa72ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=mx85aQPinzMc39kOTU0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On Thu, Aug 27, 2026 at 12:23=E2=80=AFAM Kevin Hilman (TI) <khilman@baylibr=
e.com> wrote:
>
> In addition to checking for CPU latency constraints when checking if
> OK to power down a domain, also check for QoS latency constraints in
> all devices of a domain and use that in determining the final latency
> constraint to use for the domain.
>
> Since cpu_system_power_down_ok() is used for system-wide suspend, the
> per-device constratints are only relevant if the LATENCY_SYS QoS flag
> is set.

cpu_system_power_down_ok() is especially used for genpd's that have
the GENPD_FLAG_CPU_DOMAIN bit set (cpuidle-psci-domain and
cpuidle-riscv-sbi).

In other words, this has no effect on other types of PM domains that
are managed by genpd. Are you planning on adding that on top or this
is sufficient for your use cases?

>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/pmdomain/governor.c | 56 +++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
> index 96737abbb496..1a85fd375db9 100644
> --- a/drivers/pmdomain/governor.c
> +++ b/drivers/pmdomain/governor.c
> @@ -13,6 +13,8 @@
>  #include <linux/cpumask.h>
>  #include <linux/ktime.h>
>
> +#include "core.h"
> +
>  static int dev_update_qos_constraint(struct device *dev, void *data)
>  {
>         s64 *constraint_ns_p =3D data;
> @@ -425,17 +427,71 @@ static bool cpu_power_down_ok(struct dev_pm_domain =
*pd)
>         return true;
>  }
>
> +/**
> + * check_device_qos_latency - Callback to check device QoS latency const=
raints
> + * @dev: Device to check
> + * @data: Pointer to s32 variable holding minimum latency found so far
> + *
> + * This callback checks if the device has a system-wide resume latency Q=
oS
> + * constraint and updates the minimum latency if this device has a stric=
ter
> + * constraint.
> + *
> + * This runs in atomic context: for a CPU domain the genpd lock is a raw
> + * spinlock and the s2idle path runs in the syscore suspend window with
> + * interrupts disabled.  The lockless dev_pm_qos_raw_*() accessors must
> + * therefore be used here; the locked dev_pm_qos_read_value() /
> + * dev_pm_qos_flags() would take dev->power.lock, which is a sleeping lo=
ck
> + * on PREEMPT_RT and must not be acquired in this context.  The values r=
ead
> + * are best-effort, which matches the sibling cpu_power_down_ok() govern=
or.

This is a bit too much in my opinion, please leave out the parts
concerning the syscore/atomic/lockless parts.

If we want that information to be described (I guess it would make
sense), I suggest we add that along with cpu_system_power_down_ok()
instead as it better belongs there.

> + *
> + * The system-wide flag is checked first so that devices that have not o=
pted
> + * in only incur a single lockless read.
> + *
> + * Returns: 0 to continue iteration.
> + */
> +static int check_device_qos_latency(struct device *dev, void *data)
> +{
> +       s32 *min_dev_latency =3D data;
> +       s32 dev_latency;
> +
> +       if (!(dev_pm_qos_raw_flags(dev) & PM_QOS_FLAG_LATENCY_SYS))
> +               return 0;
> +
> +       dev_latency =3D dev_pm_qos_raw_resume_latency(dev);
> +       if (dev_latency !=3D PM_QOS_RESUME_LATENCY_NO_CONSTRAINT) {
> +               dev_dbg(dev,
> +                       "has QoS system-wide resume latency=3D%d\n",
> +                       dev_latency);

Do we really need a dev_dbg() here? Leftover from debugging?

> +               if (dev_latency < *min_dev_latency)
> +                       *min_dev_latency =3D dev_latency;
> +       }
> +
> +       return 0;
> +}
> +
>  static bool cpu_system_power_down_ok(struct dev_pm_domain *pd)
>  {
>         s64 constraint_ns =3D cpu_wakeup_latency_qos_limit() * NSEC_PER_U=
SEC;
>         struct generic_pm_domain *genpd =3D pd_to_genpd(pd);
>         int state_idx =3D genpd->state_count - 1;
> +       s32 min_dev_latency =3D PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
> +       s64 min_dev_latency_ns =3D PM_QOS_RESUME_LATENCY_NO_CONSTRAINT_NS=
;

We don't need to assign a default value for min_dev_latency_ns.

>
>         if (!(genpd->flags & GENPD_FLAG_CPU_DOMAIN)) {
>                 genpd->state_idx =3D state_idx;
>                 return true;
>         }
>
> +       genpd_for_each_child(genpd, check_device_qos_latency,
> +                            &min_dev_latency);
> +
> +       /* If device latency < CPU wakeup latency, use it instead */
> +       if (min_dev_latency !=3D PM_QOS_RESUME_LATENCY_NO_CONSTRAINT) {
> +               min_dev_latency_ns =3D min_dev_latency * NSEC_PER_USEC;
> +               if (min_dev_latency_ns < constraint_ns)
> +                       constraint_ns =3D min_dev_latency_ns;
> +       }
> +
>         /* Find the deepest state for the latency constraint. */
>         while (state_idx >=3D 0) {
>                 s64 latency_ns =3D genpd->states[state_idx].power_off_lat=
ency_ns +
>
> --
> 2.47.3
>

Kind regards
Uffe

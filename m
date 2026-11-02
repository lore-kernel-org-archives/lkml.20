Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650757;
	b=nL0NnRA8ACaUgquf16kxwyRR04qpz+BL+cSPmW6RHbNkXPKk8qC+2+Cy1g0fv/h595ep
	 KmtMPvGXdS/qTAUCW89hr+6F+SjHeSmO+0xOFA0d9Fay5cZqEHotiyUEOkcxW30mTLE2C
	 EJuOIbkoGqFbKFU2M1DFiycdg5dYJUScNBaLbWNNsExEGZDAarBUKlgHeud42pxX0Z0wR
	 9HVvvPeKU39bA5lkw6oC44jmA/pVfEUaqIZvzaoXwzW93m0nWjCsXsxrUFxNN9d6vSNEd
	 pTFRVDuQKQpjZerKaMUZMsL8Ie0TGvGrUBT17wgJyV6FwrsEZz8BiaL4POb61AmwezQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
	b=UYLSWPxoBXtPHqZw7rt3V681BID06EWBgZpQvR6rJu5E/Do1Gku8FTYt7ibrk3djpAQ+
	 buclm+kF2Xfd6jkzTTGBoXU+vWsDJI46HO0jZ5F74F5zevExVPgeq0FvXuywhU6MeEJF1
	 fcNsD8I+pyinHW/I7hB2sm/Fero7P/uBAoOkXSZbO1caBnstQlIiqrT5W5z0OKQiBYaFS
	 k2hCQgcB7wlbuYnEDj+iTQgJFa5XdZ9Zh0B2hNRU/sFzLjKQNhVl/QQA9H2XKTuCu5N5A
	 Eo6tSTEjhvBX7fJIBiemThaHgv1LVp/qiVYvquoTTqtuFmC1tNdrQ9j6BWTD2u8klHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIZgDQzS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f/mTK2ly";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD9B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIZgDQzS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f/mTK2ly
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K60H23955604
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 20:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=; b=GIZgDQzSKfkAJV+e
	snrUcvoMsxebXxOoVuF+gD6Y6nrIopJm8HZXtfuC+HP+cn5tpURxCiutfm/2wZDs
	RZGmfivmpJrMUVUBxYzZTGBBI2hVlhJr4IsP5AfUCQLfcJyp1u35H1sfs8Zrsq0c
	uXA8wyD5v8qs1uym+HbBX98fbKucCdnLt/20df7nG+pjnlbm3auZ+rvVj2kp2XU1
	yLKK+2AIXGGuEDrEv4NFHCXmmiX0D3NIZRAX/hAuRc4/m4hSznz1XN7lekSrjBVi
	0wb/G3TbMU+1VILShrFEveCHhTQj7Cdt7oNARM+sqUWMU/mZ6zhoNzrPaBw4Q0IT
	pKVfhA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rb5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:19:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so13783423eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650755; x=1794255555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=f/mTK2ly2NxAjkZO+giRy9jYlYftkdD3vb1DJ7TSSce13dd2P3gzn4Thpjl85NY012
         TC+bDNnFY9Y4PkK/WXiuITyFIJ5QaXg8TrutvHpNMG7fRsGTKDMwtM8oEmmNLgttraBV
         jsMXKn4MmQMDheggCRYh/kJfqOxCETz+5mo7HENtOOSpc6K5WIjokbDjGctJnC9FEF9a
         /YN8OVZm8Xu9oTXBIrP/Mkokwhw9m9kXhiZg18eHtKz9FI8UgeHzCkIBSM5vVWFQtH4J
         C6GUCPSTz/01wGtGtMDtuqUrO/u9xz/xTK2KXpRVi/JiwPej7MRun/Q3qnT8FXQNSXul
         MymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650755; x=1794255555;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=yGAbtjNUThK0S5cdG86vMqjh9ktpPXATdLUcs6OYfewv//zB2axRZwRoWQmtN+iMXi
         rI2+qJMF/YO7QViTDhc5gndnGQtcIJ5ASoEmGtoZiR6kVVu8HPdxLzNzdo6qkFkDqqq0
         4MxvoBDuN6hoox9v7mShW+TrfKFRvbmW8A1rX2jLPPFLkB3n+ACmw9ThOJeYWB21b4TW
         RVtX5wEX6F4xIWVbfN5vaDIk0SGGeHJmkxNxyvgVX8O6F+YclbrP+BILc2+4I5gNLyrm
         Nf4XN0ueEdOLB57wbggBIVUPg9EpgPmNSZgu5InOjZuS/o9/xMc8+JG2RdUjcSdgWNSJ
         BXiw==
X-Forwarded-Encrypted: i=1; AKwUvBwzbVkQ4yB+LTYhb0SkMlUBJqJ0Eqoplp3qxWXSxW5ElzgLXqmfSBTLEpgIy5dVkTZQRrs8hQbwn4pc25E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE8u90iBV7VpsvlcIAqCJij5aXpD2It+1cDq6IB1PHqxt+50Uz
	+nlMNC5ZpzgBVrdKW6nIVS1n7yZeFl87o0uq4Cf9QZJ16udqO/Wa2++jrQNy39ksHAHa9t+Cdrr
	97ErgRQ7t2sLpmeD8LMxVHLfamLRgq1A53mJoSY4/GunQneBv6ErAIJKWEL7AZE4kXxs=
X-Gm-Gg: AYBFou1K9RxU4UzjO2u8MbqajFAntKJvGg6+79oK0c4opgr9BpDbUSJ7f/4PPSJ9FEf
	awdtQzo5XO3ZWR09/p9ll09qffiPuM78oETpoohmkOTnli+Lr/TllLFLefO1Ov6M+AYslXFfZaL
	LtuWLuEFNXwyH367uUkCZT/wH5Y+qAr8GUm+t0ZVuHpemF0shKdaN6xYrgED8/dApEIbQgVxEpK
	FiEsPn5BfWYceNcnoUSBt/H/OroYtBHxb5H/EfjjqkB7gPZhhzAnvvg+MwYAHOeKeTT3MR44gTS
	cPdleT3+pgcPtuP4tzj15wPk8U0g+KSrOxX3AN9psy4sCsNF7YuAVHHDv/F9z5yBbquLuDLWFw7
	o9CW0dvbjqDAAg4Q51/WHlel60i3ppi2diwJnVhDB+OL0qh1gDQSBQRhhI6usDDA4PhojcN23i9
	ufYw9pQyRURZz3bFTUtzgQzp7NIqk=
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134658c88.39.1793650755248;
        Mon, 02 Nov 2026 12:19:15 -0800 (PST)
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134615c88.39.1793650754462;
        Mon, 02 Nov 2026 12:19:14 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm35173057c88.23.2026.11.02.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:19:13 -0800 (PST)
Date: Mon, 2 Nov 2026 12:19:02 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH 08/11] soc: mediatek: dram-ecc: add the corrected
 error leaky bucket
Message-ID: <20261102121902.00004630@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-9-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-9-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX96yYXo+qKoD5
 f2dEZFaWyAn7udJ0Ny0QUaFASw29HTXwtipO1tkSbo4yy0Kcx4F5rcacUDemyc+6kDWX/VuUz5J
 MSumO0hUNQjvi4Gc6GiboATp3ChKbi8=
X-Proofpoint-ORIG-GUID: z6G5q5q9pxaei8H31cLL34hLsvDUJBzp
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae8f044 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mpaa-ttXAAAA:8 a=AaPcPOS3PQYIbfi2GmAA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: z6G5q5q9pxaei8H31cLL34hLsvDUJBzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfXxsHkkHjWo3bx
 FSxY7DIeGiGvO8VFSSF07AOpKFZ0ItEKzPe2vbZ7E4Y6IWnAGBT1+i4ajQRgXPaK7h9Rf+tbmqP
 xOZr1L5/VomHy8xqE0aCv7AoU+o5AgRFMbqZTPLeWrkEynZfJJWmDzwrqnlqb/bwuQAfNbGFVRP
 Wqbc81AT3PorgIrasQdkWe7OjCQmmmqrQlMpTY5Vi0CkZz6t6cUbE7711tjRCBWLzLTe/Qx1XDn
 7ZxpoPLL46MnG3gcz1OF9E5JY1TrlLlwJJ4W/k4GstaF6Zgd8BG1SYddtCrkB8PgeYE8YzGEwWR
 QVol0XyHvW7Y9Rg9JAWKmPdyvfChwag8aFt+ON2EKzWYKQLhZLcqx20BJBKZkRyZfiO9UvDczH0
 idxcoN238IKZkTwMp5JbFvpSoUG6zpFEUm0cDAGyJwriWaF9pe936J57duQusU0aj2i5GCFgm7P
 moitf3WzKPtnII/kYsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020080

On Mon, 2 Nov 2026 17:23:30 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
>=20
> A page with repeated corrected errors is likely to fail. Count the
> corrected errors per page in a leaky bucket and retire the page with
> memory_failure() when the count reaches a threshold. The bucket decays
> over time, and its threshold, decay interval and the number of tracked
> pages are configurable through sysfs.

Other than registering on your own record (that replicates
the standard one as far as I can tell) what does this bring you over
the stuff that edac provides already or can be done easily in
userspace? (where in my view most policy related stuff should be!)
=46rom my initial read I think this patch set needs a lot more
explanatory description and comparison with existing infrastructure.
Not to mention send it to the edac maintainers and mailing list.

Just so they are in the loop I've +cc Tony and Borislav

Jonathan

>=20
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
>  .../mediatek/dram-ecc/core/ghes_notifier.c    |   2 +
>  .../dram-ecc/core/policy/leaky_bucket.c       | 277 ++++++++++++++++++
>  .../mediatek/dram-ecc/core/policy/policy.c    |   9 +-
>  .../mediatek/dram-ecc/core/policy/policy.h    |   4 +
>  5 files changed, 292 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucke=
t.c
>=20
> diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/me=
diatek/dram-ecc/core/Makefile
> index d8d878f321d4..7c973831c9ef 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/Makefile
> +++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
> @@ -12,6 +12,7 @@ mtk_dram_ecc-y :=3D \
>  	policy/policy.o \
>  	policy/containment.o \
>  	policy/storm_protection.o \
> +	policy/leaky_bucket.o \
>  	policy/address_range.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers=
/soc/mediatek/dram-ecc/core/ghes_notifier.c
> index 633bf89e2231..a010ca652e86 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> @@ -28,6 +28,7 @@
>  #include "mtk_dram_ecc_event.h"
>  #include "ghes_notifier.h"
>  #include "counters.h"
> +#include "policy/policy.h"
>  #include "trace.h"
> =20
>  static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
> @@ -249,6 +250,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *=
nb, unsigned long severity,
>  		spin_unlock(&addr_lock);
>  		trace_mtk_dram_ecc_ce(evt.spa, evt.channel, evt.subchannel, evt.rank,
>  				      evt.bank, evt.row, evt.column);
> +		leaky_bucket_hit(evt.spa);
>  		ret =3D atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
>  						 MTK_DRAM_ECC_NOTIFY_CE, &evt);
>  		if (ret =3D=3D NOTIFY_BAD)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c b/d=
rivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> new file mode 100644
> index 000000000000..a51793d53efb
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/string.h>
> +#include <linux/hashtable.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include <linux/mm.h>
> +#include <linux/jiffies.h>
> +#include <linux/errno.h>
> +#include <linux/printk.h>
> +
> +#include "../counters.h"
> +#include "../mtk_dram_ecc.h"
> +#include "../trace.h"
> +#include "policy.h"
> +
> +/* ------------------------------------------------------------------ */
> +/* Per-page counter table                                               =
*/
> +/* ------------------------------------------------------------------ */
> +
> +struct lb_entry {
> +	struct hlist_node node;
> +	u64 pfn;
> +	u32 count;
> +};
> +
> +#define LB_HASH_BITS 8   /* 256 buckets */
> +
> +static DECLARE_HASHTABLE(lb_table, LB_HASH_BITS);
> +static DEFINE_SPINLOCK(lb_lock);
> +static unsigned int lb_tracked;  /* number of entries currently in table=
 */
> +
> +/* ------------------------------------------------------------------ */
> +/* Decay timer (delayed_work)                                           =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct delayed_work lb_decay_work;
> +
> +static void lb_decay_fn(struct work_struct *work)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +	bool reschedule =3D false;
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		if (e->count > 0)
> +			e->count--;
> +		if (e->count =3D=3D 0) {
> +			hash_del(&e->node);
> +			kfree(e);
> +			lb_tracked--;
> +		} else {
> +			reschedule =3D true;
> +		}
> +	}
> +	spin_unlock(&lb_lock);
> +
> +	if (reschedule)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* leaky_bucket_hit - called from ghes_notifier.c on every CE event    */
> +/* ------------------------------------------------------------------ */
> +
> +void leaky_bucket_hit(u64 spa)
> +{
> +	u64 pfn =3D spa >> PAGE_SHIFT;
> +	struct lb_entry *e;
> +	bool found =3D false;
> +	bool start_timer =3D false;
> +	bool retired =3D false;
> +	u32 count =3D 0;
> +	int ret;
> +
> +	spin_lock(&lb_lock);
> +
> +	hash_for_each_possible(lb_table, e, node, pfn) {
> +		if (e->pfn =3D=3D pfn) {
> +			e->count++;
> +			count =3D e->count;
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		if (lb_tracked < mtk_ecc_data.lb_max_tracked) {
> +			e =3D kzalloc_obj(*e, GFP_ATOMIC);
> +			if (e) {
> +				e->pfn   =3D pfn;
> +				e->count =3D 1;
> +				count    =3D 1;
> +				hash_add(lb_table, &e->node, pfn);
> +				lb_tracked++;
> +				/* start timer only when table was empty */
> +				if (lb_tracked =3D=3D 1)
> +					start_timer =3D true;
> +			}
> +		}
> +	}
> +
> +	spin_unlock(&lb_lock);
> +
> +	if (start_timer)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +
> +	if (count >=3D mtk_ecc_data.lb_threshold && mtk_ecc_data.lb_threshold >=
 0) {
> +		ret =3D memory_failure(pfn, 0);
> +		if (ret =3D=3D 0 || ret =3D=3D -EHWPOISON) {
> +			mtk_dram_ecc_record_retired_page(pfn,
> +							 MTK_DRAM_ECC_RETIRE_CE,
> +							 ret);
> +			retired =3D true;
> +		} else {
> +			pr_warn_ratelimited("mtk-dram-ecc: CE page isolation failed: pfn=3D0x=
%llx ret=3D%d\n",
> +					    pfn, ret);
> +		}
> +	}
> +
> +	trace_mtk_dram_ecc_page_retire(pfn, count, mtk_ecc_data.lb_threshold,
> +				       retired);
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* sysfs                                                                =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct kobject *leaky_bucket_kobj;
> +
> +#define MTK_ECC_LB_THRESHOLD_MAX		10000U
> +#define MTK_ECC_LB_DECAY_INTERVAL_MAX	86400U
> +#define MTK_ECC_LB_MAX_TRACKED_MAX	16U
> +
> +static ssize_t threshold_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_threshold);
> +}
> +
> +static ssize_t threshold_store(struct kobject *kobj, struct kobj_attribu=
te *attr,
> +			       const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_THRESHOLD_DEFAULT;
> +	else if (val > MTK_ECC_LB_THRESHOLD_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_threshold =3D val;
> +	return count;
> +}
> +
> +static ssize_t decay_interval_sec_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_decay_interval_sec);
> +}
> +
> +static ssize_t decay_interval_sec_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_DECAY_INTERVAL_DEFAULT;
> +	else if (val > MTK_ECC_LB_DECAY_INTERVAL_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_decay_interval_sec =3D val;
> +	return count;
> +}
> +
> +static ssize_t max_tracked_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_max_tracked);
> +}
> +
> +static ssize_t max_tracked_store(struct kobject *kobj,
> +				 struct kobj_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_MAX_TRACKED_DEFAULT;
> +	else if (val > MTK_ECC_LB_MAX_TRACKED_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_max_tracked =3D val;
> +	return count;
> +}
> +
> +static struct kobj_attribute threshold_attr =3D
> +	__ATTR(threshold, 0644, threshold_show, threshold_store);
> +static struct kobj_attribute decay_interval_sec_attr =3D
> +	__ATTR(decay_interval_sec, 0644, decay_interval_sec_show, decay_interva=
l_sec_store);
> +static struct kobj_attribute max_tracked_attr =3D
> +	__ATTR(max_tracked, 0644, max_tracked_show, max_tracked_store);
> +
> +static struct attribute *attrs[] =3D {
> +	&threshold_attr.attr,
> +	&decay_interval_sec_attr.attr,
> +	&max_tracked_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group group =3D {
> +	.attrs =3D attrs,
> +};
> +
> +/* ------------------------------------------------------------------ */
> +/* init / exit                                                          =
*/
> +/* ------------------------------------------------------------------ */
> +
> +int leaky_bucket_init(struct kobject *parent)
> +{
> +	int ret;
> +
> +	hash_init(lb_table);
> +	INIT_DELAYED_WORK(&lb_decay_work, lb_decay_fn);
> +
> +	leaky_bucket_kobj =3D kobject_create_and_add("leaky_bucket", parent);
> +	if (!leaky_bucket_kobj)
> +		return -ENOMEM;
> +
> +	ret =3D sysfs_create_group(leaky_bucket_kobj, &group);
> +	if (ret) {
> +		kobject_put(leaky_bucket_kobj);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +void leaky_bucket_exit(struct kobject *parent)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +
> +	cancel_delayed_work_sync(&lb_decay_work);
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		hash_del(&e->node);
> +		kfree(e);
> +	}
> +	lb_tracked =3D 0;
> +	spin_unlock(&lb_lock);
> +
> +	sysfs_remove_group(leaky_bucket_kobj, &group);
> +	kobject_put(leaky_bucket_kobj);
> +}
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.c
> index ecd0a430de6d..5a4181b8de7d 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> @@ -26,12 +26,18 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  	if (ret)
>  		goto err_containment;
> =20
> -	ret =3D address_range_init(policy_kobj);
> +	ret =3D leaky_bucket_init(policy_kobj);
>  	if (ret)
>  		goto err_storm;
> =20
> +	ret =3D address_range_init(policy_kobj);
> +	if (ret)
> +		goto err_leaky_bucket;
> +
>  	return 0;
> =20
> +err_leaky_bucket:
> +	leaky_bucket_exit(policy_kobj);
>  err_storm:
>  	storm_protection_exit(policy_kobj);
>  err_containment:
> @@ -44,6 +50,7 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  void mtk_dram_ecc_policy_exit(struct device *dev)
>  {
>  	address_range_exit(policy_kobj);
> +	leaky_bucket_exit(policy_kobj);
>  	storm_protection_exit(policy_kobj);
>  	containment_exit(policy_kobj);
>  	kobject_put(policy_kobj);
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.h
> index a535e2ce0e6d..c9926cbc11be 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> @@ -13,6 +13,10 @@ void containment_exit(struct kobject *parent);
>  int storm_protection_init(struct kobject *parent);
>  void storm_protection_exit(struct kobject *parent);
> =20
> +int leaky_bucket_init(struct kobject *parent);
> +void leaky_bucket_exit(struct kobject *parent);
> +void leaky_bucket_hit(u64 spa);
> +
>  int address_range_init(struct kobject *parent);
>  void address_range_exit(struct kobject *parent);
> =20


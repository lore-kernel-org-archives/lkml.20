Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0D37F72D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024671; cv=pass; b=PBUw8ppqc28n9T2JyrkpfdE8x/kXD9C6jYJFSB7ZpRNdCvzX0T6M7MIyPaq0JvtC2WZVD1j0PlQkbshIa7gX8Ac2qRNn5IIzeA3RbETTyQFJePVx7JNPrd6d7FjuKMWrD+BP2YD1aTG4GifmD4ZZsrqYRd+9u+ArJEkcOO+TzPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024671; c=relaxed/simple;
	bh=J+5HmMWHTPUIIDyo1zzgj5/rZka/qV/yDfHnmjzm6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDsTaw4aHZUF4FG4QJoXtJ4uU86r9p1NadllQnTC2+nkckeY3njeHdTx1CILffAasamH8oiQsf0WhI8EYMojnFczcV463mtuAQe93f4jTYsHLvjpS/BsCH07PkXZG3cj3nYqq7gj9ii4+v9xFVoQLMTjfULcEsgGU3lAVRDsmuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SujvsQho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkewM1bd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SujvsQho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkewM1bd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GjBM4058713
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=; b=SujvsQhoH0Hx1HQ1
	JGjgZWhOEekSKYJh6bBdeuvGY/YibZ+AtMyQLvzAZcVaJuyMNrzBYbQ1OBvN9RrB
	3FOaKPkwvPAPwwOBKi6k9p+xUCGhskdP3Is4bFeEzngD/BN6DxReHoKWoKDO6pxW
	3A+lMRd9XkY2iy1UsgW0XBQ0q9DHlSK5SADR2PT+V8ovscv2M4Q3rTBO4fHQWarF
	9Pa9oIp4VkHul3nJRxM7yqlQLC5vgLkODPrPcthS0POGjzLwxyKkOstYfsj8Q7UG
	re4HQ1ISJ46r4J+3+JfZ4wbpPD4FfVn2DQjdJRwleWweY2p7B0TIe8wu00OtiMDL
	rUkwOw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyftmt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:17:48 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66fda3f6e71so6894787d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024668; cv=none;
        d=google.com; s=arc-20260327;
        b=OP1oqGct77b0ZClgoj7D1ufi83Fwrw0cw1xm2IZt97IbquaFUNWXFesaetEO4kbZCb
         CJIBdk8rdCxjufaZUE5PxxDQ51Ki/iY2mJktTlr1f0wresA7uRv+8XqIyZQZ9IcwHYOD
         xpLt17cn20O5c7K0YTC6WEougPHZHSc/S/NcrDs+0HO07VfJsz/J4SbmSsPaUYgs0LU+
         jxO6ihWzTws9qKOV8WCCmVKNP2vZSdyXQlInp7Mn26R/wnbolPejt9jq+1aQ+vdYRIDI
         XKVWeZ4hQAn7kxyrIRU0VWiMA0Dsatlqm2pHhNHj8Yjq/F93/DIK5MguzgcSFHGArlnn
         +6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        fh=nxXpCr+ow3LIHkLVYjKTAg1YNaS3gSBaQ/PrWViXtGM=;
        b=XD4aiRMrA3jCtvqNwkz+lhhmPifktwFB1RDFUcAFrTOTeVOKVWgEkC+f0dhFSh4tWJ
         R6rYkbiHw6Jl++7pnK0nX6mfU+CwHCuj2beuCUB9JPlCO9tG7J6TKqT9Nekp1oTAKZ+V
         HY1LIO9hh6GtXjBOxHDNQsv2WyL5D8Kc82jg6wCBEtePoaU+AkEwYhYH6y33fwoGDCXZ
         SM127ALHa/01/OQuiedC75IwF9BjQfgez0rZ+kVXBeBykGHNmQK5P8/2DOhe4ha1/ajI
         8jkNQ6m0s8VE2ZIpZQNT1WKEZn5QHeo/bXfFpE4uix15ueLETj2OFeHG+teE9QKDTzwS
         wdbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789024668; x=1789629468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        b=TkewM1bdo9yWkOaThexadDnmxR8/bqGShflirq68+54rmCwZG4Q7xWIGwtBKKlDlJC
         lDxxPNGkGfWE4Gy5mWmFvt5NfSrn38I4zk2CG1za/w/KqXhYk5ytGtVbJun/DXTUr11Y
         V9rDnxCIVnRoD1WMZTsQDUu7PO4U0I1Xy//NhO67DF4KiphmIkyTm+MKIfLYJVrBBAg+
         duwA+Vn94JbiMfu05LjZ7PZp1qWopwg9FQsH1AHqDmNsfXRt5butG7EC96JyreBLw8A0
         f8TurS3b8J2peidL1a/Lr8dGp/xovWdffftN2ptYOwfzBkwXkHfx7E3Zd0i8kLFTnpoh
         H9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024668; x=1789629468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        b=rG2WRC4Y6ExmlplrSbjFNfKVrwzan5B5XyXcLUUuLjf2qRUr/oqYYGoQ6Wc1dlXrJR
         QA21miEssIUYnMinyRM6Aqg6NopYo3fbmL8Z3vB9AwPyf6aJ/YgWStE+iPACwVDrxLCU
         dTzUiAr/xmUWnxj3XJ77AIiikOTFWER0HsAHrfKNbPmsyLESl9y4JDJg3BfeOEmLQdSU
         0Kw/dbJGu4vSf4oL7yiEwgIbSe3fB6wX0Ym156qfgo2HjR0NqhoPkJq29cLKwaMFl6Pz
         2rSRa/rUYhP1AXQnCZY4nAIelKfIy/Brt4f1uMOZ2apfBlxs836zt/fAMEuLgwhEnNjx
         OOZg==
X-Forwarded-Encrypted: i=1; AKwUvBy1e8FV9qEIXMVjdENIyajcEjPt8rkswTZy+feQoyAQnSddljt/LlaGDNLfxkRhV88OZrZcaHF0UjJHAeU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUBywR4/a1clYiy3RTc8sg5ZYmX82a6/VjB2YQLNtsFS0N/N1u
	MEGhFMtq2GurGRJATVLPFRxghEDHe13MIRGxYExra8nQ4Jl/h27USZ60Firpns3bkV5yPEi+noz
	sShZ7qsK7mXOFC9SWFcTuz5N1vMEx2vOUb0/5MlYMYNWoiVpsBEMiXIPJT1OUSDqtR0qXX3Jrws
	4tpqfap+G5eF609fJJR/vc0i8ArxpSYLCQHILesz2iXA==
X-Gm-Gg: AYBFou2ZYWx4tiguzqyNEHUYK8bZzCZHlV8eTxuch91xl74m9tvg1LQljRQR/+uT4DI
	xv8ld0m549MXeqBvIEUroFLVkVno0eMXuefJYdV/85BvNciugc5ECMdBWCr2RWTlcXSoqz30NIa
	fB9kWsbh0PhQoY8Y+mTT7uh5fHhJx2TyX3a48vuKFvxCCK/vfXJOylrqnryA==
X-Received: by 2002:a05:690e:b44:b0:66f:c1be:3172 with SMTP id 956f58d0204a3-66fc1be3a2emr11690745d50.73.1789024668500;
        Thu, 10 Sep 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a05:690e:b44:b0:66f:c1be:3172 with SMTP id
 956f58d0204a3-66fc1be3a2emr11690739d50.73.1789024668129; Thu, 10 Sep 2026
 00:17:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713045811.484554-1-sumit.garg@kernel.org>
In-Reply-To: <20260713045811.484554-1-sumit.garg@kernel.org>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:47:37 +0530
X-Gm-Features: AcwNN1WV5q95G7XrffbfBRtWEmjy3wrQFQOMsjw4phzZGEtXCQsm9wXfsECAnVg
Message-ID: <CAGptzHOofU-V+R+8MQyegvkYzGBNuPT62Lnfs2JUEPMwPCA7kw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, harshal.dev@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BEfaaGm8NBfgkoudx6dlBVGCzrmLNbzZ
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa2599c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=zymMkr7Cd1_EJWXWWGMA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: BEfaaGm8NBfgkoudx6dlBVGCzrmLNbzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3OCBTYWx0ZWRfX5dy5Ov+Wv2Fj
 phADjXiDVWMBReNaX17JHIq5yqW6gnu89MyAFpZIYHsKlqpVjAjSjJm3khIZRG/CiTxQP6awZRX
 U6Z3YbvHoX9I9dpEkt1ofcQ/y7bnEsD93iMn7jJTMUGjIK7uQ5j1E9cT/8QMDPBQ1movkWr8MCG
 UiQgRx3oqmeEuP8UGfxs016DRSrzwrwQBbPid950A5XRMzSAFJJNbw1YnPaAz1ccHYg6GQQMasw
 HwRfF0Wl/FMRAqoYnDos/lq0PWtSLoBOIam+MztWF2hxb8ZcGRqciyZY3dBcdfKyr17tg1DGUwB
 EW3jWq8hyiy6DXUELgVGCoqDvAJf4H9vBDU6vHWRy+eTX0Nq0+HjreSWMIlRJqMtAxc5bmdbG79
 I0DN/rBFYMw6WJxTCnLGNO0oAzZgRo4vYcLPsRlP4pnCGTxx8+1xS8q5915tJVt1m3nRZ9UO/tH
 GAU9iaROejwkrtwZdLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3OCBTYWx0ZWRfX7K7Ff8bgDOZ+
 oTYjbL8dy0c+vhcyl8U70rkL76ZJCyysu3W+A/C4xADgpDOr2bCwbpN4C9042ExtAyo/mkgv4vD
 1zG7DsLeX3GusS15lEmj02aijaARoaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100078

Hey Bjorn,

On Mon, Jul 13, 2026 at 10:28=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
> calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
> calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
> When both are built as modules this results in a circular module
> dependency and depmod fails:
>
>   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
>
> QCOM_TZMEM is an invisible tristate that is only ever selected by
> QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
> as part of the qcom-scm composite module instead of as a separate
> module. This breaks the cycle since the mutual symbol references
> become intra-module.
>
> With tzmem now internal to qcom-scm, the shm_bridge helpers are no
> longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
> move the declarations from the public header to the private one,
> alongside qcom_scm_shm_bridge_enable().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@i=
ntel.com/
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Makefile         | 2 +-
>  drivers/firmware/qcom/qcom_scm.c       | 3 ---
>  drivers/firmware/qcom/qcom_scm.h       | 4 ++++
>  include/linux/firmware/qcom/qcom_scm.h | 5 -----
>  4 files changed, 5 insertions(+), 9 deletions(-)

Can you pick this fix for v7.3?

-Sumit

>
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makef=
ile
> index 48801d18f37b..55751d282689 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -5,7 +5,7 @@
>
>  obj-$(CONFIG_QCOM_SCM)         +=3D qcom-scm.o
>  qcom-scm-objs +=3D qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> -obj-$(CONFIG_QCOM_TZMEM)       +=3D qcom_tzmem.o
> +qcom-scm-$(CONFIG_QCOM_TZMEM)  +=3D qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)     +=3D qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) +=3D qcom_qseecom_uefisecapp.o
>  obj-$(CONFIG_QCOM_PAS)         +=3D qcom_pas.o
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 1deee6aea387..3495cd8af715 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1813,7 +1813,6 @@ int qcom_scm_shm_bridge_enable(struct device *scm_d=
ev)
>
>         return res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>
>  int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
>                                u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> @@ -1841,7 +1840,6 @@ int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_=
flags,
>
>         return ret ?: res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
>
>  int qcom_scm_shm_bridge_delete(u64 handle)
>  {
> @@ -1855,7 +1853,6 @@ int qcom_scm_shm_bridge_delete(u64 handle)
>
>         return qcom_scm_call(__scm->dev, &desc, NULL);
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
>
>  int qcom_scm_lmh_profile_change(u32 profile_id)
>  {
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index caab80a73e17..0e7cd1e31d6f 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -84,6 +84,10 @@ int scm_legacy_call(struct device *dev, const struct q=
com_scm_desc *desc,
>
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>  int qcom_scm_shm_bridge_enable(struct device *scm_dev);
> +int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> +                              u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> +                              u64 ns_vmids, u64 *handle);
> +int qcom_scm_shm_bridge_delete(u64 handle);
>
>  #define QCOM_SCM_SVC_BOOT              0x01
>  #define QCOM_SCM_BOOT_SET_ADDR         0x01
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmw=
are/qcom/qcom_scm.h
> index a0a6bc0229c4..b7d5f30876e1 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -133,11 +133,6 @@ bool qcom_scm_lmh_dcvsh_available(void);
>
>  int qcom_scm_gpu_init_regs(u32 gpu_req);
>
> -int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> -                              u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> -                              u64 ns_vmids, u64 *handle);
> -int qcom_scm_shm_bridge_delete(u64 handle);
> -
>  #ifdef CONFIG_QCOM_QSEECOM
>
>  int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
> --
> 2.53.0
>

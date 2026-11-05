Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865947;
	b=U0Wkl78+jJDCpaoJ+3Lim92gavuPj8IzcvjZGzL5Vy7e/RALgaSO8/bjeue8fkTD356u
	 otiJ0if7NmNwSLc/8WYM83uNlEpb4umCIzjX+oQbalhgBVeW8BC72RCVGpOpdZTuFsK3a
	 RoyJfE4z6V2qZjouUuSisRvN6gni2Fu2nLnFOoHL9M7xzragrxUIu2EwB+UGusixQto+Y
	 1I5JHDdgZcg3RDZC2OjrG31SZCrnty+Ce29JDTl3W9vxs2zYy0eET1LcIkpp4dwPhouz6
	 sTijpoVXwR4bPYWvuU5Xm6OwXifENLmCywGqf46R3LixwUEqaUhffqB/Y0bVFOAZ1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865947;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Content-Type:To:Subject:
	 Content-Transfer-Encoding:References:Received:From:Date:Message-Id:
	 User-Agent:X-Lms-Return-Path:Cc:Mime-Version:In-Reply-To;
	bh=TMVq1BdX8FUxH8J6/ZdpU/bSTGJU2bUVnTOmNO2snXM=;
	b=K4nU1J7Dcu2a4xRBPdOVzagdndGQSU9MnZt0tbGIBgHe7fkDJObCT9elgohjEqudyxxe
	 wMCBWKlOndkixmnnGdd9JWOVbr0a8io5ORE208lSW9bGPCvH9SOLHWDdrksv9/36G/l6z
	 zYdhncZFivH5uOe4HxK0oX2fAUo9fffmeLiuPaiQM0AbuNIsEynf+O0342jCeSd/ojyzL
	 3ZjPGmdHxGH1razptaTcOxsaQkz8m6leQRWzY4otYUMFjhVDfnnJ0aVw3qLmKDrfGbVLt
	 h3MmBEqOa0LYv4gjUZxH8YOdo9id6/yGs7IC4QqqUzARgM/K2sAjOxMcobjL6oLGxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=RDjGvLhX;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC567606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC567606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=RDjGvLhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793865937; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=TMVq1BdX8FUxH8J6/ZdpU/bSTGJU2bUVnTOmNO2snXM=;
 b=RDjGvLhXr5096VcIf1dKI76qOLL81RWglBqUx7Fc2txhOaQD4D44dUc9V9h03Y3JHY0AB/
 rdjcw8KYRTvj4gtmD7E8WV6eDIry4O3GS3e6iJo8FLCVAeeyp4MW0K6KkZbxjf1GxnR/kr
 z6pv55HEOKchqtWEVfQ/63RWzdtpIDjJST9GnZGr5yxP1XYgfQFXvxS24/oDmeFSIdzSb5
 e/0+WbqpLuvqxoabzdO77VX6iDp5TNb1+ELO9nKm/j3TA9Lft+F3JsP+qkVpo92Zgjb2sx
 txXiZOMx+OA1bo+mdjM+qHoV8ksUWpzpS1pXPHjVNFp9Ey8pCKFwLxvC2JJWIw==
X-Original-From: Zeng Heng <zengheng@picoheart.com>
Content-Type: text/plain; charset=UTF-8
To: "Drew Fustini" <fustini@kernel.org>, 
	"Adrien Ricciardi" <aricciardi@baylibre.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Atish Patra" <atish.patra@linux.dev>, "Babu Moger" <babu.moger@amd.com>, 
	"Ben Horgan" <ben.horgan@arm.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Chen Pei" <cp0613@linux.alibaba.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"Dave Martin" <Dave.Martin@arm.com>, "Fenghua Yu" <fenghuay@nvidia.com>, 
	"Gong Shuai" <gong.shuai@sanechips.com.cn>, 
	"Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, 
	"James Morse" <james.morse@arm.com>, 
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, 
	"Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Peter Newman" <peternewman@google.com>, 
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
	"Reinette Chatre" <reinette.chatre@intel.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Weiwei Li" <liwei1518@gmail.com>, 
	"yunhui cui" <cuiyunhui@bytedance.com>, 
	"Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Content-Transfer-Encoding: quoted-printable
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org> <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Thu, 05 Nov 2026 16:05:34 +0800
From: "Zeng Heng" <zengheng@picoheart.com>
Date: Thu, 5 Nov 2026 16:05:29 +0800
Message-Id: <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26aec38cf+8555d4+vger.kernel.org+zengheng@picoheart.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<x86@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>, <yang.yicong@picoheart.com>, 
	<geshijian@picoheart.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>

Hi Drew,


=E5=9C=A8 11/5/26 =E4=B8=8A=E5=8D=8812:35, Drew Fustini =E5=86=99=E9=81=93:

...

> +/*
> + * Fill the rdt_resource fields for one picked rid. An rid with no picke=
d
> + * controller is left untouched so it stays out of resctrl_arch_get_reso=
urce().
> + */
> +static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_r=
es)
> +{
> +	struct rdt_resource *res =3D &cbqri_res->resctrl_res;
> +	struct cbqri_controller *ctrl;
> +
> +	if (!cbqri_res->nr_ctrls)
> +		return;
> +	ctrl =3D cbqri_res->ctrls[0];
> +
> +	switch (res->rid) {
> +	case RDT_RESOURCE_L2:
> +	case RDT_RESOURCE_L3:
> +		res->name =3D (res->rid =3D=3D RDT_RESOURCE_L2) ? "L2" : "L3";
> +		res->schema_fmt =3D RESCTRL_SCHEMA_BITMAP;
> +		res->ctrl_scope =3D (res->rid =3D=3D RDT_RESOURCE_L2) ?
> +				    RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
> +		res->cache.cbm_len =3D ctrl->cc.ncblks;
> +		res->cache.shareable_bits =3D 0;
> +		res->cache.min_cbm_bits =3D 1;
> +		res->cache.arch_has_sparse_bitmasks =3D false;

Currently, the driver sets arch_has_sparse_bitmasks to false, causing
resctrl to require a contiguous bits in cache allocation masks. For
example, L3:0=3D3 is accepted, whereas L3:0=3D11 is rejected because its
set bits are non-contiguous.

The default should allow both contiguous and non-contiguous masks,
provided they satisfy the other mask validity checks. A contiguity
restriction should only be imposed when a specific hardware
implementation can't support sparse masks explicitly.

So I propose enabling sparse cache allocation bitmasks by default.
Thanks.

> +		res->cdp_capable =3D ctrl->cc.supports_alloc_at_code;
> +		res->alloc_capable =3D ctrl->alloc_capable;
> +		INIT_LIST_HEAD(&res->ctrl_domains);
> +		INIT_LIST_HEAD(&res->mon_domains);
> +		break;
> +	default:
> +		break;
> +	}
> +}

Apart from this,

Reviewed-by: Zeng Heng <zengheng@picoheart.com>


Best regards,
Zeng Heng

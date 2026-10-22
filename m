Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675234;
	b=2H8uhnL68yGn0VdYw6t0Ik3STL0RpdIibXvXpkNnV1Jx3f/Y1uvd0pSWpB1EmIrwHG2s
	 BU1fU5MNKbLMTOTf2PalKRmjnprN4Qazzdn02HDE50N4Qn+C8p4VcAWNWYx5414SsrRML
	 JUNrrmszirnhZ3XVStTZ1oHj1JSswNTTamWg8O8nG9pxB4DpEhzKa2Z/MSIB8FSouKLzg
	 7nqMStRzY4a+cNuY1TbJt8E2L9qwDgYN22c4FqyiGONK5ZY9/zxbVeU/b37HzZ65YXFOb
	 szdKCEJVw5X/ncUfjacuzm/CDjJAfCy2+cTY+OTFTSNsdcUzbpNLYSrZJ/vgO35rJig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675234;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:
	 X-Original-From:In-Reply-To:X-Lms-Return-Path:To:Subject:Content-Type:
	 Message-Id:Mime-Version:User-Agent:Received:References:From:Date;
	bh=kdaGgrhHx0k9waLxvPwcSVnOkaKD0rW6JKYSdyvHaOc=;
	b=r1M9SNm1/YYAzpPe9arboDTPJlxsLeM5BkxQ0zPguvNQfdqlnRIlc9gzJuc2v+iWpEw+
	 UHXxIY2GjxGjlSskFv+uXu5KihQMulA++VPf+munsik625hKXKymN41XW8LJn4fLo3XCH
	 89gNSCtxgyBU3G5+lgzT+0YMRtjr9XbSSZGavmnaR91xPviRT8j14oJzALJJ3yRE8Cnwo
	 M2eT65Y7ohUETU6RnsXpu+3wSaGYgDGbsvAuCyxhqa1fBIq/vLGH1BEuCiCD6jh1jJdPr
	 HbeXPr83ZlRD2lxZJB6HG2gi8BWxtfVqzpcCgHHaeX00A2eRi/Mx/HutWetwqrKNjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=WaaqVC3s;
	arc=none smtp.remote-ip=209.127.231.18
Received: from va-2-18.ptr.blmpb.com (va-2-18.ptr.blmpb.com [209.127.231.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A705606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A705606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=WaaqVC3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792675226; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=kdaGgrhHx0k9waLxvPwcSVnOkaKD0rW6JKYSdyvHaOc=;
 b=WaaqVC3soNLfoRewkridkYAFCMOMWWIXH4W9IoaKQ+I+G7xRWs880pfgVTAnNCNYA1XJxg
 1ZU6pNcy7yCXsOVNeTmWHyY2aqrsV4VwvL45GSwXCd47/Ft7xx191XBReD7Qn17CxnybnA
 78zOW4DtMN69UTQkdz674Dy5tv18cdC4g75/S+LEk0lIKbCK5zsT1AHaa+OMHrP4430JHb
 vAz5lT65esRcUlPd7diDEEMJ3gqXZBmu/wWnmSE4mz/2uXqQ2obGpo3DVyQEgOgnbaal53
 aaL6547xGLit4+4DZmauEi1dgg2RKdrbbjNJPJDXh2+xMCini8dr14Du/cvcQw==
Content-Transfer-Encoding: quoted-printable
X-Original-From: Zeng Heng <zengheng@picoheart.com>
In-Reply-To: <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
X-Lms-Return-Path: <lba+26ada0d98+c6d96b+vger.kernel.org+zengheng@picoheart.com>
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, 
	"Jinjie Ruan <ruanjinjie@huawei.com>" <ruanjinjie@huawei.com>, 
	"tony.luck@intel.com" <tony.luck@intel.com>, 
	"reinette.chatre@intel.com" <reinette.chatre@intel.com>, 
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, 
	"james.morse@arm.com" <james.morse@arm.com>, 
	"babu.moger@amd.com" <babu.moger@amd.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, 
	"ben.horgan@arm.com" <ben.horgan@arm.com>, 
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Content-Type: text/plain; charset=UTF-8
Message-Id: <88c6c8cd-5da7-4c28-8d5c-7d6489e5913f@picoheart.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Thu, 22 Oct 2026 21:20:23 +0800
References: <20261012082337.822258-1-ruanjinjie@huawei.com> <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
From: "Zeng Heng" <zengheng@picoheart.com>
Date: Thu, 22 Oct 2026 21:20:21 +0800

Hi Jinjie, Shaopeng,

   Thanks for continuing the series.

=E5=9C=A8 10/22/26 =E4=B8=8A=E5=8D=888:02, Shaopeng Tan (Fujitsu) =E5=86=99=
=E9=81=93:
> Hello Jinjie,
>=20
> I would like to confirm the following points.
>=20
>   - Is the number of reqPARTIDs per intPARTID dependent on the total numb=
er of intPARTIDs and reqPARTIDs?
>   - Given that requirements for the number of control and monitoring grou=
ps vary by user,
>     would dynamic configuration of the mapping ratio between intPARTID an=
d reqPARTID be a more suitable approach?
>   - Regarding the mapping logic, some reqPARTIDs may remain unused. Is th=
is the expected behavior?

Support the static-first scope of v9, consistent with James's
feedback on v8. Separating the driver-side grouping from the resctrl
translation, avoiding a new configuration ABI.

Dynamic allocation could improve utilisation when monitoring demand is
uneven across control groups, but can be addressed separately.

>   - Considering that Arm has previously implemented this,
>     are there any gaps between their implementation and Huawei=E2=80=99s =
requirements?
>     https://lore.kernel.org/linux-arm-kernel/20241212154000.330467-1-Dave=
.Martin@arm.com/
>=20

Dave's RFC explicitly describes itself as preparatory work,
rather than a complete narrowing implementation. In particular, it does
not program the request-to-internal PARTID mappings, retains the
internal PARTID limit, and documents unresolved control semantics when a
CLOSID spans multiple PARTIDs.

I would also like to thank Dave Martin for reviewing the earlier
revisions of the series and providing so much constructive feedback.


Best regards,
Zeng Heng

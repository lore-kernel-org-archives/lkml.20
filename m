Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582774B049F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824243; cv=pass; b=NMqix0NuusOreVmuiuSxyUolnqD2chG3h6AgJ15At42tPhGPx9fYCJEuZI3adrpP8TS13WG6DkVy8Uy0skxxSNsZBtbXgstOnz+FyMuyuQpXG94uKnAq6Gre8R/NnKcueQUtj19T/Xd8c2Efxo+KL2hkbJI0INNicmBVhbXAqwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824243; c=relaxed/simple;
	bh=1ZwHYEL9zk034YEl/vwY1GKXAdewDQli4AdtYssr/d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9LQDlOTS5kPEvLZ9wXBGu++LeMCi0F2hudB0nR7YHh0Q52RxswIPu6q6FrQJY6emyl+8KbYri0Yv88QK8UhW6Z8QnMXB7NPTgWR80Tq+3uo9wrq0shztIaH3xiMfSmSvECf0W2S0Fe+oPa+0NE4jE7QgLWpS0WILodJhjxSDas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMDcUL45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi2BUywT; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMDcUL45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi2BUywT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf00H1290983
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=; b=cM
	DcUL45gRuVzE+jNsv8a6qBEwW0YUaXRh4vF8WElxOOIgmMZzaRhY7ruPaoFvy6Lj
	qDSvQ0X0lFxTBwq6zbVb2UUqBCDF+64fcrSBck2BgsxfSY0aPjBI59yBV9SemnuF
	jg4xUoWeLZnUS8rUWRyWRBQFNxDXxI+uZPwLVKKE6Kt+ibWKP7ABv1Vqabb8hEvt
	LktCsN/FQJeSEwTezqgfkoea1A8vPmr2HuWNFVu5BbJA0I7kjDSw9H39g0Z1+HjA
	trgQ6uybg3jafppp73YBth9ts2UVWUjjpterLmYN7VhiHYf/TQTofM+iER1ldPCv
	VDxuL8ErBKA16yDFyp5w==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcstaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:57:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-675d5613a31so2428683d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824237; cv=none;
        d=google.com; s=arc-20260327;
        b=bQ4HhsEa4L5rlwSqEbYnY+uc4saTPhMS1+UVvs7onRxb8VMhld43vGUsVoX8uvyvhk
         0umYrlIIgPFiPaNbqasVpzF1oBHIYwSUFC6stWuTLGv8+Bz/kgT/fxiR/7Pgcng9KAnS
         eD2ci6Xew5y2dJ++WSnILcp6jb1XVvQxh2UlubSvAuHa3qh7v9LXkY2NBtm+t5kMI6Zj
         CWjuB/vOS9c9jQt1AFOgCp1nKpJuilelPEdU92huYn/hWQ1VXnoRRCib38AFGtKf47tR
         D9VwSRmNIYdPbcUvIX+fCnn/1c3gktECxXDZX5vSG3TEQW866dHYaPOIw/DK0+4X3Xqn
         ukLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        fh=LlbhJAbOe2/gDHlJrGiLqjSXWhCDwgLbgak8xTyXlfI=;
        b=ZOPMtpoYvWdjndeLaJ3C5fDNd8kV1Uyg4ddxxlPFPR2sHRvBMMLNqzFMldLNfSEZ+S
         tYjDDXD1IqhKRlhS8k/6jySYFnTdgwCCzUs5KukY/zVs0V5wH0G9SZ7eSsq9Gyzt8Szb
         6zIEVnbY0Zds58Wt94I8sSgR2wkkbS+Z30urxha8Ps2FMXy5LOPWhIRfS8Ud/r+ruJwj
         k70aH0qMEYgwZA69CXr2ILqb1A5wyMjCweG7B7zen6lZNUd5sX0crdTc/G2FI6znt8Qw
         cf9iCHvBDGBHq7pKOdsNM+yHMb01ThA3AvCnkZNCWbU87L4LhgTNZsGHBNcYGSjFbHOR
         uIiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824237; x=1792429037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=Hi2BUywTlgZ9RjmglkU5RSF5lR/SAFi6fcOYfDoRjZkcWAI+CA/2lfx0b8ARCeYNqa
         j75pxYeNTYyOrRxiEJqX74Zzn1ZfeH9w1GpMwTSJhzeRs45I2P68E5oiYuO7t5PtQvGt
         I535u7NW0l+ah4Se6beTHEje5DVcGQuA0gFR4eVvmUAh0lV+kSMRiTy4KVeV6nRyd+s4
         ucI5ieBSIUV53DiPQJhDm3o5NYIVBqUfyjlMYrNdc/rQ/bVRuvNpwSWvGSSIRjacDYXC
         UKKUWbRIpnur+jXRakRQz4KPgWReVNhmOfrXgfSLhBWafOyclc6a8SRGQfNDaH57wRlD
         2INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824237; x=1792429037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=ErLY+AZyLTSfaBs55raDrD7FVlgFvpXQIpvn+KhZau9EpE0OP2OclawXOkyYQmne5w
         9d9vBwhzntT501NOWcG1IDtPfBw23XtzFZrsGF6vGOoSktW+XCQnqzvjVGBCTf5w57Kp
         Vse0dU/eRnVy3eMyp4cNfUL48YVbLX878ZRQ5ziU2WJcjRFyOHhlBIKVkrYlwCU2ICID
         3u1PNo0XxJpoFISGLnCijCdCO06M9+uQxKwNRGzN4d1KYlH4RwTQR2jm285oqAZIqUf9
         lPYiXTFJjYNgKugYYnU+c/VuGcCIbS7LZ/TViiW3qWDN5V1L/1UM2ILIN3/MPIwXc3tv
         21ew==
X-Forwarded-Encrypted: i=1; AKwUvBzRYZVWN91pyrclW6/mosIo738sbwN5ybxQFYaNCeL/K7VIyU04oRniCRItI8kleSUHnKcUbnzG3WjpUjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhF//DpoT0T6hU3YcZ5wIoobFj8KjwDdZ3SnZOL46zlahw4i5L
	PdzcMueYzloIv6te75uyaCWn7W/FhKSgpQgiN8FqeB1D2tObglIP34canZDsbndWyMLmOpGjQY4
	fscr/Wx56FwORrJargA7x65TqI9ttqDT9tHmQJ0wrsSQRNDBKAOOQmkGZbxm81G2T8nSkyrxlo+
	Noven4Dq0XwKPHWjKmcsY0SjQpFR7wjpQurW6Gs+t2jg==
X-Gm-Gg: AYBFou1/+ZEEVkJkm92mQdSN8bQdMtjaWF7rWAC2LeM3VjjVuticoFP0EpK8sZPHHqA
	Y6yN7CMzcBvfrLh5+fmcStMhCHG2EjhQHBapg27e72r6tbGELXIgCQ2L0TRpsG4/DPNIN0nh515
	nC+jlIuLek0p0QHhrzy2RJENBUfegX1kUx+NH1ADM6jCzjI8Sz9gI2RmzCZjk=
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id 956f58d0204a3-679360586ebmr2314601d50.64.1791824237302;
        Mon, 12 Oct 2026 09:57:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id
 956f58d0204a3-679360586ebmr2314577d50.64.1791824236864; Mon, 12 Oct 2026
 09:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org> <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:27:04 +0530
X-Gm-Features: AclHuK96lmXU1FySMYulXru_-us2zCYXg_c0cpE2EJ1bHEgD2VYJgCcz2mj0Iv8
Message-ID: <CAB19ukFNjO-J7YaLh3_1dAziMtELkvu6mmVbcES=WFWYQxgnSQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Uda2_73BqE-Lx6z4xGYusd4INEOwt4rb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX08Sz+SfHIKqz
 JTn9m719ilzwCbkseYbmwM/xgP0zNSce0vuKuImAl8e6g5tkWEY5V1N0IJnDXKpQ1L36iLcb0MS
 MvWb+lewqPcrdJ11HvePqvloik/g0wU=
X-Proofpoint-ORIG-GUID: Uda2_73BqE-Lx6z4xGYusd4INEOwt4rb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX0BCDWziskh1b
 Bn8OnAQJNY/npMqx3b902oAzWlkKg9QqR1+TM2isvaIlSGFWRp12503nzAJZJHZocGWTEZIbG9E
 lUBJzX48YlFMMqjLjolx74HHEPBFhNvN9QKsvpFhvbAkit0On7h7wIVtjf5+NwIDg006JWxCUrk
 gRYCyl1zYZ3RzuEtEcXB12MBwfbugLsVfDaL3kMQ6/actlMsrr5wMF4N4w1+noQbKyMJFxo0oGl
 9zo2f1wYDvkHoRY5s9r7e08voolfbHY/AYzHBoON+xsbh8jme6fDsYEMgD4+QcAw89t68m+QOjK
 Icvo430XFNVTnehJAS6Wl/9PRRzvpbEqENP2cbOvJl/BxqQrvQThONXAmvSnYU8KNYc3UaJlq3L
 xdJtqt8QdvH+551M9YTLKWlIJxoNUR51gLy7ggYHtJO1urtFKbsYpi37m1PhkWVwWQa5ZvAUEw9
 fCvECJp4BxJbWK8rydg==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd116e cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=WVtwwdpmd8cHSuz7VWcA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067

On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Enough CBQRI support is now present to enable ARCH_HAS_CPU_RESCTRL.
> Have RISCV_CBQRI select it so that RESCTRL_FS can be enabled on
> RISC-V, and default RISCV_CBQRI to y. RISCV_ISA_SSQOSID is default n,
> so this only affects kernels where the user has already opted into
> Ssqosid, and on those the CBQRI support is what makes the extension
> useful.
>
> This is a separate patch so that no commit makes RESCTRL_FS selectable
> before the resctrl glue it depends on exists. Enabling the resctrl
> filesystem itself stays a user choice under MISC_FILESYSTEMS.
>
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/resctrl/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index cac23d20124b..617b813b9808 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -33,6 +33,8 @@ config ARM64_MPAM_RESCTRL_FS
>  menuconfig RISCV_CBQRI
>         bool "RISC-V CBQRI support"
>         depends on RISCV && RISCV_ISA_SSQOSID
> +       select ARCH_HAS_CPU_RESCTRL
> +       default y
>         help
>           Capacity and Bandwidth QoS Register Interface (CBQRI) support f=
or
>           RISC-V cache QoS resources. CBQRI exposes cache capacity
>
LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

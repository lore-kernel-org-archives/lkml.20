Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769496;
	b=h8i2NQdi46snH9z1B0p4ZQqc4RRdsM87k+GYyM6JIoBLJTHxsYuVYfIbCbbEdEvYb+2V
	 t1qAT44dSJjsyer50yuEHY+c4Xj/VgBftehwsCbI7B6tVEHayn49yJrHfy+Vb4lkXOLfF
	 ZsQc1ZxWUwv1ba3GaPXz9PBvH1F+vMmWiwP30ZjAOF/arB4XGhXpxG9dO2KmGIpjnY/Wp
	 glsmLFjtiaVpURMjIEXFTXe5dUsol4HY38hyqRBLyKs3/ZIy/K6B8kxqsI3odOyWCyj/j
	 NXiwDpWgv56/O5GUxDJFcO4OF/E3zahlgLZALacog967dlK9KF7rLQ/dy9dziEgemHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
	b=kMMucyGYoqjeMB4s6QzaknOjYc6XvP/n/HrFB0CM9K9nzMaYKjNhhlFn9Vnq/9A33FYi
	 4YcKD3fv0axLCrUl1damqf6tAIgcNQk+JaV1SMpMLJATVvQkkD3fqGqxhiQAoN0gkbWLe
	 3Zz4XByoD4mLOG7KpDtyADB5Kdjdd60J2SRAqd3GTyobcx5sBiFid7KtRAI3ua9ofnPF5
	 uLj+7VJssqOWEJugw7iicHPzvB3puectaVFD9wVGlgxblQWk0mBqFvpyUkFBbBwIO+22e
	 lD76PL/JWkbLjjZgWKbdtni9gcNI7INjoGrCEovuBvfT0zis7GDXxl+/7DowYXk28FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsRLMs5e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MA/L8Upr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4F606A332
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB4F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsRLMs5e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MA/L8Upr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6EEn1955227
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=; b=BsRLMs5ejriH/lIL
	YB0wgFGzAoAsuPOErC2LXvwXzaNy2zgUGBCqEztreE1rQoR8uG2Vda4z6BphVbJP
	s9A8tMgbYc4ssyexAEE80YfipkYOrkmXHRl+zWq95Z2Uy6tgyMvJkeRt0Mr8IZUC
	uDLfTYwXmqKb5dcStOt3upPfcEoBrdWhhxCBNBCdoVOMLhRX4pA0OvNUBCkTDvTl
	TsN3Aj/0yrdsuLtisWNATXENvMRPVp3T382aezpYGYTX+5oHEl9I+C2zU3tE3KvG
	TY/M5ZGaNcYoRfDSDpEdvBl3PyId13ra4ZXhZNDWurndI0Kvp3kJk9b0izTG1OPW
	FBzUFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea785a4decso10510325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769494; x=1793374294; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=MA/L8UprF2wuU4gh4D0ySRU1xQJU9C+HjGOCrlzC11OW34e80uiVEm6lRxjcTkR/fL
         bAyDIc5Y5q2KmMj4Gz8U/jdzXocoJEV/hAJAfVhUJZujqHA4Up7jl5hnBafhUPAYtJeR
         f4l/fXqNMInAbvgahYGbZAkblS/Q9uHiNJY4E0t7SS863McltXs/67Rp2WPmgCxQ7SVp
         gG8UmXuk0DQvJn07CVWvcuwpY2g4MuGDkfC7rPRzBi5/EHCAxeoR3VX6v1kB31NQk0LY
         HkR3TOSJKssG3rg5bv24v4eyb/L7ifqPUWXkIX34lDaI4SN8ElMT36EYdkR+CJU/dIkF
         Aafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769494; x=1793374294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=OMg9JMXeblJZDDDS4U0rWpcRlRJBlniyCsriLSc6prFOW9nquSL5GMlybsQS4jiFah
         JzPAL4wMsKz13R92SbRHmJ1VJnV/+LOh4RUatLeONiSaGI4qknRJh+g42yru8YqSIN/T
         jwU+Yrkp6eWfC1PaJQUL2s3gX9ezI25klebNwTxExf0dO8p09lpwAu/VzfuIbMoh3OJx
         Y46mcp5RxGgLL7vrF2/gJmvRcTE6nw0pjctMxwHKYwMfXIDPPz2ZmPr8bOQUS+6M8eX4
         S5wmOza71PDqFt6hk+U7ln71rlijkPWCRum4NeDnTJ9RleM4l7lsDsvPSQ6M1orhe8KO
         DMxA==
X-Forwarded-Encrypted: i=1; AKwUvByILWt+XGLmlbB/rwrIZqrEVry+kpcqIX+Rd2fVdXaOrVx5xBNbtrk1grStWWpkdHbHLzugx9ou4fxxYPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJshK7AWoVaxHUbf4KxMK1ie2iVqpdj+bHg+RtdwBx58XUsb+8W
	LDUVMH31kwPMZD7+iQ1s+EYE75nev1Fvxh7JDnpDvmob4h9XBFGSUvM2bpOcYAH+ATvPIWWfUKf
	fjwo3J4x2J7na8t34BTPYNp/dRt9JjMngYM/hotDhrWp1GB4wv9LyNn3NFJvTiE3HJxc=
X-Gm-Gg: AYBFou0u8KVcIDQQtnMeMCS9h5m6YCqCh50a93l6iMgxg1uhyzdDfnH8M0ATlBn8PV6
	F6vJMwbTXt8NRwkoOMOSPkcL9V2aZ4k6prETZH5C3kWJKpthqurTWgoNZJewr1LHOkdnlSqDnzX
	Mc7QMf2Tw491bjON31AK1InY7TOFwI8f8/IiekLujn4sUbn8JaylM7J8h3e/fKhOmE2BZiWcNTf
	R9drm+o2e5/TDFCbULoEXn4j5LWTM/bWAonuasuBMbRIgkUK7DdvtTBRPIh+aNoU5oDS69QIAPZ
	3Y1sakZgqrA9aVSIBQoMceoaIT9wXbFR6qQQKDC9DvkpFN6hwgsdV9wTWcSwgfztzTJ8hR/bLrA
	eI1KQkzL/k7xQ7rc8vDjoqBYp7qMqAsqb
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20823105ad.13.1792769493506;
        Fri, 23 Oct 2026 08:31:33 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20822755ad.13.1792769492870;
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea947ac357sm1667205ad.76.2026.10.23.08.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 23:31:26 +0800
Message-Id: <DMCBQSJ0B22A.2TDXAXPJNPZL2@oss.qualcomm.com>
To: "slack up" <yxcnew@outlook.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Andy Chiu" <tchiu@tenstorrent.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.22.0.r35.g0a434803
References: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
In-Reply-To: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX4OQUHkZoJdYp
 2CilIprmb4R5UCXo15nuBJWRZsG2YbYG1REZiUyoVHIWfdscHBZzrwoRIfmZY4nz4g58J8rbzgr
 h6YC31NCRtipTjmu3z5YqU2X3r381bU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXxt2qim5mzILC
 REvObSJB0PHM/WYj5BSomCVR6aJa+WED0CbwL72MKSgL8GuMsHMsaR/8UwrHb6x2/Gbwl7iXmc4
 kfilMZX4m+i7tbrn65h9m6j8roZ6EacJPSFKyGKgPZ7FOdPBVRC1EZfJdumB/todmCBALriwiHI
 agsEuNPWvLMfdALYowX/1s8UTKZfsEUXtLjumUB+SDN+ohGCN94GevZepW2NxzDoMKr4oZVPwtp
 UCR1UjVcFyWrbxzqx2VqEUVuquY0ixsVFvb5KofcbelOnRlVpGRiBkofDQFhjE0nIwHeeXgaLH8
 o6MwFpRZan0lVaU5Gaufsa37FgKSYplW/XPOthbWKNGanNXU0aBW10K/ujRN2sneyXjB+w+Z8Ku
 0X1nKShwiOs3RUW8Fd+lslMxXxd971zeRLJKPCOVNZJI3xgTi0l3UFnjAM4m0TQ3wvYTqsVJ/is
 QoKzWV6otyhhyFdMtaQ==
X-Proofpoint-ORIG-GUID: yqZF_J-F2v2VobFu0xINKAoGJ0wQfxsH
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7dd6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B-Qh9SJ9cMKcPyFv0BMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: yqZF_J-F2v2VobFu0xINKAoGJ0wQfxsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

On Thu Oct 22, 2026 at 1:31 AM CST, slack up wrote:
> From: Xiaochun Yu <yxcnew@outlook.com>
>
> Commit b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context
> handling for kernel-mode vector") made the KVM vCPU load and put paths
> call get_cpu_vector_context() and put_cpu_vector_context()
> unconditionally.  It also added an unconditional call to
> __kvm_riscv_vector_restore() on the guest entry path.
>
> The no-op definitions of the first two helpers live in <asm/vector.h>,
> but <asm/kvm_vcpu_vector.h> includes that header only when
> CONFIG_RISCV_ISA_V is enabled.  The KVM header also does not provide a
> no-op __kvm_riscv_vector_restore() in its disabled branch.  As a result,
> a KVM build without CONFIG_RISCV_ISA_V fails with missing helper
> declarations.
>
> Include <asm/vector.h> unconditionally to reuse its existing no-op
> helpers, and provide the missing KVM restore stub when Vector support is
> disabled.  This does not change the Vector-enabled path.
>
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for k=
ernel-mode vector")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>
> ---
> This single patch fixes a build regression when KVM is enabled without th=
e
> RISC-V Vector extension.
>
> Tested on base a804c5742bff (Torvalds master):
>
> - CONFIG_RISCV_ISA_V=3Dn, CONFIG_KVM=3Dm: full Image modules build passed=
.
> - CONFIG_RISCV_ISA_V=3Dy, CONFIG_KVM=3Dm: vcpu.o and vcpu_vector.o rebuil=
t.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Tested on commit a804c5742bff with gcc 16.2.1 and clang 23.1.3:

CONFIG_RISCV_ISA_V=3Dn, CONFIG_KVM=3Dm: full Image + modules build passes
(before the patch: 3 implicit-declaration errors with gcc, 5 with clang)

> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/includ=
e/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..ebc619ed67dd 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
> =20
>  #include <linux/types.h>
> +#include <asm/vector.h>
> =20
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
> =20
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_conte=
xt *context)
> @@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
> =20
>  struct kvm_cpu_context;
> =20
> +static inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *co=
ntext)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
>
> ---
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
> change-id: 20261021-ospp-c1-b4-submit-e22dc09faf5a
>
> Best regards,



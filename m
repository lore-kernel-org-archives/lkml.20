Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700576;
	b=IhGkfMWm0bbWtiXdcxjeE3pGlLWcxZza3wqA/jNw6oxUcLMHaWfc4mcXhGOpvZzL2Jet
	 kgP1i9t/EyqGZgN61iMJtDRWTHdNvvYtnH3L06iCWr8haPQDCXJK9kwD2HJU18kmnhNBD
	 JIyMcmS5hr5qwRcuKIVn30tiM1GNHpWdZVRgzyO0TYZ8KYgB4pS4RLPntZK4yRtc91/j4
	 OcRRpJg1MScnPj+HHvaoUAHBGaBPS6l1yj2K7nC9Icqe9wvnUF+uwyMNBpHfROGF04Ns8
	 JpwZW9o4CPdAP8KvDCH79+vM6Jp1UPPV6hJvCwDNXVVRFT4RMU9flNdvSpplm35OLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
	b=D22/xFmQ+Q4S1Ln+TyXD/ypUwwQ/g36AuTOHCCiBbs5V0VCWQWKtstkdZdDq41xtDOja
	 U52mlLxMk52LzcfkStn3KmhHZGKcGK1r5L4b3QCDdeOiY0o4B78BBrJBBdtU2Dm3KtqQ6
	 zKuqndonbdwEWx9uES2u7omjMpBTF/t3Uj6bDZOQBAg+Bje5qKuwGIVXY3AEz4AsE9Nh2
	 6usSg6TsRsO/kEurGc+tDZLpYNWz0Aq0YyBrKloRr2HYHbD7SyfYxx7gEjZg36PSSqRcO
	 7VGKRe9GlKS0akti93sFr+NDp46erv9rHydRqVlei4OGwGHG9PTN/oT8TE73QWkfYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVswWsur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpyWTgu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6F606A826
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C6F606A826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVswWsur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpyWTgu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37wie52402921
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=; b=FVswWsurstDEMrrU
	w+tfoqutVbOqqOlCgZzgL+6C3MdtINlpK+m+oWDnotKSTx0q+fMikAhDWf80GQj5
	NJ2QbedhTAixPap/UVSIGZyP5b9lG+UtMzoAayFXHLfV1lDtjmx4fYqitc0G+QLE
	AwNcapM8NGZiD368H6FizAOUzsXO7FH/rpNPWoX29Tc/rId6d4jbzytPv7HZ+Gk2
	9JSvNvLje0ae/cCEqopLqBQXU67gzxkgvOqczzkWCy+YnNFpxUandO4CE4C4ecgX
	NnbVGq8wSMtSety3enTnqnjwbfE/RaNh72t8XXNLN6DbK2JeEXIQohQrm7cAjIwP
	r4NjyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2bfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:09:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso64791785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700574; x=1794305374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
        b=BVpyWTgu7WDTZUzwLZQ2RBLxJuB4ZCB1jLcFFUrQ7Q/x+yP4I/8rVDcOxxMQGoy5bX
         Qu1mxp28O4vBFv4X6F6T4q37XQb4WtxkXMW8sCyJlwdy5yin9mkmLiCbuT7PXdvNqY31
         blrWVqDCijparo/7wmEHTWC2uVF9feoVbrHOH0/neMRQqrQRCPwO7sRJ+aPTqzNKdVdM
         8CMjW+EAwt0HA3LrS69QYF1HUcYsJpy7+Oyot1gv2D4+awnVJaC9pLVcOY+hmyRuZ2rz
         A/Bqk7Lx+8BobpgV9qdFZV9cJIXXdS/Q+eOGS4+eFfpK7PpXM0jEFQNGQ95UjzoF5DTT
         2b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700574; x=1794305374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQ8twuEJ5meSbMw6ETl2SRtG0VXLH1wyQ/qz8n5Y1kU=;
        b=WRosSH0LRdK2IeDih5ooHK8GthFH8+p3Xe4eK9U8QDn7410M13eS1sQUtLixT1qpBi
         dQQCzN/TIl6So4Zl2D6UOIrHUbjOPKWi5b4uuTog8ibsi8UhXerrr/GXPc0qGoZUqsPa
         52IA8ZHTPX3b3gngifZq+jXbUbZjWDPzBAo/ta6QmYIrx3VeX3j5mWDESbohvRY40pV4
         gP2lpHmvIQ2Duw1tZBAV26bialhgsqPzxLHq+f47OmJatQOLW1pOCjbZVXMKBc9EYQmQ
         d3fU4JNvANc2RxLhutXg7ela9eTS3XUHnh/EDZB9no4qAsM5Wjy4u4rkA9rsCq0xSfyp
         67RA==
X-Forwarded-Encrypted: i=1; AKwUvBy34KXfO8CbMHXJ27QIqQo57l+oPjDbU3EK3ue9/sGCc+FzNkOz9TwTRJ+vt9Z29lgpHwmixMSgq2E/1X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zv8ekoAha7XwvMexkg+RaQfLPfLyQHdiSXATvyx5JrVOF1t9Y
	quOdKGex3Q6J4M5Jp4SQXU3+BLwHkXiP/PQfzFFlvRV9fESFxRsruvaZu/g/+7l10IzHiD26+mh
	cdX08QffExi1KdtiVellG/P9oV1FXO0wA1uxxbZJSSu7yICscFkOq8z9nH8xWzq0SuYw=
X-Gm-Gg: AYBFou0LtGAktnu64qzqqzfwdWGQvw6zap/kiemp59EqSR0OrvPP4i6V0WQ3ieWyLo8
	HaVFCqgB8273vLpykpROBmqXYR1WDCDDwIcQcKwiXZqBpmm/pdXm7Rf96N98BsLtmfus6xFGISv
	COfZv5kDwGfCKsMkOeDWtfVaYosro3EUIlE+rRjiP5Uw8fR2j1/yOgxflT0IfpKlyWnfTXcejr7
	5C9stLHk3uC4DnMTbIEjIlkVutcX/wuoUQT15sSj9YFPrPVmYzglmw0GF+yi/sx27Tw5t/W+4HJ
	TwXDPo3hfMgJbBXMoSI9ldvxSdesyLnz+ApuwQX9UrenrBZlpMMWEdOfJ/b0ha+rxUs3tuvT/mo
	KgEfa5m1Hzh3qAG9SNJmCVMwZuJE+KFTsOKnF2LoiMZxbD1fuUApOWrYCf5AphFeW9Y89dw==
X-Received: by 2002:a05:622a:8458:20b0:536:27d7:abee with SMTP id d75a77b69052e-542b443bb1bmr203162701cf.2.1793700573875;
        Tue, 03 Nov 2026 02:09:33 -0800 (PST)
X-Received: by 2002:a05:622a:8458:20b0:536:27d7:abee with SMTP id d75a77b69052e-542b443bb1bmr203162281cf.2.1793700573226;
        Tue, 03 Nov 2026 02:09:33 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca2112bsm4247945a12.32.2026.11.03.02.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:09:32 -0800 (PST)
Message-ID: <4db1afd4-d56e-4118-a467-33acfc96e4fd@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:09:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gtj3VO-k1ml3gbNXAaGCFhwFre7eJK37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfX62Mrh9X9xVKT
 cxQJvTdNuBZj0pEJfCh6l5rXv5xva6TgTJtyxCh6Csg6bLC1eh28e+m7d4lfMJbTGtBgzfGRw2x
 P4Jvd+qSidBjX3xI8f32svDgR0/b9g94q/VcRVrcq0QhAewS/aFfvbvbKOZxycRGMB6lNIdrXLs
 pFMRAjaEGBpgJOALWtFZOEFXaUOHVhs/ii5J91wHi/FW8cLrHUVU5ZRoi3VUVBN6QOTtWgycpm7
 ptP+L427En8avHF0Sb+AsUl61VI0+E1zEiP39PlFjwq+sWqwrPByLsvBHOE4mEjljV1iBgzpEUA
 g3pxHUWb5y0psMu+KYJX+lR+lT6gpYJNv3mn2GefUaqLKd7B4TyfOG9uJeTSFc9nYvkzNUQ0i9a
 eQNyzX1vdTwuR06lJtZa6TLs1nxNG/3pyygxIHkdsQWS62x+E9NnIvWDMtnFSkZoH1IF4oLwAGt
 dWAwfxnOBkANtsJC5UA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9b2df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VGL-YO-I9sm8S5do92AA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Gtj3VO-k1ml3gbNXAaGCFhwFre7eJK37
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfXyY/hxPSLTrEz
 H+ruj1lN1rH39PTFxFI6CbGfKw+Kw0W3GgPYaTAkQzbnVArIuC4iEJSdy/FPatk7Sgc3dXoGIIF
 /8uLMYoHzFw/nu/Fa8jOq7Mjrna3CkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030040

On 11/3/26 11:05 AM, Jishnu Prakash wrote:
> periph_interrupt() derives id from ffs(status) - 1, giving the compiler
> no source-level guarantee that id stays within the 3-bit range of
> HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
> FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
> instruction and is expanded in software (e.g. MIPS), the expansion's
> internal handling of the "no bit set" case lets some compilers prove id
> is a literal that overflows the field along that path, even though the
> enclosing while (status) loop guarantees it is never taken. This trips
> FIELD_PREP()'s compile-time "value too large for the field" check.
> 
> Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
> computing it, so the "no bit set" literal is bounded to the field's max
> value instead of overflowing it.
> 
> Root cause and fix were diagnosed and verified with AI assistance.
> Reviewed and tested by the author.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
> Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594988;
	b=Gag+9dz9z0nDK3rDYW1NaeAijKmMx1eO2A1yjBBSW/tpNSsiZUMK+UG7lD0pg1qlGIqx
	 pnywtyN/KlHEbZTpz6J/KjBN6mPS6wT8pR1EaYhXq9OW+iymB9sW5hcmQdjKWr0UWD0J/
	 ao01O8IX1mV07uHMhZHeEuQjOx9vEBP1iHqKoj41D2V5xEzMM6lpZEgr3wcfUJA3ZBXhk
	 YNJYdAfZsaT6yejZaCnRmxKsXEGxGONJlHBOrSCF+95cQGKPim3Yjp5Ee8WlI6yUu1hRy
	 5Wb1DfoPklnNRc0VLEI4wwVXdUzdNsgQXRvPywKR2nEiPB+XTl83M640n79+MRreATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
	b=b8m37SmuvqhdlHyGkCyA0qG1y6cGo3RndDawVF+CJpFqO2Zfxq898mA1V0XsORrnDVHJ
	 1POrQQqrK2LMfQ2hROwXl7w/sUpLREFTSwEQUwG0h0p+FDWi0lVldi2oBmYLVTCwKnGPP
	 UwKhCp1Ds7Qeb987Rtd1V6KwQU7dSmGbqSPvxfy3/BRb/oRK/sEY1PyAdWAw5TodxJ8CZ
	 53HJZuUrNa6wHBYkigajtbZHegdR0uTTgscYngasoyNsa8czGRxzoxZ3JGpRcoUrGHfS8
	 x5/amxSAhAtTwNTBAJsRKUQKpJTWHQSVfPvbM4sUmnWqRIksMQs8Tz7lIrGOtRm/FaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qpttyn3k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km79Bbxz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA39606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qpttyn3k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km79Bbxz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vBm61134237
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 04:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=; b=Qpttyn3kxX0Hh8Dk
	fGagTzx3Y4Z8uZGvGHrM2vtlVwzhM/9rvZDebUacJq+080vpIHmHnFEXewC+VZ3B
	5XDWzFY1nflBOn8+AQi1wUNaA068qKtwPfJxB9Xk5toDN/RhTCJH1M6yDuruXPG3
	zhdOvsQAd/r0Wu5H31jV21pSoLLBo3N3qyIn8sWGY94K0aagir379WxDNwYo4mjo
	bOgR7imbTbCZ9sRH9S5X0AmD+7MU4eITmT+qBgicv7vJM/xwJcOb5aZwINnhKOxo
	PRyvjsmifZydG8yFkClFkoMQVjn+GPvrROGRDLNxlugmwFoSrRqUfJ6/K3mD8MJN
	XhJAgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk4y5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:49:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1053092eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594986; x=1794199786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
        b=Km79Bbxz5ZD/Gwbm+QWpLFzfme/1pVxouw14Tu1pnMCPC60fXuDeGq0yQSrzKHaV9O
         VuACjMFoDAWojk0g1774OZ1E0wvlTqIh+Qs6mAJ31egOUxHynjg3M0+MxpIIsALrnGgD
         X32IIjOptGex30gn9dK2jdvf50rPY5oVdZI4ZDGUn9kL/543g0CsQ89l0DIetYi2jlaU
         HEpb4LZ9be1oNBbiYUjwpB7efTgTPI8CaLpnaK7wSlGgOGxv2IL2BXc5/iCgVe1jfKqb
         wjfzQ5TddiqeQMOjZnEqb5zLrfeTdjVJhmNiNjonQUwwOje7FXK0YGHdjTwaDK3+MN4D
         cGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594986; x=1794199786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
        b=fuGX6rU+LUlg++kc4sGDS7cVBcO+R7QWbfUur+BNRLtU9Ql1ud6IGqUbaWhdjFv2Zj
         u57Z7QAsBBwkcRzp+WQ1JA9vAQ1szPtdhvsAiRQfzNxcLeTUHH0oAY0ziAa0airvlYQu
         R2YvEdrnSaouOq15j8vWjSA/a79LfZ1q8IybAFMWJTbtOyjIAQxSu0KtT20zE7wa+bS8
         OKTcGlrnrEKeyWr9hSFfmEdbEXUjOcGnU/6Xw5m2kQNirLnHRKDon+fbbE4mpdd3zi07
         2yuW7pz8pmi0/hLl+bNu1UOCQlrPqIfmGcn6RGJBFQQyBYjgrkfk2C6DHfW4Lv9kO4Cd
         JMHw==
X-Forwarded-Encrypted: i=1; AKwUvBw06Nid+yTzWqH9BSPae1n1R7ZKP6HhpG30/0xZL4hgsKhHRBYQMKSiizZx6K9DVFqBE5vt6FrLfQL30qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZmM0d71oiwZkUNS6ouoD/zF80Gnvo4/GuV1PmATylBBgCNg2Z
	/E3x+N4Dg3uM5DoeIRiBg++1YrRs9bha0HQkJbphTOzcV5K8E2QvzHvs6zMTGoTdxCFaKGlPyo4
	n0x2xUBePgphdoONJNp3Gzeq0H2Rjfw4mTATXvhMId9HwG1B4ot0k2KOL2yT+lhJaM20=
X-Gm-Gg: AYBFou1NCkPXuCv95WHlVBvgcgESyznXiDRqBdP2TGE2ASS3cdu6gr1yQ9t4Mv5QeCE
	dybx5zOYNFDm9IA7QCGWpE0CUqhzqpfIuqsy9eUPqUS+15fSX360MbrQjLO312YNiSc0KGlfWqO
	eDApb2Wb+d1AKUF/M/37c+raSx1rpB81d6al3TlwLpJlZTzJr+iZgcyPigVVFLKNRunj7FtSbbf
	ImvaW4SXERGfC6mErKkF7qrLr93QCy6x3DwkZijdk8fnPIHjAxsRabIYLQVtATw4Tjmk4sWLhSL
	HzU+qni+ht+lKpv4xt7WJZDi+BZaIyXYsBE0fNkkXXFg4jkVSDHEpaMUMKSuNUGL+72esbmR7t+
	6lqqCo06wfheuDyrw4U3w1BCsJeeimg4pAM8F8d1zdRv9r/9dTv2s9l5rT2ofoSnP3JIY3TREi3
	WHXUgvm73tKBrj25snbnKN5ZEkrri+fSRRHWdzjuI=
X-Received: by 2002:a05:693c:88c2:10b0:351:4866:255c with SMTP id 5a478bee46e88-36a42436c62mr14314556eec.32.1793594985766;
        Sun, 01 Nov 2026 20:49:45 -0800 (PST)
X-Received: by 2002:a05:693c:88c2:10b0:351:4866:255c with SMTP id 5a478bee46e88-36a42436c62mr14314520eec.32.1793594985107;
        Sun, 01 Nov 2026 20:49:45 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm35539336eec.20.2026.11.01.20.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:49:44 -0800 (PST)
Message-ID: <ba544091-1da4-4616-b1d5-fe23f32679d9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:19:40 +0530
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
Subject: Re: [PATCH v5 0/2] usb: dwc3: fixes for two connectors sharing one HS
 bus
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J1w_vgFfvZUaLEPcvSh4nFOrzyTAAbWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX/o0pPSMOScS7
 V17u9bkucx5UQgELBRKJJrV2dOskg5Te9iwlq4qQBkzO729ctl+w/6as6NNV4QZWCfU8lg1vv7o
 lUg1Zw9eZy5ZGflt4HNAKbOYb7uobDmJZ/eadNjVKcjqTzP2r4NJlnJd/0W4y6cXx20qPsJBita
 VpVRWhGS5avtfoJlApQOCliWBbQbw6TiMCuphkLMSJwcKQMc3gSsqf0j7N749AJpjjidNBk0XYp
 WU6+WZRCUUK27jZPGVR8pN8K6naN3JNYitrrnkg6PVXauntbVp8kcHJk507/98Z/MJ1VabFAYGW
 m+EHVDmnt9ey5WJVE44nhRJZq5bX6TFp8ycgvZ/YVMwIOeS1tWNAZU2e1J+o5WDJu0CF30dMxVZ
 vE+RkWYMJCeUEcPuDC1bWO2qRSUe6FTeqzxy6x8tyXUEnzGkw3xvOrYBksywmastscELxEoka/R
 FhygMw10F6u654fIcXg==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae8166a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ONjVEaSHlnFtOruT_RoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX6w60EM7DYa95
 thc0EmrKCEnZU6mpn3Go9GhltUr9mvh7T6ojGr19Dpko1FkAi+rCU7uRVjAAzmFzPIWu8EJ1DvX
 779sr1/ZaGWyvKuXZRZ7MS1nTJnTwi0=
X-Proofpoint-ORIG-GUID: J1w_vgFfvZUaLEPcvSh4nFOrzyTAAbWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020019



On 10/31/2026 8:31 PM, Qianhui Xu wrote:
> *** AI-assistance disclosure ***
> This cover letter and the accompanying patches were prepared with the help
> of an LLM coding assistant; the author reviewed, tested and takes full
> responsibility for the content. All measurements cited below come from real
> hardware runs and are reproducible with the commands referenced in our
> public reports.
> 
> Greetings,
> 
> This is v5.  It is a fixup series that applies *on top of* v4 [1] -- it
> does not replace v4 1/3..3/3, it fixes them in place:
> 

If v5 is being sent, it must not to be applied on top of v4. It must 
include (v4 + any additional changes/improvements).

Regards,
Krishna,

>    - 1/2 tightens the binding of v4 1/3 (snps,dwc3-common.yaml),
>    - 2/2 fixes the driver of v4 3/3 (usb: dwc3: support two connectors
>      sharing one HS data bus) and also corrects
>      usb_role_switch_at_endpoint() introduced by v4 2/3.
> 
> Base: v4 3/3 (fd69bd54e328, "usb: dwc3: support two connectors sharing
> one HS data bus").  Please apply v4 1/3..3/3 from lore [1] before this
> series; the `base-commit:` trailer in this posting is informational only,
> since it names a commit that is not in any public tree yet.
> 
> Hardware: Lenovo Legion Y700 (4th gen) tablet, SM8750.  Both High Speed
> connectors share one DWC3 controller; a port-select GPIO picks which
> connector owns the bus, and each connector has its own typec port with its
> own role switch, described per graph endpoint.
> 
> Changes since v4 (all points are replies to the automated review by
> Sashiko [2][3][4]; no human maintainer replied in the v4 thread yet):
> 
> Binding (Sashiko on v4 1/3, three Medium findings [2]):
> 
>    * "hs-port patternProperties does not match what the driver expects /
>      escapes unevaluatedProperties".  Fixed: the endpoint name pattern is
>      now the same one graph.yaml uses, so an unnumbered endpoint or
>      endpoint@2+ is validated too instead of silently escaping the
>      unevaluatedProperties: false rule (v5 1/2).
> 
>    * "usb-role-switch should not be required only indirectly".  Fixed: the
>      controller node must now carry "usb-role-switch" whenever
>      port-select-gpios is present.  This is a driver-fact fix, not just
>      schema cosmetics: without that property dwc3_get_dr_mode() forces
>      dr_mode back to peripheral and dwc3_drd_init() never runs, so a DT
>      that passed the old schema did not describe a DT the driver could act
>      on (v5 1/2).
> 
>    * "mux-state complementarity is not expressed".  Fixed: the two
>      independent `if: const: 0` blocks only rejected two zeroes; two
>      endpoints both claiming mux-state = <1> passed validation.  The pair
>      is now a single oneOf so exactly one assignment is accepted (v5 1/2).
> 
>    * On the standing question whether this should use the standard
>      mux-controls/mux-states properties instead of per-endpoint role
>      switches: kept the graph-endpoint shape for now.  Reason: the
>      arbitration is "earliest request wins" between two *typec connectors*
>      that must each be a usb role switch consumer, and the endpoint is the
>      fwnode the connector is attached to; a mux-control consumer does not
>      give us that per-connector identity.  drivers/usb/ has no
>      mux_control consumer today to follow as precedent.  Happy to reshape
>      if the DT maintainers prefer the standard property.
> 
> usb: roles (Sashiko on v4 2/3, one High finding [3]):
> 
>    * "-EPROBE_DEFER is swallowed by !IS_ERR_OR_NULL(sw)".  Fixed: pass the
>      error up, as suggested (v5 2/2, last hunk).  This was also the root
>      cause we hit on real hardware: the UCSI glue kept a NULL switch and
>      the connectors never bound.
> 
> usb: dwc3 (Sashiko on v4 3/3, five High + three Medium findings [4]):
> 
>    * "dwc3_set_mode() under dwc->lock self-deadlocks".  Fixed: request
>      decision and issue are now paired by mux->lock; dwc->lock is only held
>      while updating the individual fields (v5 2/2).
> 
>    * "glue layer is never notified".  Fixed: dwc3_pre_set_role() is called
>      with the effective role, outside spinlocks, before dwc3_set_mode(),
>      mirroring the single-connector path (v5 2/2).
> 
>    * "same-role request that moves the data path to the other connector".
>      Fixed: dwc3_set_prtcap() only clears SUSPHY when PRTCAP changes, so
>      that case now clears it explicitly (v5 2/2).
> 
>    * "registration earlier than the initial mode request races with a
>      connector driver".  Fixed: register and request the initial mode under
>      mux->lock, tear down in reverse order on failure (v5 2/2).
> 
>    * "fwnode references leak on error paths".  Fixed: dwc->role_mux is
>      published before the error paths that used to leak the endpoint
>      fwnodes, so dwc3_role_mux_exit() can actually unwind (v5 2/2).
> 
>    * "sticky mux->error is reported to the next caller after it already
>      committed its own request".  Fixed: the sticky value is dropped; a
>      failed data-path switch is logged and counted per connector (v5 2/2).
> 
>    * (found during on-device testing, same area) dwc3_mux_role_get()
>      returned USB_ROLE_NONE for a connector that did not own the data path,
>      hiding its pending request; the connector driver then never sent the
>      set_role(NONE) that would clear it, and the stale request kept winning
>      arbitration after unplug.  get() now reports the requested role
>      (v5 2/2).
> 
> Test evidence (all on the SM8750 tablet, kernel built from this series):
> 
>    - `git am --3way` of the whole series on top of v4 3/3 succeeds;
>      checkpatch --strict reports 0 errors / 0 warnings / 0 checks for both
>      patches.
>    - `dt-doc-validate` on snps,dwc3-common.yaml: clean.
>    - `make W=1 drivers/usb/dwc3/ drivers/usb/roles/` (arm64): 0 warnings.
>    - On device: after the -EPROBE_DEFER fix, /sys/class/typec shows port0,
>      port1 and a bound partner; with function_graph tracing, 12 consecutive
>      plug/unplug cycles each went usb_role_switch_set_role ->
>      dwc3_mux_role_set [dwc3] -> glue notifier -> dwc3_set_mode with zero
>      WARNING/BUG/lockdep splats, USB data and charging both stable
>      throughout.
>    - The binding topology (two HS connectors on port@0 and port@2 of the
>      controller's port node, one endpoint each, mux-state on the endpoint)
>      matches what the board DTS uses; port@1 is occupied by the SuperSpeed
>      path to the QMP PHY, which is why the two HS connectors are not
>      siblings under one port.
> 
> Known limitation, stated up front: the role *arbitration* detail (which
> connector wins a simultaneous request) is verified only by code reading and
> the stale-request test above; a dedicated per-port role-value trace is
> instrumented but its data set is not yet complete.  Everything else listed
> above has been exercised on hardware.
> 
> Thanks,
> Qianhui Xu
> 
> [1] v4: https://lore.kernel.org/linux-usb/20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn/
> [2] Sashiko on v4 1/3: <sashiko-outbox-185247@kernel.org>
> [3] Sashiko on v4 2/3: <sashiko-outbox-185254@kernel.org>
> [4] Sashiko on v4 3/3: <sashiko-outbox-185299@kernel.org>
> 
> Qianhui Xu (2):
>    dt-bindings: usb: snps,dwc3: tighten the two-connector shared HS bus
>    usb: dwc3: fix the two-connector shared HS bus role handling
> 
>   .../bindings/usb/snps,dwc3-common.yaml        | 105 +++++++++---------
>   drivers/usb/dwc3/core.c                       |  36 ++++--
>   drivers/usb/dwc3/core.h                       |   4 +-
>   drivers/usb/dwc3/drd.c                        |  65 ++++++++---
>   drivers/usb/roles/class.c                     |   7 +-
>   5 files changed, 140 insertions(+), 77 deletions(-)
> 
> 
> base-commit: fd69bd54e328c407b1853378b25d15803d3453fa


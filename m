Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630495;
	b=iEfk13plKPbE49bauTjL6JcS3+MNcsY5LP6pRxxV/N7iS1FMZTQcQuQ2gwUa+BRzd0YE
	 pX6mJdevlK92kGH1rSczaH1oxsLWoTWzm7gDZk6Omuj1I1Mh4Q8ffU9GQkVIk/nJ+R1HF
	 KKGN6CYU/G84orwM/l13p3+xXeDqhwI5NRXSTnNb0MHTTP/rBGchYY8lzhIVnpTfA9z68
	 uNg3SyOswdYx2Taopx0nl3CphWX2fSKpZDRtuBAPgNRGV5ensuNojnR+RFxMkvHb+Anxs
	 B1jUai5qkDKdPS/J6GHgrwj5vo4RyAvXC2xEsFISGM/kQdctsmZOr2BhKeJXg4dDZrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
	b=IeDrdMDgLEq9MhyCdQEMUdQrU4PJ3Nnt6SvDZBg1dWaL3kT/h6frOHEcccpVaxuAdbF+
	 eSdnZIM3FlsHWX8DYXBgcqgV7FZC4ILMrV4kE2aMx4gDRCkMhXXAR7ych2aJug6G/PK2u
	 fmfUK2ugPq6UHgO2hqs6QCd4Dc2SCt8K/htYuIvgVNbzHbpOfxhMnjJjv1/fYIBQGKVyQ
	 M30PgrY2VxD4FYPbcirqBL1Yc2QvExQDVEo7mVXkGONhYoX0QdGpK7aHOC66/rcpLOnP2
	 D9s23GQ6XlN5apUZVTTQzFUdfOaHjse7tbA/VDl22TIGtsgdE3965PV0uMOyPgBeF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12525606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12525606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE4C8Ri2459900
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mfnzKhlFqbPe9BxFyLjXeFlU
	GqJhtzF1P/zaxEKCg38=; b=DGlHfkyAVjbLeQibv0xJu7sEyaiPh3sU5qCTX3DP
	4dSkAuzvkY5vbmx7Q9flmQ1l/n8FC3kReG4T2d95PmkSgm9QgWb5yjBBIpUH07Ds
	8WPGozSvsqnFyd7dmZSDKXYFQymbCjb9cCHidPa53QSu8iXqVHTWsRWE1AjKl8BG
	jBDyQBGyz+mq5w4V6gRMuYRTutekiDyjdZIbpukxOBSB5s61zeQD+CKN7FrrUf2/
	CYMnpSr2qHvIt6e6xSOyS39Hin36rXJZf4xmzImUH9xDNe9PtBzJKn9bCli6CMs9
	ldJPDBPfF/cfs3Sc9It7mlO6cWQer1PpMwePs2SfN0hRfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxgdn010j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so3770451eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630493; x=1795235293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=G4X3XvfSjX+7NHFr5Bs8PKMzeDvhvutxt5HkckXBucinSbIEPAG1k7KeE8QCWKGDe0
         lRgrmkGZd0MyMDzhSs/st8tEmmkd1H/cjrKV77BrvpJ1A8ASlKH7SQT9psLXEmigP228
         Yl5De1HvnHeYRJqfkWkVbAW5/OzTPrglN2VW9uPyywE45Tp+yvB2YSyrXjXkJiWy/l5H
         +Y+QACuZX4LT7YJMP87rOsskQ6qAyEIJRUcP4S9Yf1e7XXsJoyDFMFAyCob3fZklajLf
         j6xyb+yXpFOXOLnQfYFkTOVNIAMh2uYjbLgO+9AZldlWyReSWnAxdV2RGROCqbptTBsB
         pKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630493; x=1795235293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=pu+1Ikij8yBYwKlbnsfao8/o/jXluN07M14OjWLMlPHfcRgNfV8i1ansXK9+vQzfDi
         AVi7AmVYVw0ByXNDap7J2gVangWDERE4zf3FQQGKHc3guXhwiMZEOLZNaFfb4ofQOJap
         2LvoQ32BH/AHAP4VaBklvtbk+auwLQV+zVwCKBOAGRX/ffsZ4r/mNKrEuGT4O/nCLv1P
         61P1eQ3oxTrElp96VXvAxDIyIHZbANj1U1wX6Pd48qT0DonnNRMAWiK+Nw9uMYbPpk6V
         e/3tWNU3pyPBZyZNRYMaf8Eu5gz8qbXSpwC3Xbw/rUjScjOsyCUIqM2Pg1p4fpB/7nmF
         ljbg==
X-Forwarded-Encrypted: i=1; AL+hErEgFE5hzE9Za736+DrxpNWWV7/K9CYlzRxIu1RiG5m3/lC1UDr0tlVQA5zxg0h5+0mT7eHVXzB1wALC+2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cHgLeNQ2LPqKu2fyoVDnC+WnRMZ2OHuWJtjGKSZRQHb6nbo6a
	V+7jQ2z11jIE90RL+7FySti4kn6aDTp6oIzQSkp+m1HfQcGpebT29EGIDUEz+gGS8BS9CsiTdlM
	o7ya4tgar43yoElgj6Tscz23znOVbtxeAFiYqgq0yfCMSdYpkx8kfDha0tqHTVaNhifM=
X-Gm-Gg: AYBFou2bukTURyrtcyAujzpVV2VQ+dbuXDafBtO0gI36xJKAIAw93xcBFjiCXmu0u0b
	/NG18ubacE6ucJ+1QR8IodGMKnmh+1oShap+9iZUvQeEEnP5UIPhQpO1dg1eJH30ZmIKsRTd70S
	gEwhIxUKPHXajtFY3vftm/ceK64MCZNlEdP1JTEwkoHVxSsz39saus1QgIcyyMtkztVP7WKCowr
	KS/OS17Sr5zB78a9DG3jeDXiv6DBrwKbrPB0SW3oWhOpxo1qTihv4S+cClNri0Z15Fh61JqSqOZ
	66oLeIShs9hL/BxO7zmhxERv8SezvtP5iaKDwuAGPcxmib+x+X6lnlmltLf1IeoSRfIJ9GUAbfc
	3ZG73iUDgZKX1sEWmXjd61Y/+k4CLNGGW7JV9pQXYhuQK6XrEF49bcs3QGCsfR6ObCYmdKDa3DB
	JFiWRpt/c9yp/x10Q=
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499149eec.23.1794630493385;
        Fri, 13 Nov 2026 20:28:13 -0800 (PST)
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499115eec.23.1794630492711;
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm20332733eec.25.2026.11.13.20.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Date: Sat, 14 Nov 2026 12:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
Message-ID: <avfjVqCHXABFg4ue@QCOM-aGQu4IUr3Y>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
 <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Proofpoint-GUID: MlBa_VeKwDtUEIyvKpWHniiVLZ0QGryV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX2ddfLa2lPVvr
 GvI85gTNV/n8eNH4UW7wabGiqY0+gAgOJJ+xomjyE1HXM+gUitXyUP0g4RJe0xa/jQJOdAhzYeK
 jm4ndNb0rPm+SCUWLkFak+IrQjzVIQL9f5j5hkHUZIf3bPBBNr5e/ieSi6vfeqJlfb0kBU0v6QD
 WdlnvmdMkl9/ddfs1ceu7L2LR+dafom4rrqrH6FrQrnkFbGhWBzBado/NoBUJaX/CmrZ1rz64HS
 arKLgNhYMOfz6yUJicmX8gUUS0o9pyq3YtvsaNHA4nESOjzVQmUnsMuGpvQxH/9dy13krNxFNQL
 DSIxtMYQMBnUKAKJ1Nun3FHLIY901Hr68EDgXTrRS+NBcQNjw82Taijx1YYcXAy1f3LYoXW8usv
 fLURWu0R6jJRMNzavlxxMIQHytfwV4lYTjch5wOk850VcubG7wwPjwouvmx0yzCaA/kU3mumRgX
 SFYvun5w4ycJN2fnFmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfXzejCZEggVl+r
 ZGmCOyTgKiLFFb2SrdWmv9jUrQrkhIzyHeAEPDX6DSW2tD8w2DdcDfZJKGmrk5NHTxSA5g9YrWR
 z8aXenPLS/BWv3pgg6LPKSqBEywm3cU=
X-Proofpoint-ORIG-GUID: MlBa_VeKwDtUEIyvKpWHniiVLZ0QGryV
X-Authority-Analysis: v=2.4 cv=ecmo7LEH c=1 sm=1 tr=0 ts=6af7e35e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=d2ahPazU6wztV3fc8WMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140017

On Fri, Nov 13, 2026 at 05:54:13PM +0530, Anurag Pateriya wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> SOCCP is a RISC-V core whose instruction fetches go through the
> SMMU in privilege mode
> 
> The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
> in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
> mapping to allow it to fetch instructions.

This says what fails and what makes it go away, but not why. A reader
can't tell from this why an RW mapping is fine for a data access but
faults on an instruction fetch, or why IOMMU_PRIV fixes it.

As I understand it, the chain is:

- Without IOMMU_PRIV, io-pgtable-arm sets AP[1] in the stage-1 PTE,
  so the carveout ends up AP[2:1] = 0b01, i.e. writable at the
  unprivileged level.

- In the VMSAv8-64 stage-1 permission model, memory writable at the
  unprivileged level is implicitly privileged-execute-never,
  regardless of PXN.

- SoCCP fetches arrive as privileged instruction transactions, so
  the first fetch takes a stage-1 permission fault (FSR.PF,
  FSYNR0.IND=1).

- IOMMU_PRIV clears AP[1] (AP[2:1] = 0b00, privileged RW only),
  which removes the implicit PXN.

Something along these lines:

  On Nord, when Linux runs at EL2 it owns the SoCCP stream and the
  remoteproc core maps the firmware carveout through a stage-1 SMMU
  context bank. qcom_pas_map_carveout() uses IOMMU_READ | IOMMU_WRITE
  without IOMMU_PRIV, so io-pgtable-arm builds stage-1 PTEs with
  AP[2:1] = 0b01: read/write at both privileged and unprivileged
  level.

  SoCCP is a RISC-V core whose instruction fetches reach the SMMU as
  privileged transactions. In the VMSAv8-64 stage-1 permission model,
  memory that is writable at the unprivileged level is implicitly
  privileged-execute-never, regardless of the PXN bit in the PTE. The
  first SoCCP instruction fetch after PAS authentication therefore
  takes a stage-1 permission fault (FSR.PF, FSYNR0.IND=1).

  Map the SoCCP carveout with IOMMU_PRIV, so the stage-1 PTEs are
  privileged read/write only (AP[2:1] = 0b00). This removes the
  implicit privileged-execute-never and lets SoCCP fetch from the
  carveout.

  Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
  instruction fetches do not go through the SMMU in privileged mode.

Another nit: please use SoCCP (instead of SOCCP) everywhere, e.g. patch
subject, for sake of consistency.

Shawn

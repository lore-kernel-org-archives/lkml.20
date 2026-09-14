Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621240F720
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418771; cv=none; b=u4PvRj7bIJ3eqOqghXqTqhZf4T3IjPx/5YlDTvSC8gAiVU5B+tRov+msKI/Ox7yQmX8onNTphoV9YyCqNPkGqLBUwfRA2oyRTXa6BQ1fS8EC0nKSp9S+XlcyuB48DFpWe1NdIy+NjdyeQIqIAirb54p3rgYuGM5xIPDQnVxd2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418771; c=relaxed/simple;
	bh=QECm1NS8puAPZpapUfzYvzMKxDEAwLFS265PKNnFXJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQNC44dXG7Ua/XvPKHvLJHDvzXGoGCkRLNrwq/iC2ilCG4SPMchI7X33ut2hcqcl4yvFkNeiX5uLM/cgHULqcFetHMokSTYzJzd3ST6H/jp3nFHbTt80SMH6mXHMq0I0Ow1tLJ2zanDpv0cUhXtN36ZrvoquL8OymGpnHPeHzf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg7Epvv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoBQeIFH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg7Epvv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoBQeIFH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYWcL1012979
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=; b=Gg7Epvv5pxHZJIiM
	M8UM37gNuXcKbamAH2uo+QM5HBc0C1Jq/D4b8FygPYVffjNDMV9epVMbrLpgCzWr
	XRgvt8jWZNpHLkPLn53nHOdi7aXRdFbUIunfY3BARDD6wa7V8tTmYkNsFa1JTwuE
	GDey/fcoOKRLUQ+nH5jscwSH1pT8+AserRwsc/xoiYEWkiMhEMVYa2vbMsJWlOOR
	ja/eY5O5vrdaMzFZAAHL5pL4xtx1lALNufpgLZmKuCS/OizjmDaQ+kFTxj8wkhhO
	l7fvYttXqnQfqQdeEgAVGs1jNL2OknIKci5onCrL8DKK3JQoJ/lMGGyI2AFz+qgg
	0CCgyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqahvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:46:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d932ef41c4so3945635ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418763; x=1790023563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=IoBQeIFHcMjIcAjvVUs+8sESceFetxPKHh410wyd8yBmeYEDKjcE2MOEgPMgkNqTgY
         6EGvEqxpv15u7Hpy48+j2U2iewqPQU6yFFcV1KZPGB+sViPPVk5EtWLczZiuMzFhgS6Z
         p1TU2yBSaDNLN2r1zl7vlJYa56q1/3lQ0nPpQH4Yjf+ARCkUW/yf/Dedn2+C+/3u+Z23
         Xri3zTwQ2JKsslMfBXzwi+tTy1NJbtNLmFHEMVU++yAzqJaUzgtHnxz/oPSLoDNkbogx
         TnAkYhO7ANKhoDGsfAQb5AIteKWzLUMqTIx4Ls+Wp05dN9IoUm0T8mt0qC1NOS6YWfVR
         PZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418763; x=1790023563;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=eI+GAaVsPLeP7F0po9Dv+wmfb3D40wqcsXPyT3gRN84cn8XUBK9YZHEWMfcGHWoqKM
         7NQyq5eyvnnTzQWZhXA51t6cBqmMxKqmC2okcJKBrs3UKYA2frsDbuDsleOnpK7TP4OL
         UX+qxrgDqjE6t5uJURZZfeLlC+gDwpiofe0QsIUWKEj4dMU4lAraYpHilXnql9u6+0ZY
         BgBSQfYM9zfb8+4bx6fxB9xYeZvh/kTkWietxV2t2X1xdzIoPFATXSerzdmFSDbqByQg
         23sOxsAqBf8/Y3ezxnQOvmZ7IICpkRVnhHa6UCxmyixxPAq1xvggEZx2S/Jd1dC+mRBs
         fh8A==
X-Forwarded-Encrypted: i=1; AKwUvBzz9RDCScq3HNCyLELUNdkqWHqErTe9lYGP6k1a0wMXyQE2PxITo47CgVdl/bwOcaRd9z6YmR/F5Mh1id4=@vger.kernel.org
X-Gm-Message-State: AFuF++kh4vBND3qXzIs1Nooez1hGqLZywCntQihVheZR8wkm717MJiw6
	Vt7DPv56rLn8qLwLutYRrxETrR9Iu3dyHL2KKlNMuljbNCXhE5GEQkCS5Q58iWw8I86M6/8FsoV
	FEz4cRqjJDctKwhhsoBWm450z7lKuDLSqCUwtDCwodpmfLyJb//qP9ivjZHxv+/ZgcyI=
X-Gm-Gg: AYBFou1B1VxqsMkv6Ly9nmoWDWwjzGXM3hZLrg21vZtM/dDRk8X9ZMFFbpqxiOCjsra
	7ljA+d0noCHa5pZtZrSfBVkCA8PPakyiOpsB2Kan6ayDjxoSxbonU2x4A5wENwGzUKlIXOupOxW
	+tl106RwuEMNribzyHB+OcNVJrN/O1tWpm10L8gA2rEyEXsAoiAFJ5y2cAi7yI9lWQG59vkeqq+
	tFk9KqqdFTT1jyc3q0IP8X0QQwZ6rCxBRmagWqiukzSmwTCML9hNdJBSHQk3VaaArTL6TCnQTDn
	7xKoKUn5C1K92/yQsrDiwEED9noisjGF83fGAlH88OZNo9XRU7TFJ8YD/XgxpYls1w8c2PdCRH8
	MAwyASjGixEssfwjQ2SfK/hHbUps=
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12603175ad.21.1789418763410;
        Mon, 14 Sep 2026 13:46:03 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12602725ad.21.1789418762993;
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bdd76abcbsm4592622eec.22.2026.09.14.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:45:59 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <20260914134559.00004e1b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-4-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-4-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX7fSM6GAJEoVt
 dwW6f/urqDcosSsqMnS+iMA9x/x2GO3GRLZd9W/GP+QHF1lUNGN0GwG4vYXZY5mw7RN68FE87qT
 vx2BrP+TbB0k7tguhp94bUPOmUz0fOfoNLIEruzIuKfS6qx+40nfsKDJFIbaNLNKKgfzOYzsNUa
 wqtlqIZ7OdNFU6jpg4e/7ihvS9KFeWRbp3ntcevsXq2PgVISWRamvAqLEGAbbXGRT3k/Vwtw22S
 tShGtS7+AwrrLUWMh1nsxAFGydhfp6EolUxQRtq9JSIDcXV5N2tkzTGRuVukgVGbb4o8D1KVPrd
 eVCdObg9OqjIgL6VI1p1So/aBsGqEKnGBkSpVrgM5m+T2lBo9PlwJ/5sr5MSS1xYKs7hJoSt2JX
 f4JtVss0CDPJAfKqXSsvxjlFUb4OOQwBT+sl2tN+uWKKzT31ump3v06+b+j7DlfMx2XHwSFXnxx
 KX3LQdaegk9DiZKRwaQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa85d0c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=6n8XPUQpuYwtPrU-WrUA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: NW2Ozk5bOY4spW2Zh2Lmz8nX9mOt_DeU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX03HQUo348/e+
 gXbcCOMRaZZLrfijS+Zyq2+H9MNJQawy4DdM/hdPbHjOA6tlW0RuRwwH67VypzEx1pQwSuRLQz/
 8CydbUUwNgdV98QOP2jwKrMu/6ZjjkQ=
X-Proofpoint-GUID: NW2Ozk5bOY4spW2Zh2Lmz8nX9mOt_DeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140296

On Mon, 14 Sep 2026 11:35:07 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Moving the code makes sense and indeed that is what the patch does so
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Trivial gripe about the original code inline.

> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/include/linux/arm-rsi-cmds.h
> similarity index 69%
> rename from arch/arm64/include/asm/rsi_cmds.h
> rename to include/linux/arm-rsi-cmds.h
> index c1fab41f671e..9e8a8c189ca1 100644
> --- a/arch/arm64/include/asm/rsi_cmds.h
> +++ b/include/linux/arm-rsi-cmds.h

>  
> +static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
> +				       enum ripas state, unsigned long flags)
> +{
> +	unsigned long ret;
> +	phys_addr_t top;
> +
> +	while (start != end) {
> +		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> +		if (ret || top < start || top > end)

Obviously this is just code movement, but why eat the error value that
rsi_set_addr_range_state() returns? 

> +			return -EINVAL;
> +		start = top;
> +	}
> +
> +	return 0;
> +}




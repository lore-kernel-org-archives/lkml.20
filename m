Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932665;
	b=ympuuss9Xek/gQ0jaTyrekjBvgheF9Vqe1d7j/PccwsY65klNhp24+gTR7KmKBPeBfim
	 rAJY1AtU3UtsJn+mnrO1U8cPHeTwIAEVulrd0oIiwt+NO+rzjWB3B4tCFl45IlAz1TDZX
	 Y5MkC2D0m5xLSgP2x10584WKsQ3G7ihn45fMbIKWqXg0aeOv++xLhUOa6+mCBTUxm/Rqr
	 6hff+tufHWqOuR3YZLnG0gYmg7TISXk2mZjbhv1+BJi5kc7wdIRZz+G9m+kUsV2DQZpB4
	 PjeoeSMYa5m6kNQ9lwe6muWkz2o5h7OcKq+hS7098yAKF2C8F5vccC/e0XEawXMzv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=;
	b=1tPoMHMj9xciQbPPuSMDeXWwS5wO9yXb3+hpsgA76B5J/CpiOKJ1PxV0sWMfjaP7jPrI
	 1pGJxxZtAFOnhEYd+6GZf+g4V7f/SA90h+ZDrEFoliM4koBI+tD6lPJaz5XuBwG5kuAmo
	 ICelu8KKbJA/8yOKZoMtfTVae/TBX4LSNvMcRLuGg8pyMEn9OnbErh3Lq6x1uzsK7xiVJ
	 1SOpQpQ1pVydFbRVicV5kNJ4EmX0or8MnFrbCJMpxfr+OzjgHekvjzCh0TS2d/t9w4Lui
	 RzCpmV6wu90TerIA8juR12Sg5fNCI+4gOlAOB+5XWWEpE95xydJ1X841TrAp6qf5/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX3k6+o3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNHQFoCl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44292606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44292606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX3k6+o3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNHQFoCl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeQpM3215980
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 02:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=; b=cX3k6+o3+lNfW68K
	1HZ9gPO/cBOMoMWXrqHloeDAdwqEvFoL+a6umAhR4QOJGuZqnPtmsYX70V/ga1Ik
	Q84v6R07jUToYDJI/41hB/aYk5rdeaPDymcXeR3/2CR+0R43IbpkNf3z8csIMzux
	+8v771YAiUIuHtaBDf+NVTzD4jhr32Er/gwFwtujCafwkUcCjK86I5OC+wxhDzJl
	SJRyDilDwlXQRwUZmkfWluevw66pEJENDohem5XgJCEcL09ma1BPRKu7F8q8k0xe
	3HaKEKiU1O0CiRnJmsa5pcqOivJRSAeDvdNE4HGSCRz1GjC8WLojmmztQjdseV1U
	ZEcPPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9rhgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:37:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso289802a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793932658; x=1794537458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=;
        b=FNHQFoCljYdgIq6QWhZ7WvAZuPNsF+F4zLRH2XzvEE7fzzYfd6HkoBjxrrjYMb+T0G
         W5aB7nij++nOwoEFfa8d9+l9PzXD/XxAojteHhnWVIvJHx0ik27lwPW0UZ1h2aewcErk
         MBF9HKduMVyq9yMo0la4vh86KRYEyl6XpmOc5DA8EHCNgTzCq/TfhHZZmQYpTH4VAQ15
         SvJCNny7ORhpVhKTANaKLGMLewiq1vQwiDVNkrtlgq6HWdx/KPYw9mUddOefSoMzeaK0
         rRlXqBrMrxPVPFHGLhMkTbYMTr8QCcvMu4dLr3x7v7LyAa8k4yPhfbIlukZgauDZjdmi
         p75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932658; x=1794537458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=;
        b=MZGBEWYI2jmkfEFNfkzsWzyUugC62QGc2GSPY8e54d2Ju0vq7Rk70z6SietUVambIL
         V4cnPMiPIvzXloPa6YWjRc6FITiFEZV9iddHwPB2lRYRwl1JDtbsRP2THGySflnPHel8
         kpC2hPxozYQeKI+yceSNUTN96RVC5L4LfsRY86argQ2D74h/MZ+J0OvrcxBhK0uFID+3
         7Cg3aPvU/KjfTRMA62an1FrQ3p67xv8JKAlB0ozwzwpjTgzpG6mpyOGJFG/sQqdU++k2
         w69WnnMSW/iXoCAiYpX1N7gg+mRb76woLje9p18R0n8rNfdnXGQmsLdaxwDrTxbB46f1
         3Mxg==
X-Forwarded-Encrypted: i=1; AL+hErEsfsW8QKrVl6984PETTALrdVRl9d423DCckXo/eWD62A6QkNApqcxiacUyvkffM7d42bHzFsf4DuUrfbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RsMfUFxHjMFsUBlU0zSzs7aVaQG70VGDBmvcX20PB//C2vU76
	Q8XlV/5PvLYvfYkBr29cgiIZ+tjNu8r8LQFKa0M+jNn1xcD1Y3QH0MqJfwWgpJyZI/jIv//eT9S
	KVGrruQ+EgDJ4UNiW4CNFcVqfrbaOhCE83tRB/aML6Zn+wCLGx4wRq8gqmD3t+O+2Xa8=
X-Gm-Gg: AYBFou2tDaV6pqvVNixJPeR8Jdy0L0x9cHJPzqCYaNbQhkaTDpLQv/mgfEd+U+dDaaq
	aFz7w2lYN7+tB5bXPpl49werwEfTaQBDw/9rWLoOeUtW3pIPkLFfc3UdoV7T+D1LkKRhZho0o3z
	M9UFdUn8LCfhXMF6oDKDwChxXSW5CkGkrO/AlNcZbR7+5LaeO909yzhq8GTlcg655A5ILggXZsF
	XoD7f0QCCXDYCfuDZoduPC9KAmM9Q7RCbSxLEOE5Yx/u2Q/09o6xeJhWr/9qX5BL2jfRH2lDKUX
	5QSn8OqNfUWVW3MilNjGrPt2h78CF00b8+U/aRfYH91icCd21lHzNwKIK94isguodeJlinccLJG
	QzjkbidBrCDvOoM5JazmfepUKJKs344PvrppyEVj4JYfxSwUK46OCBsuv5AcAHCS5BFKFdLeVc4
	cwwaEaUnLiy7sbzQvOeGhdeVVOlcinkDFL2Tl+xmbReiWbxw==
X-Received: by 2002:a17:90b:270e:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b0db6dd119mr1162558a91.41.1793932657763;
        Thu, 05 Nov 2026 18:37:37 -0800 (PST)
X-Received: by 2002:a17:90b:270e:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b0db6dd119mr1162518a91.41.1793932657155;
        Thu, 05 Nov 2026 18:37:37 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm5705831a91.14.2026.11.05.18.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:37:36 -0800 (PST)
Message-ID: <108d86d4-3b0c-41e6-9a2a-3cf34ccd924a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:37:34 +0800
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
Subject: Re: [PATCH ath-next v1] wifi: ath11k: add usecase firmware entry for
 QCA2066 hw2.1
To: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX+Ut/RwhUTPp6
 ykG734JXQVkwQSOS7UQ5giy2Zhjd1RHLatclDrnJmcC/2ixpNTimSrLBIM3kTmpe2geV1ujGrEA
 PQ4Tb84xJZSSKxJ1sDnOT03fa0WkmE4=
X-Proofpoint-GUID: zcFntGdTXsv1pvEO-Bx7dFIkrcvI6SCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX7PX81mxAHA7S
 IL0alBXB2j67EDgZEEXY3NOwDcHZEKNtZx6LrFiqQMqaZBGFXiRgcmpuakOOYeJfUBOIn6t1NDb
 byz07R2szE24VtZtHmvCky8j4fcYqjtQnm7wDcopZyBGNC6W2ja65CU0o7xNALjS67IjzdKc1+s
 d3U23qP/+UlhM3xYok1hJ0Lq4GHn+nLsEyPikfHmzT2/eM04AOKyM56gSYOrCb+vG9c0u8cMpUu
 61rc2R7MaTMbnloDaIPapw7P/0hKplLpVXW4Zvjy33iF8HVp8GmGJI12ZHjF8It2XAjqx4fpCuN
 SKNmPcT77vSBVpBHhhsADTE5cj3cFVALru4em++1I6KS8u3LIppG5V4oE+sGFzRIHerobVpKi+N
 O6omU+2kKrr6b92C6b6lad46FeyDERhNNzpIgDVw8pS+8AWKDDqR9iSWBFqpUEX6o6AEUoME1uC
 WLZmPwOjLNcPKmXlf3A==
X-Proofpoint-ORIG-GUID: zcFntGdTXsv1pvEO-Bx7dFIkrcvI6SCV
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed3d72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=38uOJd1x8bnEsvVciosA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060010



On 11/6/2026 10:08 AM, Hongcheng Zhang wrote:
> The Monaco Monza platform (QCA2066 hw2.1) requires a usecase-specific
> firmware variant located under the nfa725 subdirectory.
> 
> Add a new entry for "arduino,monza" compatible string to ensure that
> the correct usecase firmware (nfa725) is selected.
> 
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613180;
	b=Yrt+IQe8X3J+KqayO/0Lm1Z0hU2yV6nAUvgBelirvhrV3sSmdIAEKPWcFVmjlNY/gin/
	 CXl2ccJtlUTbzTIEdPxEVAtK+STxNqVfJvo6ISU0WTe0501064UU4e9b6yxrxUTCbNNuO
	 gbw8Jx2a0XKmXFmOrjwWf4fZzN6WJBLYBxxQKgbMKpEVF0yKlSu8syiaGxFvj0cJGwu2K
	 KaRkLn+kA/b6WvAQN7F21LdWBYVWwrsF3l6+7R8OtRUcxqbmwv7ad2Z04LZJ5JkxvqcxP
	 LB8sY3pbShQv36q/zOZGjpeIsR5e/Epq0y2J6df5yvJoZu62xvObrp0EHtekbanLthg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
	b=e+YoCXgXwFqcGFNDuVqWIaK1Th9Hxwy8LJAsqGTuI9aDbvWyf5UNvzuQjHkuyoEYCt8+
	 /aillD1qhr0/N1T473SWUygSMxGOoIsLDx43swldCndjPwJpZRYuOb0OzUOA3dm2qnKI3
	 WXVEK7dJZtUTW/DF0T5A8C6t3Ackiy22IHdcQ+KH5aEbUfH4+c3jsJLZNdep918fl+QND
	 RFJFNK/s2Zk5XKAa9pDIC+NSVsJ543801LwJZ1YgT8v9qO9InoiU4ZPTkTqELCeUQxrE3
	 IQ2Oa+lxRyZcUSl6as0vBPQfFmS9x6CS2YLb8PPaD3GoitpfrywzsdBRtU+k1y/TVpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0jxRsf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHdrYW5D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBC606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFBC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0jxRsf6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHdrYW5D
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOjW3086546
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=; b=A0jxRsf6GUjEBSyj
	NvAXNYXryBlm8tFkVuBHt0ZA/6r9VkWTV0G5oSYAf/GxFxVWMgZ9wkX2L4GU/09R
	FgcDx2rijX+Q1e4woKw/gN1AuBGu59l2RHrGzUdAmii27pmHlDg5yIImySEo1eKo
	yIeKqdwlbRKi/7JERV2o7QsJj2OAc58hR80VpuqV4kVxZDIZsqHLbpXxBLAP7E4u
	jAMWET0satj3a5D4U4+jaSGia/RtNpU/0QuTFYQEtxY8aHZN4XxUanzRL4rQPk8j
	K3/Oa2IpiYFHqfp/KZXf4nPXBK8nJQm5BmC0a5XJn/rk9IU67Jurew09TnPA8P2p
	fee9mg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka6173c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:52:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so4532631cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613178; x=1794217978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=aHdrYW5D1PORcOd5lteVvXAsuMA5wKMpCIGPbgtBdTF+GB6MSdunrzvH5kI9czKiVm
         2R2Vdv1l4JnqDIP/xsceF8XfRoN/3daJc54/dxYGRVlfYkMjuYZhVfTzlewUueyJ2jcm
         LJEDMn15hlI0aLIr7XtXkM5musL9vco3StxdlyE1lttkL8dYdLrMr3zihXqmeWi2q+Zt
         jIuNql78skhcXhSyC8h2GMVvBmNivaY7mRvy/AvgSLmNXrBO18A1Jxz5EwSHdBzFj5iU
         lpJLxZ4+ByupT1569/8KGllq2MHp3a7rPIUjfQ6zlMQ4InCZSoyhkUS7ZpbRikt8ezMu
         TuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613178; x=1794217978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=UAxOYZnZhvI/QSVY54thl97tpiRc9u7tEMswGZcWPELEVX1bGFvkUTKqdS+TtD2Zks
         U5ccxI/PeN90ssrSr+J/6W6ecVMgGxllD8R0RwSee7fS/wNY3A7zN8k8fty19BQvbKOL
         45wEP9szsQ10xfdqZGr3dYAZvbwFnKus9vsWVrJ/hfbvTJXzW39zusj0I7HH6abUqimc
         6J12PQ5IDtUL/5u5zIONT96aMr+2UgEx2RMuvv7N6/bieS40eeetKteCPLMBgE22Wv2D
         uI5+Mf4712M7MYVRi9L5s1eu8xc/z4Bq3PGCKfvlnda9lvNoOQcmny+kNQKNuG9r5SSK
         heWQ==
X-Forwarded-Encrypted: i=1; AKwUvByUFjTJyemNaH7gsbKxvPXSV+vvBrl+4mAmKOTg3sU5w6wHnvqmpx/o2na6XJL5B8T6tB1GAVsBtp5W954=@vger.kernel.org
X-Gm-Message-State: AFq9FYInxKLKTCWwMWJNTgBhiFhzc6wVBEVuKQK5mWC+H6Wjtfc2m0Zv
	tcJuZ/Z183zmbs+wbQVD7nbRKPr+/YWmDs8RRqMis6qFgJ2EB8ZRY2fZRWBjJC/pv3zXBEZ/g5c
	xunO09RTe9q0Q6rM53c1QtWb3fHLCdxF33amzmT/7/1sOdgTCw4FSPULCM0nAOYIslMQ=
X-Gm-Gg: AYBFou3WN03FbTJKwgtZsFCQrLMiEQqOr1Isw0inoUVKU0e9lG84ZlSJbEsevm+vC8n
	PDMeK6sHsqFJmPCkdl8g0SSKSgxlZdjMmjMgJJ8j8fHN3MsH64NjX7aqdv50YIgS89QoEV494Fx
	48NceY3ZVXpOdNuAWXBTJQ85mDgBUJy5Td+5m2MaWXzsNlLTPwZgFtxDootMIpI9BSYGeCHrNSw
	QNT4/jJmgBwwLXTs0jh64pvCcad3LgPbmwY4jciFm1lepXwzGFjFKNNINdx/ijSZXNj2IyIsBD/
	3mgWbouIEnG6YKvsEbYLMNAkVkxXbqsknzMOaHLraMFwlFmWi8ivEiPM/vfcuu+qIpAbaf+Uvj3
	NBFfn0qAzlNlUQ1l1qkJUYGWk99dvZd6qZ9AgEwCVrmbwNZqxLyipexwvB8sjzfOJejNB+UQ=
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483715785a.4.1793613178143;
        Mon, 02 Nov 2026 01:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483714285a.4.1793613177588;
        Mon, 02 Nov 2026 01:52:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm364558866b.12.2026.11.02.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:52:56 -0800 (PST)
Message-ID: <c8810f27-8a44-4ac0-9c93-274894eced61@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:52:54 +0100
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
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SDycMITwlfV0gh1ZVr9_okqQjX40BJIg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX4YS4RxhtpM1A
 +WFRNXcLYx3bgjbcPPMnAZtdVB4LK8vIEzHg60IK8oQMy8O1VrJOVa62ojXdq2YzLjrnX0GQOkO
 JSIALtqBcGhpm4bfBU50baQVJHLVIMs=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85d7a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1ACtxsPTqu74CH8WC9UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX5957JCTyvfkI
 Vavvh3UFojJfQ0Ovnq6lr5djSYA20es9LDl9jEdrne8J1bbCAOi5nrSLHrzauwFe8Vkt7kdyWnT
 HLLkzpl0ytbZTXurP3jOhuWokBo3V+VJzsOwR1Mtd6GzMOjIjwPoZahOVfVWnNwnigA0C49cPji
 gUJyj97i1XxK0klOI+1wKf9M5EU3+ItuBoDnFKbHg8tXLQLd1Q6n3TrDr4j8obbOeVIqSOFuxQA
 VWxINPSfd8Ukt4mkzXs7LMWqdax8BF3oy4cagBkPfkGfX4chcid1vSLoRm4/mfMB6MFnbSddRfB
 vUrHe7NrlHbc7UpcihjJ/eSB1TO4kg29pmOjTve8hBhcYx1RCwfOzbce+gJNPcV1on4JS/dbirp
 6gn41ouV8Nv4U9PJ+q44idCd+6ZsLc6Uf+uOQKd7D6U8JiFFesJF14qiciTanviRhdQoKu+dbmW
 hYydVXOOZG9KLSOklsw==
X-Proofpoint-GUID: SDycMITwlfV0gh1ZVr9_okqQjX40BJIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020039

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

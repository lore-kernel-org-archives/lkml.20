Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776246;
	b=vR+9Ehsc0WKcL6D0n6ko5gXrpZ2S5w63gUr7sN+dzlGJSySlnFGpWYaI4vEz2FvCVbIu
	 nC1rbdmZZA2LEnB6RqHTecbvWmGZB/kjkcYvqqxA4E0+KT/MFWqdOVl1LYnTxA+Tqx955
	 Er5o32LBonkDznS2eLG4efa76swKOuvXDFDx4CbSo8Fo0ACPjizMz/BxMX2y1BjOe/T90
	 PLvtN636hVoj/EcKzTj9JFQ0o1GyS+7wM0cOgpCtsJh4Uh/2i2l588th4X3uIboyiRhH5
	 Vm/T7nhbNg4lYnUaTer02ctqAvllNSay2iSFXKLzPYJOJcfK9wHW8ioEc4TlcXP2jyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=;
	b=KHQQOCv1LUgr1JerUE/vKw7k1y3oEqRwh7vvM4UJwSB0gJUEd+hnYBC+jE8JDe9xyEpd
	 aLGCwPX0pWYcPfa5zFZH631XlHPDZA/ThKu8pvp2t/zKGhPF/zz97McmdXMjkSGWaFtPX
	 5sP1u/YxXdSIZaeA8D5JhGvKCZg4inYKDUmbxP0GTTFyEjQPCZ+gGDeKNyMhjlddjxxQr
	 l0SADuPfWLzSGlwOjpwXLYzH57Vf3OlBrXoLaE5smMn7FF39mtmvaYTNQZ+YbtQM6IEXu
	 2NK+q9j7MSWA0zNi3SkzdKXMOA3407IzvJoWWN6s8kl/DRzl1/OZvjU3GqKXfYMSduw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvt1Ofbr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtCplkE1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3C606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvt1Ofbr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtCplkE1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46x5J13335539
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=; b=dvt1Ofbrr58NBoVw
	WNP/pnxH/mRsjtCRAX6ocamjOFeTdkZDC4DQPS1mNiZj//P+LXiYt7iLT9qbgkq2
	98T4trQn2Q15fOshFyM5ZKbXG3HuT8B569Issr4WXu8sBKcmxpgkQHzFsfKLBZ8W
	jgHhwg4a0Fj2iIxS6gJPxhig+rVrHzOBmtqNgijTsTBvoEupvdnn8ELRCmOA2pYI
	a1lBk/lFcg2+LTHf0fx/XHoQ6s7F8zbcMQCdgXGiotMyHuZA+l1nZ6RuSs5+QuZY
	t8Z1ptb9ShbQd/otJNkijy+zst9M/01opeE1rpq/X/N7dCtSJnGgv8njpqb53kQK
	wPvstg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtq3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:10:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so5467715ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776244; x=1794381044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=;
        b=BtCplkE1fTO6ZjkB2j8sSDyXFAdG1K7CA+Os/bc+koWTV0mwzWB6utIrW+8kWqJbP6
         /1f8wjxVSM2nVMieH4fJ7CgjSYWIfYKnEuRNEB7ynCoTh0kn88OdMNABzxVtkwnbF9Q0
         cuZdQxBYzTuEZ5FAVOn0qdgTxEp1+76aIlC+Q9alnq0jgUpVBJfT1SnTCXuTwrX1SNFC
         VkXXKZnR3osx40mRuRLpG9E72woNs8gVML9sCqC2N+Lgam+SQWJ/PFe+IJOvAlVqJAMw
         7ry9j9ceGuBSaSSprf3vFxr2QV8PIZKhlWEPppqpV0KEIp0nEP0twU4m6HEYD1qesTwx
         MhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776244; x=1794381044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=;
        b=azxQwtCZnkiPQjNhDFWnDERm2LoSqENnF72zsiGP3vxH73wFTtVD10qM61qm0Py0bO
         Q9wFRoF7RSk0sPHW1NqG61o4PC1tZ7nf3GLUB3fzp8UG/FQZaJnk2SgTGM6QPFVN8i+k
         lz+E/PVSAznmH0ezHa8U8YzLo7XHMgVm6AZ5uWqSQb+dZod6X6QGeC2rjrwCSj2PPsEh
         Suu8ERUIXnrnjtX7iQ90U2bzj6PEgziicit07OwC3Inn5+cVobjcXOMb8rRvGihSq30e
         DVBYmA3UZTUwUpUTBSxW/DxBEXd4oudkSsGkTw5/XOjQX1n2KfSJvmN8Zf3x1JPY4tOB
         T5hw==
X-Forwarded-Encrypted: i=1; AKwUvBxdGyGSgl6tgm8VcZOrIdQIm8g6tgvlVUuWzInzQxEgu9DbKxsJ+mWasNd2hNCdU5gFc1gam9oL6BbiIAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8My3zqax+93WX2wTlHQnWlxpPe5K/WMDZXUPbpnAjlBxM+GsCF
	gG0dMhyQU3jxFxYj81Fm8qkwKenKfTr3JTvK7BEDnu5J090Glp8N8+Qo/65zwJsgEpZRL9mxLfn
	el/7YC+Tp6cbd13gZq/fdF6xlafwH7HAWp47GdY/0RJrqXoMNFl1t1Z9uCzYCtX45yUiCQpCwvt
	g=
X-Gm-Gg: AYBFou0Vly8gnTUMleweHg+zBQt6cgXotgM5fqxnzsr3ptgy4rfdM3hvNyiqCVsiPDF
	ggIcwV7fypeIAu4z1S3F7pIWlO9AkrtsY6qENi6JptmkH4QXQY3/PGk4soWcJMACyUfN35ROIAL
	EU1USIFPshwB2EbYAIRCkcY4cJnlCURy1p8JlLOixvW2qPY9Ay3yzJFxiTdIwLjH2cvMddosQHo
	OCLDXpACJEheyGMSmUTHemv+xGkJpLOXnzYfx96OEdiOPLjny/KG5znlEOEY/uiBIiMwg0rat4f
	aD5TtLtIELEbdHmOl8dVTX6SsvGr91afwZ5CGUD1OTsfQSaI0RPtNHXZb2We94dyWWJJOhUHkLY
	zWGNQutTcbuG5cG7K1QsUwrhM4tJxhHDSdzIvadkFVh4Q3fHjYyjEk2w9atove/o9m50hiDdkT2
	JnnF4iUgTd
X-Received: by 2002:a17:902:e788:b0:2e9:7ace:ccd9 with SMTP id d9443c01a7336-2eb36509c20mr146988965ad.52.1793776243973;
        Tue, 03 Nov 2026 23:10:43 -0800 (PST)
X-Received: by 2002:a17:902:e788:b0:2e9:7ace:ccd9 with SMTP id d9443c01a7336-2eb36509c20mr146988665ad.52.1793776243414;
        Tue, 03 Nov 2026 23:10:43 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091cf87fsm3641085ad.67.2026.11.03.23.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:10:42 -0800 (PST)
Message-ID: <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:40:38 +0530
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
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b8589qwRVIlQT2UsY1VSbKT75RWaiBb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfXzj4ajSHZD1ma
 5hrhfcJCJVPkp8PX4lfrc+8JTAOjQ2kjVNfoABxajXHp0F+2PeeJdrml955hqX65uTLluNSMPhi
 Iobbf1UqGfbvwc6njkE6rB18Z+eSIVQDkkKf5phimnW3hqacBwRdeRKvW142AnQa5bjL+EZXcMN
 yq4chPpB+yhRsjfcrhIHBdu7iGmEHQAau068LEMsDBGTB685p54j7p8Tl4I6c1lVy2Ze7QKkyqe
 jwMulBFqjN7UdG/Km7k1TbdCgui6GRchp0eRgz2YbonA10yN2ZL5JvJ9ELOwuyIZlqwFdfJ88ov
 U4Exnia9LIMToKx+DIkqTQUKQ4KChSG3JcvhsWrbIwMHqeT8nSG5aI2Lfnii4A03LDO4IUoB2nV
 BtogHOFjwm5r94kbjMoX+UEEWD1je7kegGLrT3YzxJ12tfSHknkSTO2vztjZYCnuK2dSFjm1lYb
 d+WT14f85f33+t3rsyw==
X-Proofpoint-ORIG-GUID: b8589qwRVIlQT2UsY1VSbKT75RWaiBb4
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeada74 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6tpJQmiB9JWEHceHjxYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX33p0A2HrpIe6
 zBM7RvZupG5/5uvxN0i6vZcm3YY0OV0hDTm4VNl8LteyyxTB2Wm5MXbztZO2IUx2877pmy+sudc
 V9SabR34b8JeUIMeDaan/r7cXVbmAWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040028



On 11/4/2026 12:23 PM, Baochen Qiang wrote:
> 
> 
> On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
>> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
>> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
>> logic for freeing a DMA-coherent firmware memory region and loading
>> firmware into it. Factor the shared logic into common helpers.
>>
>> Patch 1 is a preparatory, no-functional-change rename of
>> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
>> is also used for the aux_uc region and the old name no longer
>> reflects its purpose.
>>
>> Patch 2 refactors the shared free/load logic into
>> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
>> rewires the m3 and aux_uc wrappers to use them.
>>
>> ---
>> Changes in v2:
>> - Addressed the review comments.
> 
> this is not enough: you need to clearly state what are changed in each patch.
> 

Acked.
 From next revision, I will clearly mention what I changed in updated 
patch set.

> And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
> this post? I don't see any major difference between this and the previous revision.

Based on Jeff's review comments, I have cleared the paddr and reorder 
the function definition. So, I thought I cannot retain your Reviewed-by 
tag. Please let me know if I need to re-spin with Reviewed-by tag.

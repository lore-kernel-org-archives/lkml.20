Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5543785D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978324; cv=none; b=U3TS/gpWG4xmSS2i65bwnUFIwvPuCnVe51AdfgB2Fmt3FaxX3ct9ny5lL7F1DO2nuMfg7S4rvsltC5Zevs5jJb90L2ys4b0BOz7X6owN5SjyGE/AlVogzyB8/zMlpu3dN8n6AupwnXHg/pF1cC4MNttMoGVMjTAM9wKtpYwAIrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978324; c=relaxed/simple;
	bh=hv6VVt9whNtlHG/YPurYOIIccQeVJr9XxbDW/ZaPg1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsneIJq74QfHnnPYh7QYyxdT+0Eel9czQ7GsARBMSJDXJMJGYP5vooLWtHo6H7JP67Xsh5AbHoPuMpo9qcgYQ6q5I/RruxnUnZ3YV4krri4xqUPKx/qswFTZF4bhXdZltT+KIHAGf8J+dUonLeyUCjZVAGnkTPHrU8CrfHdX9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owNShZqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMYpC0bx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owNShZqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMYpC0bx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AUdL468487
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=16f1pSPll4Ie7DhW8oY4ccee
	3J5/JdFyisY9FHHi6Aw=; b=owNShZqmzAmcVUGC9uRxPen5rY6jSWOnuWyXKzsE
	9K8PGrZCO2tazZMqJtUSS08LkCUnai+WW2PwGqfz3wj7l1b8QPzD9WUccQKntN34
	pXya7HU+ZDuuIbTl+Lt37JS08YN4a0riIYUvr6kTr1tAIQPFeG7JDYN8MwrO0RW8
	FrSIfNkokOgbQlMmUvlbJ7PxsObDusQTmjaoPslbzxNDfOLTJ3x8LiHtgx4BMbHA
	GQvrCMrSBHhWV9lUZvmK2d/pgvL37h3S8vPAvDA6F4T3dbJ6yRNc/smM4C67igHX
	Zu9NZDOAJl4gIxMjApWylB3TYNT8N3UdnZ9xpnjlEWSbPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9kt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so675804985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978321; x=1790583121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=LMYpC0bxvf88n5EeBMfmvD9Vhg5TPxbqPskQfRYesl9YMGwb8g2NcEJWsjzeb8TNWt
         UN1AztYYcHlTgNzTDNYdfhhPdr0nqjsPdGonT7+yrv0LpU5sPIfaomGTBTRavTd4CaWJ
         Nt3MJ3BF4zXO2bePjViCtaASe+zJPOwMQ2559n2uOeN13wQ0ryUrtAeKKRMhFVyIq0Ag
         sf+6AuL9QHx77tJubm/JT+cGpcf+3SvDWNWtoepmn2F85EjTgnQbmjSok4i2VtrWIBb2
         28ElHcEdHGOFJf/1q2MBEF7ai5C3SfjFKvUjxe6LuLHcx1QoxXJzwfTmvBMFImvIFp/R
         Ocng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978321; x=1790583121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=G6pEisoQoZ2c5cz2oKtKdgJi+jLHFia7lc52sEs5uxN1iZgSiZePkieGaxFRdsVkGI
         bgUFvOLTNeO02xjYyvXT1kzxBuErB3SPwbl7XZsNzX1k5Rf/qd+bUZL8U8I7XEB7vLC9
         oWr8NNHB4ghfywIv55CyTZRtS/rxxMu1kCdhWSMA0fCb6swmGj6FSL9trmGD0CAlrbQ8
         Owo5j+dSzkJT3Nm1owsfQ0d6Q20945aHtpchtEdSGkHAtHQIgAUek0VSjwXddSQv+y45
         vixcTEs9M3Hubss5dAY1A8VSRJjh8pRHAdxAksfamwtaNjCI69ZihLPF4YvA3Swy1a0/
         dLbw==
X-Forwarded-Encrypted: i=1; AKwUvBwn2nuTbjvbFzWLFMO5KkpNmBQK0Wa9tKIjDjqjd/ZRnfrPAYVqv9J7/Fn+c4zszcugw2E5FMdqHw5AgSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nD1dvxT9RN0V3Nvh/yOQCMiOH8bM4AKYGg1ueAkd19wueN944h
	/Xx1leFuhBX3SCy1yaonKTYlgBlhZ9yFBQ3BitT3G6R+hawBECvXvWZdpv7U+XFeWVeUPQAatff
	oqGD3Q5Sjg3V76msj4pPVm2bbWyA69aXqPHFW5h7t5RyzlqHwP1MoYg8OTyVHhXD58oNcb/V1q/
	8=
X-Gm-Gg: AYBFou0ace1e8N/OKmkYyHDDc+6ykLDVn5AGAqLx9Xm5oYKK8dgu5J0f1vt4XbePnJI
	eYJpQAp9Vi2HKU4yzhF6a9hk7cYPmnV0Z3tleJUcW4+LOAOYBvfkurxEwIOAJBM9w+BpTeizfO+
	rd+zfwwsvpnjZBHELBspdZeJM9I9ggPgttdMPdYl7EAbzlDE4T+EqM6CN1ciMx+z9bieI3ncbk9
	LPA4b9PP8yTHibChJCpUwkblcbrzznwC6ZzKELAEpGzIusCLLasY7CDey1j3pKd3s4hq/vzPiB1
	65VZ3RE5vs0/3jHCJXNifpZj/c1D5yt7LpHs9x6xVwjflNcNT3JRxL1JDUkGm+xQgjFz7zxEAVh
	LE8eoDBOf+qPBdjY=
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866680285a.27.1789978321297;
        Mon, 21 Sep 2026 01:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866677485a.27.1789978320794;
        Mon, 21 Sep 2026 01:12:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm581367415e9.4.2026.09.21.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:11:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:11:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
Message-ID: <wr5s2uw2i6tdzmm5v26uzq3gdyttynqzmkferakol5m3oj2uw4@zpedm544t7sm>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX7Xq83Rr2jEAK
 N+9OVY5FFbeHEMWcs2T+SmA8aYud+XPQgnlWXkG9x4rIPCGCG/6QEUZ/gv9pwXuMXfkjd8ChIbJ
 ByWAVJNgECTMLkXLrW/BJJFWKGgS3xHMTacw1Cb8Nq3tiHHQ6oUvsOytQhYo8F9wiFPHtToi5T5
 Z7ZurpGpPCji4XnkfvHO0jeHJcepuIdWX2yNOJV/74PLv/ygxX3yBrJXSoJH1gVYui6EqNo7yu2
 oYtbTWTOUhV+V1WsJ+Wzr7waZiJIeRDJHUvCzTU5UHgIJkfw+VGjR0GgflR4Y8faSP1APBYr9Xd
 ZO2JgiBVozU7jNHbSKSiQcjvKvdC2O3N68EBUdppyNugmNW900KmFfNOzyzzYC3GiiHx4AvAxBj
 95v4/uuG8O6nmm5kRvLRkLhpUUxx2ivduaFcjEGj2bqDP3BGNyfiQVew16hyA0TFWeUGVtUJUx0
 Y4pj1MPnUQrTWf7CrQw==
X-Proofpoint-GUID: FuZxqjyd5E2JTFf_oHeriGKlYQvY5CEK
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0e6d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XreJF-S6XE7m8f1k5BYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FuZxqjyd5E2JTFf_oHeriGKlYQvY5CEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfXzeLCYpUNjFKu
 VwPhOo4R5MOtAbpkkGp2fGuBMSl2cBeQTPqIZP6HW93DoxXH3iwsVHaepoc7pdeFylPxfZuYXlK
 ktiozVDYYr/9TWwjvzgFNAAYYH5xt3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210116

On 26-09-18 18:04:17, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

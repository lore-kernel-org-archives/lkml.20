Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67293D7D82
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462187; cv=none; b=eBE190pBfdO6+qVignWzCt+xrGM/+R/picmwmy8qQqZBKaVb5zySyIYZyYsGAgs+MwZR35Si2ZRpqofitBicGYjrONlf2X9lrwCUpypJBxyB3ps+5QPr7dWOAatVpu47D7cZAr5EvKL9iR+Nsxsc5f5P+7a8Vf6WrQLyy60wEDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462187; c=relaxed/simple;
	bh=XT/qGuH5ajK6geTMTnhbyJi3t8XJB4xQfx54BBU65p4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mS8Rk1rjv4OK4NWM6uS4YrcLxEpDGSIGzeUTCZQHaIg6dFelYKqkcw5QF8C5igByPqLfMSZ2Iky0yL6KVNeT95EKiHkwIAQsD3hCoMmo7pxcKsxjZlUap5IUnv8LbvSNTehQBeVSviLReJoyKkOyTHQ8HwTaM1DorhI8iCav3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKo1RqrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jivRPbvo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKo1RqrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jivRPbvo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G34Dv3958090
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 19:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=; b=ZKo1RqrHvRChrokh
	ZV70+7AQ098MKKNJ7fgDITflBLw8XrtkZFNv5g1dNmsP3ZWI9mCem4MBlFAUgxAR
	58JDMKa7WGsJuUZlRZtCGEk4noSjddILxBHMa2TYsZTfKwXqPpDJDLYB5mq1trAn
	jQY8oDcv+ldmUU7/yMKmk0YdpbVHbtdCNx5XNQa+JgWgy9Ug5FpXWyMBK12hQ7bG
	hZK8SlZwZ7HlJY4zXJSGMf24dttNS91wwc838zMb0/QHx2wtakMogwZ1jlSa7Snk
	0j368iebO6l4ACxE9NfYgTmDp8ipJH4t/sxHMvQ55WgHyTUETEtZOoN9txRzdeiY
	MNLOoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12s99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1499107a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462177; x=1789066977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=;
        b=jivRPbvofJ6KJjlpD211tYEEBiCMwvVooH/0vNuVdbRu5c0GT1Js/PzDcX8nSX0emn
         lJtN+NObwNeOFD8nDTnZOfBYfqA1jqDNJu/Su6pRJHoGtB4EHJRB7LupfxC1kk3L+PRG
         3XOpYdQonw03DBEhomvBc5RsA0sMP5iVX0b7L/h9mk36WE4sBImFgt0eWmNeZxCuTVHE
         9yVaG+bx9YP6PXkTBkxic25ZYEw1CmB7vJ+NfbhZDK/mXfYjntrF0DfcgP8zcw4Q/7Uk
         O0yt/GwSt3JngvAd7LA/kbVw5OdfyF5ps/TVo4QzzPUgnukCNhmyj4LopdkfD1/3rP1I
         lj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462177; x=1789066977;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=;
        b=MU5htRa8F95+T5FOLsSzUrgMRfRqxk3A6bY/E8KnffEVPF63RlwR2vBcIP5fnBVB6T
         XAjHX+mZZeebwQa6+p0zEWdoesseTgGZmED/X7YJynOQhaEboQSY4VC9U4frgBlPv/EJ
         MQFJ/tk9AUPEMrB8pKDMgV6EMud+DG2mvxJyfLXvpepYGnRKbRuGTJduR31dAwZGKCrV
         ZEcZ+QwhH4A61zDvtKp4p7yXkzOYFeLypjhlNs7YqWh7KTzZIDAWX/3dY9YzQBHO43vL
         v26k6F/6rz4PQQOytwKIF0O15w6cmoGezaoOz1AW1dYHH/gnrqEah0erFSJWzJvaxr/S
         Rrmg==
X-Forwarded-Encrypted: i=1; AKwUvBzXDvNi2loIZLqfc6GtmV0SMTpA2WpUCKVW245yRasoLd09Hxlfq+rsy3s8TJkrrBWZz9h2oRCIN01UrTs=@vger.kernel.org
X-Gm-Message-State: AFuF++l+v9oyF45KMYNuYtUCnVYmcliEiAT7lHNaqyTGUdoME+1lN/10
	zPX9k8L6FAtfhMLsmwa8kXzLH4GAoBDFI1DcSZkjgxbQ+w6uJk1uTZtKOh9lFufFwtCvdHGoUix
	8Owy8O8QMeZjHhINwcjq5zoszlhKKvvhiF5coA1O+WFYd8WG/Oc6lMMl1BJDFFlE/fI8=
X-Gm-Gg: AYBFou0Q5lW4nAI8NkJaFi4ThcZ5npVxNZ8TZ5vqMaes6nx/u5DDyrsAiN2c4wSGE28
	J0VE762Jgp4WFfFGWhT1UYGuZrdaZtOpMVjtaJP+/NhQuByl7GSNt7CpCTRHN7EZfJDQIGtsMmQ
	KKT5rK9Geu5BqTIO61sNPAO6EoDAIHVorVIlJAPJrkAsGgGYbfYeJWEHRj3AmddqVWORG1K/C5h
	Svj/xH8rnJrRZS2OWwq0gAKarROv8WHP8bWlVuqZObtVrTiEe0Toy0HS8OG7F8rN5TU/SMCcddf
	JQpSSrGAoCR8SAYHrYY5J1zAUn8E04JAsYL69Q2Jh8QNp+TLHeddc4EPi7o42WpX9xb0ZlJ9nU4
	bwF5tw60/HQMaF7NR8Ixkl8dDaRoqRqHHTZ2i/3cG85jly7YFiZ6jR2c=
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr8558862a91.8.1788462175056;
        Thu, 03 Sep 2026 12:02:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr8558773a91.8.1788462174324;
        Thu, 03 Sep 2026 12:02:54 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
Message-Id: <178846217281.824911.2908930479578290631.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXzr5qe46qYpN2
 ruUnsYZ0+kGb3MtE/GdJv7hPqOp9qL5z7as3hPTRQYesQpRu6jjO+dWXJW8CneGAJcrqTMq4Dd7
 57dK0JbyduyEpRj64KX7fsbRvPS/q5+rGZwiMURqSt+1c5leJ9bixeK6k5BZsrpAZTalduzmj/J
 m2F/6c5F1ShRj6MLTR3yQ72T8IVUMBz2IRSR7BqltYI7jlSeSoTOvR4LsXkErU/yLhrNpKnW6zz
 ilX9ePEzDbVRbD0srXnJiKKhu227HFnGftobRWJVuSfGCoGJ3AUlZUWY+16abezv+0ffmn5qJfC
 bipaFZDQcHEFUlGgpJCMMeTFWECYlhGQ+2UpejHgAFVOJaWEC06a2qEXZsZvuLjzU2Xyp4Gzcb0
 V0J/H07j0ODVNov0B6iLkfrTfrU4esoHQGgOn2mjvYs4iJtVuUAplVvxXR7F0IzV4cXqIbKbBNP
 fVOYzNVD0owgMuPqvyA==
X-Proofpoint-ORIG-GUID: B1-T1gCguPHDqXq786IyMVHBrzQzn8JY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX6+IUQoHEo8+y
 XUIxeFyZQASPHQ9uK0Y2d3EfZLfYaHTHsb0j8aTJmEps8sgRsit0evdtAKDxQepkwU9uRmKr791
 6dA3AUbuzkhdMTzdG4aydVzL18TUL+g=
X-Proofpoint-GUID: B1-T1gCguPHDqXq786IyMVHBrzQzn8JY
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c461 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=w-KnMKhEo8LdWayTJ-wA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166


On Thu, 06 Aug 2026 18:13:28 +0800, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath11k: fix sporadic WLAN initialization failures
      commit: 32ec8488d75d122768b1977501bcb5ec799230c4
[2/3] wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
      commit: 1a7bcf5324c8e2de6512eca5b028b6b283181d3f
[3/3] wifi: ath11k: unregister PM notifier on QMI init failure path
      commit: 1d8e73163ef933624341075f576e2f36ef9133f7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


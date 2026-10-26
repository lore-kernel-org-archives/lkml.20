Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052127;
	b=lm4xgypQLYYjxOA+32bIb5gF+MJWzaleA352EP20WchedA0id+M/wQoAVFAFXbkChQcw
	 jmLz+vf9C3N5AwxmoK9bMSW4n9C8t/Iz3y7G3yJLSoBERt8G/j+u1BcMNDMeQjNSaZBtS
	 oAwyz95FWI+vuUjE98+5hTOaDimldYJHktZl+/+WP9hqJ3OesJACRgZE2ZsdYHHOz422K
	 WOqxz6hD0ygl4QhNApY7ekMN0eaUO9vl0h6o3AZ5tr7q/O5lZdX1abIhR6dG84Gp6vDcB
	 5RxMXDjpIe/HU74xvUh7I3lmK2/DkgNaTx+yP4cck/W9YapZ6OR3iAANC/xddmXcnIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t7GNxgbyH7Vy5LfOanxyNBKmwX51eVAcx3oxe3eX+ao=;
	b=efv4HKow/gPZ/E6Avaraz/9pdY5tDlZrik5r3S2gbIm9oSczFGZ3ZFl04Ge5DLF4964W
	 ZmX58p+5CIB/sIlHb5pfBVZsdGfT3n5C1cAQWJ+JgoEid9JYm2SBaXvRNG2c1RoyqtFsj
	 OJiQ3FhBDfwRRx5Gefol/fdKq5+7WeHtrVz36PQAtT3yRTowhd+LnqyX7dc6M0fkLqYo7
	 u6Gq//zdEHHnypZj2WP6gifH/GHzdRB85axNCOhy0P6SDvG/9jMK8OZfzcNum1P9Pn9wA
	 5nZVxE8NtDwWOTZgV6yJukj+uSEjSRCbIZCoANSWK441930W/3ixCAl1mYo4jh5Azhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlulyMVQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fi50l3us;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26736606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26736606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlulyMVQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fi50l3us
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoIWD3055061
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7GNxgbyH7Vy5LfOanxyNBKmwX51eVAcx3oxe3eX+ao=; b=nlulyMVQHTEVrmSV
	zdd8xDRuqkBKu+ggy+rmi+SXyzpAWl1k/BtFMO+KafjSH7hv/RijqhW1Z+BqbFCj
	TYrAz4kR4sSVBih3LVBPEo+wOwdMFtFt83X0NKUt8uacKaKdXoHTV07S7v/VA9l1
	1iQSY7+AgktrwLCODtZOhPnU8qJ2IADDucORcsXYFFS5/MFkVOqbVVq17NDU2R9z
	coKAhZKLQUJAnji3eS4OU14l6FbVS72+QDf5DG/NH5ftxVVdHK4Lfidg4UXnjQBO
	4r82rFSEb6lWAq7TfbK57iTiR9kfkVug4YPIMF2b7Hp+2XebGGFHkh+pXInvbF+Z
	QeX/6w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smsmyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:02:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so9886272eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793052124; x=1793656924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7GNxgbyH7Vy5LfOanxyNBKmwX51eVAcx3oxe3eX+ao=;
        b=Fi50l3usCVPPCuhX5x/VebLPOXiv1lJYTB9w9bczVnWUupsA8dsC1Rz+xA3Q5O8Ttu
         7m+oV6Jgg6hoW5gUupdUEp/XeOWPPqMSbhNcSUYLxk9S6StTpPzugNXWQAhdXQaI+gNn
         n2NEpsg9UW6OoN0pbDK6OuM0RGGPorEbNIqn9YtVv0SWX1zLdhjHikzrOOwErRwiuVYI
         ogiEFs9XqmxWIlp8990GO1e4AIu+C/iRprjFMBnnlDo/1hIKjo3wJw6XHpuuAKNKpdbP
         Qf8m+WvhA0aU67Hq5gPeymH5EOIuVrSIZGf+FaoDqYTKfSQcX3QwDajzU0u/mbHHGS54
         BC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052124; x=1793656924;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7GNxgbyH7Vy5LfOanxyNBKmwX51eVAcx3oxe3eX+ao=;
        b=Xyba9iPQWvQy/sa1Z8oCxzNuXP3Z5TCKQzyPsY5SJvsmvEE9DdZZgq2ppD625af1Rd
         MgoLCJpjJJ66ZO9wgQhA7esJIczaFLAHzzYEkMP3m+4+xQkwckhR9RJu7g0/1JlquRMI
         KEzEfsiituJOYDIqUyFWn8P+QdggPATkDTRrtJsWUG1xZKZtZeWh7cUJB8Iow1uUgfRl
         vInROn2awHjUiETeXhg7GHsbfKJAgJCqVbbxqR445MK4c0w4nV+0nTqQRoPlez4PasIQ
         SaFCyAIzOihE7mEowRn4LlpQ1ZPj+7a+um1VeHwafYDJek7SPN7YS3FRQ+0AfStHmnk3
         7Gzg==
X-Forwarded-Encrypted: i=1; AKwUvBwb3EgjR8rMmbFXCfu16cWOjSBwJReO48V7idz5H/yIuYscPennc3+TMLpizxLLMtxQNb+7msBTbSd+XbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS+vvOcb1VR/AZDh/EOhW78dbzQFCA9tXMc8Ac7kRKgE6fMv8K
	r/z4eglMBXzM4kiMypYCeRiKdG/yM7S7ARQtbkm+TEFpvBZKOfwyKo7L3ViCdVhPCsgfsy9HCMH
	X/cRfsm8u4OSpuhwjG9EJpYc0CvGZRbm46QomKMSPILPTQVKRde5YCy9B9615mevoQc/1UK4l89
	Y=
X-Gm-Gg: AYBFou0M6j1Eek7rneHoU0WheCAhIg7+G5Xf6S5LAVONZVu4AfqP5/lGGIxBOiK/1Ov
	sbZEIN/JrSxb2dyb3A45GNO6Kzag07kTavlY/SwmVAEouonSFz7pJrAhtSHenatcpCbj5551aoA
	NNQPr0irR9eV801+FAsYm+ZxfBB26dy4OQb9nTgoL30Me1Gz/WmHp/QI2EGiFF5oF0L3iMrsyE6
	tGY4IOTcQUGbGXxEXjT7XapUMUCDHAcq16DSDY8hluvRCpY4HK/9uGzw882PX+b0I0z7ESM+mya
	056COufqwepFsIzPi3jFlywwJDboBTnIAAh7KPOmr57phaHLoDC00vKwNlhZLe2etbc39qdwbPN
	OYBK/zNCcdFttFszxgAEiMLWG3ZuLZQJG2ddX7RN/P+sR9Hxq7amPUA==
X-Received: by 2002:a05:693c:42ce:b0:369:f0ac:fe06 with SMTP id 5a478bee46e88-369f0ad02demr10405392eec.6.1793052123474;
        Mon, 26 Oct 2026 15:02:03 -0700 (PDT)
X-Received: by 2002:a05:693c:42ce:b0:369:f0ac:fe06 with SMTP id 5a478bee46e88-369f0ad02demr10405356eec.6.1793052122667;
        Mon, 26 Oct 2026 15:02:02 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm8443486eec.6.2026.10.26.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Mehmet Fide <mehmet.fide@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        mehmet.fide@screeningeagle.com
In-Reply-To: <20261005072209.4101009-1-mehmet.fide@gmail.com>
References: <20261005072209.4101009-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH ath-current 0/2] wifi: ath9k_htc: start ANI for an AP
 interface at the right time
Message-Id: <179305211921.3326479.12394237462076417931.b4-ty@b4>
Date: Mon, 26 Oct 2026 15:01:59 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: vQQowyHfqDYJ2JzD5CBqv4cf2I0nDjNR
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adfcddc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=anw-P6zLAAAA:8 a=EUspDBNiAAAA:8 a=5QJDrcrzCqXBdyyA0DsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=7_zPmhNiJtJTypZd5sO0:22
X-Proofpoint-GUID: vQQowyHfqDYJ2JzD5CBqv4cf2I0nDjNR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX5+6+QarJIWzt
 J6HlFKoDB8aqlOQsItvJFkvJycaMx+5X6RaCff+YFCWutMvbFHe/hcXt3zuKYagC5UpEkCebYfs
 FQsD4L5uxB5BSd4h3HdDkAhi6uS8T3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX2Gr5/5MFMySR
 h2IJE4RG0/CmuWSAtn2aPvs+1i4CE4F/bSiGrO4uaDa/UFCc9fNDZ7wdONVtFNpejaoL4UeyR3P
 MTFfsjFcCm8P8vmo0mACTvBtlijU/PnU/Pra7xYfNktkUKRftul00bv+0khhseC+WMh0OAAQmp7
 5BI34JrrJqlQPODarfOxu+aEYPGNHiG2+wV8af7fFGXbLRckS2yjO6yxJlfV3Z4Vjazs9AZsQns
 1GqGRbELtzrS4Z/XhMzA5WGSUDoO4au9PI1ggQyce8xeMOtO7nKQk1Skcl0E55QkM26SNRXikOo
 4q4FuTEGe9L5tOKnDjPa7kKpkfcocMDTp+jAg23T7ZWH8MjS3yxwMc8w2Vm82dszS0SVyTBRG2V
 l1neN/trb0uTpXjkZiwiTAlsCXSLZs5JFLInoiWx0XYYbm3s7j76exSK7UnzOFnffM0rN1MWujU
 eecArrdn+hVex2HYg0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260087


On Mon, 05 Oct 2026 09:22:07 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> ath9k_htc starts ANI for an AP interface in add_interface, before a
> channel and the calibration data exist. When the bring-up stalls
> between add_interface and the first channel configuration, the first
> ANI tick dereferences a NULL ah->caldata and the device does not
> recover. Patch 1 removes that start. Patch 2 starts ANI once the
> interface beacons, which is where ath9k_htc_vif_reconfig() already
> re-arms it after a channel change; without it ANI and the periodic
> calibration never ran during a normal AP start.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath9k_htc: do not start ANI before the first channel is set
      commit: 86210ad4ddf1aedcaa45bde16d829fc27aa7c5c9
[2/2] wifi: ath9k_htc: start ANI when an AP interface begins to beacon
      commit: 9f0fe5ad0c9af369400bb87143bc936ebb741391

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


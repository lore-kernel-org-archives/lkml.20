Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226236E48D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766930; cv=none; b=EM02BhAT8ZNfKhbcES4Vz/wbpY4lGIUZc4iBUpBGiCWoLSdeTK2M4t2FOvB148t5dwbRMss2C52sXqIOHAfrs3VfFcEpnxEsh7lErGNd3fKHFaUYJ5N8jKdFFIxIf4InKD98Zo/5LBYHm/EG5nPSf8srHTA9LRD4u54CGczL4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766930; c=relaxed/simple;
	bh=NN9BVKvXAv4dz1TXazQODq38tvHPJK0LZJ4wY9jR320=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olpL1Ath6pEIVb0jYEwZuk4yItIPhwUBwyJKRPg0OsskyQPMnClDzFOyTYHTllW4vyGW+HGhBh9MjS7ZngsDwh2FhgueZh2kZHtW0lIK5Yfmx48IZk7ot01wsTv7wgVf6yijle+ysRPShyYi5XcwZsSV96ko4+RQwQTQRU6qH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGqvbNxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9j/m2TJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGqvbNxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9j/m2TJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777MlY3352435
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=; b=mGqvbNxu3XVIm+ju
	ZvWYo9o/QLbl7wOQ4TeVKhBhGHEgAjREC3zz4d8/6aP70WwlPMGC4IVNX1yxmXy4
	PWF/UuhSJldSkPtd/YmEpieT9f/LL096gXYIjPLVxXXgE5ffVXXp+fh7f26HwpCy
	pxDAXhFeox1C6FgpS94WC15zc2irgQ+AO1cioGCQoudpwVBTtrJ1pU1ALakhjqUJ
	l1w9zAUKXFaOe0C0o/33xhTBKNcbw+j20MRzhhyvrwGuu5I+7GW4yzLXGsiqUdNJ
	fhlPO4RV3Z4QVkWV0uooore9uyUmZDwRNIbClkztwNI1HhN35B4Quu5m4beIJSP+
	S0HB/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gkwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:42:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so40841085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766927; x=1789371727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=Z9j/m2TJ8m2qkWSzUzLZAy0PEio73KFXiGZnkSFrvrG13iZZFXK/RWWFlWSuguSlBe
         b1XlPeAwsxLGUZXhA/z7prJi6Ce0+LeRX2Gvw6eOe/NuTEcn3gA3NaszH9RiQC4TG5Uf
         igCIHqA3tZhKgM0kzJ2jxxurJBQWEmLQbSmqdtgEYIiRCBcR1k12WvnXHZbJ2MRFpzlW
         Vc1K8HwopnZUHi6d052adsCglkMdXjM52AoHU0KWDK1b6C9miaj2OMeb55JAGETcYGoT
         7X6ehUG0f7DaJQruuuD8oB1FKf1LH/Fpqm7A1zt/onwJmivqozyKfK2YUTRyKojoCSGp
         mCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766927; x=1789371727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=bnHJNgHmStHRjmYvCt7aXexcoyb/pp5hvku98snIlNBwGT2n3ckIbmwewVClQEt4X8
         VGEvzoBDXJJVOTYl+f4hh7N8ZqNUoUbHh1yQg+skNBk/8gN9rs1pMfpRd4RU0HB5Ei0J
         g/6YEply78Wf9gfhLKHEXbPTDQemWAys1mjGGSkQlTNKcW++IFLF2VsBRMVoYp1NhqlT
         pjiA6lFyTO2JXBll5UOObAreOIIK8TbQAXHQ6RRzJ4b/3UQkhV8GDBwf5eDua0qC1OuQ
         ElOj2wxoXPvfd6rIJhqSwIwtGhzQiOBXCH+aaBxrHViftmO0by3a1YFu0jLCvF5/ryQW
         QrUg==
X-Gm-Message-State: AFuF++nb35/8zSXcXTZUfrxHiGXHz3ylsb0U1lZm6ASrybUeLaLePpD7
	LsZSA6z76KeizDaM3N17l3kz2aC0Q/sY6wtzi4Ie2DSM7BLXBGNWnEl3KUwObejYbHEO6ENp8Iy
	F7UfKhTQbx6qAo3xHkGAudgXaexyp7RSDLoQpyOeVXVKpAdrQ9c8YIBPHlkdhvv/Tzg4=
X-Gm-Gg: AYBFou0OKD9D3bzKk2OZk6N7u5rN/hB5XKhE5T1XKkB2KtZPAe2/flnRdmvgTtZ36Es
	KvXOtvfNcEB5JOEdWkgStqXX/Iq4VoufswBKZ+q5a3nVD3w4PxcEYBefdSo8pASdedzYsqHCF+L
	kyOZrhCx+9YQttyUkcZuw/YA2y7M/+Ulf4YHy7pFAhndkucuM4YPOd46422fZJhMp/sf1nYSQn8
	C6tanICD5aiRnQ5U0lyZA+O19s9YIwk8Fwudf7itQlRPm04SEgHpD+X/ajO4YYu5pIIJcRVkXZT
	FdgDa3efQrVAhLS2t/zPbg87igHXo9TPGewVcWpud/JwdB4/9tVTVFasVTXl3per1yulQ0xY3qh
	KdkMpgMN8q5/Jn/MRqzD/xg==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727368885a.6.1788766926634;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727366785a.6.1788766926220;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm266442166b.18.2026.09.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:42:05 -0700 (PDT)
Message-ID: <648cd3a6-653c-45f3-98c1-8608f599f941@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: fix repeated words in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
 <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e6acf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E85TfxCPf-EkNVdhPEkA:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lpr17AEXglOkFP5XIdtBvEulmTt0r-qK
X-Proofpoint-ORIG-GUID: lpr17AEXglOkFP5XIdtBvEulmTt0r-qK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfXyuO9UUxBA38Q
 PMcFozERUpC0VCfl6NNc7F62tNHhYOVj1Q1DjeayvvO5aGplc6KXMgrlG2mY+Zk8od/Gi4sga2M
 WSeKAtNBUUe2aSNjpPqwdbCjRWddM8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX1b6cXtRGg/nQ
 UX3E1t2N2UEZ8jfNIhyHwjqxNgdHlp/IbDpN4WmBmY5FddvaKphV4D5tK2hfVDDHVpIPFI4n80m
 nWaVjx2tZOot0PNT1UnwrJW2Imll1K2nx++aBI7iwlnmhWtdhcx/tTrkwzQPIBbJfsW+LGrELGy
 XrCf3nIWY+r4G9/wyxPjr/RhR9XAafJVx/76cRp3AnJ3g7pwK1kAgZJFSc2wXRoZrMXyOcBsR2h
 J9JPMIdSygikRqV+CFn3Za2/xo/5d17GITIdohYk+OGcRbyv0PB6g6SnbNZFSgsa5/zVY6z2oJZ
 9RWhcEdcpWxrGXVcmUGwmLqHDZpIHwE6Xq/iZ/F/dr7fsi6Hgca1F9CGNlCWO9Cc6JYLb0PsN5u
 njOFsJjl93PcAWpoUuiVcvyLLZsxN+C8T9pty6pEAaggBhQJFrTIKSuxv9gA6rJ/9c7cam0D4rz
 b6vlzBg+Elj3FpyeHWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070082

On 9/4/26 2:05 PM, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.  Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

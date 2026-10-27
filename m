Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101029;
	b=gsFd71wcpdtquRVMd4CDgse8rJ4on/Azxa6c6xZhjNrlOQ6Y6tnq/Hqk9GWz/imVJ1Mq
	 XC1SbB4M9bGfnZB9I5fQGE27W4gnGbjewM5n1JNZRwqYzpstnaZIM9IMhK5iyE+Cf+cMF
	 wY0eAIGSVFnJZTLmYAwX4o2xLQL3nuXRQSsXLSV+RVGN3uR/zRRtsbxsfqqcZV2duHp0e
	 j2yEA/13C2PZmSkq7fXtHK3hns2zN1hd+e6Vg8NwYgqdCvfIZ+FZHHbbTn+MSswKr95X3
	 NVkqEwIhU2jX8fB8rLXQbzHQzoZW1tDYYLNNWjzTbjmE7jmRfd9Mok75CLFUn3+yj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
	b=FRpelOo7nN4ozAe/PYSH9iDMWVsYgDiKtSdwj8r4pOMEdzj+ki9/Tkq+zpjkVbqBzHmg
	 To9JUdC7SmeUGQQQiRmOye7S1YsAJB/kC5FtGbedNsVxLqgfBud6gwmnmlSydZktr8UcE
	 Tair6xotIDQNTcgmpyLO0ajb95jaKPnLYndgSIaUHphPB8NVIeJdxQfyXDe0b/i7l/xBa
	 lPa4RkH9QcFLcIG8v/KBY+Urc9c7YNUBw3x+oIpMSI1azM5QOzjqdXxSu2aubNRTCUrCg
	 K/vmK7+AQsrUj2Lb1ubcgcgnYeoVLXpzMzOV5aGy9lJaEtmX9aloTftSMLvltkU0ftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BYkqWIL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DDD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYkqWIL/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8MC3026354
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9Gksr16Ym7a6rQh3BsSgLKt
	bW1PN6uAQD1PHStu3Cg=; b=BYkqWIL/vT76gUwo2BPV8+qHrr6gTQHtEF/qsZzV
	t9k7/HNQeqhwS+OHKqnDsMIWulbLG2pqkKIwvCy+qUpRSxC99/XxZBrYFP4cxZ7l
	/Q5YOmpG3L271QH2G5vKyPoPM1U+Mq8rSMuRfxu5hdQR1Oyw80YcKP/fbSWdHayk
	T1s4ECD6OiTjnRcPlz4xyWeEWk5/6k+IM1aG5CEfYWk//wv8JxvDfs9IpI340eXV
	4UYya+dCPcGYNtZp5Y0LWnfYkoc75+7VeOWSCho+8Jf88hndccM3tEwzSWSew6Ic
	bV2hVKl418/lToGDeg8NuPuK+BK//WEAdS2VFXbsnHzZsw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a8f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so925535e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101027; x=1793705827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=MYiB3GTb5L7ix1BI1N8Jpyt+VCP3d8sLmnAczb+NA8WC2GmILuLKf9Cgx0SCAHmdms
         zX9H8/n1Et56I4rbUf8cCbhHU+hT2nrEf7Tq4uIdSInkvP0hTEJ62mMXnG1mxQl9B1qO
         dSVnoP+GA/AziQHhuNimf7gTmptyGjzMhu/WV9btYfCUmjI3J/J6bBDDydotEi2jxtq7
         zuQZG7kteIBHc2p3eZyKWgel5d0xnDFON7kqPb3Wy/ePe5k8YgYzvrJWljU20Qlz5Pyd
         z6SybKf11ShDACw7I9Vfq0bc/1n/VXB8GFQV0AVdpgRc2eRq4tm2QQoNskU1y8ov27AP
         ylow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101027; x=1793705827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=R2cklZn5X580FV4E0SjIpvvlvAHW6GPmckdbyo3D8GGgOkTUS8kiMgzCwS+t+UDC4d
         Mbc3tdLVooCeCFusmK5afxxkWF8Ej4eqUlBiIkNTCmVp7yMDZ2JTzd9tvWjsYm6SYc3G
         amYSNitbJ/thMCilVhgvRCyxNOnEepmg4E/ab3XQCFRZFTYvw+E0SiCC4XLZHI5pmbuY
         4npCYKwoNaroAWZUajXyuEpyHubdyy5kgYnqM7cglzo4TULsNhd6d4Rytw9EcqNHII4Y
         vb2YoC+yatEtd4lub/HBRLCEIXAUyqZuu42Y5VLNHxh3/Vy+B11uC1pi2vk+7rJ618H5
         4YJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+n33krfCWiyadMm2lBqtDmt8YUtb/mHGtDGQF1zm1OILZNC/8pRoEten7YDQYlNXhhE78358LyWGrojo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDbOY7k/tbItcb+yTlkVW+G6cEk12prnAeGOMAbfYNvU16aD9A
	tVVejm26LNex15KS2mWRRe6nF4mJ+wISQbQz2KPi9evZbVBUbt0z5bVub4mB2AwhKHKhHi5nPP2
	JJZH/7lpI14gGmpyYCh2Ix1BxRMTHC+teA+J3xMgbtmQxGCw5cOCjwVWibXitQHpRKmY=
X-Gm-Gg: AYBFou2m39NGb3fmkFagnImHoxhircXyz8kDXHr/8fNv+8PCsx/MMi7Qg/2LU8cBdaw
	j2lkcSMelsHj7ICl3ARDS1RvDnSFdxpvUGF96xN0tzLJBva7IcGC1+byo5oL4xH7qtasxSgZ43A
	jbOS0k4W+zy56K8R9uziCjwwnOTCaf9OB9ANLXdOoXJthBssmLvMtQrMoqzDgWmhxk9/zz/fO9L
	iIk9AMygMrXFeSmH5pjYeNziZp0oAfPTdbN9rPzW4MhazuVflxvUfTzGN5BU+3tiJAiJkdTp6aQ
	WeEC10loIHk6HlmIe6fRdP2ekhfcQGH/LotHmb8YVXAPX01xLHAY0S0zjbfaU9svUqwJ2a1118A
	X26l+0qvUnECU9ct4Et4o++YIXLutkuKQ0sXwVlndBIahaz8g7bYagf2+NVBXn83UQvPzkIZ8nu
	C0R9ggCOkVMnY1
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852920137.7.1793101026945;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852880137.7.1793101026222;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8930dsm2093206e87.46.2026.10.27.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:37:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
Message-ID: <jmsh74ugfivd6ffwiqvofwnkkxnu5z67hqdei7jarhrftvkgac@hq2e5s2aj7fr>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DzWj6OD_E7WTFu6TJ_qUoOaxIosE_6je
X-Proofpoint-GUID: DzWj6OD_E7WTFu6TJ_qUoOaxIosE_6je
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08ce4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=auR94sGctrba0TjZuGkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX1bJ50yEABf75
 8raBgRMnS7d9+6Bo0vjDijCPNQVlxXyqROPXYZ7JFt1VyLLvnMH0w4aboB+PVcERVJIAf2GMUEb
 oA+EgzTOJWEME4POl9cyqD1ypdN7mS9GS+/LfxH48pvgoxnWbCvdLTos05W1j4VTCKOL1z7lY8Z
 uB6l5LEKzAC28XnAjHrkIsypUANZlDH6bHnT1++vRGF6PC76/j2vT4/Jc67U8AijOah8+1tIrDO
 qiEZ3ijKG3Tpyw8BmDcFq+LlfcnGTzVKeCA4hrt8VL3rO8hashGrO7X7Fx4HFR//rjo3/FdjLIe
 eQ54XUnC2lTToE3OzcEUfmS7oJSUGA8vWbhGv7fbCT3ivCFooaMz7jbfMDFIIiGA4svIi8excVQ
 kVzjYJPF907cl26aZtXyiTHHZTE8gmonJ53dB06GBo5vETZWO7CVUtJDFkqeTgbzgPENu9BDi1Q
 K7n7WTzzKVsGCESIXDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX9aL2absg3MDD
 FPamCfF0iCtnNv6ws8LaOiOML9pd+YkapJf6HN9AAyfNJ9vLHoFPFIU+iXH7OnFd1kfD38qJyst
 vBBEHcqsXLxhQ9PtMbmPWPmVKm/WRaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:31AM +0530, Jayant Shekhar wrote:
> Some MSM KMS backends receive display events through firmware or

Which ones?

> another transport and therefore have no host-visible display interrupt.
> Rejecting such a backend during common KMS initialization prevents
> it from using the MSM DRM framework.
> 
> Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
> frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
> interrupt is reserved for power-notify acknowledgments. Existing
> IRQ-backed KMS implementations retain their current request and
> teardown flow.

With the commit message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

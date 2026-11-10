Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303299;
	b=21VmBlAwaXu2KHCWqhiWEhSp0hGOLxp8xEN8JEWyosguKjOGgCJbYdu17dKZ0fEQBVjL
	 g2YfXUal61slmsrmreb+5KBz2BxxkHAMHrrrY1qnFHZurxoBekipEGL73oqDbqAnsuc7O
	 M2bcxLMYspGGqMNfQyqmJRbN9elbosHdTVwzQ/hwdyPqu+zOl2D3Oc9UiN02HX4N7NLW1
	 SDXFZBvd+gVnQKo6IcTDisjyJtrM+R7X2Y3aofVZbHzMu3d/qC2GnYmm1URK+KB/yCcV8
	 MjB6JV4nr9pMUIPiKCBUrTCcZSfiSPahSJsq4xF9nxL4A+zGJ2dl4XU1p5YU56CS+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
	b=zC101wcM3u5QAycaoNTQvQOqFBYn4ot+jXhvBPsZnh9OlQrlaENzmCLaFuk7uxdvyTgU
	 NozmYD/wTQsuBmjkS5rWKo6MnYBsoJ0AbrW2VOqFAdJWEWtliJIYmRROxjHahNYfwIUic
	 9G2ANEVS6Mj1nu99aaQ/LhqnM0k+EN2TDnUtG8iJzcyYaUbbx/+SyZeT8VNPAIS21ZAiS
	 lftW35n9iT3o39D24+5PfhHoEBwNddEiRtYRvXkPuU0dLGVsdTOGJXbGiUJgdAC6qiEUZ
	 GDvu1umZScfUFJz7w/sEfP3ogmggfb8YXUMseIt9HwI89B6+GB56Las3GRP7jMYt+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jQcUM9L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDy4Vx5e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68896606DA32
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68896606DA32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQcUM9L/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDy4Vx5e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lGeB2240849
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBBzM+x58lSGjC6iKeoiB5yP
	FJBsxPrwM8tp/hy1BwA=; b=jQcUM9L/ieCNI5pHGV3sB6qxYLZR92hzLhXJOhDI
	4KlJg8X5ahYE6N2AlaztoAwLuI+p+H2c5VI9uAqqFiqNz1LMUa4vUiAAExkzRvSf
	Wfk2v6kc/rJ81Vdml4z6cU1Zp8af1Glw/deQuVcYvt3x1kpQN2ftPUWQPk0zDBx5
	IVRY1GVmSLnjWSotqjufr43LYK8BfTdqVghM+3zqQgYx+1OSB2zbqi9GJ9XjtBGZ
	6kRMzMovddf5Bv+pvSZmnwIDBIAWCm/+h+hZwX9poPSdszW0P6wYAFIGyDpcFouG
	bYicA9kS8BmTp7MNeXT9GmqPJOdVQW4BM5MK8qy1eIIg1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:34:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so342904685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303297; x=1794908097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
        b=GDy4Vx5eCpS31QWUhC7mhwWxqYP5qijakuYzITpB7whmp43eXuDeBhzTsssiWyoeYx
         jt2EPhTcIFtOgzGoCqA+nwHi4vbskxl+sRvErZYO0wTomVurdyhoF445DCSA7cyZgRyu
         G4JFMqib+Ik5MVneGILHwNZXZn4h3k0smeXv8l6tVymiB6RIppaikfMv1T4T9vmBiGo2
         p3JM/NOy3hLU18cNepJb+jyrRnlY/TTDXuwQYJ05saDmroUjKNgtuG7HDMUxDOLModz4
         oQ+0nRKvnYi6bOkE4HGwkK7XhkcHbVgxIXWvsk0XOEwdK4Z/nvyJYGKdcE/1aXhBeSVE
         oXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303297; x=1794908097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
        b=2yac5yhYJVHn1lA7UjPEiyHh06cRiQ35/U2+d/u7rGWCgAnsb2wyCtaj1Xpd+mrxzI
         0YdexF3oztqd53XKRqaTOUq3mRqqH/My1mBZjVYSaGjOZJSQDkjwWNRfVDXwdbrQW2Rg
         c+zvvBNf45a/vZnmCHQDPUWjCnjXbyRz1uoVhqmW3+khStUkdC6iHvabQvxuDZU9cpJ6
         kGnnEozwRXChiqEwUxU+awcNxPlOSMWNW/iskWrWXdEyN7k8gYhXly3AmQdN+y2nat9g
         NCuOkUoIiHt5EGegAaxJVG489udAAwzO6c9MG0RnxB6M+hF9PLGjU1DsOanxcqB9biOx
         WsvA==
X-Forwarded-Encrypted: i=1; AL+hErEF67nA3XrHj5GhX4fxeZ8sfiBeaG/bwp4faaGWxZL85joKkRbSEX+V7eGfO0INlbdCopFYkOgghi7dMTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yeMLFCS+w8cTMVAzBaG00W4flD/stWgML1zgHh30FiFEj2aN+
	OG1KZGGEIm1y81BAD+4TEL3luwtI1fTV/gwokkhjZ6y3LIBbfdhU9XR7SCBaelBnUYC5C7SmZNc
	UXb1LHrxOjryGfpWYb0ZSUCXRkD+pmvDSSEaemHyGJ4di6ueK2Anys1PX4K/hlawY9f8=
X-Gm-Gg: AYBFou3C22jP7PaRflNhvzgoXMh/UVPS3rShK7iULPXRWmROZRuVoFxKVOSVPidlawe
	2EiSu6dPPmmTG7oZAJSY6GcLYwIVsdLwW3vMw8zlStQMbqqY1G4bvfU+iZiiUAOGdWNxAZlhrgV
	aJ8NDFw2LHXjdIxu6mcwVoIAKcIUKuVssLPJWjILuN6SkqzjBxpKKoIpQP8/vIgYYi9753oPh8R
	Htj494blvScrBj/K0y1Z8QM6MROh6QkT4MxmUFXEHoQuuVyKQUSzMLp53DK+51n1fwdy7x6NdQx
	6VJ32utyGPf9jYdveeRKqyUJbtXlIb33gB/IuKWpbRgoClmbQfjaME3KoJBHwHu/nJzrzhr3seG
	Rg78HS3KJ87VNSm7IhOd2hV/RAaCGY5hP/Mp7pQPvXeyg9sqaBTDZ3+ja9j9KDla4
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr308876585a.2.1794303297218;
        Tue, 10 Nov 2026 01:34:57 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr308873685a.2.1794303296619;
        Tue, 10 Nov 2026 01:34:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm49545735e9.7.2026.11.10.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:34:55 -0800 (PST)
Date: Tue, 10 Nov 2026 11:34:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 29/29] soc: qcom: pmic-glink-altmode: skip retimer
 reset on DP IRQ
Message-ID: <c5xtcdsxds2476itvx7m6s7u2efqnses3lo6ugqxnblrxwu447@g5r3tmvqzdzl>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pZbuK9tu0hWj1xPbIaiXzoIIBlAsnsYF
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2e542 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=a7TajEPTInBWvrS5HM0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXx7HhhrCMqTuk
 qmaWjexXeBL3ntNAnZhqcOcSrduIpixPlRHQXnXS+SmnsG0y48cCfQ/mXxWbtQBNq/43yRJ0cLi
 tOG+khLMEUZNoojLbT/q0JzgXythjQutJQ70LopeGrsP5SpIXBVy0eHQnx//ehkfgLjB13H3aKV
 e3Lx19WQ0kCtlaQ6b7RupEsY/QL9NC8az6NRkeVyQszVvOs/98aIAXOkcHV17dOZ37BfACqyFyl
 frVRGvNTCAmnAA3VTiNCiJt+sQvLCGp3il0/NsRJ0jeDy8bCopcxRFj7m7cYifADkm18RU0S0Kr
 FXAW5RJkGW+9XrOuIvbwLg7myAabbMo+7vFFPca3OfX/XwTTE9OQHSszq6e57vmy7VpBirHtORL
 8/DzbBOmcady44xCWfc1BDH1N9vBYdd1HxPbk2zGClKb7xDP1ZQ1I1ypyF6MK0fazs8VKeH4dyl
 BPj68B1IAw+1awfbkEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX1PsReuV0ZyiC
 5C5Fo5DM8WSbQikw5B0izrZKDJPbidSLhBGm401O5qWfNK5Wf1/t4ucZu6PWowRTYoCydmACsKw
 1VRKauqisMGooJylplY7yKtqlXc8vA4=
X-Proofpoint-GUID: pZbuK9tu0hWj1xPbIaiXzoIIBlAsnsYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-10 12:54:50, Yongxing Mou wrote:
> A DP HPD IRQ reports a sink-side event and does not imply a Type-C
> routing change. Reprogramming the retimer for every IRQ can reset or
> disturb its datapath while link training or video transmission is in
> progress, causing intermittent DisplayPort link failures.
> 
> Cache the successfully programmed DP retimer mode, HPD level, and
> orientation. When an IRQ arrives with the same state, leave the retimer
> untouched while continuing to notify DRM so MST sink IRQ handling is
> preserved. Invalidate the cache on non-DP modes and after a failed retimer
> update so later DP transitions are always configured.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

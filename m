Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111055;
	b=XIRPoQ7+zDpl9bHxyav9cQHMfY7Tg5keAU4kT53cB38xiAgw7g0ehLranVQ/nIrv45/w
	 UmMHVsiQeEAMzHd8EyTp532jGfkrXQokWFxEkW/A+Dxey6c0rAqHmg0o5EiBFz2Di2Sc8
	 XaRiAQWvd+JZJNunuw9EE6Vn2vJkz7NbcEEzZYCj+qIz4CT0PSzwmFhb2jHV6T7y8kufX
	 WC/i3DPbFJlpqCvnmP2qp5nYrfbUE3fvUGg84dUnLjDKqU7p6SL14esU7afPeEkxxQM8B
	 MBLOv7H+jXy9gEk8rdF8A7yo6j5Jb7K0UnVvuOfwnTaa9ia4deBhQ8Ccws/tCLUXJpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
	b=XBPnEst1//4dPlDinIkIKD0vSZBBylMrnRD4eUy9NwZh6zqrzWyRDYV4cMSzOsjwyDh6
	 ggWnJHr0TRP9NRQlIFRFuKWPoOnjbTpS3QPcX1Q/F8BcnUYHNsXLHxfXlnEBl856Zhiu8
	 +LsK6cSkA3Lg/e94RBqcc8vJnAa82+qfpMsKqnapQPBT3ETscl/3oPrmf5fpENTwtNnAl
	 c/ekr+M3FBoOfIlEfDAPNswlkAbeCkGDntQVQZz1IciBPhiTZwVE+WW8m5AWU5hzyTOsG
	 yjjZK10Mvi/OT4kqew3TqmJcUlQ0oKk90FTTs86qhFImTC38xoGr7qqq0QnBI5ngdoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HIppQxKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7339T+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HIppQxKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7339T+s
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoDh41316473
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=; b=HIppQxKcJFJOi7wA
	c2VTSdgE9+YCIX1z5JXXPX7eC+wPYYAInjIz9MJ03SHS6MqBT89JXG4kDEeeY5bH
	nttxdLQzCQuGpUPRMF7prX5DWvmtr7bzH+D88VdvdjRe1StqTNMfj8n0npLcRx4l
	ybhSR8uFcKR2LPMhPC9CaY8JVacJapAAIEZDtn+46404U9cNg5Ro3VOMZpL/SVjZ
	LY2BrXEgWHh68aa/7zA5/0UGc0Kvs4q2hIb7LfRqbVZ/f0NL76BOW7Rt0vrfXdEs
	4b93ZKzQloMF1O/pYiT7S6wkXosBiq2/22jmlfYEeOg8zNglM6fxk1q+0PLIRjg4
	wDJoDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98gd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:24:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0e2566d30so81849137.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793111053; x=1793715853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
        b=I7339T+sMPrRiC0b38l6LFsdqQv6zmzB/LCJ1OX39Gzilm45nWSefr5VFdkj2xOpCz
         5o0p5UYvjU9jd4eOrVDXSKpsQnCH4QbpsVlk9+MHTDeq60b1qZncvHPk+EtKIR19aYqo
         lK/z6R2gGFmeMfiuPGroRUviWLLRPxju4HKaGzJR5xAU7HEgKJejVbkv2bS95cXaSS1/
         vhAQehsHYQ06crWZmZAXz3dOrw0DdgnZ3exbkXDjT0mt98K0k7NGhMnQ5YbEQXcdLW5n
         j4wg2A2La0KTK4QiwwDbV98Nrof7fkz+DpEoYdzsfv19Dh3q6pmpO5kT343J72n7eVNs
         4oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111053; x=1793715853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
        b=BHHJvpOJ/xp9iB9nrbCpsIyOO3/f8ZIevRl4yV8xK1sLltaaUaav2Va6hJDEF645LH
         KQpzE9zqq7qIQrDWmOHsc3ks0QjmV8Qpr5b32I6zGGgmrfHuT8vEZODt0IuVDxyqzTTy
         fAf1RrmieZVHgGfWAvn8FW2UTD3Sy1CS2SzVxD0srz4mNrawbAiYOMIxDDN3P52Dsyrs
         P2g2SDBaUncTCES76gcyeqftnmPxVurU0G7hqH91k+tCk9bUKLIxt6hXXHNq7H2IFeiP
         qwkhkKcDnpvx+4pa+n3knlSOUnwlgPLtukphgIlOkFiaD92jyqbCMxZEJGUKi59VU4Yo
         R4EA==
X-Forwarded-Encrypted: i=1; AKwUvBxIX1febrp5s0L5g3SP6Q+YDxT7mlXL1jQgFaMmMzuncW1B660DddTGJzDPMTy5HYpnrwg2o9tel4b/E1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs1ZY5JPoT11K5mkZ0gq3Pq4vLEoem94ioF92VmGKRhqJmZjkx
	Nf92mZ0WKM/kd0XLgcwXqij3XTFAj2SwVyvhclapyxh9R95dDW7P0a7qPtgMury5WT1yE93gyGr
	XvSSBk+IaHLx/QeFFZS0MfZz83YQE6E4mOGAld2Nemfy4PHUc3Npv9NCdn+oKSRwl3DI=
X-Gm-Gg: AYBFou1+jwZU5x4PVJwnPeW/gp/tjZA/rPZ/ROmLh4FO+YNwpX4zM+/MX04sT+eP4Al
	aqHHR85DcwNeUEM6KgX3n2ooJSAT4BEGZ7NRoi+BOxkrAn2Ou6B/CW1llPSYTmMW3kSg+Oyt//C
	15XA/9KDlzzAPOKCRZmUoLjSM0E78HMAT8snvOtftY65ACKTAs+gU13QAaD5SONAGoTDwvM5OaU
	rsBZlIEe4dSojx/JPsn6e8VL2njbxsopNMtAebYaFzDAaCT9NYj14Bj8eaD/NK2qokcFyCk1ypZ
	SnxOPIHQ9bb7hExPwFzzbDabPY4t1LFai0I/Ll3PB7zZyDHVA1cTMePi05xSaHIvelatqeeoJUM
	GUgtNIAgezPDMhdaGGYVT2g==
X-Received: by 2002:a05:6102:8698:20b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7ce5c6ac82cmr3604879137.0.1793111052699;
        Tue, 27 Oct 2026 07:24:12 -0700 (PDT)
X-Received: by 2002:a05:6102:8698:20b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7ce5c6ac82cmr3604839137.0.1793111052163;
        Tue, 27 Oct 2026 07:24:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49602346esm180294a12.7.2026.10.27.07.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:24:11 -0700 (PDT)
Message-ID: <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:24:08 +0100
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
Subject: Re: [PATCH v2] drm/msm/gem: Add some cleanup.h
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bart Van Assche <bvanassche@acm.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261027141430.20258-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027141430.20258-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0b40d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OIDORtarOpwJ7gKWPgsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: N6PZLYNa3WE9D6yKFYAmwltIyi-qpQ-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX5xtLDrgVJlr/
 /e6it92lS4/ZXqj6Kz+xpq4BZVGc1wa6Lxc1R2n5V4+073r8fcSoZNPM/n7FTWfJ7CuVXNYWc5v
 3//Kxllp0QpSN4a+x/yTGYY60RdIs/zjEmEftnv/MZrH/kS7LAq58Xow8/QRzT6kN9lnwVWfC/3
 fCQItRFeIzS6pPjvto7DBqCb56KebDJvx1tfmBZJ4PhQdtCOM1RMD9WUOArEBluJu/WTMWPO4ur
 VR1NITTvwM7FzMCDUusCI+mWinMJb5Y1rgSwyF56CkH75QTZTZ/wNUpvDy1ewxZxxi8gKm8gzx8
 bhed47RqrifvZeTtGS+Xhc/q9frT2EPqcD3HtvmTSNaEX9y+bFxCyHCkSyGlDpsIfE++vPJK7W3
 NHqdqHkSPBYCEY6TNICs8Dr5tUZv2oIqG9m7lmZ916D/dWuG8TeFrkb74VP+/hYVA43RH6phU0h
 1dU1/v/zFVNGInSsDEA==
X-Proofpoint-GUID: N6PZLYNa3WE9D6yKFYAmwltIyi-qpQ-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX5CT3FEwrzuaq
 XxvxwzhMVA0EJ7NoePdFUKkAVlaAUy5Pzr68CWHDck/fS96lj46aCeVcP59rr6yUTuHSjGFcvQW
 E70xD3v8bKx67HO56fRtKvSNEMg4pfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270057

On 10/27/26 3:14 PM, Rob Clark wrote:
> Convert (most of) the msm_gem_lock() and friends over to scope based
> cleanup.
> 
> Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() there
> should be no functional change.

[...]


> @@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
>  		return 0;
>  	}
>  
> -	ret = msm_gem_lock_interruptible(obj);
> -	if (ret)
> -		return ret;

LLM is a bit grumpy since this no longer returns all of the return
codes that it can but I think it doesn't matter

There's a couple of single-line-scopes we could shave off but any
which way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

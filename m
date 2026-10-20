Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501021;
	b=CPly1gLPWDt9YDrNrWUbmf/fv0y/d4Wa6F4n1hik41AQggZ/JcV7DbHJaybYSv3evlap
	 5FMPXXk2rLwijXPw4xg+3haOe9Rx3gI6k+v0AJRKterHQk/1rHowVTBMMFUHJujakcqVU
	 /ye64/xD5UEho+WgdYDzLsMIwHBsn5z3i1S8FqFcLcN2T5Qmm46wmpSRnwIgi/HkPUavv
	 SF05fATGAM+I6i/80J6T8/TNPxcKItqEHZwiLpkGyQGqFR5G7ZSIvCdtFhOEJgoEXON4z
	 BcX61z+5eITDtCmUbnreteF76SJiS3IeisimGnlU5DvEbBBuqBZzpvZ+YFc19fuCuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
	b=kHAw0cOITUZcdWS99zuRdBHmanog7l0SPP3qBOK7Sh+2Y5o3fsNEZWVuFokzIc27rYvR
	 FVA7NIEI/mQ8b3qNBbk8ziYLDn+FRGBBeC7sRT95y14CyxNheXK4NFti1U8/nFh8JIeXI
	 KthqU1SfDoJdvR/Dw9QXIucD6ya/QDG+lF3LDaROrXMjGNK2dKL53ij+JWpQbVMjHDg8a
	 eVzDPUcsc39vXbvVN+TWQRfqi82SpZFd0gNF8ByAHIDqA5a+8VqS8EemP9gscyatg2+Zy
	 dzA4L+NGK+cKEl+mw4S7YnUwFwfCbr0hpfJnbsCYtogukP3sEhWu3Kvyx2CtdOmhIRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNc6jFzo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gujop27o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0835606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0835606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNc6jFzo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gujop27o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwup31929078
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=; b=LNc6jFzoSFDHmR5u
	LF8RTeGBRByVR96ClsR/T8I2QeICQ9QUmvzeU/ONongyZyNctfI5rI5g4GyG0hgE
	JNDQZZUjiddmad995aNw0TMDlpG+ZYz3dD3FKLtYgj0nB+uiE7ENG/67XyX7NCat
	vrNEosuyJscatSxhuQ6VMMZwzF2NoeXoDJuFtqKSxSmUxkXh/ZFrJ3CErMh7TfVe
	Sp62QE8LjW9e9qkUQaahNtbv6f2y2cZ/IBIpdzXuLXC7WCtwoGRV7AwkCYakFEhx
	BusWdeG7lmIMxrBmO274+mmR0A55xfA48FRO3jpYdISoSv3SMWZ3JUfXqBtPiSkH
	81vfAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:57:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so680207185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501019; x=1793105819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
        b=gujop27omaJ9CvzCqytY1l+P+4P8R5BtV7cuWZPJKVsdA6Mjbl3C1NaznvXQhhcsrG
         N8oLz7QXY31gGc18ulN1GezrzEtVsR7mWPortzY1QIy19q630IYQNn6O/W79cYqopnr3
         5Md47DdPrhShV72qaGPaxl2a4lZkxK8Byqzw7BtnzlCfj1m+cYZLDYwDZUsnhPTc8zKe
         wUnsA26vrW1MDrGC1AI9dXabOwb47U3LWXNru8BFLS6xEeSauYKM84nwjaWQJf+SEOwN
         8gOtqeJ7NZ0TBkbNAtDAESlKUFPrYyrHa+c/3hRQ8TH+bwtInH/s+QgtR7awFgb/RdnI
         e6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501019; x=1793105819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
        b=wUjafuEgD/XLlN01eWZ1cuRrqqeMVU/B+hOKTeutCsG42a4CFXajZa4pd3cm/Xy4hJ
         1lCuu0BhfNyZ/1op/HZiTtm/d9IdKz7KAQ4bKjvgO/gvp+d29LvwDjOFuzZZuutiFtF7
         1YUlHtb4dheKXDWGHSkUYisVY/mGZlHNIGQVzew+eurdpHMxQPeugkm1o6A79O3cRb1E
         oxIjDnbRw87unwuhBKXNHpGaD7hy3fxrRTmOAHSOigtfL9h4u64PCIw9qpRXZIyAUcem
         N54RPxH9nPWq9mXzSPvAeiY/5a8CSpLqhvKkTAVWdi3i4/XLodJPQ+Jt0fRMAvxkigvp
         Ol/w==
X-Forwarded-Encrypted: i=1; AKwUvBxGsY+434KHXLw1SohqqsJ7E2Srx3jtRiSGjUQsP6crY8aiD9vbhFEknvUUJOoQ3GA+jEzyM5+J7IeGf1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE833ILMV3YekV7z4sL7jbYkNb1cqkrttKHSOcLee1hMWur9ki
	mBk47aaJ+3A3httBrZhCYtvtN/1UvXku9w90A/N1FYmINFOqr5fZ+1zO1hs6PqRUTJ9fKnZeQMD
	6AZmnazQ6haXBLKj7y07U0fHYOTr8Eo9PpKVc58nCM94d5iGTsOswT3o9L4A935EqNo0=
X-Gm-Gg: AYBFou0vULqzWwoMdIz12h4gAkGWHLkzME35yJj0j0ATlhgcLVoncOBTvVW6GXbEh8k
	Wga03o5X5oVOvVP8Is3zUN3F4Wx8FtMIFLpngctmSZXeHLaRmQP3yYRVVnyAuiyC2xrChDlpFQP
	1mXGcRlCeszX95ilEnv3mqoBib4A0Y/RU9gSPZbWgaGdctySvbDcqVC7t0BamQKeY1O/XAHqgO+
	P0oVUr5EL67AuQTvwcdHQRkuuqxPLCvffjbfiUz+bPZWxKl1vfAFTzLph4y09kn9bUx2iHMnklo
	1Eevc14oIKSlkA/0R3acGYwFVxORROovUeySKNz0L7dzGgtX+MA1FwkRbN9Rmy1QS3oQGXS/5Q8
	WuaiCs5XG09flaBfMEkxIK4jgffs=
X-Received: by 2002:a05:620a:178b:b0:93c:9eb3:9f04 with SMTP id af79cd13be357-93f29b48ba0mr1665948585a.9.1792501019460;
        Tue, 20 Oct 2026 05:56:59 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93c:9eb3:9f04 with SMTP id af79cd13be357-93f29b48ba0mr1665938685a.9.1792501017746;
        Tue, 20 Oct 2026 05:56:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm5783237f8f.40.2026.10.20.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:56:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Free chip resources when allocating the label fails
Date: Tue, 20 Oct 2026 14:56:55 +0200
Message-ID: <179250101315.32144.17934365724412757683.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
References: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX3wUGlaFZhNgY
 mdqaofYG7vyWWaL4NZcyuHDsOJDvM2u5vr1mcLwP3c+Wz/w5T4PuiKnCCIf1T8W7/ufP2EIIR4P
 LBToHDso1PHpyfz2T0GJfvngGnWnuIw=
X-Proofpoint-GUID: lVXfPfh2WXzPY9JSO8kRlceRuldhJvUz
X-Proofpoint-ORIG-GUID: lVXfPfh2WXzPY9JSO8kRlceRuldhJvUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX4foQrRNapWTf
 wJyk2ptrqStOSA1bZ+ZSf2oHCgNYm+5HVRwizOPHnzPxCeaeIx28BXfXnCPBQvcekhB7GyJOwgv
 +hp8RQqMoqL+2YL3BXUZDNw3ix9hOx2p4bK2bhY2GhCSb1WtwPGu18mqX7Id17XNpBe5pBpiVaW
 FCa1STTpHpgT5y3xnw/WxkrRmmHYmonhIYaXqcpDmPqgqXI5tAgVgWlcR2s868OtbSEq+sWS0Qh
 HDZ9bVSYcMNEtv3ByH+AFHfTMWW6wfJZlZIZZnKxncY43u0/Gq3xE495fxgImq12/Wletkm/0Qm
 P+tGjt+27LIGKNS43teHj2dxUFji9/fkninSOJbV1ywkHQYEbnTMejpuT+U4OOByd0tKScXTZti
 BqsDA1tEfnxJyGfZEQk1QhNExfgS/xFUImY3icTtajnSRUrs/3BdCKZZpWxrTr+MRzmT189ECzI
 34tvLCk1/AqQJRxOVGw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7651c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XwMsx0wW_YWBngEHHpgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051


On Sun, 18 Oct 2026 13:44:56 +0900, Baek Kyu, Kim wrote:
> If desc_set_label() fails after the chip's request callback succeeds,
> gpiod_request_commit() clears GPIOD_FLAG_REQUESTED without calling the
> free callback. The caller receives an error and has no GPIO to release,
> leaving resources acquired by the request callback held.
> 
> Call the chip's free callback, if present, before clearing the requested
> bit on label allocation failure. Leave request callback errors on the
> existing path to avoid freeing a failed request.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Free chip resources when allocating the label fails
      https://git.kernel.org/brgl/c/8381e1f15e27087fcb6f07046a526ac8b9b9b2b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

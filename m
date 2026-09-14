Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733F3D47A7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395776; cv=none; b=T4kAxPqIeLVhd4hfHGUUGGP+YC0tiaWJnDlO42Ta5FKLyenVyihPFBR5OpNStQY12H8k5stx76G7nIhAcj/6L4sIV+jaXcGBDviYobtdHxCgrUBfVwfPvxiu6rHVoHr3JABUHuxQcYiywXOAOVyqUC0HfOYZPHekbv9S84Wzp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395776; c=relaxed/simple;
	bh=5DfjZXKvoCRVc5eFg451S9aE0vN4W1fbhno/k8RotVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEBXsjOmW8qc0tuFMxmYqyrjF87p92QBa/2KTUUPyTPF3Uo/4ZfzOMwrpryeGm+GTGV7tHFyWCiRl0oX8i66ywnqYnecpmvFTVxhDnvR8RVe3IDsA9KDnX1M1aJzj7ebuDGjtEpMF/xcSLlsSlqYTeqHQMp0uaHDLtkQ8j4F3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkg2P32D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8ZZDnYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkg2P32D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8ZZDnYX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0q2a137763
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0oA3TKz/B/9WM5D6FIoQFtg
	GQG7htNMpHX6aFHzQxQ=; b=bkg2P32DY+NMSYc04ECZME1x5lYXXnxVmRQ8+F3H
	ngUwEvnz62BFbc+KThIuU8p0dBxJ7xBFR45lVoduhuZWqW0lx57OZo9HQNAO/PFm
	Whb6D0ZJPb9Kk/09T8AtovgrUCe96Ydcz0SHkoGcP3W6QCC+srmnh/fuG2yXOiUS
	zmBHGJ3ydyxlpHgq3QIZkPSa0rsuYElQ2d+MvRFrV19udf/t/RXBq/JH6aLnml0q
	wKUnTu1SYaoEXsDOYNeP96SxBa/WwSBDwBxh5+gIPcAlnGfnNxH8o0ccybGM1DYh
	n+sJTfU2AbuzQcW6rB0nn4en3pFymBE65ZUgDl9pbS40Gw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq9083-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:22:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7847917c402so2548356137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395772; x=1790000572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0oA3TKz/B/9WM5D6FIoQFtgGQG7htNMpHX6aFHzQxQ=;
        b=a8ZZDnYX2hT4SmSC3RzR62N6xOy7Zyix4xzxxALPNfhCs3BLqJjjtHhO+948blfNP5
         FkNNAwD1w19Px+Yx5Pqol9ubqgX2Npt/GyWPGmGQXEFSMW+Un5jR5XP7BEHzE03yWVJI
         +kGGSUAARdjWWs9W/GwQFGAnxHRu6yGc5036bm1NFr60BSetoERUQyOQVsAvq+pUBlVX
         UDxVR8SGLlriERxlCsDLF6aqdmZXPlH/0i0SlIsZYfL1jyuiqcNi89/UXb/FFhh2c0UE
         yq9UYQUOk8ljJp7PcQWQlmsGwCiw80cxCt1gqNUG2z5Wk/aooHvRMLCUZ5jkDvNqce24
         zQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395772; x=1790000572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0oA3TKz/B/9WM5D6FIoQFtgGQG7htNMpHX6aFHzQxQ=;
        b=IYQWU7IHCq1mG1T6OUnpSGFLwGaa5kJsoJQxBvL00yaaqWMYM6H92ZgNoCUpMp2vW3
         ktdmJTx5QzstyA1jlzAQNUWK6dfhwNQkpGPIl5pI3kNwm3iZy6AZU6wbXPVAWaHIeKOj
         EBKuft0CH9wXBJd/uWn19Ro0sZiEZ7whYOa4dIswEJnUd5MXt68quxo6Z0nyN9F2Oi20
         rzbI/ilXz/XuHPAd1hhamaAqe5NwdOW7lafOj5+ywE5hfiYwHCSkLZpBAovP0EmABUrC
         Vfd6h+S4aQpabjbMarTW2mzae11EEeC5UnNBTfL0EqGOmostEmskMYd+TOQcOZvz8ExW
         WOqA==
X-Forwarded-Encrypted: i=1; AKwUvBwZfEAVPFnUHGZwbSadyyjrRLOWuXrjE+eaEvjDAhy5s3wdZgod0M4NarbCD0vBDQsJPFp1q/xc7ZanHOY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTb5eTaGj3wYRdv4mE8jDhkNM/shzJgrrwaIt79/lHIPNgHF8n
	somUceHeEqFcfawE6XIKthjJucDZjNJCcx9EDoiQnvp8xpCTImPV4gddNrLfj7SIRfH7tuE9q3i
	kzZC9nSLNk94sECT/YquaaEnfopAau3DgpvLeUYxMQYpUOwuVJP2ZqG+FdfUvYDELbjI=
X-Gm-Gg: AYBFou1XJ+9Y4buQSDMHmUCq3aU0eOKy/rzU9gcD5xOXUY1u19FoJ6MSXFAHUKz+tY9
	am1Y3xQaLKR94AirVQFIQqxilC4aYPHV2MbENL62mChizp5M27+FiTvvHLPJkzFEkt9u0ViM7lk
	0G8ggNqROgqV7PruyEFPWddg2my36u7XslL4s9g9Ip+0k5WB96sRAu87JkvaA25OVZ7tGgKWTbL
	MAVUiyaAR99jwsmHWRhHDFLkYP8+Uqnd51CDupt9wZIpU/8BjZpSA6V+B8s5Iw3nYjQUi8gF/eJ
	QBRJk7zVrdkROz6Wwrohr80bwVtLMl6IKaAGCj+j4C4t61QJlBJLYb8Yei/x/hmy6wC7eO6feNe
	7kUEBeZPAzol1qQ==
X-Received: by 2002:a05:6102:6a8a:b0:797:5884:6e25 with SMTP id ada2fe7eead31-79b579b3683mr2821035137.2.1789395771664;
        Mon, 14 Sep 2026 07:22:51 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8a:b0:797:5884:6e25 with SMTP id ada2fe7eead31-79b579b3683mr2820660137.2.1789395769790;
        Mon, 14 Sep 2026 07:22:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm155481075e9.1.2026.09.14.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:22:48 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:22:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue
 during remove
Message-ID: <rgmp6w2hx3robvlk2umwdldbap2jdie7hvegnxgirwgefcaaex@4htoag5fu57m>
References: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912161210.1683266-1-lhfff@tju.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX06XjM87g8bMs
 cK/kMP9elUWEXXPqfvBgoEVmvsW7QxK100/5ygLgsKyD8z8rQMxAdqxtbS2XwFqxkZehOTI3bZV
 2EpZrqlnyedwJiYlWz3DRVxMButnZjgGhd3fvLKNOCXgc157wNsWUEcBnDAcTW8t3iM5bu572Nl
 7VbJHkoS6zXikjbgbiTucaUgKHtXVLleH5Q3bFzAvqy8kxxVmeA1H3CvTmhXY5+snzeJe06U7zK
 dQtTnFntZ71+Lo09/LAtoB1/MZKfixpC4H0xeKUcNDZnezljh7ybhjIZGqUPuD3HKMdf+9QzpmM
 I9+AsOgx0QHIu1cnzwxbFubeqscRYxAj1G3aO7ICO6D89vBFYbjm2PFvwG+RJUSxsPQbwjvbDAB
 z+vVZHHh291u90d4P6FwANNJXQumQLzDZcavW3H9bBcemUyI7CaPXv5lAkyFqakwCYO2B4RHMOp
 KO6SHNcBW9O/V5NvFbg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8033d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yWPM8P6GVKE6enYag9kA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: tpzZxq-RhczZn_7M_cg472dWZA5zS7Xr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfXxg1L80dRb88r
 oFTUQrE9+Ad6T+8sdUfjiJm09wmvjP17N7IEbTdKTFoVSsTWsmUs2IwA30fS3qEZ7ACxPyLt8pi
 qeCsSnkVJqOCEIUNzAF3XGaXW4fISHw=
X-Proofpoint-GUID: tpzZxq-RhczZn_7M_cg472dWZA5zS7Xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140205

On 26-09-13 00:12:10, Yibo Tan wrote:
> pmic_pdcharger_ulog_rpmsg_remove() cancels the delayed worker while the
> RPMsg endpoint can still deliver callbacks. The RPMsg core invokes the
> driver remove callback before destroying the endpoint, so a response
> callback can run after cancel_delayed_work_sync() returns and queue the
> worker again.
> 
> Device cleanup then frees the devm-allocated pmic_pdcharger_ulog while the
> requeued delayed work still embeds and dereferences that object. KASAN
> reports a slab-use-after-free in pmic_pdcharger_ulog_work().
> 
> Use disable_delayed_work_sync() to drain the worker and reject queue
> attempts that race with removal.
> 
> The issue was reproduced in four of four runs with the real target driver,
> RPMsg bus removal, endpoint teardown, workqueue code and devres cleanup.
> The test provider delivered a valid response in the window between the
> driver remove callback and endpoint destruction. With this change, the
> same late callback occurred in four of four runs without a KASAN report,
> warning, Oops or panic.
> 
> The reproducer uses a test RPMsg provider to control the teardown timing.
> No unprivileged trigger or physical Qualcomm-device result is claimed.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

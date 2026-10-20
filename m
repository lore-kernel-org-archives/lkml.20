Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501684;
	b=H9DPSZmazjbYZHUXuMyUcNtBYTy+PHhXluOQdJ+ScWeKJeH+pUKLNvsVmkzW0T94tSAR
	 3KchIpBjtOchmnftMox0kncw6pKsi1/4Fh/kLKHOXIbUyp7tWo3tf1D/L9qtlK2bkETiL
	 0/cuwtqat5H5UgXfXCZWdTC6qHjCqTA4bmwGzBYRKTavio7ayhBTuBNcuG/sJlKmhUJXy
	 7cNPOZ4y2NAXa08RMf/vzXnE96dzD3g4kg6vhzeZw6ojR7cS1IcI9bdaVSQ8WuD5CgUEU
	 T9mJN4q1zPXV8gCjRkAsJYBWHA0bsixvuffwe86iWkVMjwiNRBKFZGFm8iR5+tzU/BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
	b=JJgOJp2DQZXmsVloaefBX8auyRqgJ1mJN96j7bbe2Kx8yiV7OyEme/kTCfFe9UVb/Y2N
	 NWf+7R6v40gHEuqucfMba6QYAj27TnhZ+kbDxU8pYnw892Hm/qp5kexFbirWmunTaFQVb
	 EiLQndksXyWuwzesK+rkD0WiL0qau9CEoNOB7V1AgCUJi+QCsiIXYLj90B21241fPNo1z
	 7AeFMwUW2WUH3uueCHOStZC1lQb9xvC9BtVSThEVBH6MYb4PyR1vSCLrgxuCP5B4kY2B1
	 1bHKP3icPU5Fps3EFnkYugqZwvICVXsc23kweM6/HY8rIgAkiDZOlf8B3Mp+69TH90g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CkYlAD/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC7606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57AC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkYlAD/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD0ug71711814
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsVaM+X+He2qAXNYLPkW4269
	T8viIt6nfU7YTJpM1Fg=; b=CkYlAD/GZ9N7jQyCWq6NWS4nrvWk3+jaTlzasDFG
	rmmDIb9ZcEzE/UVXvfMcnRsLqPb7CtbFIPtHBxMIXV3/lRGNVcQvxDqfkIfJcoFa
	rsa/fGM8wZp8MFjXhmOdO9fVBz6lUklKO3J/7kfcXF9bhZaG7zphBkR1D/4CATgk
	RrMhKZnhVc8rHvnr8Eb961Mt2mycbTromUovOyTE+aHnljJu4vIvWulF3pZJ2v4M
	qLkqNbO4FzK+6Djl2w3Iw2cbDwIArDUd2F/qZMi0C5AxONHjmNsmO8v9VCW5S8+6
	FWKCW+TL/FUpS48IRboXZBj7g3wEYJqdKOV9VyDTop8yYw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bfa915da7cso570125137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501683; x=1793106483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=h70d6fWe3663Tlp3vn5QMkwzVNZFJt35kI2ZyCXpUTp33JXfVU7EzDfJyzHwEXVSlL
         4dIMJbYn9SkI6SKFhL0pqHfoQJZe5vqPcZpIoLkDZacYY3ISAB/nlREMNg+4y0GPK7Ut
         g4vYXg09xr13x4LKC2v2zCgrNwxet1lwY+hQM9u3o+RQ4jPfXr/aGimCC1tNtXJ8QnJt
         gESiCgHRF2yQz1pL2P1mFbMAQRQ6XB2L/ZnVsf5pTvP/UJe4rhyJ8kkpkg4qMh1mEbb8
         g+dsbQEkoG+t/xVqofRphZL213Am12xE96SfCO6pUA8BMhqYfH9r6AQLnLCv9s3IpR0v
         lZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501683; x=1793106483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=Va9eVoX9wJcuv/mRLhDgdVJasj8sHJu4hIz9mDc6PkDd/pbAotQ9JBfq6AZvAN5Mm5
         aArJzI1/VFynxsNy1aFS7mwDDn1r4MJymQtHqwsMCelSLboIXrvbYlD3fyqrmkMD65jh
         WrWIOHtZWdGIM9wUvgttzioqPV/BsJwLKXjW7nplVVG8BWH90kpjIr2MZyL/TYG10PtY
         LsD31mw2PUoKEf3QW7jKZii2/Y98qh9RSigfilFXM4dsuiQjkvmceadue24C5TPUKatz
         bpLsv4U7m66IW7P768sQZhjM9HJR/hHhO/7/Lf/aHh7+kkaBeQGajKcRXKDgCByznL5W
         zyPw==
X-Forwarded-Encrypted: i=1; AKwUvBzWJGrqy2QcFIZTqtDFWRZCaFxn+EN0e98CgzUWmRw6G2/Odh3ReqY9ne01nFNmD2ha/PF9la8FadfQ9cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIonlyiRQPzaXf0MXJXvNudJybUx2T1ll0C7DbIjJBWwf5wSuiA
	WLEIHq1Rw8DX66rOUQE3rz6U5rF9B5XSqiu/K+MrE++YVuG4jRHsv7jSWnGuL8aL249x3wIZ4SA
	SM+8k1eD3ookQRpXuAQAmFbAtXyANBD6UBFSZA+jAbmiPhjWcYHcBzb+FV3tT359Qo5A=
X-Gm-Gg: AYBFou0WndWO0hJ5o3SV1Y3gEtMyn45W3Too1+niyYEzqrkMZstpCiSQ70CF2jpAOBW
	qrQC7J4rvKB7+vXwIcAEqf8DVmqCSKajyBSrbVdiSHLzlNbUhfYMR+6i+dcaw8zge1JNxPi2FFe
	aYGLjEzDrLI3RqO9ZgLFI5Ep9zOgHQhOim+R79dZRjxPJ2iRxWcd+D2y5PFJKbxy4IFC8pu0agK
	f9D0zIIsei5PgKg6wiqoj0UKRz74/Qpl7KtfiI+0mYFEjwP0KRtw2kXqPZiWOCIw9w0XWOhEj3z
	q/W9gsPl19nZFG3P6XRBy9dKmT93yRSjGiGLzeAgc19nt1zouH8T9wHCErlm1mVQxsuQ+gp3e4D
	9bfpQ9+aS4RPEq2j/
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360519137.25.1792501682582;
        Tue, 20 Oct 2026 06:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360506137.25.1792501681954;
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm65693245e9.5.2026.10.20.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8150: Set active-only tags for
 CPU interconnects
Message-ID: <6ydb5v5dpryywosyjbovdzedywpdpdyc3lmeea6j52hpp7b2ai@l53sdm6i3emj>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: NI6RHvjAkz9VfrJnjOuZ1_rbSVfHstgL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX4UDRaACqSFTa
 xP4Gz0/UQz5EUqT3RmooKRpiDNY1JW7xt75TDrnwnk9YjKVIIUV/duxLsWkBu8zxW2txHYwPcHx
 MKrVQuyzOcM0QQjBo/QZzzkw7XdSL9A=
X-Proofpoint-ORIG-GUID: NI6RHvjAkz9VfrJnjOuZ1_rbSVfHstgL
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad767b3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/Lqz7uB0b3LZ
 s5PW2702/n9bn80OKp/L4GrcM3TnuLaDdG46D6K8xItJ1SUUaMIU4Vi//eXGzUGsy13OcNGjdc+
 XadQlfng/4Hd1h/t37Sqg8rmvIuuXltMWh1+V+biIxpYN06l9zqR/YvoRtGPgyvNfBwQgoaF5Fm
 fa36J4YYe5jFpiLklPRYwM32vZt5iMg2MNIT8xx8AFHo8p4hpetn07PERHpl9YkbgPvV1teIu8J
 ysGeraU0/qKm3F/pzBsDGQAi22gSnE+8oZnl2q8tOjeZ8bLf7zAtpSqooILq047cVe//lIO9Qmr
 lgQpH3nS08PTgpKzUZs3UpQAR59yuYuahhidkxxV/Hb0TuVKaHZt6/NoyUSmvuOkFf2vePQEIlf
 Llrdxqp/9k+Vyw7XwXeGspjsCA1RW0gw569GIx6MEDMoRsFGSSl0mzYXZYG0pXCHmPgh4+XinUA
 wOFntH3ARCqdvNuzr4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:10, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 2b6187abafea ("arm64: dts: qcom: sm8150: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

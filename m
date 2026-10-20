Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501097;
	b=BtHURST8sYCPEecuK34b4R8xVJ6Ky4daIp2QR18aoLmbC94sd5zLzdg729pYAjc1nj2/
	 mOEJujcyVRtXOshDdW+3MVb21brD2Dh6ivrR42nIleKQmnzW1fLJrdIdSNLd8OktxTlel
	 0ME5S+1h8UJX7UzVyIMfw0du2uaRdcJrLORh4Zb+BD0e7WfQ+Fo4ZbfYdxg2ENV4Uu6yh
	 WRuoYIrcTqdbWv1ItdnjM8v+WBjO95kJOD/xjNfl5cB3vkJOV8W7sYP9kAw/6lkjMCCrw
	 2SUU7lG99HXzc5tEZYT2safi+Dojlrr5OFl1dIJS4nYzVvr7Wm5W2bJ8cec83XGBa1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
	b=3AKVvkj2gyGkX5dtmWUCnpRbJ4cKbCQPbqoxed55kHQXATgm7TinJOHzk76UPPY8oRVH
	 gjyk91FOKxcuuczOgahhhUgfzKbY2yJrmT8wPjE2HIJWCk3r1PXqKImJV7QniW9kGQJNK
	 lktVeXgsvOlzvkMfBHX3iTnQKzc1qM5ws01YiwCWq9oq9b5ir+x5z9rOuALbHXzR6lCQa
	 FzSp9bFWHU0wsV4nOpQ1Vr3YNn5TqhG2xJ0HcfSOGtuyJZbWWmzYqboKC8hTQv60sLhk4
	 fhNC3U+jr2On97SMfLIqIRnYEhrWKb34Uec5lwnqyzyqcP3BTkLywtXU1vWgxBNhlnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g95B7M2S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C107606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C107606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g95B7M2S
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxNAf1293037
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qKQN33wg42pkpBLtGqBWtg9b
	yfzk6Ew0t8Bo7SdAs/A=; b=jha6VRrvWrZisQB7f0L7jZ5SFBRBsqegbN8CBx+V
	h/P3cCLvR3weXlnvMaCgUBTxQr7Or7S2b3UHTBwPrPt/c/6KEVkNflV84OPmrSAE
	V0/31Qkf3DHjNpvfds6+HliqFgEjx9I0NpqBtE6Tn//3MKW5hNQx8QWz6WRaAvgS
	iSnsHCargdNaQRxgkSp2gUkDT/1jbdJfGBrJDrMN0jXYKESD+4JBkBXZPIwOMNRV
	CKRJaO6rDXTKaG4Jf6iarhhAn6a9ybMKhkA6AF+iEHN3/A8p9SjFTQNXByoxmb9X
	2Y1CFQ41CZq+z0j2L1JZbdnOKlIEB4QWRlrCYonolhoC5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2hq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bebff9fcaso90269096d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501095; x=1793105895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=g95B7M2SFmSl5gW49R5zMkA+fItprBYGY5TDz5hc9lqYTJ0LyrHbE0AX7rs9nonLHd
         Y/v7pCI8/4qmGvsXBGnp/1fHwJiHJelfUUdShzSJMwW1Zpqbgm6WIFiCA7TE8TekzmyS
         p0wcovaC2tMNseIXP4ecqz7b/vQRBDe9torbHv9oTxveX9o1527akZecC+THq5o63SJr
         9+Qm1fGxzHfQ62vnEkYfWDXVH7Wm0+52QLGBUO+vVIGIMx2dMefyRKC813vRUcXhbdHY
         l9ErrY/AjVDqS7pWmgpuBARYcK+8rW7V5ucyLvDYlwHXJiywQ5q6PePeA9VYh4ll/Z1k
         NoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501095; x=1793105895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=wX3KW+rTv93YPO1gK+AZYwUVKc/mHvTImuNbb4GtdpMjLfwFxT57AxNrkZ4Ayykcwm
         1wHwfxG4ehyduJKaNSxhvpMWFLGho9gv/8l3eWfAA8oa53hhBf+7EkUOCNfIA6oTcIyl
         HF45ptFJgaYyuNg10yBJHa0qaE4x3MPmafDkRy5rG0EjX2WKP6f1Dz9/lthSnI5ilVgi
         2Qp7Kbl82KUscFev46aE82RSYMX5f2TZAOOIclI8QBz0LK5wz6Bjr1DfpRjVoUqtmZya
         4Q8Za3WQNWh5/z6aFoFSREXUgtwvsPsz/APEiUjSUyh/e8An7D5qZbr2u4ugEQqVhVL0
         x3Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzLH4Q5N2dqLYT6aj/a3pg8zbic/2X/0EjbRZ8xcXl4E5mgkq/HZbpS6X8rhtkEnrldu5IBBKTsuwHwDo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP3VvDXHkQUBVyk7ZSrihKzVey83TiFGIHDceCrOYgDMtfLFQD
	nG4qnAwfcYTcat7GxRA7uHf6eF1DjerOI3x+1J+E4jPOjLQsW5Jt5C4KJ51DVtZTUMg409U4F+T
	vyKmKvVkcpHXW6RWDjGSXqzMUc7mWH1dlH+ByvvT0WJcdYnlipZfwopbcbCOlD3RrPpQ=
X-Gm-Gg: AYBFou3nJgRR/tIcNocBCunwJeAOsqg2sNTcQeQL5vBISMBWIEomGCVxAhjAUVVcOP0
	leinvV/vkHvmrP/BQg9++oFrZOk2ZenvKvE8nlW498hcbh89h8APcLUJTVJGA9kpFtC8Tabwyok
	JxGZxDlc4+hjFFE5XxYOetvKgRqvFe0QQVMn/w3XGqAhoPccnC0QN3xBYPm4hlCyXg513+hkChn
	bqndbgAyRCfK1B68OnLVZtNPjgfbFeNoZd8We8hyWseTPTpHNOr09XJ3VetBg76WACMXWScLAXs
	bvgtN1H8pAxY8XmwB/fBMTuu/mAb+XVYV5kfwP8j5ZIngqxatpkFIgtVGJ5VIUCYlirffDqAmqp
	Qq/0Whatek4SxkUx/
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761767285a.3.1792501095537;
        Tue, 20 Oct 2026 05:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761764085a.3.1792501094964;
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6353477f8f.15.2026.10.20.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:58:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
Message-ID: <npllqmvej6ua43g3vfr6yx2kh54iidd7x2gng66ltdujwi23at@fswwuqxc6l3r>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
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
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: 2IqgBUovHXyBg04d8o9zORocKpuSNcAN
X-Proofpoint-ORIG-GUID: 2IqgBUovHXyBg04d8o9zORocKpuSNcAN
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76568 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qThvZ3sH-gZQT-B3TrIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1ARNEyCsckJQ
 vj5FW/uqdD7V1yhOFdRcur4Wj3UWRS/RPuBKxXeKgruV7K6BZ5z/t0QP2mcAQD6dWHXDAUSAgqc
 9j8ZkCctAf493kbfxGzs3feU4JsZ8tjmCzNoknRvMA0Cq2Sv8JrJPFa29QcaTfFoovJyH53+DGi
 t4SIRA5rOYkdt+WdXZXE6/KZfE4GXcjhBJBSLFBs9xGPjK4zPNBMUJrgwP6TpRUxkqJEisRB5rb
 3n0nsw9+tPtwVtnk2+6Z4b0NWsKd/NB4xDMKimoirtTv5qLEfAsogfH57I0m1+3zvHChDIOTSdT
 PpAjLRuO2VPQ5rtWhgGMA6JLNyeufCBrGtPX7dzLjKckno+yJeBdGbcBrdw/HlqNj1rXIOB4M+G
 GMQlUwlO0XrsFRezM8lU7bSlIzcA1dc/Nw1e5nyylw7VGRhbMTWVq19T1BOJyHZwHVPdseDF+tD
 sc7/Yv+eYPtC743rKQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX6JOorU5ffQY0
 C0aNw+EI3e7sDveXQJTQSUArvgzrgOUTbur076hJ/CZ0QwbgnNfJN1SfcDli9OdL0x05hjOja/B
 XqX+q7w6Nhzz+IgPqMfck2SvqcNFLI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051

On 26-10-15 15:25:17, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables

stray space between "the" and "CPUs"

> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

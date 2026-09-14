Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBDF27FD43
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352173; cv=none; b=Pva2n5W46EhME7y1Daje//LMK1e/ox6CS+y1BOdO5ny+Az4zKSIwJyDoXnk2OV1a4fJHezCalJthAEV6nQCS8e1Pzz/vg02d4r+ruIaw5oIz5JPqYTLxWA8Zla/LZwv4bymZJX1QoXVMJP6bC1BLX9V5pyancNeRoXGVNCjo44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352173; c=relaxed/simple;
	bh=lpVWWp/A2y5xm33udhGlUqR1U3bzlh8VjjycKDx7tzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgNEuF/CAHh2yQO1M4d8hQgj/aXU+d06utXwpMDk2zLaZVHqJphjIM0hhzyeHV4d1YrqsVFxWWWDtFw26aB9/JF19KP4Vauwu+oGnACXyo1OEWwvst7FHn1GNOo++ME60SG9Q4gpddIFirVJbNIrfW1BL4xylSDESJJrwlvrlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MC9OEsST; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xo1gmHuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MC9OEsST";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xo1gmHuS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06TvJ3717972
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUlKOakabOfOfKvw0tID44kB
	yEWki54+dGy5HyjJFPo=; b=MC9OEsSTSlK+kxcuIyVDQxfBTRIbTFbL6ALkfxgp
	DELOVZ3naEL6GZa6YlfiGv+dopIHL9cp65W6qWGfR53RUDaIbycBvWTvNz1getL1
	kV+GidfFto+svfwgSkL67CV1gHxQCIm7nx4UyHVvWP8vJf7mzgI/Y9AQpo9OrZM9
	cae5KKkGZcVv0/KpVw3Hy77YLMsRIpuMIX2n7Dd9fbNohf6gTM24YdTpIhZQ1aBF
	ecF+zawMFWjzD2GOod03k+xYUQwhyBy2eiokOMc4Bkynx9kgbs5dgGJOzAcYiaec
	mt/xjQ2IbwVUHHbZlf/jSFTDrujqNPPfWhj+zZT/HZw4ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmnjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:16:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7164813a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789352170; x=1789956970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUlKOakabOfOfKvw0tID44kByEWki54+dGy5HyjJFPo=;
        b=Xo1gmHuSrY1KD/E9tgeP149mtsWODNwk68M0CWeIBG4gtbFzL8k6QZxtzieDG3dlEU
         OpEw6SUvxKIDQd4lMPX7Eft6jdTs3LE5qLjeWISptUsQLqGtwIabGAz3jjIwdK7UKrdh
         gl8nQ5NL1oS49kbGj/2zL9P+rWokP52Oxq5nRgvuqZzwJZIhz+zCOYs4l38apuGDZnbp
         LYwh5rCkN3OwH0B1/WcGnIF/BlxIEdos36HZk+oHlpua/2Y2v0Lx5N3RrgVwJy/+S67k
         rqSwa2dPg0pMWql8WWY3jrvloIiJCNkqlBMgxVsxoDPsB/zbHXhwLqpl5PSvZ4lAlDJu
         JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352170; x=1789956970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUlKOakabOfOfKvw0tID44kByEWki54+dGy5HyjJFPo=;
        b=tWYn+wwE1icK2m7a6Z1b5wpy3K3voUvdzShuzExSqHzyMhi9qxW6YEh++qejXe+PHh
         NrXix68YEDExw5lxxwM0T03Gcv1q072ynhaPaTqg86sf1SdXCpiBRDCbsfe2ttwb/DuT
         AHG7vJy3NAzCYtucZyjWmfO7BMmXGTt36g66gK7OJQ5GlaSVHdwvVGYE6gd0igk4yLvU
         QpI2GZvFFz5hcj3dtVaR0r3MRX13JvRIlWRDJcQWhiIxNJrvl00D+FLpbouuR0FBHrMM
         IBVYGpiDkqYxk8kntFJyfExIOffUsM27Ev5a/2rQI1DIxb/drcXfwZ7wx7oFwNWmHbiM
         1YKg==
X-Forwarded-Encrypted: i=1; AKwUvBxIhET29NUMVS0J7MBwzNrgepgKRLT143bA03FJmgP58bpMQDeH/LtY66qc3f8bL9oyr3PyaRBYdZzf73M=@vger.kernel.org
X-Gm-Message-State: AFuF++mOa4PI9/59/u3WJCzdErteIhWMsQiBEphC0sjudU1NWqzY6Cw7
	yUGeuVROC6fLPHQ+epa6Ek4rIsRsXdGQD9RiHoi+NvJDEqR2Fo9QlviocNgAKFv+6WZOTzTcXzy
	QVi3ydi2uU7EsXvsKWH2d5VTqmYU66hoFYgjzYaqO9HGcHqLUAI2xPPs1bQdNTbGFPQQ=
X-Gm-Gg: AYBFou2fVgBeTSkiP05QcMb1QHH9Vp4qF4QNSzaju8fSCuB06JAXLKAAPHYIbWVxFTb
	Yn8HFLlR/2rkQeAUxlkd8LhwNYHsWQ+FCbFNBVMMybt+kzUCVmWxQBmaxOf17SwoTUj4d4uYZa4
	qp9q2MzMAXYDu0dTU9WszTQHk0mjcEr6zwU024Q5HU/Hoi7qkathHTdBManLoG3giAD2W2KyhzQ
	SP9HDKInhX30CI5mNZaBDiR2WyDqTr7vpPH6eri2EkXLE/oL5dfrXtetENB9dVlkrAkyuUdUKEZ
	qTiSKZGG3EK96lxomYGpKUB0bN/pvzCv8p0Zm1Nswzr1vJqvuZ/+Iv04R7RqrKLoiIO+KK5guwr
	HCgXjNo0sKbeAIflldOaNiu2czsce0ysvAc9khJXLIvY=
X-Received: by 2002:a17:90b:55c4:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39dec06ca7fmr1443718a91.14.1789352169984;
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:55c4:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39dec06ca7fmr1443678a91.14.1789352169614;
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm22477711eec.13.2026.09.13.19.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:16:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin
 functions
Message-ID: <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
 <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
X-Proofpoint-GUID: HIGq1IE7uy08TBDOmYdILO-KhKegM_Iv
X-Proofpoint-ORIG-GUID: HIGq1IE7uy08TBDOmYdILO-KhKegM_Iv
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa758eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nm0QhUF52wnen16JF4QA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzMCBTYWx0ZWRfX96RaEnySLTca
 U3cQc+RZpTDrmlkIy65L8siuXzyVS39aMZzBk33f2YTrTGV6QXCaGsIJNoHBUkkpu3cVF6AV2rh
 orYtqW7+lZ7HxAZlNduraiMBIvV9rLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzMCBTYWx0ZWRfXxICb+Q87n1jC
 IaC4b8XWkTN7ejZp/eTetTP8Pr8KgShzyi6pR7JFqyVqrMmrvsYCBoVrxaYBhC4DHJq0u5ICFLD
 2HTWBZFQZKFdDI5U+DMoVzEIVQXOWOwuzktoO4z6pPFeIzPAz6CtWtPu1FT8AHioy5nuhTUHVQ2
 B3QwLOdQW9XHJqdcLNkLfJaOcDvbo9siX2xRtFJ0ZEwYuM0srD8yrUslOqcoosnSbxMgYcOXx8P
 PC86TlknZh7ItNXgL+/OAFHQNjFdngt/BKhixW7lP5XwNMPgx+IiebM7WBzsNM+2kDf3eHHE7R5
 Ss1WwQe/3453C9eX7OzHx4vkh4CwY4ExU4zbal7F03LtbFlPr1qK5GJt4lN6K8W7mKD18BTCVUg
 DpaHPk6LTlWgrFD3Dg0XxqT68SLClzbWgJGHNycY4J2j2jQ7JjsfBQyxJNZOM5UjgCqnBNDLBNE
 LaYGaJnwwXXw0zBeGtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140030

On Sat, Sep 12, 2026 at 06:34:14PM +0300, Abel Vesa wrote:
> On 26-09-11 22:20:36, Shawn Guo wrote:
> > The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
> > the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
> > indistinguishable from the UART ones and ended up muxing the UART lanes.
> > i2c9 and i2c10 therefore did not work.
> > 
> > Now that the TLMM driver names each lane pair separately, select the
> > lane 0/1 function for I2C and the lane 2/3 function for UART.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> No fixes tag?

The Nord DTS hasn't been picked up. If it's preferable, I can send v15
of Nord DTS to fold this fix.

> 
> Otherwise, LGTM.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks Abel!

Shawn

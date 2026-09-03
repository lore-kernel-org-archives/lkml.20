Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC44398E4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427784; cv=none; b=KT7woAiYvdKOeO+GfR7HatK++iEJ/jPrel8JzqPxmYNyvsBLO4kf+SPAeRALdJ61P4O5Hdmh88AFgunKvTxj6al9hNvBPIzz4SRu3LPK7A10nY7GZ2OQ8YpX9LuJshdAmDzyzpTJAUMlAIHuU7yJ2HSDKE91QuWfBsoBNDrRCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427784; c=relaxed/simple;
	bh=LlrGf/HAdZjQrur/F/yW8951iC/lKHSR84KuXZ9FSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1AzFxqgAXQisK+CdnSIdFcUYCbu6INAr2AEoSqPKtFg2j5Kr7uvQvjWM9dtKlMDR5zmzmCkUhf7jIHkK6w8LSqNnnfljvKEbAM7RSJPejTbZeoXGM9BPTnjQsovuH1d84jwIQl/L5axUiH4yUORj8O9t21lIFAiJ6miDTSUeho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVyVAe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYlfe0/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuVyVAe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYlfe0/N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392E6K1158795
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWogIo6Es588eAen+x6LDEv1
	cTiGVBUYtYi7kGaI4Y8=; b=RuVyVAe1EySwhx/wJKo82dVcG0/wHfZT1igI3XNb
	/jjVKl6vVrLDGe75nAXTJt5TtSqzzo/RorE+xAeAPuYEyVbnfw3+EH1P0EWnj/at
	DQQJOgSl0RJ5XdAOLQr833Jm2ohXRbNpba6aGw0DzoCLQzcUDj4F+hDdSo7hZ9K5
	1uiseHYfMH477z7HXNEeHZ2Evbp5Hnzd5sdZszTYCqxtRd75By7YSwoAs94zsjQA
	35Wsu3EbV1Rg1BC8GbCHPvMtnGgPLwlUd5k+4wCg5Hd2OAesKY6BiOy+TXr/WX66
	f3tN/SBJr33nQFsIiXc67szx4WRiu4LgQJIeK0LAq7Yqtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnmb20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:29:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso476523685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427781; x=1789032581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=AYlfe0/NzaY+dOHSWizz5HSS96uNIcBSWvk9PCiTtL2V2+wnGCR1h/8lkWB2zCHOov
         JOMEb06cj6ySGp2bpvO//kb2n+gHmZCIw8s++ImlcrKpgYDptUFWK8L8w8vOXtSNwYJS
         oCR+dXOKXggAfQZrywzWZRHToiwKbW4ihvi+Wvg0WEhg/7YT9zDSSGAhAOz8eM1IMrQv
         Nxl5sikmEoKvJ3YhGrdlsF9sToHhZVA6+qMucGoj2C/1cFe8h0ZkFjPaH5JhPAx3xuxm
         dF25oRZbTa/6/VO7FzmyDTzsum1HAuqITEYby51R01I4xFs2eQuxEfezr5RNPMoQQaGx
         MpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427781; x=1789032581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=K85di/EI0N2Hox4Hn8r5VldhNTeinxkWEIlx63BdeLAX83KdFiml+Mq8py9GEtw5UU
         Vw60SAK6vfaLmU74CgUrOM5QnSRg/e0ftyJEVaKwWjWDM2jNru/BV1KPLlQVggM3ClxV
         Ecdqz2uVUOVzHxHh/NMjU4mgvDwjFyEHHVqETvndyQc24EtzOTZe56m9a4pCuS4Qe3Ds
         ZpqQUzrMMhfIpywhY44xgweRyCO/t+/gZRGm1or+Tgm6drPiVpCZ40N7v+TMQMSuImW/
         DJwWPXMFlb/x5ae+mHMAJ17IjRM4Ow/49Wgt8y4nK7ovqDN+u8S5zd2RswqKMRyesWEj
         ZUOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW0IVllGtrxmgcUvmMQ8ga5fhF5gbWCKLICPNTfgaAGjQ0ZTlT+SrAjoz6DElpNU9K8eiHuV9+UoM9i3A=@vger.kernel.org
X-Gm-Message-State: AFuF++lbyjy/RV9nT+kORyCM/KwUGPxDBJ24LCbv+TghL+Fm2dynsZbp
	dsgrGn+WQEdnAw3DqJgSIoGIFthQODHLZHi8Xe9cChGQjN4WQGjuad55p6sd2EQcVxtLL2TzalV
	pxkJxkh1f6DwQ1ScwTN8mfRQ6ScB7kDon192370KELcHZMr8vFoByf6IWIfC3yN0DwMk=
X-Gm-Gg: AYBFou3JkikmgS0Y33n8tgM1ptredW5cCRyCajFad+QTHcxyMYPWgbqOsFstqH8WUad
	r1xe+CJjg7S22ZxDB+0atc8MlHQ2KgXz4XWaAa7DPvr+Pw0Q1orNS5YTjagR7Qr0sTVGe2lJb1Z
	urR64uPwVADEhNeEFvfZGX7FPnjYNPwQF7DMy5lUJZVHVUwl2cwAIaJWF4xjsUEDZhVY710v8Fm
	HeKzGSuHzrBsUKXmLpRnY5MtoCZmPjyJKPsU7ggOAClfKfa60EwP6wZ0s6W5h14qxHpGMKug50Z
	4z+gUsAh441OSP2VJH0tqVQM7OfmhZ7Sfo+i8EXLrw2CqMeGXVzV9Z7rom6ywtZLSsm8DUZFN88
	j5nNSaAOwcrzQRQ==
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278347185a.9.1788427780892;
        Thu, 03 Sep 2026 02:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278309485a.9.1788427774738;
        Thu, 03 Sep 2026 02:29:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm12822292f8f.10.2026.09.03.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:33 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:29:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
 <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
X-Proofpoint-GUID: E5tpYMS-JgHMjMkTZdAxI1Qe3bPDbyE-
X-Proofpoint-ORIG-GUID: E5tpYMS-JgHMjMkTZdAxI1Qe3bPDbyE-
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a993e06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Kre0GHG-jOPd8bR4PBcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfXyl//1CxuHacS
 NNUuv1j1MhKvc3iMHvwge1THSGiZ0WSpqjUqQjk12IFE4pZZ5FCgI1WwJYMOQDdB6cGfgN+0vDU
 xTwvpl5S0X2P6aM36FvtLztMaA/O4O22q0Pk8QZ9b/QvBXrnwyz+7HsL8G5dynIrUwuqPv1bgbf
 oMdiYBhAzgjYREghWamg/uxhycmGR+mKQl2t7ve6e5xcBF0KCkQK23be5buo+6rC1wFzUK7HhfI
 kll+lNlTQ3xGOTCn+/LH3ZXLiMfZu264rT7SQb3e6SeSx3IyRp/LvIngywYEE0/Z49R/m+5ysF+
 cGqsuaz3CshxldZkwmOXxg0CjeVHghREYSP+Tz13nXTl+Fz0SzZIsvSezhf+f1yAmZ+CiWj8EXC
 fJaiKwZJ0zUkqjyNEEMaUAA1IBsDMTQHwpyg0Ojy4p5HZwmP2xTQEQa1cjg35DVIPcuZ2p/ZgAq
 b9cVzYBrHHQyRUokdJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfX3wznFDVqU7eR
 pZ2jJo2km8seQo3gGE4J9MmdwXavnKkJcjtyNkAe/coe591mvaH0PCg0ksQ9/RzPoaipQCWprny
 X+GpfjoO8KMaBfaY3sHmb3amQeLeqtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030081

On 26-09-03 11:16:20, Konrad Dybcio wrote:
> On 9/3/26 10:34 AM, Abel Vesa wrote:
> > On 26-09-02 17:53:23, Konrad Dybcio wrote:
> >> On 9/1/26 10:06 AM, Abel Vesa wrote:
> >>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> >>>
> >>> On some devices, toggling the embedded controller reset line makes the
> >>> device not power up at all, unless the battery is unplugged.
> >>
> >> Have you confirmed that behavior on the CRD?
> > 
> > Toggling it does nothing observable.
> > 
> > However, the documentation says this GPIO is actually tied to EC reset.
> > 
> > I still think we should reserve it, just to be safe.
> > 
> > What do you think?
> 
> I believe that contradicts the reasoning you gave in the commit
> message then..

Yep, will rephrase it for this platform as:

While toggling it from linux doesn't seem to have any observable impact,
since documentation does confrm it is connected to EC reset, lets reserve
it just to be on the safe side.

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811E49EC69
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784073; cv=none; b=PwZNzdtL7UHXlAN8tM4Bkjbe3qTkVyvckPrUgACQL5gnfaGqjprgJisDlPdEpL+obo1LTII2Th1pT4WanyAv4vEFkGyR+PpXACWrn0seyFYGjTFacljMoghzP6ZqHxssc1CtULNs56AlUn/W/+E5PX9GzB5J6CGeYoozDt43PDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784073; c=relaxed/simple;
	bh=+J91eDr7kWpWxL2VErpxQSnatb/cbGe70zHEmvdVQEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SA8/v+w8Pq7NAgKfWcleti4V1YK+Gua49K1cyyqya9n6iSd4HJZfC1Cnx9cISm8C4Gh3Uf3V+ZdM5zB60c59Kfs9agce5IbVTQPpzAtaw+4mWLl+h/dmXHq13+UAYfBoSqO6i50XGzjhyGGoOgC8LXE9a1/SJ4k4FMQ+LnJxbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKOYizD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAqJiVca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKOYizD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAqJiVca"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3vx3873334
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=; b=DKOYizD4bBHncWGl
	CTB5/7gu5v6R12yd2UovTGFWcxBmw9uHBv4l8uH9gMjKWYlO2OlItU9DBI2kU3xg
	8WanJcPp/ikThYtLa82oP+h9bCpbq6UqdE1h0GVXbIg8bzqjVb7asvBEmlhSn1/S
	Vbtec5ggzkFjJk1qpN/rxiXYVcQge/eVGg7k9sFJMLMoQYaiK5zHOn8y/iH49ueg
	L2vy79wXrkfhePL4VJ6yduAVD7BHIBLbHw4wQMRlaRoTXUEChJ8ajwlIG+5NVv49
	3SxZeMoPaBL3jOsR5wTNyM4GfkSz8jqJ8AMIsx3gQuYQyr+XeZ2Nn2d4xD4wap9k
	/WyeOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1yt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:27:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so11290736d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784070; x=1789388870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=RAqJiVcaaeZLy17GIU/DH668v8F1QTDyjolb9htz98b9vjISR234mobIN/pPuZBT3N
         gYn2lnGwD/0LELSE4vUWSaNxGbLuWsSuL8Mk5+vYlUsq33Jvv8G6iOqgxMQ2pY+uWwiQ
         Ti/CSorYtCqNLGyIWG1+x/z12yzCT2U9eayj5JbprH8/V9AXEmbhHIZfzA6H1xKwrjoL
         8B0giV4cTMhoQNEg8SEfhkYHHIIUyP0B6XQVvegSUGeXvd7lVOlDpt5ls9rO0T7VHD2M
         rMXIHiTsZ8xzkdfs6qS7+Dm29a1Myit7akfMbNC0KgaB5JeCXOD16OnBgT76feY/2gwk
         j9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784070; x=1789388870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=iT2/ftcsE+CNim9HhfqL4ttd/PT/B+BmSwEB+9dx3OvQ/HAocIbr3DsrIg+bdF0/QO
         fmOgjmg7lOozl8M3d2co9k3Cvyi93W5XNPAR88ZS8RjOMGZJfP6nRjO3sPA2X8yQEMD1
         kPE24eIE4gB0BtW71L7O61FIabkbga68ax3xUJ7gr7EjB9gwjfkw019Dxl8SrI+lEzCo
         z0SK+ujlXBXbtR9YlWxN07QzW0jyVr+VnsS+u9zyUnTTNuQ0KVepbOM9vNMkfiLCGv0a
         BuQqOXO6sbfFtNFxYP1qb7iWW47d4FCRk2EnWWHEoAaw07Fv4cOSH6kigb3n05huob43
         66tQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6pKnoKErbh6ptavUDr6zi95FKnrlNb5xedxXq6uqxaQR7fLHjKMzvMcaFgHWYAPi8XrmNawcu5+WWkmE=@vger.kernel.org
X-Gm-Message-State: AFuF++llAgjCmZDyX0oaJux5J9EenOLE2MnunSqJhCY4LFZ73UJ2Skvd
	G8u+wQ4JbcmYOijefy+qT5Vp/fV8vfgdn1jjKbg3CHpOyVpmQxFEqTY6Nryh4mGBTZfLL66widi
	fKc+yLKW2QLGv8wo/CvKwJYhOV4SW6sH6Kg7GxQYvANKpM/gfMF7qmuJwisQokqSklys=
X-Gm-Gg: AYBFou3TnT2Ehwa/61d0r9T5a5CDBkfIsCZzhPoamtjNr+5QeF50bUJSSt5hknYMa2o
	l2BtXbV3ZiUzHDrr1GiHC0QgQMY2EUUrCut/zMrDL3tgWQygpMwc13i/Pp+hEh74ybiUWbyywRU
	2GE1Bx+FBxliET75NjMMbACGlrsWl31cfk7ryR0opN8kO4M2o7iETaqVRfIy8LsjIC3mMzVJdnI
	53apXXxVlyBBPAWArSSymYot/U78aifT9NpH/Zoyw5tc8HuifaDke8QFiAnZFas2kRMX+ETKUnw
	QuVXnJsknbLv/uzE4CZSnnfJriaVOEZyVf62CuUMFetyWIH/DfZ4GvclH1vUbEnNQPyC96cvKBh
	J4UDoa4OgipEC2bn1VJxkYA==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794477985a.6.1788784069791;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794473485a.6.1788784069191;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm467446066b.15.2026.09.07.05.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:27:48 -0700 (PDT)
Message-ID: <b4e0dbd4-f50b-4366-add5-e99cd4432aa8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:27:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfXxDYWN2KUSiTy
 8IUzgsKnK/AdDaQAYdo5bi4iLa5jsPscUBAvdIdWxPp011beKkGf6TnJRryXlfKRIPC/5iaQMFO
 +kVG3VJi0a8jADZBmQARNw3JICAPGtFQjPd4cTZ7UT35kInix9+Dofn5wXOjfLkdIhjBloXUl/f
 rsZCHdwXVf985okE4Gi0PVDsZcVivLdlK82ttxaiueCZps7M11W70beAMBPFteibY7mCIj2jD0s
 d9x+GPBIMiLii+nIcUd21F/JDoAJJlmFESDERSIVDOhEXoydsiMUBRRy4ZLHZFWjjKQ97rIexj4
 1mHaQ9z1dyVI7JVfMBUq9TF24qrrDuJTHFETx211jZiACvgOboQJPRPcx4wM1xwZNrQDMO91XQN
 NGmctNUqgKdMxgimVylcDSX0XimYhWfpmT+Y+c506bkwLri7bl2ClGH0NQ2f/U5oJVmz5ofjfgX
 lLEAPFS6XGFFYXK4Ndg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfX23dsPUmi/Ppe
 oehNT7zwRBYFOmQqLbw7fThkAVgkUZNoEdcREQ+GFLQZ5rEsBwnCqoOPHkw4jwMZQfJNP6d8kTK
 XChi6d8LhsIN295Pw9dfNvkNMwJezkk=
X-Proofpoint-ORIG-GUID: qsOTmWZvFws3k-Cu56OqLWla5HFpFAMz
X-Proofpoint-GUID: qsOTmWZvFws3k-Cu56OqLWla5HFpFAMz
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9eadc6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qEK3ycSJ6RxWlfFwZCkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070138

On 9/4/26 12:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. Primary MI2S connects to an ES8316 codec for headset playback
> and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.

[...]

> +&i2c0 {
> +	status = "okay";

This should have an explicitly set `clock-frequency`

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

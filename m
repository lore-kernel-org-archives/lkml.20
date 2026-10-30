Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378548;
	b=xIqv/gCOulE+ZROE8c4jRPw2OGZKyAyPxQ45IoVEC/IyzUwA2zgyoIVhs/GsT3RYMSzf
	 /zCyPjtbOfJtstRrEaElv8/QI//XXglzvJoyBQQcm+9bzGXIIbc591jA5vIKm2CIDj7OP
	 IWkzAb2NxtFhKYm1smOirt7AAfRDFJTo8F0FzAHgixJIeJ/iryFGPBTb/Y5i5fTSzxQJi
	 Qs4zIoKXHiHQ+ssW1gCOeNnkc/zWVwo6NURNPDPrzCocHs++/smwnECnEMolVwg7HKXHo
	 4igqyCuqpq+KHXcsobAdWqUesZHXevQ/QhaGuLMgZBHfZXIogAOdK6YzuvOMD3jPx2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
	b=FdcmEOb6ZmZhAbCQNKxrKBfy3VhqZs7wI2Da+x8fnUyF7k6cNFK4O+fI08HtJ5DTOzNL
	 VLCKi3TvDwZAQ+Z89dSnJ9jKJH12zppOkc8wkw5hzujBpirazuLJ+uLZ++T7WFseuL8/e
	 4MQXxDkNKmqKpK5NpMAQoO7rHopdAKujQ4oqGYyGPz8p9e1qBtn1a+zdeoVZGJkTmVdO+
	 e9ZsIjVA34gyI6UIKE02opKR2lMrASTaSHMduz06fO9MAmQioURD6+Rw32l12FRRzEkg+
	 W0CZGrhOpgAELCpt8xIeP/pzEZMc8W4nkA2HYvLEESjkYDJ5zN2atGHztaYA935nzVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEF606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UESNIO1955490
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=; b=GxSHJkUC5198O8Ih
	SFnWSUT53ZoG6dH9Yayj4yDGKREpJGRnLtX7RA3nqm+mNj2g1+HV5ahmoXmZ3B3a
	7W90tx0e4RUB2V/PFsJejoe/qQxXh49tXekVD2f8n/j4QlXIyBHaZDt9UKX2Z15Q
	k09XkDyovLji2vHvW7BiAzDzTBuZtiAJIBp5EzZ/Ebri7RjlhbpfhbVQRFxHWICI
	JSHBoYz6hpmjNjFpd+yLZcsUFuSflhVaajs5+X+BPTj+Dtl+fredVi/giyAyGWZu
	2NUU2n9ydMEowgV/XhZuNPdSenzEbbLtfsqwToyBxfANnhaZNTWVjhhq4AKxUDjM
	44yTyw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pm240-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7051c542f0cso840816eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378546; x=1793983346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=ZbeKqZBPEpk+WssYYbYsqnCrGXDed9tH0gpmBh+dH1Q257uHUdPvy4EYTvtJF+dr1r
         kZY/L+ZcycM47wjCKjkVM7ByrtqHwJcqd8IHg/jkxagDzTbHCMS4boNbWrRBplKoY3y3
         q/ppnPMVXfTk4jEs5jYM0zb7PXR8sp4p5zO5phrhVeGz4mjm49vjYdmDmyZWw/QiNtbE
         t2iGYWzMfqeEXg9s1wl+X5y4QZlf7bpz80svXM3RX6qjctm9bXKwLAZlYzmjSeNT20eM
         jpj2gAgpSz+sHhxqY3y0H1TsQoj5T18IUYmFaoXh/2tsRGA397og8Qgbc36Ip3CTWKA4
         i0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378546; x=1793983346;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=IiVoiNX+eQfWLuHpWC/GwXpwIgtSxjqA4iVFOvKj/EJSG+oljutazTaZuUOawbk/Vg
         s1hp5QS4wlVdXkvU3jJ9kau4NXicOzr9lVuM3aoAZNkGT0iBuPFGqm5yOZK7BSZHBBj/
         z1jNd3iOwFTbqzoHz3yL+CULBjDhgz0tE/UhtUgRm06Ey1QM+5NwI5dAkgwnLLpq5Iu+
         LahWbSz9ypjpSytlx9bMk3ToHjqTrPE8LCJOjCJ+YS4SuKKHd5q3VM9xEW6sDLiG8Gv0
         razuFBKwDdHdUjP121S3YoY9J11U1zJe+YZGvxa7C+RoEb382iTfXmIy6Z2tCsyHT3I9
         NV7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9oFUpZ7bkrlTfHjyLBtCcdSzgpMOLwOfhrgIAh8H4XA2MLwyAt+AYuXPUs0pkaEq12mq2rF5HcFfaoaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSvYagG33zm+ekeO0c+55VsL7HgpKU/xa2CUqJKAaGymZg+/sQ
	FsmHx1EhKBgSgmmqR8QJpRgz3JkXyLxp59XOSbLEMdU6ZFluh8szolpyHOVOgTcE9fZfIfZM2B5
	yRBPD1Q8wvGKKR1sI56aOwNYaJjK35GkiYCt1VjfG9D8Ed30c00ynU1PjZ+4vngV/rAk=
X-Gm-Gg: AYBFou0YyZTElGpapaslGYnaM3AR/hNCjqRMPcLj18Wir+DVQjD0Wa8qqnqFLFcafH5
	KETRTv/yA/XpbRwp+vyd7tGq9wFOcZ+j9eYYdLz3uSGSH/9x3QQrNWwwEAR77++FbPtfJsNOeZJ
	c2QdpHewTdH81z3vvY1BoveihSwt/iCk8YvtOyP1nIew9Em2izeEqjqEAAh801ZVPXUKO7+FIVQ
	lquUMs4qwGNMJqWDFDrs1C8hWtVu03d6uIfy/1/gOZqzzGXCIVz8lQiA96gG+iYKMKRms4ojXAf
	pRbNAhIk71eyxyqNxj4i3EAYOVjUAN3jzpOxSeILBSQdGd9sbxOUAdt+f15Op+p46TosWyEBRaf
	ddMKD8LnVdbCzuXLOXfV6ExqTDkWRUzFxTogMMqsk95HVBdY6VB4tcYBkTgADDjD42JpoEvi3xR
	yA
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576124eaf.57.1793378545973;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576112eaf.57.1793378545592;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2364487eaf.1.2026.10.30.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Message-ID: <d21ec697-c3ef-4bcc-a74f-128191a417a9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:12:13 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXyL7Ye2x1MBpb
 sdp7u2l/ack3bEdKUyedHbAL3TEMwA3nhiEbLJ3yWiQ6FO85i9mBSv4NrsaOhvkP0c5CrhxKyQQ
 rMajkdeHIrCc1PXkt2xgLbyf82wTO8rREA3TAb8CRsTC5beM6hOojxBYY4eHqM61RVLGvzR870S
 UpSdpZBcmMs7khwpyI7Ob1PWFA7066Two36ZWSSDCS0ITxDmcgMpPVCmXf9Kkny22SvezpGcybo
 Z1VmLusT79+GHaNZ6hiXApqN1bm6YQFlpO3GEC0sAF919Ec9/XmR3GWHEgLim5lyA2wk/Eo8B0P
 tAT6QH6/kTOaorLsdZof9dL31qgA2dUe81BUkl8MBuPvcQjx6CDdgcvhofsM07okIyZjcn5ss0l
 qtWopCLaYWPDjAZCx65aM2gMqngLOZa2PGzMumn03vs9n+mficJaxTXhrStRUaHgedQUmUIcoNv
 6yu1GalugB7k19/U6hQ==
X-Proofpoint-ORIG-GUID: WPDk9HaGcsr7pHTDBtT7oWt0jNXr7NsM
X-Proofpoint-GUID: WPDk9HaGcsr7pHTDBtT7oWt0jNXr7NsM
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4c8f3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX/jUCH+SkBgqw
 rv9VqyQx8Z2lrqVg9vllN3loFRL4zDTCIhb2gs7DEFAMIyiDg7ol+q5SbKHNLiKy0cLjd7GOn73
 3Gdsj8pkQn0OQhK6b66RW3/zo565dfI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300066



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta


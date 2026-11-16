Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796760;
	b=Yc9Y7ZGYhFa4tXue0I3aHCx3gvJyycaiK/IPZaXGDAJHzQXu1TjRhybMiNb74dg44BSX
	 Hv/MNiGIDAE6R6ZR7LHlSslehQ6Wed0UGSflhgXjIocgBqnSl8gcMaeDdCEMFE68a0yyA
	 IF4WUxvGymW7jZWd3+zMdnMdBirvSyotv8zxeBfzRXeA9XPwO3YIFGLL/2evv47/Y7uZy
	 TmXv5jYyoEkxgQCw3xo1QBTkN/0FnL7tIP0oRfFGN+bBb7BTCFG7GyQdz7baUO67XKC0R
	 JGAXgE0ftgNodMzC4mer6+guYxEr0j7pxtHtFaDHAoOERmPlsbI/KGk+GqgxZyVyGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
	b=ZPLbYt2r7PoKTPJ5lGEzOp9fUOSsSfiG3iS9Job8lI3/3rf3Mqit1R5RsMnzOItcaPif
	 GqakoyrCC29+m8yF7MDaQy+qk3KDB2r8uWxKKtWLt4rWkey8F1Dh/x4ZFJk041gsSr9nn
	 gokgP+ag5W7I2y9m0Fh/J9/S0y2N5UCX/MOlEtoGvK713XeYKSUxBad5feE291g0BcLsm
	 p5QZmMbBp7x+FtJJ13fSCt5dIDxGAGIFkzVpYDJcz+x176vfgF7hyypkgY2lcokwAC2Cq
	 S0xRyttOfGlcbdHrhqM04bgdlfR/0PlKfyLvJLKl5g/p+NHJvJJbaRxr+YrcOYeVR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0A606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1KwmD800011
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=; b=YLWKz2pH5QwPDe6W
	iem3B/1wBS7jDUWVIf/dQP57tMDzV0ZQ0FsCjVxQ58kQfNzmK8rCic+0V/Wce836
	a3zUO2XBuEJ9Hnboo6n81rpxC3roa+S3lIPhxCWFawqLInL64DU3Yz0qz56uiUiT
	h4nJmPvREgPVTand+c2hVc6lUi+Lz9/jH3F7TjtbXfznaj04D21X21tbAPYNk8Hv
	DJo/n38Vv885v6wAirHw7n5A9pImQz5Eb8QIGScgzEqi/hFEs7BnKCw/Vrqxq7yk
	KweXdaE0rp6tTW8CmeU0GF+BKHGP+o341A0V/UJvSgZu/nFKMiraNjN24L6jP+oo
	Xznwcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmambuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so304081185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796758; x=1795401558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=HfQpKjhFzghzd68+yCTcDiTZPumg2TRs08LAVA26xvRkrcKeQyVHR/w3eI88gRrfxB
         +G8Wt3BMEPzgvITc8Tny2ZE25y6D06Nlqj5nOELHZeM/kj6AFKoYWrHcz/EOxAT8hXXc
         ZgGxwXw5SEwGeIh5w7e/DUexkdpv5jNwZB4A+aXFgu4BHAxzpOwvvzKfYcJktkhTIVKg
         TGzCa5adYW9I+45oc9ScdiL4jTTIqAF7shbErwuz5g6bFcM328Tt+vwwJzyPfDCwM/3S
         BD7IQvF++Q/PqZsJGdDouiwUhCWzbYc0a1WmvKs1+Eq6hZ+xXtaojVj0kbt4c4FXlcft
         LocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796758; x=1795401558;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=Ky9CVe4a4WtwD3rvYDqZqCmSNyvbwXT43NItvqWK/gXPtMkJys1aWrQaaltXXI4r2i
         hAjLr2OGVi3pK9LSlsfbJnZns5wrwut3L7MBa4I72ed/i3dypw2RI+dD9VMOL/cdAHEH
         +HX9qyB1/ZEiJ89prWJsPSAdy3i2UAzQtUgiU75pRfobGw74KkqgKWQjcmgWQzlEzP3N
         LfVE2zEO2RYom7QkwqsIzLY9JzBGfC6IH+JwdEcLZ8yFcqolv13tMcEl4i7KI3BzHBVX
         ouXlV0XeC24E2IDomvrmTm2T7XRN12692iKfFf8FzdQgxs5Xn0drzyMQDd9xmg5WRHc1
         U8Aw==
X-Forwarded-Encrypted: i=1; AL+hErE8HKAQjoB9WHv1VNeHv0Z8KrlVbQ2wdjcE+hd/fkUUW9h6x0JkQ1cKvDsDERap031bRHquWCHeh0OUS2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rWjmbf2/f+TCEYHb4XCJ5alAPDx/fIl6Iof31JpLA2f82zRL2
	DVKLx8vc2Y+HOhql/RLW3Ens4DZYtndADt4PvoyF1Oh3iOoYtAClbVq37FlQ3StDO3Vc4IVdch0
	sQsGcWZqq+1iwq5huEfjavNn2YY7TdXj0yhnp/16wVJZ6aTWZcLGbKwVAIppAOsSgn5WZIv1Nlu
	4=
X-Gm-Gg: AYBFou26OA50kIdxc/O/RPnkz9jsaUkaW/dOI4pZ1h+bdlsadN8tHV6OUgabbguo6sD
	hDLi6M/grydIuXzhxr6UdfidL/ywpqIgSTzKCKE0VBvUHJz40ODMQYM/sP7whHIVxXGC+sj70IN
	VEJvQOkW+iIIAkSiMod9rl8qwwD3qMmz2vrY+lFWauP4hixIX7GvcC7yedRT3ernDpABcCRQJYf
	JscH61DVl3uFi5FdITcQikIY8Ww4IIZaM56nfV98Mf6DSsDOlOdEzhArdTY/2xVAlG8smIr9F6x
	sOlVBltrsZlt383LqHXr7OrzUZ3Z6+DKdzbf1TxCfDC5L+BRh2gsq6mJ3avAEsQsz+ktu2+T3Fm
	FaOrB00OdEgcI47D1F/xCoicXMjv9dnkbF7JMmf87XLEZ8wR0ReEx/D/hGiV510HA/NVw3yB238
	i2YXtOzk8rrzzQA4zZ594Mbyk4nhlMXXD2Ng==
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926217685a.21.1794796757754;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926215085a.21.1794796757283;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ade7sm75767716d6.5.2026.11.15.18.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:39:16 -0800 (PST)
Message-ID: <12a1c1bf-df65-4ed9-8d36-23d89d5013cd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:39:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JsrOU7SM3NtKnqxHH5TdKUaY3yTN4Uip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX8hNcQW/VZqYN
 FPqKMhROVTXq/ZcJAwEA7GcbDIPxh5zQn8BWFZkTYiQgTktQCA4n69wc0i+7mmyrNtGD+6A8Q2A
 2sdXL6jzelZfPt0qdIyO0sxmMhJRjOAgt7gtW8+DDEzZ/bDDG+q8mFnqc9jOKBVxK2dNnmyACqW
 WBzIl/OoGZSmzdufDYyydbpIN4cRZTpRhsZRXOXHfIGucF9k/9NQ+O0Rts9P3UhWKr5cHMZ3AHY
 aYztzD1eW9z0tMs7nFM40PxjhJJlLdkE9FxwmKMwR5E0t/T70H9GEC0DVvrOLL2r1s3nOv7WK38
 g1G1eWNNB7jqusnoGDgtUExVs2ip0R1jV+G2+L3EHhAv7nFGVvxIl4Z+HCBkB/omYaVewNKMv5c
 +u9CXSg9RGAVMkCOV3kn5kNckfPA8DZXihTxS8Kmmjm4qaJ2GItVP9HbCizuuNiKYUK/yOwVRFS
 woyM6JboUNOjowFsweg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa6cd6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bVWuqmIr14v8cS7SW4QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JsrOU7SM3NtKnqxHH5TdKUaY3yTN4Uip
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX3y42KolTRzhS
 RfCSwxBkrWCKzo9yXLuWDULb3+Z8i1vVirbJWOAGrktAXTvsJHWrGAl7uByR+BHzEVmRSfY6EaE
 jpNtg2ycU0dt2HN81xbiGfBr4HbbjSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Bryan,

On 11/15/2026 8:05 PM, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
> 
> C-PHY, D-PHY and combo mode ?
> 
> It would be nice to get an accurate description.
> 

ACK. Will update in next version.

Thanks,
Wenmeng

>> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> 
> ---
> bod


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF512386453
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768359; cv=none; b=fYjNGIo8ozOp1ymosde8oay/ibgVSEL1zd3TtUFSvDob5GBrWkXCnaGUyQBeoummRa0aSMh1gojeKV7de0XGqrdJGNsvjHxLoAsjPtIw6UcUAoeMMEQbZGssqwKXXZFgcXRDLrpVgiW5WWYFjhcHLfqtc4w3TKDlIFOP7yAa+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768359; c=relaxed/simple;
	bh=WcXPQx7tMGheRDfYV1c8+KKHPrQsEAxtPxGqErtQJPA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=LAOcGTVDWVktxBb28HC28saSD854dV8iys5V/2rFcofIS5Xyg7hgs3Pu0rnYd3Mxag1UKdItIIxb8WbKHUhIu7hrZjWely9nAY5a3kXpOTby2/tG5sybP6VC5FaWEZKtKCspfoBdaqqSWHhay2in4hOy7ED1hJ1GXYzMW/objvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef2doeZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G95OsfsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef2doeZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G95OsfsK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BMUirj334207
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=; b=Ef2doeZT40tKHpf/
	gJ/AkFWnxyGdnVyMQA26UdzIFPCrlJ16TSSKJW8ShUPfKFtlqVwfMQehhlHxpa3b
	f9ffnFbqpBfQb5kesV0FFIwwQiCuY/awgnDdmSzuJ/7TuAKssJzhfB082f+BLlA1
	AHqK/W1IL6z4nX/bAhg7W/wbRrzNOt1K1kVfBYY1Ks4mVZuvOel9AG4fzFQzXTyB
	Z5/YeHFA+azU6JJkntqaCjIUtkQj165Q//c3LjEyzs2c9IJkn0X6mtYGNzLoslxU
	vSBBV5oYTAEpDgQp7ae3ppmfbjZwX1g5+BYB2M7HFl6qDNC6Fy+Z2RSsGIZkgmRh
	HYItdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmvn36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:25:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so838256a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791768355; x=1792373155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=G95OsfsKxmxq6fKHwlRjxHedlSm/8lxZlV64pvembC/n1KC60acAjMi9vSZya2xxlT
         A8m/ct2IXuH+R+qHV88RfWPEQPp/b8EJAUrCefXMNE7VeqThFGEj17epDykMiDJlAUIY
         QmtwHtvQRMZh30FEPnUcvfKW+QZDDdsQ1f2lxb5Np7AncTiZ4ytIMqihdsPWur99CsCh
         wGRobjD/Ubz97l1eUqEaqKzIGqrEhE5djjhnC+U4h5F8h3nQZj0Hy4owNycX13eMr3HA
         IY/1LFus9NvWMDP3xw2ObCiNjHz0SQodJsGR0jLxVbnxBJOMdgtNkPs602Cw33d4MN32
         YwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768355; x=1792373155;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=Iu4CFuXgHQhTJFzWZrAtfci41SGQCB81w+CObhiYfunxIzEtv9b3/ESGoFyj+MDG03
         7IsRPaWdlBWibKQv63s7O3KiSi6hMFz0x0O/KobtCHNJqO3VhrKBF4urZDCvh0SCD4lR
         S+HtwV8LcbzpZopxrd8PT8hV99wocDzPSFFijF4o2Yh6EPZkIYoVqNqxCfNkwt4PsWmY
         4KPHjhn664PaIEq3+mJc3eYEKTtmWOvTrlZWvB/dtSX8NFv74p40A17wdVRVK4pWtuvk
         XqITcX2ef4TAF/D0aLsJEY+MYNKNkPEDXimxPcrMcIEHhgnip50qwEfLQDyVxHq+AwLp
         yqcg==
X-Forwarded-Encrypted: i=1; AKwUvBykZ5NbfNY8WZAVa3DTvJxGQ+vUETs/7a6ttry25VLu0FsIvK3GBZHNnFSPrie9kuIOG+UFFKkza1uxJxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOs3PzY59/KY0iLmRgU2cCQpvBc0BYl8SE16fYE6M/PTEcbvEQ
	tUu8uH4m30P+IY3PVocxwE6ZRAWpYoY3OS0r2h1hUVoo6ZSX9RlLeRtttawYKEatyZ5HgQh2P+B
	Q296J4yJ/h9tIQmtVUYmJzBbpKKXrl9QQllhN6lZDtw1R0j08eqFm1FdZga0sDoBHJKU=
X-Gm-Gg: AYBFou0/U/d15p93Z1qoCQWRstY4uc9kL7WJHK9f7f3IwkEFU5zjqdGgv8BQUjZJyaG
	DhDaOfv/ou9gqsibQBKJ3H8dC/6orOPsHjSeVBuq8rf4h2O5A2C5+FHciN9O6rtzlKqm5ETn10f
	vYibIc2/E4P4Momxvy8MZJx9Ft5lQt27Cor82jCC4b4zBzDIKNPrEV1wUNoTaG6CwOKEU1RAUci
	iV9YSg5Idg/1OefqeGLx1tqLUg55udHdDHQu4+0KFyP2vQM1g6BZnSriIeiCL2hc29rbB7YcUn4
	S46C3RLpEXB01McLK2uwlBIhpw9NtIn9Sk3P9vC12geunYTFWU9G9AQER0a7qkSJSc7icEmMgWK
	keHE8tOeeG0cmotT8O7w6QM7MvOFxNsYX2yNP68SdR5rfwcup8T5yzDVZ6Dyz7LU=
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383252637.66.1791768355525;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383226637.66.1791768355028;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm1622685b3a.61.2026.10.11.18.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 18:25:54 -0700 (PDT)
Message-ID: <5d4a3126-44c2-494a-938b-1887503c7a52@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:25:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
 <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
In-Reply-To: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfX+mxHbJ9B4Yg5
 HbjE/loUHCzIPQCmiKLqvwezuRjOdvoJA9nCW/bplTrTjAKt7WRaN4+JD6qz8JGoEBwpXZFleTv
 I05heGh5w1Su0jGpk1lKeZ/cFlJga1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfX1XzBulM2FZZU
 ze9UG5b1YU2gTslgn7nFPHCgiRByBkFlIM6gYYYwgE5cUdOXNp09+L+Kn/d/Onw0Xwj4ouwuFw5
 dsbWTzxyRvJ85oDHF9s25+udDxBAsC89BsWhsSNcx2MWwE5FWutgdEU4kmSYxl1tzfP/EmF6NPk
 9QTQgLpPKiFTphAGt+ULYJmGxj7fuO0uCI/Qet9u7RB01FYJua0DPO0OTDpGGmmwsqosfE35R+/
 N8DwZu8q5nK2wkZ96UQrxsZ0fr0JzRg6/iWlp4KTB1OgrWkDHw+mOZWgv9uVlGxThNWL9K13wij
 3eCj9pqUwziDHsz54SFVCZDsEgHZHkZb3ba9dvU+FbnA0ogQwznI8vmKDh8bjsHwlqKrN6RCEdz
 e+QPWWnCf5VSo2uyr95qDaRD3fTZQYYEAwYC3+LNpuWtKNBT4csmi/UlSuawyo6ctPffkDhOaax
 N9irNNFMAifFFBhB3JQ==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6acc3724 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=HmBDO3gPv43XiXRR4pAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DAFmO2wJPp_-YrAXkq5KoQwnydEBlht-
X-Proofpoint-GUID: DAFmO2wJPp_-YrAXkq5KoQwnydEBlht-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120005

On 10/11/26 4:56 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 10/10/2026 17:01, Hangxiang Ma wrote:
> > +        if (!vfe->res->reg_update_after_csid_config)
> > +            ops->reg_update(vfe, line->id);
> 
> So I'd prefer to have a discussion about if we can move all of the 
> updates to one method.
> 
> i.e. why should any of the updates happen before csid ?
> 
> Sure vfe 1080's documentation makes some sort of explicit statement 
> about an update that has been implied for some time.
> 
> My question is why not gate all of the updates this way and make this 
> not a flag but a global behaviour ?
> 
> ---
> bod
> 

Yes Bryan. That's a fair point.

The reason I introduced the flag is that on VFE 1080 the documentation explicitly states that the register update should happen after the CSID configuration and it really follows the guidance, while older generations appear to have relied on the previous ordering implicitly.

That said, I agree that if there is no functional requirement for some updates to happen before CSID configuration, having a single update path would be cleaner and easier to maintain. The flag was mainly intended to minimize behavior changes for existing targets until we have a better understanding of the dependency.

I'll take another look at the update sequence and check whether other older platforms can safely move to the same post-CSID update flow. My colleagues who have such resource maybe can help me on this.  I can remove the platform-specific flag entirely and make this the common behavior if that holds.

In this way, I think I need to raise a new series to collect changes among other CSID genN part and VFE framework part. Could I mark it as the dependency as this KNP series? Or functional dependency is enough? Thanks.

---
Best Regards,
Hangxiang

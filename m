Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EB3CBE69
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699847; cv=none; b=SBf9mrmMqnr0x63IixAOwEZAmEzCsD/vOszAjfDvCrn0SEfQK+JXexYYvZciE9CoR2ni8zlUb/uK73G5O4kt85DxhHUNKso321qS+iBbviMC+czoM8BIX65D5WgDR9pdm7pZcbF39Q3HFP6togg79CM8KxPd9OUQ+2vC/deMyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699847; c=relaxed/simple;
	bh=QjW6DhwnX9n+G3RTO3v8j0+GcYFZ9juol3cYQRMGnGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvalifdA7SAhqkeynEUWsB27YRU57FosxnaM+FQbxmzkH5k7YK9k76ww1b/3ZrmTyqWWb1RG/WVxQwjfPqX62/vbQ3jMBG1T5MA2gYZsPQbPjpZQVFit9HX9UOdCWG1wHCvC76nDp2F7j4wJwQEBAV9PCIWfY0wUiY1dBKG1aSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyojFKwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LABD1LQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyojFKwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LABD1LQ2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6863aiZT3548958
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 13:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=; b=JyojFKwtf2ifnGD9
	rqNm9nNk553PPGh/DWczZPq9i1dXHl11Fa3JS9d46iDfFj4UCTqWWb3vN40k9rOS
	EopsvEIDaS2A5Atg1ooeu0sQo8Chp6a3toS93qRXad+6uZkZa0AzTkSTyQbh1jl3
	2NMQR3W6rl9dLKq5JX3ZzjJT74fJ9RwNotrS7kaSFZqOix62CjC+urMDtuGWyes2
	RhPObL4xyDmTAVStl6YJeOFFa2ePJldo1EljxnRDJUxHcKi7GVNlh3P/ZGPXcuiA
	WR7khhR+7HQVFNjFDzWqD3jKwa7kO0P3oBOht2iNS5AIaB61MbNvGalb4PeUQIep
	fKzgMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8kdtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:04:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so53326215ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788699844; x=1789304644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=LABD1LQ29kzBTN4Xy3jFhzc5wQo1idpBuR+ReI1Ukwkj+wUW/YLWqfVd0o5teeeP7E
         /YwJNFRNN+tkrDkLW5Y5ZVXauED20BALoXaw8e2UcuaeUX26AQGkpSKIpp1RcvGwx485
         1YfzPjWZFVSfOKn9hmKUpdio52qiZsMIMwHfBY4WKv4JzSot0tInzeKIInburWtq9Zxz
         KpeHloKQ0NKdOEX1e2SRpoShAS+SibsILVOob4BliuU7RJSUc0jD2l0BvlBLKGSBuzs7
         o4EIID8Pq1TXTaOYVpoPygoU9i6u0w7lrjfs9uJyypATQLTxc9CzhtRlbS8AfJSQKHH7
         6yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699844; x=1789304644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=O6A55o/hdhql6zrhXaxtACDzdzVwsGniN5US6aPzNGPDb4p0rHkT8xR/WkscgizVb3
         ie8HlMeSsQt+PpmUluQUnmYnqw7++WiekgfDxFAL5lSGmsjhCypVKLsG8WUtggM6zijf
         IB6yqbk27oKeXbwDAZygx9AC8Q8hylMIwrK/OoWGP8Pb0DaGzFHgBmBzgOREYLWB9Hlz
         LdNFYypOHFjflxYyn5vdbHCICesmYdIo4CZ4thnV6O3SVmsSBSalyoNUxVwol/a5dbdM
         xq4knI+piMrPezdjjK0GE3rX+fbtDMhvykxDa3JjNz3nUDs7uLVnjHLSSjUjpL/H3LVi
         IQoA==
X-Forwarded-Encrypted: i=1; AKwUvBx8Dpd37NGWL798+1QdnQ1qn+VlKxZvRnd9VO9MQjbVeLLrJJKpfuuxyPrEBjxfELzExJYAhaYrRZEocjk=@vger.kernel.org
X-Gm-Message-State: AFuF++k7OK1kopacEjTVP1fM24EXdJ7M0oazLuqDVYsP87VSWUxhLY1F
	Yay/crSxDGZLwPeo8uvzFkfEgKnfYw42YJ4iwdAhRLyfFPILdc7llfnRPUHIE96XC8Yl5UottWW
	IoXkQ7v1Gn5xCFLGMkXrJ79ZdT7oamRaja9CJSIkQIbPyzw8OaT0bMdC4hQux5ChEHXw=
X-Gm-Gg: AYBFou1D754WienBLKraeT4o38LyJrxtOW+BC9Rfp3q6KmVwt9MAd4tQIhL2r/wv0Cd
	tHhPvhI3lnr+yNWb40Ym+rbHTm9i1mKl58yuNkx8JTBgx46myLW4/NJv+4HQE7aA0vprO7jt88F
	ZtCrbzGbGH9kDUN05HowLfyK6ul5EolCS26THM29NhPedm5w9S5RN/F6C7bLzByxRxN1fWQCUE8
	VMKqbPqNk+3CYOErbYQ0TMyYm95j3M12oEl1WNGBMP3HAF/9Ykwx/koWx23StWWKM/UG4Rjj5A6
	JcSVXFAhxRVvz0gK2Nj6w1q6fpr427N0RMWt3Ncz3xcFN6IRVPivjsp13SN9VU2/NPsj34azxts
	51+pz3rBTrq212DFKTbB1gytrfJ4V
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398835ad.12.1788699844048;
        Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398165ad.12.1788699843535;
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm4104133eec.20.2026.09.06.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Message-ID: <03368f56-5542-4c02-a4a0-f57d5cfa5766@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 18:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX0rirGIPz83ZD
 0JvPcL6uUpopM0Dr7C09g8aR53z/c7s4E9FIpp57jPCL+vUdkoRqwFYHDpLqLWt4znwvlmLDYlk
 Sy3YUGnspcLHyt3OHTvy+CMOE+uYiZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX5u/llOIdBYUQ
 VKCMw5Bimw9fqUnJQ5QQKqq2PjrXhwWh6JSzT6W2d+KWDgoJn4mw06cY9MLXy9vJV3jZ15bCwLt
 m8tMvSM8jEryRpjaIV/RcPlW/XSgifaTIqjjzxt8sy2C8sX83eby6Mlopvo/lIRZrcS/wFDRMoX
 j7VBg9RRC+w25owQd/CwePjnOl1fMQSyVkIkSH7EWAC0PR1gM+hYDsPxWAs6ot8tiFrYXBFLkmt
 piX9YszrQMoJCAriT5t5PkPvzOFUQy7B0gR39qQO4SMvST7dRfN9xpWQ+WbTRfGWEd4Z/vqDorA
 ygWu4JPVXZxb3VtZo7A7GCW3W6MGeVUWqeL/53D3XuBiaSx1RiGD2iLdn4dDIgq+HTq9x7ROdEU
 DPQH4SoqUd+Yw6DeHXWYa9fwHqveH9WxX9XJ0rKK89eHOzpuihtpxCSGg5Z4OKsJwyD59oWLkwE
 r46tH8Oye060H25aMWg==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d64c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uHPnOIaY-gHs_qv2vRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: X3VGMRSxwPbYiwwjPknfqlrvHE71GKjq
X-Proofpoint-ORIG-GUID: X3VGMRSxwPbYiwwjPknfqlrvHE71GKjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060144



On 06-09-2026 17:22, Bryan O'Donoghue wrote:
> +		if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
  CC [M]  drivers/media/platform/qcom/camss/camss.o
../drivers/media/platform/qcom/camss/camss.c: In function ‘camss_parse_endpoint_node’:
../drivers/media/platform/qcom/camss/camss.c:4783:61: error: ‘CSI2_MAX_DATA_LANES’ undeclared (first use in this function)
 4783 |                 if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
      |                                                             ^~~~~~~~~~~~~~~~~~~
../drivers/media/platform/qcom/camss/camss.c:4783:61: note: each undeclared identifier is reported only once for each function it appears in
make[8]: *** [../scripts/Makefile.build:290: drivers/media/platform/qcom/camss/camss.o] Error 1

CSI2_MAX_DATA_LANES is undeclared here, causing a build failure.

---
Regards,
Nihal Kumar Gupta

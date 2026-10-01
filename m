Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BEF4A387E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842027; cv=none; b=oVAeEPF8Oi/8/RrtNVyoDY+df2LsVnPQgsvmRNStCun1XJRz84+kKLgx+XcsFyNYf9J8CmXT5AfKM/GrNYj2jGLt9fDPlOdXLdjj01HFGF7JzGac9tO9od1W5C8SSW0+bGIducXqwa0WEhj5Y/w8TvTInE1SB1lt1/4zg94S+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842027; c=relaxed/simple;
	bh=Jty/f3HWkGXalx9H5RrUnfAswWl+v0AAg4ji2EBfru4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY3xR7Y6hvLX4idMcvovhlVlTFb/uZFI/59+W5vEQzGV6Md8lokPPRTGOMN+ST6irUDfNh+6mXzUfaVjtFNpmcFtTY7SjLXts3sdrQRC9IICWba2oQqbl/zSGjD7lAIdQyBi/GLHR0PwpYAtjJ0csnzyKI/3rjRONdUhXhz/xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/byryf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DR7nTxph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/byryf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DR7nTxph"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLbu1932306
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 08:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=; b=j/byryf4F4l6haxs
	m3ZK3HLk5vi70FELPX44Gh35VFEFbtOEL2qNIcAo7uyLNg7G8YkIkevOvLzZjyUg
	Sk82MAdlqnSVaUXDAo3nfsmoCFcI+dlDt7UJxZwFqYs+RL/xf5f288dPaqGPE0bG
	SYu0dO1tus7/rih/JD/5qvhy7xbJHBr6ng/CulIZvm0VaX+EQNa8h8I4i3zGWhXp
	q3SmKQ2Vudla8OFuW+BYdlSpFl0vHgOIBUe96ZKSuwz5fbHKsku3mWrMdv2knM01
	fVZKl9279xgjp3FZl7+aq11BjTInopj1ZKT1pDORn6mxMzPca4/ckm2NtU3OEFok
	ueGOBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59r07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:07:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso93136685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842024; x=1791446824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=DR7nTxphg+hbQgkyK5x9IXsaumLXlpugnQyfyMek4MED0SsYYxy4LBFSA82LrkZg6N
         cUI2eBIIgqN5DfeMXYV1VVmJuVlNP8jafKRnKmAQ43M/opi+fT0MKo899BtTUyBzmU0k
         ZkADGwuBy4pLMoT+jM/sYIvVRRwp45TAeYR2eUfwU+jf62Oql+kcbvLAqLLh1LwW3xk/
         wgsR19KLHnLU9SbAuVPsGWIVwY515bXsO2jc0hiZtW5MGVKmEKlvw8zEY1NPRMsezjtq
         LXe9peHzJVSeNJMA397l3xcDmwJgNcS3/5Xp+nFINWReZPXzHZ323bfyhiXNERIXTIz+
         bNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842024; x=1791446824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=exYWUj8aOxizJdCDWFlprpzdmVyWd4an/n8Y6hf/MDNfzM0qH2TaOFJ9YVm4LBbCTZ
         FyzbODUD6yPik9cYGJKbJi8iCW0tZAZRf0yZJYwxwtwtEaxu5y7jHWf23aHhgmqzcUto
         BiIb9X5D7cEUXzwqEWpZ8DYC5e1r+zJWyQ0IL9ptSq6/MLbCyxKYPrzho84sh/kFVSTN
         8woI7YOfHiWxk+tU1GAmzO/IeO4mDjyVGbtb+x/T9bQVb2QKUKSCWVUF4MDTFrfe14WV
         O15n3doQf76ElDSV2aHw77jKBD86ocqD0b61wR8My/7e1M0n9j1HpvZVK2WtmLZIF/bA
         B+QA==
X-Forwarded-Encrypted: i=1; AKwUvBwFF89J5D1SBKxzxY/8ZePyZIJGc2OvZyue8MgnWhEkqsF2aByXsHZJwH/CDiLEAFRCc2+r3/HG7XIc1YI=@vger.kernel.org
X-Gm-Message-State: AFuF++lj0lEl14Rwn9jtQ5+SZqrtBF50A+OuSjlARHKAFqEke4vGSjtT
	UBc2QlNuLfsX/tPqYYFLlwSDhOmu6vFjpV9mYtPhZjZAJO/5F0FRlfxI1lg84IlnZrPvHqgTchG
	gU/OSnRM6NTxaILFNT5G8ZwEy799ZhpgZYZu30hX9YSbFeoX7AsQqH1HEQqHdL8KkX+0=
X-Gm-Gg: AYBFou05e/G3h4edd4r4YsKe+CDeaTEwqk2SZUcFPdCdrV859VTxlCV/Te6oRJD8qYb
	9WOBbbaF8nQ1e89E7uk9IFls5e+b4YDhKzXwIG3/xIeHJVZPtdTAxh+Rp8Cv4gyTxil5wEP9HGz
	s1LAjpByLY6zpu2FISlkpuq1k3aPnbJJAbWwL+ZTK+iBsLXxTyGf85borT5HxrjLZ7AgUNPV4QR
	ECrSV6Q7h96KVUgnb7KUBjIKl/gQx37Ja8NeQI9I3jAgBe6C5Pwyd9/Mm9YgkfMIQvCo5em+Hug
	vANf8dAIgLbonA2acK1h6kQOyjWM19vd1byIfeL3kqdqOsAQZOoWf6J8UU0jF6mT4IV84BxHsKU
	OCi1OVL0g/RzPn4eIz8a68A==
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630027185a.3.1790842024117;
        Thu, 01 Oct 2026 01:07:04 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630024085a.3.1790842023633;
        Thu, 01 Oct 2026 01:07:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca72d4esm648046a12.25.2026.10.01.01.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:07:02 -0700 (PDT)
Message-ID: <12e76437-c2bb-40b5-ac9d-a6f89f5f3999@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
 <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7f-IWOmyJ8NXs3tvoXvvH9fEZ7-haz7B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX0APHCCvAhCfp
 3hrFR2UQPij2lGmNq0+z8Q7sDbijLKKV/o+ogYhHgBdkWw4ZQFM6pCTC1/MzGE6M8kTzTZpPP/a
 xdWTlP3Z5bRuzl7NiHsGlY9OIaJ9LR8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX9bIh4tep08bD
 H3Rfj6gCB6yEupY5D6VSIepMmr3E/htW9BEK0Ag4guFMTtWLRVmdEgMg50b8WSTQ8zHKtaENI31
 JYQVQ6D73NIwJ4rQJ8upkZq04Cm6RGr5ylNeDxxrDwag66VNdKtJ20U8B9x4EKTEGsfgNnS6Mo7
 NyMKLmMVhcREL8WmMb+vqJ2XxaNRcix1DOpMuJiOqByrsjqi44gUyajzqQePhTrfky6I/wICqfA
 F1uSLKilgZtmrD6cmbG+kPk7VV9b4rB+lBoMn/iAzJQPUOAiLAWMl8ZFAXIKpPuR2j7LLm32z3h
 yVMWLwGSZXKZ4b/XdoWZuakLG5IwPCHC8Xn5snXpdJgB8jnhz2uS8VCKfut+3vW9x/HlQk1muDg
 WSHktEFSos+sfiI/mPKkMDrHtzudRN8OYTEkh0uD5OQZJjoUVD/lSuDfEKHkLhqz8nAyrjVxe5e
 sOm7FANEO1XmcXl+21Q==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe14a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7f-IWOmyJ8NXs3tvoXvvH9fEZ7-haz7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010032

On 9/24/26 8:10 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Additionally, address the register bit field mask & value mixup for
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().

Please separate this out. Otherwise GPT thinks this patch
looks alright

Konrad

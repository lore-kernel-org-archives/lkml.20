Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DD943A807
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277394; cv=none; b=RtmHcP0AwWsopD/wRDCqLPHvgChocsxv4QaQgMEPekBh+YRGu8DasmO6ODRmj0tAlaFm7qWgerUN9f06rd0GsLJhcC//V2nfZpc1yapWSLWGzq6WSJGS+G+uhEW1T0y0iksQbjyjvQ1LMhUszoIjOuz4+dkNbTfTw5bxjYXCXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277394; c=relaxed/simple;
	bh=n5OLn146Up9ocoqCkAb3xq12TtSauPTsiKY2XRqFMkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isZGxY+lP3EdHhuTK2QAFfreYYUwMUrgZ38/YyWi4qlK8XrwFLykJ9Dv2TugDXKs4+G+QiMRhlW5nJxFGhM4PoLpb/Fr/9RiN6EI0tud5ZMuSfR4J9WPBdYruBGj8sxFbfABbW1s9rD3XluFs3dVN6WoMcMyzTF9+23eeer/NQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtwVB1uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GifGjwv3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtwVB1uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GifGjwv3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9KM53258301
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8MWFwuMD6Wv12BlHgQUXjMEfZxvgeeMfK0qs3BpuiY=; b=dtwVB1uooUDb/wcV
	ZkVpPK/FH9Oclxwt4Sekdyo9dFZz5MVcWUemQYopamA1LzWEjJWnf19riKUG/c4a
	DHXYbDTq+3NtSs9CfR4TuYQ/JweZwHihfwncmFqfFWfJWsZIb+ocshQrcvIpqSXt
	G3xv5bUCm9JDe7AFsQPxjDaVr7TcHyGSZphbgTHoI/ESuVMojlGaLgGJCgofnnhH
	e8jD6zKKg4zHSQluTaZRxTH+2R5hbGlKKYhKMUXHMHJcoKHcaCaL6eGqzpZHTNeA
	pOBhUbxoBGS0J4oR/4q5fxN3bbnzw6CjMYzrnK8/d7s+T3FA5FY1a7T6SnNhinwQ
	G4xw0A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt0nqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:43:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so5840594b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277390; x=1788882190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8MWFwuMD6Wv12BlHgQUXjMEfZxvgeeMfK0qs3BpuiY=;
        b=GifGjwv3BncY5g72LALO7btL59d0LYBuwW3n7m6RyrxIAVuqZjGB+yUgs7md5MXyJY
         R97Ti6KunQCBckEO0LO6YjaVY4Txd+GJTLtODG5xKK6fvbWupa3UhV5qp5yomTbo2lFJ
         QMybyttyiL1tKL9nOo0NCQuYmTJm3EKKFqyf/HZYd0m8iHGj5b+DQPyZx44ZLHv5kem2
         +Vdy9KSaZALdRPxNDePRc33j2JsDLAJzLEEro4J1J+Q7x/dhrbSFfZ0cANiefyaLqgKE
         QOWHwthtLTNMpTGy7yjUxIXvMdZ6F4pGefw+HHO2I+rhjwIzAVH7BSumovRKC80+oQF4
         f5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277390; x=1788882190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8MWFwuMD6Wv12BlHgQUXjMEfZxvgeeMfK0qs3BpuiY=;
        b=UiPlXLC6Rjl/UnijrcTmLF1FDO/fkssNL5FV00baERqhsdq9XVmhyURpHHd8ReXN3w
         OHB97lFNcxMaZiQMNwHMBCwMnFKC6gEwocBUaL1mgRcQ+sKVQOtiT7c/9daDtwQZpmXj
         5exXjBSDu+4pa3M5t3ms+LrU4WDwIvvgsMBNc4g/wJghEE06FCRmYqVU11ZvhhQ81To/
         M2iZqXyxtpDTuBSGZdAgiZPO6sM6hgRgyFjHOUZrRETdOAdjhJPT7YPqt0aX4bi9PTNS
         5Nnp4zb4L91pVvCyf0tIYBO2c9ZXGQF0z1fcKocU+uOk057QIF7tRgYCKeAdJqy1ecM8
         c3Vg==
X-Forwarded-Encrypted: i=1; AHgh+RquWbWTqf4fJpuAGyOWqevUIW4LImUF4OmpQ46Nu6el5N3WBBURSNGd9roX5c7oP1KdPad271CYHe89nJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l3aoHpKXYOawfJqMHNg85HN9tDbtPsrK5xt6bWzo0WyEPl3yAz
	Ry9VT5JzuR3vG7wX+5nK6lMa473q02tmqwcJye8V9EqBuvm0uTGSgE39ceD9ZmNh+ErJlF1hKSn
	pdtbyV3WilwDl0ah1E/5IAlBGqrHkeD9UDQASYnTi8XN8z4xU1nnSBsLwoctdE411HNpXZ2uBJp
	8=
X-Gm-Gg: AR+sD11l+KFnt9SZG4Fgmz1uC7gBLMp1yB8FPD0msMajMgpMG7c4JHHwtfmeimiVKWa
	IsdtrGamwFIGlad0olWgpGPsRbXCCrlSfgSh5rNPzlb4fePK61IRWQUiroFX8BJ9C5C9LH2lFpr
	Bt0GMrGeBp6zvlttLwuDkqAjdrFua9u3k1/HgtzA6ecOARNhtvFYIVxLbc+npt80EvZTYkn2JA/
	IRwD4Gg99qJvzY8CgcPKZcTcTYrdcYG/gkTbIwMLr4//7FEku6cwrHUrrvovgZrP379fcbq6M3s
	VZmElcR6wHyV4NIjMcO+AzPeemnmxZLrTpHlLuyzkqOPOPi4PG1XN9XnjGC0d8qGFXA7XbC75t7
	UxPhnW9hq29x/ciDFlnEw0RyUV+jc24y50rSp1TOY1UYe7cpcGcwyqlJfYFU6AyP5oUpL
X-Received: by 2002:a05:6a00:ad06:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-85b59c69450mr14237937b3a.6.1788277390264;
        Tue, 01 Sep 2026 08:43:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad06:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-85b59c69450mr14237863b3a.6.1788277389810;
        Tue, 01 Sep 2026 08:43:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adc8e1sm125193b3a.24.2026.09.01.08.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:43:09 -0700 (PDT)
Message-ID: <dfc69b98-6bbf-45d9-8f5c-1b813498adb6@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 21:13:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX8GqfVWboC8XS
 yAJRYC8F7ApbVq6XZOGhKYunIH83L73P4cJzlVao6hP/Z1pBJAI4Q915ABEJjnzmOvKBHLyIZZu
 fVTZKh5O55/DVxhAtRMxR+35Hn1Zt8iD1Z4A/Z/czA3OYb8VyidFd7ktLnMksXqrB9R8RzLMCkE
 cuMuMXqMOm4pBWRjlGl1eP6WCDMWsY9K3VupbqqAM9ncJZj5GDE+lLVPRWPlRPlyQErOb1+WVpb
 edAV7j4LGbFR6w/Bj0tXCgBFFMpEj+E32gs55MFOey40SxtdCkNCeDu9NGhcro5ZuzTTELAF4J4
 To6NSYf9H7jCkhmPoD7BEv+hulrJHz9PrI/yKE5Cl/lPTMGE0dnU8dpLFmGulzDolcJBF/bhgfu
 WK8S7dbTuiEUDHZ+o8Cf+gqgqfZvjUdOdsm4auGs3NnpU6BCwPK21/MjTwCsS4f3pKPE8Mz5HIN
 MFb0DSBi1/0dcZGq3EQ==
X-Proofpoint-ORIG-GUID: TDBI6I_6Aznm6rSjqNorguqjNk3TNDHs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXw8DpQk7L+lJ6
 BabUbHwaLrMeaBUG9DQiCQqCO9VCNRVzDT19fnX73ojzQBmiJV3/IMPQBdJKa6E6UCODUZ3YVYm
 f71v2qH5yqd0TZpPn4yS4IcrgwPI2QA=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96f28f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=2sMs7eQfJahgYk7ien9XMw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Eo94fBGS1rxZ-i0BCloA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: TDBI6I_6Aznm6rSjqNorguqjNk3TNDHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010139



On 8/30/2026 6:44 PM, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Incase you put a second version, please fix the commit message formatting.

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D88368D51
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387179; cv=none; b=OI01afTqZ5SFGJ3FapcYRlSqZDxtkYFijsBbm7Al8BEMBAqPF7Bisoi35/H9m9zd7E9E9rjwvmsDc/rWYl6GEpmqAxCc9SBz1WKlCQgi9SGTFpSqtlENWoj3cROsAmY/8ufHBi0PXhdMAHfRqHre1fqhvEJ0BdvtOwctL8fENb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387179; c=relaxed/simple;
	bh=voYq/7WpilR3FczPUR6KD8QW5pL6j6cFboxPZXecj18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKVhMBNYSRCL0oAWzTjqJ78TZrHvWDy4o0PnaxeJBKTFeLqGo03EB4jkB/RJlT0tbSO9Xc7ILZmGuVfyOWZKntv0IPmjkWFs+09I1nG2AhO2Tv0+aTknuBFVr+hxNplKGaa2KNH2IWl5mpK+IcLccdVOYBEMoLMAeBnIT2ORS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H00Q2wNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxbWdBxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H00Q2wNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxbWdBxs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmjtM216287
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=; b=H00Q2wNQ8auLtK3Q
	J0sUm8LnC/4dd9SxlWq3yPZdDsVhJlAQQ15Mtct/5d1hfKXtEb/V+LD2uiDhVDW8
	cryLlt+d+WxbD8FvlN7ovH8GPRQ6tuZq0PinGkM2P/l+q0kAqNYvvq5nCOcLj4UU
	C0N/5jPGSNnSjyDX8cVfwdj3qvN2kXzDDcXp/jUREi4c7FTanHE7PuX/80qNX4vc
	2UU0UK2mItOgArLOQmz/VNpkUcaUZMp3oGMZukbA8tfWWC0NQxGCHksY+wymTwZ0
	3rZHRnG1v4DGzW7puBsQBiyQ1FL5XuEHFPwT7pCmbKjQFDX8nEGk6swys+3c00H5
	z6uqNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9degpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:59:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a18b457bcso44208485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387166; x=1789991966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=kxbWdBxsK66EcWQVYXph+JwAsLjpyEOl54Ddhbo8WYdY36S0L/HADBAMT8aYR9GQ6T
         1DzhJ798KtZaq32HPcLJqV2HaydO8UiBUvRt31f0Na9RysAOdKw6UGEpTE8diiL+Nn6Y
         I7h7ZYp+3AhY/Tn1pdOZDgJMtiWVHF/5x3pNXClGVmNTBcQzQmhXk7C3Qzd5hQ1Q8OZH
         tX59f75NpKGXBryg7RSSZAlACik6xLFOGcl/hpDJ72KPGNMqaIzbLFKUNc+v6bKKVXXb
         9l8s/TJVo0EXc0BItvxKzLZgKbGuu6yabPYvj8uaQq8xtrgzh9H/P4l9wcOq/ARJBIkh
         a/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387166; x=1789991966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1Zd4uPLrJ+Xu+XVywJmW7smaAlDGHp+icf8MnTk3zk=;
        b=V1EJLoyZdp0SX4EVIJvVVFPH5t1Cej3PTRT/H1xpCWt996Ekg+v+Fui88Vs6WyK7bP
         XG6hZP6ptTH398lBK3uAzgJf+ZVBIpS+4IrNedYGdcAdNfvrBnHckM3SErFP2Jgv3qGi
         WfBMJGGo4gsQohKEAWcZgypoc94aQaD1DicGotVAFzPctxfKeeSXlZl+agORkozqrMv3
         UdEazTTd0kgKC49jLecAFjzWvfhdIRVK4UlubM8aBlAaqn8HwqtSk4sKP6yNwMUuqo8b
         Xi11aXECk8HU6XiXLNmYvbVtCNdGLYjq838FFEISx5RAE+XnfxIBZ+mqIYH07ruWfyi6
         n6VA==
X-Forwarded-Encrypted: i=1; AKwUvBx7u9t4ozsZFdBSOSzuEoK+rHHS2U1kUofIMJTWFPdu288MXrSk0JPkjX5NvgOBbVkI/Ns3IcvDVSZmVL0=@vger.kernel.org
X-Gm-Message-State: AFuF++llKagIqNQH8M4MIPu+AnNI8eRn2Yy+mv3oYildeVEPZ7M+EDyu
	b0XLBgE1A5NJ25iIQPwyKUX3/H9ZRm2ovbMuCwJMmkgQCwRe3QfzLjkmEcGOEs1b7Qre2SC2DpH
	ks7Y14y/GNf8R643UO3UsQi2pSP3EdHKRGHFZqa4+td4CTs2kL/YiVQJkBnwfsiDNoRY=
X-Gm-Gg: AYBFou3/inwseSkVOuGWCu2GEig0yBnB6iSCFzSOFucCgYJpcfrpOG55IVFzw+YrDLc
	W3CLGsgcfRRwJTgwooNVuLsxnIV6+7ANbnaB/t8CTdbe51SDQ3lPxWyAMk7nYfBhMR58MzYA2vk
	j5lAh+2rb/o3cLJUzvXV+rrp7v1fQRgGpS2j2nx+AZ7PhIDt4gGv6ZgRSH5Dq+j7Lhs1ufjkDtx
	GWCdDxiioYXxbMa7YY+2qkhhVBVn5T+3HDsyOREPwGaFJt6lw/hf73P9UPSTcIq8c8vtxCaIp72
	E0wBDgkYRmynkdMWVj+99/BaGIg+PcZMzcZZDNh6NSL0eQ5vdnyiIbpRaBjjJJF1TCu1QlLcH/I
	kI6odQBqzt5nHjn9+5DJ6jw==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239016385a.4.1789387165904;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr239013385a.4.1789387165442;
        Mon, 14 Sep 2026 04:59:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8beesm3960445a12.8.2026.09.14.04.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:59:24 -0700 (PDT)
Message-ID: <ac9ed925-21a6-4611-b1f6-bd018dea3c0b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:59:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfXyAAwmsI3BsCp
 9bJD90oLQi5X/DNGbFfRsTwMP5Z9KavmWUEnj3MHdP6NE00YZ+FKDGDa8t8JcJKW6+W1VBZ+OV0
 IzzrHvlRn9zxTyrx8nkVNrIXJZwvk+UoLYkV9ugfgHC/KdDx3DSwyXGm2E7pqVnLtNjGBvqXePy
 mL0nBtTkybDiGkpSWpO6BV7X7lp6Dgv0HZD8UVBJBWICX3vve7uQmEnas1jXECMAV2BZ/NglEnH
 Z7fpDfVNttZ05kI1TfA/HuJDIBJTbckhxl/nLilMzjucGsUR+h56EAizXJSDruTe+JYuKpl+n6j
 SMoqkJj1CN8qFljFThzij4DmGl6sUUNwx0GW5gfqdIh2NFbFpmTYX2agOx6EFH1UFaxlClwiPi0
 xdmHfndGIpclgACJBs4QFHcdN2Q3Nk/Oogn4A2uKcJmDFNZ/b49OZuCEVjByT8ByTKhYI44xLIf
 7BoUl3DZEXGkYN2cI4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX4nSirPN+RPQK
 fILvmm63DT1HDEA1tbI5qNHEHyHtWMGkO5a7aVuCxIGPZYfTeFCo1XFDpHGlxfT8uqskWnXjuvl
 ivo+zRuXNkaS5yu+aQkANgM21sI9wlk=
X-Proofpoint-GUID: LO-zPhiTpa-YRFTnoMb8qt8fTvEqPzSv
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7e19e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=rrY2T4ysBfleW38DPu0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LO-zPhiTpa-YRFTnoMb8qt8fTvEqPzSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/10/26 12:00 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'

This starts off nicely, zooming in on the reproduction steps, but it's
missing the key point - the "why?". What causes that to happen, and why
the older u-boot specifically is the problem

Konrad

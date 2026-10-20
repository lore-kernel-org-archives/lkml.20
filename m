Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477504;
	b=2Ue6zZqunJgO2+zmjVAohy6xUVXlV5rjHNHkbOApwVlfmnmZI6lkFA6BR9m+HE84xJQF
	 6ViWgLses2sinZit5u+mhzdkXLnmKiYc6kLIlve6DnUuIN2KcTC7pXvUEmlz0IEDDOiNy
	 Q/OkS/PGyUYlMXCalrvz6OM4qpwAGbXlFBXnCdKeSg4Vg7u2BzaFSf1HPudf3CKgDIKR3
	 0a+Sg1r61TFvbbwiPvUFTMZnLWMKW7LFn70H10OqjK1mNNBodksexYMGPcy2z3xrwmNuD
	 rRioLhMyWXWOTPoEgpTPUCjClslSrpXDnJS+COr/TNY0ynSvBW+JAdfUvFJjuSKqsMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Jhhz7Jm5MXHM5I904h+PW7q0Jgx/QKjpzpW1joGwCk=;
	b=JKMdO72P5SIgrFTShEqLjq/i0HxCBWjd+2YVDqvmLtExr5MzUbSJve7zgvWEF5kMMnPx
	 H///3E516aaYBFPOUpztlCFH3DCoWmcuTQMz2JaWyup26ZDeLabRQDMi3w4EQQP5aRwv6
	 I/1r0spoh/5QrXFDla/nI50x12qhZEyVGCsXJpy4aeJfdRMwL9yuKF+T/H51azDDjYj9I
	 2oHjve0sMO+tC1zhQmwGS85Qg/x/L/rpsALxQEIxpSW+xsruLISQ0/KTgrLt7AEJfMNJV
	 071QH+VflAcXl2CbnsmggYlyP5cu3JQdJpwW067CqFOxihkJmbWMgC9MMqG6yGfzSJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym4JO2JD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWkSmHTs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym4JO2JD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWkSmHTs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6B00M814213
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Jhhz7Jm5MXHM5I904h+PW7q0Jgx/QKjpzpW1joGwCk=; b=Ym4JO2JDmQdY2DL6
	IOl2gpc1IKEbIxXTfv7Jjo9T442iMYFtjuvn6IbwN/93NMCH+oqVCU7V+JIOCZIq
	XFobNkvsS56ZPLbEslmg1B8OBICwE0s23jTi4VFyx1LTZQSuEv0+BeER+nrvIueB
	G5JzpaeHtzV+EklP/FP8mZwhd2bI4ans3MeAfQaW7ru4ls8VxRpMGIITCWtpk1aE
	aS5TQKF4sCUKvVv2dcu6FAu5p7ZjtUq/By4f3GD9SHXyHj71IEuDUTRiYHoUsmFu
	j+433sn2E7I/G73LbdS+tmyE8Ohl04UwoqGY0SisuYek7VRiFJGf1czVPJo1RsCm
	wDt7eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n15ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:25:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so94450885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477502; x=1793082302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Jhhz7Jm5MXHM5I904h+PW7q0Jgx/QKjpzpW1joGwCk=;
        b=ZWkSmHTs7fCdxBNQuV5X2r06UYbsN9TC4SVlLL5eqEMzd9d2Tshg/Y4haLDJ/WNuSS
         lJsbGTr6DnP3E8JEb0yR8gdGbOhgl6JPWn+lal+x0Is38GQKNevZEOe/2w+aqj9xdxb0
         uRU6OQ/Pa7KGXfEgaDMcdVCE+jqSrLxUJ2qGJGkaBplSegErOr6imk/0L6prUyIFYWpY
         19O+EvTOt4le7/lfpHZtkFOuChe1qQjiOwCQgL1fezdnhd0zJ1MPt3bvyzpqI7t2+/e+
         vZONucrvfBD39SJadeaQoCftQxf9Cl+cmBGxF5fb9EcAO5bGBv0w6fkO6l7ZBBrUH/wB
         QRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477502; x=1793082302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Jhhz7Jm5MXHM5I904h+PW7q0Jgx/QKjpzpW1joGwCk=;
        b=f9OFVjrXoK5K5hEokCgAuqZT0XXmm3VpGIjPZq+F/gEBrmMzTbyRyyNMuQGJmCXio0
         jJYqc1BUFlWXGRF7sCSk0ktOerSNvbZnHlrLwKqFW6PRbp8g5BMAzUCTGUzniiihRQcy
         guwPaz88m/rQf1CCqrQh1KJrz95BTwogExHSZYbVMloUIkj1UcCYbOGirHY1SJYIH6Tv
         75juRzxBWSMxeQYA2Tj4WFGK9SQcKSUJYg3PZ6vtH/gBHKjIEa+7ojZReb+WDH1YWcnr
         YKz0ZIsGikoLJ2U57LhVhZK+vEgcKkqXZB06KbSnizlQJVFaOxgBEVvC9mFIv2h9R08b
         oR+w==
X-Forwarded-Encrypted: i=1; AKwUvBwzH9c0RPMgUdK1YHvbiFFKP2v17LqFjUBBXA1bluD8oRrXT19E6qG6dfStttERd6h37knIK3gGYAIQKUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVpwf0zkNuMy9zbXvCehuZI/1+sysvFLfdfNGLBL25kKRth3e+
	B7xUyKCrBvIny6VyReFKkgJufI0NkZ0zMdGdww/Jmp6G4A5xYgzcg+mV4dfA/U2K36FaKafrvtS
	mPkusn3vAqRblJS5L1xJzWl9O2+GKs+ohWr7R+kHRsAD69vmdW0wG9VYdZx4GGOhKBKs=
X-Gm-Gg: AYBFou1JShJhswT4Za5xGbVkeF27V0/76ruB2W2GrsSrf3o+f2GTCsMLLGRKv7zlnnM
	RedHoscPXBATUBo45BVRkPhOnoFROxebUBZz947O3RZnHysDrwH5DoVqJQ8P682ip3ZyBI0Mv53
	E/fqbLQBhpPvAojH84zYRN7UBwrtYYXhAgEh/XqIQ15XI4211owhzZy8Vrre62YbnM7t2utLbek
	JvQ+O47wbdivR//pZ1XhHC0rpYvbo6Zr6Ot/vzxHxDNvlP9dJzqgPNl9RcbUgXvT6sESILNUXu9
	lgJhUQP0u9yiXX8NX0PKws1gVhBiAgFKK4RdiX50/DCE3jQRfPyp+h8qfGaKLNZX2ywQeI707Tr
	fg1+5dWZ/ewTjXmnpxX/3bw==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1896402985a.0.1792477501767;
        Mon, 19 Oct 2026 23:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1896400385a.0.1792477501350;
        Mon, 19 Oct 2026 23:25:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239c154sm451125366b.87.2026.10.19.23.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:25:00 -0700 (PDT)
Message-ID: <878766b7-b450-42ae-be1a-84662e93f8da@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:24:57 +0200
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
Subject: Re: [PATCH 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152
 for SE0 recovery
To: Peter Chen <peter.chen@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261020061811.3127511-1-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020061811.3127511-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tg8YMRbQLdo7QZFhwB9F4UgON7jZXa8s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXzWvNd0SS7tAv
 gZfWECg0UH9uEb3myT77FhuIV1G7uIsmh0g7m3KTYo8rJUKxBJWYVcODsTh6YKwp1nJE5RU2Ij5
 e8K/Y6jDIEqAC19e0/BR3gIxNwtRPPo=
X-Proofpoint-ORIG-GUID: tg8YMRbQLdo7QZFhwB9F4UgON7jZXa8s
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7093e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HTHHE6YBwdBvLKPXtpkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXxd8Q54sm3xQS
 rpJYxKZZQgBhf1cLEwmQ7RPuv8Hp7tVbKj5judvdEMSu72vOq/nfXq6RSD9bIMp8eC6gPAESats
 ZpCRYtol08L/bmK3XT6vYtouMYC7twqgncfOaz/V5ayjZY8BkdBfbQ3SFMqNq41L0afjg1L2v+W
 1hSCaxOO4of8vbmzbNE3q1ZgMDXcUKcFht59kzqDYNxmV2YY5XImEgAuBm28mhG9kclXK6/SKle
 QyA7fDfDbliXUV7l1mxQR4S5no0wk+MTxmsiYOwQcqRSoR9gi/gWTXSH9Xer8nTbz4BB3WRjCGA
 jFoQDWxuLo+2uiQzQZKLe/t7O/F3cZyIIxSNDm2vbfb6VX9dt4wBs6tIZ64WyKAFnEyAjQlfILZ
 Q2I7UeQhm0GLau8aKPswjCCc54B5uzGczpVSEhgojFCf39MxBRxeVdWPHkdJZlMxluwKY2ftdhJ
 a1KWA0+Tjtq9PBwFLRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/20/26 8:18 AM, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a
> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.

"support for the register" sounds a little odd but okay

> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

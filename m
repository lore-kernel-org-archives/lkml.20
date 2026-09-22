Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760104E80CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073182; cv=none; b=GwS6i+TMqOMM8ZzosyuIqRcqFLCaHv9dNaBjCjNRQVEfazCYd+Mpl1DKZ1wMYKipMYAvc36kStVjVCVZqJIuO1tX53ShmNK2HFB9bPWcCXx7TqQ2wexMSJ0EbtJ4dwriJchGPN9rM8Etv4n6slYRE8NxaebVgbTmfd/ovq38R5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073182; c=relaxed/simple;
	bh=7dNe8Ub5qUIc/i0QAD/HshqgBvrYEmV/jNY8/VYo1HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuXiHUnhqlfzZPu3WlJ77qf4TyR3KO7S5UX7LsR0ubqXGISD4t4rtQ7Y5OrwP64uTHYrJwHyHMQ0F0FVPSxb1kI6Lvb0+mxegZrKuQApOXdOChiBMS3iKO5lVhZzSyVlSYLgwI+JKszb0shP9UwDKunSqE7L88zJlbXRn272RZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTkqjiuh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZtii9cm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTkqjiuh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZtii9cm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA34iA801432
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=; b=oTkqjiuhwAWixN2J
	2x3aoIGq0vNtNcHgw1NWZ+c/vle6zdG7RIhHCqZXv+FwSxkk1l73SpquRy4tyZHM
	E6+S2jH2mgDJSevpR0a8S+AxBQauO+qGw8nFDLJlzM6ATbknHsfux+M68otLxDcK
	VsWD9yZwj0AJDYV1iGBZGrMj1u8Zrf1s4D29NqxluKAVE5h+WLYeNoFQQQ73hGmj
	EraL18YwWfUW8LTKle+0Ry0hknDT0uJaZbqdHMf8nF1VgAP99FjX1ijNuPqNDtRF
	7jCpVg96gVEtHh5IAm8zM/508UhvsNxOhVF5xP4dc1qeK7Pyc0gXGtyCfBIhzmDR
	FtQ8Zw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r3xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980d0c9fc21so11896241.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073180; x=1790677980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=XZtii9cm3khEik0s06m91dBMXhQdx0zzOLFALze9Dek+xTPojGbWiGxF1lciMKvBto
         WKNFfdpE4qe8P/FpnWh/ebo6XmuAOlBhfMv4KTk8VWJzb3By/I1ZAJrhZxsFNswv/Jn0
         JwBTpMTaGBy7PIFQH8WIZm7cfy2RuZ8Ah6jZzDBEytlXKZI9SaX+yzgrUrcjIcJqlsdc
         kcIT+IpIKxdjImE0yOtloOp+lQGpQrRq9Hv748nXwI1C12kKMUC9QEvbVtdOv4uu/1G/
         k1PQbNz6uMKIDQ6d3fCuYTcMEjuAKCMorpArzXzCV47q65rsyWRwk4fCnwd8n3p+fF1b
         PdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073180; x=1790677980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=E0QEEF/cw5MhWtZJTkXaQ0xBCru9yqCvyfrujRL0OjEKN7oCFcp3443f6Mw62OkjtW
         Ju8ZmogKCRLdhISmgXsiEb3yn6cQo1W98B6ZD2nAHK1Pdw84DbGLtZ9FjI3bASrc5fX5
         9RjllLY9NkBm+sZ1N6meYVw93gUvlw96UNDn2DVPwhVRm+ga4s31I/3pTptCcZJpKskv
         PP2nryjr+m2tjNOuU6sRPtvd8YdX/DLV8gPvqwHqntpaJO5s7oXIr5JTA3RYU2uqcy1y
         kczdWLEx7MoIqeh87nFYQ79mKkIZYp10i99E5gLD1yXSetx91Tfl/zaKXEXlrxjbLgl9
         Wfcw==
X-Forwarded-Encrypted: i=1; AKwUvByUG3XaV1b0YW8s6r1PXFb4NsMVezrBnOYK2parAvh2IGdQ+3JSndWeSm0NM0QcB479TSP1WwDVAR3CWCc=@vger.kernel.org
X-Gm-Message-State: AFuF++kyqWWFAvDIplMQytZQSARCvtL3cyZgqebX/nLqOpWF+DUAcu17
	N/EReVg7b2J3vgnw99XDijBZQG0Io6EloS81Zj8ljbjY07yfrPQ3S333azMyD9SlwW+eqRflMAl
	Wt+uwruHn48IbOu0vlHwdba1N0AdrnJ3Iulo1NnVBeM1v7oU0w+EH4n4akCsRgICtGgF00od0/E
	s=
X-Gm-Gg: AYBFou1+GZXw1qGnz33U0Qf75GzWvVSAwnISKWft1/MzD6VDqmvhWJ5pxbuduVBSya0
	q+EMUafAqwxTFEfC7wnYTo4yf+PyZkfiNz/WjcXfOchh8z3o0lpQOV96UOMGjHJ8KLhonuEKbB3
	YIUJA80p/g8Q7cvcM67pMjSOJDPccPpjbiA2QIT6Y9mZlxi7kw2+uHmDkP4Ti58CXk67+GbG2/Q
	ul8NjG92ArLtlJHbhKW0B3O2+akfyC8jSYISw7f1Q/1zbM/SvIyQs2wMxZzuWRooLy2Q1hGP31I
	h9enV+apKSI6MhVqUKHjNyDF6w8N3Gfym9KrAQuh/tkMX6EZae8w0pbnEFFfGPeS0ytG7DJj5jb
	kcREJrXKRPRgVFSVUD121JA==
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325184137.1.1790073179671;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325164137.1.1790073179275;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f5dbsm61657966b.22.2026.09.22.03.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:32:58 -0700 (PDT)
Message-ID: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX9uAS7/B6SwQJ
 fG2oWSGV/gYktF47w+aSpgCcQV/VLvfDlkbE907X1VYQuJl+H6IT8O6vHv7DAK5MwI11WE5XhwS
 FDsy5K7Dk5PqQU1gxh84OH6vn20LcVlOVtGMHtyfpqeR7u12zXwHDh3r1I44FzVpY9WMWWzDwh3
 H7/GtESZCL+VE8vhrYOPj2ZJaAves7qhTyUjMA1d/s5shAniDsmEQ7HsREiN7vWt/UxSRO4E3aj
 nkP2FX5PtcwAITHz6sDgfDHNk6b7Mtz8NPiW2/UXyYYf7O1Yrij3nwIEeyNtqLW/oKQPc0R+Zc8
 rxczL9KdhKi3tAAWxv3OmS2ILBC4roL0gpQHCBxwe9HMt/ijhlBTzZwbP9inAxci3audnf2b4gQ
 gmdkK1a9/OCLD0VH7JkHnTHf8Qvzub5FOXPofhjDUYjxSIjnBnp7P9eqmHlIHYXsFvtil3fIxaE
 EagePhyTzuhms/xuouA==
X-Proofpoint-GUID: MMrPIdBTjHXPOTwA8Y7c0_co1ELyQmNP
X-Proofpoint-ORIG-GUID: MMrPIdBTjHXPOTwA8Y7c0_co1ELyQmNP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX8A3av7SegnUl
 buaPn2PjyJHZ4IcMgPrd7H1mXMJn0ngQYT39JV1ipkON4b7kOJsvtXMxmFgCh2/mPdj6kADM5UP
 +t5rSXcBCVqTTLGHQLCfloIyBrdTOLY=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2595c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vK6GiN-Vya7UJqaPjmUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220151

On 9/22/26 10:04 AM, Shawn Guo wrote:
> From: Pushpendra Singh <pussin@qti.qualcomm.com>
> 
> Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> frequency scaling.

[...]

> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;

len=0x500 for all the region is 0x600-long, but the docs say
it starts  0x100 earlier (with registers actually starting
at +0x400 like your node here) - unless you want to solve that
discrepancy in the driver, but i'm not sure it's worth the
hassle

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

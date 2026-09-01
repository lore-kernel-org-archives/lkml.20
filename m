Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17182EBB8D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241371; cv=none; b=A+THYcvI0cDKBYBsMf70TDUFDsSGTHOp/iIIWuBfcWP17PU17N4mz1wvS/YlnpTVvS1OK38qagIiivgHE4YgZBf361R2HeLwypJ6wbRIF3EM1GovvumHuVw1Y+0Y43ZD9mxT9iMV1ZuKeqbG7WDfd493/R6GHwtlxvpgUK67mCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241371; c=relaxed/simple;
	bh=UIKstqurvDjxzL0QWKccHfdzWCjnXAwcsfxWJHVXiSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgxfhcF5FNCNVwviam0xK8b7LA1zUTixyen4xi9YmRlQIpINUtDJd1EuMGl+Y2NX5IIDyuFhA6/8cWKWj7pQ2a1Faa7Jk3O2xCJ5Q8TK2HdIHWjP8NNCYgMY4xmJ6Kko/uuEdpm3xN5kX1+ON4fnc0jH9UE3xyJ6+49JiADEaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ul/wv478; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj3F3Mw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ul/wv478";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj3F3Mw4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oOHU1724860
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=; b=Ul/wv478uHinSezB
	caeZKYe44/KP1hBaIuULUvqNEGuJAn403Xcu0ydSPZYkhNIG1qgD+g7BrmZ7C67i
	wlSGDQP0fc7DQX2HISnzZyO/psDGs77O1gADnulW1KFFbOpBCCfSGfInHR3N9vfk
	37Ne+OHEwH9cBT1+s9VCnHIPsjhobrFKbxh4lp7XfUxY4HGiWMi1MCLMi6Qow/kk
	Q1eyiA/dHSL2QBMDStbZ88VQUL7jg8Kg0OogQD00KhlHu1oqEMWEurya7H4FVQrT
	EfUPPFOeRfTmGc68ev1rnYrYPLWqOkWZbQncg+9qnnZ0WYtsSlRDXh+BxSBzNK7N
	rAQoyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3amk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:42:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso932377a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241368; x=1788846168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=Lj3F3Mw4AXKPXSB3PBut5Dovl2VwauBy3rA90/LGub27Btt2769r0xxEakKX3bR7vd
         UI6mCdZq0gohhFGpvEoRdXZaXP/2P6C6R24kD+Zoft9X5sRO+27rMea5g6dzZxh9EJzT
         K2ZeNEZrGc3+ohly/1CxBOPR4zWSsFMj+vtsC3ja8w0Z7ouEvO+e46cC8aQbHIaGFoD5
         6A95yMDtI2RJ6NDSXhHsDWC7IhvHxsXBnWWobz8XT3IukZbrNZCo/f2EI2bBbbjF++KD
         wrHUTruppFzAmJBZ0tVeznB+bLQxe25yJDA/6C1f2NghM8owUlwpWCeSl86U5aQ0OPLY
         eAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241368; x=1788846168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=SGbJY3Wqo290lhy3G4Szgz1q8yljtFGIRWFLLTGRsO3Xll2KDIirXKkH+GLJfvIMNu
         yYK10H2qbx3mLULotEYLXU1hSYO58giK3nvCU1bBoeFRQhu55p9NwWEQ//FvMVEx9N1t
         t3lvbILPwnkc8WgR+B0pYNn9n6i0QQ8H4LKDcwcAEvY6y2x3rAhB1zNcapUFoozZwiOn
         EkTusY2VCJjbFL/sFiwTtX3MGTK1VXGFEGYLvbv7ejXl6GKHMh1YoaGyMibebaaiXVsE
         q4fxsm+zbVKtlBf7vYT28eVUg3ZSegAihqEfH3pM4/u2mfjUdBYVAyerLOonIqoAuDBe
         cfwA==
X-Forwarded-Encrypted: i=1; AKwUvByR6RR/cY4MLQBCWozK2VX0z27fLVkaDXy5pnWjCJ8xXRK7eR8IVsaSQZK51blyIU7qfFxph6EaGQLDyeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mantSk3cJZs9zTtxp1IiW2ju/VTuZRomuyfy6a4EW+GGMjPUtl
	fD6a5ZNXXUzoJErPV5wV4loDN0dy/43Aoy6dcGGjSJdjSPR8Bop8njU8ZxCniaPt18eaiXciJD+
	IXwfJyawFlIRZ/VUnttdk6/cLs+h/hUX0HAh5pIQCeUw5gtJxaMiz+uusWQKKFu81yac=
X-Gm-Gg: AYBFou050jyIv481S4/b25ADVKNhiX8YcAVnxagE9PpOkzeomHIl6uluQk/Y/USi4wK
	QwS4ASAGMgrYAtEhpQma1wP7pYpCWvvYHWeYBXfcc6EO5hBJws9PptWjkY/BY61JISXCblmoW1w
	2q9TAzjiSz6dDfOZlzyLeNNqgAVRQtfev9ANAJhSw7y/MN9s96KRkYA8w3LVy8tC+IiCKPWXtZ0
	ZZ+2CTjA9sx08PlVID0GQVfVFTpzKSfceXoCHBO7fDF801gJUoUL8vW1BCiBTkM4Y2BiZnckINz
	B+NgqSuz9AlSvmhfo2SFInoSydkhk8UVsxWrhqiRAMVPDxs5i78iCvTRTZY+4L8A8CRoZlYjk+/
	dFQsTGEMcwZ1lggoHfxPSFk0SSMw9
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855716a91.17.1788241368208;
        Mon, 31 Aug 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855637a91.17.1788241367755;
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm52133553c88.4.2026.08.31.22.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Message-ID: <8a4bc155-9578-4f9d-9258-022ca765a2ea@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:12:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: nord-negcc: Add the
 secondary QUSB2 PHY reset
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
 <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX3wkEY6MS+dm9
 X/K7kBIG4kTB4eQ6ycfrh7/RAXdod8ms0izgK7V4IuRTcuRovz20RkyKn9YGkZ1+9CPco/ciDL4
 uQJvewuPn5MO0daKuqydydEeVjbVN+aRkPu9iOAwDKDgKT1rtQfDQK+7dwhwUf9aOOm5ucd5G0Y
 O36pe4ZIdZXBEPl58gYh16aCsWqNSsplMCcTqGQ49rxR/jgU4WAXcL62dvwPkp4+ITR+CI8S8KW
 lmrafW8fYqfm7JUKnpPQBNzs2pzn6WE5PReqzLsNUQLqQmj0I3QxiF7xE1BGgLwjTPOj1Qdl9Tn
 9K2OamtGwC//Z7HdbX9XqSmB+qMu08YXlTtt/R3MnMOfwNzDztidZiBCcfb6JS3rGloIn8TsVEN
 qEFSohRGZgQLJCMsB8htRHJll7dVN42sYNmNm8dXKwhtYlk3KdVcsha2zFwR8/QDD85qIcNAjnu
 aumbVW1Tu2NGcnE5O0g==
X-Proofpoint-GUID: vlAGGrV-Jx0zWtf87E4LmbQlytLOr8D-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX30cEBZu/qv6L
 TRzfAuG1cXeDiBsykXJz0yrgpzfcaFomC4NVrOWgLiGFS5b87yRSZQWcSIaKsWE1y3ZDo6pz+N4
 UYUb0ebcIcHdF/LMk7602SNyQ9PA2fc=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a9665d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sx9h2hvFvrCHTrld4NkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: vlAGGrV-Jx0zWtf87E4LmbQlytLOr8D-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010048



On 9/1/2026 9:23 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> The NE_GCC block has two eUSB2 PHY block resets - PRIM and SEC - but
> right now only the primary is registered. Add the secondary, which is
> required by the usb_1 eUSB2 PHY.
> 
> Note that the SoC has three eUSB2 PHYs but only these two QUSB2PHY
> resets: the HS-only USB20 tile has no dedicated QUSB2PHY reset and
> is instead reset as a whole via NE_GCC_USB20_PRIM_BCR.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


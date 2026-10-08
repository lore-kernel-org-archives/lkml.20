Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F8477981
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459766; cv=none; b=Aej7BJPfSRzOH5Q59upuzvoex/XAb+9nJVq4BeUdYQ9+JNL043oF5BI88eQajYFyB4+P9AS2FWlTxZbgovMp1tdktHnXVEWl2mJokwcEemIQCqp2bfgF4tgSd+z0P8UCMz86TQduqWSYKs//RKXDXjXIqgfEhLxn4q5JNZs4UM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459766; c=relaxed/simple;
	bh=cAGkPVYlrmH3K4nr2n7hsxNQEWLouB39/2CAuZGLZhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEsLf0WKVmDCQwdPI6mYsiZweRmD16HMH1yfP3I+pstUS42+uCAmWI7d/yToQTD+eRngPIkEmpSo1iXmw9e5D7pYullFxCt650GThqkHNXFyV6S9/U0aHiKOpFnD/0UyL4OyQSBRDRQ7BCGuOD5LhvxhpXH/++4fK09d+O9E4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnABhFxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhYy2Noe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnABhFxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhYy2Noe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKBFG2604169
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=; b=TnABhFxqn5/+RLet
	8wyGelZ8cIJkvWPZ9KH2pi1H8k8O9pWJ+Kw/Wy0jJ5QGwtx1+n4klRvuAWqc+Va/
	gYVTyeS9Vm7twA3BkB/4/f6KOWm5DZAtj/nKhuRdyM1EPongJiGliKyI1FKhm7Pm
	MXaHyh2F8OYUMfy6xJ+Ig0tw0HVbJSEPlx/+DylapCdjLnv6vW1UYE3S338RhlOu
	XqecD6vzJCJMxS7yd2Ys65NB3Q4uFLhgj8NQ+M8diN0igPBXfWA42ZNMMKekqIya
	G1/dC8FESxiiINDlNxK/BDuGl+MG9KpyCi79Tzts/WEkyiOT/rhahcGVhe5l6NYU
	Q5IfVQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jpq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:42:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso845670eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459763; x=1792064563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=hhYy2NoeC7pUp6rOr/nbAdtbKJWEjA6hvRNZbf8fxgq2kqrYT5XLMN7OMXwmDshWpn
         x1kLBadTPwtrFdNVqYoCYc8D3p/WxjQIPhvEpqToN6eY/ARpgzgFfMdajOpWcxSazvMa
         3wqifrHS7PZxzPkfpucEvUT4xtAIxU6c8cFupl/dacxdtyv7kV1LfovF+DGQXxmGSn7S
         5BCSI4jyiQso0YzKHoDn9Or6De6clW61D+K80NlZC2x8yp8aB00qw714k7+BC/uQSkvb
         Q7a7/sg2fKsomKxFG+82iwz2oIo3iMiAua9lFyDKR09VK2ddeTqfcF5IMXRLLeoWbqDy
         PlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459763; x=1792064563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=1UyYvc1/fUgovoeOsVpy/L9GzsquBCzbN4fmG2GBs5QLxak+/F+oPmIm6Q0MTgSpuj
         PH2HxgXHb1+O/EvX4I9vxP4gC2/KMOzRzSK9p8SI84cK1ErMJRdB7TwF6mWRvC9DSvVp
         FBXJYg0hHyj72RXVaG5ON7zu/7K91BD5Y2ekeqYlqck8s8gWRAyhrsiTR6PsgM7+93yy
         R31T/6I8F5VV89OvEXTgDan+u7R6XNVlZXDlmCIJlAeL7s4vV+3eDYkENAwbEztn4+6o
         Mc1GgL0UctmwpMcYoZFiir+NZCucmhHFpKGrrTJZuv+rccSSwONrO3DkvtRkHZuDGOl6
         MF9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxd9TeT/zqdpSYKwHZzvT8xkaR7Un6GfRHY2+86ttaCEbt4qpLXSZJxt2vZM8jpyY50EQEuKhJm6jAwM0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7TZBbsqyqoX6/TVgUJ5SN4aIrtZVK8KLsSCprwr9rgYj/8mSp
	oIeoMeUW5H9RnJN0zBe2yZDe2FG3b8b0AsDVdKN6Ne+4aBU69ZpahsAY10aOccD/cNnaZYVPbEk
	5s3rXx51sUuBNDgc4tSlmW7yJmXqp7clMXKWBL6+SSGewSxnRPNBexZCuoUCV1L09pxsAUId9GX
	Q=
X-Gm-Gg: AYBFou0eQlCtb8LjtRWsXcyLXeUF19RrQMg9Y2v/mzvRkjY46jdpmAwV+v9gdPw6Voy
	Kdm5qqFjWXz0ilE9ApCh5cPZGotZeecEW1uBXeaIbQxFblMK/by17YjTLbIemkwnOY91XqPMhY+
	H7yteVs7OwHSrcW7lDasCfeEOPfYJR0td67HbrpcMzxxpGFTRUPAvT6ORlpN0nrfagvev7zUggu
	1aINU44pjGWMHLxHaP8/hR367d5hwZFJQeHrmbHJpSgQgbPP/emRkzF2iDpHXs7QYQtdT6DqLpK
	8Bk1alynr/A99z7RDosncDa03bcHZGcxQTkDoiJ8MZecPVV2sS1lXvgraC3R/Kb64PaN/CsyUid
	nwgI64xq7GRX1Wno62sc7sctGXPh0dL8=
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228638eec.0.1791459762573;
        Thu, 08 Oct 2026 04:42:42 -0700 (PDT)
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228565eec.0.1791459761768;
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Received: from [10.217.216.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm17870481eec.9.2026.10.08.04.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Message-ID: <3aa2f7ba-734a-4d50-9eb4-cb7322449919@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <20260731203515.GA1619665-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260731203515.GA1619665-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac781b3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=txCGJbmANruv-OSAE2cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX6DYRg/MMtsw5
 wkSQYBS4FIop3g3YRYGGFF59xuP/2+xgSPth5//EZupX7vlElkMi/WvDBkehW/HByqRaCjomd9g
 1VUSLa7osFq4Hz1Pzfri4O3YN5DmVyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX1TOKWgT5dzVl
 qsu/vf7BzOUhuGZI320WPZBtJjZeDG874v3Zg+Jirt8ohBSo0nAoVIWJFdUOJQuid6uUbtveU7a
 XRUXA179TxFLYmDgWAIovlU0Df4AGg29llAit2wDzYOIY7wWCXEBnxhTrARlctxxjXYjSqmB4lh
 RX7VL2iX/9foEnBr8Xa4C2vrzats7+Sf6B04+a2/4x2s3ruoUQeeXvjhIdU4NoH3XfJ7xKJ3YiK
 IdFnzmZDYdvYd4v11jE58mLzJACEVRpEP2AeYkHGg6C127C2q9ZHPVLza2ZM9ZqOWuQI8LhFgtV
 3PeOuf8hjb4FuFGfwsHm9ig9ni9fh/8rzTa3mJXgf/OK7nqnWvpL6dlY/8yM41urOeNNcOPctOk
 GN7MWADo9+zrn1RUidfQoo5k//Rs11q0595IYnZ0NVsmInhzPBjQOVD3dFZMV1MvykdaDHicnxT
 AkgLUM2eRUNHpFT9ycw==
X-Proofpoint-ORIG-GUID: aZpHcxhNyAuixvlz3ujjzY9sZpEeAPVE
X-Proofpoint-GUID: aZpHcxhNyAuixvlz3ujjzY9sZpEeAPVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046

Hello Rob, Krzysztof,

On 8/1/2026 2:05 AM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
>> ARMv8 and later processors implement the RAS (Reliability,
>> Availability and Serviceability) extensions, exposing hardware
>> error records through a standardised register interface.
>>
>> Add Device Tree bindings to describe RAS error sources.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/arm,ras-error-source.yaml    | 330 ++++++++++++++++++
>>  include/dt-bindings/arm/arm-ras.h             |  11 +
>>  2 files changed, 341 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>>  create mode 100644 include/dt-bindings/arm/arm-ras.h
>>
[...]

Thanks for reviewing dt-bindings change of v2 of this patch series - I
have address all the comments and posted v3 [1].

[1]
https://lore.kernel.org/all/20260918095746.3347893-2-umang.chheda@oss.qualcomm.com/

Thanks,
Umang

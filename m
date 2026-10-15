Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1047A88D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051268; cv=none; b=otys+Kvwpe4Wbbr6o+V4cenbyBkym73qPuS6yoB9BP418+9+onyzS7M421tuWiZRGFzfCT7h0KKvwY5pymyK/B+Fzv3jzCG0ozeO0hgn3aJY4jGmj7i8seoaJXAcnTpXsfpHkJeOcnveYN8RaUX1bFkdo/zxaxNOO+Kzujezn1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051268; c=relaxed/simple;
	bh=wXyFOoGBCz03tUFEq6nVZ5iLN4xicYygVoYyQwqwqZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeQzQZJFq1rF10itcpejQ5MndKoS+ytxVJxPDlxvGzAQ0VSgAF0JoqhOorMBPVpOfTaI9FWVg2UbspAEsQ6HsRoZHMzMw7sVtrcL1tM375A9TnRX0ckfBgdzjHkv4Gjgpk+qNcJ8al3JatESrbqIwHpA42otCEaR7obk2nHfw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peCk39eT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2b62kRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peCk39eT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2b62kRj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7tAFQ3468837
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=; b=peCk39eT6uYglLRt
	yhtlLZfzptStSGoGvtDeeMDvvRcEmrAwb1WSzL8Z3zFODn6f6ieANSmSa51HKBDp
	d7P7if3XRb2nivCCRJSue8XqRSElF/p/VrHEwrGpMMlFmQr8H4lGAqub6uqH1sGp
	veqJVj0u3ezPJwDMjv8uIf62ae5AadSzIPPsbIL/nRjFVybmH1S/xtARVNP/jN4c
	JGfowzb1hWAUnIYKzY6vHZiOOArWdNxymietWf270BpmH829Gmm8S7CRmlK27u9Z
	y3l/daZxTf+cXBiyNRFQGjFKPkP6XSlrNB+z29FlsplUMf2itc665u4HMsu6LRfg
	copvyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7b423-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350d8a2368so11244861cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051266; x=1792656066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=;
        b=j2b62kRj1MaySNcSB46wxCjnvT5AR2DMPW+V9CnqYPzDN/3k4BtZAO1x7Vq00dikpV
         oBiZkOQH3TRgNr+FkQBpAcz9OldMYgIqsQ3cYqO4osjdgGwhcLzHGCQcR4dL5XYEC27e
         pylqBZNyM2X8+lvfzU4iGUQcgBu7fgLDeWgS3Ni6w5zyMTCaWobqHwp2rAeEtuOxeLdX
         qywYxzFVMpuHe8h3pwfhOFcTOU/v+IhvuUS+kzKKrAS1VnKC5BIlBDjeaFEcnShehSUu
         Bxe6PhGXteDfdnpW/NgQxLmV/gq9jQD4V142kqj9FnZmKs5+ia607A2XUEn53SD0i8iB
         /dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051266; x=1792656066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=;
        b=feFpbPn8kPAJbM+g+6s8TJpVNHd0U/sO6lCLv0Y0d+WoZJDoHE7aD5NiUpqBismqXT
         gg6O3Z87mUS7k+YM66REevxZGJPSn3COoXIwe531HXkzHXULYlZqHoQ1td/t0uJB2SSn
         lb7yrXu9hsW47Jl8I83OSTxfCoasrW36H0AnqWdroLdal0bWBOhxLL1tZdpAE/TE572r
         fEMBuALOCyzbybrgJO6Neoj01uI56zPzl62PacObxnkDKLUzSJ7yn0RDx+BeCl4s/GYA
         eFUwU+YoQ15uvKBznLArbFxoWyV4oCtWw+A9CxNxMtuzVN0YxlwT1tD/nodH50oF11RV
         6elw==
X-Forwarded-Encrypted: i=1; AKwUvBz8/j/tdwCkeCHFjfpeN9zIwajlyEBajLJFQQHEITSrLz3NcaH1p6rbgc1qmQUjGfd374uzNeclJheOM58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCD7QM1O2jr4yPgWBhyWPU29IYl37phPyT/BImc6V7ec3x6tzy
	KUXv78LgOldq4B5Pftna4k9RQlKG4RDGi1FHHZX/Apc2YJkrGt7zXUufd9jKTIiGpdRMYvIsgX/
	nftjekzuU5EEnMUXrFjpEC0eSuICONvpbtzVEzJI8zOjU5pyBECs3HNIqvxYHdaMwm+0=
X-Gm-Gg: AYBFou3XAS5/o7tmQ99oG90I+Ofao2e1qzv/RsR8SIbAcLTjGptW8eo2gzF+7B/2C7u
	9epqnvNwRC/ItRcEU9NueS3x3SXtle3Zxzt98TikCVWxifiVgkDdUSzOFDlewF2sVrHhA6KfdgT
	ZdqV1mfWA+G0b5x8TYeiIw2vo5FDFeWCX+Y11BQFzJmtqc6PJ2afHzB427nYrtF4yDECt5GcmIX
	qU9ZEsvC5gDoBbI8/5gjYcEnH5GzM0hsCQ5/MGwGoc+7ieMN5YbctBMdvGE1sFb2zYN8jmyW9nt
	keNgRLMsgudXi4HdEH+DvHEaQtvvIg471oqsDwnjQ+8bQZfA/NSHK4NQ5yyYm5Sl2xtMMiP9XvF
	1LIrgwTnW6rgfQIhJxmJbGg==
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr344295611cf.4.1792051265809;
        Thu, 15 Oct 2026 01:01:05 -0700 (PDT)
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr344294911cf.4.1792051265100;
        Thu, 15 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:01:02 -0700 (PDT)
Message-ID: <658c4734-35fe-492e-a9b0-4a4d89afd231@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad08842 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dnVO_i9_aC7u1-2RqPT_3T4ZjIZyWprl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX2yRdYOEhI+cm
 IYueTt7Yrxh9/tgXpmCOJdmynU03C4ucfUqoJXCSfZ660nZcOBKxVhbCsMm78fslNLvq3+wZkUs
 GjTrMIXcbWfWQQmgGbFcNUhXJ6dHQN+8j4aJ97zJZyzeY1/toJBH8rqGsSZaC8rm0JnxXBcD2X+
 fgeTa87jowfLecv0Orqq6NspUwhZMK8HKXuXCqRSdprWq2jJ2i6ZMpkm+vnGuD9YMHJUPnYyNjn
 nun+d0akpt27QeR9Z2A21T8Se6PQ6KmdtlrrPAC9puKX56IH+LnanYXqx0bydNIZLLZOqwyvtGA
 +cAheao/Q0AhDmOGw+jPZiGC4yYOMEhzQXdBHdsWAcKu+8ZESYObHqmjgQeTD6UdApwaDhvM+cd
 NyZg5HcfSTe/UBsskGnxZQzwm8owrp7+FRIlHk1pt8KIW7XHIRaWYAaE7ocz3mBHr9hY9Yq3HIJ
 4oFqXXuid2vwyTVsOPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfXwhslwxeoso8V
 jw30nDcYQO25Lfg9FpOnqfues9bnrthd3md0XLhagWZm319rVt8au95THMZHKbebKCsRL9wpHMl
 CDTnPT7gjFmZDhaIrmZ8S4rRpueXWF0=
X-Proofpoint-ORIG-GUID: dnVO_i9_aC7u1-2RqPT_3T4ZjIZyWprl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may access
> pages for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
> Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-ccfff49a8af9@linaro.org/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

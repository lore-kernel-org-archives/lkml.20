Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098717;
	b=uO3P82Q8gImTcO6bDLrFE5kAULGYCJYVzVyoMLA9Zns0NQoFexVjUjF0r0L1GMTeOpXR
	 7dLos/3PARyL6Qpc6JR+yFURO6r21TL5AAViv/f6CtUznbfV9OZpQWwD2QYXmD8TS4cRx
	 PcUZR0tNVzpqCa/ASNg4VlH/OAjzRgwZDjARz+NIndVHtrdtDTtWwkU0H6WFrMF+GAKXq
	 xJsbWE0oW67+IwNccnSf7Ke5nPTrHveGqyYfPLBWy9qyEhwVZrSJQF/hoFC3fbRljyd13
	 eo/iNY2vWsB+HDrQarp0yPf81L3wD8kG0HEXaxV7UdMLEXXfCc5VZ2M8mg0ksPWQVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
	b=jiWerIVcd8ydeL7DvL0+1Hxeg5lt0zDLj7ozYCsayXG3TzlWh9DNl3KSxSF3d/JstpFE
	 DcNVzWoP4PhSvdcmNTIcO7l4Bu+jWMy45blWZed8LVdJ+xkMXdj00BPVKVdFHnlls3JDg
	 x2HM4FADjKj2uJc7oJgTUWlKlii6+E0y75CKaycJlC3NfNZzEFDVHfASS6uHmqSg6cpvt
	 ykW7zx7Fc6bdNf+rjR40YN9ctD6p8c2XsUgIMHiJl4vtl6YNi4tbdGQ4nUTBuB68cqFDW
	 EF8+duSRDZwi7AaxefM2ALF7aNRwELz6lIZAEmmP9NghA1JevF7IuB9UqyPGUb8hCfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oJZoJ0/9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j62+lRRf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJZoJ0/9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j62+lRRf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwDm2458098
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=; b=oJZoJ0/9L2pXvJCh
	+AVIw8DAlppSxDwqHmA+ztXhBrZicpi90xg0i4uVbavLGD4TxqfW4/8pnYY3uoLE
	5TP82RxR+ZdichJeAgtBHVgVVdPwmXGyAS/pnUYqaomZ6IifePzOnCZbZRUg3XNe
	BCmBU8fy1eqcFAxQJiHEF+L7WNzkD8Zlht1A5g4QCt7LAG8rnuk9D3ZttRD3x/hT
	uafdrht6QPuzHefl4I+tYtfovrcJ7XuYWfnNwZpjQk1s5jC+SXeh1f36cnBCBO+I
	LWTS6Uu1Od1RU+YjJTHo6AxspH1gZJxt+EyxXgUGQ+7YzUlFsgQDzuO4yoROlBo1
	p8fCng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9wdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5360b8cf8f5so11552401cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098715; x=1793703515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=j62+lRRf67E/I/kvV45GEqo7UbYZ5EQ3iIjvRBxWGUuwEO0hEb8mmr+Aw0VOBoOYqy
         X6hbYf5m+7hoh55IaSidr6Tln0vtW10mr2D1f/FzatnQX4tC5PSKXtgZbluLVIBLd8SS
         3TgoED9ikyrdPZRkNe2QinS2wIX1Bm8KdeQGknHNmd/ncKT01NtgO1GcF7qkKURqWj0K
         b2xICjV/TZW0BfIvrzClhie4WPw0bBj6RbX/V7TRKHB7+vc24jloZxCM2SDX5Z3nhxqM
         JUN0zFwbI39rBQRWYuQvyXq27fn1SCrNKZhBK13YmKYo7B9RviStHV3Tq0CuYNMybxUu
         7GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098715; x=1793703515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=vava5ub/sFRO6Zn09yeQqyU5Tn6ahmfnJalo0HJ1Qv/0bEEpR1IFFC+PHNmE4esJLC
         3vH95CqA9Y+rVM0w6SLT+73aC2LlmOjrj1UMixHNdvdpFJiN2hSbn5OLFnzUcNe1BhVa
         0k34rvbK2aPKmWGu8gcaqHG1NHkm1B+Mf1dOn7lLs9hrMT4QfMs51+Fwk/kKhnWIUyUz
         M4V22PiPjiFn8OGWwPmJ8HTC0D/7v3JSOfl1e1V5B4hEO4n/ZdSp94mKXu1ciBTuttpw
         GN2lF5SqIjUYIFv9wwB++riKlrts0e0+9BqNXYPgDDZnv3qw1pHqpeMW7SuElem1aH92
         O2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBz5chEaykVydIC4CnsxdGBLKc7L/p7EDbaGdDbrxInkwmDVhI+7eVyYSu/EJJlVvbq+wh28+lNzPyODaDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+rhVx1zezt8nUOJFI0WVxPTkQHxFv61+P4MhOoxJAwgdAgjAs
	BsHyA1+8DYJ5Tobl7TIxDT+due1tWqRvjW4XT3HBTm10i+OLQFt5b3ENYTSQwq6435dRY2o/uiw
	1qbk44B+sZVtHujXDIuG3XWU7p3vaVIX5sez0zY/8B8K48JieSIkQ7SH7cXnF4VDgJqM=
X-Gm-Gg: AYBFou0CxYNun0le22CqsIHuQ90jFNkfzswe8lutJJqgNX/99ofbabyBL5ujZDuc/os
	WeFoH8JyV2V3psOtdWer7v9SG1FVzuhUObjzgJ3uccS7sWPa39P5ifcJGf6iwWLfBmUwvYhZZq6
	d1dVlAvBhaRMKD47grHkx288h4k716SaOAf2BzU1EWODShLQryRkd18ZAJV4K9fFyn1Q6WWqgLK
	voqGpT+FohOEfpIpyInwvwlaT12Hg3Ohin5gKyknMv1a0uWtnea1M7ug+GXblnzD/CpoFEn33DN
	fzlE7s6VxfTP9J1oBOvhmc7ICUjopjpE9K6Ru5Wv/fdeRdWmyTcoT/qz1Qqmh829S7bCSYtTOtD
	FMZJzSIjR7GOn4+SYZk5KvA==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148691cf.0.1793098715613;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148481cf.0.1793098715166;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm438661566b.73.2026.10.27.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:58:34 -0700 (PDT)
Message-ID: <a0f82960-be24-4d57-b12a-b6f5078ac64d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:58:31 +0100
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
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX3AOa3dr72RZf
 ff7lkffzbevGx5HCCq3Uo5g7xukHp33xtpRG8eUKlLdwFUFYRhZoTY+HV4SX5og5RP9CgiQ3iSn
 a1csOeE8uY0PIgt1eNZCdKriwfXXNFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX0pc+SrhG6FZr
 LhBG3wOvQo+r2tX+RXy/cXBTDPwk19HZrZ8duk2PGng5lUD9F32qy0617WGJddKwu6a+7/rAKBR
 abj8Sq2whhQQ9tYAB1d4h68Us88tB0J5DvJOaIjMHMHbC7Y6N/4+Z94LvGUp31ZbsTJTAXBj2Zh
 l7WKyQL+P1otvHYf3gIKvTa5N3Ie2JQ0W7MufkFKwTCeestM9i6SQzLUb2TLEwk6biujzme1rqI
 6L4UEhFDb1dRpTzhVSS1TV3KhRnqr+Zl/YF8tQE3sLkPT2EVJCR56mUbhyOUuY72BAR47p1B7eI
 VPofb+CdPhAgd57A+IPNt0x+tYEXFSn7jwC8EczXBFHf1HjKsmszxklA+j47u/dAqFaQQkZMtXy
 +aml0UmNKmjUCSl742PiFplGvlNSUJH8sR6sgg2tilR02Te/sZ2HHYo3NEUemz2BKPOYElRLdC1
 KQSF1j4n0gxDvTHis+A==
X-Proofpoint-ORIG-GUID: ABk1DFKYGu5bpWBTUY3fLDhRZDodKGpo
X-Proofpoint-GUID: ABk1DFKYGu5bpWBTUY3fLDhRZDodKGpo
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae083dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tfqOdNywceuasvfARf4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

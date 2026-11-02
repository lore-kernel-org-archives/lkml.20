Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620829;
	b=cBSHktPLEJiKc1GcEUWMDvM/qh5UnFj8IYzSIyokcgLtaTNkSvrz4+NfPqA1cDNF9Rep
	 4oQDozHN5epAN5aZW3tNr0dL3wNVfu+Gvwo49lmfwKPy0JOWJkLCL3Hphcn2hioqcTCld
	 4lNH4ctIDVpWRcTWuvhnoP/53VdaXJka6p0ntoUVZGGz3HWFQLDwcscC7J2p/JB+Eph7q
	 g/uRKR9BhjnFhKAXpS3lmXbUpzjYzJpXBEF0AodccWpIVmts5P423QxbW595JUY5wTjE4
	 oDGQCKKcst3PQveVrd8rtbIlqoE2as04fM7gHANtsLvhXOb83ciQ0XJW/RWfNK1EYHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
	b=bO1ni08/bFG4KkbOFN+PB1udCi/OBki+o6eYMWM/H51u5+/VyUCSxxrBUsi8TXj/BoPT
	 70TD4UuBALCj+luGesQvzsBtwL3QLB/KKrqmrfMqV9JqGKUlzQeuuY5nfOGDipth2rTPx
	 AxwqM2YI1wcvAfz9Pi+1avUkwMyl09qXzjQ29wU74FAv5UHP2mbesak41DimH/jxD80Z6
	 cgIU7/1et+8mXVGOgitg7UN4nxHX9lxK+QMCpSZVnSPgAHMqlkcqIuv74uq7U09MKZxIP
	 l82w0nZnx/CP4bae1b1CQGCbuZX6lUc1/JJ7/XGmZ4rRoZXl3kzl74gpGmn0qrBjOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f/7QXLQZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CluXKYDg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA91606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA91606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f/7QXLQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CluXKYDg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A35n3402983
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=; b=f/7QXLQZPnwmp4m1
	ZUVYDFMF/eoPWW7FrjclGu6np/3fhIlm418hZsTYVl0UPZjXN2sLW+5BPJx0S8r0
	zs/97Vbad7g3Qr2Knm/qCTgB5ehvfrRoMbd1IH4NO9RYjicr2yl0YWP434iNQ0El
	OjmxptxCL8K0Q1vJeNYjfYeNTYFVIhFzMfzyeDxCrsf/+24iMNn/dTkrqgA5TkcQ
	nrnApZbUEAh+sB13cyupW/r9CUBNaDr5C59Rp+rR36+9avYbgPtNtCHyzoyw80J/
	Y2IN6ryDe5jdYhM/3AfiTRj+aPsCnM+etYp+M20nMw3N7gnPFihH8WXDiMG0CbTp
	UdgDkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8y9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:00:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so55020285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620827; x=1794225627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=CluXKYDgUZQZusaoG3PgNehmGEQJ7vRvFSEq0ouzzaiG1ufxgk2RQvv3jD2VGv7D3L
         Us+KOUdscnCPByyWYWMN6re+COHjVFpDyoaqKBaPAABgicc8e6xMaGPnugHV6QUKPMLW
         BMWO/UEHEeBgUwCB4o4ZgBNVyt7vvjf//YR3opW4MID///5B2AK4337niCpGMNokKk3Y
         ZvyLqjKoCd96e3C7+KIrqX+C1GnnXSHogpUrQi2menCs6+GJNRA28SPG+4Kx6OsC7gHo
         tDS7Z2+6QlwWmpHVwHhRxKZXpogaLjajuZEnc7MVWbkubd51LCIvH4F1T8flpMDkompq
         K4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620827; x=1794225627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=pfw1gCijKhbDPPtBFc2+6u3WV/18JsnnAye/yYNrXr6IxwZhGZV7NBufOiQ8fM+eNr
         dnsCMae7s0QoqPxRNOg6XX6SUb7NlI6Fh/Qmhwvo+OWC87TSYBBsYJteg35G7F8yJoxP
         805lxt1SlHOtfPqQuSMJp1fO6icBbtpiG2YytmxXcwDOlxZHeXYYg5LJkgq3BASb5hw1
         GU5a1YDvmEfi3ezes1WvRJQ59Vq/KYHX1LNPS+F93AxDmRe7mtUIntyLxD39q3iSCQ3V
         hJeukWtipPf003bmKqDmLBC+lrz5jfjtbsOVEk1lEdSM7voT6Z+dwIeUIrvt/xHb15YE
         T9Ag==
X-Gm-Message-State: AFq9FYI/FPb94YWqdo5aNUnYPw9MWPCMzn9LJKIM8lVrEpHgcd6qyt27
	dq5MSaYfgzpkoDj/wgKkUDvBWvGv6UNrwhlOzJZbwC/j/9mvDTRB2jAEoxRHGw+d5hZFPbEWE9p
	VwrMrzz6GRnL9fa9KNc3UU/CUW0nY+6JRaFepQb37Ss/YeT/BTMMKx3ht0VpBgwbX7fw=
X-Gm-Gg: AYBFou3kqMKJ4CZ27h8XcWJ9c2Qefu91GOXZA1T7jTuwHApENz6R6RqyXxnoFKSwiMm
	2G83jwbMzhXeGlw06eMXiGIYL6S2Hw4165YC1FFb9jjrwmKwY1M4n5hgBvqe9R59gm8uBPVLpgI
	wgZVx6yAsZEx0kZ9CG5B1Ft9l2Hp8D/Gq/LVeTMuEb0AoVxgLdxtl1El4poE+osUuXlmj2n/hdT
	QyoWgsZzpG1EVKcHqEeOzrZTxhLQvKCUS0oDR/mXhT0Q68yP3JPX0Tpwul1Ybyn17GkMWge3YLU
	oYVgvCclzEqN28Wk639nJkijELFfbkwSdJvM2k80sSEZR+HuOiXB1NNd1TVC6HjCkEjoV4ph0/S
	U1q+8K1UHxUL/UXIopvHIOlmlFQO1hWXi3u+gL83RGlkEMzYf+2PAL3s2Z1uPkMWLgyhNug0=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606918285a.4.1793620826373;
        Mon, 02 Nov 2026 04:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606909685a.4.1793620825694;
        Mon, 02 Nov 2026 04:00:25 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm377507566b.53.2026.11.02.04.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:00:24 -0800 (PST)
Message-ID: <7264dc6f-ff30-46d7-865e-32d050c8c4a2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:00:21 +0100
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
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae87b5c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=XQlgmqBj-IynFr2M_OMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX6qAZjpU4bMSf
 xYwsyMpD5jjdft6zl12glcVzvUYl8UWRZS5FZKJT4p6khX+BO2noxEWXsbCe0DourJz6MUE79m9
 5QYbyh9ortxm0jz7VtGMwIyGyEchhEZBIfqdbL/lA9pkEhF8ESIi4D/Ix3BWMbODwqHdTDdL7rF
 PO1I8ybSAYN9gnIic9mSUInKz/8elitHeaZEugK0Vzo8IcyB4g0+CXvbYZdQcwaDJH+MgAE78Tu
 9lm/ecwwGHlo5+BMNu0FP5WwPvv3nBHM2/AMIFoaydwjlu7AVKqQFwDGb7KX1KvX6Vo5qlnQIJb
 iLz0RtJRUOff0aaLFS8SRwbQDxILkDlaryeYPTIp0VWsh8M7MMVZoTg9PqOni1wz0ChHna96CYT
 2eR9yjIhf0ildW9sI0FUnKQRqH5rsggs4JXYjttw8rIdkkP29Jkj2hi4CcaEuyP6KsbLrtC3nI1
 AhRSKxIOgs5RvJ3lXng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXyoi2xxbliJEC
 7TZ+XCq21ZtAT09XQJZWg7k8nmmUUYg3Z6EvEl4t5srmgY4mpf51ICFnRcmEf9H8oYdnPTXbAfE
 RkZWZQMIFW6ihrMh+0YujYcfK7k3l28=
X-Proofpoint-ORIG-GUID: nlA2d56HvWVVVxke6oYIYtYYIbMGia2A
X-Proofpoint-GUID: nlA2d56HvWVVVxke6oYIYtYYIbMGia2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Many of these are fairly low-hanging fruits

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

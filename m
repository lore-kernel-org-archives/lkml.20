Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421025;
	b=MK77c01D1ZWO4SONziEKF6H0hpbLToM6dYlT90JoTBJXkuZDAyGmDxfAj5Qcz1zjEvLB
	 lCI1ayGCBLYSQygJa7L57gLxdwad2HsSzwQMADxND3zFXZxdTIEJA5Nv7YXJlVqRb5kD3
	 rrJNSMyiPub0miw0vli70mf6VD81rsXyOLPewvpMO5Mo7HYN0DWrGFtbKenIEibJcxy4U
	 LRz3IRINfL8EN3IYMGzoQhGnz+zIelun2fhuPEUD9JZKJRDr5p5mg8Veauu13ndtXSVLn
	 9VU4urRbdJOukNhysvf0bwGp1LRxqBP1Q3rlXUmtZ8oQnkjEqcMMH+nG6RPld0C7wvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
	b=KMQK52cjsSdg62YTty9Y0pKv0hcOqqlvO89cj1+4Vw3cRRCdmRRPcSTCMxh/eul8mzAj
	 hePoccUUfVJ3oTAg8xDo+2F5qfR60aqub/I7nxboSOZuGNBVxtoBvNSjVCLCaXq11WQ+w
	 LgkuwoC37/rUAjtwg0Tlf8lC4T1dHszdY8ktNIqI2R0oR7tm2PJiOsRCZRtV1lsF/G4GD
	 dxz08FSgXnuwijyjc3Jp/HAddlDu0AYKlxc37ZC3PTUfVwoLauXt2Fi8yZcRzB5rwKNxj
	 eplnipBf3W7c7+f1vzNVWch5pbb7v19r+YrbX5nDZ2YXRjhVXgKnEQxCxnwUuXexhZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYtPEukH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OemP55rF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D262606A890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D262606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYtPEukH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OemP55rF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtanN1399988
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=; b=eYtPEukHz26BB/Uu
	sy05Kk/r4DlcBghXq/2zBCJ0QHiV7DuFhG13VEHq0NLaRfFNKpWwrgpw7U2NHBms
	MLYVGakbADzm6yEkTy2Hzg5q0LAda7ompwpIOyf+f6n1Fh8lqpA5dOl3zDWWz+rr
	gAeurkVXF2QGfO+NQVbbRewU9EFOYVLDS36Jrckrwo3lA8ZDCEZ9Y1CoHMfmp0Hz
	SBmlS4HeOrmiRWsOm0J0Eymx8GDXdxxLpu6k3vc44yg1ulN01eP13yp7Vfx71Axl
	OI64R5eBauV+e6Ghbe4wqmG6gz8Tun7C9syFfYJVHuGnnQhqqrbXkdjqblDJWSVo
	N9pqGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34wd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:17:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2238352241.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794421024; x=1795025824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
        b=OemP55rFOuqfkLoc1yt2Zz7/tKJbj7EDaFwzA1FDf4+s7fKBfjLoM1neo/C/wUfvKe
         cUSsiJkAWvqY+FwpePlJig5Z75z4oRoOpOgBG+yecVg0hhj6OtWA9yUmRqeEP3xjtXwi
         g3kZUntHNp4tT7A8cp9yKUog3BN+zuWMxGQcuU1rLa2Q7MuDIK+jN5/XbhxJmwrhZtle
         /1J/HaecHj3Dv8fJ4wFvw9jtI6ot+eBEIWGoEYPy6zM8O/V7ohtwqLltazCBkIqfQCkQ
         +5Dek5P7VBzK6JI1FEtJDiei204AKdxM06xx1AOd7h2U7TGek3rlz7wCP5wayNOgRBOa
         yA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421024; x=1795025824;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
        b=pMnJdI7MfoXZfFHQEsCRKU3SgdL0+AbTdOJaiayvcszd1Znk1nM1vIy95FZ5QqeBX+
         XDrEZnsi4IMiZxvMsUpqEJkbViczYiRiZDCui1tIF4lXKV7QSMN5TRNP9+rzCg1Aqpa0
         xV3P6k8CIVAyB4RzRDfn3YCDnt/YWCFcHNjXAvSpwTy7FtgxKanBgzsLVCrOEY8DGOCb
         sVyc0kEGqEFuKpiHXe8vj/JT+pB5o5Ukik3cQIOLaQ5AKNjG4HygvzTuI+fGW0MJwnNW
         Ecv9x8j9Ibi91mCahExo/1AddUwdhEd1JmSeh4ak+hURsQUwwWBuyk2YAJV6hytJEgJO
         PawA==
X-Forwarded-Encrypted: i=1; AL+hErGkkAsZNHLUDK0h3OZ5GffUeqrIN+da3UW5+3ZeJkRLLXnjx+rqVd6PRbYBAeDyh8jmeavsqLEQH8l9NCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iHd+TVq2sDv36rPAcgkk6IthZTb+lNei6AuUViBGFvwJe8Csp
	88a2mHQsBmccpScI5IHpwh03eIy1RBKNHyEgocnwysEkaQiMTSmTOvn9Agjbh2Nr7Tr4Abvoxbk
	mcRmoVkVc57WCfCh0i87YhILn12MPjMpyIgdn0s/7S81qEfBv82s9rtHBfnAZbZnEBGs=
X-Gm-Gg: AYBFou37yWvNE5z2Yr+bmwSFW8vo019nP2M56Vwqf4QLNlz6BZ2PiVhc5V6vPPeBLBd
	Y8lJLDcziwWeuquB3eE4JzXM/Tn22Lcy4MGNsb7uWO+RDhf9xXC11WsGgtPyj8U3/E6grN1tZ39
	NhLgGZhrqKqhWLmdzHlFJtciN+F+OpuemKXSHiyWbet1038IO61fAMx1LKY6zcfv7wEevVwDvLi
	92dOQlmP20WojEHbWHZ1iph1If9gfwEdGhXufPYHMfvndJp5PSe8VwvaBPDDvDG5HdLl9oI9u49
	8+kFyxgstksfhwLZNnLjv0bB6+Q4aX4spBQuCXDXkNVOnEhSzNYGKZG2X7igpG965awGy+3nX8H
	YRov1fPiXWRqaYaKDsM7LDUs5gEPy9b60ULdz6S+IkmDii0cpmjL+cdmZVUjXYUhWE/ytgCCWEP
	o=
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d50624a2cfmr1137072137.36.1794421023708;
        Wed, 11 Nov 2026 10:17:03 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d50624a2cfmr1137062137.36.1794421023239;
        Wed, 11 Nov 2026 10:17:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm12980486f8f.51.2026.11.11.10.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:17:02 -0800 (PST)
Message-ID: <a9c0ba3f-12db-4453-982e-25e34ac1080e@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:16:59 +0100
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
Subject: Re: [PATCH v2] dt-bindings: example-schema: Show example of
 dependentRequired
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20261111172107.GA3839021-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111172107.GA3839021-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4b120 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hqZhws4bIZN3CDWLS9QA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX+pTXKszIuSwg
 5v0vjb++lMqaDU1CuXEuzyudVYOyttHvLgwfgYCd9WWJ6rRuWDZGRuNM0V1Jc4RUWa5MwjYfplE
 fdz3vtMaUyg91D3MR/+sM3WwtarHjhUl3VFq5+OkhokK7qeoSN0TrNAG3LXJmQ9X84p7QPCbfFK
 j3/Pn+oKr/t3FIP30V92VCZctwD/3JzUt1VImlqatgFRKi46BUPq0u0/TLgVLs/Eran6DDX8iQQ
 zuR4H3mMALd0VI1h46f9gEh1X7SVa1ILWhdFDA/W6L23ijMg2ru3SWVSJwWNZiE1u/tnMFe0mAK
 Iy31UOE/xrmpx6xSYn+y6HW8zopjz9SgGnO9pGltvGiBCYx9Nwxep5STQlmRnzwcUc1DgXoAvdK
 Jo60q9r/6hiopBqY0WkqSej8HmO5gRvxXRg30AojbilST6qq4qHxlA8VDEdJwIxLKFfUxYYh9Qo
 2KOEg+ZIMwSBy9zWctw==
X-Proofpoint-GUID: Dtm6ajmOMN8NeunqMZGA7FyUHODAcOnM
X-Proofpoint-ORIG-GUID: Dtm6ajmOMN8NeunqMZGA7FyUHODAcOnM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXxyXDhBNLmFvL
 SduCZUQoa+fbgL4po9bfVNFPp7uVzSkGy4PhvjwOiXISOFYYHY7M2UexmJ7ntI9iiWB4Zhv3hA+
 dl4d3liY1SWtF7MreI+ymxN7Zu+mlaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On 11/11/2026 18:21, Rob Herring wrote:
>>  
>> +# Properties might be required only if some other property is present.
>> +# dependentRequired is a shorter and preferred way to express this, instead of
>> +# if:then: block.
>> +dependentRequired:
> 
> Update 'dependencies' instead. We can drop 'dependencies' for 
> dependentRequired. Would be good to add a dependentSchemas too though we 
> don't use that too much.

Ack, I'll add also dependentSchemas

Best regards,
Krzysztof

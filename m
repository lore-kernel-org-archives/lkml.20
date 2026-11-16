Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832366;
	b=yAGJMLXBIFAps98TpXvsVPrCtH6YlOTA4Fyk9pxf2qfJNDCm1nNO3FsXUoUUFh9qinaJ
	 vcmSqwqpGvZdl3ff6Kn7gE81/x5IkSoS6R7bJ1+y9O2dPoqREfuNMHyt2Jr6aHlOxo2F7
	 GlfEiF5utxNps7ADJKwc3+P7CcNxBwaMhJsTJ3XiA4PFUAMRiZ0AlVq6xUQhIFhApp2kg
	 PWQlZM6E5qehdU0pBiX/3kvJ4d2i/2/kNkK2vcNMCXPBO/+tzWa5ffTomwDDNt/07pvKW
	 EN0+HJSNsQglMJVrBQna0fklqM7YajVzExguFBju4o9hf4jspT+AeKeTY9pXnCNbqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
	b=rfhhkUcS/WU1ukt72UJlECzN8iJOCGFsQ7f1JTX/sByWMsc4C7qANoN+KqP1Y23NyZUd
	 9NOhZXirf4h43W2ENVQ7ZuzM7lIPe5IWW3n1kBXL/pf/JsfQKducpYHM3lBTV9t0UtvMw
	 UniPPbHb+jh2zwpEYbMMaqzm+x4k80/qhTtq5N2hpCaA41sOIfiOnWUEThUa3r7SsbehR
	 J4eR43bQQSfuNAqbvofK2hu2rs796HJeKTUPYdalTJ4aQgSOaYAD1wLPjRFdHAeKr0dt6
	 APBZ/nyAlVBgVj3nWN4GxLPyBlBv20spEdQkuOB04vbfOeBz4d1bKSHqkLGUVB6RUpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C938D606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C938D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0txV1552448
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=; b=RNC3a1rCFItRQEKS
	NsN3B55/yQpgxTY8JmxABTsBARg+jQ+85Hz1JCyNBbPbMUStFxS3vHf+5jwUFZVC
	7RaWHqWeLg40NFhzQFRsI+ZwdsTwVI7g7K6AHST1Odu0BG6JQMJ3sD2VHHm2iAlA
	cZHO78ZBa5WveYkC0yGVzuNsjzg4EPEn3TsdZUe3OTS3hcacvhmhQu54cXy64PPH
	kMxysg98xx/KP2/AFgDEp4ZCvH7+OZvvPDp9JYq7SJv5kp7yRyzYEObaTEGVuTRN
	kmYJOBX+LUqgqJ7QXcZDAjRmZGDu8E8He42maR47VXAq8qXZRE1iUXKPsPiFULIi
	p30IEQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gqt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e109028b4so968531241.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794832364; x=1795437164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=ViQVeOJS3q76jgQ/AIqwaFL3aCc7toq+ZnHN+zMXXOaHNCvcKeOaZD5vPTD5Kbvmd7
         aPwPwdzViMOMZftvlwH9cwU5kIbDL4vpPgEjho5zgZZin1BTq41IH9+IPd9JKU09MDoA
         2YBicTKbQuLYo6H9juXiuYV1C4fcJbS92Q0kPjYBA/rCBKZGr3kTf6exPZtVlKPdZSvD
         xSVNnFh67MeuwNX1rhdhXiUCwS9+bJsUA42J2zCY0OrIsh3BbDGQSMr8Am1t9jxRqvNx
         2POQdsJGhJHul7QcYWbLwjlIAh2k/W/uE6upPk/eaAM2EnCiIuTMd2BtHx+9T3S3fP58
         GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832364; x=1795437164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=XVe8Mgk7NANpY/JQdEG9kEP3vWOQqIqW3wi3scL0KrLqWr+T3tf7zRZ8si900TQYus
         Yc9/8cBFsuK4WYJCgo93lzu9EJJQJd8o41SsiDEKEzVJ/dV6onY3hZEyNsd7/IPPO/Ue
         QJzz0MnoY5amjor1A7j7a15rk1ODIRR1IqcphAoFnf1MhKBqeDJX8K4ZJcR0ZLtAq85c
         6OPcXr/HAoA8r+U0Bfdt03ihLS7w7Fd2LiSF5rHxqiNo7VHJBc8HYaVwe3bwYNrj3W2t
         GtkQxq1K0UJDpgS6XVKsqFGoXtZdqRvBOaAbHRE7iMbvC6bpsCOUEYl7c3CxQI9TzhcH
         KOhA==
X-Forwarded-Encrypted: i=1; AL+hErH57Tw/ap6GAvEySTZoFJUbuMEBq81eBqm82eajKrAqOWKLQH8RYFFfJLt+R1ZgSXHiQSSTRud3L6wLuBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U1bWC5K5F9VmYlwQCib+qA4+gJi2UAXdxWE34+LqKDVREmssL
	GrSwCJU0m3vfv0YawL0MCf4fYx5pNjtOgGwPZkCmpUDOPo+w4pi4vd6UdB/i/J6wSD87MePKoas
	DyYOG24aGxK+GqhRcIwl20JcRadoeBISGGaOldbODxiErTHO/KmQRpi3QwTpVYuTgRgM=
X-Gm-Gg: AYBFou2BBNzA8IoTYzZRhc1wPM/rez3RdlOtj9qGpD8SabL9MaEi0tDvCb3E9ha+3VM
	FxJXX65ygiEFDlWnLUe1/H7TKQbqdyVzWN+xxHcVUVV5mFPJAMvre6FxvVSi8GY300yElPzU/WA
	jqGooPBY/wp/mgKtOgnB4awymY+7VlRK0ComQ1srnv9XQTlsvjdRsyxv6m82l/fTUcnUbL+ylRo
	wBZ5G2ndZaaj4seX0V+9ydpXmR3MMhQeGi6DXY1NkXBWXNnt+ivnmYu2kC5nNiZ+QSVQw0TG3Xc
	rMa0wRRBxNy1YJu9Avgw9UlEt3Ht7zOBQgVqxymD8YPgEaOihMxyum/B5jJlQYeVnLS8zzLp/ys
	vGlcMwz8L4AMX8eE5rACSwNCkoLyA6ZLi8uFIzPrwR1/EY+EsL1O7CTSpYon46C6E+iemT0kkgC
	bw
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888658137.14.1794832363830;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888630137.14.1794832363350;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c4f6d8esm6654021137.9.2026.11.16.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:32:41 -0800 (PST)
Message-ID: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:02:34 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afaf7ec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YRl-4mzKpuH306CQ8RIA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfXzl7AJN/z/zTT
 1Nz9/8FwfkwhhgslyMJxiMrZ0+dbR0FhszwJaaou74bt/Pk4O5ZNjWvmA31xu/pcr5m5ZMgsjdS
 WafaimCBZxXzHZ4SRSu6JSWkQcBdNmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX2ZFrp0MfvIsK
 KnCeaqe4OsLfgL4zQAgpKSMrc8fjflLrMl3InyEeFpBtP/StD1vVAagK6cbKnd/XAciPjCi+BfK
 VnKl/ugFb0LFXGRb8Rlw+OQAoVmr/mN3oT+Jelbp6g9VwP/acHUjKImD2PFtUGOrt8jiryB5xZ9
 fYGlH16RMoW0fy/mN94Bq0UpcWncQpgt4whlZZjYoacFqEhrdItaO1/1yUhOHpQGlFAkbmMCKac
 qIMU3v9z6JeQy6B4Q1Hx4l70HnwX0WKNjzV0VkGw/WceYa8X7nHUwRgsquYqvPVbnabBVgvkTd/
 /aTEe7/zK1dRXsgpIlBDxg/JlIEhUdX2Q7gNVe0tLj0/LM+Hzn+3D8StjrojxuvsXiMrx7o06QO
 3QZT3c8kJZJvpyqFlVLPF9lEM7i9uU/gk7KCyAkIPF6A0fatkpixtTZuXQttjh7u0fL+R3qYFEh
 6XDm9NnhUzco8dznCjQ==
X-Proofpoint-GUID: Qe4TZWhWEFGm4tU4rSVOT9OY0_OZQSeM
X-Proofpoint-ORIG-GUID: Qe4TZWhWEFGm4tU4rSVOT9OY0_OZQSeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160049



On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>> It was not used in-tree yet. 
> That's different question. You added ABI and that ABI could have been
> used. Was the ABI ever correct in the first place?

The documented ABI was not correct: port@3 came from the old X1E80100
resource-table mapping, not from the Glymur CAMSS port layout.

-- 
Regards,
Nihal Kumar Gupta


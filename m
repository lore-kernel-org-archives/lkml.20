Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910179;
	b=P3AuJ4xvO2vSIkHjYtwCo48E+M1uSidG6PGQtf1agJNNZgfsdV74jTqoWpjbNmuy5jEj
	 QIn9pBd6n8dej1TBdcLmAhL31FKq/gn1XO61yRoIffNfAOjE56hwrGV0CBgHc3/7bEkWB
	 E3UZkqcUZQLFE8u0VpM7tsopterGo09VQdoE57JAXOaeZffANcxvzODk8SBmtkudD3exs
	 Pvyoop4HumyU2rH/ESyx0AgwMPZWfFohMRa8CN4jsnZP7Y04XeEuH68gmsTFGNlDey6Ex
	 iaC+T7waKCnGe/Jcr9LcRe5NnPgSbuvVwHslnQE4MrSczuklhqY02L2smdEupgv2e6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nL6T7aHUaT5pIG87xtlBIVGdVXeITIPxNhed8tYutnQ=;
	b=bVil9aBpnneeOHDOJ+zG6prLFVvHWRBYm93APTwQYXwCPqe2Oz3bA80MqbVmKInz1H9r
	 Nfj59f0WgWu24liY9mJJ1Ye+sXTDMex1yiQHpygaKfAzgtJxg0PlXTOgXhPVsQ4tq8enk
	 BNHtO3eK8oazUm7iCTn2Eo+aL+eNIkXk36NaqkretL0qH4NpXaPReplxHYd/3bbGioUUc
	 /LcxmwNYW+p7y8u9dDylIcQVI1esqMIVgOeDvrjoz4n31pTkCq8u4L5D38xOv2T09cC4I
	 ZRVAFy0xmHKNMoZQVfMYHHHcy3LzznfHRZkGv0jEFnSMy5TIO5B9Ox5tgQFdLm+OE2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="J8gAWX/q";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=R5nrVZj6;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D3C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D3C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=J8gAWX/q;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=R5nrVZj6
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Jh7Wc042141
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nL6T
	7aHUaT5pIG87xtlBIVGdVXeITIPxNhed8tYutnQ=; b=J8gAWX/qKIU7Gl3tPbK/
	UrmzeUpYTospSb8zM1H79k1RVFBW1tImzs87FZXgiawZ98Xq1oVN71Ff/ZuVKLMc
	OdODjzDE7RNlHJhRapGxye/172NVMfDeGMBkHzPpkkSBaqt1uygQVIkhbrsGlLJ+
	P1PQV7c4YFMpQfvSJDFgPQPj1dQE70yDebWjrC3kb5qJdd1a+ck37V1SBtP3PE0U
	pQfX6EI3Bf+LBnkrM+NlvGQvZz49W0ho/hFjgtQ+gHIWGMUq601vo7IH8/YsdbCc
	nTWGB7I1TeL1pm26pUmFjJxVVrqNwkA/g4+549rFN/CEr4Zxe0F05sn7QnVjW7X1
	AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hrw6ejcpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:22:51 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so473056585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793910171; x=1794514971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nL6T7aHUaT5pIG87xtlBIVGdVXeITIPxNhed8tYutnQ=;
        b=R5nrVZj6r7FKesvHw7VoZnQBLrZK8ANZg7sf2F4iMlAzFSN8mmJ6LcBtMiIzp1A934
         wsJtDtmaaTqEDzQrHHzwQ5M19DlBeuSm0IuiPhfB+LCo3ebQWXKUpdR0m5G6vz1HSLef
         8FOiFZmiA2cJHVIxzv70x0x/CZ8rom4CtH1a/kiAmgN/tPyWGRrnwX8r78KN+KGfLzXa
         JAyepgxG5xmczzSSMWh3PCTRhKe7+Jplw5n4btCuG2me4mjLpwCzIx2mQvUHUFJcnBOY
         AgXc3eTvH5DdR3j8Y75lyzo9yLT8IDIkl+XsNg0QpzfmAfrxv/qsmxCtumnCFb2PeZ6k
         wE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910171; x=1794514971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nL6T7aHUaT5pIG87xtlBIVGdVXeITIPxNhed8tYutnQ=;
        b=AbFSReDtZbGyku8rFJx9eShyzSRH9XgODB9mdUPt+/K4HCz9s6CuUWauNT/Ys/ghR+
         v4bQ+CGR26jF2ZYEhg3QncJPBBJBNFMbN17dsoJhbeAPEwBLEt/uzwUgiAeRkPa1QpdH
         /MsTVUJNf8KLGXcWLt4+Yl+V+xZFEXTpcTf6y9vJC7+nIrp1suPh+ZVVbaJcXr+qFQbc
         fogdd6n4R4hb9GlyJPyVWeVZL8Z9mAjrs9AsXY+eSgTLLj0NpFZVvk/YJKyRM+T6Qn95
         jr6ZEK1A94uY0+8UON4nwtBFSWwjd5XrHrC4g8NAWmdycdOCOt8NrTZlvevxAHhWhWPG
         bHzw==
X-Forwarded-Encrypted: i=1; AKwUvBzg5RTdJoHNHXXMIANFeeFbFu0UGS8klt7RMQz428g4hWE+bZ3PLkBaQUJGWCN4iREgAlA011CF3XOSJew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mV20YI8HCAPl/KzgT2E2qL6jKmaBd0hNmOpSIOHGwrAIcIHUI
	ZvsYdqrKpUQ48cmjtEYmrk04kwN2ZsS7C4o4KnnAMCHx1OcBqHCRugnoq7P3fMUom69LeW1l1op
	8cB9w49eyM/Bdb6nLgXiSYEN8YhXh2N84LtR5rtwkpPYXQ41fb/Y/uY5z2c8wQA==
X-Gm-Gg: AYBFou0YZkOUOSm/R6NYveRRlW00Jw40Zdv5yvr4eEzwPCUvsVPQRiUo4WPeOwac6rm
	DNfd8uRvlYWk0gwmtHFovKjWWpA6J2G86hdDN61bQHMyrtDUCNxayVJtMZ1NOK7tlfQMyqKrUG3
	HQld8r3VAQEi/tW7h242zflDJqLvdgaX9nUvcgEknlAvm9q11GHoRwUhWwA+RJ6RjhFsh96uVv7
	YbpifzHnblq3lOrnFO6+U9oeEtAazMtUTlTnQKjv2K38ebDSK3LDFKW5Dpo7zSyDkNiC0clww30
	t8QkP9pXS5lGOUU63rxdJXP2ccpcpgSLZs4ue1pmlym/U48sDClm+M0hRKSuanjZSdOF4s+hQVa
	hrc1/o/0eFpV5DSIpULfrAFcV5IiBoPMUNWkUoT6/WiFwohIV2LcoSMzxH/FGfzIYxaOq5QBAsO
	osaWcf8fVC8PfV0tZpglBHVTeGBS/xpuVIyrE4ZQE7/hZzLLLeJSpfWZagZfkX+kT66LE1f2JIa
	aCagxOmwKmtgxuIJWv18O74G00l1gZ5AxfPc2lRCmd268XRRHrYPenBEV0tsaY9
X-Received: by 2002:a05:620a:880c:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-945f360071cmr27402285a.64.1793910171185;
        Thu, 05 Nov 2026 12:22:51 -0800 (PST)
X-Received: by 2002:a05:620a:880c:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-945f360071cmr27399585a.64.1793910170744;
        Thu, 05 Nov 2026 12:22:50 -0800 (PST)
Received: from [10.206.221.57] ([129.236.229.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945ead40470sm133396385a.18.2026.11.05.12.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:22:50 -0800 (PST)
Message-ID: <d16c6038-f03a-4e1b-9691-1ae36650f39c@columbia.edu>
Date: Thu, 5 Nov 2026 15:22:49 -0500
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
Subject: Re: [PATCH] clocksource: Use the clocksource under test for the skew
 check timeout
To: Thomas Gleixner <tglx@kernel.org>,
        Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>,
        John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
        Srikanth Aithal <Srikanth.Aithal@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
        tz2294@columbia.edu, stable@vger.kernel.org
References: <20261102-clocksource-skew-timeout-v1-1-4ff412918591@columbia.edu>
 <878q39y8da.ffs@fw13>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <878q39y8da.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfX/cziMI3vFlTT
 4+P81YFSwvotr6CuPu7WpbdOjsfwNqi2nYdt8/xqGfa+Ek8JXmeefcIMuQJRGS3IE8ENDD1xfB/
 UMntigiNXzxWwhy4T9gq9gzACxNhxE/tDGE4YhDqmkQYjNza+6ES/Lu8ibYyHUlsVG2iDlMaC+7
 b1owDbENO3i+qFPpJHW+89v0yFl5jYbkGIkfXjsNW3/6wOBfC3MFYZEYelHey74xUBn4kGWKE3n
 YCyQ++pnWemcvmj+ie7dz28hBGLjoXUW49V1p+HX3dMqv6x4icWJ0yfc4kpxuWGqJ7OvwCjAurb
 JjCQHQlxrEzXM1etl6D48/yRmvTRhhBHwWTl2p3zCREYJL5M9xdFEBFqlC33xbUc9VbWVqsKzqz
 mt8ZrSpjWW65YMe5txhh9PQIv7j1tOw0jcpOtwtnWqpu2Jyf8arvTwa/l1kt4bsijTdTKT8aSRr
 qh9yTAQ3a+MY1HCEn7A==
X-Proofpoint-GUID: Rtmh4BYq-6leu6PuKoYiZVLHRoSV3GGx
X-Proofpoint-ORIG-GUID: Rtmh4BYq-6leu6PuKoYiZVLHRoSV3GGx
X-Authority-Analysis: v=2.4 cv=epdKXYpX c=1 sm=1 tr=0 ts=6aece59b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=JerxfvFqMz+qeRdZ4jtV1Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=6JKDXS4o0tL8RmaW0nQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfX+nZcajfSZeY0
 hc/pDDWK1r8RYEmVur8WM1wNsA1BKQYEusATcIHVRWH3C3us3TmypPHGu64BWVUC4vAAmJSSpuy
 lHd9xa+Zd1qrdT2KFGUUG4NNlLGVe8BB9kUL9c3HwLI2fdnqWbSp
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 adultscore=0 impostorscore=10 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050081

On 11/3/26 3:20 PM, Thomas Gleixner wrote:
> The above explanation is enough. No need for this backtrace.
> 


Ok, I'll drop it in v2.

> So your reproducer does:
> 
>    while true; do echo 0 >/sys/devices/system/cpu/cpu1/online; echo 1 >/sys/devices/system/cpu/cpu1/online; done
> 
> right?
> 


Yes, but on a kernel booted with clocksource=jiffies.

> Can you and Srikanth please run that on top to validate that we don't
> end up with that?
I ran my patch with your delta in the same guest and it holds up well.
No hang and no "stalled" warning (even though the remote read timed out
a lot during the loop).

Do you want the delta in v2? I can carry it as a separate patch from you
or fold it into mine, whatever you prefer.

Thanks!
Mani

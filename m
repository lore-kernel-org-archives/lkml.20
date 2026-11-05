Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870842;
	b=AlDyG4neaRhxPYkEnEfqAYtlXHNKR8kxheF0A1EXnmxNYi7hFlL1PuGVuRIqhyDN0kvI
	 Ck/yZpFC55+vb5X875MyhvnCcjvrqupdAo4q/ZlVjQcrCNymeg+QhFzUC7PBe4bANwXxe
	 /jtf+NBbhd4OyeNW6EwMxFDhhg8XqUTsWjHt8hm1eJsBG4B0glj+QnUpj6bP5eFwPTtTz
	 rMPqQgqJoc0nCfMuRmv+nl28lOg9MnipqXRi7ltDIJ56xXN6i93V+jV/q75JR9VKk4p3I
	 j7lui4QeqD9ocVDxk2wy2DBJ5m72dF8EoaVIdAYlrtk9+5tuNFmKkcFDSw11sAeTZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
	b=uTpzcy6chmBLuoqXeuFFjrbCDAJIAbQkVxYRCvi/c2ym//FR12h+c3nbydZHrwPkYlZW
	 XP3o3qyjlQGUSubHFIMCggOuSVb064m9Knhm4WfLBQOozaxd1hH0Uk+smGyFxcuAM5OEY
	 0ywoeJvS/rmVaa3UedO+hvDCwLYK4/hMXT2twV2sd3n6U+WqY9tC3lU9CPFTh3pcOA8wO
	 B+s9Y8Yz8marazPs/aznoAIPhi5OXYJPrbrxvXB7feO7MsChZiryEd/gd+j8U8df9Ff/U
	 9Yjv7Yvz73cQDkTiUL0URIhy2+5kjqMnAwjJpuCtFjJP2lNB2FpziCx3jSbs9drdXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26885606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26885606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCmu942028
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=; b=XQWkIk+Ok7/eQfi5
	IaDYWuVv2yxFE97D8rHVvTqHT0jWQeZHW3rPFIxlSYJDzInXMpqJhJIkegdHGT2f
	TsJIloo+4iGqv8f4lu8OlyF3QYn//kWLeTXBlyzlql6BuaTkkKuHDXIj5K9myXK7
	A0M6Td045rgUbG1TOFX1D1YH3m/YrvcdGT6tfPvsgERJXwyexNgLfLC6/jbXjSLk
	o39sVMbxbeTOjgIQP3oJ4QqK2jT6mng8CPq28tpYSAAd8oAaSDwi8BcCcDkK5L4H
	inYJ7kZtjv6C7Ig//5ADu9o8MalmfputOOkbGNt2gg1d1ANUl3vGdAIDeYkKsSwQ
	3w2nfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj48m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:27:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so376760685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870840; x=1794475640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=kpWRrQpdKnw+PwtLSXQ+4apLLYG+UokhufIDlOztnE6IwtDPA8x+xUClCo1hWb/fgD
         Y47xHGhhUq2YG6paGiptAoG9weMdkGgT8roWDy1o71ZyYWfYB6IPVAKUWParmt29t71P
         AzWtEnLPxcBXSdhSpukOPF7DqXvoO6iDFbkYIXA7b0of5O51FOGmJmEJMaGArCCgfYFw
         M2VlT8B3iXWcT38I6GQiQz/hUecsZOoitt1lnfktL46jKo28edRM8TtsZGcy2TcKBrKl
         aKqiIYoEk64iiyEqu5inHhTFIP4TqS6njIb2NBmpU72rgbFDBaAeI5ENnLYy1vk77Ecc
         K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870840; x=1794475640;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=oUFXmftrCQCODFUhj6GattDKTxYcCHEvJKzdz7k96UW8bL6XDmOYD0cVJ7c5BU1XoT
         0/Xi7dpAMjhYB54BL6sDH2CMxqmoJ3TDGFovWPwBlfE2j+WukQTfAzZRpzs4/TK97hhB
         tqcjxjlAIYdDYr3YP7nklz8s1o4fNOTDlUgJOcgBMd9IFg7FY7zWpYSRA4FzcicR/+Ur
         wP7vAQn823NrGCCmaLf9Yf35AiMfcwKPnjvhL6/QINzUfmqHknXOukdhYMqw1umL4p4H
         PTErkxLLdXtImmLG7Ixe5jTVtBCdatT7JqwtRKG2CCnqR9acf18nm9XZFMe1QBs0sRN8
         fntw==
X-Forwarded-Encrypted: i=1; AKwUvBwwzcFgOR8KNb2+c97gtTk4OF0EwVAe4rNfF2fwsB9r+F3Pmh/65CC3Kqadb4YVlizRvywCkgjdfD57u3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iFNcTpuirvIpqq5jVqC8avl9pDfkTYs90GAx7ftzav7VT5vPG
	1aA/9DTqJo1zWl+fVo/MURZqQ/AYUo59czsVfhrG0MtTqUavi1SjffXwgdMRKd4p5UDne+nit7T
	3E9dHX1Lj4YSfqVe5xyAM1soGKG9qnU8Xnx82O5Y6ru42HYXJOrPfVIqA0FhFWnCR92o=
X-Gm-Gg: AYBFou0IVO05wnSqkIb7pbkac+PPQYejY5Quj5bw1BVwLvUMSig/BgAMUlFGw9Mk2Ly
	K+GbOjHUU0tFjFDPjDJuiLZI6bIRTUK/3HJtZroqj4nJOfAv8cRKeOtwYDcfVQhDpTYEFYZ5c6R
	mnAzgDwjT2Kd8qKKN+6KGfxP0qQEZmghW6X3OJV8Jfr8WDH82guJKwZVYcyAsKdYnF0pCJqHx+z
	gmYdDN8kPfp0E7Iuqjf6r97DigivdPy9fg15IJOF71Wj6iZ6foSU6uKTuEoUt5HhADliVUr4lgD
	qtUNCx7xSWDWvWD4jCsifcCl+BvSxLWEFVgXgHZOMbO/tbIW6CVQvd0UPCHrzIXabg3lRbJlXIH
	p27Ury4y22BNzhsjfmCFQ/6+T+GwGRQv38PAjpMhOCkatGxtnKjg6oWyRHyhEuT1z3tbkbjlh3w
	==
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139966385a.10.1793870840281;
        Thu, 05 Nov 2026 01:27:20 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139964185a.10.1793870839833;
        Thu, 05 Nov 2026 01:27:19 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm57928185e9.11.2026.11.05.01.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:27:18 -0800 (PST)
Message-ID: <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:27:17 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxKHF7U1x_Ozwpm@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfXy0pxHi8DSUwH
 mybp1Hh0wH0cP1dLXcB9A3RYmFTJigAIcE0WnVFKH1fXoPanEVZW2OF3v5KAq2DRUq4KRfQrQzt
 jsj/6B4cam8NMywedt0+4pkRqyr5grjdxPpHoFEel20X4fvSU5Ct827s/vFmdGIpDZmPyUnI36x
 nRPU5rQ9uPchIJADZ/W8qW/94v6PXf/YLc/DfTzqgwD0dAcELeEep+PmplFkYS9bq7pck+bVkwt
 eFbSVi00RPtgG8y+hnc2bG0FhA2QVHDoGlzyBoQQgXN+rKzqrdZkGmwbEBkjLxjd196wEWiTLJL
 8Qbnq3xOkZ5vgxfAXgCwfLF0kt2eJLKWzoLuRM8Fmok37Tsjx0YLfDec23K9NeBR+aWpuMiVnPT
 oN7qmFjs1nCFsTUaJxG0Me6YwZY9Bx9Bg/2wwfzMQiSunx6ZUrdZglPJzm0Ympg0iQvP0kfjKEE
 84sV6lq2hORpjuJTD+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfX0r8mqJAQFirR
 PRl7BoAF5FTAm75YMk1G4+FUy1C+JLTkF+3PtMcUW27Pf4OrjfklezPirRoihG4lhdHuNU3HkzW
 qDdP9rSmoBKLiDBLT0Cxs02Z40T9jdE=
X-Proofpoint-ORIG-GUID: ZufxauHN5tzsO78PQ0HozfDHI7IAQ3Mf
X-Proofpoint-GUID: ZufxauHN5tzsO78PQ0HozfDHI7IAQ3Mf
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec4bf9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=I-sYKaSChvBqotAcINQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050037

On 05/11/2026 10:19, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring the rest including the main concept of the patch,
>> are not really reviewing "the patch".
>>
>> As explained in the Submitting Patches document, the "Reviewer's
>> statement of oversight" is for patch as in "entire patch" meaning:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is explicit and complete, meaning it does not allow
>> implicit variations like: "this patch or part of this patch".
>>
>> Reviewing pieces of the patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> I strongly disagree. It's all explained in the plenty threads you have started
> on the Subject.

Please provide arguments. You keep responding "No" or "Disagree", yet yo
do not give any technical, discussible data.

You just wrote:
https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/

"No, (partial) Rb != Ack."

to which I provided several quotes backing my point of view:
https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/


> 
> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
> not my issue that the piece is bundled into a single patch. We have options:
> 1) ask to split (and review as standalone piece);
> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
> 4) ...something I forgot?..
> 
> (even partial) Rb != Ack.

oh, here you repeat.

There is no partial review tag. Please read arguments I already provided
to you and either respond with counter arguments or just stop repeating
empty statements.

Best regards,
Krzysztof

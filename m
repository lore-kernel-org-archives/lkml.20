Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270454;
	b=W/I/LZRNSPwZi6zBxpFqCuLg2weOXndNXTu2jnY8hoP8MhCKRC+vbZeqAQUafwcxrWtL
	 wtrot1B9qwAm6eTne1UWPLyGePHo5vr9vXABRDR/dKYv6oG7I5nfc3hD0MjICBPldZsvi
	 XqqvWiCMg3LZxEseRnY7nk9IcRwJMNdTfd7yo5/U9gQFHExyuZBF9EOl4FhkoGw4xhUYD
	 rK8BPbt9qzpQbMz+q94HOJl1ddEcm2mWQBgz4Kr42AAlWmfbe8qnlKQQJOJuE23mHmGbL
	 5C8ng8ujwZ4YRErti74wZ1Z3/sjE4tXeMDUjN9j0phzxcnh1Iy6ykGJ8HKgpVFKgMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R0bTkl0ZeS10Rc1qvdgpvqwy+jnWQCRdinOmlNk+hTA=;
	b=OsQU1LMWpSaHhqJWaStsmXSw0zVRSmhslWAr8tJaWSrgcXCm31zC0HCXHmwlnZa5wOur
	 3cg+cc3vIZSQurPPZK0jDpNzbcZCstmq79nQgm3SMLlj+Ey7lWbOdKdEhDyQlikxeEDVB
	 xTyiQBrRJlkmqnjPLRl9oGuBGjIgwD9qLxqJePg90c8GuES+WmU+8nQMhVgXbUC5/sXKH
	 bH2uwMiPBmdFy6JXKs8T45edzmJQLwrzTO2IzVJTIgAjaBLoYBRodz5nvwbpK5SIonsZd
	 bk1Q7E02hAy5cE83avGVAxrwVcwwAHT8QLKoh4N45X5fMKvq1UzIUiftp3IZmXSoL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jOCviDoU;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XrqTGBFT;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782CA606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782CA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jOCviDoU;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XrqTGBFT
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9NaBVU4089445
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 19:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=R0bT
	kl0ZeS10Rc1qvdgpvqwy+jnWQCRdinOmlNk+hTA=; b=jOCviDoUV/d+SBS9+iko
	Dp+sdqHEyd8SiXDTjRw3mosnYhHzzqA94GjHpHpXbj2rXDHIWgTioMoMgs1G0vx4
	yYqCJ3+A5N6xVan0OOtxwO8f1H+vX/+MkPsPQJulZtzLXUWsW0C2Iie93T14f1Fx
	UTOxKmkFqDk68PQ6FgUd17ny5o83+WVj4trMpGfmWZwucNvgIbUr9sVuy0NEBT98
	CqbC/arbYfWLUWP3CaPG9vKS4HgBNz6ZZpWbS8gl+xVoa5F9YitxG9nKwg7xRjBF
	Uf6eDeUFBvgVzo7KYOjH7cW8NXmfp+RdKdjwggD8VbBFbCRBMlF4F3VV9d3EfhIR
	ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hujkjuej7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:27:32 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53664911d46so29816801cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794270452; x=1794875252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0bTkl0ZeS10Rc1qvdgpvqwy+jnWQCRdinOmlNk+hTA=;
        b=XrqTGBFTrTL5xWvrfRA27+gRuCxOHy0oPG4RJ2l5KKEoKFi4aeB8EHZxGjnjqRLtta
         YmYMDd7J5NA2v0LcX0iInhFJbVQzfuPm4gHRT9hQQu5dZaMjQmzEL9e34MFbZ1d4pn5b
         0cMKq0UN2bKJV8SvTkbPCnPCgPdZxYd0xxf3niX86bwqjmBNWV9IWOd1W9k/Ltix5WMB
         YPRCOnexxITdGKbgpYK3n0hKBf7a9RzZH1AwYfaK6VS/+FDRa30o8A6Xcz0J3jI0sXs4
         MqHg4BcRlv3+qfqCnYh6ff3lCJgP36QmnHuKP4r0chTXaX79Vl8AJxNpc8octS5AUBQu
         NL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270452; x=1794875252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0bTkl0ZeS10Rc1qvdgpvqwy+jnWQCRdinOmlNk+hTA=;
        b=ijYNXZwQMB7cRH0tcvpeaz65ocIMbHTTIReXFkm6Y5ZKTxONHnhxcR7zzu21sag9uX
         b/KNjKJkUk/aRRqbxZWnuBhUesvQH4OPhCezjvezo21VBrrktF2oPWcoOSEI0Gsqp0ex
         3EqUGwaHVAQ26x83LMj63zwdkmpZZx2OrWr8D/G/74q4YEE+yyA4P+gXXqsFj6bg1jt8
         lz7RFPKn1nTESn4UhvMFEBX7i8nUKOIB3FLGI7sR3XkbIjNdAn0CJ0wn1slUtzKxM1Nu
         dGVANPtjEMFX9Y8DaS4mwnWKTB0+r9zVuoNAFxuGuCsBT/a+KxzoRSxjEcuM6RFOlXh0
         4mZQ==
X-Forwarded-Encrypted: i=1; AL+hErFThmzfPheL8j9JB5AG69xsJfXDf0tQTpZwO9ZD9Cb4dqLHJO/1UrCdX5cg2DaeparmbVNt4xc8JS4nvdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HGQA51+3uW2yG+eOYF6BV6mUCJGAVYKjDWpt3tSFg+c5kKdgU
	bft/fbVAHgpF+4Y0aXpCiG25SfqLdpkhxFHa9BeQX0kSYbt6BTghrFb9rZRgi8MmUg1GBkoBX/B
	CHJDsU12n8g+y2zFT0rSayFF2mqGCEAWpZPSTvaxaKpCmZMyci0iInWnhZ4Sc0A==
X-Gm-Gg: AYBFou1P9sAAC+ZVzLjk47SX1z/HbkKuo17HnW6HwOczknipUus5X5ZPDmGjsHPsy1z
	mz/3Sa9R8WBUfBgcO17XlgI2n52q8rFolxWSAAxVjwkyzM5YSaiui+i2+xu5nKGjLXXAclFxP7X
	LiNno/b7t8qp6XaE4x2uHyWtiXA9TWr6oq56zbK24KCxAzTYPMMI6ZBKeNfEmDuhBDrk01r/SKC
	54KPslaOuWYEvrSZcAFfs7/c3CEe3DIy0HRMLJJxy0gxu3Il3dukjagn1kdKcmFreaBmFPOzlKa
	Z4Hz6G9OAi6aVo3W5owCMYhhzSCgMUTgzHib/lY2wxiFihgoTZsfJ4yx+TCS72Tal4BGhXph2f+
	JFE8sG5s4oJEJ+/CL6ckJ1NTnQ1n7jdz8u/XfsywTWZznve0ExR1UUaPxhp/0uam6Gv0KE2GIGm
	AVKZvkkKiP1pDVsLSnAY0ps1gP+sJvIRLIfY1Ik37w6P7v9Pe+n2QkAJ6Czh5b/jAHS0u5YTeaf
	XbS+EWDHWxhtoZoJcMsFBVDmHa2dl28zdtb1xVYUu1kQrdEO6BUu6kCkoRtry5lEqKemUAIlq/O
	13O8ZPRh4CpCujWA5lWbYw==
X-Received: by 2002:a05:622a:2a10:b0:536:e29:e774 with SMTP id d75a77b69052e-555293bb0e6mr16117011cf.77.1794270451580;
        Mon, 09 Nov 2026 16:27:31 -0800 (PST)
X-Received: by 2002:a05:622a:2a10:b0:536:e29:e774 with SMTP id d75a77b69052e-555293bb0e6mr16116841cf.77.1794270451295;
        Mon, 09 Nov 2026 16:27:31 -0800 (PST)
Received: from [192.168.0.76] (dyn-160-39-51-212.dyn.columbia.edu. [160.39.51.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555091eb801sm10414481cf.2.2026.11.09.16.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:27:30 -0800 (PST)
Message-ID: <0bf0a413-7f7e-4701-8907-cc44dba4509f@columbia.edu>
Date: Mon, 9 Nov 2026 19:27:30 -0500
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
Subject: Re: [PATCH] mm/memory_hotplug: don't offline a hwpoisoned page still
 in the page cache
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Vlastimil Babka <vbabka@kernel.org>, Gregory Price <gourry@gourry.net>,
        linux-mm@kvack.org, linux-cxl@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261101-memhp-hwpoison-pagecache-v1-1-ed8785ca44eb@columbia.edu>
 <1b6a6d13-8a01-414b-9bbe-cd194af1f539@kernel.org>
 <a002901b-715a-4adc-bdcb-7a6fcda67711@columbia.edu>
 <a2ec6814-d3d3-425a-b379-f99b219aa55e@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <a2ec6814-d3d3-425a-b379-f99b219aa55e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qy2zKP-EbDgYObff_N_Ey3g8jYwB-fmY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX8klbV7Y9GS9b
 V9ZtquLalPcg3G9p0BB1QVSlQdmkVQ1h1sGprUi/Wit7yq6+QEoROe1GjHL2dosw9G2tXLU5kCg
 4+6SGsNWL+AVdLX5xzfMkL/0TLDVKekXCCLUOuAS++R4yXCrE6pY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX8AQtvKQmhtJs
 r0NRxK1+yBuUvYZ1PbaceA3BZqP269S7ajmJQqqqBXnKNv36FGW0VZkSXrqOuNYH1f0FoAaj1a8
 I67bwjm01v/jI9d/7xCKdvOocN9jyPfRATmj6T951mzFhDDmcK93YQJ6fq6Rwy/efnT23x0tJjz
 /J6NV36/VhbAI+Qq4cW+vcWnFTVyKFyU7BnvP8qNbC09eRqF48CCGkiiuHRloJl5MWpjAoa2mgf
 QyZNrO+k4ChSXE1pShciqCxJR58ozS11A00UUirLbQ2sJdh4Df+britlvSh/ogGwXvlcLCpcOJc
 O5LXun28m/vYFAkn0eXZ3lsIz3ojx0K/RG68a+3ItaGkD8lj9D0lQ4AXvcUCCz+i9cZ9es41UO/
 AP27n7Nr349wSdKCDeUprk3pUa3rLbEHXUuc5UECS8c7U9SSxozmOH7Ya3Q0YXNrO4+l0U2eUIi
 80RA4X44og8VdQ6C48A==
X-Authority-Analysis: v=2.4 cv=X93Hu2Te c=1 sm=1 tr=0 ts=6af264f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=l9izRfKDRJJ6Wn/vzKnQSA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=C_JoN6WlG-creS2BCkQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Qy2zKP-EbDgYObff_N_Ey3g8jYwB-fmY
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11961
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=10 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 impostorscore=10
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100001



On 11/7/26 2:41 PM, David Hildenbrand (Arm) wrote:
> 
> So the right fix is to fix that then.
> 
> We'd need to sync memory_failure() with memory offlining, correct?
> 


Yes, I'll rework it that way.
Also sorry for the early v2 :)


Mani

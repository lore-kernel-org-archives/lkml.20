Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622241;
	b=WNUlyqfcg8KyGAvhCqwAnoRMu3nbhYmqKb0OdaDhRl/j0ii0tnOceHBPQN2FxQKiPizd
	 c5BQcYl3SgNJ1wcqLlTDF74WfZMIRZK89DGW+PqO/o0W2ZziMjOwM5sCXpheQrbKLc8e0
	 kTTqgdqWfjPKh+Nh6yukDuHe7YgzUKFUMHZAGMMiqkJvGE4fxpq11lJR1BRct1dD2Lz+N
	 yyRN9dJgWaWI72oNndyr3zb7Iao2Ke0Cxi9iatYEvRGujWPobeuL6eDsuKhjxUHq2ZMl8
	 0Zag0ZyUgVnxHIWPgy/R6QuY78lBpbfOVSL/xkdzBpAbZNw4wNaQwNsRdt0Bpulup7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
	b=iSU5tgdSt6P2iqJmC/gtxKpsGWqN+0vF/FeychK3fnApVp+3YP4J+4SSPKzto/CoHxir
	 Pg8APWUjLv6xCuZD4PwIItd/Kz7PvQPikE1kOfCGPUs7Rows8zFkSaQVEWKR1GonOecmy
	 +NZyu6dfqkXlTfx53JQaWbLltYd4zW9woH7UO8b9Ode4FlMPDUrx3li4FV+0Mrtup4eYS
	 Temn/+ygSEnMvw02UQdQwiKH8NJF5S7rIEvrmQRPGPSvfd5KAbfRJRdev9QxiCm6E8TkL
	 w+UFEMwPwES99Dxgh3lMQh0WoN6uSHYPhAGalUXLQWWaA3Vq4xRNGt6lgZ+JnHcNF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp8DHLtU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PP68G5nh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522A606AA14
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6522A606AA14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp8DHLtU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PP68G5nh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7iB214023
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=; b=Wp8DHLtUIYsr6dUr
	66N+TY9Htt6YRfP44vU9IbR+v3LGKMNdhONzUIAL6d5AP7CiSxaygGy1g5hJA0RE
	fkWYgh0iD6HiwK0KHIC1gvS4BIezf+c0MIJ9V7Ja5K+MtAWgQB0TNe/fTs5tbGdn
	g3MOyRAV4mciB/EzPhZsJCIGya1UHxP6oGjMo//wStsuMN63T0lTIf9pUpeYifzT
	hIVjEcb43+BPI/SpW508B8gKc/IX6GuSbeHHg72t+x/N3jubwViMQ7P9H6OyZh6w
	hM40nsAkIWOqY2MOkv0oAVrf9o4ULFPuNN947CkGU3cPVHWOkRYgzvjZ+K20beU1
	SkRHtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sjnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:24:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so569487685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622239; x=1794227039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
        b=PP68G5nhwxs2zpBO5kxwYyowq336LfDByPXk3np55htv6aY2Bi/jEcPqggX+N2GGlw
         0Y33+xcvmZ1y+VFOoAaRDLRIxikkDDGJkRXSsNJQIDIakNLoep9727JU7C/BoIhsXKPn
         30NLzQSYASUZ+sbaNFCcyPUTSm4eQvKKxCIB47Xt7anPOHf1HeinB4/oBaJM0aBjgzcQ
         La3JJKRF9R3nNgwvLMEWtPOX3b+spAkiwqJHlj2nZZC+wmozlL70JbG6IPdHM3/q5b/P
         XP2lq0QhgXJZpZoy7uTOCsXvFl0/s57grzodrREgWLP5jy3H7trs9QSLaVjksR/JxO9u
         e+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622239; x=1794227039;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
        b=G6FS5EvHZ3nAW9XRvbKHBAmkL2tQRyQaG09V5yJChsRimw7A1pczjc6x3Se8D55kvS
         WK6SxHlg1aqIYenGYWaD41O++VN3TnJ57JZYVsKVQAi4F5Mf4DR0CB6jJXOsL4sYe78L
         YoQgEvRNnN4CfoYSzFIESeLtZeeXxfskVFhVWamSR935WTd0MLh7XqnXewgJo0oSEwFD
         n4+dhxbNu4TeJtx44Abjxiq35d/sX6XbMl3yAPsh8UpHiSj+0vq+UhTwcvOQodGb25QK
         uPpKM9CcFxSc4OzknNIwP7SEcLghwIW302fGbZjGCkRqLNWzs3TVkhmVbL62gq2k7S+T
         +rFg==
X-Forwarded-Encrypted: i=1; AKwUvBwKYbAYe4T3G0itHXXmcv+UMJXZAHeNhlyKMCCsswAB8WQoOFGywE6AIIdRCkDX2FfvgJWQ/WYKAtkq6js=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxUNi3XHFnsCxY8yWKA138zaULST6rcnEkiD6LRHeMfP9vh6h1
	e3l5OZMigiQSBcJxOhr+OWpISIjfhM8fyfMK0qGPPYSkC9//VlgrgxtOa1KEwDLMZ1Tn4HXVcG2
	/EFScmMVsAxvXSv54Mdyq7Ahds3UkxqBS9QPYXI0cr3VQ12DAT680tXktsY+lt6BYitmMRjoxks
	w=
X-Gm-Gg: AYBFou0dzCwJl5/T3vno8It8NgdouspfmNPIWwK/WvH8AfpE2Bh5J31LAkRrnucW52W
	GWnhczPq8tSQA2t+BZnv70ZCdm6jGErBPUNddbmUG1kLezmsxvfQFgyK+wnQ8Q1nhBVS9h89NSF
	q8hLyx8RC22eTDbCI32h4Wl/7Ax3kFE1XFoSq51XguJrWvurDsKRctd6Io1ZsURSGvWBuCpsV/w
	oICU26Lt6CYokO1OA49LwqhvAoifBz0ROTRef72bWd65mAcjgDg5od/OXXLzgpgb+iy3sRwIDqf
	wzlR45uz8GdnG4J65eFwzQaif7ojrMZbC4QuE72EKrQmWLbt7s/CIpUfuxCeJcmmnUac/RpO48E
	adbS8qjADtRCtD2iS5puRGj5MRLUxqDXVZ5AhVnsMYxrqKSfKKPSyRRSB1v45+KJxgnEJT0TVjQ
	==
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1545786685a.1.1793622239512;
        Mon, 02 Nov 2026 04:23:59 -0800 (PST)
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1545784385a.1.1793622239039;
        Mon, 02 Nov 2026 04:23:59 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm383627366b.7.2026.11.02.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:23:58 -0800 (PST)
Message-ID: <21b771dc-e9cd-46b9-a456-0950ae1270a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:23:56 +0100
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
Subject: Re: [PATCH v2 0/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Vidhu Sarwal <vidhu.linux@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20261031-tf-luna-v2-0-ce403579bb8a@gmail.com>
 <20261102-massive-busy-woodlouse-8d0bbb@quoll>
 <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hfQBW1gTV3sxv9L8wXR_h0RUuT8GlxOF
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae880e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JtIBhPYq3qQR5xcgr2gA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX96A8ASa6HAsk
 WZ7ipQTQ1HUniW14UCSYjejwcGkAG41tE7mhiHGcCpbTvf6LI3F94E32bDrkwQw6oY82XciDs3Y
 hnsom13exYLf1pbIELhhk0O0jbVdktLzAG4pNReKTtSsgz75OphILFggACWmkqIZK1jHFfQqx9t
 eLPAcJtDCgLGpj7LhpmZEsUNbxfSsCVIUrE1vS8qAWQgenHAy4qDcl7cqyMlrbXDiIApSgScOhL
 6STIU8pIareLsK9r5vAPyWyJ8CITpIBnZee3mHQ5L2c6sHrACPolGqs7t7LxmulITij4pf27yOc
 IPy1JoRL+qYFs1PGO5bmv80NXAo7+BXt7fzSmlRPwes4U0rGHYt2gmygkPHc63iYY/F2dFhmZ3C
 5CcLxUfmIV6APJZduHJGElL0yWSOTMz5we5GUt1SkuPYA/GtvIRIkNlypnmZJRNMUhosBOtsZuQ
 63D7TyzM9u6+ZCyF6eQ==
X-Proofpoint-GUID: hfQBW1gTV3sxv9L8wXR_h0RUuT8GlxOF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfXyoRzhi+5NGam
 gHBMa2TCnnrz9olvFEB3ofnMzInd1cqXfzEglyFM01XE0O1uSj7TV3tqQ3CQqjnfvL27gobAFql
 MiZSh8+/2rpup6ORitjVYDT6VBFq4Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020049

On 02/11/2026 12:48, Vidhu Sarwal wrote:
> On Mon, Nov 02, 2026 at 11:47:56AM +0100, Krzysztof Kozlowski wrote:
>> What changed exactly? b4 diff fails, the patchset cannot be applied on
>> any known upstream revision I tried.
> 
> I am really sorry for that, I didn't realise it was based on Jonathan's
> iio.git (testing branch) instead of linux-next. Patch 3 conflicts in the

That is fine in general, I'll wait for next linux-next.

Best regards,
Krzysztof

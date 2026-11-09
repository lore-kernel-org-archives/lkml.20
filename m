Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236337;
	b=vksQn1yNafnK5Geho4+v8a2Iu579uZ9SUmjdiKJ41iqyYjTHNjYqcypLbiOWCHSoDaO6
	 6jIZ5kwAn1XS94goW+jAcecdJenMG+RHOpo8g8l5dN2hEU332dIiCSElgvmlTFr7zF/MV
	 MMKKO3SbsqLaczXUPoEHU4fF5ms423iTm2wgIjnhljd/6k+xr4qSpVQ/Q9csCmS8c2Afs
	 P/iBffQuHaOxflSWKOVJLuPn9b3iAPdZJfnwaded+bU0BHceURygp2ilK2MQBw4YJjyt8
	 1tutpt3YnCnDelziNVPry10yJ48R98KedvL1FhVbi1eay2NmDS+AST1UAn1JTr6LH+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
	b=NRSHkUU7MO+r+AIbiZe/jcrQPAX36sjXK2/BbLfciAO5LfRbjS5ylog53ptjg9bFDez+
	 RiuqSgLEn7ygpqEuZ9QGT6gAo1hBmw4zVBbAnvWwHVlmD4STHTO2/RSI6WpLVFhOhGC4j
	 PO8r3DFqTht7uHlFANAAhPxTKbjj6x6n6pBlPZ4kTK7ysKMXly0zD4XD6iT06+g7/y0Dr
	 zESV4fFlGBevmGESs3fqjsgbAX/goBawl8vk0kwMdXAWS7rQ1onbOc4nNogPY85UiTbrg
	 6a/ppuf4rRCv/ia5oiSsfvatJydj/NxT79TRyH3uq8wDC1B3o/C1YxBmP+7kPzm2CvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g6s3BW/F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716E606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B716E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6s3BW/F
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFK6e3588625
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=; b=R+C2QlEK9VGcFf4p
	58a26g4jAaa32792CJFhQb8IqHARy/QVORM0TxPGvaJ6kn6nILbgYwDZeo1v9KvP
	kPSWybTsUYfPd3b8iXmP8di1/dOi3hzLs+HdPswoe+9O7m3V2Hr3/bVYD3NqN5Yj
	tpDiyqSRceOM0+RUiki4G3RA7q9bLhCYXLQZkP+32LPhsbvdiO3iFeV2KID43Zr4
	r8JDLQ79dWC2HllJqCQuGXVb++JI59SKhIy2BTf/FHqpXwQloUfw9UHmOHE2eHG9
	6Ug03QE3cA+28jgcUW/XX+ua+9fHXCzetQYZ182rH35vhaQ0u2lAhctTUA7YqeY2
	l02rtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8pg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:58:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea381ce04fso16217935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236335; x=1794841135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=g6s3BW/FvPsq395nkp5IwnkINSTJ4UPzTNhQsU4j7OQIiAZ9EcYhcKK6aaJlpmPUOT
         eZEMdsXv3ySgIS1oo7T5hgycmn6m+061AqYAk4HZuhrYxsovBSngozhXzsEz1uAvBa5p
         TEtKyNuyEotxVWsu4rwiRda8ZoFOWh5qwHKqsSfsaRU3skHh8NYlMPjj/pnM98+junQ4
         j5gcGzv2ly6s48LcmWUxf4WH5UpZCGGDqwzl+/X43xGz1zZ9uFzrnSrp3lklAeVIJp+L
         63rsOiABgUZMrATGgZR8TJrlIrTdWuEDp9XV6YR9snLlNlbWxI2/Y54rsdxEG38YOzwc
         Yblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236335; x=1794841135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=qiszzNmN7V0FDhgNyCuhjKVQ+B94wsmT/QaNyRc8EXS+AtmE0ZeHYIiXwtiZpfUFSl
         /1MgybOVJHIkECXa+igLN52olpNuBragBw67l1Q2VqieR/YImBJc5OzgaQ7NGw0HpC+q
         f8vg+dSlB+j+X3xk8aJrjxJbDrSK7cFJSZEvjiyPnW/vh3IuEfMqfHZigr9aOx16mGOC
         bDNOSfTmf2mKyE9I2FfMIOLfW1TGYt4aRX/rYzr6JGAi2mZv1EEF0PUnRL2r/e1zf4AR
         /n3DDtNsYWXSCadzc2vFKClieqoJs2fHKfwSt0Qt0NhnCWIaGgIkStwTKPfFGZIfRGs4
         I4uQ==
X-Forwarded-Encrypted: i=1; AL+hErEM/jJsV/gIwb+pcsl1BVW2FT+zMv0uTcWhz4KZjM0KG5UGPJYo/iy7X5Ph+OPLlObASXmsMtimYof3JT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+czyTatPufg00PA7SLWR3i6OlSvQTguw6eOYq/fpLZg/g1U2El
	GBYvATt9/JKlVi+AuBPgAyAfujykueFcFFav9rEWDk41lR8qjowek/Q89YRcsTfIv9PRVd5ZVGe
	urN7Sah4vrRZEONBJqfuLVE4Jh5KQOx7xu9qbPgwmx2UUk9ehwevSTMyyW5Vg/XzLGvo=
X-Gm-Gg: AYBFou1DCXe52DQYKKR7mxIWZKdkCMmivHnORE7zWhaERgCidq1yQVljUZCKpv5x9U/
	ool1VJVBb+EkYfXGxu0/9k0NzsOuE6x6dGnWCT7PPqAS+X4NMygpHdOowZf7SHsp9zd4vIbZOPy
	3De5LzZD6aMiP1OESbzuT3xvi1wczGeWnefZc8b9W2x/RKGRd9ZBr9Fg4DgnV3qz2LOMXcJ7ni6
	qM8cLNLVfswywL7Z64GVS/PCLn1uG+qDhI2M5lv7R7KNKINcG80U8VITB3CcXVjJZe7kYqMweZR
	hw/RCbMX9a871Jx/kdOx7EgeXkP1r3xY7DLq9cAdiuUoPGqfBXjlzFF0l760zOSQCzWYYR/eInE
	UoMmdOlUQvL+WlI+bFgSrnpG4LEA7pnklkF8xW69VO/9eoYoCyCoK7r++WKbS2mWJnakfwY0RfJ
	1+1OsqFQ1Sim6OrdWxTq/Ryw==
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31610955ad.10.1794236335426;
        Mon, 09 Nov 2026 06:58:55 -0800 (PST)
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31610765ad.10.1794236334912;
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8174bdfdsm12236235ad.73.2026.11.09.06.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Message-ID: <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:58:52 -0700
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
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: xing1989093@163.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109110352.1621-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261109110352.1621-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6zQ5A9-qTkvAQSfcQxxzJ3SBALiUoGkx
X-Proofpoint-ORIG-GUID: 6zQ5A9-qTkvAQSfcQxxzJ3SBALiUoGkx
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1dfb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Byx-y9mGAAAA:8 a=pAXL01g2s4yJVYebQMEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX7HkArG08Qh/D
 ihlGYkD7c5MIoFQZf3kdJhoQHxfgJbPDFF1TLYJHILXBpsKpQk4pvyDkfRTMWlZwy9gc8s3Tz3j
 kyD737wMCrnVsQHfwekjLf0PSeI/1OY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX2xhVlI8Ycr/e
 ezm3JCZeWzQ3mYlAQxscTip8IKRF/FBoeg+5jKp8b7H7q4GkpdTnD7gBV/nqE8bpnDOdV0GZjD6
 WqUSucXA8qk4bVlwTqfdGdbamIqgRdBCTCy1yDjiLaxZWDrsQ16fTT8tPIW91fCPnyhZ6Bp9FnH
 amCiF/at/64ioAtV7irJ1VDriMkE94PWUagGE55jERPkjw2YN8/TOeVgPZSdd/oIy4IyJ8GcY5T
 SzpH1ek1hEP5jFjoQtltHbcytJ4xPjtpKzf6duhOTuhLvAwyfLXgAU/xzU4c7lbnucRfZMOCRtj
 C18XUtoSgvGGfK0zizQRBhDkHvnmWIM/jI3QA8LokU6v9AqrUfvQ+RIYV/BzgIY1vSR7hwdLrIv
 H69hlS9eS+GjYhCuJNV/OZuIbrx83m7tchUyP30V3C+82cS6PP5AKCYsXLrzfapn4Pb+aqB2Z75
 jQQe0HxoWR+SA6RqYUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/9/2026 4:03 AM, xing1989093@163.com wrote:
> From: Hongxing Xu <xing1989093@163.com>
> 
> Writing the MHI SOC_RESET register is a device internal soft reset: it
> only asks the modem to restart itself, so it is useless once the device
> has stopped servicing MHI. 
Interesting. Where is this true?
Every MHI implementation I've looked at has the SOC_RESET register 
implemented as a direct hardware signal to the PMIC to reset the SOC. No 
firmware involvement.

-Jeff

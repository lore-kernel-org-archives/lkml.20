Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641791;
	b=y78+uvVaX7xZhe4oI4n2ib8aF3hMMB9bU417QYz+fLt7MbrDe1UV71bowkbJqROfwHsA
	 BG5vbcaQ+ktrCNWAdapyRSZfQ3KA3VORloJ/EBxrqmiym5+4yJjhfbjqw7/G3gYcDb29U
	 7Jag9qLg1Uq5fWV5En5XmLuRaTHMueV/aWQXUWVjX5/m9k1lh+rRbWfMpD61hl+KtIoCK
	 fOSkMgCxlR95nJey2kt23YRbrnupLS88ZL5XFOHCnZEyIz7oD6hJQuSk2TYStoK2w1Wxm
	 BSYfyLNg1bqjv97yeaksa0ta/bdxsyhfRxhv7ACLbnIW5zjZdbdTDxxNtGMqpJRXV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
	b=v31GJdi1aMjC3fkSVTAH+cdr/2DLg+VR8uN21z65/fFikOnUVfm/ldlUMEJRnhQrz6JV
	 S6x5Ju/9D5G+i4NZFxEZvwz2sRbqEj/dap51voMLms+NZcoYOMD4urRWtnnWZxB/Dsa0k
	 keszxqOJMiVlw9tqTatl27UOd/x/K8k5ueqKtcf52/YeftdKhNqHaRIUaEJU44qFish01
	 pzLTQ9xDGGTZSSHVFPeYT5PGbbDHlZIbTesmUFzJMvXI6T+UeHwJuW/w9RH4PPtbMK14C
	 YHqaaGPBSRf/Nh7QzwYbPimPdVXV7OAvuwsVuqP9iTZ1apChhhjGhHOqmdYMbvu7Xvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8GbARHd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKmz5q2m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B62606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B62606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8GbARHd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKmz5q2m
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60ttf1570039
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=; b=p8GbARHdooMNXeqv
	Zkv6uk/x5rBePH5QsOT2AC9pmM6Qc52On0W0aEl+ycGtXiYESxalPix+PQtx0tv1
	o57ioUbF00ZRnIR5ROqayo03An+p12vJtw81OGb03WfrV+ADQaQaEu3lDQ0i8nAY
	3W/S/XcEgXOH7T8kXZlaS5N4NLEuz+N/B/figu/bKyGTCJ4O6dtjfAC7E0GiQ1Z+
	BZOJkMT9N3odql8+G8PqdzrJi5sMimrIzezKODeyNrwHgwaESSFyzJivA4cIDEWr
	5HiblN+rDw9dJKENTzWAp+BU8hDDahOKh96G7a5k5nYG9fRV9xqae6jwNRMDlwef
	pdOTfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8729-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so337318385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794641789; x=1795246589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=UKmz5q2mIvY3ox8YvLGiGLa4UUovJp3M15WUOYO2zgaNZ+WItOigAgV6RIqx6577TN
         +8dzi7RjiXGvgk+HWQKdq5F4YGhFOX9W9EKwM0Jb7m0gzCDKIc84p0S3VrNpztzJEljg
         wvz9VRpZkQ58qyYNLbG6nvFdZn3XxLRZ+vH5kVQie/2t5gBsF2k0QfYbPLyPz4Dw1QCl
         WybqKMjH5DpggzsGe4z+Uz+gbnwj8Aok8TRfRqAIbmSOFBJOohuTnco31YI6E5cKHFWy
         w+aNFQ9ikAmGNhqkxVgBbTSJQz1L1h925DlvEJAtbou78mZzQRilpFUe3BvmLMDIRMY7
         oFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641789; x=1795246589;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=QnF0xp5Uun1zV5v8KG56MRqZDKrBVBjV7LNCpENiKq/u1kY2RrQe9EHinPEk/YPXol
         HKKokaImj0lLx0cJ/daubuF5gQLASI8ClDe7Lh/onbHzua6BTDBypALGWxNUAHJFp9Ab
         z3BVaB451pbrDa+67JNrBQtMNfZCUWO/GT2UlCeEMh0mNwbTnKpXtgIhJH1SJ6hG/BBY
         vQUxAer7EGz1IMklOIFtMExHnGJz5eXK51qBKbptwptwqrYCib0+YxDY+JJUwwkRX5Tp
         vJRJmu3AuojjsSw51wR5lrtCzNeeqjBnL8wMXkmhHNoyBty4ukoGOM19i7HmI91LCJHi
         sU0A==
X-Forwarded-Encrypted: i=1; AL+hErFQBmyxoy9tx6jGfu0pIROl3sYER3Vkq3uKoOOVDHKB28KxTCGzyaspGhbI67aoi9Sb3ElAklfIGzF8Eto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vnrBfhrG90zxyqoBBoT0B0MQPB5sDrgNOM2JmmW1JsR7+kKMU
	53MiSQ/kkS2Pc9IukMerL0o5f04M9RHhto0stQ6XKKLRrp9D2VTlTuuA8RVnr5aIXyNHgfL6vVi
	gT16wZ1z4aoHE35BdG8cGkCcPJjnaNFGCIxyoE4lMrLyG4LdOufE8RATDgkiCyB+OamE=
X-Gm-Gg: AYBFou2hAyKBoY7O8FtThXvJT8eQpuLoJqKdYq6a4+wBqLYZdYurjEphv/nNk+BhIfv
	9VPAUKMhkpcaK7Dxw1uwhfw6R/zpfmDfs/CK89YLOT2YTa3txQtHHDCbiPR3Vb6BC6WV65zIYGA
	8pherwvWCZy3XNBCz4NDxiN8HkSDLTosm8TD54ixdcZNC4SQgy8Tk3SCsN5j877YJoEa3Ne+q6u
	EntopJSDGphig/IA9uzQkvSqxUqRAQhdHKj1mjXeKuvulDy4mkEFCb/P2Kt5Sm8ROmz8KCGbaFs
	YDO7dWDzFoj/PaID31xCwUsat1Zo6mh3xU4zcPROl9bkMWlqp8eprhSHZusuyl2ZYyPAiDkeCV9
	mPpwNbKoAxKovnSNDgvuFgbIjB4nelyex8l/kHgpVSdwZJPX1Fu7kbtgNMgTepCu+t12sOlu3gw
	4=
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810226885a.46.1794641789470;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810225585a.46.1794641789084;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm75459845e9.4.2026.11.13.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:36:28 -0800 (PST)
Message-ID: <246d5116-06b4-48aa-9805-b265005dc8cd@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:36:26 +0100
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
Subject: Re: [PATCH] arm64: dts: st: Correct white-space style in
 stm32mp2xxx-dhcos
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
 <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfX0rDBomsQgr5z
 redoAA/ag/XZXk4vs67ZJRHNKo0Zu0rCiNw7HN3xrK1gynfaJ1oL4Wnnz8PHkrlwuUg5XSm5ir7
 1P0o+ks4oN5c2JF6dWjH8yw77/fkNXs=
X-Proofpoint-ORIG-GUID: G2uSI1dqNdJpBnIkfJTuznSlNzfQrchY
X-Proofpoint-GUID: G2uSI1dqNdJpBnIkfJTuznSlNzfQrchY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfX41/ePaw+5OCX
 P4Wxf5hUB6TOAMpLTf1Cg0Fpo3qnv8C55TXQmgTkU/1HCgjboUQKR7pVmqrdotzkNbkqpok7CCB
 OKCscsK+41KD+SwxzDSBpVRFbJsvTVSmLm73sAwzubX6TVxHrv3BycgbqHrQBK/FJN9xp6xGbvY
 Cu4E37cek8FXNi9d1kvMJo/0MqeTRO1pQKiiuc3xXJWXS0xgckASbQoqh4xwpwg61OzIeJI8lhJ
 A5tpjJOPGDv+hkPm7dQCh15xc1OFvDzoWpTTbosX6poy7w5FefJq0ZoBgeu18IjwtZEo1iamsXJ
 6a2nKRmrANOY/1uVWj4dsim3Cyu23s/EewmFQUyLnBYpvbiYSkAdPia14KY489TAxffmJPzja6m
 22ZJPySt4IPhMxi8ro5Ao4V9U7xGU956bDAd2EgNFWRwJQLSnika5tTCBpROuIHjIRcuKaKzwIc
 LspYPOdKdpta3S5BEfg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af80f7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p-LfKV-GAAAA:8 a=hS7FZtYCIGGB5UC-1UYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140030

On 14/11/2026 00:34, Marek Vasut wrote:
> On 11/13/26 7:54 PM, Krzysztof Kozlowski wrote:
>> Correct minor style issue around white-space - missing space.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Marek Vasut <marex@nabladev.com>
> 

Thanks

> I hope ST can pick up the various fixes for 7.4 .

White space should not be a fix...

Best regards,
Krzysztof

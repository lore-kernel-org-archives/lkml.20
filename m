Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703816;
	b=TyEbE9Hhezmi37oEKrnCxA7XWcpWQtMJOegYksreD43G6CQQnEwUjJ1e7RXGfVKF1bik
	 ReJYTJNxr+oDeQL8d0VoVObaQPeenrCO9ngVF9EAC5tz+qu9Tj8SKIWBT7QCXzMG7hB7f
	 SFZtr1uuo0aXYlk05u9PKCF6AdWR/SwJCHGUwTJSBL4bWxw73lT1Bh6OXAzElWOWoKKNy
	 aTEWnYwCioy493VH4XgxrJS0x03p81XZz/YGZOAuY2PCGhOSkPbM/1hVhHxSRhl0CrIdW
	 aQcyGuE0vLNFz8xxHdwzkt8wVxNDxQ75d/TqezmUa4tpdFdf/nJWxIGp9uVFjhaAAgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/n6gV8AtpPSEkhX1MtVWQEBb23l1sFXc5N1c+sSjlD8=;
	b=bl/kG/Xmhnf8/D6EMhuMiJlTF8qoXGDlMrerMgqiWf5uFfrD9VLIpxxdG1YxU0A83JIo
	 JOC88XXUi6/sTuha6yQGy/YgjXVq9Zl/uWD0xPk3IRKhhh4Xqc4IJuzHwiJrRx15VI8A6
	 OIRQ9Lm9Z7I7OfX/o18PtrRS7l77ziDogHF6gjzIN9qnr3SWZbJgc9AaMWWdAldcDNNa4
	 P4uzTFzDfMDD8BmK50JJio/6hWY10EqlF8/lZ+TZW0CtBpjst9aaaBDjjSbw/KM/DG8mo
	 cb7cKUK5nQkojyh1wjfhbKFS2i+Ppu+jiOB91GwfEzZ2H2xSj0CoAAp+klfXREfkLwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqZNru7p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="B771Dbn/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496A606B12F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4496A606B12F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqZNru7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B771Dbn/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AASaM1594056
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/n6gV8AtpPSEkhX1MtVWQEBb23l1sFXc5N1c+sSjlD8=; b=PqZNru7pEkfHhYmW
	2svlI2nhvGeicSKRH0dLXDFheB7TUm+R7ppefKaCWHiPbn0hSWDTcW+AX14E3rTY
	cUG1Px+6MqvIyhHtf6Zwnh7zAB/JR3TKnvlk7Hi4uxeqtYu3ruxBds4Poh5HIztt
	ZcbuxZcOFo+wbKaALYGzWEnU94DlWqDlE6Fij5Q9IDFniILZEA/mQTYwj280tKAt
	Vkl50wf93+axqGZ1Py2Kmmoz6je+4LpZRh3j9KxXBqADDbv1tAUarzrI/hOUP+uK
	adRi379DMiUt9wfrOVC7x+oxgu9XMBr89BNkPLi9PbVqy2/NLSlVx9W4OBp8BUuT
	aVyd+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081ucyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:03:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso5179702a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793703814; x=1794308614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n6gV8AtpPSEkhX1MtVWQEBb23l1sFXc5N1c+sSjlD8=;
        b=B771Dbn/F8hQOVRM/K3LdPz5lvd6FZk2Iyx3LcFMFRFazXJ9FH0W/oK+krzqQ8PyQK
         gwvenWdzj+aMLX3eQ9aMHZdOYtc5++P4AOA8qMWsy5T26WLspzQTM7fWJHrvwOeDniRQ
         A8zfMIBAofGZ2jHCiWM9E1vwXBB2uXWLATVltcYWn0Z+fIxTOzQbNFtVOKfKAtHjEK5v
         tz6ZehwTg0Uy/Hpi29D141JdDT6QlsYn7IGTQIcTQ+Db0MevQ7UlZfMAOK4wFKz/irdf
         dCklMbsLoyc6eWYQZL3Mg52WesBTl3tk89Zv0tNca6j0rb4knpM9SePw/svVdfhA08ZN
         Wauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703814; x=1794308614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n6gV8AtpPSEkhX1MtVWQEBb23l1sFXc5N1c+sSjlD8=;
        b=Wh0pyrU5fcqomyGhjdwpMIteL1dozztMuCY7K9EXokoT8j3g2woMCW4K/hzcvdfBL2
         mDRczu8zDQImk7KGDYWe0q4gBcQG6gf2Dw+9CSttOqpj6BdfcS83qjSbUK634PzHrZjE
         PXsi4ZQJS3jqTKOpnNh0+3Nwj+VwF8KQ0mGl4K4CJj2aOKaRKmuoZIVDOKg5FQtTVkZd
         EmBtbgUP4VPspRSr8TWTelK90Fae9laO5C20nZYYX5/7sO1mbKVjBNNS6s1/jDcKFiP2
         TeDX0A7sILI9eCJ+bKOieGv+eQlKAjJEN+7mMGNJQmQatrfLcDaroGwfNsPJqILzIOYy
         PJvw==
X-Forwarded-Encrypted: i=1; AKwUvBzHL49GOKzUgEi9LikLcoxw8+y5MCf6IQFAckfenzzbSmPsNwD25r6xcUu0xf4A3M+tOcR3YP/P9iT/Yxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tev6/Cm+9qorftL6UyJhKMhmsfaoyNL9Ju+Ee1YQkoW3huejs
	+LcB0HnrBxr2DXavxD0GNWhwk7KNmbrbn0YUVJFAw+eoySUDZbwxlwi65t+n1Plc76qs+C89nsK
	NmQsOS0SM1KI0Fao03RpVFK6UgZZaSy0Lg9CitRaWW/Gw85tp5WrttmU2NaejB19Opbo=
X-Gm-Gg: AYBFou3kahRgS54o3WkCfLQ9dfsOG+bfs9N8WZKCJwJoH7N3g2w48iE5WBkSXqe7wmY
	yuPZY60BC9gKaKk9xu4TNNf8Td6a8+J28VjyWVb0P+CEi5m1g3xtmS+ggoNzpY3wYLnGhend+QF
	vAyBx6jwRkKzjQSJR+wvUlw+CdAiQpvmwhZUN3OdUN9d4A93iGLy79Knz4GJYDni/kJAnhplnTb
	Cf5JVV9hQrAWW2wWXP9acayF/WbrCpGw6olHIUJ2nPi9/lXfoJlNIIiQXAjFi66/Wq7rn1qT181
	AOdrWj0i32F8sjiM5KULayHQ9JyRVV3G1CV2dLexr47wLt9Ij9LLSW/tMhcqH+y/742sPhhVG2r
	DUaRwJkyAXTHxCYfzr7RJjhR5x8uJbtgIetuhoLUCSkdghW9hXwn++gFLs4qFI59Ki1KiFF7Sc0
	7+iJFilba4e3vPgLz75mWLiQj7mxHg23eGCL0mdp/3AQ==
X-Received: by 2002:a17:90b:448c:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ae8980ed36mr10463305a91.36.1793703814264;
        Tue, 03 Nov 2026 03:03:34 -0800 (PST)
X-Received: by 2002:a17:90b:448c:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ae8980ed36mr10463289a91.36.1793703813766;
        Tue, 03 Nov 2026 03:03:33 -0800 (PST)
Received: from [10.133.33.72] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm1781409a91.13.2026.11.03.03.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:03:33 -0800 (PST)
Message-ID: <78af4d6d-7465-4980-9d8b-e832db76a08e@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 19:03:29 +0800
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
Subject: Re: [PATCH] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is
 disabled
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, thnkslprpt@gmail.com
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
        zhongqiu.han@oss.qualcomm.com
References: <20261103061557.1235129-1-thnkslprpt@gmail.com>
 <20261103071729.1556217-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261103071729.1556217-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX2r6hp9dfAEfy
 jXDqVCWBnVRJ4fXpNm/sO5mSyKUXYVMLyTgs7Y6B/lK/F5eeRuGkUTejoiShTipVYxhk71n6C2Q
 jlOj3wfeaHqKKhhQ1+RoeUwims7etLQ=
X-Proofpoint-ORIG-GUID: 6RRJUMGXnGre3ZXplyrw7nKUT8SoLVL9
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9bf86 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=N_xNfM-kO2YFn_PJ3jEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6RRJUMGXnGre3ZXplyrw7nKUT8SoLVL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX+JkKaKCN3E5O
 w0JzSGFLEOW863WJkImaN6XfwSAoQgwOYGlDH7ScN1jJIwAwBmag0ZgZ33Z+6d/i42KupVrUP/W
 nVD/Jy590aKlr3NpOn63CebbaPsh1MyDVF8G0JORDpw2st+EcgG9mHvqI4q86/mCAjr3OuSjOHW
 kscyDtqyFmEXFirMUkIeR7Wfa5iZdIRyKjVT6R4TO6/0/R6q22rCdu9aQt6LNH3msgf41x1/D9h
 MNRGoXizNjhRx/H6bTunlCINWjBa2UOJPxaTt/HSbKvOezXlswsSTD8XQhIQ4YspiYDz7KaDwZj
 1fENbQztzLvvcOR265hFs6c/dgEHV3Kl0umgRYs1b88YpjVk5GUJynI3HRJKhB5g8FAZWSzNpiA
 BgX8I/B7Hv3kdxLqGYkm7HJSTJ0/vuHWz2vOdSU7J4ep+hs8nvfkBh6jO0B3rHbZ6IsNdR02z7B
 XcYlgsbR+ytTPw1CAyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030043

On 11/3/2026 3:17 PM, Zhan Xusheng wrote:
> Hi Avi,
> 
> On Tue, Nov 03, 2026 at 08:15:57AM +0200, Avi Weiss wrote:
>> +	if (!tick_nohz_enabled)
>> +		return false;
> 
> idle_calls also never moves when nohz is enabled but was never
> activated, because tick_check_oneshot_change() found no oneshot clock
> event device or no clocksource valid for high resolution. TS_FLAG_NOHZ
> then stays clear, as with nohz=off. tick_nohz_is_active() covers both:
> 
> 	if (!tick_nohz_is_active())
> 		return false;

Agree with Xusheng, tick_nohz_is_active() is one more reasonable check,
it also covers NOHZ never getting activated. Besides please Cc: stable,
and Cc the scheduler maintainers (scripts/get_maintainer.pl).

Note that this still leaves the nohz_full timekeeping CPU and idle=poll,
where NOHZ is active but idle_calls never moves either. That's a deeper
issue with using a tick-stop counter as an "idle recently" signal and
it may be addressed separately.

> 
> Thanks,
> Zhan Xusheng
> 


-- 
Thx and BRs,
Zhongqiu Han

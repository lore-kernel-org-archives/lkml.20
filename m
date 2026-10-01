Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C003B8BBF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848561; cv=none; b=L2xJCB7gfZtHWYLpdnetDgiCza8mKIQw++2LrmgkIX1HM6MgIpqbRd6sJVs168rr6o7yB/B3F4t6HahzG7MoH5CNg6knrfQ4URZBCRl8MGpLw3HT8VJrb9xBvyXlalVlJWZRn5U2YUONNJAVJt4BnTGD3thTG/lTFSpT1aYkZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848561; c=relaxed/simple;
	bh=wdCmTU8p62hPrCu7nvMz3ehGADNp+2kO8cXkIPggcsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASl8EAzoc7k9Tlzf3I0+kP5WvpxWYfNGYzehALEB/ostKSQYTMMAstHBvgpYnehDpAlXU2cbMB+xckcf709Ls0gI5GBzkojlrAIQOd4496oevof16I35s86kXPWjY9Qx7p7UIb7Lea9movlO3KRBlanxY6JgKOP1nzG7AQ1qbx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNDOguyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNz1s9gT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNDOguyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNz1s9gT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnlL396304
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OmdWzDgQaJhw28/RsHEB8YAe
	ng3ivItati6H6co2/Pk=; b=RNDOguyEAiXYC0PxI/DoQfl0KQvRqFpSBIKN80Jd
	kwdlj6p3VhX1JHLBtw82NWqKvTzlVSk6EXtTAShw1Yy+CMB2Ufq1ccYLIJJyCGju
	ryonpVEPCeSKlKvrFEbcEJTf2/JrLSwfKNH43ZvyZIHjhhVuejMKtgJGi2FHnqU2
	DRQMBXVYVKt0pB6fR4BKpu/F7F77v/lyWK9zMRPw7598L/0KFKJI5gr+1t3ZdMBl
	1J5h+UKIQfRO36Whe1vx3imJmH7TgjAvEeiusx2+zf32xTrs4kFFI8bUtI9mO/T0
	8SuN2ishHHm82MrDgz/MAiVbtMgmT9hXDq2mfOCprWJjxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a7rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:55:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso96419685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790848558; x=1791453358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OmdWzDgQaJhw28/RsHEB8YAeng3ivItati6H6co2/Pk=;
        b=DNz1s9gT7HnOtFlXXazGa/0jjnApzscB8zaPbKLEyWkOJHZsCliDhV/1GB6co49R1X
         1cFu6gGnl5mfBcQWjxpE5rsG0tPQW0xhr0YzKuiu4L9FLrDivbBbP0wXtn8Ng+fa57vQ
         is1dRloCf2wuUErW5zxY74edjqg05UlTIzsECvn+dwf1mO9PwjAZzQ9yhKtbWnWXUrdO
         njXOSERES9AYa2F4Z49P80uRqCUdm7Ovl7TwfBuaHGUwIc/PotJddwwWKkCWK1Qj2Q6i
         e2HErcqCiWhtnt4w6J/KansrRRu4puPi2Cjb3B3tUDihf1PYSWosCUHZy588X/S6eiNp
         G1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848558; x=1791453358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmdWzDgQaJhw28/RsHEB8YAeng3ivItati6H6co2/Pk=;
        b=Bz5jmR8toIGH+h0rSSSkcLRDhUQ066AWfFKCKdsKRdk8vTWwKL0qjvHAE49jYz+jcI
         xX2EhrlHQR30uRcPYyzbraiN8VhSZeWajSYXFiD8Tn/QLZjnXs+snfdwvhSq/395142w
         bPrxwSTQaEAA7ZXSXUIw9dRBR28pAGJa2jylrzfcxc5AmnPsn6QWBvyM8aLhGeQqhQKb
         pxj+/bf9Muv3l8c8EzwqwvOcMAWNcoDFWvfBpwit5rTAHvoYQsKbW01MZRVvgxY5Aac/
         VFnwHH2uIMgU6BRWCmdxF1G4ug4JiylhuhLqsAcyMGw1z/sbyH0TbEViwDuufUBzRl+D
         e+uw==
X-Forwarded-Encrypted: i=1; AKwUvByjCeouCYWEOGp8taUys2qCJmOeUZCoXjpHlsQfDEF5P8UYuDhjJOhXs/EnYYkOr06K896F+ER/RXrYkJY=@vger.kernel.org
X-Gm-Message-State: AFuF++npcM7xqjQq5GidD+ZclhsAxwoiqOqiI+MnYRK5S2Yjemu/tvqo
	25330T20SfkrAM1sdIV23rkYMADrZKJjzdKMTUeS8n2Q/Ty7KrnYQYGZXPuqOfE+TrmFSbe1XgM
	wmOurLPCY0tlzKCc5sTYauAjfqJZ84eHQtoA0uEVIVsyBQAv+qFIdQ2tCc5AvY7QN8F9wqorAzm
	4=
X-Gm-Gg: AYBFou2kSWB5snm9RE5nTvDdj0ijJrswuor9vw33FBqMr0v8tvzd6DFbURc5oNONTEq
	+xHy3lY6vQwYceUiRpIOiVMLOK+NBay02qPv0AGySjxOM4r9qyb6IhlsAEDz/US/brAkDZ5vAPw
	1885i8vWO1jIzelUsk5O6j5ySYwVEP11pJk8Xwwf8jcvYZYmmeKVtnLwzPxBJlxmEu1PNQYveI5
	7SZqqwY84KVtVi1YuYhDncphPQa1t6VVXas+HPZptSLJJWE1JSX/wKFlA1zEMLsxT9+VhguivG/
	eE3AN522ct7sfww9lxrfFKDry5HnvZwCDhRdUETtOARy0KONt2vsEdONM54+Tyu6GJtynWvKwJT
	hWrT0SmXh1gsUs2KUXiOppKvP3hAFa5BJ7DH7cdYQfo5uaSQiSxjFl+9tRxVTjkCSuzBDG9LMbO
	CBFkV5KpSM+bNu
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr495779485a.49.1790848557927;
        Thu, 01 Oct 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr495776285a.49.1790848557435;
        Thu, 01 Oct 2026 02:55:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm603556e87.62.2026.10.01.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:55:56 -0700 (PDT)
Date: Thu, 1 Oct 2026 12:55:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
Message-ID: <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997cefa0-384c-466f-b318-077939946768@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfX0u0j5qPT+W6J
 PsJdeN0csiMvNr0RmJmZg/btc4LS6DAaFOzk8Z5QBgq4P8Bq5BVVhbXJcmNcFg52Go17ZM6JiQF
 wAMPfj+k42tZ0AyWNpzqJpmJ++K4u/16A2PZx0lLU/ywqFCD3eIdluWEj8Ohy/lptkbG/2OP8SR
 lNgxYxAE4YizF8V7wRAyozraham3k0BpF+eXn+A/iJ8myd8YK8v50XapKu0uyxA3sIeI/0tHLzf
 b3/beZgNGCs3Gvdwo6eLwgHU5nu5yNmkBZ399YPtHlGqPZK80ARWh/zCvQ0LPoQ3YWJIMG84zXi
 3Yo4a1rXg2c9jwHULNAqxF6M/eL57MdXVCHuoGcPNJgX7GmJKD+xtIf3d1H/hZBnQmmv9qKACss
 8UW6EgLLgREEx6ErZCo+UUgsDLYW/t+Ilx7Qdz9EmPlkQAJLANCdqdJLMrhC1Q8LGHeOxQM9S7Q
 /IOSYNygO0nOFdEqfLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfXyZHeeKFCpWgL
 lcC1NMtr3jeGu1Xo8n+DrRLtk8+ZcWop4r4rLRtyCB2zSdqGGje0OObzTRK1SjdJVpZJlEIX0lB
 Yi9AQ/7JZZe5MG8FXeJkkvBNGiXDJS0=
X-Proofpoint-ORIG-GUID: _2VmWea-eXzKJUo-BLlcLPbQwTXm60Ol
X-Proofpoint-GUID: _2VmWea-eXzKJUo-BLlcLPbQwTXm60Ol
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe2e2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=rj3IgQrshAo4T4ftDsUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010039

On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
> >> Some boards drive the ILI7807S panel's backlight from an external
> >> WLED driver whose enable input is wired to a GPIO, typically modeled
> >> as a fixed regulator (e.g. vreg_wled).
> > 
> > You describe something else. What's fixed regulator should not matter
> > here. Which pin is it in ILI7807S?
> > 
> > It seems you just want to represent GPIO with a regulator. This is just
> > confusing and typical downstream workaround.
> 
> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
> just sneak the same stuff 3 months after like the review never happened.
> 
> NAK

After discussing this offline with Krzysztof. It's not a supply (my
fault), it's an LCD driver. So, the best way to handle your displaycard
seems to add a gpio-backlight, reference it from the panel and then in
the driver check for the backlight's max_brightness level. If it's 1,
then you have to send extra DCS commands to control PWM. If it's
higher, use normal backlight class controls.

-- 
With best wishes
Dmitry

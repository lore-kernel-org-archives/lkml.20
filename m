Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826219;
	b=xOoVoEFQpBoJ3T2sm2SbPXar+g0hSVeiYoTkstRfFTEPIR+oeC5YZIAjp5R9SKwZRLkQ
	 NRuHpCXXyPk5KaeIq3q4Rr+qHa6UefHaUZnz992q6du1ziXsqXY5N81NdViFDVZ8FB1hT
	 N/vTIvNQDMiL5s8HDG3cCYhiSdFROCrIH7EMEBHgT3Ek/S1LQJbniPbtNPwc0Ja8mVl2x
	 9kU6t2B/gd8GsQ52bZN5FXxY755EzXbLC8sr/UNH4XdubdF6Wln7wmG+SwNsIStMEqSl5
	 otbE2aONhGi24dUEPnZo85nT8XQK6aUwDSuGMBygHDTuz7wMcDrmnMj5o5SAAAs6OCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
	b=eMcRIjr2Ja4qhl/lwt9l1WKJTSZfCqxSNklHf6dQGojr9ay/xdVwpWk3C/lRAdUD+/mY
	 wKYFH0sUsySNxjqYlTqYE76S8yMsu1F6tWSK3+DGnv52/iuKFy7Jb1nrgWUfeL/H1lgSV
	 V6g3RIAq1Gg/aomBcAF3LYdeRjVb38MiYoCArFDYYETQGm0Gd9sHhz69ZMVL7eQVXcbkE
	 dlQ8U/t25Ufu8iNxwBFd5IOA8hSNc2Tvu9kQs9LFNW3Q5jPBSfGif+IGW37ajDLd0ytFM
	 Jdt6/anT/R3vFijP1ii403H/zSEEvRd9vMKRCxL03rQ1Bz22p7/TZtsndeOnPM2J45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5LVk2uz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgTEt8Md;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA0606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FA0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5LVk2uz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgTEt8Md
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enVF1109781
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=; b=N5LVk2uzs5TMt0XL
	BEyIvhlxFrNUTQ95NY6y3XydGGzyP77uqmLpMPFhU9iCPRoIkhK4mtrPC8Mc3B0r
	woelA56tGDdtO76IC0kWnen0mBM2m/Igc5sels4JK/vIrhKYkV1dUi5pPVM4o2K/
	FUEvs8Yh/m2To38j5uW0row62ShESxRvGhO+6ju9xKVV5vBa/JePgKoS4nsPU0MX
	1dX9aaFyb0xPwuFdfwJQ67re9PC9YxQXPKWPQsw9YwHeb4od4Ip55z6oyvI7tMDz
	SDcnIyr/zXbNm/93rB+TFcKeBZdgbeMfcX10Ca8TmH2IJ8uvPjdmStRPcPmg/vYq
	5jYlTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1s90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:50:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso2997177a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794826218; x=1795431018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
        b=LgTEt8Md1Gp1CGJYeR6IvA7tqzw3TBmObWRAqdh8kmG9qxEzCdQE6rknfrC62PSpUN
         IJD8tTGiRX/PgQiQ0+0YR+T3jszON+G/dd1eu3gkkvqWYOjmNV1DBP/hpwrerI7ytpVR
         pOC1sDPP2j8lD9R/diZ95F5oq4LykS338Zjbfp6/saW+5k/MJRHMoGLz2N+3I6MaB3/i
         QXryHQ5nrBQzQ1Limcx+V6tURCZT0eEcUgXVzzJJ4CUu00HlBDVmqBX4jRWBoCGwlAh/
         QRQFZK7ldoqcz24PP7e5057vQbfVaa6Yp9DMsEINK418KG316WBiA9qi63NYuMmnxrKD
         W6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826218; x=1795431018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
        b=vXYrJb+r2fE2u7TqGO0Lxfpwc3byniw2/YcPEdWh1x52kSWImDJcosDSIB40kunI87
         VODms0gDAIfZXhkLGqBEF12XQmVFKkAysrLZ6ePLvqRhjvDepkB3og7G0bD+EE/Rf5Du
         gMj79KAXcOsZm8BWolut4XG8nW/6euL8EIaj0cQqd28yG6coFQzlgjPQQgE9moPWtoMY
         9mo/cToBOQViDX3pfuw/UAzyo4qYWAIFCvdmGvMoIo4APsON40oOBasY698SbbQWUIEN
         rqstiSGHiunUkI1PZK6f/7gsYlTIa2X1CXNEVafBewJF/d6cSScfWgwue9WBG2u9QFTd
         MLog==
X-Forwarded-Encrypted: i=1; AL+hErECQ4HVqwg8sVl3iZtgK6ucSYQD2VIifIWRczi/W2x+quzyMfvJ6T14XSo7v+wToJH+bYCaFXtRDax4mQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lv+xohEAF1yuCWq2E7aToRdfgEjFhcEzZfoNbxn4UFtn5In0Y
	sb91rEfVUaZk9CO5HMSZrYZceNWlMQWIFDdmqFLDvkywalW1k350B1Qzvcdz9FWvXu9Kx5lZZXO
	xUORUTZRNJy/ozYCc689XCcP8xxlsuWXh/EqUphc5rOzf8Y08mFE6sgUjZAO7qxdoXmWvSUWsGQ
	==
X-Gm-Gg: AZFdTZfwJ55XTpWOZ4U4DnId2vmrI4OaANGcIOatwUhTVlwysD/HZtdhpOSuCr2ZV2R
	fP9wN1GW2F1aMSqi1U2RpezrRiUeZDlRbS1+tYLxq4RydaN0+LfGjxuXQn+VZihsNxv7+8RHEQs
	n4Ul/nUc/wmCS2M5wvteXKDTliOqdayBTb8H4x7qFhG27LSYLGGDZavpS+HE/jimyAZaPEKem47
	DSRYJ/hrQW45VdfEIbPCxgj1jfo0lU2pteHioSUioX7QeADBSaN2NEGfE/gy09STmUAvxr/DApm
	EtioCoKzan+Q7mB94yoGw5Nizwec/p+BIgySpzgV1l/SXSxxzzD5mTbreU8YO5OK9G7oOAE3XtI
	YPb00L4jJTmHhfDaHYCZst6czxqMNdnnOESxO2GXiBcakrSXaCKYQC681FsWrH36HCQKZtGaNuD
	Wraq0+9ztGL7wlbIkVkMSgLlBCEn3hSD904bYtI3+5feykJsBb6DNgsr4Sw8DzQfhU
X-Received: by 2002:a17:90b:4b0a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b1b09fa36bmr9142280a91.19.1794826218081;
        Mon, 16 Nov 2026 02:50:18 -0800 (PST)
X-Received: by 2002:a17:90b:4b0a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b1b09fa36bmr9142268a91.19.1794826217536;
        Mon, 16 Nov 2026 02:50:17 -0800 (PST)
Received: from [10.50.36.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17853sm16351460a91.5.2026.11.16.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:50:17 -0800 (PST)
Message-ID: <099e07e4-7861-41e5-a688-a43f1f57918f@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:20:14 +0530
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
Subject: Re: [PATCH wireless-next v4 16/21] wifi: mac80211: send BlockAck
 policy in AMPDU action
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-16-62e39487f51a@oss.qualcomm.com>
 <dacf9b17cee00430301403e64d8353348a747d46.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <dacf9b17cee00430301403e64d8353348a747d46.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX0KG7l4ns3QRg
 yNWLgS8Q5hSULy+3dwRUIYEdyfUTYPK2eNidJAkDzVxMgf/AAxqcZx90oBMiTK2N+DNce4h0l1x
 eb3Uwc3HVb/wYVsiWzDyfpq//+XTYGU=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afadfea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nEXYo2GfNLYU3GksVNYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nucwGj2l89WvwM_gTecd8uQWv7UknbKn
X-Proofpoint-GUID: nucwGj2l89WvwM_gTecd8uQWv7UknbKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX5r+3ObuolPvr
 1fqtHHt/mXjny8SQ0HelxGGMEN8MCFea1GQrGA8wcaF+k0Xr5yqI4aIipnnwrFJHdycpPynWB2e
 mzyMCZPLB7hqYDcDorLQoJD1aUyh9vbG0GH6cdneyOsJkWP72Xbm2KGT4LXXb7sv5ttAArlMxH/
 uk7GIfZkZiIqS0589SkTG+YyJk7Rrfk00YNTSWrSvJbtRn0vObOYcXCmwO+Uo3+IswLztWDkZzh
 woDiQH+uRde46vLQeiL6FnQs20gqJ4d6w27jAWvYm47f8oF+6lqtho4LyR95udoUoaPW9TmsRye
 5rUKs4AhcGpdhM6QjKfR0bP71ojKryroWgcxNmK4LY141vrQ/ka7G6+vIXlBNNbmnjavb+YLloH
 D69IU+01FatH6+PVRKRW6OE6o9yyZlHBQtNb41evJp5g0M24JVXFvgkiJiM4brQyJzWduASaG6y
 7/KtCOXwcjm8xqZK76A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160042



On 11/11/2026 02:13 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> While sending AMPDU action hints to drivers, mac80211 does not include
>> the BlockAck policy extracted from ADDBA frames. Drivers may require the
>> complete set of BlockAck negotiation parameters for certain use cases,
>> such as SMD BSS Transition, where the complete BlockAck context needs to
>> be transported as part of the transition.
>>
>> Include the BlockAck policy as well in AMPDU action so that drivers have
>> the required information about the negotiation. Since the policy is
>> extracted from the received ADDBA Request, it is valid only for
>> IEEE80211_AMPDU_RX_START.
> 
> This seems a bit strange. Doesn't not knowing basically mean we don't
> really even support one of them (delayed BA)? We also don't (cannot)
> advertised delayed BA support.
> 
> Pushing a bit to the driver from mac80211 just to have the driver push
> it back to mac80211 also seems odd?
> 

True, since delayed BA is not supported, I will drop this patch from the series.

> johannes


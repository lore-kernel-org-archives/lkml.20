Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593730;
	b=dWSPE8bJnAwXXaWTpBojntQnUtFYX0U6a0jaUHfpLbTNz/gWv+ULOQptYWjl5ww9PKa7
	 Y94r8sEwG35nstmh7ZIulSMCtvbcsuBt0BlVyRWkyRvkPjSdhJqr2i+LKg/JdIeEEwhEb
	 MovsT4UoMYJjcd2t+8Z2IFwJMFf9RbvmsdxNjnJmfa74IYCFIu20LuVaVMJfbFH1BC5Oq
	 U6zJXt9dWw4RB8unUo0M8v+Akb6e3pWC5R1P8kk1e8hj2nIDrmJCbELUm/tdbgL57Zxdu
	 mESgl3SPhGviOQhGMXGwyQNs6BXmbRARu9LpS+3XhHfGv9D0fDZI+cOk+fQjIi0iM4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
	b=Sp6/Hd5Ro2zI+uc5EFQ3EQP04p4icdCNpZ07akmuHqCNRc9Nliikj4cG+D5zXvr8wILj
	 skSR35k6NtOqKqYYEBTUo0bSyKP1TFWpIWf3fkzpCuYguakGzCC4z1L4h2DpeJRt6JdiN
	 +XnQYD3RjhjUPgK8LLGolD+bJwWO6zNSlDOPjio7yqDt5G32AJZOJm9aNOcmOozjb6HtG
	 8S7kW2cm17TgDZMugLAj9VYxFh0o/4SkBFJpBDHWPz9/uH0Qcqk1nIzvH+yTVbDXcUG4j
	 zOGCrQPggVzZjbPvSiHWwWqh4xTEGjXvSUlv7YcI4xgWu2PfRaAZ67vAaHEEzjLmEZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ErgGz/qh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdL5H9V9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43890606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43890606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErgGz/qh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdL5H9V9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6NV1189968
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=; b=ErgGz/qh6LWMMUjL
	NwAWwp01bEJQK2CA4E9oSD0NTpTIZNl1UJqU4QvreJ/wLyM/DEeHANgf87XCz5g9
	3y0neXasGEcmFFVxTQlO/cZikASQgeOGJzPBWBPfMAqrLQacXZ7E5nZYdQ/lvZdK
	4iXjao13lqqfP2KPQ/TCWLu1PIs9BvhKZSPnCXGXZm4J1WjHQbjxcsgR/5jyXEXf
	cM/Adp0Fl0JeGs1oAqqi887bDSQoWJfveJH2FqJpJiRgD7HGV7t8qHDOJFohuqOH
	Obc+wGTLyGYgfMbKcpeRzx4qG0JMmBaT179lhzY4nzndE89gHTr9t2Vn/jGnWvrA
	v0ps2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkk3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso1059512a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794593729; x=1795198529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
        b=GdL5H9V95aCWYGqaD6/i1MzKmCZKyfhJHPAVARlfKmnsr3NzlTh/jr53DtbsO7FM9z
         Vmg9aJcSZ+cXv30PmKU+dG6+IzCaFxYNHajZaQBY1y7nLds1MZV9WPo4ZSJBXVic9TYX
         9xv897A3iSZj/V4Yz4nKqZmLfkjN9TBCQ40UkYY72UK3B/IpljdonplLdJCQ8OP+lW9m
         JqoKnb/86g925s6r0fJWErkU3v79jHn18mT6AMrkOcKRz04DzP2wjlYziRH8jGbeXgjP
         Lx/WWGpCZWkHSGte/VdywUvWzLcq7ElQL+MzffmgsvNoMw31Z8zgQCy/EfvqwPUOPL25
         rxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593729; x=1795198529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
        b=1CrlY5Kr5rRXgT8yinkLm9VjKamYE4JGKXPbzzU77PWCfpUqSjkmhsZ+RB3bXm32OC
         6/45pE/qYe/wcUS56Xt71eUxzc0EAsOTlVzAcl0XHGH+TNbie5ZAiH+YbVwIVEMWKRoA
         64UWF8RNPvQHW2D5QKbfZgP5gmo8rdmcyztff8bpjV9bBLjFjXOVb83xKJg25NFp1OVB
         3VhlfER0vfI/7Ccph2OANdVEplqsakuXXnPYRv7PiKhss1t8/PQcpQFF5JXaAGSq6hds
         4WbubrbgGKm1N2PRJVXhgFtW3+PQ4jsIXZBXVnqoEgY1OA1QTmRXYgIPMgq1abhk/Mr7
         nbwQ==
X-Forwarded-Encrypted: i=1; AL+hErH3CgjuUHFfaCG4Ukno/UZP3nzHVx7m8amoNya1sy0KZyUg8Evco5/HbZMBEqcNbKHP4IHF7+HcSLNYqGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ryhh8HlmZZ6QcoDcDUXrjSOs1E6Cwq0KFYWocvd6RHvO/JTNE
	NfivvaA0FwgMW4YNakfmwuPZtmspUBs2qjysYrPU+4OmqTOi6uiznNdARuzCF6ITPfOQLsDsyyy
	c5mEt4qdnuvIS1IhqYDUEyqda1JAJHLpP8mWks0GyG/MMRmiiI+Lv6VU+ATjTLlj8MWFAN8tJNw
	==
X-Gm-Gg: AYBFou2wFgng+L6xWJEFkS2Lx9weOTJJos/N4aHwSxMUqv3QCjhkoNJdKsVoMOR5rrB
	M01nqhAGV/MSySsWRKzv6JI8U7L3Sd8KdKCZTp0xPnZaNGvEOH3/kr+Q6e3WK2AKk//LjZOusTa
	agXbM8A4YflG5ZkyjUFfZfJiOQi4XHMNkyX1xjTbj+aq3sYZeRrkbD9lREuUfYj+NcVeInSSEUr
	PY1ProNtOU4I8ETVuNQ/pwGDBzo8oK+9GbEm1tRp1Atm2AVtk/rAvsrA6bCmQUAG9lRNZmBG4hu
	rSLBfFK8eRV3jAs1ykIDyHz3h8691vVgxQIs+QxpM232r0xj0pYjAaWa4k2rwNIz2VT+RGoGmgY
	B/f05x+0pRiV91kMB41NJbyLgkHmuhJ7VCwrd+RVeXfL+0H2vVAM+7YViHTQpwJpBksFXpV57Fv
	/IsXCaS/5g14rGfT04jnbAf6xpzqjWRHitN4HcJA/3K/qCIVKGpeYSWFcpEYYBl0guxg==
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr2819840a91.42.1794593727293;
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr2819816a91.42.1794593726740;
        Fri, 13 Nov 2026 10:15:26 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm5287617a91.17.2026.11.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:15:26 -0800 (PST)
Message-ID: <b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:45:22 +0530
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
Subject: Re: [PATCH wireless-next v4 04/21] wifi: cfg80211: define layouts for
 SMD BSS Transition context
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
 <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yKJn_Ke-ic4f8Ds8CZK2kQCwfetFj3R1
X-Proofpoint-ORIG-GUID: yKJn_Ke-ic4f8Ds8CZK2kQCwfetFj3R1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX2cJ3ql8cGUCR
 zHRGdMNYNrmidsswCUTXaOlsBh8epyTQE1rPleesPZYgYnp5eimfLkt01EYR8BepQzreVC74PFP
 80VYK96UQUL67aknLeEPuU0HfY4qIYadMNU2DZBWEI38TP2GEHqLywtjsVnak6MlXLtg9SFqSWF
 4A/WcPFZ+Tcxpfr9M6CQnkdiiNIVxkW0eaW5TSBq8fEo0Fule+d8qQsM85QQDYA2k+j323HI1ZE
 xdrAdzaBtIceo4sttH85dVWzLb4tjtMwiTpyqkwOYPBy6Ar7sh4+2onqb5r7ksvqGEzwySmiLS8
 zDIflhRvPeDrrFZKTbYYZOYHTZ5+MvhYCJ077WbcaIU1hRjNv4Vuyqe5wr8gkZ1KXy+O+metH1M
 E8TmsbizKICrA1cFBKHdeC9oz+m7r0OKgzatGawh3q/LVUM6E4oBeCYsCRddKJMomnxSEB+d/SZ
 wXAZx0oxivPxaXnRioQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af753c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OXx-bYV50MqqfosbHk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX7ZOb1le4UpWD
 Qp2Liv87g2FQSdYqrV+4cm8KxxZL03tigkexDJrPo1m7lhtCNACk/vhgobCUbteXOOOl9ssLENP
 0Bnp83rMproXxxuZ2LUifYdblg4O5+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130072



On 11/11/2026 12:09 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> IEEE P802.11bn/D2.0
>>
> 
> It probably didn't change here, but there's D2.1 :)
> 

From the looks of it, D2.1 doesn't seem to modify the context layout but Dual
BA :)

>> +#define IEEE80211_SMD_CTX_MAX_PN_LEN 16
> 
> Huh?
> 

There is no cfg80211-equivalent for IEEE80211_MAX_PN_LEN as defined in mac80211.

>> +/**
>> + * struct ieee80211_smd_ctx_ba - BlockAck parameters for DL and UL
>> + *
>> + * @amsdu_supported: Peer's capability to support A-MSDU within A-MPDU.
>> + * @ba_policy: BlockAck policy (0 = delayed BlockAck, 1 = immediate BlockAck)
>> + * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max 1023)
> 
> It's probably literally in this spec this way, but I see absolutely no
> reason to split it up like that (with ext_buffer_size) in what's
> effectively an internal API?!
> 

Buffer size was sent this way so that hostapd can directly use that to report
the DL BA Info and UL BA Info in the ST Preparation Response frame (Figure
9-aa53 — Extended BA Parameters Info field format).

I can combine these into one single @buffer_size and let hostapd split it for
preparing the OTA frame (as it is only needed there) but would still need to
send ext_no_frag and extfrag_level as part of the context. Would it be okay?

>> +/**
>> + * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
>> + *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
>> + *
>> + * @dl_sn_valid: if downlink (DL) SN Transfer is requested or not
>> + * @ul_sn_valid: if uplink (UL) SN Transfer is requested or not
> 
> Hmm. It might make more sense to invert that like in the frames?
> 

Sure, will reorder this as UL, DL.

>> + * @pn_valid: if PN is transferred or not
> 
> This being false is not a thing (any more)?
> 

PN is still defined to be transferred in the Prep context (at least as per
D2.0 37.16.9). Even if drivers choose to send this in the Exec context, it may
not be present in both Prep and Exec contexts? Should we make it so that PN is
transferred in both?

>> + * @ba_params_valid: if BlockAck parameters are transferred or not
>> + * @mgmt_tid_valid: if management information is transferred or not.
>> + *	@{d,u}l.mgmt_sn and @ul.mgmt_pn are still bounded by @{d,u}l_sn_valid
>> + *	and @pn_valid fields.
>> + * @pn_len: Length of PN in bytes; varies by cipher type
>> + *	(e.g. CCMP (6), GCMP-256 (16))
> 
> ??
> 

Especially while filling in the data in nl80211 to report to userspace or when
we parse the SET_SMD_CTX from userspace, this eliminates the dependency on
key_conf to derive the length from the cipher type. But is the preference here
exactly that?

> johannes


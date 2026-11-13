Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597737;
	b=CQ/3I5m0DD3mbrC8Vh0OYOAEBUbmyf9rmtV0pnfcoLu6VYkS/cvI4QpwelGTElaZFrOt
	 h+OrURJ7f17660Opc/tva5EuAPIxKKBKq0c+u2ozxSOsMDwviqFlFPMCpXO/h0UqAxS6T
	 5mXtaH1bp5Rqbq63q+Ddoyh2pWnYYnVKBPkgkg5HJ4C4dkXrtIY3ZcQ2BCg0PTsG407QS
	 4EdChfSNQ1HJywXAK5od3Y1p8gtw2xGKsUm1sxgLzWfstSYAmdRyRrKqPYGl5S+chR8YV
	 YU8jPBzfUKv6ZO9iHz3vwnXucXZWb8jLNhjm7FZdJ6QL1xEGzzqB6xThp3bs52Zu8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
	b=rUR3GRjP0Pbu7A8VciasvkPuT6tLoa2ONUjNdvfcujo+dH3JKGkc8TQWYvN/7wOHJta/
	 R1ZlbXSv4G4ZtSJu7DzM8vZVIjixjY9pbYy6/w6O1k7FwRHigWzyLVaN7sCZZKmSk2+Jg
	 sO8aX85Ibop5KBYd+7ieoybLtkk8a/ZpjHb3dJUPWaIJ0pUtC5LPuxdvwuhmYtaVZcdX0
	 TumalVnFDb97V35dOXxrqXWaLgh7ToNhYhPelGt3bvNnAPx962npeiWQOB4WBcG/0Q6Ex
	 sxnlOmJ0dMBaQ5iZLO24B0D5wyxnH3cPGdfR8QwH7n2aj6//REVfiwHcaFg8rfezt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBjRe5SY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKwRLjSc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643EC606A8AD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643EC606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBjRe5SY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKwRLjSc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ08I81745368
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=; b=FBjRe5SYyxOD4N/U
	P7eUDhFICQeWwjaPmB1pvkrxUWnFTSRatKYBSGLtgvYSm7vPdlX3ceLtX/SrQH4K
	uC5pd3j8LZrHFEUF8OkU3+oWcDW0HO97WSV0c0A5wv2t6TH59st3vWKr6lIz7ctt
	HDfrluAr8IFHp1ukF+/vuXQDbDQ0Z5vtdWLOdzZ7uFfRKQfuICxuwnsFHQtbrDCo
	zV7wNZgQ8vWYgL85NJ+lJ2/6wnZAdprwMbaOupuo8yIcRNbxs8pxSFh/QYxzS7y0
	P5ZgUuwv5CFnOhmlNKI8Y1fmKHegDDnF8RkSpm/iRqwIHP07gFXOdeVtFEucK9rU
	kz1j1g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkur1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:22:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1551320eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597736; x=1795202536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
        b=fKwRLjSc+iE0qqUnqvcfRTY+W9v7ZT2Kkyqx22djsqPt/2eXyRbgvf1xYx31xCmMQ9
         6O43BuqtOQLsL00wrbX92Yd/+t6vwT59cX0IJsR/SYnJaKbetQYFW6gjwiq81CGY0ta9
         XLnnMEyPZx/JtN51v4jaOnGP19LtPQ+EYrwzQA/oTVF+fR4hmHquYbPrln6VJClUpm+6
         RYsY5ncjpZPemCfPcjCDRCwdWampc4lrSCHOGB9dj6iOOrBqWmJeyNlpX4fQF/9+Qy/r
         u/XKH231KxEeQ6jx3Nhs9FVBGNx5nHaZSlga5z9j6xQS5fCZkgvHuWAoyOWyg/hviXUf
         ZUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597736; x=1795202536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
        b=wvoNx/7R5Nya5m9YyyxFbDa8FZADr84LdKFRjZ6Ep0ledwuYLGVIZSkhDLrmrToEpe
         DZH1ulzFSb7g3ec3fXX3HrEuLUl33AIfy/vXWDCenBXFwZ+8kOe6FM2AZNmhhx3ByOng
         vXZKg5WgD2nEU/fs9wFSkL8VsPmhG0bxs2CInFgBB3jz8CCMIi5Qfwjobn+w5W9beF7l
         E5f8jPm9g29krkynLDfHkS6urz3ZFDBZqZZAGbH86dShvQBUymdP4u9unGTE50nGSJjD
         MBNKerFso1dICJ59upaVPjM+tcBHwTwv5lPJMNmArQ0HZ/SUADxMVIcd4gMgO0qDx0/2
         xujg==
X-Forwarded-Encrypted: i=1; AL+hErEHcr2pZ50+3EBNfF4Xsa46VOrDJTLrH8OGjrCMouD8FUtEcHR0G13kZE39l7m+SewK5hb5PcqNQSl+ixs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OoiByjZRTvGFALV97ozyX3MvehgwzrZHe2qoccBdZjlAd5kSN
	B3ymDPX2fHF0YPiPa8na1K8zMvVToSeXTxbGTxwiVhPBIJE7f+58U8gRCd/ZDNTMazF+ErbPo+i
	9D4W8yYPdYprzJnF8GgeEyUt6A3gb1K2eJqtx22ZpzC6JPmzbAB+4QjG66xLeD0Dv9g==
X-Gm-Gg: AYBFou38vAw4tW1FnQXAalakyUxXPZ9LjV5rxTIqKE8cIyKJgkMsojhuOLzZWdo+pyV
	gQh+r4ZV9WM/fOYPMnZ3aEyIb3uQMaHO7wBMPQR5X3FpG8lUAe4yPuj6TFmzXN6yc1nxDNPs9oE
	im5EtMT4U/bY2O4urdoihBL0e/797hCtGJgaguEuc5PVTBhZVxr+Thsi0RDcovc54F4VbiDSzU1
	0Ueu9OmxmlkS0rNLo6x8shtETkJlRt595+LuU6WvEQNeMLCAkgERmjA/8HPVxN21cpPSwYgffLG
	fweoA0KOAy+z67WdH18bXQEDLsx6KbdSfUpKEaBoaUT7DVhAKAd/eqmffGPOTfiiRJ4JoU7alXs
	cvulJFT9ZKx2kdE81EAoM0IjuOvpgvWDdhJpPck55YeZOv4J1SumusToNWVgd0JDt5Y4M4h/INS
	/XXXjOB38LiknJUF8AdgkCfOeloZvGXNsRkkaWMVEmIGQlJDkBP449MtJUaFRv6V0Ghg==
X-Received: by 2002:a05:7300:4348:b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-379675fea05mr4094543eec.24.1794597735808;
        Fri, 13 Nov 2026 11:22:15 -0800 (PST)
X-Received: by 2002:a05:7300:4348:b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-379675fea05mr4094516eec.24.1794597735084;
        Fri, 13 Nov 2026 11:22:15 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm9722897eec.13.2026.11.13.11.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:22:14 -0800 (PST)
Message-ID: <7fb6c4da-e49b-47a0-9287-9f8823795343@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:52:11 +0530
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
Subject: Re: [PATCH wireless-next v4 20/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_GET_SMD_CTX
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-20-62e39487f51a@oss.qualcomm.com>
 <9ee5e8e45152b4f50b3cc6f583bf3a2c6a49a10e.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <9ee5e8e45152b4f50b3cc6f583bf3a2c6a49a10e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pwKBL4iKKqpcwtWmXBckKM-zaJHeoWBr
X-Proofpoint-ORIG-GUID: pwKBL4iKKqpcwtWmXBckKM-zaJHeoWBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX2TX0qM9lF5n3
 Lou0naP34Zgaud+l/Ba/0vnLFFj/waFwjsEEjhUWRtBjNF9mQIeOWuOg+QRIBGK1faaaHCsliIh
 xRlMuGND1BjVU5Wh70OltW0pUpZCMgZU2TV7E4763J3P8d1+d//UYXVnLQQoVLUTV5nXrxEZN7r
 x2AlCg6c3QLtx+5ExKGbyv6I+JKSPVCj/iiojwLjQoOfLJzVDFhc+5ibFFjHOM73Vm+A9/WDssb
 4tlxsrm3YzgDBnykclYMnPOssdYg9I19QONaWTDStnsTejJtJdyzvqhG7GnfVviBgV80KN07Ch7
 O28a4++VVt7JyzdVEUey8Zl83gwP9cfG13cd9B3TahHpFsU5F0ZDaA5Mgwcx9LTzariEP1OETXk
 6gkMWHQaw2gduIX8b5Dd/j8nJUA/apI1qH8Hqbo8tYLFmPlBks9s/OnejNvrZKaZJUvx0kF2UqW
 pAejzujstFwjW31I4mQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af76368 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=kVEt3fy9zV6AwbBmwgkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX4tQ+8RJTZiK8
 FUabXHg2s0inMBrpmvZW8SHAhTssfsgqzA9fUGx/QkPTFw2oBDuItyeTXKM3kHPqKLWM7H2nCHh
 ZqXoqXbELqrFR9PprecP7DKaMlvlrH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130077



On 11/11/2026 02:17 am, Johannes Berg wrote:
> 
>> +void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
>> +				const u8 *sta_addr,
>> +				struct cfg80211_smd_transition_info *st_info);
> 
> Given that we have ieee80211_vif_to_wdev(), this doesn't really need to
> be an exported function, maybe it doesn't need to exist at all, but I
> guess an inline could be justified.
> 

I will clean up the ieee80211 layer wrapper as it does not do much other than
vif -> wdev.

> johannes


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595614;
	b=AO3jGAKWhH7NT9gc0hs+RPhZqXYJrM0O8tSwVdDyggkY2et4Q1zZMDUJmyO2c5HqXxcv
	 f9bpDar1RPTD+EnJfutxHoWdTb0R/C0NCCIMa1jDZrG09EfNSxevfvIzzjo8s4Z9Wgqa2
	 ozt+P52MPpzJY44QbBj2xECeI9YNEypmqIYZy7sWkuZz4jmIq2tqFs0LJYxcoMgh1kfDI
	 HYweEegiw946jQAfIOK5goic5dNoEwOoCwmSDqu88G63FCswA4RvI1nbszJM7Fon0P6q3
	 ShkeAO0f0KBRBKCv3gvXxe8JCXnmMOisfdvm9jNvf1VESFcC9WiyG8cGHrrIQupeh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
	b=2Xt1BrCB30qLbVt8/NswNEBoIL11EMoDBKTQwSOqC+BXUvV6HRT31ClU5rfiTOsTRyTV
	 6vTkmxbQiRSbfypSpiJR5fZB3/qlPVksOifr9f3HhsyVSTRy25mR86sozd91XgZNqCRC7
	 QrWjDF3rsCyvsYk5rjAwo2x/hmAz/vd+oejMNDSlfFileILk96r9h8ZWiYXbR3Twe/3bw
	 L8oQ9QFOLffKH5iLh3TRLRwKtKtO4i2H0mP6SAhQsDgPwxvp7hQgKizVDiLsL5Mjk8gWn
	 eZF5AAJ2KKMwmU/NLmCqFgLo4pxiq5aMnr9NjbczC+jcvEyVhHPkZ264lvflYnBRGHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjXQ8iLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGCpD1b7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97837606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97837606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjXQ8iLw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGCpD1b7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRJmQ1725104
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=; b=OjXQ8iLwKb2S8LVw
	F+cjhGVRixVci/FNEaTftvthjBNd/xONf4XxhS2Xd0qgJPH5KL4YbML1t5O94SEs
	FlJSmAqJz6vgKuwkwPCn1P7Tb3pMX7I5A4L2Y6BSnHG6tajKFG9t33gBtyAbMuLR
	qGIPmpu6CkpXYALFrf49TKvToyJr6DF0sRZ9E9RYvN5sZosJPsXkDj223Kco78Me
	cZsfPhmx2An2cVnvZj6X3ErjpRQizeshpgc760p+gn+mFwh0rj/5N97MQzQbxfh0
	kxsooryBQgmAbYkCgjLeMj+HQ0fYph6eRKBBtmUlutvzEN2mIWhKg0dYWEV8dBtJ
	JS7kaw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9p5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:46:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so3020019c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595611; x=1795200411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
        b=HGCpD1b7Ne00z+qYU59BHvsqwHygKP2JUZM4mU7Xpj9BlsXwsYtp0q60wXsrHe0CFb
         fk4c7izB26YkCdy0zd6qljvoo/luxvJBW4lO6hQkOPxGnOUiP5MiREwCvY5fF2NBNEzZ
         ZKFAJ2bmHw72Ob7uHGNaNJOxma/8fbSylV/lVi6SWDPFCynORYPrEDqouQhNK7gKqJso
         Bb4Nh5MJYtwgrG4dsaddgZJwwT2QxmbmDq7+yQ/pf50L5MVcWOGloEkPOl8YLVw1RqVv
         6x+97M1DJdjLR5AMViawQrysHqGlax2m74kjndAc6DEntosBbOQml6xSPUwiqfAPSque
         TqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595611; x=1795200411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
        b=WED7RC+MM6t16729h+1qTElXPQsY7SAGq9zADu/N0bzZTKwsscSteUZYujmrVB8v2b
         fajpg3QgvgRrMZAzVxtwwkxYERF4gqgj9GCkhd6ESAHY7HeReWKCalkoyUsVCMx5Y2Ve
         3SRAbOyKKxmjlOnnRqdsFcFxZ+Cpl3+WJrtypUWIOv7M1xwpmDuXxLQvPsmPqZl82Bcw
         R72j+dkY31Uk2dTNxmY4cPDKP5fYVXdrfSzEiS1dXNwzFFzhkYkgUg9obLltFrYNFugI
         IajvV9ftyU0HfHlV1a+Iq4siT6PbbM54J/jvy+sQVolm2k220CclWb2yDohTx9j+IbkN
         HITg==
X-Forwarded-Encrypted: i=1; AL+hErE/1RIJejOA1s+ycITx2zXtjXbQ7FSPLl1um9/3F/Z+BQbYxeweqE2r2oov4Olut4DjnrFMtEj1FMlcW8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S0PZaj4Vdv5A6fSFNQFRRUCgrViK0ZaeHcAo9vFIDhlP4ZydO
	rrUaIdimjGtfh0ITN/owtvsFQXyR7wtlDMAhqlsOsktNBG4Jqmn64BoZ7Kb1c/3bUa5bpilRyw9
	TgCvdzY6rM66g/yF3Eem6Cd6KEuqkmKZXk+wwX30VozEwNGm4Xmj1k/+tYZ+qt0rDSg==
X-Gm-Gg: AYBFou3fHW4we7Ygod7KKNPSzQY1mog0ZGo4jGDsTJ1Qvw/cfOCQCpV7Q68pZs5tyzD
	P1IUY0lXQ4xa958b+gkuc9jvW+1fsxJecgA/jusBtvBbu492L1ybCaw2Lj3WF6R2VXMlfW80Jxn
	ZYlSTv92Jx72lLZ9sUxyehwDtu3t0QRLOllBF+NSnMR70Wz7FkXcJRcQh8SsrdffrbPvgfZcED+
	2YykVbQZeIZsQZzGS8UdvgsbONy0kIs6CxNnI7fkLZLozHf2TUCQhPwjvci6+zZzIsDcg7cU5Qi
	fy9zV4fovsev2c+OwBbt/C8V53j/uO12u6GzlGibcjAATYCrbGHOsrTsUO2yhLyEex4B0eqI9rc
	a/S7eCxpnEijhBSTO9TNwy0i0NVa7thrSPcCNhJ3bfiXfZ3/bWvEAa9GR83BdMTvESnq40O3kfn
	1RmvzRq1Pqk+6jAPlQ5MxjLyR2zrSQ7sJFeD9rnH+FXjj0L1v5fO71NYWVbB0/Zo+Z2A==
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr3358950c88.28.1794595611322;
        Fri, 13 Nov 2026 10:46:51 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr3358935c88.28.1794595610777;
        Fri, 13 Nov 2026 10:46:50 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm8484709c88.6.2026.11.13.10.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:46:50 -0800 (PST)
Message-ID: <c0589fa7-3a15-4f33-adf7-743d56f13daf@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:16:47 +0530
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
Subject: Re: [PATCH wireless-next v4 13/21] wifi: mac80211: apply SMD BSS
 Transition STA sub-states
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-13-62e39487f51a@oss.qualcomm.com>
 <f4164ec832b8dab5da90ddccc527ddcae74a44c3.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <f4164ec832b8dab5da90ddccc527ddcae74a44c3.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af75b1c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=09HMBOQARD8bikJQYYUA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: -dTjQX_Jg52Ffbtov1S8PE2LzSkv7bhW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX68QHNnHan1yq
 7CM5RM5yAszXcGT2OvcE5ECAtD+vVGRAYUl7m6FI4bD/bCHpatFlPGTGAP8t1eyZ5fVTlLlEqJf
 j8LwqrRMLCCtCc5deaIoES1K85K81Io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX6LJnqTaiSG0t
 SbHwANUgcLdYWV5bf7miBPVuTs248gc2XJ4AkDpMHIuD4k87yHrmJJrwlS9QhUxGPTVBs7AuBQK
 EnurbzRF4Impk2XIx1XQ+iMRzsmJ1CAZ7sz/uOr4nwDYtLGPPOHrBGU/1CnNMv8M0X2YNdlqmEE
 o/yTldKTIh9uLECuIPbxIjuzolOuPVyxz2I7WJGGup5tHM5QMbfjBftxKCET14pBLa8/CX7m2aH
 8CmidQjAdoGdtSa7C9NA6AfS0YsCCvFVnP1qj9vLhEVvl0CI2SALrtpjRQLD7Ve71MEMmaKrvrh
 9jmK4emkmrUCllHszH2KsvL7v15pH7YXSIYmT4sLhoOQFCi9x++JknVl3wbNdd2orZ93FaUBb28
 d8JJBMwh3QiZjF+Wxcb6buWUtWjfNr2A/PNCkt4uVyJXfXQ+3fCd/ffjlPJ13YiUuj7x/AjDnU2
 96MHTV3NWYwJVj9d8vg==
X-Proofpoint-ORIG-GUID: -dTjQX_Jg52Ffbtov1S8PE2LzSkv7bhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074



On 11/11/2026 01:59 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +static int sta_apply_smd_state_flags(struct sta_info *sta,
>> +				     u32 mask, u32 set)
>> +{
>> +	bool smd_prep_target, smd_exec_current, smd_dl_drain;
>> +	u32 expected_mask = BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
>> +			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
>> +			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
>> +	u32 smd_flags;
>> +
>> +	if (!(mask & expected_mask))
>> +		return 0;
> 
> Not sure I'd call that "expected", it's more like "relevant" (for this
> function)?

I will rename this.

> 
>> +	smd_flags = mask & expected_mask & set;
>> +	if (WARN_ON(hweight32(smd_flags) > 1))
>> +		return -EINVAL;
> 
> WARN? Isn't that potentially reachable from userspace?
> 

I will remove WARN_ON, there is only one call stack.

>> +	smd_prep_target =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_PREP_TARGET));
>> +	smd_exec_current =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT));
>> +	smd_dl_drain =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_DL_DRAIN));
> 
> bool, so you don't need the !!
> 

I will clean this up.

>> +
>> +	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED) &&
>> +	    (smd_exec_current || smd_dl_drain))
>> +		return -EINVAL;
>> +
>> +	if (smd_prep_target) {
>> +		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
>> +		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
>> +		set_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
> 
> might be better to set then clear?
> 

Sure, will change it.

>> +	/*
>> +	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
>> +	 * subclause 11.3.1).
>> +	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
>> +	 */
>> +	if (test_sta_flag(sta, WLAN_STA_SMD)) {
>> +		ret = sta_apply_smd_state_flags(sta, mask, set);
> 
> Sounds more like an LLM invention than a useful comment ...
> 

Sorry about this redundant comment. I will remove it.

> It'd be good to know why any of this was needed I guess.
> 

ath12k driver and firmware needs notification for these states to handle data
continuity and filtering such as to stop DL, etc.,

> johannes


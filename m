Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597850;
	b=fLZQRuVhs0ZLXN+JktufBVRg58571fq1yRTH4BVm1UTsrfxT1YTZzAiETj6gFQ38I0Rn
	 fumOPBUy64QumUnZYWRle8sX3aiEsXlHqoN4G+ZUv92yyb1QBc4HlPUpJSOqtsirybP0m
	 jB9trF0N5S2AAoxDcFPzR0zjFjMGKuCgl6WxaRxxBMWiR8yQueE78OmvZb1iL7IpKS+DE
	 L8tb/nPE3olMSKrHxBDkeZOy6gmU+lJ6VDGKL3lUhRpXOKaT2jT6Z94/fOr4u6pU1oqXQ
	 TONCu36Z/ewZ0pPQtABDnm30heR40G52k0RtAaqYjsihhPZGav6LzR+E3cosRfo0glg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
	b=5Bh+fHP3vhXYzAhOB95YHir2T7owZZiHFzMhqBXeltKM3kRhfmIN7HiY16VIc8s0qvXd
	 9xcHrY6tE1jLYO1TjGmXJRnYivK6Z3HpILrNnYcwqEtGxI/wPHC3rxvWvTuCEj6gWP5bI
	 5NTi8CzndyhpeCKCuwqZEK0Wd89jcVR2nLnkVKkU4o8Xl8NavlJKs4kII8wPFjftuKq4O
	 XZb9WFCzFUXS+V6Ab3aNhzZHe9yLx6jWspEkVHIHI3gn930DxmI9hIeLBnbtaNpSsEUB2
	 IBbV/brL0CpiKXkrf1eILin4h54qZh+YHR1InkLJbWLM/lIrmFydgjC/oH0Q2SRBMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNF+d14H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcysP7xH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E2606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434E2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNF+d14H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcysP7xH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ25TO3195615
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=; b=JNF+d14H0akvrtY2
	dBG1L6h9x9i1nQ9TXT+lqfWFN2YD/67tt8dQPR+fC7sY1p4TVSZrR/dDg5tV6nnn
	hGLNSLMX9cJpiXMUQGBU0QgGui5H7jfaCg/wShDQUlleAej+sKIZ6SVOHZw1iT8u
	J4KdIA2dw8UGVj6/L+nCIsgmk+Aqp90W9hCXJGehEpYYfk9IFkfnt6d6Cy1Z92wg
	pTS3FezldHMs7bHb9V863gxv27nJKyYNT18DOpSE8bUR32odgSCncjzwB8Yllevh
	W265Sf0EL6AqTEferutZ50cHsRTnHp0SYiuGRR83VOFXr0mVAp0tJ9OrCSdujId0
	mjyw5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rmdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:24:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1229973eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597848; x=1795202648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
        b=TcysP7xH25H0AmxrSHpP2+NW00BnyDs2VXcOicKDP4fuuEss6HxkhRhMPsw7zqTAzb
         jwuE/nW5gKakwQ3MxK9yEHRuQkGakNlHCorg17f6estbKsU15+jYLjDaV62bXbI6GJIl
         1SuUscLKGSN11zMkwSY+dtDo3X5nP3S8XB42kIdRlA9RQ023WOw90AIcBa2Nc7h16IvH
         GWOjLlywL35oRVu9UFb7PDVpPlao+9g4MJiJPmVyapPYaAY0WYVkUt0qwju/b6aMU+a1
         W/R+fIPfeNmMVSS+PJwALpUtxA6FuizNTqZTfvOVoLyW44yxRG2McLWvzXhWhV1e6+7e
         O+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597848; x=1795202648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
        b=p9ECASZV3vr32EMcfwwxf6ZzlcfAgQdvzRXemQD7E66GQmvTJxych7J+V6ulFEQ6LI
         vRLi7Vtj9BHoPTQAQgJ4uAdcNvY07+jfTuHStCDLabXuBCcNRredzdoLZBX2P8KAZL4G
         rcVRLjaKIWj2LzUlzD2tmiTL3D4+AgJTc9Qmf51jYCYKw84rVc3EO5+DHXAZu6tpwHrg
         jSmHiErCP5VMRZ4tQjNLD7apbnsaZ0ptSN9Kgxp+RzeZl7LVIBQ19xZWIKbM/vYAIk0s
         GZ57fmbsgdu6cowBFyKpyTw6QPoBLJi5r7EvZ54y9C/+x9jPKMOM4jWwv6O2xxEDsiIY
         OLsg==
X-Forwarded-Encrypted: i=1; AL+hErFy8aZXYqoonB665olbbuGdDimLDN2Lh7yY8gibOJ2+x7yQKXLdM6ERoAoqoIbjyabfr39deTPNBiRzhCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Et2g1FGJQLEV6vi14ka09pt1S1K4EMC2NGgIaZGlG4V2Hhyi
	pV/PaaRh5Y1UE4y44FU6tqBsRHVrS8eroINuAS7LrC/4Is1SdmB07dNySsFT0VjRGniJctcMGmj
	jIdYsfWKkMW7sNJlAZClQIJFYCNRmhf6quYNbbt3fPdnJ+BTNUN/703xXqd++6oSuGNQWmE6q4w
	==
X-Gm-Gg: AYBFou1KhxpTcSpX5fOpTCK/g/m73r+RsQAhsidl3F/Xos40zeTwIXfp+5kzdYGux+n
	VAvdETCHpzEfrhbtMaoDkeiCGSk0YxNWc+40jtzpZ3CgJAEro61RYjFdxRDNfV4rsmPMbfyKBEV
	CLqY/0eXnqfXOpNK9uTMU5KgSOTxjBC8BM55cFAKjkc/DMIgKCRMoWnZW3nrE7ihTH/wnSUeAPS
	f/Yim+yhc8VLizkro+QrW2AzuL2iFIKhVu2s1jCsXN06QGzi6uZspADfI9xp3KLwwXg6+/aodqT
	pkpUQ09dMq3gYJcsgmbU0DsRObJhS5wUZuDHa2jfgs8hJt0D+uTyYj6KcaEXOBYBZ3ZbUiUTGt5
	gSDmlDncM7RV/SbMr5adVLZ2gyG8l8KoKUTd0E67cVkNUbsRv8VkOdp+mg/aCNv6Vy/l4WIBQst
	zYYBktW4yKevc6euYnIKPnYvmmxsCwlBQShDWrSYOxF+4FnNnVtfU6vXV2eMAwYY9hzg==
X-Received: by 2002:a05:7301:1a05:b0:369:f035:661 with SMTP id 5a478bee46e88-37967315a1emr2612297eec.15.1794597847305;
        Fri, 13 Nov 2026 11:24:07 -0800 (PST)
X-Received: by 2002:a05:7301:1a05:b0:369:f035:661 with SMTP id 5a478bee46e88-37967315a1emr2612274eec.15.1794597846546;
        Fri, 13 Nov 2026 11:24:06 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm8826385eec.22.2026.11.13.11.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:24:06 -0800 (PST)
Message-ID: <aa2b9f1c-61bc-4908-a509-9b3d3f269e5e@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:54:02 +0530
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
Subject: Re: [PATCH wireless-next v4 21/21] wifi: mac80211: define API to
 invoke SMD Drain Completion event
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-21-62e39487f51a@oss.qualcomm.com>
 <60c815e5020502b91215a6c89c589d881e80d67e.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <60c815e5020502b91215a6c89c589d881e80d67e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nCEfeSk2u4GSgu-IGSJvFbXeg1yCHMEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX9wR5WRVO4V7f
 MlRHhyePHAbabMZ/ayZ/BKSDwkgDFqhw+hKaP8a3Ozrrc64dJyTrLOeOCkIigAPM5pWw+tO2/CI
 S74W56y5H04yyuA9NMiQjwdUBD8psWYPHGoPrNgQgI5DmFFNO3cJkHbSKjsBsJPZOpgliuab78o
 ppP0ZlPNeXvvPTz8+kNxH2Vip1751saC26S6CNfO+SxYNMytOB+b4LEjc+pqioTktBedtBM+iPO
 XK5MbiNlpbJKQbG9h5/PzJ56K06kuw/ymyUmQBrYi9HASfpDHz8rwT7wtKsCWCYttu8TlicK2U8
 H08vD1Ycq+zC6Q7JLYISvyL41LPBhxEQLsWZURM+/o6a/j8ZK47/O5lP7OsVS7AtLBmNVv2vi0p
 0giglqsksQLmGzuojR6YlTJZuZWMClYQaSrp+J1ZNB4uTsLtsLIs7OHSGGFSgykDvmmX9Paa1hu
 Mvx1v8T6PwfodDgVE+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX5W7DeWBsdFX8
 H0xhe28UlPYaA+JHD7V8Zt4RoYKexVeOBeJl0f3ErR93bJin5GYuTPW3mBTeewHtQ4N3hdYURgs
 s8GM+9mQf/nxXjmLx1EZgX3OT1SzCGc=
X-Proofpoint-GUID: nCEfeSk2u4GSgu-IGSJvFbXeg1yCHMEg
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af763d9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PkGQRqP1AohgGE1IAmgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130077



On 11/11/2026 02:19 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +int ieee80211_notify_smd_drain_completion(struct ieee80211_vif *vif,
>> +					  struct ieee80211_sta *station)
>> +{
>> +	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
>> +	struct sta_info *sta = container_of(station, struct sta_info, sta);
>> +
>> +	lockdep_assert_wiphy(sdata->local->hw.wiphy);
>> +
>> +	/* doesn't make sense to terminate if we are not draining already */
>> +	if (sta->smd_state != IEEE80211_STA_SMD_DRAIN)
>> +		return -EINVAL;
>> +
>> +	cfg80211_notify_smd_drain_completion(&sdata->wdev, sta->addr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(ieee80211_notify_smd_drain_completion);
> 
> I don't really see anyone checking the return value of this, and if we
> don't think we need to protect hostapd from broken drivers, then this
> could also just be an inline (or not exist). Anyway if it goes wrong the
> client will just hit the timeout without much loss.
> 

Yes, it was made to return an int especially because of the ST state check.
But an invalid early-termination cannot (need not) be handled here and the STA
can just timeout. I will clean this up.

> johannes


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583392;
	b=GLf669G5ExIJofbhE4ECyflbunMnyHzyXMymu5Di1YEJKMx8MC/mLE9fy2ypjJoexSsQ
	 Y9sZ+qLDSDuu7es4mEopmMhDaWcPuc3epWLThuQiGDns6yR6Wj6uVNf9wo2dEz5SyZN00
	 PXtgoE2EkZJUkT6lJExGTmftBuRKpxBBLPYj9HQj29SYF0d0fxaUBCS8iSBw5Qw1ES6H6
	 6jE+SqErxK4XZk/hSiPwxcZKOX1NFX2fKbYMATJeqBJAunbFOD5UtaNL1J02KXnz/NHdg
	 DjJylkdTFxJXXIzPXM/934G3QIpvagDsqHGCH6U7TJuV+UQ8Bxnkm7m5SmToHK0iHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
	b=nDDcPQ24J35m4Xm4u+8MSRuJ5Dy9n5eLa8pEab9oAMVIPnLsIVfvefQr26WwirvH+g64
	 WTuOUb8VWRpPSbDHD0JHpnAsWpnPnUKEho31FrCbn2X1xDG2zrebDJ3QGD7hT3Rk0VoUU
	 xBzc9gJ4jDiCzo9TY8aUwX8r886WX2SEDmv45hLxOKxrmrgFX32Ou/nRQoXLy3NoLQDQF
	 NTglDlaj+v2BbD4hX2eRUCewebEuI0jdbJG3FAxUPpYY8VQepAqGvk6G6SdCwH0ljLCiG
	 lF1Mz+YQ+9XkuT7GfSQACeGeesnYZSh6yaqFen69RmrW/HnBvff3syea0qIphJ09B0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5ouvxL2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N/5WZFpi";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE98606A8A6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE98606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5ouvxL2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/5WZFpi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJctR058873
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=; b=a5ouvxL2csSRdfoy
	rTSg13+0wZMPovl9NDZ5sUIk1y7/Mvnc2pFGRIstPl3xE8jk61cUsuFPWXPG1oma
	OA7ok6uz36moAF5Y5gmxDDUPb+htJz3MuZRtkvaaThqEKpG2Mkj4Kbaf1cD6Cch5
	Sm0RVW9MMkgKit1PWN0W7FVQ5tnkW373Ds2pRM0ckdn68JUfTwWazkXktx9fzYJY
	4gfD+6bc0HnIoYAEPpz4qoT3tGmWzv/OnaKNMN2uYjoiTn3lSOD0eOOfmQhyPcAS
	7vp+coSjqPosIvC7HaB+PH9b5Ke9NLm3LjvOxWvJMSlLtxMJK06RyJXdrVr/F6Z6
	cm9Xng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwbkg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:23:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e942b1cc86so10326495ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794583390; x=1795188190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
        b=N/5WZFpinMEB+SUxB807//dYKcXYPwnBjzXTwj3HoUZIqNdml/Sx3mVUtXLzqlgaIW
         J/jXh7B+nrLrMc1lCYCJNK3CUyWEfdG1MSGhGFWrJ9OIwmATpfFtLQZqFA2oInKM8SAp
         dtMXopMdzgu+x+OXHIWMl5Two1/kRnJSIJVJYCtC1CFxb0AxzVR5qlhUSVG2DnfGXeTO
         NmoEd8EUQo+fWt/eDyO1tbS0wHN1qgdVjJCLMfaPUu4XybtMEUcLltf1g5yuXWDE99sb
         MHCM/g1mBLIVm6iiigL0aq8/p9fDnetSn5wwBG5GCYylTF8A8bazg741LtOC0lZBmnSK
         XRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583390; x=1795188190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
        b=0OYhTrgd5Vo0aIu148SV0htd7hjkQeuhQpNj3iwd1ARXbbC/D3eXy7MZgFXHzoLxRW
         57KgAqhDI/L9YucafZN/jsT71opLSWPl0Y7ndxcVs1P7MtVW0KJ+BvVe85BmnJ7jimoQ
         m2vuxT7YIa6Qs+0BuSAhh3hNfFH+J7pgPbRSlgmQI5EwwulZWx5BTi9RiWvpEugS81JF
         Yz4cjc0ArpGKXv0S+ys2JvGNyOgaR+mmcqJtbbnbnDh54xN8DeughuhNrzAmhTSaJg1r
         xh93PCwDzt/6Bjlgy15cYUkoeloyU0heWlvvhr6NugAxd4mq3KyhhbbDvv76JRPp5gmH
         LqeA==
X-Forwarded-Encrypted: i=1; AL+hErGHRdjmyYhgSQEXg1PhBM5zslHEyIT4lZPWvfJmMK0gdAR3NvYysXiImGNMnd1pptktFv7u334UR/bDHbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z95FIVpNoHeiQCuRH3MkSLtBmMSjr1TvPV5WB1GC1V/MyiIG2Ee
	Fkhq8Zz9fr1XdYqAjgWnA7BrE+yGayzpK9CpA41ZBfo4NwcHiXHOncrrN3ATDltjSXsAjmKR/Fv
	2mmda/h/30TKE/q1mCvRH4W5Cqb/xWF/uj7tWT+eeZyQr7GuuYI+PKE9Fk/DDCQ8QTw==
X-Gm-Gg: AYBFou2XI5yZMD5vXp77UKKdmUTzZ+wNBan1snVTbVYN/kcLFCVNuWHYzgREZWDBlvb
	aXtwqO7wxttMiRDL+NEobtBPOQ3f/OM1BqPND47kAVHHXW88saH+D/h4V4K6XAaDuUv8CS23qfb
	GmDCTNJ/+UpNQxjvC3CSQRWXfB6cbi17B3yl3TDyGWItbGLs/6iIpuA4mLUt8vwO7GfZwF4+3OX
	L8Bx3XwzvZ76R95/t3kaeI7rq0/vgqdOZYArU/NIRc4TzVY6v4/9sMekI2UpE5eA6b80TUnOZ1K
	0TIqdm+c18v1S+qSS2xZCBk+wFyGF3+6HoiTuu5qwsEy87CD4cL2PBZXxzJlnJwO3dE8zIjhKlh
	p+T6NcXYpJlWayRXI9H4cddRz9GnNL+4cJAdNB5y9NtY5GOEqazleBc5w0BuKNg0FL+M22lGLcQ
	1eBAjwv4KgUZ9JTaM8zUAuGhI3kc/6KcOqFWbCFMWzTNZFSMgcWS6b5rYpf68WVC6TYw==
X-Received: by 2002:a17:902:fd88:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ee0dc933d2mr29590525ad.12.1794583389723;
        Fri, 13 Nov 2026 07:23:09 -0800 (PST)
X-Received: by 2002:a17:902:fd88:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ee0dc933d2mr29590095ad.12.1794583389081;
        Fri, 13 Nov 2026 07:23:09 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d70d3sm11869985ad.60.2026.11.13.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:23:08 -0800 (PST)
Message-ID: <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:53:05 +0530
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
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
 <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
 <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af72b5e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=C7ppcZlkJX4NIHrk3x4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6omyzExUVFUndS5Hlku5L43f8uoTR7oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfX2O3fLxY3HUbH
 YVJ1n1o0ZiD5ZP+gyDZg6R+7UUzUyhJ7NDkrsX7MiFya1RudH7ULBT+eHmYf0McQNYL40CbaOdM
 /1DJrPRy3txczTpu3nOIHkNWbZ9WfMoyTouGqIswskp0gfBcFXILIpqGs8kxvQzhKUNkYIsxiux
 gv/3f9HicPes8+DkL+nip92DRl0kDrg3MYCq1RZoexWZO4Fc2+XBlSBuBYCwB8w8Z6HE5CYQ6BT
 4yF3bFhrGJa6pxx/o9F6Is6hbNDAfATdgh/y+dh5EiI14uCtxMRYlhBbogPHsUQXt5B2qgERbTI
 ImQ9nnYUlGDOZzpxOb99fRSbToULyW4s0upan25O043IyUjPK59AkrBjcj+m0DWFnu20CtR1nIk
 E0X1HvnRC2LBVYixOzeGoi63vnr5aDuaw5VWkg06xkmz2Ye+V/YTDuENfrKIBdkOPBhNc6NaxHm
 HXMLHogQPpPrjLZruFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfX5yJnLpLm7zsB
 9q9BdxQtNyeTXXgX8KH33rf1FQZHE1r2EPfvA4KjGtSV+evtVEuhQ2AFqWPMh8rz3aaaNuJAZ7K
 b/pZ0wZobd4uypIY4iI0OZUYFYKovvE=
X-Proofpoint-GUID: 6omyzExUVFUndS5Hlku5L43f8uoTR7oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130061



On 11/10/2026 07:56 pm, Johannes Berg wrote:
> On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
>>> + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
>>> + *	multiple commands to indicate appropriate SMD support (refer DOC).
>>
>> This (with the wiphy flag) is the wrong way to do this, we have extended
>> flags that don't need the double enum value and pass through to
>> userspace directly.

I changed the EXT_FEATURE flag to WIPHY_FLAG based on the comments in v2 and
NL80211_ATTR_MLO_SUPPORT implementation. I will change this back to
EXT_FEATURE flag to indicate driver support.

>>
>> But also, this does absolutely _nothing_, the only thing you do with it
>> is pass a completely ignored NL80211_ATTR_SMD_SUPPORT to START_AP ...
>> it's not even passed to the driver.
> 
> Actually it is, just ignored. I don't really see why we'd care at this
> point though.
> 

NL80211_ATTR_SMD_SUPPORT passed to ieee80211_start_ap is parsed into link_conf
and (will be) read by the driver in assign_vif_chanctx drv-op. ath12k
implementation needs this indication to instantiate vifs and workflows in both
the driver and firmware.

> johannes


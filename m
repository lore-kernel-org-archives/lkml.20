Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657009;
	b=jqA3snXNRFqY/spM2l3nfmZbf78W/d2eR0DkPgAwvv4eaNENsVGTlBPDbSJUhRwKf3Bf
	 WpoHnpKd5N0LjYtrnN4RxtX0ri8XpNI+qLEX/bZgtp/n/Fy4kavTdrp/QgxxmT/FbCnkb
	 wjePAzxheFDgEPJhP0A6lOWBgrdH3O6b9BHpaLIurCNICu7uESdKPVtHBNPUtO7vPPGZ5
	 Fn79lzx/b5S/wxnn5svUZaf7LpvbC7axzKFjIKf/zcEFP4pTTOIpZBe8EMcNI/46ChFjo
	 hiq2VsQDQVqtE0r9bDmMDalaIA6T2nWCiICYEegcaFXVr3o75bWOxjDS8XTurzR1jLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
	b=SGiTIC79mFKUR5sCXhJAsPMyhhOz+lDKkkq19gjNzZ6y1YahuKtzhpwgn6i7u/Yztko/
	 E5NTm7LqPN4dB+2MGJCwBcvyuij6nptNmIgoS3Ewx8u4QgaH5Uu1ucSZOxoYfR32ZntSV
	 gCVR9rp7B+TP31rzSkLf7CRmSWrddi5Fy7zD4nr86OKl3UkjD5X8LBA7Slb2a/wkb9KEC
	 q2/oAkETkdDR9a4CqdY9eaeQ5dE7exJvOb2G+gtLt3HUJ9iWjhD6kc5jA8Siv6/+2+fR9
	 CYl7sElzXhoMM7Rn81VMwEaUlupT8RwCo6vfmKc+H0qIOQLwI2bq2AEByXIvNfGJTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBey3x0P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7vb6k0B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DBE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60DBE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBey3x0P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7vb6k0B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708XZ3517459
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=; b=RBey3x0PAA8qv+8B
	ZSN+JHUdmKml2vThXWx2k1gQkNSVW/CZF+WUV6rubihP5ztGxgZD7LWL9Cn6bxYG
	XhRlbkW7uQdh4ma0E6nRO1VoY4Pw0uOcAq4wsOZtW8mOOclc2C2odB5/oh0WK9P1
	cQNuU0+URTZdW8oj/U7jwqsiE4T8WzDSKZlzoxrIE6mohZc7+33IIQzd1QpsP1eZ
	8Nek0f3FmkoOWAYjPdjuSK8SeKExeWKdIawMQaizmJZY30KGV4gq0rq599NFNlkO
	YkqfEZTLX5YyUvMMz8NbHIXJ3NxE6ULK0P/37jxcBU0o8Bi627rlSks6tgjB8H9Y
	xCoI5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhcnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so32443985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657007; x=1793261807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
        b=e7vb6k0BOWVaUg9aywNTIMCjRZDE5GLvkx3O1VVw1+QNCh8+b5JWkjsjaBcv5+Zeb8
         FbIfwQH4vW6HWPteRhBR0b09KSp1fF5xLo9ocUWsAA06ARbzGY+zSu1E0ihPre151gqu
         88Lmqbe7zHiYDM47NhsbRbShc+9LsWPLkqslneipKLxEIjQ9ffNVL2MVFKnYuBEdOW9Y
         j1CE6Ouk8UlD6qZbiOgNACEHGv1BzOvkipRomSLmYRHhFaPLrohqMs7PlFWgjs5NNUCO
         asYFJRfajePXEkprgzxKiyM3Wk+yRuJKD8g2b5HWsx3NcoFK9nPVgVuofL3/alHlmyxj
         DHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657007; x=1793261807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
        b=DI/VQMSFMq+s0tqCLiPovIyMqYjUU6brZ8GV+sc4+2eIZAY/DbuWuGtQdngkpgnQLu
         hpnH7jHwvPnXxEk0PliRtS7QDj7HP244aWk9i2kB21pwYRzz1bYuSmH2BtnGTUu/KHwG
         5YnzKtBYO87N240d6xeeHU88zZoahrE+gTTR4uG+6GuaDgAVcmsD6w2e37tQVfTHoMbJ
         LLlfCoQYtHA+jzzLx2gsxhvKvK7jvk3uqbM29znUOXFVgaBRmZOnDiU7pF/o8v/gUaHJ
         Ks7W1HsrR7s2Tf832rxoKuWMgyL/7SVJU7/iA2xJgruoXjMgxYAhlmWerAZoioX/V31M
         cM1g==
X-Forwarded-Encrypted: i=1; AKwUvBy+DGmmhJsZUatY6hlEOhjeXfyP82xQaVdXUqozGTpiVEIWYl24bcSKREvYDoahBtJKwP625we/hsN6Ynk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKINb1Hr9/IVeeo1B8gIc2GBrvBLHlXeN1xugAFF3Auqwmu0wgN
	i7fvFcyCb7jW8w/sya4tltdg1ER1jfWKZEUYjH1aNZUgoT8XegXYNyZ8nxhTgXrnu0nWK2mOzQ/
	VPwMeNBbfxLyCwRF0HhpsjWTvxK3/A5yD6fQsrNA+19KGVCaoZLZ1EEk/le3J0QTP3jQ=
X-Gm-Gg: AYBFou270urw09tL+bvj+47IS2hdO/vgUNtNJADzAAGd6BSe+dewUVBl9udA5xmUN0r
	fMjoFHFX1MMMJDnxTrZHDZ6lXdGaRIhLdg3zKNe1eegXmrhcPfITy3KNEz3jGIZLWLzVJDUhlZV
	wv7Q4IWoQR4xtnE3RHWZX32df0BRdHuRd6e2KJREPq4dNUSnOtBliAHsN6DGgbYUsQUW6UVBAj7
	+wFwud7KIgnZeKFk4SUjX2xdtDL+CZWlMNOjMND2me7v311iD6YRJmpiyMGBJhaMmkgcrwlG3yM
	Dbfy64O2q+T1b1Z7fRDAaFh79d6bQZrwX2IDRxTk32/jKocjEMN49cd/bS+E1DhEH4IeeUBzVcB
	YOsL6n0wN6MeLOuAh8oDqdw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr953574385a.2.1792657007622;
        Thu, 22 Oct 2026 01:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr953570985a.2.1792657007017;
        Thu, 22 Oct 2026 01:16:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a594fcdsm79332866b.50.2026.10.22.01.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:16:46 -0700 (PDT)
Message-ID: <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:16:44 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6SkMc8wLYW4z
 6VakW98jr6F9KgBZZKs4G7egXBQis6HpCc2XrOhvbmX+u54ZfZmSbbTdnWikhGnDc7jzn1ZyrKB
 3YzNqSFEXl//f70ICQjAtxVHycs02YOWtqC7CImYUPJlLPaUKF1K1QmB1OW9Y8AmGKFbSXYnY78
 WXDrJ/ya/YffmF5AtbKAsh9KppEMzmuuCFK/uRwfcjZAgVEOhE7ArUF32+0lFs1dVw9BibUmT6u
 cYfVflN8GXhGRCTSXzI6cF0QiwDzK7sHJ+HTq4r4e6VjL0mhsVC1o7W7qk8H6ytPfwApIxsRGCt
 cAZ3pJIKBz31FdXs/8mFr9Me58NjIsIAKgYaGnQSKVKsA2cQ50HAMAddw+KZOfL61hmqLxOC3Cq
 W2i+0QFefseVfeSIfgaYuG+7GJB3ERqHoYf0JgPMjgVBKuF1abaNDrDZivE/fYfSxsMeOPDCHVj
 oYYrJ7WiEws3zray+7w==
X-Proofpoint-GUID: nu_Osap7D_fLcebfboUQxFe9Fz2X0iBk
X-Proofpoint-ORIG-GUID: nu_Osap7D_fLcebfboUQxFe9Fz2X0iBk
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9c670 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=BJ5YTGBQpeWqlfnRveYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXyASKgb9aTJgN
 iPCGUph3Pkx+OgXf9p4yWGvZeSBw6BEpP2H8KP9p0lQ+Dh0aCqBHnq8nX54wDyHBmEr4N0klksr
 ljwggtVsJ+hN2qfHWoWzkNjDvJzFaIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 3:49 PM, Qianhui Xu wrote:
> Hi Konrad,
> 
> You are right, and thanks for stopping on that sentence.  "Maximum-load
> updater" is a phrase I invented; it is not a QBG or battmgr term from any
> document, so I should not have used it in a commit message.  Let me
> restate what I actually observed and what I am and am not claiming.
> 
> What the driver does (no bug here)
> 
> qcom_battmgr_bat_get_property() does not sample anything.  For a given
> power_supply property N it reads the 32-bit slot that the QBG
> notification buffer reserves for that property (in the SM8750 variant the
> battery property array starts at context + 0x6a8 and is indexed by
> property id, so BATT_POWER_NOW, id 22, is context + 0x6a8 + 4 * 22).
> The driver faithfully returns whatever firmware left there.
> 
> What I observed on the unit
> 
>   - charging, actual input well under 1 W: power_now reported ~89 W
>   - discharging, actual draw ~4 W:           power_now reported >100 W
>   - current_now * voltage_now in the same samples stays in the expected
>     magnitude range, i.e. the other battery properties are consistent
> 
> So on this platform the BATT_POWER_NOW slot does not hold a measurement of
> present power; it holds something closer to a configured/estimated ceiling.
> That is a statement about the value, and it is reproducible on my unit.

So it indeed seems like the OEM modifications are the culprit here. Do
you have downstream kernel sources for this device? Are the properties
remapped? Is power_now disabled there too? If not, can you read it on
a downstream kernel and see if it also returns garbage?

Konrad

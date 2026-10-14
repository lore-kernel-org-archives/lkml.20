Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45F4D9F9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983037; cv=none; b=D1l6Ap1r+A4HpUf35Ask9oq2JDKpi8B484L94QpUFBGuTgUz618qM5Z0fhFa6Hr786BgLHPczRrltazSQ2odqk0eagdEZDT/WsuqOHTFlx3PLMeu4R/7rXp/dEJfJO5RdiYvhrfEOGrYEAYj+nYUmtZOghgDuFQKvrumKdvOF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983037; c=relaxed/simple;
	bh=ZBbiT59gNmAD7YIsNv0Ku3NckiKgCA5G86153ib0FIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnZEMCPaeRTyNHrGloqU7h5E3DYJowxVIAI6pneilB9jNxv9OH485Su65eM8NznBPqBYSgCBB+LynBwQ73Uz/1Hb9rnsMw7xw10WJmg347sCgwsrWEklPQByBc4+qVR6xih/vZ1zhDukdSTrTUBUhqf7ab0Nu3ZQI87/0zzmonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsKD/+BJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EImEj6Y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsKD/+BJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EImEj6Y/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBOxOM3951298
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=; b=GsKD/+BJIC5tAlzo
	sPIL3ERW//zrhQ/g/tAXIXxB+n2qDG7WeUsH2/MtNDtIO038cyks3vlZn3FW91XS
	FrExRQH5teDuqjI+ixHf8wUdj2tPVcWizJLeKVJVlaGGLymbhtYY2GebYN+CdKCg
	HY5kgeEKXy6G1Y++CSXwgSSS7bhPVjDhjxw1LFU0dWVsSKz/1U+QvGllHLh2LaQg
	zo5yPjoAPpVl0wOc3uC4u7OqDQhLgPTyIYMfLcJbUqjbOK+wCwEy4TLXtb3VUq0a
	ySFK0288pKO+G0Oupuk8JVJ11tqVqPIikv/Qq3PvxgtDvAryXkgsJudQbXcXnCfk
	LMl99Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1q2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:53 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98929c3b03bso227578241.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983033; x=1792587833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=;
        b=EImEj6Y/mOB1QL+v/NzyPTYXC5MnYJXbtFSXosD955JoH0cquMe3fAbzDkDIFE/ZKk
         k/K3OmpHyZhJUDLCyAFqxjxDKrZI0mP+ZO+tWeyl+zflUtyjrAEx06uOQ7otsA83kwrO
         BK+BsNax4PYly0Cpbwj6HvS7hjZHm4/jzf9Nquqixt56A13QvzuTSvthPMNXhC61Vybj
         poICjCFLKVMnvxlRR4qkyxBPppB7g3Kf9mhF9N/UzrCgALqxQa5ijHFQ4pSOo0yv52TH
         1hI4BKyA1kCdw+mDBLZCfqApq3ORbZ9ZatyWxSLDHvdaURD4PeJ2mxgYtmzA8uPw/QoM
         tPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983033; x=1792587833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=;
        b=KVqPgs5Z4QiRx9SxJUCIvHSsSW9HTp7xzCtkmBtULTBN84B/TRmvQ/cfRNHUciux5O
         QrwipklI6kXFsWBdVVbhtS+v0q3ksRODyVWMDz1C3UHJ6P7w4R7FcRlbe7QOkTHYWsTp
         Zqs4+g7QkBFY+/+WCbMvf39AqlYmQBOx9KQGzVYm6froxxMSfu5v900PptYNtsDIIym8
         PtiuMtLdwgZ2K3UjikPQWTNYT8tQHZWs40pdQynje624dPxLldASTPCcRX4mQEkb47/z
         AmPqabxpbNY1s4OqNOeEHuG33ZMJS76ZyGtc/pMacN0wH6dy1+ZQWjmNwmnVmGdoIS8I
         Zduw==
X-Forwarded-Encrypted: i=1; AKwUvBxRUPBpBsJy0FSfgIu09YiGY372B3Agu1ZddmlkMzw+VE4fdmwFWEBfDeRjWzFOd7oDZ3abX4/JlXMdtCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIor6L4FkX1XxqkqthjJb4VpQUWwC9FyKciw+xFn8Ybf/VDpTAx
	TlqVVca6wNBD3Y8TUR1GnkqirO2ZUGX8rl5Dm7hBgzLirt24O/Akm6p6yGJx65ag8Z3PsrBbckY
	oNZEC3BKXvLbmxTHq4uBmapLKdBG9TSgFoz744SpLdTcyQT3JCdaZURSgdcyY+kEfis8=
X-Gm-Gg: AYBFou1oAiBJHdiOQuO+fHmeanQ9G1lhM2maIQMf/JgBDllmil/Osl8n511hVTIq8Qf
	492MCDQwv0Jq9PmlaLuQMwFuUFtgu7Yq8LJQEE1GTHjrGs6ln9cKgeoD5Fsd4S+XSKcpJH4Eq7R
	WyPeVj5QW8dQjrWjEnTB8MKPux7mi+ZE8b9d6DXWuouZf/pugNgAmjOmg6SqpQ1pbY9FL1wL4Zw
	bV+JIh7hy41p5SN2WKVuAOzTEeOMG5JYynatWJYpHjfXPI3sJpMhipKpHIm0C4bk7cJwxIj62Bj
	RLn9ENNyCuTgf/yjF3E0BjIe2icKGYtyOWS/q/9htAW7fA+Vb+p+fLZqoTmDGDe8RVrs7sP+vxf
	Cm1KR/CZpPSFWVNIUM2U=
X-Received: by 2002:a05:6122:3284:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5e91f44016amr5664845e0c.4.1791983032578;
        Wed, 14 Oct 2026 06:03:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3284:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5e91f44016amr5664812e0c.4.1791983031983;
        Wed, 14 Oct 2026 06:03:51 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.90.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b3615f2esm48762455e9.1.2026.10.14.06.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:03:50 -0700 (PDT)
Message-ID: <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Hans de Goede <hansg@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Kurt Borja <kuurtb@gmail.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX2Q064TeMGiSA
 bidwvSABdyrJJdtA/M9bDYCV8yMhMarW+Cp2mfH5tnR99SBZukomlMaFoJ/qkkIyKPAu9Vo4tkS
 g2l32Art8HwLg54S6FVHKneSKjLiKlM=
X-Proofpoint-ORIG-GUID: TWAfBb7KD9MaaiauAvCp21cBJ-yphkIE
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf7db9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Z+RgMFiR+YmuKcUK9jJrqA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=aZIhWqgyBre7og8ISb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX4NJjHcYvltgA
 C4GG9xf0iK6WPcu0J1GF56HyqYesK3Cvf2KLesFAk9UpnqZtCxc4mg33QC3OfJyfq+RRfD+iMSl
 Z3UGEYnnRvlhe4ApQjrqwaWZ1Pz11DhOjRMZsp7CmPyrWltNN+0HZKUyXUIOfqXE6JC3m0C0Yx3
 zPW3nN7EvPmSvvvMl9iv6lwml8HImkR2ZVILgpiwBQV6DOhlhK686u0gy9dRXFKcA/cUFu4Lwoj
 5wPfmK/eJMeu5pClVsP1/Y+0Q01quaKXnJA42rgGJx2Ga8ykbW4gH9GdYqxOT7MhbLYiPzyoqYg
 4K4oU/VrEVXO6hfVNJ+2FQxmidWtaLhrN7TYxwHGWaHthaH4rBkoCn2b3aCEUvXo2u0zYXgFOUW
 jurWHyu6Puc68ZLA0nys3vRWYiGfLJctxlMn88BwQbV2tvgZgyR+ZxE5mBEALEPy2SgWSq4A06E
 xe19pNVL9zmUi4S2PZQ==
X-Proofpoint-GUID: TWAfBb7KD9MaaiauAvCp21cBJ-yphkIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

On 10/14/26 12:19, Ilpo Järvinen wrote:
> + more people.
> 
> On Thu, 1 Oct 2026, Daniel Lezcano wrote:
> 
>> Tie the keyboard thermal mitigation temperature to the platform profile
>> selected through the ThinkPad embedded controller.
>>
>> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
>> balanced and performance operating modes. Use these events to update the
>> passive trip point of the "keyboard-thermal" zone to 49.85°C, 57.85°C
>> and 59.85°C respectively.
>>
>> These thresholds match the thermal mitigation temperatures used by the
>> platform for the corresponding operating profiles.
>>
>> Look up the keyboard thermal zone at probe time and locate the passive
>> trip named "keyboard-ec-alert". The trip name is used deliberately so
>> the EC driver can identify the device-tree trip associated with the
>> platform thermal profile without depending on its position in the trip
>> table.
>>
>> Initialize the thermal mitigation threshold to the balanced profile,
>> matching the default platform behaviour, and update the thermal zone
>> whenever a profile change event is reported by the EC so that the new
>> mitigation temperature takes effect immediately.
>>
>> Using the platform_profile API would provide a more appropriate interface
>> for exposing and managing these operating modes. However, while the API
>> itself is generic, the platform profile core implementation currently
>> lives under the ACPI framework. Making it available to device-tree based
>> platforms requires separating the generic infrastructure from ACPI,
>> which is a larger and independent piece of work.
> 
> So the only problem is that platform profile resides underneath acpi
> namespace in sysfs?

Yes but I have a series I'm about to send decoupling the 
platform_profile from ACPI

[ ... ]

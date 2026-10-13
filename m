Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7340F747
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901910; cv=none; b=otXxnfnIglmP8NUeWE8T46PSZXqzfaUf1vrwQosII6f0INF+ARHK4JQV9CieIyG4hKUkVj79FQChyBs7SrFzAKxeBUfgbWEYT9F6noLmD9wUUKiWAdhVJdgKffUyHf3+xN+ZA+UUHLp3BugVkbRHOEr2L+FT1nlh1BYIcWtRXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901910; c=relaxed/simple;
	bh=Xc6UXng5AfMa3Tdm3xgVuHWrr4sfMoltxMiAHnxmBU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NycXfwHgSBOtOaBhB9u1bQcT7GPWe6lP5l3yuBa2sprgTd24r9aMU4BWnyv+u5tQorkMcFTsu5gdjEHcIorMySagyWj7JztMZhoUZ9C1ifuhwp688JCFklgUcEABDuuidnGGBXj8DS20Uy91Rh7cjRX/Pmm1Vy8cspJWDI1iLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLZIH1D4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs0SHoxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLZIH1D4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs0SHoxF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3w6R1492081
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=; b=WLZIH1D4gmyHOg/k
	cBYXf1jWGHJIcH9nlqKa/CSOjlWL6EDg0uiE6jPkwbcE2szL5VWIFy73EM8UDLdI
	Jkz8PVhdPQY2daA5dW2FHefgwewHjmh8PpVKN2aKgRQ/v/ObUCJSY8jwoN75aA08
	yw6tBPiJYpflQn+kXKugwDIjlU7OyrYDVWDG3ck7P0b0Cqs4uPkCORrC4iVlN/pm
	jqDoDj7eExStvPkiVWY2oE23F+oxOMIpK/PbYamPnvsNrvb3jk40vlq6b4ZXGkXw
	aOXpUnFV6JTuVgmg4OdpMM1TabUilDCXQthS/Y/68nALCHrizB1lF/WLEzIWpfWY
	07BOPg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqtg54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:31:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e5a0ad2e81so3808566e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901907; x=1792506707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=hs0SHoxFoNZhCTr9ba7f9r0jw906VQhwQssz13Ur0/2z2kM0wg2i5Lx9Nq/GMZp1D6
         ovTKz4+DY4n5FDh2nbqACDDXRtyLI3PZ12ghFRqFxP44a6RIpU9njwtR3nUOethhAnz7
         6GYlpUGmNcoliIwPvs7Igroy9OKpYYm56RSzUnKQVQ6+gdxfulhvBLUZtpHCK+IFFOQV
         79iW9eg5iWdep5X8ZWVS7W5Z9kS0erEMUp40nnp5XBQY6AyM1C/xiceVbUWQbJUUhMHW
         QSZfBgGGDeI9rnnc4ikW6+scxJHTN/8Z8dCTiMpMK5rqWSzfYIhYf8P6SCEsrtNqxYIE
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901907; x=1792506707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=f2fiMz2Vold1kPqedp7E9tHT+oSqFScYNFbZXV+aCAnphzcJDiFSAQtWRhwlyzojBA
         fvBBuqBEg6AJdgwFR9tvs2sSsbMffMTWDsEEPl5kpD0ak5IiB+YiywTAcDjxPQHiXpt9
         KZvpMTfxu/iCI4aOm7Jqsc7lrAo/xMGl4148fTI5KW/+xcNq6ExTU+pBAJesQfJcQMEo
         lKygmArM5Zra7rt4LRodt7hBpeCikq9t/vyr4kGusJ4ClB7SvwGwdnElZbgiBJzzpeOB
         3B16CkwoXNZda4KUTtmmeVhQzCaOicKg5wengxm02GFNlWvmrjSK+14LZ3VOU9u52cV7
         kQIw==
X-Forwarded-Encrypted: i=1; AKwUvBxwkemW+YH39WpgI3RugU9z1tOX2tC0UcDdyoJgl05EnTMQQYUUUD6eJ7xf7TunQJ8V9Y3AzQ9HgvGs/uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhpYP281aAeRMeIehVC8mbOUfnIfts2s5hdVEAEtCfBGjhfNDJ
	otkOD35NypHrQRFZY/im8LH7YW4UMmurSQbUWfTPuXKU0oiuqoR389c2IrWAfLi0AWDqFTe99xR
	bbtFZnhkHcnUOQB7CkBbve5XugCl4eRaHoHUTJfaJe+lzREkr5CiET6Hj/yOos4ztruQ=
X-Gm-Gg: AYBFou0MgY1c+1Ub5xYF0EySOJIYtARGojZVPwQnCG5TMWZBVXORJEPVeKJMtWApPJo
	Po/jVskgD+MRVfjZJCCwDFIbfl2asKY37+Sx/LxGsCp3ZXAvrNHMKShi3I7P57TgUA1lzWn0giH
	eH2nNrb9BaRw64oir4UIFUkEx1ZHA3vmx58iI88hND7YIjIUUYf+B8fpsBa3ZrEvTbGC2YJARW8
	gGY889MnVkBXGCLFEQnt6O7SneuSDjC9Ec0weP++GCA8u0RKf2eCKIsFxiUKXcUP7QqedgInNoz
	KiLSM2GKNwlwjonqol2rU1CjmEcCc/ClAh8XBHimwOAdrvK36kbLE5uSQuQ5kFrg4b6BWYpgSOG
	H9bOWJnUyP7274Aal
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248139e0c.10.1791901907027;
        Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248001e0c.10.1791901905853;
        Tue, 13 Oct 2026 07:31:45 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm401121635e9.14.2026.10.13.07.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:31:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kB3aahjGOqi86mW5rddJRJlHiXg0mjyB
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace40d4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GpSJM9idUVmPmik-TdoA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX56fJbm8NHrm2
 auUj5ZQLEx/NRbAryThvBnNA1TIdlqOigbOvq25V1kkXx87cswC95qFAfWfL5q6hNZCrqeX3VmF
 IdS2wmJ7gpXR1Oi/4t0/361IJdmdXPE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfXxPpSI7QVhJtu
 Hri01vSWRsUXZFg5zslIhFkUWtNAsNRrkS4P22eUXRO873U6qbK9q/S4b/5UpshZEB2kUfx8g/T
 mf1k/QDNWFQ0tWV/fyBqeT5a6eMQSbY077ssq2JNgDLspVxEcwgPpya6Ut+aXAyEOJlhlC5HJZh
 7NJwQ7JUWwEQUB8Wixs+/4DjoMNea0pERQK+BmQkSCbMIGdDD2J3nMZHUIM4iMuoWeA8SzIuMs+
 uh//j9GmlsZzhl/4nBaa2B8imaQGTu5itCLj/yIVHRT0AxDAskWnGmiVl+lab5B3zaAkjITVP0n
 dmtN90E3/T8DzqpKmR0xFg8XI5gz4MtuBlCsAnBoHAORV+rx/aOgneJ3IOculjeWBneFstMLx7K
 tWKbXohK4ALb8FGwSTzcbzZ2vN9OvcAiHhMhZZD871mKr7C6cQtr6Kps/XTlgeDrky+EB7DuSPU
 /CzhgVwxaMW8XHYWuag==
X-Proofpoint-ORIG-GUID: kB3aahjGOqi86mW5rddJRJlHiXg0mjyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130057

On 10/13/26 16:26, Tudor Ambarus wrote:
> 
> 
> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>> Hi Tudor,
> 
> Hi!
> 
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>
> 
> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
> 
> About the driver itself, I was about to send a v9, where I addressed
> some issues sashiko spotted. Do you prefer to drop everything and wait
> for my v9? Otherwise I can do incremental patches.
Well the v8 is in my tree since a while now and I'm about to send a PR. 
The patches can be dropped but the v9 will have to wait for the next 
release. If you want this v8 in, it depends on the sashiko report. Is it 
minor or major ?

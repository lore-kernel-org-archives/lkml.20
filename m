Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020737;
	b=2czqrwBVvRdCIE9hB0Ypu61kbAV/WbN3iPRiZCwvnQdS53n9dxdEJxGd/3qj/W8p4Aw0
	 PpuGQimh3AGhzEzeozxs9HD+Y2v/n3W3kBnUgTxKJDeYlU407VFBPSWwd3SfuHEq47c27
	 oX7fcWpqFFjqfsIBcFjWV0KsNZlbBUYwRc9mnF5YJbgnGlli9sApP1Kmv6IeIN4lUGypI
	 3Q9IClT9hZkBzs33HKpsYUuvPwd2mCw28+YnJHLvalH49W/HbVQnnEwHJiuRyXyXKhFtM
	 3mp3PKJ8J3oSXCZbq8ihg1kHiC4ZA2O/nMkgEQ8hSb9ZkJUGmMFmzeHXIrSgP45x4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
	b=Bq9EXDVZNVjiqeUQfaWl8BRTNJ5ovST/cXCesEeap3Fu5G0rgMjlOz7T7ewkfivB35Wr
	 FyokZ4QXkHPrjFq9ovPfEGDaeorpoOZ23bvte88UpmexHJJJ4fear1i4bw2kPwtbqm7ZI
	 gNCHGF05exWIfIpEYEPtjQkbXVU1qPP8YP6QGrjK7qPcho+ZrmXtis4XV4HOgUvTTIR5I
	 iA1ASMynj82czJufH2+8xq537u/ice+IDnkoyieQdKgZVfmaK9GyZepxum9cDMJC12UNf
	 t/RX9JJdsMkf+a4fnEGYrun6Z+EaNeFkUvpOL/HGQZ/KeQt2ruzXbFdoYd/9Q/GjLmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91F606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE91F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtCpQ4126701
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=; b=NGFEk8ACpJBSGqlN
	l6Rk7apbp/vgUNssfJ0pPDQN1vPFwmiO+HNLvgIbC4ymQrEnhQLmHGTc8fh/lLZK
	J4QgEVzB1cSkR1kPep3qiBeHAhx0Nc0SJJ99GDynyEl9JCJ1cEwHSrLh4g6MaE1X
	9KMCRLDACZBmK4GVohrpX0Ud3OFIQzV8/2vEwstZ7qinPZ3WzSk4GEN2xbEXB/xs
	Qi16szDSyqB3V6rKPiFt7GWbcHGt7MJ3blA7OwQ8zm+PsKYS/wa9q02Wt2aT0V+6
	q6ukTSUQy73h8BIEuk964CYqjJe11YcEYBI4FKF36PmfcnSC3nMjr2MUwQ/q0Vv1
	HN6G7A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpthvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988b7a28291so46432241.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020735; x=1793625535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=Ajt8vyrWCeNj/FHHFBZJ+bOvhLy0eg7Fa3Uy3Lb5bntMSIDcLjzGiJE1JcpJzejkat
         4qJfEmy4KCK/dC0kZG8zEdORzC+wzTNWKVNAsbeT/kNr2xuOEKaNjRYECtR5MwdzMq/P
         /e+p8+P6yGODPFdwVm6N/NSgv7egb7e9aWtql69th+G47Bc8DBkqEXQqozytAQDXA4ir
         G6Oh6CeBkw4RDtJmK1SB6JV7HO74P+VhB5PrucHvvMVD5CoW86Ru+NSgQiW7gZPLpfin
         cu56JO37EgaOSle+DRywBgnXE5wdw2H0IID4suu9NjLBS2Qcb+J6qm3O1hKp5LC35hC9
         JEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020735; x=1793625535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=0DpbZa/eAJRJtla5mhDYdZMizQ8qkltrrn1A3mcrx7E58YFqZpqFqdetEk/e0Jy07J
         htQjhxz8U3mL9OvJ26aT5tmM8Pap/aBY4LRQXiMzD7k2AcV5UTmgwDfEx6uGlKTaBFOG
         OiRY7dELW2usL5wQOPE8KkmfSnuyIKULFlyRLRZRBCniz3yVnfyD5TywlmjxYufqsTj7
         JdGGR4QTpLkInLv44bXA+uQ7ql/dCGQRPPNVqONTG60Y5g4RJyXkZO3Nq3WYiUfT0d+1
         eKsxB3f+mU3OJZJJuRx/qzMZ05Q989TS+1lbOVbpwuafUTxBYS/72wRYGacXaltvOBG5
         rctw==
X-Forwarded-Encrypted: i=1; AKwUvBxOY9LEVOXThgyAx5tTaSu5Q51TnHA0jRAjPF0MUeFcXIjWKh/9aGG6vryfM3dKKaluPPRKiBgj/zOdD4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Wv/OXk6Q/yv/mF2LIrLYo756Ttz15L49AuySVV7lXyy0Ehmt
	3R/z/HdBNAPPMk4EXC2ht+kIUlMBuN4zQHlmllsTxAhd0q183mqqskMen/abIglRMr6N47n4oi6
	frbKh0AkYks6R6ej+EKrYSSCnEf8gH75vveIwQwzlPEOrEAvPjIG4q2taGqyyCN2Oc70=
X-Gm-Gg: AYBFou1/s46YlWQ+zhwjqUWMcMd6IyH/4cnbB4NREf8vD8dyHCtHkNOmE+uE1QVg7QI
	hPzTRqEUr5YiMJLXUbrqv0EHOQ37tZSmwoh1gBxku4pLROF49BDoWMegYPoheQXMg7os3IR1uMQ
	x8d0FPKNGxfv6z84pjO5RbrfjZ3SXv+0hqushX1tm1+upvZdHk+yQL507BrAgsb9NYWWXgd1lu4
	Rcdal5FeXnpgFP7l+6u8iOmdMrlLiy6UqmdwTO4I4jJ2v8iNglfs3jniG+yPfsRuWYnFOEqceoG
	wnCUFEJJmF29B6tbvS292xCJ4Tqli0xm3dQG7JQavBbqkwqLPN4WK/PWRQyPUBBjRTSs9bNnoj2
	4fCgy/mava+XbDMA/LKFCUA==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562788137.2.1793020734852;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562727137.2.1793020734298;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3713290a12.28.2026.10.26.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:18:52 -0700 (PDT)
Message-ID: <343a80e4-8880-4faa-a60b-e3025f2ed40f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:18:50 +0100
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
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX8nVTOW2AJfW5
 QVORw38bbUhe1u9pBXn0eKh3oXsHwVvqwisCC537pkxjC/1CKPYo8y4D8cQmPEi4Y2uNcqVnNdi
 RKJTdKcmz5/LeNIotQU1qs3Ku1oOYDw=
X-Proofpoint-GUID: GC38h-j2mt6R4BheXJpuS91QH18mVr0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX2kmq1XbVZQ65
 TbZ8p7582oYOPzMl8mH/W9rQGpvhoseGLetNOhS3xz9aqdMji/iM3kAXRj6ljFaXrrtXLBbf+CL
 mL+X7+5Kd/rqkoGX1fOu9h6ONRmdD9K+n42fnT3IIFLiVCEYh17YoMl7XkS68VPMHnoRh290dK+
 OFaGl9GJvliTgE4mvM6+T9MKGy8r7ty2xQKoLvLNu1vCBqaXya6SouCyGM0qzvlVba8czU1yXxo
 UcLtIauRvzBGwoTRqt09OWXfrcxpR8Aaiz6dUhpVTh4q99oLWTzteC0HAzRDOdcN5VJ0GI5eOxF
 gGWF4apE3BYYISJRrXU21M3M8iEUJlUrN9q0BbSleLtB4Qa8xqeWgnzsIjgtEMzKVlY3Thrt7IP
 LC1wM6bNhXXu3yKaZG3ukoKcUsKrpNZcq9nvX6ZIXLZhAK4toiLDFdx+IMQZYH0t2V1q4Q/XnG0
 7idtW+z7AUi9L09kd2Q==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf5340 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=m6TPRz_fCz5u_OYVIq4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: GC38h-j2mt6R4BheXJpuS91QH18mVr0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
>> specific voltage rail levels to operate in-spec, but through the
>> separation and decentralization of clock and voltage votes, these
>> requirements are often not met and are never explicitly stated.
>> This results in clocks being undervolted, or at the very least a state
>> we're unable to reason about.
>>
>> The devices consuming these clocks very rarely have their own
>> requirements in that regard. (1)
>>
>> This series moves the frequency-power_domain-perf_state mappings inside
>> the clock drivers, ensuring a single, trusted source of truth is
>> established and that the silicon is no longer driven at out-of-spec
>> conditions.
>>
>> To illustrate the nuances involved, here's a couple examples of hidden
>> dependencies, as found on SM8650:
>> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>>   PLL it sources the signal from requires SVS (higher corner) to
>>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>>   requires SVS, but the PLL then requires SVS_L1.
>>   Analogous story for mvs1_clk.
>> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>>   requires SVS_L1 to produce that frequency.
>> * A number of camera clocks follow the same pattern.
>> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>>   of keeping MXC (a wholly different rail) at SVS_L1.
>>
>> There's a broad agreement that a consumer should only have to care
>> about the clock it consumes, and that configuring its parents is the
>> responsibility of the CCF. Requiring the consumers to care about the
>> above cases (as is the expectation today) is a clear violation of
>> that contract.
> 
> This is a fairly bold statement. Yes, the CCF's task is to make it as
> easy as possible for a consumer to enable, disable and set the rate of
> a clock, and I agree a consumer should not have to know what the
> parents of its clock need.
> 
> That does not make the framework responsible for it. Taken that far,
> the CCF would become a de facto platform coordinator, which it is not
> meant to be. The clock driver knows what its clocks need; the framework
> should give it the hooks to act at the right time, and stop there.

I think we are more or less in agreement - especially since this
paragraph of the cover letter is not really faithful to the 
implementation (since the ACTUAL voting ends up in clk-dvfs.c, so
essentially a driver and not the framework).

> When coordination is needed across devices, there are dedicated
> frameworks for it, like OPP and genpd.

Right, in the specific Qualcomm case we heavily utilize all of them.
For the problem I'm trying to solve, the clock controller is the
"reason for the problems", so its driver gets to carry the heavy
wait

Konrad

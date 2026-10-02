Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73237444706
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927265; cv=none; b=l5aaiMbm9M3MHTvM5r5RXdM9h+7kleXRWE6Qog4Dd9Ev0ncMAAiC+ViWuymeNwiHiTempW6h27La9Ou0joeVgqKwH4tirLFa/+ArNJVHxYBMPoys+kYr9Xo0Z57ozSzC7sOe+WH9yzLROhaKRiBD2weeoinEedOtTOX9+pnlblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927265; c=relaxed/simple;
	bh=GsiBeouX/gtaMf4zOeo+rrTtK4Uq5wqLAWhlg0LU0nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbs/6fsA3FNFla1z8Ivib1UBPwoIEFjokgjfbz0KEVbfZTSVjndwUDiJ+4ncHnwaBfVeNqwCXpu9T3sxxQCh3QvjrawSSoBpUXXPz8vLxDTlBGT1UBRyPthdFdYCiDLYU8EmJ0u7VNwPveKjrfBRfIIN7E8uPd6TK5i+jWw9MGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLCHH9ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXifZL0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLCHH9ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXifZL0y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925iq3Q671543
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=koV6fU0fBroPWgISEdPaMuGQ
	L0eL41QYrOdoT4EtC4U=; b=cLCHH9jiXbsSGmJ+tqO9aDNUTBNApEwWtKKes23z
	sPBxgFVeLXGN4ueIFrGFXakHGUflp9yq2+7fm1ktVfD6LArlcXfLmHuCxmcdkkCT
	D/WVc//7fa5pibXdEyoWnR7CWLFICLA/BY4F76o6T6gl8KifANcjwZ6Pw9S0PWKP
	EEMaPqbszLMf2rS95XltMTtP8lwpcGgKlr7z0mc2wcfN8EWp+dtqobSrfX1oOzVW
	o8u/unPL/QlRx8FVT4uQWNS9qTnDFieviRbc/uBesDPZ3bonBGn3POFCPxZsg3ZT
	YNVThu6zCo+P4cgSY3ILopBFhCH1qkBMfl8ypq2ILV+KoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tj4nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:47:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so141585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927261; x=1791532061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=UXifZL0yeFI3n06Jy/5MUP4vbqsJbnSTA/MbsdNNYWLRsMANKmg+okhgbJVHWQDWnl
         0FePA5N2RnO2LVPefLs6a7x/JNd+WQfubY55wD19RQ9N0L84BQmvGy/G+1g85ATNwKbw
         W9hpxBFLNJEwyzEoCS1Q7KEwHNVdTfDDQRWT9ZM26eexdU4E+WMcw6/6DtEocVtbAZxU
         MXo4tCQucvWpxbA11VMN4PwyGdLnuMHvBuAlkzSNhITtOrZK8MM7z4Y2Euc93Bn4wwND
         uys174Ee9tc5pAIHnO+be4uJ8iHpZrNElcGZXeieezbQuAilCYCZd1hzUBewQIs5+489
         E7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927261; x=1791532061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=Cqxjma/m9BZFUHCyTd/p4qQCrIMg1rEOOqoYiBH0C/ied7ksCfl4iaZSHIji0z7Sya
         yScGIhIeIVgqUbvpA3yOPNPsQZEUWMw4HOsITpo8htGuUtZGNWgf4/PpOcF8aig02zwz
         1JxIBpY3/6MWye8xbC5plVtaH/NgmhsW3juaMsqO1XTXrNn09mxwpdw7EhMACnVhOaTw
         3SgbkTyc3ccfv5Hjey2AcvpGEjopt1iQe2cRrPQGbyn++MUY2ipXhDhGYLn3gKkCi6jU
         R84CnnAW5pigqhB0ymFjEnGrrc6/DhGmTWpbKO0P2YWQQlB/0bm4AdbJfHxqI+rHlCIU
         afCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmRRpakEyJ4dfX0eB2dGpBio7FBsYDQ2F+anFTV068NncTCUEoTfKNvy96ru27ZaRZHXBgszU3FtbqrDs=@vger.kernel.org
X-Gm-Message-State: AFuF++kwtNw1M5cWPkpnFHNK4G8ZWUw3/E809h5bb0xjhdmKlGoZvFv6
	n47nbmX96jw/MZVQk1ccUAx9xIyzMJ8wmhLJ+/bYNQvIdXD1KHtkBtKclQLj2zwBrfXxZIBRds6
	tjWHEkjj+Jw4Jr5IfwpW72+844SOMwCz7GQa8N2jZFmRR/jvskZ0sOt2PdDKrgtMlKI0=
X-Gm-Gg: AYBFou1j6cZ9BNy4hxsvj0KRTlQa4CxVhF3eU5BjSH6Q/oqOrl+usfhJwi+mK5D3U8n
	XFXGu+XPcnJyjupI3qBjZL1o/y3Kfo8Gy7lYxNC7piOBc5agG63G+qZe8AF5htjouXkAZCAee7Y
	p0Jj2vgOQNMvW8vWbb+z/sULgDbcTrnPGGgqXRXIUKMHdwuNEYJariNJpluQLsmVBaV0mBPJzqI
	WF1zNN8Q1h0MlXiXdJDQoQm05Ekkg2dnrGPRoVDJ4duGx7nXq7YvAdnFFvueSoUX4rDhbrw/qca
	xHA7KsK+haBtRyea3N1lmUIhOCG+nhsfkKu8UQEtkBHhiMAOI37GjjmvEc9d/6ewvZCqZ3UaiBg
	GSn3HsIsfZ8ZgyfqV+bQl
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312522085a.8.1790927261401;
        Fri, 02 Oct 2026 00:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312517585a.8.1790927260779;
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm59554805e9.14.2026.10.02.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:47:37 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v14 2/6] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
Message-ID: <ar9e9-xnxO8rbJk0@mai.linaro.org>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
X-Proofpoint-GUID: 8Drnu-Vw0cQiMzK_L1_c6FyB-6GvWmDP
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf619e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pD7qEO7pPVLmAv5tJawA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX3/JONw4ujtXx
 bH7UevlFixmN5RJuTdayq39Fhq9GpBRXIZIGqj0IMDS4whYbTA2IZ3kXOSivOYX6gar1wQWQUFP
 V+x8u2Hb+U6oU/G7osofN5U3RLRxLO2u7Mt+hKYdvWPn4M/0kcqECVrqh9HjJcHEX56ooo53rus
 yolKmtFjMmH+d60k8XNvusmZBVSpvanAWU35+hCkMj51tS9ZY57VktQFM59ynpkwcG+9gE76BTv
 okSkrpIpKsxBWU4c3D10s67rw7w/JbyIvFDcObE62MOl9yKsZsHk5aM5TcpDJwvi+BOu76In4US
 V4d1L3XlqNaR5rn0x6Cyu/goCDXR9PD00cKRs0ZFqLinzSqAhLWTb1BfZ2aZsaFardIhKIcga4r
 t8GM71Z6kOZnDlEbV5qy/GmJuzUK0uZVno/BopT2UXFrt+VFup8cYyemdlZPlua6MUZ9XDEFa3v
 r87bDl0aVZynYGNdo+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX/ABQc+Gc0+QJ
 GZ5ZCs/6Ryi6XP+qxI1QDmh+7urf7GzfNLH4G9Znw/ugMKE+HUXqY4QIwAcG7Pzq6cTfpY35Nv8
 IP9OBkvxrsSxVAWh4RFM/CT26eggXgY=
X-Proofpoint-ORIG-GUID: 8Drnu-Vw0cQiMzK_L1_c6FyB-6GvWmDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020030

On Mon, Sep 21, 2026 at 11:14:17PM +0530, Faruque Ansari wrote:

[ ... ]

> +/**
> + * enum psc_reason - Enumerates reasons for power state changes.
> + *
> + * This enum defines various reasons why a system might transition into a
> + * shutdown, reboot, or kexec state. While originally intended for hardware
> + * protection events, `psc_reason` can be extended to track other system
> + * transitions, such as controlled reboots triggered by software or
> + * maintenance operations.
> + *
> + * The values in this enumeration provide structured and standardized
> + * identifiers that replace free-form string descriptions. They are designed
> + * to be stored efficiently, making them suitable for use in environments
> + * with limited storage, such as battery-backed RTC registers, non-volatile
> + * memory, or bootloader communication mechanisms.
> + *
> + * Importantly, the order of these values **must remain stable**, as
> + * bootloaders, user-space tools, or post-mortem investigation utilities
> + * may rely on their numerical representation for consistent behavior.
> + *
> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
> + *	This value serves as a default when no explicit cause is recorded.
> + *
> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
> + *      dropping below a safe threshold. This helps prevent instability or
> + *      corruption caused by insufficient power.
> + *
> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
> + *      which may indicate a short circuit, an overloaded power rail, or other
> + *      hardware faults requiring immediate action.
> + *
> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
> + *      improper power delivery. This may be due to internal component failure,
> + *      transient conditions, or external load issues requiring mitigation.
> + *
> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
> + *	conditions. This attempts to prevent hardware damage when temperature
> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
> + *	components.
> + *
> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
> + *	panic. The EC is a microcontroller responsible for low-level system
> + *	management, including power sequencing, thermal control, and battery
> + *	management. An EC panic may indicate critical firmware issues, power
> + *	management errors, or an unrecoverable hardware fault requiring
> + *	immediate response.
> + *
> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
> + *	value is useful for range checking and potential future extensions
> + *	while maintaining compatibility.
> + */
> +enum psc_reason {
> +	PSCR_UNKNOWN,
> +	PSCR_UNDER_VOLTAGE,
> +	PSCR_OVER_CURRENT,
> +	PSCR_REGULATOR_FAILURE,
> +	PSCR_OVER_TEMPERATURE,
> +	PSCR_EC_PANIC,
> +
> +	/* Number of reasons */
> +	PSCR_REASON_COUNT,
> +};
> +
> +#define PSCR_MAX_REASON	(PSCR_REASON_COUNT - 1)

May be I missed it but where is PSCR_MAX_REASON used in this series?

[ ... ]

> +/**
> + * psc_reason_to_str - Converts a power state change reason enum to a string.
> + * @reason: The `psc_reason` enum value to be converted.
> + *
> + * This function provides a human-readable string representation of the power
> + * state change reason, making it easier to interpret logs and debug messages.
> + *
> + * Return:
> + * - A string corresponding to the given `psc_reason` value.
> + * - `"Invalid"` if the value is not recognized.
> + */
> +const char *psc_reason_to_str(enum psc_reason reason)
> +{
> +	if (reason < 0 || reason >= PSCR_REASON_COUNT)
> +		return "Invalid";

s/Invalid/Invalid reason/

[ ... ]

With that fixed you can add:

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

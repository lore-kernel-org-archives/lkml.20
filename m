Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05AD4DBD8E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858604; cv=none; b=h6GitsAkJ1nYBkthq4ANlmEFG4t/ZBf9tShTIjsPduHYLJAyCYzn722uMaS6Q0nVejJ+aU8ghnOOyCxadi73Exn6/YmH2Z8DmogXlKxl9mhkI3gh/hccwGaaclQTnQBs2Gi0562xwqfYwpMS9JN3V5cvVHfh3HCrNRiBSz7oVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858604; c=relaxed/simple;
	bh=0lbcg30VfbDEHabWYRQfygaolUEEcg4i8tSmHoWaMJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPsX9Sr++2XFts+c9nPxaRcQr1/MzzRqKJdP5XMtSjdLw8+Hw4eRsjQfx4oGJwCx0Pmp56+sbctVnmib0ScwJGSY2Z2tnGVjacuCEmElAqT/5TwB/YFra1kPimwC+T4DPL9My++uC6MssAJ0bPYohj2PjvHbidYNpZJJbZ3rDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdV7IlSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAroz1Ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdV7IlSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAroz1Ek"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LsGS2502535
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=; b=PdV7IlSwPCmo0l4S
	lwhkgzdU3x4ysNJvqdFp8ZbOspWe8r80dj7MrHr6TaZbNkgj5X6/0b6/B9P2P7Wy
	JCxZwq6i//pyAUmYGFQZcfAwINc3XEshKOs5BMvqY2u9c2RpBBsnzJ6APCU/06ye
	hUiaEt1wabfdgIeSq0XP/0pj66yCNo/Hjkn63K688GteAgfDsn4fcN8GR6l1BF1n
	MH+FVmoKYyHdYAh87Wtmvkd2t5pmbJiviAz8D0DJb8Gbm6MYaKbY0lcxV0kBY57F
	dF5w56mxtP3d/x8ZmDqMtbObgJV/27+CSMzagfKN9w0GGKzLEK3WKT7norFpyvfP
	FapYPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7gr8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:10:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso578128185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788858601; x=1789463401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=;
        b=TAroz1EkcpBHufYIBoFetkWySIia7GRa9JfnjM/n/vyfY5DQQmWZ5iUWXDfFEOVnNp
         RYmWTDv+LDSpwxj4vkBhMX2wYaOGsNWQU2mWYz/DWY4lNRDUEmQrGRrABy7IXkKLZMx9
         cvtccGkkDU5vm2TD3cZVRjzWpMj8kZrvwpk+mvV6jAmOPx0J3F8j8WF0Gk62y2PVQy2f
         MS58fG2Zy7H0n84crCSOSQ0nK2AjmEOF0EHLPPZUnyFTeUSsNghFRFhsNzivZ4oIM18i
         wf4bfInKABeHCPZPYCicuBqzKZ/dzn8voyDeBTKjhCCkwTMnuCRFlLGLmp9dwR5owGJa
         i5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858601; x=1789463401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=;
        b=nnVE389ArT9LoNTUIr2LxAAD4LDdMybJNg8v77V5zniovR4yaV9N9VjARjjMpIEjz2
         jBJ5Zjltm642ch8nzZckhCA8tPIcsHjy1pBmS+A1gEtiepTfZupM6EyP/wmnuDmxXD+f
         rgy/8TXAS14kHoU4n8Bv1EbYbJdaoTgQI8GCzQJ4i28QylgnFQtYBUNS+bAj2nknv682
         L3QoUnch2e00sUAP1J/GLmH49ceyQTV9LtKb2qfEC0E6JtxA21q/e8d8oFq5ZJiNvv3p
         UQh3w6sQVu0RZqNYFYo52aRgAWJ4Y3Mt/p3EWyuWB3AlF3vtE9oZ9MCVbtNPNkeATYfu
         nh+A==
X-Forwarded-Encrypted: i=1; AKwUvBzrneatWjyWGwt3HkQtvccTS4rYoyAxfg8n9v+Uv/bocDQnjgSDEfFHKkwnW2pvc8Xv/PrHpQG86eLwbYY=@vger.kernel.org
X-Gm-Message-State: AFuF++kS5fuu/rZR3cn2z9m/Fe732hTD8XtzmCkcgG4t3m0KSAITLoRK
	uCDVVl3DZ8EzsY8LuqwDBpNInmNpp7sMo6caWtg4CeRReo0SP6oXB2FlZifzJ8X9KKHTuxH38ow
	iWPWG0OhYzj15ElnxfvvRHaWybGxRyCuwIsNjS807VtM3xoiO0JQJ2+cDXIbIiVYi9dk=
X-Gm-Gg: AYBFou317XEMtqjWgBW0gwnRYDAz8QWZFWD9Kp5xY6eZ7K7M27BNSE8b4a3E0cjjcIG
	wMmLtdGNCQ4iiFawoeTveDJqd35IS5ELBsdqPOJYDKSet0o1ylRXycTPGAfpOilYM3XNO65V435
	lvihUw/3dGMk8H4zcgI4ILAADksLnLSM4GWRU/wTcH1YIepFMVw1O8PZEHl6FMCPs94QSzVGmu6
	NZnut25aVdM7+7XN761xC/z2eK17cnbit6cKXbNBjngoqyozNEkOC7Nc67bm6XYB18wJgDjxBM/
	fbQ3BS9qjgXSVOWFdNO2dy+EpLU0uKkm0dyuIiGSomrHQFERGl3mE1N4L9yOgOm6zIRfFKWdN6k
	pfsM4Sc+YNXf/ZYD3BSvGUvLXb90=
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2996919885a.36.1788858601047;
        Tue, 08 Sep 2026 02:10:01 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2996914585a.36.1788858600581;
        Tue, 08 Sep 2026 02:10:00 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm523030366b.4.2026.09.08.02.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:09:59 -0700 (PDT)
Message-ID: <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:09:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fd0e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RmElXddC3YRLYRTwZzMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5NSBTYWx0ZWRfX0/IMKPVfOQmk
 CAXSSI805o+VKlQ/ni/ZWDIHhqvgqppndqzPmsdgc5XC7VT0/3zbESDJB/4PWXKIfRDUuzcZUIF
 QAM/EsRJYXOnooWN4RuxQlrf2FXFsZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5NSBTYWx0ZWRfX2OqCjpzQmb0Z
 ky3Wens7h5oD8ku+TJSt+3p1+5YINETRNUf3hqzPx0d0RH/wE+6NPvcTjveEV3G6FrXFu9+zagI
 ER58yrfQPAUwZewGVUT8lRqw96jTADvoOxL1nauasSIWN/ZNPvLsNDkKlStrxEj5c4YczEtu4Au
 xzJGvev76CFx0TFV+pDgFxVHsfksPwWkp3+iXxrsOnqhg0Sgl9GHBnBnwqzNZ6+EGr5a1bqJI6Z
 vTxoSLr7CkN3km9jIPF5NHKxa3Z3lN9HhVTarbmdpG66JNP0ZRw5LXlL2E0eZTdJ6KH41k3jojR
 tRLyvOJhZbFYig34OXOnLUPSXql+Z3F8dw38URutbduLd2mqp0qLTSdwTmkrVBCEQkx27r8gndL
 oaeZJr5bvsLRwMvjn038f9qmu/Do7QNvoJt5D5VJY2Bp46DTsrhYna4aOgQ6i/k/XoO/bQgf039
 KITkPy3a8eRFtlZpzhQ==
X-Proofpoint-ORIG-GUID: 337rFyo8q3AMO37hHdFanGFwZ_-NG8nd
X-Proofpoint-GUID: 337rFyo8q3AMO37hHdFanGFwZ_-NG8nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080095

On 9/8/26 9:49 AM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>> My take is that rather than encode all properties in C, it's probably
>>> worth exploring a DT representation of the concepts that *can* be used
>>> fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.
>>
>> I agree a DT expression of the *concepts*  not a literal DisCo
>> mirror would be a better A.  I want to bring that back to LPC 2026
>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>> feedback rather than re-litigating it inline on this series.  Because
>> B stays put, switching A later is a change inside populate_function,
>> not an ABI break. so landing this series does not close the door on
>> the representation you're asking for.
> 
> I am still not sure I really see what the value is in a
> completely different DT representation of the DisCo information,
> all it does is give us potential issues with future spec versions
> and create a whole bunch of new code than needs maintained. The
> ACPI representation translates perfectly well to DT, should work
> perfectly fine using the existing code.

I totally agree with both of your comments, there is no way we can
replicate MiPi spec into an different DT representation, this brings
both maintenance overhead and is fragile. This a very big effort.

Either we represent full ACPI into DT or use some know representation
that linux understands and is maintained along with ACPI which is the C
structure.

> 
> However, that said if people want to work on doing so I am not
> going to stand in the way. It does have the advantage it might
> unblock things with the DT maintainers, since we can focus on
> doing stuff in a more traditional DT style.

This is really going to be a very very long shot, but as of today the
need for this is slim, unless we see some platforms which have SDCA
compliant codecs without a reference ACPI fw entires.

> 
> I would also agree that this is reasonable as a half way house,
> it seems like a good fallback mechanism to have for emergency
> work arounds as well. If we can't reuse the existing parser then
> there is a lot of work to define a new representation for DT.
+1

> Ideally that would be worked through with the MIPI group as well
> to avoid future specs causing catastrophic issues. But all that
> will take significant time so we probably need an interim
> solution.
> 

--srini
> Thanks,
> Charles


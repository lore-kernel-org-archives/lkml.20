Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738397;
	b=S6geFF6HqXa4S193HlJOgdD/Wl+JoZjOLL+Q0xX70IU/0j4TTlsEYKq1Ql+ycE1ZI7RT
	 qMMTfFDOFzMalpCO/THQO7RNY/vXc5MvwWLNh3n+2islA7mAjaDpghoM957BvZS8qg0En
	 OssOb2IQKLmKqlVz1GA0InFoAALpc95O/tl/oOi8wCMmWZUxq9nnjpyOgiY91GhE2Z4lo
	 xjRX5z90eiDLdHIWwPRzLUNAgcSQ/57X4D78ys/bKFWZ3oO/jOD04XxEwsXIc2cxC18Vw
	 AeAmFUAjbEPLe7irb95ujd5neiNDKMuNiRTPkp665zQAEp/AyqfOUXzIlKRN7TcvcVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
	b=dXgLwsFzD3UPRoIIEPO9COFCFkvoH/1W6Wiwpb0ub//ghrPRy4HnhaduvwkcCvbvDWJK
	 BL7Io/gutmkhjtSWKUG/Zw9YBVmr53QJUpiGc2skk6S0LGAKqrMlfnSI0sjYV8CzojmMo
	 fVec+qiiyAobYfwltgALbJI+jmOz8zJ6HXxgxcn0jYioHgWr/PlD+1QpY0tYdCYocsZ06
	 QQK/mVMiFNOyT+5Dhnwic/aqyircekgFnA8XhEnL6dWZNMKPRe6qk56KGtebyiNYT9gjx
	 VFmjQvG7EHTMppY1+/ce6GCWvjK+gYTNKTYJdWNb0QLmlQv0kpq4xttNLThqRM3t6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC3606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w62i1763368
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=; b=IqoDqfmEfPlYsN+B
	QEw2OGiWzGO6Uo75ZYhHyuJ5NL11ec4jlA7Qe001Urb1gDLHLezi9dHFICd1qd3L
	ZyIBv/Wb2zJq5wvzTwZJszEeHuQwnP0YF82pwn+42eTIbpiVwMBmqzNePE6kw9va
	IVK2dM5DttPCPOrCJOiZqJ0mSu8NWC03tx2i1IrVhiQEEkZPUWJ4i63OSCZMfez4
	kcV3rjTlkthPsgP/7fOuFHE/My4nC9XAI5QB348KfzFEKKP8v0OeVKhUpZDITPjl
	KDEVJGGh9aN0ngz7aPnP3vtIRNg/hwkF7oRaH7weEYXIAAauGAvTwCN7uLi6ZAnV
	TpEw/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqjv2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:26:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso206044185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794738395; x=1795343195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=PURHWbpHKaBvXQW4MqaEOmHAHPg5gQlLrp+tgRZ6U7JKl0vjTIbGvTHpeyiIsgUDkg
         ofyQTrVSPAXRjsVtticUqSlyfCkJEBHR6FtbCYXzOjk1/kknlco5kSBqirh+Dp+dmMkN
         5XTk84nWzZ1DjYSsT6AR4giaYj+qY0IvngZJI1aXar85gjwCn8B+2IDO757gLeIuOOt3
         qT1mxIBu/UQhHLDyn1XFHTdRnaA/zD4jkk87OBIdmhR3alpJk4EPIXWvKV4h6rhvwv/1
         sd/ZIBPakNcbsHFgJZcGJAJoh/9/+gEXqR5jbWBsEiburK/6rSfbxFE06RwhNVxt7rns
         wtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738395; x=1795343195;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=RcmhzJF60edEdqU/CxGjpT/qLnWkKV4IWRXcg7rf1ws+03QRkOdrv51Hn/dv5ZuQBw
         WN39FbjDbI7xBRVsS2huaRqlSLsBop7J1uedjEDRFlf+OyVuZ2WPa09oboNto5fpCXk1
         bOoY/J6FE+K0DD8MMrF3U59EtPq2byGSHKaK2AYCybGhIiI53cYVC9CyB7p3un+q69yh
         igHFNC3CF/Pwus+QyAck7+PY3VnndotkpyhgqeB5TvTTfFW+WsODFKOufH2+qRpTeNdK
         Ri+Ctcs0uqrTYBhzcifJ+P1F0pOyKN1vUAXVn1/OY70g7NcWX+dX0Ni7FC9cVnOhWhn+
         vH7A==
X-Forwarded-Encrypted: i=1; AL+hErFvzD7QBKH9aNz/Mz6w2A3W7l+ZVkL0FtAPSUl+zaAxClr/EWkRuSOd6SMXB1hAViFf2mD2ozCUMStBXoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3/q3f9BWEsuzvsfETpdLy9+09RPeqvzpow8vZ1dwGaBnQui82
	9Y7bSX3gskLqkD+buM34MnNwvO25Rxf0C56c8NPJOoPumtwE+LqgmrsVP9u3fmCKd/phz1Hfcfn
	raLz++//I+Gl9maDRZ3/oag/NokzfQqTr3pWrG3u42wrDHwO0557S1mXxiE6VJFOCrJU=
X-Gm-Gg: AYBFou2EfW6CBXmTL+yc5B6wq/epMzT9Sis9/ZAEiS9/S0vmlJJ0uWycYiL1Iyq90zA
	Xi2auEUIdRqioFdbROLTlp5lNPfqONCphTzGZeAoQR8L9emgfE30Mdw/VXxJOpRi5IOkfnqPotC
	LADjQXbL+kXqCqLiB7yJRbYzsiaAtfIDM6sqsuUAZrEAZYeTlieZ4YFv3eGEcp2+MTldC8jbh+P
	4ZqyPvkSHzja0SgkoavPrN6q/XWbvJMFPqBkWIU/MVMWzz/7h5x79CoA0dLFpWRqtnFx5PPc4+n
	LtVY4XdcWP3AJ+LdE6UdLHaEkKeFm99x8xAmyj8U3L++SalCH13+R1SBMeD+gyB3GU8P3sSefLa
	KMCfYChPGDOzPLc0ema5vBXFH1lO5LdSFl7BgLw35i33zshwwWSPM4W5jigPqVmAwn0IHUEEikL
	k08dn+V+GW3mpcqSoIEQ==
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257649685a.39.1794738395320;
        Sun, 15 Nov 2026 02:26:35 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257647385a.39.1794738394911;
        Sun, 15 Nov 2026 02:26:34 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b236e0sm297753666b.20.2026.11.15.02.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:26:33 -0800 (PST)
Message-ID: <c97bfa2a-4f38-4a59-905f-a590dd018594@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:26:05 +0000
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
Subject: Re: [PATCH] ASoC: qcom: common: report line-out plugs on the
 Headphone Jack pin
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af988db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KsNVwHy3fz-HUrcVWHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfX4slKyByaY1No
 ENQ0IPwpL+p6gii3YPjr73V1ZkbyZC/wCPMrRQkZcnKW66y5dQ6vDQnNQGf7mdWffPRQ/g1toU7
 5DXcVUa2MeXudAnxDmJCTIWaR9uWsIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfXzzcDBwiXBBvT
 RzgGgT+yJJxJKqYje8eMNN5U5oal5+wTby/8enSkNDsv4sXXFMxO/aBMCQX2A3bOf8KPC1VsT0a
 1coNnoTPH4VkVmXhQBZlRheoZwkI/Dfrwef0pqaH94uIfV/nG3Vyn9q6W93ziSG20TS/tePWVny
 w5BIV7jX2ORNOpjGhRgDU4Y1cmJeTC286aUWiNlmShPotJ9LWjrc5E/3fnmde4ocyj8ivXLe+D0
 2u5q3ndjdZUx4YHjGWXIVDQlbe7HBcS+KAabl1KMli1ptSPUnjwcgQvngAwkUuEcFtiSP+3F0Jh
 tR4IFWxm9jGRBINF5n/WSLQNg2A2VY7HAimAmfjc+Ea2xbUDQeSS9W8pmT4cHD58eNF9gm0bb6e
 95iDvGuMrdHT0m+6b77epbkp0POwZn0gF3ZxADq+OiR7TTw1QtAzLuIo/7Ok9CYlgHp/vtgGkdM
 3kszdDPuawvOhsMrf8A==
X-Proofpoint-GUID: bdGizhUM3LaGVuEz3A396WqQ_is6xouR
X-Proofpoint-ORIG-GUID: bdGizhUM3LaGVuEz3A396WqQ_is6xouR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150041

On 11/13/26 9:45 PM, Ingo A. Kubbilun wrote:
> The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
> on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
> "Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
> control stayed off and userspace (UCM JackControl) never switched to
> the headphone output for those loads.
> 
> Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
> speakers measured at ~20 kOhm per channel were reported as LINEOUT only.
> 
> Developed with the help of an AI coding assistant (Anthropic Claude),
> which drafted the changes from the Windows ACPI tables, existing device
> trees and test logs; reviewed, built and tested on the device by the
> submitter.
> 
> Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
> ---
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/qcom/common.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 5dc954dc1cb2..af5cacddf67d 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
>  	},
>  	{
>  		.pin = "Headphone Jack",
> -		.mask = SND_JACK_HEADPHONE,
> +		/*
> +		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
> +		 * e.g. active speakers; treat them like headphones for routing.
> +		 */
> +		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
>  	},
>  };
>  


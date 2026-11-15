Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776645;
	b=1h9ES2DldApLGQPu+KxfSTCz6I4i+zZs0jCizben6ydnqeuSetegRcWlV+E4qr1liOmG
	 h2nh5IaL6cvjLzy1lu+gF9emlPkTn+qUk5tqrwNU6/rgQ2xPkRC4dQZ/cbXxPlUvO1swF
	 SbY0FIibVaf/bVQzV95KEpDwO1aOAITwCsanM0wJpSe5vG6I/SMh3ZtKdW1bycweKoxKX
	 26vUZnmmVd8PSh6OgXpvsoP9RPa2xLSC+sgE/5v34S7q01/9/4iYhwo1pwaIxnpCIIcrk
	 oVoUrwKcy0Mvkhv2FWrGW45vxOQG0Hi93oF97SZ57P5PneLk+g2LQWHoaaqPXza5cqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
	b=1xk0wUclzw08edsVnlT6GcmT8TdELdP+9NRW3UJCYPUC4snWckoeauofcEKIhslQm6Cq
	 itWC6mO8ClLNwF9qETbMZHvN6TUGHRX+Ay5yTUv2fp2uPWtx50PZammnzsKFiXc8SxLMi
	 +QESqpT1KDRzRbzHP/Fp9W2rjSL6ZokWIGgNxbJ8EWBHxJ0rBl/QBwmPdu1G9ajDVzXfI
	 xrOfSBU8CenIQYn2SGVrrErI6zIbfhhKEgnj871ETXfJboOWK0go4Fs83pV9L/SfRwdOI
	 ieXr08MmX3VXQss2Pvy1IyQXL+1zrx2XAaATHmve290w9DEUM+VLCC+JTzzUtgFl11w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB61606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB61606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRgkH1814425
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=; b=kIyRG5j3dYGOflKz
	T/SJjWzn5BO2NwkWRAPPvcI0paR3tQ9SoO8w2rMVBEPh9gXicFfLqYUkBQdAFUzA
	PjoZQyi9pWqdZ7ia2WQz1JhlYRHQ+d33XHAwCMsfGVg7F50wmOog7dZCe9kBiW+Y
	bBzkCiBFrzx+DfWdPAfM2x00H3xt7TeuQEw+kTG4G9aYI2QDg55JCMAjS2dJ1aQT
	xegBQ8GmK6ZU6lE0+7clSV+lrcXh1XiEhwyqXyR1UTaqUPx5400lLNRZid0ghgn+
	SS7fedKzqVIfQk67OkECg8QBxcZmna/0977iJHgUNhwBsdKDhUyZgVFstZnzgnp3
	cThh8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcbqpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e0e6de971so89508241.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776642; x=1795381442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=GlSIT8gEX9eSZ261jD8Sq5nbIIktFnSK6z/TuF7GqMC5uazBU+Ptgq2LFTCTb9Wc1b
         QJh09bCMizRBBvBlgA56m7pl7Kj6mLuXR79F23T87wIesd86pSyozl3f8eG/maAKvDHo
         aFPb7PgkbH3i7WuN484k+QxqB55RsfPmh5p2gI6cWZfb6j49Kx4Mtlru0ubC+KT6Fhcs
         K9e8VoPf88HhUjzYvDKgsYzCtrEgDhOWI+/ue/vMWh6lK2y7v8eAMwsxsnvT85dXl+08
         fCyYMjPYoy9/whx9kNPO5hNiawDJXz8trH954TGXw3mhMXgkEad4htegWnrFPRHvNoc1
         iL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776642; x=1795381442;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=iJ5zPqMSoK5KlnVqrZuYD+SmhSeeoZZ1v1fOBUnR0H8fRvH+UuuuSYs0dzYgvapfKE
         fJ2VqBuBMDspagxjv1CxcF69qP5kHc4UhOXeusAYlLBRR1HUep7G/bdyyW9cC+jVZYh6
         WqfZnoPG+PLfSVMzYX73HnlLnJcrGQYZtX5Oh9PmrY3glNzXoqR+tJPBTdvC9Q9fK6Uw
         X3VoMWPyI7qeqGOYsjZIo7R4FNrP0+ZjbPbvMdic6N0V9/HYzhqQV/lDBYKtoyZwaX14
         N0M6ZXt96y+JtDVSZmZg9ivMJPbQwVY46OfAIHgac40AiOyP99KbZEvp2weH8QSY8Mgd
         6lkg==
X-Forwarded-Encrypted: i=1; AL+hErFBtSviYKtqtaGKj7wO6mwhbOyy8ymv6EqdH7YQ8hr9SOmB0stdq8y51XtaQEjNoj91JMmqzGjvPQnsvB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ji58RRgCBsoR90wpkUD1wVqB8SI8Y4d1eqG8hqF6eLDU0Q3tR
	BYRv+Fd8002OInmSCpw5RuFash4mt/jfnMa64/Gc0zkGS2SGJhsT/8YoUmgw+6reRzZG+wigAC1
	2BdhjBtRCRjJ5c8yb1HgsrD2XpwxTpTZWsPnayQGEMCYLWQLBzW5ZG9EyhBn+IGTzIqPc1L0/2O
	jBnA==
X-Gm-Gg: AYBFou3XQIEmVuGk0vZ7KFyeVtPl69ftSsdMDS5s1HLoFri3TedCn2m7L1oiZDk6Ba8
	IBlE8M/GwT8szj1/Kc2q5WbfSAFwCIyErOS1T8+X+f6rMqDTn55Jku+yp889y5kwQkBdbBaZFwb
	x69eaNttZwMHHtSzfWWgAYqgudhdvCP6D7dn3YvnCDNMEi5UY5WZT+D/Q7Dwl6B1P41pXBGpqns
	yJjvzYLVd3m9V3yh+EIFFBNkGj9ZUSh8jIEjLMBpTdEi1geZoOH1ws0Z2IMhC3xRO1VGdBAOlYI
	IDHSq5CbFYkkyhT+3TLiCAaI8lZG5ita3tw0I770RTkFBmdEXCM4riecppUQ52atCIrWD6SyXjQ
	zKbxEDUoHi/2neoNOOQ5Ov8xsvOKPUjWmTLzD7pjEOkLYhpyLhve6GDZOIOiVuoZuBJukB4joap
	ch
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317677137.14.1794776642151;
        Sun, 15 Nov 2026 13:04:02 -0800 (PST)
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317658137.14.1794776641568;
        Sun, 15 Nov 2026 13:04:01 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:00 -0800 (PST)
Message-ID: <c86bb364-0a7f-4c7f-8ace-586f5aa85adc@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:59 +0000
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.10822957842494469444.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.10822957842494469444.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX+YC6JVpQLO6P
 bKYXt7K5Hnn6goHIBMQcfSC2zhDw+IwHFX3T5xh2rSqdHa24rZvc0QCeY4+7XUG6Jk5V0CLNvqC
 7X9zTDKYPz4Jb1aOxbZVXvEhMXmxAuQ=
X-Proofpoint-ORIG-GUID: 1gbwDwF_4WpyxAieWfH2Pm9HVHmqPHxz
X-Proofpoint-GUID: 1gbwDwF_4WpyxAieWfH2Pm9HVHmqPHxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3o3YF7jjEemu
 RXPvb07LpiN8c7yaGz/L17R7wr/arVdDu6jbG7LkVAGEBxIZ5PoHuleAKrKYUhtTCogfVdxS3Lj
 MS26uHW4IAPQB/BYbYg4PvBsMYhoWMK6L5WyLQ8hpGVf6YvmSDaB7AfPWt7WfxIxc59mIeWrGvf
 O9itzBpkRTjXRoCZuQpK14AXR4qJBKASP2XhAaFMK8lW3SGncQTYtqwG8xhDzEfBV8LySP5zyLX
 RT+wcOQwei9ZMFhdx1OBDg+UDc8Kn1R3TVHJ3S494ge+15dSDknxE7DyRkHRIQXTsleQvNMuNVn
 f3/SYidPYufI12Q4pm0nM2Y1dQazpL3te5RgAXNdE6aoAYlbIAq+AN3A89C0e8oknfs+qpFUZ2O
 6N6/PqKZFYHtZKiBpTZxbQ18seVAOJnulqpqXLmzUNE9TdKd1GXA6fWqif386J/Xs6wau03IOgq
 KSch/CFaq8H7se7RedQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa1e43 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=I4NBp-wbhaHMoEEwmPUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> The VI sense port carries the voltage and current sense data that DSP
>> speaker protection needs, but it is described as a sink port next to
>> the playback ports and has no DAI, so nothing can capture from it.
> 
>> Make it a source port with its own capture DAI, ops and stream runtime,
>> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
>> searches the sink port properties by count, so pack that array densely
>> now that VI sense is no longer in it.
> 
>> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>>  
>> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> The VI DAI has it's own ops so it could just have it's own hw_free()
> which would be a bit less fragile/surprising.
Agreed, will spin that in v2.

--srini
> 


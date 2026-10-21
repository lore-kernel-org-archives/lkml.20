Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579156;
	b=nqesxoeG8iPNKcUOFqrRnfODQ026U372+RkgEKWdvFBOWQcfBPAtc4cEx+qng4Uk21fT
	 iYh8uqo9jTFto2ZS0qFm2oQQultyTeJ/Iea7F9CiS/nun3Gy5ZBfYgffzM51Bn2N/ETtl
	 uHSJf8fZAXgCaR4dX1h/JwcBy4os22BiDe4mweUoskiAlpTMpzXQLyyUo/xboccQgKN/s
	 og1fNIaISP90sTk4I0CfA/K/cilKcFn2hzW/EyrJpHwD3dhjsG1IpmrYL+6vQc4yvceLx
	 jVAf84RWWvCtotx3ow4lr4y7R8XuSdWNumJbXIVhSLNow7Uqwya43gtDvIgPKVejo2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
	b=rlHH20STmTEy4u2UQRL3Ph1SEJu0d1hkwsu2flaYz3ujxRD5c15uF3yXjwAPP1u56R2P
	 g9fgPFKnyc/j5ty0hqtU5oBRqoj3kgfJBtt7bXHVDmoKQhQXo5S5aTW4Nj0IOwnwHvIYK
	 EchC0jKTuM4ndvQ2BXxutatQeuqIrTOE9f7FnA68yCEay5noQt/B3mt8HP5yIYe6ZfyTJ
	 n47DBmWIH5SG6hFwYCO0jDMcvHSAi0cywXwOV9RSt+W/6w/bR2eXuPfcqPIOBU/sfA8lA
	 TlgCPsbyg0KuYu3lDFGXVHSBLF49LZaa7AFRCms62meIbg9lG9f3Wy4WTQJT1VbkJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24770606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24770606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5Y9q335095
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=; b=LBrZ6vV9wbfCWKyN
	OgAUV5H/hxe1IAjXkR/Z8oQTaii0qMQ9HIYkXmwL5dBHk+rNCLykzKOJ9xhPSJhm
	FFBvU62YZNPzgkH/+ni0ZsjwmFnF/7EBFaCk1XcOxUj2EaKYj/8QkbwQqRJ4fJEU
	bsXQtTJQskbjLc6aU8Po4V0r+StW8HwISFRcTyu2w+aNSCBrIpftoncudeQN8ua3
	T3BRizN9ZCLqr4bTXHU0YPlbe12pcWUO7nnKUzTfkr7YYYt5CM6W6U0sKy1xDsYy
	1bnW/DBS6u1dIFMuDJNIg1jxO7z5AwDCy1U6EjgDaTV1bK89pweMc3ThAAVAXXrY
	NWUrMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48agj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so17237385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579154; x=1793183954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=Q0C4IUtC/bw2tDKyj0LFJeQOva2JOPNwbT3Kvd13egyTrGJjdSthLEdGedRhLHGHsd
         /b+AxOhKhBex7PtiOrMQ45PmgUZ8XywgrcutJaw7keo5teD6o1gEc7D6jmx1LTuDqi9k
         dt8xui3O/mTaoHc7E3u6j1OwPVgk4O/vZC/A2eTOJ0aFdJbT+rZblKCR2bBjUjcTsvyE
         ESoy2cQc8Yd0EZKdduq26HFpWDXc6WhTMxQURKQLjMxmSPsoiN5Kunup46rIPq/aLq3L
         GZJVo9LRJnbesuecLn4fRPH/DM5SzN4Ob5e+AmZEU8jW58b7oPOD1suDoWYmFl6MJZaH
         URrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579154; x=1793183954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=wPBGS31n1Q0aBQNYC8YSwVyJHtG0N0xLXhck7roWsW30ToqWgicGSU6WhYHYslrUJR
         0mKklurzf4fjU+v5A2liGs2BRR/vAXF9yyjdPr5IgEnrOE0KHQmXKazIt+GjyuxGdW0Q
         /KZHYQXCcQeOiOz76V0lKfFE5mKoNb/p1G6MAl14dKOvWEHXDatYYTvqc08/xCxorhZ2
         pzQjpCPns5j+7BebtHM60kYk56ohdiLOdZZ8LnA4p5+MKZD6lpC0K8Bb8sp8y34ITI+3
         py3f28MCD2iuwnMZTvcNXMe9YfZwcHylIkA1c56pkh+f3nne3NlnW1KWETzRaX4Mx6oO
         inTg==
X-Forwarded-Encrypted: i=1; AKwUvBy+U1rdUN/R9GDmmqjih2psj/i6RnwWPUKCMJyOAildL1VuEpsFCKqlBl5Hh8+ZlCzF+g3PAzN4oI96e2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFU7djGJYqEHk+AUvhyk6GTitivyLzvQ9oF6EotDCNHJZEXdKd
	RThUKyrQbx2JP24E/Aei27gCuJNevHr8f067KjTxf24TaK4+59sFJBnqj0MDTVGW8/70dQ1VCW/
	G3/TDo8ArUoL4RH5rDteoWE2R8dr6co4tdUBN0we/K6XuxOPp/lh5Ne27GVk5LmpTKKk=
X-Gm-Gg: AYBFou3EkcNJbK2Ajf9ZmkQVoJBU+KfhMnen+1VGaFqAu5aHlstP0oDFOH/eMGG7sOD
	c9dVoMFxHYLZljPW7Ol177RDxm4ON9bBDsG76r5Sfw/m1CL3ORGNONKCeyR/oVtnyBDURCMBWJo
	Dovi9HIWPgZDRi3ykpV/E827NUX4aSgJmdKEkwfiLmNRlopEUtTRStdTbCUAzvM2kmPPnAiwJHd
	68AfjjDcQe9lPH/dVjvRPxJNY/Phf2IsvG54p1iqk1hnAMhvN2gWEQ17gyWQQP/qrptQTW8uaqL
	N1aYvhhL1swQYxawnA2+rpCeGYOSa/6jRILJsQKwLMPfkYFNqX/0+T8DDwik/BeOuaDaqACILo+
	23JaW76bu1Y927Wt4G2r15A==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393138785a.3.1792579154390;
        Wed, 21 Oct 2026 03:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393135785a.3.1792579153968;
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78b22sm63381166b.15.2026.10.21.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Message-ID: <dd641bbb-6012-4d6b-9bd6-5dbf4cd849dc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:39:11 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: store the RTC offset in
 SDAM
To: Luke Macken <luke@phorex.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016232528.4012876-1-luke@phorex.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016232528.4012876-1-luke@phorex.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f8dHL6zvm8r1dYtJym0r2KISLGoT04iS
X-Proofpoint-GUID: f8dHL6zvm8r1dYtJym0r2KISLGoT04iS
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad89653 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=supTg-EGvRqL_ogkzMIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX55phDnnKx7jY
 JAN9wRSOkDcJCAwhOl3JJX7A4BiuDwbICFzlc1VdmctC7U9rbi1/tCMD1zKi2CTaC4W+U/bhiuJ
 UANTuzs0PicSa7JjXuBfJNoQAuwB9+pduLffdiscfGRafuVnL5KoFOv+UxMI0KhOu1f+HdCZu7y
 81AAO6lqNcPC/3CjKmbunrSvz2vgwWcjvKVxSNIVAobWnn1eE0WwvVXwBEBJ4LyTJkjUeAPnAcx
 L3S6qEUCuGdcH82CoiHtsG3n5pKr94Ol2+FnbQkuz9XpuEOuJCpL2yMMcq3n4q1kuCCIEKZjG42
 SxF587negBMTYO2+fLdbdsX1qj2ilFzx1gPwU7Ta78gOOCxOWg6O+ojthBYrNnC4oOp5B0s2CD6
 dP7LWDDvaPFIdlEOSYsipxVS/XaF41m7b2mXneaBG5W+di8xQu4yeTqdQ+g8cqNeilCnO67BynO
 v3tqwlUp2In1lFCpqmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX5Q4Zr/NT10r7
 yM1MNVfd402m/hlmEAF8SOHe0zcFNCdl8VW4OfzINluTrTz8TkC81qYF7/BwtIHMbzG1/hWiYJd
 tXNroQ6L6vZbF8fhA5XWcDp/faBdxZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/17/26 1:25 AM, Luke Macken wrote:
> The PMIC RTC registers on the Lenovo ThinkPad T14s Gen 7 are read-only,
> so an offset needs to be stored in machine-specific non-volatile memory
> which the RTC driver can take into account when reading or updating the
> time.
> 
> The firmware on this machine does not provide the RTCInfo UEFI variable
> that other Glymur based machines use for this purpose, so, as on
> sc8280xp-crd and the QCS8550 boards, reserve four bytes in one of the
> PMIC SDAM blocks to hold the RTC offset. SDAM 2 on PMK8850 is 128 bytes
> and its last word is not used by the firmware.

Bold claim, there's a lot of firmware!

On Glymur machines, the RTC is coordinated through SoCCP. We're working
on providing an interface to that.

[...]


> Note for reviewers: Qualcomm's "rtc: Add Qualcomm PMIC RTC-GLINK support
> for Glymur" (August 2026) would move the RTC behind the charger firmware
> on these machines, but it has not been resubmitted and needs firmware
> that at least the ThinkPad does not ship yet. This patch uses the
> existing rtc-pm8xxx nvmem offset mechanism in the meantime and does not
> conflict with that work.

There's another access mechanism to pmic-glink that may unblock this.

Konrad

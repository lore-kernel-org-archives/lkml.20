Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341023;
	b=yGii7g3QXg5QaLAkc3UR8nezZY1kIqZVSjsre10qn5JPpTNuDf9BKswjDgF6aCPCHrPw
	 XiPc233y9VwmPG+o8UmPiurk9P6aw6pF5Yvjq5s+5uCedkhTe79uYlE4r+q9+ChHj4gEU
	 xGIliNw2ooUpxZL2RcKa/mZTv0xGhCP4RpPUVIDZAj4+/c0CHLfXwwdufMg1XiuljAMHP
	 VXew/itXprBLOcwsQYblMz0tejf0EcgiINlCQmheXkSrop1bNBtNlreFVt36nTHeZ0S3D
	 tXr9cXUTCC9PpBUQdcT+0/FMXikVohOhwAdJ15YrznNNDRTYNNPdXLPEofSl2fpQfjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
	b=1lILXfWtcKUZBbuNKLAzQIqiA5xgIpacupUIoo/dAvzvt0s9tHt3ClADOj+CKUZveu0c
	 Y9vehpt4EP9qU+l0jh3bMvFetgQEOkMITMGah+EQYdQnwvkNYD3+gdDfJh3XOnOczpEfg
	 S7nAJFVjDHkyS7ocGExgwcLS2X4AiOnCFrDkLsXLc78qoWpH49t4C8sxPduInINQUp6W/
	 VfaJCJWQmaumf/UyCqoCDVoYNRVSCi0n+k6yRnjHsHRRmmPY/ZmtdbI9/ZQEtAOURyiBe
	 fhqvA2/GEeSZJuDt1yDkDeX4FIHHCH+uNWx78SJCYkw5jAOmgpvUJzd/AWi6ljQXiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AjEX/E3R";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC832606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC832606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjEX/E3R
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FBbr2326576
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=; b=iKepuzNEyWv3/RyV
	1XLY2KoJBHDLMSjUtFUhRhbnDDJRywYTxhSKFHe9vyAN9wCKrGFLFPCHfnxslrBK
	EQTzRMQnRRrRuYcr5W6+1SRLPMlaz0th9iTHgMX0YIqxdLXStaFfSFC0a60lzyv3
	dshbvtud+EKT3qrLKWz34Lfdgi39Rm1OLkFFMAxqOFeA8ETuLcxXq1LN7lL+RdOW
	UE4a/i3HAQknXNaMYC1G0o4j4IDxdu2sTiR38TNC3Va3FHZ+Wow2RVgxvrcXND5Y
	I7JetBFnKuD/SXfiESiDbfCJKaAkZVC+a0O+NdnhaTelRHML9nJhm/gVCMovBTMf
	ZdI6Aw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhgsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:17:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1067136eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341020; x=1793945820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=AjEX/E3RdTPu2IdqqYdu4bf8Up3bjfkLbaUx3L8TqlYb7azZ1TWKhPkXuNFwZAcNzi
         GqaOp27Du5BVp1/rcuEyrHErWEA6kmKjPWFJ+uhv6aJpz5ajyg30t1bKx2M1VLxy2hDb
         YXzEfEwQ5rrCilSs9Nd5/YzI+BhVWOFGxp3e3E/nt7LQCoTZF+IuePm3XIz3e6NnSbdg
         m1i80Syr5eH/Uivmsov8dkg5s0mUjCgjodzbKx/lpgs+fHIzm6Dnr2zZ+QZKF0MBBIeS
         lnIPAYL3nAH9EmG4W8gbveYCwfLTwojyTo4nICP5JfjQIxaimZuq6p7YAlN2XXCf/rSW
         A9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341020; x=1793945820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=jjZaze/tz7WfoTz+cVFWzcS7Q2V52I6QgRp0jdwl/DakrtbprIFDqlVpReA2YXcd7j
         z+Nk0YrzhfPfvQalflv+SohWXJex3Hld1MlcuP6e0ykiobR4lRAfBrKMxSm2E72b5W4K
         Nji4HOjeEf4iUW4+IEPJGnAbPIlR78nUQz6OFDdcsen5URrbxcsI9j0zHE40IO3CfH32
         exRUs7sqyhJ7d6fGRxkkxQ+BuFQMUa0MK09G5+98K0N/KissdiCw0BV4U6ItVvzxpC2u
         Iu9v9tLs5mkMtNWFbEKKdTTN9ntju+WAXJa1zYjdALi/g1dZc8I2NnJp8IL6C0VRgEpI
         3NJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiUGpINW6mbhiVjOGl9p4TzY60u+EauQddLLknFP2dkjrBKEh1iwGtxnalq12GeoGb7CEUtStd4Tb1rsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp51yocv/EKy3XsgbJM19xqQSGgPMW1YR49idRFxPG/HiPlQ8A
	+po1A18ER+OmU9TQ5g0jaRBOTWTIb6ARi3EWqzn5yL5kHXBuhKeiO6/8jYRUhlm38QGNmWW/wTR
	NOhQsqOG9HkM2SrUfYogktqBJ7a5n7fRsodc8R3lX2NKMab/cDNQukLjNsPGna0lc5po=
X-Gm-Gg: AYBFou3uvCn2a544KWRTfNi5ivfi1SwVq/fr/WTCdB6uu2hBeggFMM+IZ3HxJs2N2Wr
	PhuRSwzfErUI5nreMvsKJBiYQ2p58vrQ31PDiNcUyxll26xOI+iBWa3Tj+P9a7AjwMKPLEN55jC
	c4scYS9ZIlVY0nrm3tGUTzIcoe6EtX7PJbuPo2VjvN+jA9dK4geME4/Fc6fPZcflx603S71a4ED
	Bf6gQxg8aiIMbWTE+Jftrzx+tyyVLSEZRARSykgB6yJe/8GbpRULk4eMqGxQUnP9DtExgIKtTga
	QXn2VQCsqhGuA1JTb7U2UKqSJWhESAfUhxHPSeqCSK3+q4vG+QzCNIBKULn9GlDn7v0F5NNY/eB
	kNI9jHzrtT39cjXzPApgBvRZW70dedq0UbKxGmDAz8+xZq9AGy2G/Ut2JGxGGL//em6cHK7hJD3
	rDrQ==
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308079eec.23.1793341020140;
        Thu, 29 Oct 2026 23:17:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308041eec.23.1793341019611;
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm4577341eec.3.2026.10.29.23.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Message-ID: <9dbc3e69-35d8-441a-9cc8-87a1e0355d1c@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:46:52 +0530
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
 <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: suUpc58MMxMCMlXHdrPuHiu67GLJmDXz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX/NMMYADVTExS
 wLiJX9hRUy4AHZD4nkYwgnhyvRByuOZ379XveZMPoukwu0qi0NDYz1TrALdHuqhx+xCGz9I0pN8
 HC30XUEd/UJqmSZiKv+Rbm4eEQihozo=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4365d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FUarkfPcEUWQjx1WGoUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: suUpc58MMxMCMlXHdrPuHiu67GLJmDXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX2zgw2BQ9U+R3
 6wAc3sRe1VWSFi4CJCWdRwPa9fghF5BQQWlFMjIaLcNzDw6ng6Hg592pNoYovguxigh+Lw7vjaI
 e0iVjRW11PcCy7cC6sWGEAuIvCc3lB4kyh6cHnzqX66dXf1ZqMd9jxUvgbXZMXRhzCPjHdIbAF1
 fyl6T3f1Bqor0PRQkYzKGYAhhQHmez3FPW8Qm0inm603I1xNSwAfa3fdOIX3SCSVAM753zEkiVe
 Q5SMmFIvkqZtvxsYVBWlzuJevWX377M5szkPlAytvNnZhATLbkqufn7/PDW/COYnAxy9a5fsoId
 dTEW/jHr44qrE9NtdONM1pe+2CMyvfWeCQf9mqLPPw6utL/BG/Wn4rSuPGnNHACLgaJ+gFuSz1S
 6OqnL6C2gF1nlwEzJ6ul3YcLgpZhJ/PTOkQTJZyy9P4bccEu8sabzSz3BsdpIZtsYKDLXfBlBFq
 OyE0u5W0HRUdWYkzguQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300024

Hi Konrad,

On 10/26/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/19/26 7:01 AM, Jishnu Prakash wrote:
>> Hi Konrad,
>>
>> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> 
>> And another point we should note is, the MFD cell name
>> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
>> driver and this was intentional, as explained by Johan Hovold
>> in his change (mfd: pm8008: Rework to match new DT binding),
>> in the last paragraph of the commit message:
>>
>>     Finally, note that the temperature alarm and GPIO subdrivers need some
>>     minor rework before they can be used with non-SPMI devices like the
>>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>>     rather than "spmi" prefix to prevent binding until the driver has been
>>     updated.
>>
>> Since these changes are not yet done, we cannot use
>> temp-alarm for PM8008 or PM8010 over I2C for now.
> 
> I read that as one more reason to shave off said diff
> 

If you mean I should simply use the existing MFD cells instead of
adding new no-IRQ cells, that would also not work, because I
added them specifically to address an issue Sashiko found in v1:
https://lore.kernel.org/all/20260918165721.CA17C1F000FF@smtp.kernel.org/.

They are needed to avoid assigning IRQ resources from the MFD
cells when no parent IRQ is present.

Thanks,
Jishnu


> Konrad


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493682;
	b=Z8ID6OGZq6J7qC5MBMr4KwlA1KP2ezq9+kO35jTSQWrIjsiqSrdj0p8r0Dr6fcqKD998
	 Pwf4TSvCNMkEp04wQbv+78kcj9NZs4EWeNUCM82n4yzaSJeB0LIITgOB06eycAqPhFY6O
	 re/HeBXn84UpALptHmJ5Pg98miBiYnXvf2vzPPrXa59vki/n2Re9nfNUrmU7xXWnseyVC
	 lFRiyT3VoEuXAlYSWLTQp52Qm0GoNtOHpOKmNcim9yow94gM4GSf0FKDupM2p09dTLKAJ
	 uxQd8owBTls7KrXrQ66wBo+/u8A+se+AAMW5XPfJvbkNlkpZxO5qs6U0ITIwNNuL3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
	b=ps+pV/ae+Wd9dbmyqNDHS5Hhm2lgkgXqZtzYRh/h/RWYOSeiIlOIgQ3ns/EiEacKOAck
	 squriahSbF2VeVCYKJR738W4U4VbMIDcR/8KNiWHr/2XEhJGsvCz65uCdUreskanu/xM8
	 jXLOpsFGsbGBkZguRdowF5gwWWz+V27W6usBjTpG3BG/OQw7D6hXS5cacWyIp5Bd/e0AC
	 TEnAojl0MWHWQDfUB8hkpyc5wKu78xSxzS0nttLb64+YFZm4g7B9R+3QpEGdx20qANxDk
	 7mhUoXVrzQJ3bKs2aKKkugkcDvB+ndjukc3sDRf9LFL6/FmEbv4+y4fAhtZik4tZGog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MCs/I5Iv";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2ED606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCs/I5Iv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K9mkLC1863611
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=; b=js1DapgZNnp7iKP8
	5ih505rejGgluNIme8rnZqZkDMhMxxe/Wo4KbxT1/vBmQAAYqE7ZMQmGXt3wQ7XG
	kWBjSv53TWE4GGkrZQPcWYcPZVTgdBcTqyTKyQA8k8OEXkjWj/ksws3nkULqAnPd
	tS9E9gSDdWVOAsuqfRkEH3hgHYmTDjuXqhuENmrA+Jfno4ZUH13rPyDWoiyKmFQ0
	6ccMgPEfuGK5qprGAkJXfGVXcv3EQoJFFhBJHufKIe0Uj9olhG1fSwInSd2HWzbj
	ZwHz99OJ3JMIykgfB+H0iH+xELHT8FYFv2KcpjfXxeXXdYoVFg1wbCpUz6i+QWRv
	/VGMew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pj5e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:54:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so8778686d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493680; x=1793098480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=MCs/I5Ivev338Be6vOmD2yPUz91tjvbk+SU1toZXUSVdR7fkRsA6+a78Sf4ujR0osJ
         zCvLcIKVFZvlT+fV31R9ZqmreAa44QQvJzRNUvMcKYSfuwKpXotohBqIpKBQfEaVUJm1
         zl68yNiVDUHikhmmSVpnNWEVT2i5N+m0FLSONCadrOqbzf4n3sEbbA7OHxblmYWPqioj
         MOq/ob4bTQ9bOLxADRL/TXaf4iTF6vcWYMl/WjL5Y+O9XWs2hn9u0WIElSCjab10ObeF
         19UG0uEfDueV6qXV6rRrA9Poith8je2Fo2GjReIgj4hLNPkaL5KX1mdkxSM5Y+u/S+X/
         vY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493680; x=1793098480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=TzzlKEflh8E+KFvCuRoqEZP7sPPq9sWN86gGnSzJT6b+Mc2eo1J7m47Fsw9zEjG+Qp
         PmdFLqgLTo+/Y6CMUDSeKjsijE1tUeWuByIgjF/JBdm2mcE1GeudWRnrM/91y+ezfZB8
         XCKzHuzE0zW5qJIMu4mGCVvRVEdsJp/vY35pRDUZ73xUgMUtyMuIKfjv5tqImb08ffbG
         JbqIn/rlG89sFPR8Rpg3Xqby0caIzWjm6mFWBQaa3FB8OrPcSB3vii9JKDifPF24rlji
         ycG+XldN0mO+9rZTrGPkvB0+MEjfStUTQlPVsfhGXgJS5ioH//JUQlwNEGFhqn2JSUls
         e2sw==
X-Forwarded-Encrypted: i=1; AKwUvBxbAluRZogQ7cKxxpMVMwxjoIMEmAAYwjuE4m58Ni75MdH18R6vKwmZ9dajK171+esTXKigabPko+2Nhvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfV6wc3BpGAG7QAiQ4iYpMlbx5cknnVWTT+huEJkg3gw1vgMs6
	dnk12YaG33zWG6keV5LAljevH6TA7EDAmPAtI/l4EIN340rcqDIq7oPWVlUpXVLnD88529Jjav/
	PJ+uArysVf16ZHaqgcBmtnRf93Zrw39CBN1fV9slMmxUiGDORVtHnMpdKiCBIq3SrjG8=
X-Gm-Gg: AYBFou2YR3ZzXfpIPwcke031YRWk5FmrujBm6CeE2ax8dD/XW0PPZyS/EME6oly5w3c
	n/YS7RzXh0bKWW//DdV6Ao4mLgttLhCG4/CTq69e6PmNnJoN4pd5TXHFdWDo1xhl/cQWYJPE7G/
	vFBX7Ef+JdoFbUifrhIi0ScFIMBF0kYPx1LzfitYGAmsdCKynSUR8FRdIB2RYMoJm2K/FyeTC5G
	qwU3hj75BpC43Q9xveXO6GNkK5nzoFSnz+bsnU4ApF/L0SiPJGtBLJYCAn3RoQH5JKh4/lYr6Ce
	Cxdl7oRhdJlrgqTfPg4ZCrK0uLKgQ9hlNm9IhKOCWycki8/1RZccIP0C5m7p13cdRYNeF+sWWKd
	xBlKWkH95R51yb5t7zv2qKQ==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8061001cf.3.1792493679901;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8060801cf.3.1792493679378;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm465672066b.75.2026.10.20.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:54:38 -0700 (PDT)
Message-ID: <a0098b0b-85d8-4da2-b41b-7e9e73bc70de@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:54:36 +0200
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
Subject: Re: [PATCH v6 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad74870 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vWphLq9OX84qfFS8ZdsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: pFCgl3u59ZQfQSnIH905ag2fOVCuIDYj
X-Proofpoint-GUID: pFCgl3u59ZQfQSnIH905ag2fOVCuIDYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX0MfVMJDFrKeS
 FbMpSjs/BRKTgUPeCOKvwrr1wuUYIi1grnIN1xJsIJjo0od2Dc/uz8MNRCAj62lXwJNickLzzYb
 wUMphlZONQtuvZHwa7GC4dFnV+be5QKefdU/gX4HOpvX88QnjDkWeOyZcBDBRJ5l7M4sKYp0FhL
 tLAr0cSumsMivQiu2pwaQF0zmAKo7B/XTkZ7q/lI1jHXKOTJx7zZF9x14+DEbdrlOX5BF2yy+ZG
 6Pr1Mwiv7vmOodBA+vafIow5sj2pCxaczhCk0ikgSlb3ENVI737QNA4x3pgylzyz75viWN6gkql
 qsDZ6Jx2JPAoGlDQOgCOfC5w/CsHFR+hQjv/5b8xqc2eXtGU3039eVOWN9jkd5e5rZmvfDEg0fZ
 v6bzbZSFPuBApk/oieJUzVtQnOHw/Xq1JzQpLCJA680v5SapD7crzFiqlzFjfb9PGZrVUvvZEPW
 hAMfjYhKmXG1pFBGG/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX6W00yEOpaJL4
 Xm1eoHTbAHdPksBdKv2hR1kTBH7ThHlHYIn/ghiUA/+AsGoWac3/yyZgWq0EHluzIRAfxOJpyCp
 XmIfYMCgdnLDRvyFGBUavBqZji/Y/rQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:50 AM, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794414E7802
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889321; cv=none; b=oMSsRvCBj08ScMPQGID81p1aFGp+YEHGkNyff2bPGyMbTiHLixJaSPeU2FbQ9flHi+HnvTMNNgY1wg/ppU9Cvb2MHlIPkwUvms4hDlsP+K6jb2RMznv3uz+7HZxkFEYITZIe0mBfxG1NajmsYZ+l8b3p4sZjhkbUW3o/8S/dkf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889321; c=relaxed/simple;
	bh=GHmwKE0UxwHRtrATAosll6uYBXuuBS4AK3dGPwQgzSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMGw+qyz8iOg5YXroe8wKGJ6WRW7DKQ//SE2n2fb/7ltZIpVzkdya2O7WALdOCYqpKRXJPVF1wYZ9W7XOStELiUj6fjdWwLKyD1YOJ1Rg0ZyDOw6u29LdvnoxWm0OWi5LUIvFJURsNvZTdyOWAK5ro5TqAfPFX6WOlPxVf3L5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOO7bPzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqwbeN01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOO7bPzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqwbeN01"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8M3KV922859
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=; b=lOO7bPzZ3j+m7Sha
	w6srrquNg0hkyIjnQHnYDd9qR5MZcYdM+HiNIn/xELTL+gchT1bK4Hgbq+ysJFt5
	T5hhwZz5OcHyLWuQ6KiFKeAxlqx1l3fu0P/oGaB+rVfPEict6RnmqBRHX6pE2jZp
	fXaPDQVP/ZiO51olPrkL2ntXLAfG4wNUW7gdt9ULeHgUnl8nhas+s5y29aFSMEDr
	LWtOp9UOl/2e984qcgQ1Ch91+Ctjgk6rcwDFtvq8XSOYacwzu3r3PIqXwWGpC9X4
	S80fbSweiv9SoHCRPMYvcMBAF0SMmqf09/i1vGxlsgkv24miYfXzT2TDlGEoilVL
	/4lB+Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tk5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:01:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c101b7f863so72549137.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889317; x=1792494117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=DqwbeN01j3fEAQ1IRAEX1OauttJXuR4cYSyWMWduGKF4x2bw0pZgdsFKZvrFCqynG+
         F6H0puoqGr+OFLXhfIWhs9qNaJoSOab8T5yYI+H75zHIGbT2X+ku9LgeSH79XL8I0Vmo
         auxQF690qm0NSJ2Ln1t2X+sswf/fO2V2B+nXRSGfN5fqqMidDA4EYFeSKnOE7Qphp3pl
         xsJwtxed3ijvFXeoNuR2pdfdLQvGV8m7rbM8wqA1Q1QB159MszPtpfZnGpXNcjbEGe5q
         hwv6k/w0qgrU8GllN7JL++fQlctx4JZhl1Xh3ofFsNwf8b8s2T05Bb4i6I9jPEipYHb5
         eQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889317; x=1792494117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=mXpzSQgInjiZ0+UaklGTYPrsUqgHJUDsMeIWQ4K5U3GIQJEkZ5QCnQm7jqmPgqBiC3
         gT71AwXiketjuDvIRtwEmCKx9E71XJUOPVlR904XRPthxOW6LZ1ENtE0MnmHcjbjqcdg
         Uosmm6cohzQLXeX6ZU30Tr6D9fYBO9DZOFhOuvXCkK67ARGDsqsImza5YTS/KJxhFgWf
         JHlFc18PFZovkfQZJRWT3SFwpZNPoHYvisCqd6GgdXMWwKEl/l94IoYNA4kL3Sdbi7Sf
         kG0EBIIFG7voHOTNauUm4RdqjmvmAmYnKsNdfxOfLQZ/k5nAOwDkg8db2qrnE8KvQjPJ
         GNNg==
X-Forwarded-Encrypted: i=1; AKwUvBx0IorTvpoGw3nOcDvv/3fd3lW55sbMeXpF4/vUHyNwJyOsuSEvssJMJXIZ/JK462+5ypc4+JHjDT9k4P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeXGf9BeIxDziWoP0CLvcnMwijbpg/+qxE8Io6W7kOgIXUPNdz
	07WWMmn7YTQXYRakPps8kfd4dSC16q7RZ1y4yrSYop4oFWkF5NfIL+FWHax2aeQGRV89kHTlq4w
	erZmPthp9ffhy7VOkt6IzK+NqvD+OzWLgQBw4aC1ncnt+E03ZqI7lvzZXBir5lUohCZI=
X-Gm-Gg: AYBFou1+7epDcRqurrtpdxkgw3RF7zsxwWnrpdFYhkFjLihF8JcjxP9UdJlGIRyudd9
	l8zDzNRaaOnBWS21f2VsVPMlJQZHP4bNavy4kadtH1EfnfwGYxvv4NAF4+YMXWViBebCbPS6yKd
	0XxVJI6Yh0fi0J+Ne/bnFlUAAKxljfT61We+jJJKDTkjyQak6f/1g4noQSCqzNLeNCPcQQcgueX
	erTd18d3CMuDXTDlcbg6eM/2gvWa4kPc3nE/D+qkC3m+hhVkKtOdVCN5cMuECkBsnWqDzNMNsXl
	RWooBBkiwOBBO+U5j6SgnTsOaHfcx3bmg5wt9lOLIpj+KbAv4fN+fdNxTo3QCns+a8l0LUaTYvB
	3/atHF03glmyF/3DrRMZ8mA==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310918e0c.5.1791889316556;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310887e0c.5.1791889316040;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1640396a12.25.2026.10.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:01:55 -0700 (PDT)
Message-ID: <1afa3099-055c-46e3-b7ae-3921b8ecce3c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0fa5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZFXNGOwF0fqHmEQM8WIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Qy9bQt_-YxThr9gOQ5U_-psTIiL3B8L_
X-Proofpoint-ORIG-GUID: Qy9bQt_-YxThr9gOQ5U_-psTIiL3B8L_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX4gLBYtFjl53p
 3ZuZk608HDkwEV5k827wkK6Jr6hkWLF3RRN4G43l7aNGreN469FtOwKo10leEOa90Iv7ljiTsO2
 eN49iOtd164EwI43gyByWlZVjLlyOgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX9eNwXG1Rewiw
 tv7s6Gecx6LizcqQj38M0Vqi77qjCZux9WCoKR5w7pF6zXrFJ0J26RmAipbBaSYIj3aoGK1gleE
 bQG02W8s4B1fCxPwPKqJmgiupoM3UbmZC1txFDXAhmLMV6JHAJKrS2QukjLY/rMp4KM+wa06kYj
 upB1Z5zZ/NAFDgFeFaYPykbEH+a9MZb1bBUhsictm5bxhyd9ov6o3Wf7eyHJnP0128WJharrZr7
 fjyYVvu9POLB5rFXY0ynSNKviIk+SCuhOP4WmPpmvrVTq+1fbprw3Wj32/cn1d4i/QGhcUxuk98
 NtYAJiQd0owXbNMH7GP1fCfhEcGTXHPRZESWaVxy3vq75Z7uuQuNdaFhdhHe5Q462AtmzQtTZ4+
 mXFycWRvVZx2ZuQYcK1Qa03QSFKS2+OiVEbRLh5sDG/Gk9CDRPb8dPlV66kHvq7UezO9/KaHBTU
 CeFpC2AvI5hUvNniZ7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.
> 
> Update the description to explicitly model the topology using eud path
> child node and add a role-switch declaration to reflect role-dependent
> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
> primary UTMI path. So remove the USB endpoint mapping to the secondary
> controller and associate it with the primary controller.
> 
> With the intermediate EUD node now in place, update the Kodiak board
> descriptions to map the USB connector endpoint to the EUD instead of
> directly to the USB controller, reflecting the intended hardware
> topology. Enable the EUD by default now that the complete topology is
> described.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

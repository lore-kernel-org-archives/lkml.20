Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578951;
	b=tjznEpHJV/G1cHEQua6lE6YL3fl5khl0hsBFMfK06My8wENJgWqpkxo4X+Wkrya2z5w7
	 AzMzAD3hSkwrnRDJ26BFnaEWEzSqtXNGaCizW5edQlXL3LlSgDP8vOK4guNl3XuSaBoNh
	 HmFEbe+Q5SB+NmUiS73VaRFIh4racGGVpujVE9T2hBFZXghChyzkAN1+OlWUYIJDtyxVZ
	 kWlQLZhEFCTTrCJN601eyzks3wZQONcg8mQKLpkRhbnyzuHhRLkXIK+aiuFLLwi2hEVkK
	 At3Hzi0XmWcjsZyoXQ0ZmvZZg0T96uJidFokvAjMRdibZjsU5CXZx9i1RQchF+EoH1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
	b=LwCptPKaD28Km/tgwHZd5Dy6b4fnQljpbrgN1nHoTrVc8fJqe91AudqdEhWyAdB6HI2C
	 PIsmdmuJ4ZZw3+2ZDOny0Kqt9zq3B2FpXZu+Y1Vy/snFYmj3vv1IIV6w7a+YCTi3G6OI1
	 DtChxchUZ7s+fOpi8p7XQ1eWz7Hpcxs/qvzHx7olYFzMGRa+9o0sh8MYyXUo1iU+CdBNN
	 SUrlSfr/5zC9ZkO/3PD85R/lp5Ru7IjhsaU5Qkc+EXk60otW7Sftn9wGusaYMIS9/piGU
	 ub0O5X1rXEM5fAkHxgvsELFROs1Wb3x3ULOhHe4VZSWruOxnAcMuT4+OfkkrWCKeLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9459F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5lgK3016012
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=; b=kj1lw3qcgVzh9yrJ
	g5cjz2WfGS0Mir4lkZ9p+r87Yd43Dsu6W5akW4KQwJu6YU+nkuAXn4z4hvdU/Iab
	3yHn1kXxaNt9Z4r5W5DfEtXpCQBAS86GEn7OO28q31v2KJDEKU//GWOKQM1179UW
	gpgbQdpQeSTmCnYTUK7yg17g4qzFpGnn6Q/Hp/UgEYNkb6T2Du6woWrKxEnfOSLW
	G7zyfNRFgu+WXetuKpXZnSvNbdza3+JXwuJr2JAOi806Z32cKEwUujkUWryipSan
	ftEzhBEyeSVcosL8BFYE/1+dSV35IkYCnXrHIJ4+cw3RBWReni4knJVjOd0Le6VZ
	70wL3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78m2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so11783585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578949; x=1793183749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=QHNJF500GXzcexmKby7RzJq1l1wR8z4kNf1rextZyMGPKmacLPaH/VLrtq89/Fw/Ca
         efJz56j0rDwlyKEa4HU3VvMqhJgX2GsBcr2VYdVeNfz1as0QfHj6FN2u/LBQdQy8S8YB
         tesAsZfF95gx7+Q7PiiYLrgF9rz+ThM862HAfR8SoSY95tsyUxPJeFtE/tl/cdxgb2im
         gMR7MM3Z3metfv1TOfUrURfc2S0JzdmeFHmnl+YHJjV8Aa55Op4AsSOySUsvvxFeCH2g
         XWv/RRPW9nGFVEGkiI4g4I6+V0y2fvwAbVNw+3kZkJ84p3dWrS83xdt230bzRPpSnNfh
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578949; x=1793183749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=S2usQN3If6qSN02bPKEHZnHzGCk3T4+ozC8fndUxKBqCTOjtRhwv9W35+uxNzwjQId
         7XBtTw0SC16qrmHJ50zPvcSEKyUpJ3RezU5+He2NOZ92K6xVFKJEuiefBhB2v9/y1Zmv
         LqdpWwTBpHCQyTIYl8x95NhAfVV8msaBXsNjv4fkhieevk7wqi+/8jINkGPD3Lph8op9
         qWZFHmunT3Ydy70mM7BnMgPQELxDF42J6H8lGX9b7Q6yjE+k1fdBh0v16uDD7PRE6QnZ
         C8qCfkvlasFjeEdleOcitTYPzEe0EEjsebumB33Q4CtrVyG1+qJbjIJE5xgjBIDMKoig
         ij9Q==
X-Forwarded-Encrypted: i=1; AKwUvByHPaAr8/8D1MOZWgpXCkwmys6GH98KPRnNHGUS/UDkJANfV6d1LTctHHBfh3iTSVRplL7QLPUntT3nlNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ49bVk+vGi0KbY6KhB9RyWjfXpmJkEc5oXBw0FNgJKxASojix3
	AMaevUh8YrhL3V1g5/WzChCvarWV8ZgdrBcrdUkmCDQv3COhVZ7BkgNgmdcTaebeAa8aQvP/ydM
	rHlwpsOwiNN/LV9ZZ8D5/WT/4+rKXDhM16EgDRDgv4ubP/sL7fPgSutckKRZJ3zvcdXU=
X-Gm-Gg: AYBFou1VcVbBKFolTYxw09BCKeM8kFeo3LurOlIn2PwyNXaXNfb6gS4TSsGJECUnY9b
	QK9yimSFEnPRdKOnL52ZpVJpFuz7lQJWFsBJLWRW7G/pLdqEALAV8nb9b3G6oP9t8rD5Pjl0N9/
	36Tv4njAu4pr9BZjETkSIrbcBdr1Bz2rVuSE89XxLq7nSPpc6NWHGCS5R2TjulByuHEO+PqOD19
	e9edanvamIwWvEJInqJyFBlPvuZ9fAwQeeyiTWA9YSd3I19bXDKghNtSbAE4QuSnI2otR7F9eKU
	lCZxX9TRrqn4JgQOmVcK85fp01qjc8R1xidoFk+wHOeHuMrkTm9udbL7FsbwQeIhOP0rerBQjJ1
	qzStgtJAZUemFUOPOIRnrtA==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439495985a.6.1792578948910;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439491185a.6.1792578948428;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm695162a12.32.2026.10.21.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:47 -0700 (PDT)
Message-ID: <193e4885-9d0d-4f33-b2b1-650021413bec@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:43 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tbD-fK8Nan-jzDJFb6a_5TeZDQbqex_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX00tBN9IXgFv3
 wUnRTW+p138ZUF/vkpHuLxVI6nFMTRA811NkMxNU7t2Zxos5hK6bTt/i91a4FU//nUTcEiJRCS7
 qn9o8z62Zewwi2haTkE6kL7Z7Tlx23fqw7o0UDos/x72d/PXeo4Cs+/nfSf82Qob8vx0Up1rbEN
 4H84gRPmAwZQM8Q0cN4376V4kvRvoqhpsh6/MXmFPCIv/dSwWKcsRQMcA5rO7ywB/OFpi/diMDj
 tiMMcU8VHe1s0T8rBJLvDVa5ZFzr/gwbctJVamm5E1sHbMrgKEmHZ8PUVediBChnk3MA+X+K471
 5VyFrUxiU/SVF1GT7gAtzHTNxlsiU7Wtiu/nanZamQoIYiQ0wI6T8XvmXYOpkiMVTP51wUruq6Z
 WvjhiaLTrT0ROpN8zDNvHTCisvBeXWOwc2EzGzqcM0DHIJugxWSkjZ9m4+q8+mmbTVNewDGI+aB
 vEtpO4UNW/JivQQv+sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2OXpYF5Kd/sI
 yKhsXnz3t5M0fHmhPrF9Cx/FCvvnnlhUUyajMeCLDq/isN4/8+lC2nGS9oDRVxfxLEH4gTSp/vm
 PH5EXEaVDYtlLlbDT8XU9gimYMIZXWo=
X-Proofpoint-ORIG-GUID: tbD-fK8Nan-jzDJFb6a_5TeZDQbqex_r
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89585 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

For the sake of git bisect working, please order this patch before
patch 3.

Or alternatively, we can get rid of this one if the MPM rework
series lands first.

Konrad

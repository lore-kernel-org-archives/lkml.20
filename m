Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011062;
	b=Sc8y5ldP+AQCnIvIkzqemBUcJURtNbx776XlVURufkoxX7Qp8CZ6+jjNhYuRMYQKjAwd
	 fqAWCNjtCIN2z8PACFYMzqCmIeEYssNRYaDMEsekYaObLclcpdgdzRJ9ZiFB5YSjlFx7l
	 mM9W4Kv1mysuzIxWUhKhK8DfrcuPpd0UNxvtkW26PRJvarOy9LiyArfUMw12co+ASZjdq
	 K3y7mX66Z9BGx7BmDGN6IpulpCye81OhDYVjYIdCc+mZ8+xKBtcq7/T1peWggr5cqaHh4
	 onZR2kkXNqO3XmWug2xVQtELk4Ov/XMIZ1l/lMISdksy5/k7Lw94XnMJ3pRGAU8Kn8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
	b=csOZ4lGSARFFYQHM4hOTnlvJbpWTckUj/bTwyTiOoTsAPv8DZWqpNlXOUxZTqKCMTOW1
	 jKzVk9MaLS9TjqM9mPY++8QyKYXe0HCFRSUAc2W1KUWK0yF99s9TNGIDP7Mc/JocUAtTT
	 3aXq1PUF1ZhB3Z5OaR6JP8+jBicSouvv+TJsg96UE+Hs6taZ5Cjm8IJwBEw1OrphscmTs
	 8r4WXDAr4lOtys9noEFbfta9Ja934/LeKtzF/iA9OB3lpfKV80L58YqgE1N1St4XU4vi6
	 3BcjzPSIoCN4H0DSjIW7LzKCLONel9K6yjYXL/z5W8Lsax7bGB2R3ClZoo5OopOJhrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bV/RkubC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5718606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5718606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bV/RkubC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3nmX3521736
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=; b=TpZsGSX6x4fCHbKw
	U8ef/568RxKDz0hovaxFvn9IInCc6pKY8/Sn3J7Cbt6yKqZr5KGpuZkWs9oe6j7k
	brO5+mOteKXKVH5HZzNaziob0mdnSna+I/c9Up4HcMbd6mprqlDkbSmUutdRWsP+
	eoa+c5k8kh9tObqrRBGOrjRsw4WJGbLPV4MsPhrjHrhfaDss//ip8gDbQn7ZD72+
	l+QQlPfcVAdnMvjQgAfLhDg7A6URh6DAhD0A+pYAdoljS0JxoEy4D2Wu7xtHHsL+
	cRCQRxsvNGOHaC8b82Ix7/gO/UBHgrG7XrIzmwzmfJPdUoxP39bSBmvh/XnrtdJ4
	32Agig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf041j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:37:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so3014951cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011060; x=1793615860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=bV/RkubCe5u5u1WJ+dTPiNowpRup6I+sWY3HNW1q0uOOwqYq3ZsF324MDv00xTkCMc
         pg6mFsCA+GtpbLp/MvJu+T4V4N38r0N7fuT0p9K7FdLTGqwt3PYonSMHbxswzTC50EiS
         nDZsos4tKHgzuj/6IjXj2qqA7hP5WKEdzaACWUXDhTHuIgDD447kQjPHuVaWVOIsNo+A
         h4UC0PMXvYoV2RySu/frdlH2YYb3mU9QhIW6e3fhnT8ycFIU26S3PCqEX1G6Q76uTOZV
         AK4n0UGSBIpjsh3hUVbhfsaIM4uEL3fn0To3xXx/O2nG/gAAN/eRRvzwiuuvz79FBSJF
         7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011060; x=1793615860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=szU6v+9jt3EGxVyjwMmv5JIAcpxNBagfsEMb/qWqFM5GpW0DdyfQKxmGe5tQABRj0h
         Xa0lBlTpc0udFWDZ0h0v/n9RhEPquAnOXE+BKiNkGKu3XNGCQuQaA5PEe5xsR23yFgPj
         DWb+mcJ51qH7LEt6hn5TUkS/Fsrg7NEzy2gh1F/Xg/igb9Y0lKQaQfkmFXM1LLCRqKHt
         HddWc1doEFwPabkTd+mnVmAUOeBBY9FTuZqrJTWBcDpyh7bpCKhbqb6d65p5fCi5ajbq
         HP26jDoGiirsvIMpCUmtUtUwGAaVBrS2yCec7uSHrjiv+CEyoNn/rWMgZj8EJSsPSGcT
         6zlw==
X-Forwarded-Encrypted: i=1; AKwUvBzr7f9LghINSowR1sKJyK0i3RXJvGT0uAZFVhY685uu64SWNIVCNRMqfiUeyxoJLQUIUoauweDno4GzDZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJowOfcGFFpk296W6wWwukQF8bCPyF64ztIdT6WcbvLITM/zuaN
	l2s2TKtQBWNgtiXIgQLb+3FFaIkjg97hwmwcIICsL8A4mwoGm6iNH0gO5A/oTnwRJNF63qJeuiW
	BYmPqaygBp6Rwx6DdH2dgxAxzKKxCTSJksK8n/0hWsML9aKt/HudwAvpDZpWD9py/uVc=
X-Gm-Gg: AYBFou3NAakZHsTetRz3O92o5BNwUPjOL0+5qH4uRX4j7lPoeQonm0mo9UiOAjMtaJA
	jQx65AyDemqoboyH4psdrDt9M+oYKHvFn7Ce77a2XmO+5/EEE+9jgDfbS/Qzy/njgW9OuqzGQ/a
	jiWwmSUPntlOjPiqOG+8GF8u5VqJKj1c5Chqe7CmcP4ZlPbDe3Yby+qpJbtqFHsmsFjnFa1IybA
	X9Zg3cSC/xKMa0VQpCz3792RqXXn8ojtp+CAoz28mQ6DDfMTyVenHzE9oO4LJRp/8GVYEt4wi93
	c3bG8eHwuJpeHnidMjtRnGb2Q9X34xkENg/bCtwCTcoUEQ5sAwJhzdQVF55JkyIWJPAn+Z+BZF5
	5lte5hJR5Ho83extHOG4Ckw==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130936685a.6.1793011060070;
        Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130929785a.6.1793011059540;
        Mon, 26 Oct 2026 03:37:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3389733a12.37.2026.10.26.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:37:38 -0700 (PDT)
Message-ID: <7b95f254-ccb0-4ce3-9b35-c605cacdf74f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:37:34 +0100
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
 <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX9hqo790XOoK5
 0RpEosHuCrbik16dKazfh3dXYJZtnqlHLAN6+e8q8wjX2nL7bWowpyxzeXn3CVpmw1ts3Qj5nCX
 VcjeKW1ertUUbicwjWFM6c/Wg3owVRg=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf2d74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=vYu95guM48VmnKZvmccA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bH1eq_vnrmEP1bhyv7lmTlh81QfxghGE
X-Proofpoint-ORIG-GUID: bH1eq_vnrmEP1bhyv7lmTlh81QfxghGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX7dS3Nf57ACES
 kN2pWOQfpNCff5Ra7gcQAWjf0PgZbrC2tJEOaSPcyuhmA/oG09iWVnPQvC4/uiQXEvEa48Jp2pL
 ukL1BOWpWlcLYhqZKCSPvMSahxKE7tpGvWDenBc/s4A5+0Ji438+1IrcdKWjo1I7TxThSERsjRr
 EtUTWB/WqgPHn4z9AlxEKgshXdL94KPGNUj0jxjMOAuBIyPXkMz7zkVaHzQUHoV4LHK7TibrD/y
 kb4XndL3wDXFytIRFduEJv2WyXe8vNMNZu75Naxke0Mh/Pnx94uRtifoc/M7qr930m8DivYi+uy
 bKXw8w7oVvDkzytI+k0uhU4Dcz0EcDBHy7LpmVzDvyfSBaOx5VRjGqW5ksTaQGLEYn7lQdAELTl
 D535LV1fbDM2OPvAxJ6prcWujQrwJEJOT4/J67zCiilGhwYZGWDcWoKB0V92RztKHsv13whyXY8
 U7dnlpuC4faIlkUtZCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260042

On 10/24/26 4:57 PM, Anna Maniscalco wrote:
> On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:

[...]

>>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>> The rule is the opposite: new kernels must continue to work with the old
>> DTs. If the new DT breaks with the older kernel, just specify it in the
>> cover letter so that Bjorn doesn't merge DT changes before the driver
>> changes find the way into his tree.
> Ah ok thanks for clarifying that.
>>
>>> + Bjorn/Konrad
>>>
>>> Not sure how strict is the requirement for compatibility with older kernel version. An
>>> option in your case could be just do an override in the board dts file of the
>>> Steam Frame.
>> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
>> only used by the LPAC?
> It is a problem because, even if nothing touches the LPAC ring, it's firmware
> will still initialize and that will cause page faults if sid1 isn't setup.

We're slowly coming to terms with the fact that all of our multimedia
iommu setup was terribly wrong all the time. Venus/Iris recently had
a flurry of breaking changes. We have to follow suit.

Konrad

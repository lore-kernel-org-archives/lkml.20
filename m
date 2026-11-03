Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694531;
	b=aNMwq10tr0veKncopJb5A0h1W+GNZxY4SoKQZzyZlManvoCjGXyX/FyYOtvxfh6WhczA
	 0CBFOJXAQao5T5nk45HrFQo70AUET9/dDsMzBIPPphLArH0yShBhH6dKev1Ux1F7GbKHw
	 6lVjNwyi+METBoaa9Lt2PWI21yEVvUpVX4S5LbU7935E5alIiqeEeM9c9CGiambWyx8iV
	 qxonjiZr4wFD0xggh7hs+YmRORfZUfR7QA60+TmF1YFWfKOvOyGoHT3DlQgkXAYWiqFlK
	 Dyk+s8nMxe1tsuaVZZd+FwMk9upVfAd1u9/ercyU7zB20A2rhENiNg7Y8HVef88PDpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
	b=fkN1LBVnCkC4wWRboWZq+v5sjvvyFLnnr1x9riIt9KXasgMel9U7dn4uM6NeYCl6Nt/b
	 i0jLWm7DM28oltHfETheHc7aEENlRmUesfoSnyKVe8J52EVRt1IoL13yRRoW/65plIM1J
	 NxWDdrxY7fK11G0C4jVlex3rGtRVdY38VJSficBEAqzWjp2/jM21lnWG7JuHPzberiAbP
	 MyEFZTU81kZTHzn1VPHHs+VnLSCtwaPnJM0k14IKBYBgTeRrq9R+GLN9WNah9IH7BOqEE
	 tPwCGxZU2NpYvlsqnX5UFdYO9wwgBJrupjQ07c7znlxnbP91M3pIuOVNsHDIidQqSzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO+tkU3u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7Ub3+xa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0DB606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0DB606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO+tkU3u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7Ub3+xa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33htCW1141804
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zQxjtoAdJVW9VrBT+0USiYDS
	KO2Od7kw4WdhAnenrWA=; b=BO+tkU3usRuyU6yvbXf7k3jwlyHaouXFsXL5VSUr
	Z1lqxhnwxxqvOlcG/W1LFlXyf+dUdSxD6DMN4QL6OAHKUW2mYs5FtSBgORFncZaU
	0RUg0Od3C9vnPEDlNrI2+gwbagVPpkxTCIEKdZxJ89yIo69qSgPLBLLi+M04+/zL
	CluHAAxyZSTatfhUuKoXcUiEPL2y3iMyiXud2BasSx9EusPt9Qpn7hppDtxRmQDr
	iMWdzoWqbZFHbq6K+PJy1mJDy5fM5rhfLRucAb1ft9whw3uKLRGh2BT+1aJlAIfr
	eepNXOVTYGwsBo1vYRlS2bkSFXkOLbfIGjUf18DgcHXzmQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycs1c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:28:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so782673eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793694530; x=1794299330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
        b=J7Ub3+xa1oC2VDe2kr7F2feO/wQgpVwpskjmlgIUTi8a9vZ2s7UWmBvma9HS/iInbu
         1ek9GyTTRoJj2wO9NpYYv/TZ9JoUw0CNqrs6dCKtY/JKM/uMW/LeT9yiXpC+YLAcbEyz
         39RCydVal+rf65KWVmL/NN0Z8j+/twGqiJVqptBdw4/T2rP6PewMovZawSM94PBnrq/A
         /FvDWsGKek3z94XXyWzg/zaFHUFzhqRNLNF1awk9JP1S/awCL3DmJORTdwY6GyXMVLMT
         Ge6U6BTfSRJ1xca1vfH+RGQHSNqb8c+lIgPj2V72ntdJ2G8PqJuT5mhiPapF7ujpkQ82
         EfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694530; x=1794299330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
        b=OM59fHBjfjXbYF5KcM0BiZsFFk6DultwMRpIypejt6eEN9ZEsBJZ/Eok7izqXaFSNw
         OrnJamP0GUydQps4cVKMR8Sh5QWxSQkDGLWOptd72bgLGg+HiVCx7uVQmEDiE3/E/+Xe
         2OxWgscwXKc/5Qb7GoHlFaEvjFCVDwSIFyvw1P4xEqg5Qmy6CmBjsL5P1adqZxEiuN7j
         0MXp5RbijsPyitp51Tu6kp+VAvArbqz73GM6oNC/JNqnr1VPqdEXJUfvyyHCGhkzTeUh
         9j9Eh+azhd4xgYWyDIivNzYdbaK61/BcmLd1DN7yaDa3E8QxVdAeM7lC0Hjv4QUqJkLz
         rpMw==
X-Forwarded-Encrypted: i=1; AKwUvBxgWc6cjY/y4dLo0b77fQez+3PCzar5wjzdCUL9WzWtLQ06Yc/gml+oRC/Nu09Set+ZCZoDhO0lgwJDrEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MkG0CoDeDCQDo0azVESWHRBNxev1Lqmd+ZhDP1XZvU8UKmBos
	rFMZUJpKBwpoY+mUXP/Ka3S2E8wcw9jkX3ZyeZj6UI+LF3o0qt8Fh7VMa4Frwwv//gQbOf5AneR
	QA1ftxyjkRlzVKD6wvhY+ayDmWajA0K8pPAc0RIqza8cHrGf5IwDtYK5+eL0efszeICefFhT2G+
	MlwQ==
X-Gm-Gg: AYBFou0dWWa3nk6bVT88Ndya7ezm/YmYbrPvukaN1ZqHfFdYVLX1WA7PP61XQO2Stm7
	OaEbrNaAOPyW9bpDpR8f4M9FfIjVNmLde0MJWC+NR2gK8tMGQokB9FzfHpQAOaUhiNkl3iDK9Xh
	x/yosh27fhYQY0XlDyrBhqv3XiFvfck8KH639zrSxIk0XqhzQFGHNLh0706iwZ7r5SvXb3yh6B1
	nvJLjxMXWKTFkmFHl/2q6vak6tCiroPTJCtc0WRulm2neWeDu5tOJLizTpbNcJQfIXTM8xX5sSO
	WZBuzgSIXtsOmTjr+LRaj3BPNt3AOx/5c8we9I3mfmfxkzKofom6TMPH2XT94USe1Y40CVQLdzk
	SdYUs/6UTLc6DeGrMf1Uwh44jRs2aBx26kAnqJtE9x9ZR7IwuGtXHqIxM2JtDL5mIF84++Wr0f7
	4OEN2HDK7DhfLgqg==
X-Received: by 2002:a05:7300:3b05:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a3002ef31mr31205471eec.14.1793694529737;
        Tue, 03 Nov 2026 00:28:49 -0800 (PST)
X-Received: by 2002:a05:7300:3b05:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a3002ef31mr31205412eec.14.1793694529009;
        Tue, 03 Nov 2026 00:28:49 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm51976074eec.15.2026.11.03.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:28:48 -0800 (PST)
Date: Tue, 3 Nov 2026 16:28:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <aumbOqMXf-uWmGOx@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae99b42 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qMigHBYzDqo8UOFGUZcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LXJLUGBpinw-FfBHvXe1uRXswCKtT_G-
X-Proofpoint-GUID: LXJLUGBpinw-FfBHvXe1uRXswCKtT_G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX2iez0N+Bc7B7
 RkwzzZvXo0R3GgIrG9Xylow80GuvnNCk281mIuulY2XKoVVE4Nt98dTHXw/D97u84jaaD02M5l9
 8SqBBPNlISBB0VNIThTFSqY4xqq3twHKUCxmyNz0THkU1D5tT6eAChScTXlko2tBltQ2rnbeT2G
 UbLC6pGdPp+Qq9/xhsyOSr/XXsxiYvGba3+mFTPSzKinGFxLixAybhCVhAS0F4pjSOC6aVdF89i
 JCKqXGmPUiSzM886S5H5w4fibhP+deBdcu6uNMsY2XY0i4Lb0bpmXsgFdZlWT2oCAWHOcKSkvOX
 ocCUDZPNiF39tIKqVaubxFoOSytO0UaIpUxgBjn0Sq839VQfOOXYiv/zH9teDsPIjPru+GsngzK
 FAbCyojlEkhQ7aA4epbYPPOdZ8zrezhRzBDP+7V6tVMDpmCgZz0NPMQS9nhS3nKKeuVZbKKgUuV
 n03GhqMLICrnTCJ1MJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX+6qUNbfP9Not
 sewq44O5q/VCpI048SQiHDf7FQPYprwnfJ7bQXAsybR+GE2NI3G8fdeYyO3bXAPoVRCT1sY/fsa
 EhmpM2csUXPjl0y8HyCjo6nOUlrFcVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030033

On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> > 
> > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > and a per-channel thermal-zone for each, following the existing
> > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > ADC channel.
> > 
> > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> ...
> 
> > +
> >  		pmau0102_f_thermal: pmau0102-f-thermal {
> >  			polling-delay-passive = <100>;
> >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > @@ -501,6 +545,42 @@ trip0 {
> >  			};
> >  		};
> >  
> > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> 
> Existing thermal zone nodes use the "pmau0102" prefix.

Hi Bartosz,

Following up on this: "pmau0102-e-sdram3-thermal" exceeds the
thermal-zones.yaml node name limit (11 chars before "-thermal").
Since v2 moves these zones into the board DTs per Konrad's comment,
I will name them after the measured component, i.e. sdram3-thermal,
sdram1-thermal and ufs-thermal, like other boards do. I will drop
your Acked-by in v2 as the patch changes quite a bit.

Shawn

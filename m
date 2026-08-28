Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32397410D3D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921848; cv=none; b=VaXvZsSNkqpVF5H0hFz9A9e72wODU0v+aYB7voA9s8cm87h5SMuSGNLFdEFKDHO4worEsom7YJhU4S56a083lbKMb+0dPxiwAFPbQC0F7ETZbwrlSypEUaqvIOC3vwo0vUFAx+UofjKr2A2KMxgqbc8hwsF3b+X3Us8ANRXnp1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921848; c=relaxed/simple;
	bh=ru+yAHr3urcJ5M8KBNo1D5Vm86Tk1kQzSSNlmFlhCdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHcwKlIuD4/DHFvb8jlsj/VKSa2fmkPDKaPhE8ehn0F23x67uwYDGIInkxiNaL2KtKb6A9ckNEECpFjztR+WnN5yloX3Lu/tzoqf42faRoJeqQL8o78wBMofSu2mJZwJek/6q+potY9GiXCR1JtxjIdz3qYKeWS/4k3uQ44CVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCvK7way; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJqPqbxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCvK7way";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJqPqbxP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7psj2152630
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6mztBACuCG3RrcAN2JymhhQd
	msNbc5JG/TyNTdYCnpg=; b=dCvK7wayBREnZu+c26O85FnFRAduOdGhC+fgLPGr
	qWF2BCp8eMYP4UEvj7wyOZf4PxYQYOq7mWqUFnYlCRKTgj+2iSRkPrUZKszZCVVi
	2P5LtdddbCogNWmVLUh5zJMGkgdysU23qY8ti5Mv+y6qhkVlmvOlJQHfob/AD7R5
	v76WDqzPFinCPkfUU0wRaKWuKDYvXlpjRZo2Gkrnw08xKVU60zfJHBMcCFsBQ/qf
	PKKuH0413SrI2k0ft4h7FJ1MkzJcgSWIZsoow1ZKM3iBhNpIts3cOPr7odQK6lad
	uuoMjtooxruBBe+y19UPcjVUHxlchXunpF46x0F1iyJhSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9t17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:57:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52faa0dd18bso23203641cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921845; x=1788526645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=UJqPqbxPW0mfYhxV/bdSr3mrzsw94O3AsQZQo9schC85ljBd1mJr2XoG//kjRsWkgo
         d0RVuYWSGqOr/R1ExJA6DJxfaNlKrErefBzcAo6Q/KGHVhFvdGW2SqzzdFrxRcepynuz
         E7bwTq/3J6j92DbtsPSJpN75gHjXt6E0X70DuR2zzqeIAjCRYH/zgIN3ETjczCZf462m
         8qFMoK3+wq8Eha7pnRmYoU7jj1OZztLDdcFTrOAO4seoEfyEiuORXWPWvPb9S68Svjmf
         FSSznLg/M2G0RMkYgkMHxHE6I8vm4CzNpJ/9/PonP7414Cl1QWstT9qZCMuuTef9t9tD
         FBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921845; x=1788526645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=Wnw3wdbrfjAIBLqMIdl3iBxX2zieo39178fg/iCJFvIrsk/xs4Qt0msk0Zdkwii7ZZ
         rAECGafFgvyJ+sSLOj6OjtlS2b1o/UE8dSq+rxaMQKe5XK1nfYHUG6Aorl1kGugy3mTZ
         kJhHj9JD9R9MRktR/msfFmPWDT/ggv+9iuux02fu9KAqTnp8uMkQdnwWxmLoRIiPNxVh
         eLMkhUyrSalWE9ndLRhhL/AWHKWtoBfT9oNvLndvRjprqgtFZg+GuH+nA/PI6BMskRa9
         TF2P7CKgDT24G02ZgkaFBcNe8THHnvoaISyw1URDEoAPiZjF5W0mrThfINccgRlMZUIX
         dZmw==
X-Forwarded-Encrypted: i=1; AHgh+RpHKq3VlcYlA3jQe1Ap/Y5D/9YQ/TZMl5R6O6t0ipXgWM/frZqNoC31NNEsIwI8/Ovj8TWUpHJrhOi8w4A=@vger.kernel.org
X-Gm-Message-State: AFuF++kNkKxDbwugRYc6wtLmzvNov//JBQcFRKB0OsBmw6gOr/kAmcIo
	HVWuCkoSoDvniAmMHjH38wW30jX6ZXLxP1RlkJuR6Npnh/96XG2a1x+qv72I4Pj1BnM4iJnyYmh
	7CRFLPZUzseMp1fYI8VqUHdSBO2NhTgXRCOsgcK9HZ87Kg81Q9woequ+psRQuWeLAtX4=
X-Gm-Gg: AR+sD109okv+JjeOQjCsFwxS71hcFyhiZjr2zlPCkFee+Xstg+2Z0XJL3kM+l0z2Ras
	6+ztMJnDcX2kd8WHmFCQE4U5xr5k+LRuGPHT3X5OR84rtkG6n11QOhPpYDasGoXbxVQPob3ixdX
	yV2OBnaSG/W3GHvTITirUHK9bPYUVTdLwvjs84o9qWMoS9VUzRka0FbAHRCIZhreCApUfQ4Hq+D
	wVj+e0/YHJ8ubv9lE4uUiByWi6QNWjKvZQCd2CQNOnYG5aeqoiyE+LI66jBvp4W4rNNbPuiz5Ky
	cDc0AZ+Mg1m3CV+Pw+aIBIehhPBTkIujE0p8ABjvKl3KiCnP8YScWlyXn3widdogQMdQ9asuWik
	keHujXU7Tlith
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332581cf.23.1787921840517;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332171cf.23.1787921840006;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac8e61sm3986925f8f.13.2026.08.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:57:18 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:57:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Message-ID: <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
X-Proofpoint-GUID: 2rd9UGyi68DlrT5-92ngQ2QPDChM3dB1
X-Proofpoint-ORIG-GUID: 2rd9UGyi68DlrT5-92ngQ2QPDChM3dB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfX9kU/17KprAaw
 ofBuKjUCmuTRWruu1eKF93EHWHcWDFJNo2mhvuSOUyIddZ+UGN1HXnJatTE5e22sNVUhScOJpuu
 cJLmSAM5lnevm1xl8cCC6DWz66dRG2DgZ/JqpYH8YRcJSVPtLrAtGiiNthw8eNRy+cttJj4aBAc
 cA7w0PJXSybctKvFRDNUdYwlCzvI4qo828FmVxsZi0BOSYqhpo4a9tzFczJihCHBLTMA92npfBo
 eKGQNilEyJTl76XH71Aire/qQRAkuC4i4asOXYAaHjv84CJ3opEYLRK/nVwiPmtVHl4/GJ9xIIz
 rzmSbiRTvI5N1O3heKXJ6HXJS03QOcDHHuS1AyfaYJ0gik9ZyoTZWEkF5zojzTCeJDSmDmw7Isa
 XHTC3pTKfjBnJay25k3CloIjKsrJSH0IFvoxdiL3HAiSJGj3B/TyyudZ7auGjgkDrUzB8EkAbbr
 2OLTVdosUkSSGyWgwmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfXwuqMxg4aL5Pt
 BFUwqTFrMPT4bIptXcceXLZRpjo4FFpnd3gF+g/XgH+IKBmrfTsAaFYM44iVhUCvGojp/puzY3H
 cAOETMv8Qfbp+0IiNUsmM1hR6rElXbk=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a9185b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OvFCWnAnuTFQFf3-HNEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280112

On 26-06-30 13:25:13, Konrad Dybcio wrote:
> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
> >> qcom_ice_probe()
> >>   -> qcom_ice_create()
> >>     -> devm_clk_get_optional_enabled()
> >>
> >> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
> >> I believe this is no longer an issue
> > 
> > I see your point.
> > devm_clk_get_optional_enabled turns clocks on, whereas using
> > devm_clk_get_optioanl will only get handle but don't enable clock.
> > Please note, clocks are needed at probe to read ice hw version 
> 
> Right, but we don't need them afterwards in the probe function. We
> can simply gate them. There's a parallel effort to enable runtime PM
> in the driver:
> 
> https://lore.kernel.org/linux-arm-msm/20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com/
> 
> and with that all you'd need after getting the clock is a
> pm_runtime_resume_and_get() before the version check, followed by a
> pm_runtime_put() right after it
> 
> 
> > and then
> > later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
> > suspend/resume path.
> > 
> > But my idea is, if storage itself isn't there(like sdhc on
> > qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
> > version? as there's no significance in even probing ice.
> 
> On the developer/customer experience side, would you expect having to
> manually enable what's essentially a sub-feature of the storage media
> on every single board?

Wait, don't we do that for display nodes anyway ?

Also there might be a case where you just don't want the ICE enabled.

So I suggest we disable the ICE by default and enable it only on boards
where there is a consumer.

We don't normally leave stuff enabled just because runtime PM will
disabled it for us.

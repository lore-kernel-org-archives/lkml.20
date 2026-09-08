Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2F514754
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859906; cv=none; b=BvB4nt59YuRoCyrnKjLZunK1ENQ08zSPYaUq5L3WhA+34092ZYapPkV6fVFBtfrbmJCAI3DKQN4w2qHDZyjzFqQ5MbHF76PAJJ0xvnXGKWMUJsKsf27XrNwQkzpe9JLJQnie+9Qn1s/9RciKcuiHLu1OqPh8UxVFj+EbCi9+NRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859906; c=relaxed/simple;
	bh=NtWIdZwWcBMt/vTHkLK/bNAMKB0wwpukukTBna3f/Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STUP8w/w4Oe48lOaTO9b11AqfUgSB+XqAWH5LRqVOuZhds0qiKn2XdgRS3Y/8dp3sLPCBfsXtyfuu4G+VcrauetGWu1Dc8r4Sr6I/NYMGeKC7/YLyak78pCiiKfJ9AvJbzhc+g+4CVMLzeAoeFQ/Vz6Ye+9MGX0T28axAfpFqgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGwJ8llX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hn9abTrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGwJ8llX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hn9abTrm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6888cC7B2380642
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pFQuRhixWFDDoRatZnflwom3
	l9EKIkxU8GYrNZNTb/A=; b=eGwJ8llXiMuCqx3KHD8pVIrj1nhM4g13dzAKg9v9
	GLK0xeHqgc551xVatJtTI5IOplramD5HkVvlljigI1z96VwZDSkQmokw+dMpz+aS
	CKqEg6f5dcXc62tEofYxdzUPD9pPMPo6nYRuglWDTeTAm6FlZh9pQuFqnPVaovjk
	gE+hcVAK2+8FTNQbxRQzOG5SRLT6Kuy8k1q9wgk6Bub+fMMz3cCHXvzLvY3qiG93
	GQ1qu3/uN4Ze2bb7/j2fPQVu1aVYEaJ74KtH5Us2gheObhD4LKjxMO0vgSEfl5HB
	TrLFdfm/53jR5ohC/+F/Zn8ox0AejtuHF7tCucl6aVDDcA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cg773-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:31:44 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b34ad165e3so2398882eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859903; x=1789464703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFQuRhixWFDDoRatZnflwom3l9EKIkxU8GYrNZNTb/A=;
        b=Hn9abTrmdA22Q9S0oT101b0vashHwCIy3Qerln5C8rcoipyMoemv2T1CtNxnAY0ynr
         iG8U/LnVmac5nyDAWJ5agmY6RVcjTbmsHyIOJWrgzMfqlI3BtVp/tWDokZOYAv1PPHEr
         cgRFogfHpDzD9+7gcxIkg8v1pgmf4oyQgitijY4ocal07P2HN1dV22qm4LalNLPycGmm
         GtSoFgBBfEjaRN6vYbnHoPllBBe2Cjehp4atZVlz+CeQe2haoZkw3uu3CD0/h5YLWEQf
         SK85zcAUe+djzuNdDYmi8YYKoaemsSUhyOrQ9Ykhn1hRtsOiBvKu6ZnDhyz8sjZMy35O
         k64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859903; x=1789464703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFQuRhixWFDDoRatZnflwom3l9EKIkxU8GYrNZNTb/A=;
        b=muH4Pbu/wcL3E7WNlbw/601+5dsdSefVTYCKinEWRIHAvxv1fInICdhrOHpjYbWHmS
         RWXYea+8ul3LFr/PYtOH25s+CROzOu/ep5iRCTu7Xf34JhBhv4UXeCJMdivtzxo6RTJv
         dVqxNR/L24iSVjDIlwO160wPA3sWJR4yLrQk827hv2qm/k5j/ha7WWYo4l7ipqJQnHEY
         xKxq6VtKpDWJTtsrkMKSnt0U8B9ceJEVvpg8Xs00rBDTSv4adzJxL0o16NxNQfmosv3u
         p5siO0rho1p3ZfIcbkQTtTeXmys3IVQYHUchyu/KvWN7Pat0UkmzGd+C0iHjgVO1Ylo5
         NKhw==
X-Forwarded-Encrypted: i=1; AKwUvByqfaS6z+XBooaHlaySRQV8HLDNlalsyDjoFcv3sT2jb45wkcD+7sAkQ9pwNy04meZDp97Z2j30LWMqKBw=@vger.kernel.org
X-Gm-Message-State: AFuF++nZwPvybVE5y7rTN15c+gN7wfAoBAYuw+fiLkW5/BwsFKhPDFAa
	6sEzeRwOmkvdPsyI2Ltf28UYyALOE69RO/Yg0QB3DontRl2zH+CkXtAprM6PsOxwprg17Wwoa2H
	NmFltEIG5OcwxbPfHAfxLNaTZHbH90I3ax1qBoT3WcVSthe9jxqc4HNpjkClzDwVBcsk=
X-Gm-Gg: AYBFou1FM+yxBoPLFMzzj+dyIo7KJTdi8nfMHXl3jB6EQIzpl0QCBf2zKv7Co1mZATM
	xgXYRc9ti+t1FXFtz7rEsBF5SLxZGtHb/ofN8bbbL9/GoisIo9kWQn8hAc7o40zmpapvIlR9z9x
	JxsRH8l1RQgkwEphCYh0l8i2+L7XoRehbN/tfXF2vH+1F3yTT16bSxptf+pC/ImwrcfzE/Zao/n
	RkbSo2QMXFbhmJv55IzSJp9MT7yJe0ZgAzjZ1KMGhi/hxHjkX9xwWpAH0CrHCoEUF2gszCDC0GI
	Wrkh8LHxuPyLyjcwkMi29cTzGhbkBRNAF1BAHa6aSfK8WMMwIHTBCjuH+vNEJCSQHz8EyWU7H3M
	4Lljvas+k3m/Y/g==
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id 006d021491bc7-6b6fb8d26c1mr16621477eaf.13.1788859903148;
        Tue, 08 Sep 2026 02:31:43 -0700 (PDT)
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id 006d021491bc7-6b6fb8d26c1mr16621437eaf.13.1788859902560;
        Tue, 08 Sep 2026 02:31:42 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm54654325eec.16.2026.09.08.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:31:42 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:01:34 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap/V9mzGUA5lIbLi@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
 <fd428d1c-646f-47f1-9fbb-91f3b50760dd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd428d1c-646f-47f1-9fbb-91f3b50760dd@kernel.org>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9fd600 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=H1_jG3o4hEjZ8bdWLZ8A:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: DYcJIbUOodpsTfCYh7PBEXkI0VrbFcpn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwMCBTYWx0ZWRfXxhbmPwKvrBHE
 fcIXuDPOYI/t5jzs/cUFdQ08PEAJo0dlCAjfFO1+f0rjHCBkCyHRhB1r+TwQnMmVM3rpTNc4Jsl
 4KkPa9oZRPhW966291S67+vauvqYqrw=
X-Proofpoint-GUID: DYcJIbUOodpsTfCYh7PBEXkI0VrbFcpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwMCBTYWx0ZWRfX6ex0YYr4ZVt9
 4Pay1RJJdHXYVeCNhRxrze/4Wk06PYL4BSKQQwCuoc2aieyeCj56c9mABACCbSaxbpP8BdtrfuM
 JciPEFCkSe0lTPZqw/3ofUihTqNMTOtNFEkWoMeTwNOCX7IZR190NaBiBl8gwJnUvrg4V7xoG11
 Uxf+2PpqsLiMcHqQ9Ys04Fgt+KY7L7Rcr/nOx3aftTR2VKVgup0cJgYriqXR1x4q+g9toaZdXRz
 ACzUEJ0RgDLCyq7beSwVBcp4Th6wQEsahu6uzVhMV9UA7JAqDQljEbxJifhycDglLqsoHzfQNuf
 7jGOnzYZbpcDEoQ3qs57wzBYKFQEtv9CHojsXG6soihfJCLjp/X0PzX3G/+RrKRLDwgtlyTUAXx
 8dg3u5esp7akzODsbMSZeC3GL2i7UMfkmgHykH1zH9/BbSpQWczytipgG+eTmBhowozei5IBu60
 sFegZ+xAPeDrBqwhRQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080100

On Tue, Sep 08, 2026 at 10:40:45AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 09:23, Mohd Ayaan Anwar wrote:
> > On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> >>> On Tue, Sep 08, 2026 at 08:56:39AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >>>>> Hi,
> >>>>>
> >>>>> This preliminary series adds the DTS changes required to enable
> >>>>> Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.
> >>>>
> >>>> What is "PRELIMINARY" patch in upstream? Where is this process
> >>>> documented or expressed?
> >>>>
> >>>
> >>> My apologies. The code is ready, and I was hoping that sharing the DTS
> >>> changes would make reviewing the driver and dt-bindings a bit easier.
> >>> The original RFC had them together, and I split it out for net-next
> >>> and linux-next.
> >>
> >> Yeah, but why calling it completely different than every other patchset?
> >> Why coming with different style? Why this cannot be RFC?
> > 
> > Agreed. In hindsight, this should probably have been an RFC v2. I saw
> > some recent series using a PRELIMINARY tag, but I see that its
> 
> Where?
> https://lore.kernel.org/all/?q=s%3APRELIMINARY
> 

Please ignore me, I should have labelled it as an RFC. I mixed up two
very different things (some off-list patch I was CC'd to and LKML
patches).

I should have waited for my morning cup of coffee before hitting send,
sorry for wasting your time.

	Ayaan

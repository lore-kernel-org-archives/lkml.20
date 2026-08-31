Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A6B529408
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183880; cv=none; b=EqMitI0EJOHa1h4MDzBB/0ywr4gfGfeE33oIOtm+MroBTCWgkry4YwatyLwN+ASA2+E07FAIad70mWoEGcG7MQiGN/NiqA7AeGVniD7B0GsI/fCJY4dhr7nXY6xHTnOKsBPY+v0WABJwrH8bDAkuPh7i+QfPBpGNn4ct256G7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183880; c=relaxed/simple;
	bh=oiqARqCOkMd8hSrrfA2nLUvJyn5QS3R63KdLJ1NDbv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAYpGIsll1ODR8qiPZZoE5XBdGR9sXm7lDbA+/OOw4yOpbZfsV5cjriSSAeyOSM0WCu/qfn8PCUIfyr9BrZ3duXP+xMJaMkhFwhVaXOzxI1Phv4qnvxo/pK3FIKqKjvOS9TNgDU+Tur9dqjQlmv7r/HNP1yDruY1w5SVN9BA5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VanVX5dN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di3vA9Gd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VanVX5dN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di3vA9Gd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA6oG320837
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6pxU5CaPWXEMftRO7XErFgsm
	+7DIruyIV8kqUHD/wuI=; b=VanVX5dNkaw0w0W/yCr/EpPoddR6A2dCxwQXTq+l
	CbdTShS53hA+qnYCwzUfWL6UIGcXaCsFWc761whQv1s83NCA4p7+e0qu24YT6fEg
	lvQzaftWnXBMYm3jZ9KEVw9N4Ytx0mZ7vhSTblB6TROnNwpW52nlXNCtfIH3nlot
	0ZrU1ytMty893LJ7RhPd5FRxX1caeUELj0KlnEqmfkK9OPUUvOVlfdch+JFYrb/n
	RbGWZioa2TfqlLx0YUlKstue2HdJkUg5FKqiL5VS/SZAOyJpalblF9ahAVM2nc+A
	Sp9ZuKdH+p4B8k7fwcqvSqAC6wTjEjg4O4Oz+YxNX8zDpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvrnqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso387065685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788183877; x=1788788677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pxU5CaPWXEMftRO7XErFgsm+7DIruyIV8kqUHD/wuI=;
        b=Di3vA9GdseRt/eMc2Xq5k5X/ZIuMX9Yzv324p8XNB5dCbFSMyIW+sEYKXRijO544/7
         vSc59XE2sqZC6zw7rckOF9lpiPnIfoqcOwjaNq4XWLFCdxCeoGE++Ps5vVzv20GV16t+
         TmTouSp6KZ2da2ZLxinHTZUxlWgtUsFttSZEriyBAhrYbqe63/pD4Ray49vo+aExLaig
         iY/RvNlYlxF15CSAqdixQGFaMisDMGAO8Vw3yX9wFzDNTHFGzF8iOYtYk/zWOawwkoIu
         KPn+yY/6JGJKbVC63hZPQfEDj/C5lqfpCE2BKzswyWz7Vhm99+Jp+3tO6/Fx4hu0q+Ql
         pYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183877; x=1788788677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pxU5CaPWXEMftRO7XErFgsm+7DIruyIV8kqUHD/wuI=;
        b=BaW1n/5EtrEoIUcQE+iuwc6bx3awrbAv2nSQuV8c+6K8MuegzlbAJ7AJoGLkZRpERN
         jPa/fr9LlAdq1Gq7+5GikcxVQ7gOFgmFOqb6tFLQMwuqpoyq5rIQa6AosKiiDKHPd689
         VTE5AcGKPK6OwvTCGoJU5NksTU9T1Un6CObwU6VYczFkPE8PhZxIcOkgq8/N7ic4exhb
         y9Y+xIDIkEXbWKCza0wRQtmOmc+WapZaKv3uQIEcsTsxys48Zc3LSfarulNGRQvwVkqJ
         WP6KnyjFNrf/UNNCfAaerjZ5Z7p1zyzGYt6cv7I+S+f8lICV8t18MQXtpI5R0GAuB8L9
         eirw==
X-Forwarded-Encrypted: i=1; AHgh+RrnUmtbMp8Ho30i8aTxXb3IeGkARZkR33eYonCottoaO/tW3/vIePTCrgU88I/89RI9oVNe7MLpnXz6DbU=@vger.kernel.org
X-Gm-Message-State: AFuF++l18uJ1JHmExqbpdLlLL2nhqwmlSpEgg4BoKyWohfuC27TGHeUL
	1jhrS8EoUJ50I55Y6dQ8wNY9Lubuj/Q/AUWzAaEvR2tcAArVX8qIS1ITGqzVm1tJtak9WMl8Fa8
	yzb7EI3FcQMCaK4p1XZ6saS1K5hb1rppeh380r9m+628bGPQ27a1jWDWNJ181mp1Sc2U=
X-Gm-Gg: AR+sD11yHYTucW3BnCkXIEFfowvfd9U1qX7HfYMoSKmoW9NhddeK6x8+I+AvxY9icps
	ipvadkKG5ML/L75m8YMYEAHS77mVbpVeulc354nCbiNnstSQvBfhEjc23bnX4VTCtwOBGLoasLa
	xoqyMFQhybs9Nhq7KmPNhw2Vh1pl3pbPKgitr45L4OKStKcJIZYNQjtslq12U30V6jKrUihWgEk
	wabLRx4HJPm9WfHqr6t3nnyK306McHGJ9N9jxa5ZysBqycBzMEwcyltiINq2LlqCdT9ETaQFd5z
	FVMfpzK0uJAV5hlBomuG74MdcVJTeZWpUUDEJhe6xh6FG5/1N2TMq38CAIkTL95d6Gh2rhb3VYy
	I8DMp3Dx/ugm/lQ==
X-Received: by 2002:a05:620a:2b43:b0:936:bc78:791b with SMTP id af79cd13be357-9391379810fmr3355082885a.15.1788183876436;
        Mon, 31 Aug 2026 06:44:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b43:b0:936:bc78:791b with SMTP id af79cd13be357-9391379810fmr3355067885a.15.1788183875496;
        Mon, 31 Aug 2026 06:44:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48437bdd41csm11735854f8f.10.2026.08.31.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:44:34 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:44:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>, Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
Message-ID: <py57i22nmumse66q6rdtld4jern3pxosadhpzlq45a253m5mb5@4cibicidkm5j>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
 <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExOCBTYWx0ZWRfX6Crs/L2+KIuv
 fXA/1NgBAdKRTdtpqFrXKC81+ZGIMnvwhYdZ75id7uj8Oy91skJOzdvkPjmHkTorS+CNXDFFYG8
 VvTcmSwhHQF+CUIWKmSeLNtDgl6Gx58=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a958545 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=Wcc9KN-piPjDXZmWtXEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExOCBTYWx0ZWRfX+NX7JrKNmDo2
 iQsMSikin8HXX33sP+ZlmfiS4SNMyFtoXnRQZJfm44J2CNn1uMeVo+mzrvbrmlhTE2H8JgvmQT3
 fDclJDqE2VClpY+zlD3EvqGwi3eujvBhT1eQqciThKBbmZjg4UMuZf32kY/Q4+9tYt/X+Wuaj07
 YokH5qwF8NMBtTZWHh/t8ZuLPH+TT//QEd2GlmFvYR9lZxOC0hyxkrG54e91fDaUM8MitaLVkbj
 FnlX7krzBD0Sk+/uSGLWiIgsbyFbQFagFx6ZSIE0rdI0k/kE8PTO04VOfNMgzIISigh9BSkCNGb
 t4SmQCtPWykkoVfFIgyL3PztEtU6yPEdsI9UZPseh+QWZdn0Nz4VSRf5gHpEwaT698lxJu3ShU/
 9nnwKed7dLEmos7Q4zKJ5ooyX40uv8gRvoSLlQFi3gJegEPMUfo/sYc4bXcsoi12eAA+UIygFNp
 RNwvoYcOVgbzxxR2RDg==
X-Proofpoint-GUID: by05G2SCvq2ytNvyxBvaVg5mU1lEjEyg
X-Proofpoint-ORIG-GUID: by05G2SCvq2ytNvyxBvaVg5mU1lEjEyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310118

On 26-08-31 14:00:35, Aleksandrs Vinarskis wrote:
> On Mon, 31 Aug 2026 at 12:05, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > Reserve it to prevent Linux from requesting or reconfiguring it.
> >
> > Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Hi Abel,
> 
> For XPS 9345 this change is already included in my series for EC driver:
> https://lore.kernel.org/all/20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com/
> 
> To avoid conflict, could you drop the XPS 9345 from your series? I'm hoping my
> change will land shortly, its already reviewed.

If your change lands first, then I'll drop the xps13 patch.

But yours does not have fixes tag nor should it since it is just
adjacent to your EC enablement.

This fix of mine needs to be backported as having the gpio controllable
messes up EC in such a way where you need to unplug the battery on some
devices.

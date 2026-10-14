Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD962C11EE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940353; cv=none; b=XSG5fidG5MeGRevMp6fxRA1MPzwtEmnxBiwh7GbSbKw2IiO8IqGMLVcyQOAo2IKGxvuZX2qTp8Fae6bFvXe6g4gqAy3/UTrGwCvCFRO0t+fl+SESnj918F0M/JBwUxJR9SEEFJONjO8CDLB5PAb5JJJBSGmogj0SY7fOVsFvV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940353; c=relaxed/simple;
	bh=AGuF/BAKx4au5n9E6hgEnkxRW2YU+6PBvRqaK+PUX44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhXwQ30tdxMj4QXU6sSea4AVYNtGP282a/oknroIfsI5xCegRZJDNMmI4TODP8Nia5/LmsoXMlq6OvS6CGj/9z6Q+wFXDcPf32D8wfTUbyuMMnaTyIRphmeL6r4RdpS9da0qEMhx1pOkYSVEI2jfqd6otaG24ftiaEGaJQcA+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuQtqyDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwgp3aWY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuQtqyDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwgp3aWY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHRC7h3017676
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v8uHs24TbGv5aVedl8x0SuPj
	hTPMtEGP5BA8dVaGj2E=; b=MuQtqyDovSrdx06tFzr7ylmbcxy6k8u+EJ7R28bA
	MMu6RA3PDQ8NinlmQnGmtwXvs5YGo3ICVxStwEtzpVZcr4rXwkzO9NbxeHBGCPy5
	JOwhKB5h8qTm64qd3MrKoc9T965MhzrL7ecumZXnqYiLPYk3gpMCrq4nqkJtwMkK
	jVGSOzVoWYHsEyZKbCJ5Id26E/U35HDzWgVzaT/t67FKkg2+09sfd08MOsgrmj2F
	ETroNIbfunBYMS2XuJYMRrOreEQgEnLgfNDjKslrkGeuvvQGt2vk4s1cYwv+7mCH
	ZiNQB2sY9O5bG0a4QEqotIDoRzJh4enUn8l4ctkVziJvcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b1qec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:12:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so987366185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791940351; x=1792545151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8uHs24TbGv5aVedl8x0SuPjhTPMtEGP5BA8dVaGj2E=;
        b=dwgp3aWYabPjbIMTLI6Vq3XJBMjHF/d5ffqqw4IZg9WGCTD55JFFkqRKbSwANmOLM0
         +QcmY7f+Bu95TGuDdZOS/02Mkn0OIeG8Ri3gA7Cv+YuRqVjqA4cpEyrUYTcedRG8hAlS
         0MYhwKO8dCTSjB0uenl9GTAyWprrT9/N/zBkl+0ZFlbmNeeQUXj6VDGrx/BM5QUBTrQF
         E2NbcWihE8cyC730cb7++RuTnDVd6GvSlXRsPF0pCdWGs3n3et/dgIcJuoP0C5L9Vlqe
         XBROHiQrgTy+2/ma9uE9uo+2pqGZKtXqypWPcvbsll4Kqx6HH/zA/rHjLGD2qr25HaN1
         bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940351; x=1792545151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8uHs24TbGv5aVedl8x0SuPjhTPMtEGP5BA8dVaGj2E=;
        b=zwQJmkJcfZyjsbn+Rflw3+vJhAm3R60eUtENOPTnpnNIlicY6/6rV1Efjb3JKVaGaL
         9S1Fq1qqsFnYAqzZNKA0Y5nsruP8lzx75jYUNrznR3LSsmP0/JmMRg9hq9QNu+c5fIOz
         rpndzDzOlVdaOB46gs4DIAK5qBgEAhQwLIGcZ/YzAHwbnRtaRRBSvblPGgU2iy95LFaa
         EsO6lRLuGNPhOoUQcG146o1PKqn2fGZ6t99QbVuI2kRdcVn7/gAty/LhyZ/lm20vOGqS
         +A5PXo2mPQxMDi2knwrH/yEsPlCcisqAcU9f7FV19MrwoyyZUWtFp0R56EI+lF06xz7Z
         pjiw==
X-Forwarded-Encrypted: i=1; AKwUvBycSFsWqAeabmKRV5QecP5GqRAaQ6IkuVY8Aqsbf95L3MYxSUI+S9Na/bhewRsDmmyRgFDdhPTrFmBq6Fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8yuzmJtkodZU4SwDFapLPAAmycfvXot50WeT1CPQYOYME88aQ
	3qBYiGUAW1I1UUoGtopaPEOepy5kKg1OEJCDOvoE/8m9mj8guzx3IYVIgj012VIHfKP/JEmxOe6
	32a7MBrFMiTOjlcNZHiK60e4sKpW/Li8oqpG+6l3ywxBj1so2JdjS4OxDhEOZ2M0ttnM=
X-Gm-Gg: AYBFou1nXfSlhiiyWXLXgycTPc00AxmZeqB67sRF+98Sh49C3ZDEkBOU4keCqT/AB8z
	bbNRnBbGVpuGJ6x83q/tYbB303OsEvtkygXQ4940/DWV1255a/BGM70BbWffxbs4f02eKqFyk2y
	8aH3r1/FR3YeRubY3jEGXrsE/Dok7ojJIbnBCMjcu3V3UiRc4JbZ5nlAsY6qykktuojwCsxw7MA
	sI5n38wiIM0LLbQRxnH8j+moyDlgbtyJKmDi+EBfNyybtZpxBbfLShQfi0Ztq6xkM8hlHGkdMJH
	Ef6aEsJZpyF/uRYYzaaanF1t/kKXfI/7wiJqWOVyiE13biqCzys5iIxDcbBBkAB23XWO+bJxTeb
	Qyn22pylQYq89kq3jSMTsqWvaZQcBaBK0Z7pVwgxTRiEHNJMlUk60vkwAEIAOHGtskzHHzhpKTW
	jY9T/go3scN3NV
X-Received: by 2002:a05:620a:44c1:b0:93e:9927:fd34 with SMTP id af79cd13be357-93ebd2244camr2230158185a.28.1791940350471;
        Tue, 13 Oct 2026 18:12:30 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:93e:9927:fd34 with SMTP id af79cd13be357-93ebd2244camr2230153385a.28.1791940349858;
        Tue, 13 Oct 2026 18:12:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d9041bsm271555e87.60.2026.10.13.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:12:28 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:12:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
Message-ID: <bv3dtgkfsoy2rui6iph2n4aua3y3r4gsbupls3sdj5frallxpm@hbhbbxxhvldu>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
 <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
 <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6aced6ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eYbMM4FVXoET8UIPlJwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uPVrT1xakiuUggjGuaf42N2_q3MFgJqT
X-Proofpoint-ORIG-GUID: uPVrT1xakiuUggjGuaf42N2_q3MFgJqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX1f+XuXOB8Ctw
 nH2e3gov2hvjxdeMSOUDS+wfQ3QkT/wcMQHG4qeqLRJ7l3PjWGEzW/mMkZezOyCqeVlvldYZvwh
 dZmAkmP6ZFcA/lo5V8p86ylQIdCuaayK3uwQG919Qd/r8PXK2GUaL1lx0/89h46dzQ8EfAqjwCd
 fCgU6Xb/SXY4VJqD+oxYCfpObeqBY5K09XrQK7d2LV7Ze6CBIWfJUM97491f51hfcgIX+IbpD1B
 j1AGCz4uSDBqVYl02vF/g04ayXRSkaVKRbZ/pMbsC1ch99jQS5qECHltYxaD7FLujFk12DW6GXk
 iGOrVCd8+OkOx7irNOGJI/6l9qJMv/79AYMzLSiu3/pqsTGvDcCssctZQ6UG13c8PQ18Rng7UGr
 dJ2+zhaWc3ivlpoGC95WX2RJIwjl4q1U/vkBujrAIda0Pni5Yp0uJiqxe5I6wIiIS/BiJl6XKQc
 B5a7uPtpC9jp488UD+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX6eE6PseYM1Mq
 ajYlMC6b5/xajDgjybB+J6ilsMS2THhwArrWympws9W14eC4uCavRZwT2VXdnldy3zSMy7rVdgX
 RYwUbQujeUP8nBLZ3dHwn5TwMdBGtcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140004

On Tue, Oct 13, 2026 at 10:35:06PM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 21, 2026 at 04:29:43PM +0200, Konrad Dybcio wrote:
> > On 9/11/26 11:08 AM, Maulik Shah wrote:
> > > On some platforms AOSS do not respond to read requests. Read request in
> > > such cases will consume the ACTIVE TCS but forever waits for a response
> > > blocking the subsequent write requests.
> > > 
> > > Skip issuing read commands on sm8150 and sc8180x platforms. For such
> > > platforms return success to the caller with the resource level at zero
> > > to avoid the caller taking any action on error code.
> > > 
> > > Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> > > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > > ---
> > 
> > This works as an immediate fix, but I'd like to get some
> > comment on this:
> > 
> > https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/
> 
> Maulik, any updates? SM8150 is still broken. Should we just revert the
> commit?

After some debugging, on SM8150 reading XOB regulators times out (at
least it applies to ldoc1).  I assume that SC8180X has some kind of a
firmware fix. As far as I can see, reading SMPS or BOB regulators always
produces 0.  Reading LDOs seems to work (except for the XOBs on SM8150).
I think I have a workaround.

> 
> > [...]
> > 
> > >  	DECLARE_COMPLETION_ONSTACK(compl);
> > >  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> > > +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> > >  	int ret;
> > >  
> > >  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	if (ctrlr->no_rpmh_read) {
> > > +		cmd[0].data = 0;
> > > +		return 0;
> > > +	}
> > 
> > This should be -EOPNOTSUPP and consumers should handle it
> > appropriately

-- 
With best wishes
Dmitry

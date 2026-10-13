Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9253C3C2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920113; cv=none; b=GqhDChzpjhL1bbhV1jAe2U+/eL1HSrrmev5WWv90j5E83IavbUuoHT165oaO5u/7oCEjoERcr2gnC867WW1c266Pcs/VYgkFYSgkIITnPtMKULmkw+TPVhpXHtomXtvEh7LkfEsOzbh7GIq93OMQcLvPmn6LgT4IyRHtTXK+oPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920113; c=relaxed/simple;
	bh=F27BAEZfm3tcJz/NI3m4hcFR8pmZBDDahEKHtdyiE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZx/HJosFLCZFodJEkbyARSxOyvhgW+aeX7fe/D0IMzGCBDbHC6MU11pK/HfbBJzcKh9QA0mOmcCp7m8RgrIxX4yPp6SR+08a+VSaoDpolHp2hMLtcUjGzzWJkqrek6XYhm1o3bqYM2xD1TqHfUacYrDwLxI2Kd9GUF+rNZPIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKUGmqS6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCKjNwHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKUGmqS6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCKjNwHC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3S8J442747
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2pJw4wS84zkKGQAUnSx20Oil
	d65I0R6KMD1tR1I2vUo=; b=GKUGmqS6GNtpON1P26ntvI8NiF4VkXuYPqEfn20u
	ZsDX9eujs4oBVwaRHWh4Yjf20kGRTy2pluKLZm1OUUeoFsew2j4J2bbwgQ+oec6V
	BW7nhrPcM5Zbwgz4sgXmfpLo4cGMMaWGWOr05wbpid+QQKt2C2hKcEUriEnPohCp
	6gF51kEpgwfu3RmypLmABbTguntQ9MarNXwSl2yJku8+7Yeljb+wMMPz5Jo6IIFC
	E42GNaqeKk3vtDRb9YQqOMYM/+tWnf/qJ4ECOM1zxiu9XLunRx1zLN7UriV2ayJl
	otpTWV1OhullX2IoyTQzDGUOGPR0PTxBEJBtRWpFDijnUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71hukc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:35:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea9ea9d13so564291085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920110; x=1792524910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pJw4wS84zkKGQAUnSx20Oild65I0R6KMD1tR1I2vUo=;
        b=DCKjNwHCXtgmZZKsrjdXcUKKlYvOzAMGJ0il6yuvd83o26OU3BJkCegM7GOsaXXjNH
         Xm2GNDPxm05g5u8fvGll//Z2rn0q639LSbxPZNeV/QTBFY9HZljC0qCFxCZX+W2f+E1W
         pgiI/gzGTEouHcInXJusgMd/m3PuPv3IrPQliVlJZYt6jGMA3IWbW1kJ5krQG+yXrW0F
         1YR/TPwgmcMS4lGVvrx2iENmAX5ycoZlhi7lW2472PmygT5/GvcMO+DW7SJI1tYTcrmv
         x4yVNbb2cDQQQ6H/eNRHKbnOi8XjGQRimMQ/eEqc69a9UcjD9NL066IuoxPxNmFD8DZj
         stUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920110; x=1792524910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pJw4wS84zkKGQAUnSx20Oild65I0R6KMD1tR1I2vUo=;
        b=j4nVqeqQf3UJiGSYOqKI11U/tdy5/R2qNDMtyTCwm6b63dqcxARqQSZzn8fjF/hVKF
         qR8+lm18+4vZGEyK+UzoqT2UKPfOWTu4WP3980PNwAHIiNGjaYSJlfQoOTG9YP9z9O5Y
         PqgFRCzwG3FiNO2x6wf5PKiGQtlY8hRk03qSzevna68QzEyk0bofiBSDnC085UAY7JE+
         DpzuOFbjvbvHIlJzNevxWDuSuYH+Ub3+Qeny0avGbca4iFTFoTPvK0dRYY0+BdjXrOL0
         NzqoAbpyps6kqeuhtL+DnmonfnJa40NzN0Fm795xLv1HZPKa6O4/C/1MmmN9vTTLngvV
         PZEw==
X-Forwarded-Encrypted: i=1; AKwUvBzOwFxraEgpkink9RDiBsDpvStqhGMajc4Q/khFcKa7ZmpGGf4zxHjN6KNziRUodz3NQHjbLIRx4Dl6zI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpcisdHGyOlt+hdioLuXuDAwtfrmTTnbE5Eeoyio3ezloknGZ2
	M/vk0gMWsEtHAup4YONKRXt/MOajNR8miNNPRq9MNYm/GCX4niPsL0H8Gxzref1Sy0EWKAtC28G
	q3y2ENKaMGABVluhFZ4pbXQ6KOhuJYgc9HZp80TdpUvJ89G5/Vng3f+M63ItAdsMKNW4=
X-Gm-Gg: AYBFou0sksDfiQRvIToRPzZRWUlNruN1Hz3lClPt7Yo4jsLtug8lVwlSnCnajdQpL6l
	9hbIRrut3M3aB9+vOagMs9WCDRTF7gwBs+QiwPwzJoGgzxsc3eucmtpHmKi7w0us8BQ4id7V5Gt
	3gq2rpaLVhhhtcgmbpj3jqgglNfS6acZAyxhXo6cMC45rm36EVVHnAPTEJrM1Y2jCNufO73zqAw
	jvcPoreY69zrdkxx2n8HzCvj78qXWqlFB0zpivKo2tFDTA/hH7ZQcmNolN4jjmCO0EQd6Onpr7d
	44V4aNghLEkhgTx0Q9Qww6hET1ogGjG23EJ1jwQP/ALembhxy26IPwzRntHoO4rNCl6Zc88lISj
	sBLKvHqtXzhuy+ATX8pfMhlvGlqJ94jJ6o0LauELzo4ZboYLX5xU7sXcFYxW50ElqYJfdVpqtG9
	ACWBRpCyYAWTJS
X-Received: by 2002:a05:620a:1722:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f01d599a2mr131051785a.73.1791920109740;
        Tue, 13 Oct 2026 12:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f01d599a2mr131048685a.73.1791920109255;
        Tue, 13 Oct 2026 12:35:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d6ffadsm140754e87.29.2026.10.13.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:35:08 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:35:06 +0300
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
Message-ID: <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
 <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace87ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fcFkctl30oArz797GRQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Atr3UYeCoohHugZN6lQiXozte9CtXit5
X-Proofpoint-ORIG-GUID: Atr3UYeCoohHugZN6lQiXozte9CtXit5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX5RnzLQFVtzl0
 tjyTDhR1gPH6Z3TdDVByu0hUDZX2EESwy1boCiTH88tuR0dnDc7EgB2hBAcjYNKxSNy6N/ZKi6M
 WO8E9cwxmGV/OPxFXbCckqKkMT5rOFMqgrnt0xCBGIhpzPpE1dMb1g7ojP22ZdTjsLQAeD3wHlC
 NcgSBrtAvIXcX9wOU+kSrlVEN2S/YmL+9juOeR7SycUDwDh3dKqfLB7t9sfTqJxOogF82IArCti
 f57xtvmqBoK+ORIzb69vWLL62aTxTQwckaFfijVVI6fxQzMMMFGOazy+rKo2yZLPgEeu8Jp9RY3
 Doi/TLCdofd7qM0JQ2vh25mFBh4XYWb7V/aWfmxRCPE9kBxOHtrnd/96fXDooQ9Uhk0HWTjosCC
 MN84kMjGYs/5R9DjNDw/YQngCmzakdNEd3UsMQo6IzU3SEFL2Fr94Ss/hOWYyt+WYrWYGhLt8Y7
 ukq5J2sx8c+VCmVqXFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfXwrk8paniux0/
 r+WnIEeTO2HtQGfAfstYZnOC1Ecu54gPLREBJ92xL2zGFtj/3WUbQ0M8wYs3bJKL1l0L5f/4+WT
 H2T0CzMaX8FEjwE6u7SCVM4m/L0h5po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078

On Mon, Sep 21, 2026 at 04:29:43PM +0200, Konrad Dybcio wrote:
> On 9/11/26 11:08 AM, Maulik Shah wrote:
> > On some platforms AOSS do not respond to read requests. Read request in
> > such cases will consume the ACTIVE TCS but forever waits for a response
> > blocking the subsequent write requests.
> > 
> > Skip issuing read commands on sm8150 and sc8180x platforms. For such
> > platforms return success to the caller with the resource level at zero
> > to avoid the caller taking any action on error code.
> > 
> > Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > ---
> 
> This works as an immediate fix, but I'd like to get some
> comment on this:
> 
> https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/

Maulik, any updates? SM8150 is still broken. Should we just revert the
commit?

> [...]
> 
> >  	DECLARE_COMPLETION_ONSTACK(compl);
> >  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> > +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> >  	int ret;
> >  
> >  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (ctrlr->no_rpmh_read) {
> > +		cmd[0].data = 0;
> > +		return 0;
> > +	}
> 
> This should be -EOPNOTSUPP and consumers should handle it
> appropriately

-- 
With best wishes
Dmitry

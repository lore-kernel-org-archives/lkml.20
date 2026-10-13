Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A73475324
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887818; cv=none; b=BzSMoSIWRdOwJ6JEnl51Xeutm1yU/QZ6VOOmqtltwfPXTlD+Q2A0S6h7lY/p1swxs/of48vx9aOK8jN9iUtA1H/v63scxhkBbXDEbd1kYKwF+uY9eEv38Lm6Taq9yAgCw4sItTlvKSy3ZDsMXJbMLf0goSUF5FgWvKx3VGr9lHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887818; c=relaxed/simple;
	bh=kIYdOrZioVi+Jik4xHZPXcJ/cUSCGThc3VkwxvfhXeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7IKp+q4ZWYutUmWOeulKHvMwdru0EojuSAvul6PCOHgbd9YTprXbi0n26GuIu2iceNngtgygYhi8FrHjHuy+EiXrx+jlW8etTEWwSoJNRNzu2cEtypnXJT8741hcMFYPbfxGOq6kfA2Q7Vt5eCj8DmDMJ1B0aoE9XlaVpVEiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+gZru64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDF8zZnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+gZru64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDF8zZnw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9RA0u3476072
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zYBal9rK8MNWw3sb2Jq+R78+
	bxU2u0lgzC26Uirjy0w=; b=m+gZru645F8w2TLq7cze0QWS1WUWo2ldE0TXPJcH
	o9c93wWjyTIXJBGf5o0lyEIRt5Aswm3YmWlHMmeV/IHf8Q5IRVTvad29KRGm1XGO
	q3+tk8klbWPW5UVNacHJz1WzrUyxCb57UhocLcDzv8zefoQqF7Az40k9T2m1mAgY
	nI7R0QuhmdLDOq1bR+6pBth2pxIOehKK9FIBSPGDQoMCfYsJeJ14jdkYckidv0+d
	b6XlPdEChMaXNp9luxV+hHBRJI3Dzt7HHd1L7zOTv5DarY1cYFqPAlT+eqHb6+gK
	Uo4sAUZRTRd1qKqm6P4p8lCMs9TPIHEzFHopqrD4D2OaZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9k0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:36:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so550690585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887816; x=1792492616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYBal9rK8MNWw3sb2Jq+R78+bxU2u0lgzC26Uirjy0w=;
        b=kDF8zZnwn3+llg37DiQBw7rmglCSD71BwhFXD/vVtmIRIexRN9fq0dsbHTTLxeFNT3
         951zsryqBfvN6QnJ+32qifqqdEMJjZExF0gHaU+um2rSbF7m6h7k9L7U8iDAbuMTisF6
         XOTWrp5v73Gp5OPkQtfkLXBpJOhrG0HnwghPh1P9XBd2KTmTU5g07WxLg0HzqO0UZ9J8
         6SL7rRD7iTQcDLDHS0yz5lyupGqjgCHkL6gSCKwN763MEaBBcq44qVPC371k558BSCMV
         AojUMd4FvodKCDp7ojSy2VT0J7OSG+OdWtY/lKx0geHVSjSlPHn8sAzTzXS4qLgiFZ+2
         7M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887816; x=1792492616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYBal9rK8MNWw3sb2Jq+R78+bxU2u0lgzC26Uirjy0w=;
        b=Xjz80QL0f/ifm/fnIdtkSHguwFg2xI6nmSgzns/o7jGyfL+Nn9IfchPuRRSmhYqPvV
         G/f0rmwOdx0en2R0eheNQGqvW5j209U3OtJBW20smbr1g45BQroBNhyf/djafUuwYOKb
         hTxaApizVfKl7jS9JBU7+dHYV2fRXMViOnQSqQ0mYJ7+6z5UYFu1PBAcD93KtP4vcwL+
         8RpBMdCGOgK0avsjTvCr+oJko9THI7Rc3jgMTcdNuQmqr8rOABQvC4CuGGeWE8Hde5hH
         vFlyYjFal8m1B29M5RwVyHoJWZrGAK9c1oq3GNtBVUkOoHRI7rZO/a1r+vACgJhWtu5B
         0nOg==
X-Forwarded-Encrypted: i=1; AKwUvBxVcXAKyBpC1vExvjS27yMtuM+ghlIbNhisi3qt+lOlhcw7A4qjPZaV3dwzE1OLX8YpW5Luv3evtqSjNiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYITsqowicaCqD5QfNYAc0FotqVxjBlRdOOEpBpW6I5maAj8oSWs
	LorIhP5nzB6RoMVu+zuQYnvASqLeicM0GnWVyEAgeiSMy9GTbCP2v00fOhIdccg+wrL+5O8z1Ou
	kH/8DQqmRh5R2YDOxW5v/LLaNGB+IAjubWqbTXn0q1JK7VmS35lRMFciiY1QdebRLIfA=
X-Gm-Gg: AYBFou18duFVsotrrUm9/RICgPPatQ2lwZ71OfUAwYm12qPBC3HbhOE0RasL8YtwR/V
	GPK+aao2dMqa3JVR/Mwc31vkC95e90zaBT6g2RQtk4U/bg+7+0TMfYxVpPvB6EEruSfY7GResEO
	iSf2Lm6a/3CjCrlKy7vaLRCQyTzkq7tyD/xRdDngWB3x7abzxVyRPZXfNvOhO3SSBG4ST000+jH
	HLe0Fhp8GYkpriNYLLEzZC3dQC+8yfzDreqtLa+8lTezn3Ok7XaVP3Emw0FyuEZw3fDXkQrb7bU
	1T7vqVnhezzX3HFoecP97IthORt19GaVeLygF0rpyiT8xhnz1t3Dp+oiXJ0yPj7lAR6Q3t0ODjN
	HZRfC4A0k7/a4xIuxTdXBC1uKFv5nJ/3+FvI5XZ9j4QtaUFTX9EBBM5XKVgxViqQsYGxhjBDLok
	KJ0k5ZdQSGU28b
X-Received: by 2002:a05:620a:29c8:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-93ebd20b75amr1988582085a.41.1791887815651;
        Tue, 13 Oct 2026 03:36:55 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-93ebd20b75amr1988579085a.41.1791887815195;
        Tue, 13 Oct 2026 03:36:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm31886291fa.30.2026.10.13.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:36:52 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:36:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
 <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
X-Proofpoint-GUID: DU2slJ2Q7eaKvIURrDcRHDU-jMapARVA
X-Proofpoint-ORIG-GUID: DU2slJ2Q7eaKvIURrDcRHDU-jMapARVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX2bmNr/TM4rZy
 X5ES3IQrYFCLpII0gkynbZrDhnXh0bWcwi8Eboc5Xl7S4YB0iOls/49AI+Rv4N3dZMdmH7ugY5s
 D26MpshdQ3BJB0s6rlXZbil4uX9U91w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXz6j4jhowbQ7w
 BA7SQRWq85ISryVI9CdsjR0Kwknucm/xKiviq0UahM46BsLbt7ZpGk00dwz9TnKihSnZhlpY9Hf
 VBeslVN0jafKaok5FhqXCSqm+kP7SHjwZuyNxXpxb8dZvv0e49E2Rmh2baGQ4d9ZMqMXKC8yoVm
 b5UYTXPZSQFYAz8NkSC5MfyM744UhHgtBDQhTPvnxSujpyGbyv2sSuFX5KMCpnKtd1KUgewIcfu
 UOBzCFb+VfHnI9yg1PsI9ZGZ96tyqAiMs+pOTE/SVM9dMvgKlL4e4wgjXs6mfPhmCW0MdpkBiBh
 8Oe7g8XkRm6JV6yavGL0SLdv3vtZ+MzGS67DrwzTPLWeTh49MSU+9yK3mw1JIWcvkVwvAsoOBSV
 dpu9H+nJAu2nxsiKmUnAgYHCWmkWuYsSHrIgNPgjI3yxnPdTbOzYAcgQGlBp5dZw6/KQVIICoUt
 be2sGLkbG8fo5oqWnUQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace09c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7EVh-ISIaqCJ-n5hSr8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130042

On Tue, Oct 13, 2026 at 05:54:44PM +0800, Shawn Guo wrote:
> On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
> > On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> > > The GPU2 CFG clock must remain enabled for correct operation and
> > > should not be exposed as a controllable clk_branch.
> > 
> > Hi Taniya,
> > 
> > Could you share a bit more information why this is the case? I do not
> > seem to get any problem when testing without this change.
> 
> Never mind! I can see the issue it fixes now.

Would be nice to capture it in the commit message.

-- 
With best wishes
Dmitry

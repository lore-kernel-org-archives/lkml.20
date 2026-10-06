Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB353B38B1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281033; cv=none; b=P5rr+0HYsOI6MfmUoUQaYRfwsn2rHWJkOFMQ+N95qcKdNqS5MFrapdJ7nQSM6ZpCIF7wVCz2wK4+1HjaNElmQ3azaBSE+/enVUQEsgk6+GlLZw7kpgZkpTPy13dRNslK3vdV/FQDekqbhe6o6zt9TWYWeIJ7plQMNcxn02wBPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281033; c=relaxed/simple;
	bh=2JVwjhbTYMX4hzNLs3LIpLu4G1oRPsbqm8P6W11/F28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCXbT8OhCTRf2LqLD67PqqBcFb8iCRQR8L0HAc5YgtCRA8BTdE+/Pi4x+SLBaGh+qiWkl8vqZSGOIf4vAVty97EYZ3ZRoqZ7fVtKmx2x4x3A66oqykcB4duL4Q42GGhWu0eUJXsvDgClgylbOdHui41dqmCzU0dU6ceIqIXKHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cd+F7pQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCGPfD4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cd+F7pQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCGPfD4K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6967ScRA3537491
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 10:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MU5nctoqIA68MneYBkldtsEU
	3XmbtRT7aYUkoL37ecg=; b=Cd+F7pQgN4yKUAygoFuikH4dLfdjtVG3wL5eQd5q
	vIgPpcYatJ7DuIdGzcMaxUvsjLjHhFFbHVHi/q5/W92f/sxSwbYwMKs+1l+L1mbN
	PkKpb9PBAlMGpCE2rnCN2VeTUlON9cqGxknO4h8bUSUMj1Qb2GvZbQbZlcZIbR9J
	Q/9IW3On0x+s1oVlcy/PkzjIeh+9Sepzr6+3vCOeRzlyBfS7X8W8Oj9DJwzPvXNf
	DKG/0zn7YPrNXWK7IvQznxtZLHQ9nR0BhVbaEY99IUycSRk/fsQXIQPn6X+r9f6s
	ogyI1L1hiIHC3UHjeBYSGwcoBeDqH1duTGoL+nDiXTt1oA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrhfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:03:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143826c4a13so1449185c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791281031; x=1791885831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MU5nctoqIA68MneYBkldtsEU3XmbtRT7aYUkoL37ecg=;
        b=fCGPfD4Kh8E5tm91BCk1chFlEkeziENjNcpAYP/uCw7RpWN3xFqrq+e3qOR0gImdIT
         8/SLpsiwCd2EixCWAvmL8QgYDbwEKXEofdkJsIz+x2K82Q97yvP/EVFmtIv8NAJ/ctne
         91iauRRwJPdAH2BaGprG+estZcIsyJIBIjpbq+jqHbsGufWJ9Gr9jzqWRtjpQT6tghYO
         athzqWxqP6DO/jI2cxH6XO/ni1s1XVizZIgzb3Q2TomFKu57YInTsNn243kZV4i1S5/p
         +LY4zyQaCHgHyYk27dmMKx2TO9gAsf/rIHc5w0+vi3hECfHouKM+8Os2nGFcVUDKBtWh
         0mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281031; x=1791885831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU5nctoqIA68MneYBkldtsEU3XmbtRT7aYUkoL37ecg=;
        b=bj7n/Psz4D+qpUxCkqgqg1PQ9/vHMJQ1RBn80flNf/wS8ggUFsvYhy6GUWTT1DbyW0
         dJ1FyC3ok/Q2/ZYs9vhmC9i3wumU09arRyXWpj3zZQZap1JpzzLZ7Wp2lYT/gPk6Ua7c
         Xv+hpN9nGVrlplAX4n+B0aFD/rvtGm1HF3jaCVstX3pjtQljbXMiE5CwKHcFK0GZT5/j
         +6Vp0/EGF5ymB7GaDOZnOP1Lm93tDnxvij48WBx5fqtpBe/Z9coWIKncPQPB1Xy0Vtwh
         53dOiFtpoN+hPC1o8oaORzQfGhxRR4aFTjJQH6XHstjNsXqD7WSfqLzXfi0Vz+pWPZpq
         NBlA==
X-Forwarded-Encrypted: i=1; AKwUvByJDmsUO1Mg1SKUp2UbqeBsrcq4MBWno7YtAZwpKlprmd7iE2tDemog9BAZAIJjA4ZJ+ZO1YOgSkPVkjd0=@vger.kernel.org
X-Gm-Message-State: AFuF++lodEdkdDc3WZEkItyX2eZgy7L7ZAPhl4zWlaU5/7CXqjEMa1Ou
	tryEvtDaX9McnwAImFMsghSbahx8X568qe1aUUs2vtemEvtqM8rUU0IuM2qjZrFmICZodR2rURK
	qH0pCyrZgQ5xopQlBEOxIF4KCy3MOrj97zxtwskWeS09vBjnGr0ZOKGVkq01ea0eaDnGXYXk03h
	4=
X-Gm-Gg: AYBFou0YbViedb1IyOUw5PnkuG8k/AP6pLKiqIKf2lPD4c4qjjDYgQtwkzaSZ39ZkbH
	IFzsMm5NF5qxxGoU60qbulmW2dlHW2RBU0xyvipHzK5nLq9JAx6jPKcpHRkSVSxejmAm9faUIX2
	Gigz4BRWBZkbUaOrJQJLV6SVPCA6FFirsPNrZuu2S9ufFpTCcMUeAtctlWuBpBSSOXhfdFkiDSm
	ulmGRovJWZPYKlk6Ikha74t968BmiRdEBDz939n5PAMeuBRpM9mhdua2LNQZiusr1yERQ8N6Vz1
	EZVMUnHKvrHvrfLXnq6exHnz2DztudngYAzA13BuNxmHq05O35bY3MQPxor6nt1wkCMaLHhaWRk
	wNTCu25qS+I6WNct42JhCF7Q5aw==
X-Received: by 2002:a05:7022:f907:b0:144:fb87:5b91 with SMTP id a92af1059eb24-15ecd76470emr1106707c88.44.1791281030730;
        Tue, 06 Oct 2026 03:03:50 -0700 (PDT)
X-Received: by 2002:a05:7022:f907:b0:144:fb87:5b91 with SMTP id a92af1059eb24-15ecd76470emr1106675c88.44.1791281030087;
        Tue, 06 Oct 2026 03:03:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15f6d21b0d4sm2489072c88.18.2026.10.06.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:03:49 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:33:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <20261006100344.piyiffp6rwvt3w2s@hu-mojha-hyd.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
 <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4c787 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=e-d6zuXzJD1DOdJuPQcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 9G9X7ijEwN50pofAEVl8YMfE1tXuudyb
X-Proofpoint-ORIG-GUID: 9G9X7ijEwN50pofAEVl8YMfE1tXuudyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX8c2tJiVNLgzw
 GYU13IcEifHLEvebukitKJA407ztpOMMGOxJB0SAl6m08+D8c1L1DQPrlmRkNIaI7xexA5PzacY
 MzqDj1OFl2GW5aLU5qoptPmMSDXLgqfk4DRAT1iVoviLD39SIV9pYmKXz9xRqNawfto8p74rGNH
 8dgBPHQUraAmmuS9I5MCbzmJK/XtRGYLjvJe/B5l6+vP9ziYQG3kiSDdKTCgIqunLxmAA9CrDVj
 /rSfHKD4c6ggPm7O4FaH+CwMtNVW0fOe77g8+RX0GzsGL0EDeM0NKZgZfFoLCJd71wgUhxVDNrw
 Blq51YMwZKyPi4m3CLRxY5EkRusnvOZuQ1jjolaY5Sai0Q1woQ7kh/Uzef3uIQrIcIwoRlpH5Id
 6KcKXZUAd+iw4vsToZ0O7I0d/dPet8qC1XL6Gx3hN3HmWhq0MoZjawAUgYp1NSvqkO/JN6gjNC/
 edYLW6bNoFBrai2N9Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX+l1JTRv7oH7Y
 CIQJgGVPu2Rtgy7/Ra/Y1guGzKUTM4xeEMl2t/XrL2u1ORQo838OxNBZdriSa8FM+a709BDXAKh
 qUWj79lLYjbFGvXnBWa4D27OW4j7KwQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

On Mon, Oct 05, 2026 at 11:01:24PM +0200, Jorge Ramirez wrote:
> On 05/10/26 21:42:24, Mukesh Ojha wrote:
> > On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> > > The firmware resource table is passed to the PAS backend even when the
> > > firmware carries none. This only works on the first boot, while the
> > > cached pointer and its size are both zero.
> > > 
> > > Stopping the remote processor, or failing to start it, frees the cached
> > > table and clears the pointer but leaves the size set. The next start
> > > then pairs a NULL table with a non-zero size.
> > > 
> > > The SCM backend substitutes an empty table and hides the problem. The
> > > TEE backend copies from the NULL pointer:
> > > 
> > >   remoteproc remoteproc2: powering up cdsp
> > >   pc : __pi_memcpy_generic+0x110/0x22c
> > >   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
> > >   Call trace:
> > >    __pi_memcpy_generic+0x110/0x22c (P)
> > >    qcom_pas_get_rsc_table+0x38/0x60
> > >    qcom_pas_parse_firmware+0xa0/0x100
> > >    rproc_boot+0x2d4/0x380
> > >    state_store+0x40/0x100
> > > 
> > > Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index a005546c265d..e871e03ba794 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> > >  	struct resource_table *table = NULL;
> > >  	size_t output_rt_size;
> > >  	void *output_rt;
> > > -	size_t table_sz;
> > > +	size_t table_sz = 0;
> > >  	int ret;
> > >  
> > >  	ret = qcom_register_dump_segments(rproc, fw);
> > > @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> > >  		return 0;
> > >  
> > >  	ret = rproc_elf_load_rsc_table(rproc, fw);
> > > -	if (ret)
> > > +	if (ret) {
> > >  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> > > -
> > > -	table = rproc->table_ptr;
> > > -	table_sz = rproc->table_sz;
> > > +	} else {
> > > +		table = rproc->table_ptr;
> > > +		table_sz = rproc->table_sz;
> > > +	}
> > 
> > 
> > Earlier code was intentional please read the comment below.. /**...*/
> > 
> 
> AFAICS the comments say that the call might pass NULL and zero as input
> resources. And this patch does exactly that - it doesnt allow NULL and
> non-zero.
> 
> did I miss something?

No, you did not miss anything.. I just wanted to highlight that I
did not keep else statement in my initial implementation
intentionally and relied table_ptr and size will be NULL on
failure of rproc_elf_load_rsc_table()..


-- 
-Mukesh Ojha

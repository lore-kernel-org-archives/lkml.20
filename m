Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967653D9DCC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234090; cv=none; b=iQHBgeOSu9W/gGNnjq8TNQM+wqQFsJNvlFmlG0s5CqdLJ+4zPqPDAiVq2XU4aXpuAK2dys0a7eTWcYtZo6tH/rtAGy3q2H04VyQ3Ev1DsEFHrjK6vEDW32/X6hxkjTXAtlfut7QVBc9aV8wpZggalmmgeuwGKftrF0sNTAKlV14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234090; c=relaxed/simple;
	bh=xFqM6C0CZtyMMBGakXcZlOCR3J/JBeoJ9lhTaDp82Vk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRlISA4AR72XOP/3tlRhbl42VCP0RllKG7zPoEw6LgBx/yWoLNzSAwJMlaKs0YLtqBDut6cnok9zffOBDLgNPIH7Rra3j9f0z1myz0SSrqstMsdDAqwv2cXfbBhr8Fqbq1NngQ9AsriO/Qz1+XhHSZz3A+f2n+f+4Pc+/wqg5sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPHkTuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+wMczm9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPHkTuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+wMczm9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMpWt1535748
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 21:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y7pVI7SpD5poVIpr/u84Y6Jb
	ABdZdHaInXCo9ZlvthI=; b=TPHkTuPMmwtr7DD6ULAMaaqTBG8gnsuKU6/9oUOU
	4FYm1jhAY5FLBzmu9XKsX62RIXXSm9hw7toQMc6jtGxclm+UZOku0ZLSTkak4mOa
	RD5rPsAPkxrx62phggGDunzImxU2eSHSc5NOFUPQhHpXwZFFZd0gbX7CvPvxWsDK
	MFDdLVsCq9OUPmsFyzUUcHgoTLrEL3AeQ4sj9RQMU6pLa8p9R0k70nqcxrmkMyqv
	DKAT7NiFnCUhOElWiWoZVtdPPHagQYX/DYiR4NfqGvkZN5fNbA1TmylcpRl9OoKI
	mNQCkMde2dhWvbQj/UdanMo7zqJUaYVsI/pFsYjy+JNWbQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnchgmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:01:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf21ebcc4aso2216925137.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791234088; x=1791838888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7pVI7SpD5poVIpr/u84Y6JbABdZdHaInXCo9ZlvthI=;
        b=X+wMczm9J78v0uJfxxQHGZlZqzcBUgHEiBHX8uYY0iRf2lXDM+jXp9avhrqF+2lsPc
         aYrFpvtXYBgnk2sYc14H+EohWLDGoKUDQRaLY2CIOZkXxlTZVax24+Upb8L3uyMTY2eA
         aAIcU91LmnXYjsSkG9o7tpsKBdfZgpRxNdaGjgP9ecCkW0lSXL7yHMszY+yeoTnYEAux
         wy+rMOfDoDDcYJ6/RsT/aDouC91wU3jfDRtZuy3QAP/JJhHols+IGj/sMOtxu0rIINFB
         hcjCzKdG03q/Qx8jeGbm2QIE1ZfersKliqiID1RxJnAdRhwyCCGeY3CT1/entue+vQV/
         pAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234088; x=1791838888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7pVI7SpD5poVIpr/u84Y6JbABdZdHaInXCo9ZlvthI=;
        b=zhk597Jgvmf6R6r0mbXSevUMy46JT6SI6e0SP7m0GQcukR735suQpMvHDZB6xmgh7C
         qD4irXva4cokvqJRo5Mx9Nc7PMdkTgjnZKyri8+u0FiMdQNKN89D3sET1ta+4+fap2J1
         XgWN4JgeOeQ3XiNi3AyZmTpfqV1Rt9Y0dNGKs7WfCEdawSxwf2Gz0QYbChVcmNR+FMvd
         xdk6On+RYV2ny8lKHATI3N2GG9qWnD0//s4MEzztWZogvxMa5hdMNcCxvWRqucqyIQyB
         M9cSbw9wnt9ZFD2Tnc9wakKP/5tut5RzXs6LI41c77rL2g8Pn5PZRLD+DwjzM8bSQK7R
         xQXg==
X-Forwarded-Encrypted: i=1; AKwUvBwgde1Em3RdXPd5OM+LrSs/yw+G/ZYsHvrCdeyxfIEsSzms1GDXoyGL7CkNPECLDn+ePAVDgbpq0Qz+4pM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPxM3ilxUDMJP/8AeGDb4qGUgVRoZ6khUX+ZncWrrO6yUFhBPB
	NRZAIi3rVUHecT4hr6y3lbiZLgPgxAiN1JGcKsnykw9Bt57P29dWZNaFW+c3VHIiatuJZvrEqC1
	9rcaAFRnrFsCpB7ISjreU5iOmnqCduiBflvsW+vyhFj9d8ycXXpbWXAvdr8cOebKlaSC9Lnyr5H
	o=
X-Gm-Gg: AYBFou2yba4sg3X7mnwY3sgo9EL8qy0d2nWUEmAvSSpFwVGXPxpUurVXcUUtZxFrSDB
	W/smVlgWczL0O93KzT254weyT6J65cEn0+nDFKmGrGcqVlAm6MOp2pojPJzadfdL6qz4SeaNryl
	PSyKU8+a9bVJx7sJyQGNDaYtbUp3PGxX5B9RMr23QorXoII5yA055wbdIcciqpCktXDunT3SgWv
	mQJXSN784mYy/9FGeARZI0dlGel2UfF8kLIKK5/i7orsfCgfi6nUxFj1+ZvIlmOZADaUAiGtt7d
	zwr/XDspapmxnwFUhQanlt5xu/ei8kESPEaDEYp1tTY0OdU/zfiQDyMg7pJBZmarLkV130bHgYT
	E6U9tx/W8gKLFdY3U3Smdted+LZstQvyyNGgU6ayAHJ9BSItJtghrjVq3
X-Received: by 2002:a67:e709:0:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7c24488c229mr2482402137.8.1791234087778;
        Mon, 05 Oct 2026 14:01:27 -0700 (PDT)
X-Received: by 2002:a67:e709:0:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7c24488c229mr2482387137.8.1791234087240;
        Mon, 05 Oct 2026 14:01:27 -0700 (PDT)
Received: from RAMIREZO.na.qualcomm.com (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff56136sm143071585e9.3.2026.10.05.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:01:26 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 5 Oct 2026 23:01:24 +0200
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4MiBTYWx0ZWRfX1ei9q/UoDSKW
 IcH658Z6HZ0vnQ78L9Do+H64oQlwGS3I5DR7/4EQ/DIflc0rXkNxwM+4+d5VAbHfQMuf/9iZ2Rk
 P3GGVye5rRpiztwnowSsNw1HpaG59wQ=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac41028 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FcOvU0BdSJvtYE76ZsQA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: dkL6-F4WUZPNNBOPRPoS-0fgzZkR5HyP
X-Proofpoint-ORIG-GUID: dkL6-F4WUZPNNBOPRPoS-0fgzZkR5HyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4MiBTYWx0ZWRfX94KJkRIWSZf5
 w26qtyMKhftNThSL3WDeagl6SDeWCp/b/QKr+cNoxXrexc4/uPF8w7RQpQTuSHa/9PaBQmFgPma
 WB3HUHr5Eq5nk05O9pGjxxR/KeaaHNm57n9GMRj3o5t7WZxq39lyZ8ZUtjiWmPjcAiAwtXSFCIM
 Z5wGlmZJfezbNYCzaPKqSt6Ei9coZHi1pwc/kwPFDGMZRa7RHahHyV/XMisfQK0PVwEw8BSj/6G
 fY/0O9/B22YmWnAEjsnWABCndbnVrWOZ4QTwQK4Yz9SdGr8ThIW4yzd38Dr6VieAQSb7iCzQgKE
 hGhm5H3Lt1SPXGffAgV8oPV5iQvpLcsBX4+tukaqJMpwTz3vdYRVpmpFK76gdO5dBPzdOqWC2Kr
 LMv85OK5cGed0BhoUIBnHYKGNblNkmtURe3cKnq7R08+uczZPkbQXDUsPwBh4xLORNbr0WhtYSM
 O9cGiKhK5BZ2UMXIk+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050082

On 05/10/26 21:42:24, Mukesh Ojha wrote:
> On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> > The firmware resource table is passed to the PAS backend even when the
> > firmware carries none. This only works on the first boot, while the
> > cached pointer and its size are both zero.
> > 
> > Stopping the remote processor, or failing to start it, frees the cached
> > table and clears the pointer but leaves the size set. The next start
> > then pairs a NULL table with a non-zero size.
> > 
> > The SCM backend substitutes an empty table and hides the problem. The
> > TEE backend copies from the NULL pointer:
> > 
> >   remoteproc remoteproc2: powering up cdsp
> >   pc : __pi_memcpy_generic+0x110/0x22c
> >   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
> >   Call trace:
> >    __pi_memcpy_generic+0x110/0x22c (P)
> >    qcom_pas_get_rsc_table+0x38/0x60
> >    qcom_pas_parse_firmware+0xa0/0x100
> >    rproc_boot+0x2d4/0x380
> >    state_store+0x40/0x100
> > 
> > Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index a005546c265d..e871e03ba794 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >  	struct resource_table *table = NULL;
> >  	size_t output_rt_size;
> >  	void *output_rt;
> > -	size_t table_sz;
> > +	size_t table_sz = 0;
> >  	int ret;
> >  
> >  	ret = qcom_register_dump_segments(rproc, fw);
> > @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >  		return 0;
> >  
> >  	ret = rproc_elf_load_rsc_table(rproc, fw);
> > -	if (ret)
> > +	if (ret) {
> >  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> > -
> > -	table = rproc->table_ptr;
> > -	table_sz = rproc->table_sz;
> > +	} else {
> > +		table = rproc->table_ptr;
> > +		table_sz = rproc->table_sz;
> > +	}
> 
> 
> Earlier code was intentional please read the comment below.. /**...*/
> 

AFAICS the comments say that the call might pass NULL and zero as input
resources. And this patch does exactly that - it doesnt allow NULL and
non-zero.

did I miss something?








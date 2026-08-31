Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E734DCE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156857; cv=none; b=qiCWJaNmT8RBagIS4jRQ24RMbz6EcCMFfrrHMvemamY1Kplacr5VJdB5h2kM1w4J33psfZcDM6xnU6ExW2hTeH6xMO+cL87GMHhoRebQW8f525/gu27h+LXjnfJW7b8H9AgLDTT4GJEEiVwLnlLcKKIwLL5Sj9plB0DLj01ha48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156857; c=relaxed/simple;
	bh=cePvQ+VhKzu6eO0tfh1GO4V43UBFEERnzjSXP4Bh7PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6n8M0hzleLItZgRKM3g8+iKwMJeynAUFLcXq4EVkp6KxFozAaIky+biFllvzuUAXZaYHecPtj+Mm/2kZRP4PtW/Cl2HsR0bbDPjjkcdfZ5y6fIpkXq/RSvWxXORT6BOuwaNQX6IswBSABEGrLhpaX5go5p+MUdo2xTGIZIhDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BH35h18T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di6O7rG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BH35h18T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="di6O7rG9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52ZeM2061047
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HawtTjTAOoxhHnlQ5TrDYorU
	QhQED0jMx2OjPv19rrg=; b=BH35h18T9H/OZPCJs7FdH+d0ykpUNUdDDpu/YBtK
	yMgvnEJu/dg8a1IIFe/F6bJM3MNy+RGk0gbLUuutfgR9yzLrfXOND6AZaP8VW8ft
	qv0aFDkG+70q81IMj5YSqiYtukbMUYlEx1FqnrjydlnuDjXbwbHFrGzEL78HYjCZ
	jMZUCV0lApZ4odTHh1htlSoyht90U8POiTqiDn9obMJJBIJawuy2UwtNE406xfbv
	/OwGOntwvahmOeR/+FQN+5HTdKU862e2FlMLiDA0ANhf7+eqpiDENhLtHqILDEZX
	n0tcmrIbwR3iDhoQXi8iGH/WckpuoiA3UBvBMPFpTSIiyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dvqyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:14:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso79336325ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788156855; x=1788761655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HawtTjTAOoxhHnlQ5TrDYorUQhQED0jMx2OjPv19rrg=;
        b=di6O7rG9R2f4FCrn6XyoTCmahRy9SzsXGAcN+CNrf+wMGhYtwmna+LD/wgTTJBxs4U
         D5CXwPKneOd0FXQERHjG/tYUVFIv9U7+b5bpbXjt5/ZuDHLvBmdRNS+8j4qFLcA+Q4ht
         zjOQnrXP5omGEGSplFiw0uVxXA5f+8OIXwb/Uec4/yToLMxy+PNKI5FjTgyueC/GONzM
         d9goMEzEAg2W4LGZqoIFC2QWY9FqBcJ3Ju0iyiEiYv7oNpa+pyUvgG3yLBI4jojIZTgb
         xqMSH1w0Sj15K0Ncx2vB9cmwMUZZSxRpulWcYC6B8kOfyXYV3B11apD+IZzUTXDV41s+
         SbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156855; x=1788761655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HawtTjTAOoxhHnlQ5TrDYorUQhQED0jMx2OjPv19rrg=;
        b=KFcr6Uxuxbj7wqcg1C1FUyTccWAHLoly51ddgKs51H78mSZUHcBHo3KmI0RobbAetr
         7GQUUvPtCybscam9vUbJvne8lspvdXMRMJLscSNl08nBlFGN7SsFUMeWcjKq8ZzY3liZ
         VUPmtxlVRm404rUa08ZLQbTZObdvgZ3HfMRDgGhSgkBw2k5aNxRYQiH19IFwIRqdkPiT
         QR+j9MvIENzc/4oF8xxEeDsh3hIOaYNxeCP5D4L4YRwiGQ0636sZyeicC2M5qqvw6mxg
         dIVxTyYRyZDLN6qCbmtteG8R+dXyNhsq2rLhyNnmRUT+UF84eMPY3b4O+PqWjzvYzN28
         w5uA==
X-Forwarded-Encrypted: i=1; AHgh+RqEdeGWuw03KZyx9jpbIJOclJL+HNybBPDJgGCUW9sa4XUNcPyQ0b/dNwBHOEpoKnLfwq4c9FmHdkljQoM=@vger.kernel.org
X-Gm-Message-State: AFuF++lVdVV3nMraMuQnIlgd8G6Yk/3FV6zW7qLRc9HdGBrTkzOBrnYI
	l1ttIgww51cISz2nE5uLzqzLbydSd3fJOTR4CScb78Mjb4j3gp8Av+qKMNJHoSQjx9gB/3ZUSYB
	IHM7HHVY93vm2zkMWk5DwlImETyWKokyJHZmX07pIIdefwDGdu4jY8/5B5s+s9JZk/04=
X-Gm-Gg: AR+sD13D3FHkiEBPSI+GZ+BZb3Ax5WVu1OvpBvcVWPBK/zQzaVjW6h0HKt4jNua08f3
	XRXLa9DtRd3EkmnDx9OFpNjJNyvDO7K/fFJcgNOqMAnx9N1jncNEOuR+DH/ExwhsZJ8RaId5SpS
	UjI5W1xGgAGDF/lowO886d3FptI3b8K4342/P6+6gzA8w6WWCUFFd5HXj6uATKB1n9C7RTT0Ljq
	2kZMhXQBIiQALpcLRVWObjb78YcsSC3ekuHUUBaCBw3YY4QpV76eRdo9/oXL6fFSw9S/SeziAc/
	jVQhfx0pUax4DuPaCBNnJdUmulPco486cyIjDq0gsRqcjo4KxZ9+ktaAQ4MNU1P981NVr5svCjz
	ObSVcc0r314/FJQAOIcQnWuOk3FjuyiDzdnZg
X-Received: by 2002:a17:902:f54e:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d74def63d7mr380140345ad.13.1788156854876;
        Sun, 30 Aug 2026 23:14:14 -0700 (PDT)
X-Received: by 2002:a17:902:f54e:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d74def63d7mr380139015ad.13.1788156853897;
        Sun, 30 Aug 2026 23:14:13 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa5517fsm29748208eec.31.2026.08.30.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:14:13 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:44:08 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add optional vcc-supply support
Message-ID: <apUbsGi1COlopxb9@hu-ssmaurya-hyd.qualcomm.com>
References: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
 <e4bf36d0-3f4e-465d-b4a2-626d5a5ca887@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4bf36d0-3f4e-465d-b4a2-626d5a5ca887@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1MSBTYWx0ZWRfX1Z1W8MiCs9uK
 /hw38y+GyZ7fOWcqcSZaWNmc1oUAoPaDeMVbrjfV7Llu4DV7YC3WhAQJ4w5chz9BEALMnoZ/Dsl
 8kNK8zMCujV6bdIJviEWssXZqIpKOk9Tx2gA+1PFYmMyN7ibuNY63Lr9ug7FjmwbmavSg4e54XQ
 BDwv6mPjOztCRU2ckyUX+bRVtvvmhQh3Z18WqbdgyFlDnRGC3/3ccBnEqRD+IYyxj5Q3bbOoJ6U
 7WnrF873UWjLdKKaqEb/g8LSPXGRW3GiicAST4CCzNwm0RweIpP5Hm4a/M4PRhnLdXuEK2z35e2
 sLZVqm+Zu1vnCaaQptPeVd/6wSl/62XUMGT+v0UY+h73ghoAGh+qgWE/UzFZId6Gw2J6I6TllDl
 +izsXTKoXWJ0zPYGgmIhMIGLmm3aUrAScifc7YpDKnsB0vlARTVzpjehzFB6LnrIHdjMmyDZc83
 xnEsC569mrByEM+2kag==
X-Proofpoint-GUID: Y2ICg9zCmZ8Wd5b4ysbgs05RC7eztzGB
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a951bb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ugC_WFyHnTH7QrHLNUYA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1MSBTYWx0ZWRfX1N4v5qmjqo2r
 pb/VbV6q6iNQET/ns4n3DP2T8g4bOgww7/gLwmVTXJdiggOYMaty+N8hyYja4E2Hw5fb0SnE6pA
 RMJ3vGS4zSHxxniPmGgymw9lsFDa8zs=
X-Proofpoint-ORIG-GUID: Y2ICg9zCmZ8Wd5b4ysbgs05RC7eztzGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310051

On Fri, Aug 28, 2026 at 01:13:42PM +0100, Mark Brown wrote:
> On Fri, Aug 28, 2026 at 09:59:43AM +0530, Shashank Maurya wrote:
> > The Raspberry Pi Panel V2 regulator driver may rely on an external
> > power rail being provided through the device tree. Add support for an
> > optional "vcc" regulator and enable it during probe before accessing
> > the panel controller.
> 
> Does the device work without power?  A name like "Vcc" makes it sound
> like this is the main supply for the device...
No without VCC, regulator will not be up. So device will not work if
power rail is software controlled and  not always high.
 
> > ---
> >  drivers/regulator/rpi-panel-v2-regulator.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> 
> There's no bindings update here.
We will add bindings in next revision of patch.


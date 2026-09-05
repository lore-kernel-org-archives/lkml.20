Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFD235045
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788583120; cv=none; b=eeciE7AF84Bt62R8XOyTiE4qMFchubOW/7njsy/YfHT8DsLDJ3JTpJ90NIpVndkSQgWm5QWKUOn70GPhqzhraw2ZaZJZj70odirjsi+OJR2m3zZIrtCELeSJnqrSp7Tzg/2WBCMPK7zV2bqLHEtJTu9VPRoc+3rNYyioG9uPlrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788583120; c=relaxed/simple;
	bh=GSaELF1Z9KjF+xjzZ4dVIBJN17oY05E7ZBJ4GkoS7uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c42T5n9dqTXvLx6EwBwV7Vj6whgGWpryxPQ843pTWxbW7p8ONEuZuBfGsVtRp1pW9qHKRPPW819rn2iZgyH9ANvY/S3XDok+16F3izSKmViwxZfkPgUAdl4NhOcjxYAuXcy2I16UJY0mOifW4MdEhsfjvJkUI6x1U5/qkAZWQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEGHJhMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oe8RU5xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEGHJhMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oe8RU5xn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6853PiKF1461796
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 04:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=727iktuEXUXWmmJ7dRTIPHBN
	1RZNZgjhTgnKHGSuFFA=; b=bEGHJhMqge7iOVR01D6QrBp8rYhEyHTHhvkjtrkf
	V4CED43uz5s1IVNgjniKgEuTi3dXtq09xbkK4alAzneoCXPxG903i1l0hJrxA7G0
	2xR6y4ZMwsLLO3fl75G3ih7SnEuavdZvBfFMeIvBemwVdQ3bqM+v1P8zHCqCQ4Y4
	moVLTlqOnkUyh0CHUSQ+POzYI6ZIOxJ5D7GW5m1ehYNe1SreRq4rBGrrO3Zlsmzq
	Wau7M7gollCrT9meJR0c5Qoqx6MR+8XX5RaUJiIY78RMYBYyVRvy8gwpKelUWKGu
	ZsV4akpkIapXhJY8boF8Jvmd/YcAEgAnH/xuR4vqw2MvwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5v83x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:38:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so2038662a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 21:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788583117; x=1789187917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=727iktuEXUXWmmJ7dRTIPHBN1RZNZgjhTgnKHGSuFFA=;
        b=Oe8RU5xnmqScSefsubtAmd37M5jYoNnCicvFFYu2lfYaeeNtVfp/4KZ3oJeBhuHreU
         nNHxqJmGs3TI17fpRJxRfsT5210c2GHXkdLaln8mkddI84huk+9sHyZgSg03ddOGRxzi
         zegQRdo8P+9KHwNXFmlr9fRKQqAnliQnu8Gah8xvObBULXCQRLzL6kIBwDRDjhJH1Y7n
         Cy/uqqHDHhwEAzXEhNYH/9B7/Vc6B70ul3ZKAb1FnSQtketmF1mJqLKZyfC4L+F6dy39
         Bq9Tye3nFpDIXzSVMUkssRF4VKXGuyWrmoFvN8WUBSxwnbox9ggYU/vpYb8ttX/TtJtY
         FxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788583117; x=1789187917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=727iktuEXUXWmmJ7dRTIPHBN1RZNZgjhTgnKHGSuFFA=;
        b=KuFwtVliVt6WF86fpTAfYgNmfZ4bEW4pao5dZSjZQQzft4c9wih+lORqufo9Urdip3
         XFoGZovcMcwLqRVYfAe6+4OKkoxq5TQjLFMMndXVU2J3/KWL89INwNqSusjJMxw44Ym+
         KKww1C1SXPpdW/l4PP2jNn6ZoVGmGk+Bz3V3937hebuq7nE1dCDVAV3vqqvY55T8OPNx
         P6pPTFXcDET2PmVdMlA5LFxnGPcNceM6pnt3ieDhgcxu6R+YH6XBgUrQNX8UTTl9L5gZ
         vMpkTNdB1cREUYyx2sG8lOoLNKwXp9cuCoHeWl1Ls7JUOTxtp8VDLwYR0aQOdkwAqwDm
         NQIA==
X-Forwarded-Encrypted: i=1; AKwUvBzC+CQj1hGMoamt2RuAfBC6VdTmAPJ7GJ9SfHwWWo+QC3FErZwN6uQ9D7DrTvE9QbGhUd92d/8TEaKDva8=@vger.kernel.org
X-Gm-Message-State: AFuF++mTp2aGzJY+iiz+8NwoEMf+umQ9aAnA7/6twZE61jkomnuOyaK5
	0Q4xirnDwaO0cgfOl2mWKr27yKxeIkereqNxMaQxsc67iHdsteG+q03ylAIlD6Ln1AToBFE0bmQ
	JPJADx2CguYBvyAVBye954bAy0U8hJABZPTcqbIbTVWMvw7Pk4Cz2eKt1565y5RVB3GQ=
X-Gm-Gg: AYBFou2J4TUqcq3nfhmR869yGrtQjew2hcakB4Z4AuBnYqgapJpr8IE8ELU+szEIuC2
	g0BEIwOifH5oKAoVS1bYnisBvB4x4Prx+nWT0H7GJTSHi7EIHAwqEFFxWGkNJfOuBsZVPgJadhH
	rPCxmxbHA/X7qSfc9/64WehhAZT/KfdGt0xndcqkZgEhMbZ0Mf/BUxyzBDcmYClEYUzGlC2WWin
	QSgMjb3W1F/+/nxiqD1qHxbuyXu/s4CgdDmUDjBkr9qLnqGF6yTyExCclbA5frPmItyyCg3+M4g
	+FtZPk7ibDDUAFzzfHaqf8L7G7rLhiiDc/6nKV4Lm0/7KbAcb5NX2hNMPamlP6Nl9f0t++umHM2
	pxAUbgPiO5BBWpClK+0b6greXOnZme1UhkIHV
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr14399909a91.21.1788583116611;
        Fri, 04 Sep 2026 21:38:36 -0700 (PDT)
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr14399864a91.21.1788583116152;
        Fri, 04 Sep 2026 21:38:36 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm10025614c88.1.2026.09.04.21.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 21:38:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:08:30 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add optional vcc-supply support
Message-ID: <apucxtSP9XUHlPC6@hu-ssmaurya-hyd.qualcomm.com>
References: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
 <e4bf36d0-3f4e-465d-b4a2-626d5a5ca887@sirena.org.uk>
 <apUbsGi1COlopxb9@hu-ssmaurya-hyd.qualcomm.com>
 <aphFUThYNg8JYtEx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphFUThYNg8JYtEx@sirena.org.uk>
X-Proofpoint-ORIG-GUID: GhAEquaBGIX9WkxD5PRG7G1_aGH_jLHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA0NSBTYWx0ZWRfX0ge8y/KdYAwi
 Nfob8714WbI4s9xOINNx4JamAGgyZWVQOK+tw3+1PBxLSArF8hoTiUKXYr7RBvKVI8tQ89NWBHu
 6iSqaeEFprIKHwawlMYoHzKxVWvKRFfWNhWf3GYdDMtTPD7NbccQOfkYHm+NQhFTS1U3fStJX7g
 FWSeurbSm/NqJOvPxtNM640wQnpFocKUKpQpgJMZ9CIBRBqIj4QisXhNzHFCUE6D70Y10/0UOHa
 LMlvhYTUx8i8TYnn1FORibLqc9XLxbn67EeKTjjuUuAnO89XeFSNQbi6Bvp9H+3gGrFi99atDRm
 Ho1/9VAeFZpqhnNam5NhCbpFswoI1RfEb+pJc+3cr8ZmXf/S3fSheroLqHvMm20bFP99pDbFz0d
 9UMFt042IDNMCUJ3dGP7EupLXKgFgGT+3ZIT6k3v3tnxcbkxjBRQKJEjGNbts6OG85f819cSOTk
 yhP/u7IOqpntoYvgUvg==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9b9ccd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=99y-QX9tk9NJLPcNDyMA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GhAEquaBGIX9WkxD5PRG7G1_aGH_jLHZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA0NSBTYWx0ZWRfX7iiKCkGvXK2K
 pyDLP3s928JNS3ZSbXTzYft4r1VItwjexKpVPmQQgByi72PYnzWNVON9OPmWgLLzFqRvsCKFbpG
 kKAVuCioE+yJPhO2nsG/XpsK/wVrZm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050045

On Wed, Sep 02, 2026 at 04:48:33PM +0100, Mark Brown wrote:
> On Mon, Aug 31, 2026 at 11:44:08AM +0530, Shashank Maurya wrote:
> > On Fri, Aug 28, 2026 at 01:13:42PM +0100, Mark Brown wrote:
> > > On Fri, Aug 28, 2026 at 09:59:43AM +0530, Shashank Maurya wrote:
> 
> > > > The Raspberry Pi Panel V2 regulator driver may rely on an external
> > > > power rail being provided through the device tree. Add support for an
> > > > optional "vcc" regulator and enable it during probe before accessing
> > > > the panel controller.
> 
> > > Does the device work without power?  A name like "Vcc" makes it sound
> > > like this is the main supply for the device...
> 
> > No without VCC, regulator will not be up. So device will not work if
> > power rail is software controlled and  not always high.
> 
> That doesn't sound very optional then.

Apologies I missed below discussion over the list.
>> Yes Mark, this isn't optional on qualcomm boards. But it might be optional
>> for boards where power up logic is hardware controlled or always high.

>That's not how regulators work - with regulators the driver is
>independent of the specific system it runs on, the machine constraints
>deal with any system specifics.

>Please don't take things off-list unless there is a really strong reason
>to do so.  Sending things to the list ensures that everyone gets a
>chance to read and comment on things.

Going forward, I'll make vcc sipply compulsory then.

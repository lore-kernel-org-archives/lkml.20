Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67A3E1686
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967891; cv=pass; b=W+Y577PvwzBDcDHG+EyY306cATsHs3fFirmc/uL/XGFYaSA/BDSIGajAQ32ySKCUVIq9fxKnsIRHfPMApWgQHTbuG+pb0qc/mkuIurGCVJWcG8hv/AsIdp+HzCiFMkS3EUjALG9S+fo1iL5MF1eBgm3j9sYDDTxbX0FjU2hM/Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967891; c=relaxed/simple;
	bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csJgdHz+u5qVhLOGXSPGJhnWMNhu38RakJsI7WWS+oLoIAwcV8ZhIbH/OiCJhKotvlpMvQNgupcwdJzsWqnM5qqFErdGG6gMTryvpkde7btUYnqAMs4Q8ZJ62hh5NCUgb1aYiqM2eMNBVn5VSUaMZqpxRbA99VejvOvyzmPACBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTxsLJeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcSNigSE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTxsLJeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcSNigSE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6Bft2099901
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=; b=bTxsLJeZGv8eC+/W
	jGA1wA2LoI/JmrTbLM536RXE+y9QgKp1AtNmvSi8alWpMM0WO3WQdhD+UBFj1+DT
	/RxikB/3S5Y94r6TipNrWjqZFW4sMBrtoAW1016kgpgUzeBJEzlHat6fVzICKwEh
	3Irqq/GBabVLZfpp4e1yw4LXIdAz4/xLr6pOXCf1TPysqI5D+ljcifXzJg9G+RjZ
	UjC2X4HVudMY4nY8cjrJqZqQIvKTDEXULnK6QIb1QMkKawTi6FDvWvw4mWhf5xR3
	C3h5raqv8SJFm83ctyfDS9zuwkVM2jPmsX001PAdB0pq8Na/g9BGmZFS/OTR/pZc
	9Pe6ng==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfuu09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:04:49 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6711c640f79so392286d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967889; cv=none;
        d=google.com; s=arc-20260327;
        b=ff1y8d873wV9+YOIHdYZB6EJ4j4k+zI67PnpxdCg63Jg7MunL+fYYxaw1jw5ccOYgu
         wDI2iOm6TqU3pVJuz4UAa3gDbmwQZ2gizs8Tti9Y+F5T/v6VXCsfyF/B3I2RRSxkGxTb
         jmMfyZ22cA3QCSi8RRbvuZwSsRyKU/tad67hdoQdbEGGcCWNqE1NjgAvLouhoHtz0gKd
         lV8cW6wy2P5M5QFa1Z4AowFgGJO4GOiMbiRqZ3NuO+ajrmSbgsADliwaA4Q0rqKuJM0j
         CKsce2id3USuh+RfkX93G1XGbu2S0MdVXPIP/Gfu0MVazcJwlSwfKHfB0Z4lg1P4xcSM
         udkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        fh=yLHQxhK7qgqgbN4n8CMccOEft17CUT8hdtkOHtBQYIA=;
        b=OYskCECsEknxf+9Zja1FCqS/21pQzRku5/zoieuaCcFq3cuAkyhyMxcaYe3pYx6YF2
         i0rUpaJcEsgBwoSGL+ZhVoWNOevr4JkrDMtNGt66c89JeIAkPgkr4+6c/jhJN8/fcpgO
         W1XLH4R71EKtI6DyxMwjEe9g5OS3neJOgeElgQhqjlFB4LxbccQPSt80GQyRxOKfzJYG
         E9CFqxigYYn9eULVs8+V20EIayJmLxOMTsvAowXUdUIKdrDsNBlqNaXO7UwdwqL1m1Tq
         PdWEJnRsJ3/5kmnKME+7Q3ejTrqUQ0o99NzkUkcFQEC99ll+sodO5c8zqiYwhzvmCX/X
         cfdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790967889; x=1791572689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        b=WcSNigSE9CzwAPBjg+bO+Af+kC5ZpB441+apL1pnYXB363tsu3GWpxID7gE5XqJp5A
         nLZFF+gVIKZYMWIFh91UkgkoOPY1sXoSBcpniQd0S9kFvpZBoxVQuayZ7MofoqG6V12O
         P4MSMXUMt/cvnBPmpfVaCleC6qmRcZAnAAqOitFD1ryrweVz1q/MaH3Y1pN24psIA6U0
         sVCl9ZGiS//w37wF6FKgcl3ZMrqgYc1Rm7OV6449pDuX/wWj6F0SdNnJcCgVVt0Y6/OV
         kN5mH7ehzRye0AvU3c5ej7UWGauPwfORySseVq8/phXbo4FBxz4NPY0vSWf0L37rq224
         lkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967889; x=1791572689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        b=zH6okMlMCstnbvO8uKhrkHG46ddrYT4ABQUBbVKwtQfAkRpYw/8ZAa1uVfMN/LXTgr
         HwkS5rRJeZa6Wu12AlbqLmJZBZucCko2wv4Wi4IbSkfiT6HMRBARh7ZHg57IVxSG07gA
         CVJh3tlybD6sO9XDlGpK8rzjJsJbStxhz9sJP73m7S9SzdxIYJinHfVP3qy1dh/HWX0b
         FKy9A8bnJ2hVn72V/SeW5Lpho+NUCIDnM41UZz2fFtjtcaBLoeynOgqEvBNlhhW9oxjy
         ux8AEJD10v7CtF3QREEyS1Zl2e6O6bSKokcv8Y8Y+bSLte+oOmVqW16pB9NUnBzL097G
         bxzQ==
X-Forwarded-Encrypted: i=1; AKwUvByUfK6/1Maal2p0/MuSV/zpewRLDtCHIon8eO2ybPu/8atccgxmGcAngwhgdXUS2m0A+0+X2gxO+18UiWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYInHnRpQUCuiKAO4AoRhAYlzX6Qg1YLPmTbMTIKrmLXsybsf7Vi
	JrjeH5FaX+WreJs0BIfMcVJdpEQizT7hk9a/IPYePy6E6+NYaIqZP016Qlsyw3BNTrt575233oh
	F9VxsLbOU1h4puM5yY6QqMDOvC6DjyRuVpn24lgK7e7CUP8F3F2tui0fcNKS5UHYihD0tFc3BXc
	tFnBPrwpt62voo5AF9R3fA7GPnKfsCvDs/S3SMUjC0n21K+4E+G9lK
X-Gm-Gg: AYBFou3lW9T0jm1gU9lSiRbtkY37DkgB7DeYaZAFQCyZAn8yJFASb2eA7VANsFt4AFM
	cg+HAkTdriixW5BAaJiHJ1IZfanjDgn6i3RekeuycUUPHdaQZzuDqD9U+x5uNQZfMdE85a1FcC/
	c3Hyaak323wL4R8YFVQQ/J6Y/1mUpqmz+abVAQU1kq2o2eQYGQD8HshTA=
X-Received: by 2002:a05:690e:d5b:b0:677:b670:bbf with SMTP id 956f58d0204a3-677b67014bcmr767076d50.48.1790967888702;
        Fri, 02 Oct 2026 12:04:48 -0700 (PDT)
X-Received: by 2002:a05:690e:d5b:b0:677:b670:bbf with SMTP id
 956f58d0204a3-677b67014bcmr767065d50.48.1790967888310; Fri, 02 Oct 2026
 12:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002142443.GA778834@rayden> <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
In-Reply-To: <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 21:04:36 +0200
X-Gm-Features: AclHuK8Hx-gmjoKfPEPErlrdzXMv7J_iPm_txYB5iricgBj9wbiOQUFrLBcfNdY
Message-ID: <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9Vj3r2mgRSdlHwM-EdW_7I1KQyqisSu0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX9b3MsaCh4CLo
 QcaWRFMzeyCf4EwT2/756aoawPDzaRBl4429WDzjEl6sRthZBiBMalwAays71L4WhB0Eeopiohr
 dHA1Pq0sJyAwyso/qcaTg0sQvgmhBWg=
X-Proofpoint-ORIG-GUID: 9Vj3r2mgRSdlHwM-EdW_7I1KQyqisSu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX4GgFPPONbMQp
 9YCjL5I2qefyttYKpbwsIpQdbMa4F6dGoo6VSu1weAFwdFBATxZheRcjFShnUKxQz9yIxMNMhF/
 lUdlmsdjKXxaxjdAYEzLDiv9fuEHiTwiNkaPm6HLLvMl9CeYQ0HVVRYTxhRFX74Gql6X93GBQC9
 H8HMToYzMUycfJ/XLKWGu/sW/a/iUW/FXdkpd9Llo70cis5Ghv9jzannuKxj5PAtinxxtk2Y63K
 bzBx2nDLhNap+pM+nL8G1+zSLh7EXqAymSNW/Y11WsBBSRzZ9CqF2J0BFWuMZfeY40jLmaTbJkm
 DKUvKeVF/pLK40px3190slVWNx3XPqJHqzw2+QBWG5ye6LHOuCY8Wf0l96XVEP8Wxg2w3RK0Rua
 VpNSCjPoyTGdWCn8mBw93zIYUrXbWQuddlbwzGdS4blxii1T9Z0e6e5rVOyk/7E94GdI6NvEedO
 4NdUjQNzHgxe2atPHkg==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac00051 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=ghIncmqAs50lZ5yoykoA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076

Hi Arnd,

On Fri, Oct 2, 2026 at 4:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
> > Hello soc maintainers,
> >
> > Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> >
>
> Hi Jens,
>
> I noticed that the contents of this branch are not in Linux-next.
> Is this intentional?

I made a small last-minute change in the commit message for "optee:
register TEE devices only once fully initialized". That's why it may
seem new.

"tee: optee: ffa: support shared memory offsets on large-page kernels"
is brand new.

I thought it was better to send them sooner than to sit on them. Both
are added to my next branch, so I assume they will show on the next
update.

Please let me know if you want me to keep them on linux-next for a
minimum number of days before sending the pull request.

Thanks,
Jens

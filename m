Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4CF49E127
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997384; cv=none; b=Zvt6rLojyHtf/ThV0Y+udwYkzO42m0eqiByTvZ74ahXyETMICXryqXaT6sBTvNwHpf8i1cuGewPcyP7oGjo4KBcTFzT/9A1+0uFCxkJ+1dFixZFdsg/2OPrcSBDRdXlL8FLJ3Oi0wE3/ROdc1Ai2J3253biR/0McHEptTGbT//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997384; c=relaxed/simple;
	bh=VtMKS1pxmLVhRvyRqpDRBgXm639lmKJmTQWPgi0oJPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQeYdDRSHSgG3Ep53pStHjkn8hNpNLtRkUyMHYIYw6MFSNXN0W2A2pGxw9/ZZfDPqGmZiDBwWA5inWetGYZLl0ctMhBLQ1DwADWYphBL6XIkUmQ5gACp2mTLs4Fvx2E9XT2Qkaq3WXWfjlLTc7sZ89TY01lm12poR7INXHl/awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iR7ZErP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzH19x4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iR7ZErP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzH19x4I"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeD1U838010
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZb1Nz99r2b3gBf6iCMiSVF+
	bGDeXeMBh3XVaKxovJ8=; b=iR7ZErP8OYnstgQIU2ZM3GXIqA+oF3iJSRj2/qmA
	cGEDrb7OoE0d6NnQQv0SNHH4SxUHn2TOPuNq0SLRZEFkbKncupLPyyKq664UcOcA
	O1sKo98wcvmAAuPCDQ0GSnxuFUGqwLVz573qNZFHgc0QW/RcBIKP2j1J1emfJDVX
	Bn58cMaqhfgJF4lofnByyFestwvxIQJO7cPeBPs9yalzqDlD6EUK3/Y+6hRnMWF6
	CZUbeUd6FSK78CWqINIeUioR27Iq34rV0ZarUtjK2AfF63YY6SX0Dt3yorX4pvzM
	CM/gr61YsGJNif7x5pD9bIDIQv6jAABzsoL7K6g5KSuTXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5j1sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:29:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df375fb9b2so20446025ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997380; x=1790602180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZb1Nz99r2b3gBf6iCMiSVF+bGDeXeMBh3XVaKxovJ8=;
        b=LzH19x4I0isRbeOCYTdhgPoNZvlNyM6mof4idJcV/JG4CPNa6Mfg+ylO7yVyhTI+LP
         PbQt7veWeAI63ayVg7kxSljo8ZH2Wp/+UhRQXX+kIf2liCfTIcuLhxOiW8sXOBQnGG+l
         9pfz4uRG4ZSBtZ4Zvrba86AWQMoKMWDObzd6vjl+3pX5ehGCtVvPnrIdEPZ0L4sB3EnC
         oboooJ+gt10QzXNyrA+khUSRCkkIQxnJbaEUCJnI6Ov8lhbWG80QtfEw71xWZNAIcghi
         T22TSsjjNFUVkvB6pY5Eh97Y67mSpzy4GdNfQYEtfz/hnzx2AdbMfcfSjKT94i/86+ji
         wPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997380; x=1790602180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZb1Nz99r2b3gBf6iCMiSVF+bGDeXeMBh3XVaKxovJ8=;
        b=1uJTk2iMVAuAN0ALz9TrO4vKqPJkytnphjQoO/60JrFhqWDsc2j0H+yFN/3rJBPpfw
         Q23FOjJ49WrufzaVpOYdHKijGKoM3BM1ozTc26k7uzyVX92EVObVJaDNvnRom5xzZtP6
         gkx/ne6pAAIj/mGL9e7Qg8qUDNfUK1UdvCjKopahIbbm4wwDQZUZY0zsaizijQ628URZ
         qzPeyRVX+27xoj7mwlesWnbzmyymMhM/QqLAilSi89iwKO36wHGcEX0b55/HEV4fm6nT
         WokNhUcNzcpmHK+lUc9W8F/i1ub9GROqMzdshe9wV0pv4SYYLkWauQHgIJHLi+5QMRW0
         RsKA==
X-Forwarded-Encrypted: i=1; AKwUvByI0XuqqsYTHH+pOd5GK2odb8Z3FPCpS/6x0ESIVfPwKbNaAfvUvPckVr3Pp5rjxsnikj2xIDrpKamQ2Uw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1+7HpeTnCW+r3S5NzKhI7FoI/dybcvnk3HUkap+EoLRNyxePK
	ajZam9SsgfkDUsCuCSeDjYGslF0/EyZXGUnIYWRd/zVgIgXcsdATf5FopeEbdnrWjPb7n4u6E3q
	eSDYIku8KpXqIPOY0/Mu6ee51RFk4aDzrkOjnf2SphKkNC0Q8Ka2QUMp4JL5/VwAvYgU=
X-Gm-Gg: AYBFou2TFD2jycM1l89K9BAvEvjg/CtyE8OJruLZEkcEep8LNGHsHp8b7MXjbwtjWPY
	zEIXgF3+2nFfj8qdxiEvanOXT4srlFLMKk2KUEuXDBRD7JUC6m+gQBqyJjQzw9Mx9zGgOeNRdDh
	fIH5s8sm1y1jmTjCXFK8VDi4DEzfK4G4vE+8DTZBgVYaVbMxUKOrHe1Dugekq8736+HJpDYWaMa
	I7mu6PgUs45YbeI6Fek3CcOPRAm4zxc4jkTgI2m8hBD5ZIPIUS271xdfS/vMvl+/nisnYcSc51s
	pjwv+SkTbni8CA28QrdDM93svKMCKqWkYW9awaxg5kaI2q+q45cxrahgGNoxmlX5nDvIHma5rW0
	AjPeB9c/yOoGLTYsK5X6FfkkeZHQboTTA6bDFVs8XVQ==
X-Received: by 2002:a17:902:c944:b0:2dd:ad73:c980 with SMTP id d9443c01a7336-2ddb1b86d6amr152937905ad.24.1789997379952;
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2dd:ad73:c980 with SMTP id d9443c01a7336-2ddb1b86d6amr152937665ad.24.1789997379389;
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm21905803eec.8.2026.09.21.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:29:39 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:29:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arExPWGbLm1MLgXz@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
 <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab13145 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OddHCmqlFxd8KxF8cHwA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YzxGeuZbe0wUUFVKzZZxxwWuG3JMmkF4
X-Proofpoint-ORIG-GUID: YzxGeuZbe0wUUFVKzZZxxwWuG3JMmkF4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfXwuncXPajxypp
 0KA0reHKw2vYPYv7h/2ahDa9gf5n4iOH2FXEdst8AC4VZh1Es33m5cQuY64VGgX58lVrpaP2kU/
 lG+2tPqByE32H/GpNd2lGkLvLUw5a74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX12Wp9uVJcoyJ
 qQOQvnTyDA1v9FBSz5eSWc9yNTZtTcO5ULmNSO9Qb6kIIGGEnsXTWbCL3dtM4bvXF/KvB/USLMq
 6Lo7yiOWcp9BuKuXbvJgjhQOgdogsHUtfw94AGmutPZFFUoSXKTHPxgkH7OTr7pMKeSwQhUnZWf
 6ChcFeyPLpf/6GXie2M1H7T/Z2UeU3iZEB2cCwG4oXAPXvKF91WYts5tKq77ZGk7UPumkh50pey
 IYgAFhF+DBbVAg7u+/TDNbX4OGs62Tn3F2CTMiIbPRqqDIBRvAMhJ1aBPf6f1z6PsuRA2C2thiN
 FglyvF4ptGsGpnWalyLfRxK2uFH2WfqWwEpMIm/7e/RUHTnQ5fV/EfaOipLKaQZQ0ml9/akjxqc
 O2i9sUCwgVBwILBafyNX55gvnOnxobNKrxGrWo+cG37oMjj5qH6NTCZCGZemsJUfszcK9xUiOZ3
 BYfuXl66y9Rt89/PvCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210196

On Fri, Sep 18, 2026 at 03:05:30AM -0500, Bartosz Golaszewski wrote:
> On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> >>
> >> Personally I would prefer patch 1 instead of this change.
> >
> > As I mentioned in the cover letter, both patches are fixing real bugs
> > existing at different level. So I prefer to merge both. But it's a call
> > up to Bartosz.
> >
> 
> I'd take both but I'm not sure if the ASIS case for shared proxy can be
> addressed without reading back the direction.

Hi Bartosz,

Ah, yes, the concern on ASIS case is valid. Let's disregard 1/2 and take
2/2 only. Let me know if you want a resend.

Shawn

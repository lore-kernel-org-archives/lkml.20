Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DC3B1EC7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248706; cv=pass; b=mD9WquFg5fqBXwFaSysEYmpwcf2sKDlnSBBhyeabZdTPJxYlygeWy5E7+yelVpZ0rMo/YTTan0rDk9R5UNz5mMl3OJUFhaRtrQarI+vDOyah7Rh+XHU3hJMYD9XFQe6msUxTkS4jNGHgE/M9iXAaUGbG6WYJepBeB9D/q6OwWTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248706; c=relaxed/simple;
	bh=W/KBqgVEZ6BGWdyr9sMiQFsjqiUsQRYYmdY5gVUp8nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOabLQzpEb2Zsin2G0cbqE+dZJ699HLmwoRWDzIN5aJ0U5a+4lEB/qc9GWRlCbOsrUPVLGuYTVOQGtu5hWn5FrA7PLTbwWA9EOumSZscxPB08TW8mPPYReLeLt1OybElcrbvAeq8WkiWhOghfyx6khnK9wUDpaJ2Ue2d+DU6Au8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbTUhYOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Svy1Neb3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbTUhYOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Svy1Neb3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1O712857954
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=; b=TbTUhYObl5ybPmO7
	9By5S/eHO/yhPRBHy4RpBD5l0jePTuqcfJleu600nLB2HYF4p8cDTvqbcteqy9kq
	P7oWDRAVMzp04OTB2tPZlNhwqGYKXlKBy5kjOlz3kchPs3WuxTB78OKYltLh+Nds
	3h1YksK3QiT6+G+GdFwVrRGTL+lHXG+A8ZTJH7X8WsfCmNaA+jsajQpHKQKZZsdc
	Zv1hlM9Xtvd7gaXLeeAtKDCzcxXTX/d5Qjs+smijCvm6b0Nd6QdYjXQffGVF1pxz
	KKl9xZszA0NvJ/yAfgrq2KQcqSzMOgOo7x9TJHlLEHLSI+8On8nHFKUmvuy6CKJO
	1XLGHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragaem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso1655506b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790248703; cv=none;
        d=google.com; s=arc-20260327;
        b=WeULyuVxPwfzq+lMbZar9dBSsHx38jr6hmBu9V/B3tiT8z3bMofXE4ie2Iqwl87buZ
         huyVD13OplaWoGNGqltqwrj4ifcONhZAWmp2L/zpua+Le39FSKJ5dJ0p20p/nhkidQQ4
         1kN6LRyxls68gUm/vBIuV9PCnp/rd6+65WRSFc/0RkCxIoqTBpylip3VhbnEoPOrKbyh
         Fo/wjfRbkumW6NLxuZFr3oHImOO4WWw5E9pKHPF7kgIA1Fd+Bb8MbpeyRytBSLqXZcFc
         dNj6tiJwjtsaFKq2UdP5p9q+7+J1MznjICfBYieOv/tcjvzlTwZkLHId9OhgolHz9tfQ
         5tIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        fh=5UGcD0ACaGcT9Bjtcs3cQfdqoSAg+KBQ9eoKVyjs8Lc=;
        b=pqB7R3t4qa72tC0KauLwqzTAJ0FEJsmCzlCY4JkJG9Oe5pSvwpJx9V2kCVMcVQsJGB
         q+M9lZf8yigifMcCbYNqJ1qXqFpcVVZiAep//pU8zFSGb8W49M3JE65RAWdBZAmqOyWc
         ARIoHkPPW1bFTWTHFO/k36sB6RmEJ7jz9EuYeLg7OHy6J7ilQ+vc3PV8xw2E/dYyNPbD
         oQOqAuJ5UPzZnLev8z8xFSG+9IdIP06p1OdX05pcXPYa+JHGt41JlhpKygd+RhJ69NBF
         WWDOKbG76epzjYfb0uJEGNu/SEP61SQKTwmFMnilf1mGlK24sexOBPkYrBaJX0+PPdLv
         XDNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790248703; x=1790853503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        b=Svy1Neb3jjss7OFoyGlvL8nm/65TFag2OzFrat0SzKhU3eENXDPCyMOL5seNgIgLWr
         JG9cNvSf8VMIIWhiRx7NR/oY5S/bgASsVgH7WwbtLnUDlts3h6/Dq7sC21urClvdPQPV
         c/iHNH6QtaA7b9TNpPvFe+pyjuB+lqhTdii+7yYoFhLDfcsYyaPM/12ws7DV8JZ8aXXo
         p3RdcxpaT8nZWWV4E7ZXIoZ8U6fMkM92nudul33Qpmlky8bq1VswUCZvHFny0WDxeHyG
         D8wVwfr4oiMs3b8h4ucZv0uYL3KjMikIHFWIA48ogZZa3+bSyXGVek94Zr+mcel6gdvZ
         Vqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248703; x=1790853503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        b=GhJ/GvqRk/PWLhaH2S3ZEaUE8UsxFClt9fuK5ZCmuK3HpxrF/FWe6Jmae6mzjj1mef
         J9MGIeTB3SdxrCCJEWf4MLCdW32QYbqDTYZgosDN7gjOlN/rVhOoOekWarJTNTgjraoJ
         7hDzvm1azEHZcyj89bT/Ueg2pryjMpIjLu0DP04hrRnYbNmrV3ycKAjwuniRs9f3Do4N
         DJ/Z27LYIMN5tOL0/zYtHDOQ3VURSvLQfMatLL7kGkwmhjkb1PM5vDCy9ZVpDsv47po8
         v0hlcri3HchjKkVw/0uNCBn7/02ey3Pl4x7O3P4smxOymJCXdyU6wAhjC2l3cZ1+AbW2
         s/lg==
X-Forwarded-Encrypted: i=1; AKwUvBxfy3T9Yu/FMC2Pf08LM4Yt5Br30PwNXDCv11eopNgxK+ZCDPN9f39mxdTuDpdPGLl+eJBcd8FBSFiwZWY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgQy2LcihB4BDLWUoALg0KtCXbkvm1PhggPrClrkKoSfxqDzMV
	+vIh4a42uQ455CcYX88Jf4qDgfLHX02hmasTTR0lMyIyHy+btZfxJQ2tz/8K5C3+pWxpoqJwcMA
	hqRYEHw1p+iSke1n9unifTVyWBB2gaaParCwsljwoh3D6zTDzjKwI4QppQr6AFCPIPNjnyFS8MB
	dxZ9VOXC6EtqxsBC5rCgD15a9cjWYXqqCX6G2myXTgtA==
X-Gm-Gg: AYBFou315MKoIMB7Sf80lcSqb2mtm8kwJPLAezMMg39Zz/uhRBlDosrmewMdRfmGfCk
	5dRjN16bs45bGnQG+c1OhOSEoux4uKn8HCtAKX31ulOJM5TIG5Thm96yroj83VWr4HBvD6aOLcl
	V4VDgLRi4sjvC0b+7jS3WrDJQPkGoCYHqgAEoztD5FKosqvg5Kw+MPUuLAzg==
X-Received: by 2002:a05:6a00:23c9:b0:878:3830:a489 with SMTP id d2e1a72fcca58-87e9fd15ad3mr1979688b3a.57.1790248697923;
        Thu, 24 Sep 2026 04:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c9:b0:878:3830:a489 with SMTP id
 d2e1a72fcca58-87e9fd15ad3mr1979654b3a.57.1790248697236; Thu, 24 Sep 2026
 04:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <aa9f1765-ca8c-445e-96bb-4c768ad55623@lunn.ch>
In-Reply-To: <aa9f1765-ca8c-445e-96bb-4c768ad55623@lunn.ch>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:18:04 +0800
X-Gm-Features: AclHuK-44EH4bNDTkJMwrnDWVzEi_hMaghscBr7mHEKsm2sHbLj2Ihaq7X1e6I8
Message-ID: <CAFkd8huag=oW=jz6qPeu9JfqAWc24b8DeT5veRVvS_nqMuFjNw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Nord ethernet followup
To: Andrew Lunn <andrew@lunn.ch>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfXw9avqyc+G/i/
 9kbFhY0z6nHe0cloAW66Oz0nfJwjZ/2b3riqZmEG4+XgNhDC0Xk8mD5cP8ceQiJzoEn6zKw0xyE
 wU+fkwk4YtYlIO/61ReOUSR0L3hzt7iBUPCLL8HgwR+DjYPtHWGZEh6a+LDkaC5eCfH9uz83fbh
 X/Z7PfHqlLWXqiHj+v2c9TxEnMN0UyWkOURS20gF7gTHj3MFcg7Nprm2RtNpnW7cotGzu6widGP
 WWjDtLuYriAyI8U5Z/XagRjAYRI4r+ofrHiG6b+iLAzOe/2IvfRJFLeuGzCB6Ts8rSXviHzLlYS
 wxCsqjoJiXw4ued3PGIgVdZ3j53r8V3ZUzWpoJUpv5F/X9OeKwFg708KRCuM4kkHOodK2twDxHR
 SN2jbfKcQDOjhDs8rWP/WuxlTk/1RYcwYqjv1BvC6DHUMCr5TbCRsfLQgKusp4XHTH8Pdu1ggUo
 x4bXKlSuetImp+RfHDQ==
X-Proofpoint-ORIG-GUID: -g3YozDKs8xymE-wL_bUIJz8Kp5_0psQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX8Tpl6VVdIbuW
 F6I2dZXT51tMDof0Si7QQSeRkwosSV1TetMlWyQCnJvfdiXQp0ltWSH7c6/1Bkgv82xtfe5rHbz
 4DUnsj8pm6sn29IxvMtCVEKyB2FawcE=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab506ff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=DPsbyGdE-c6e5f9Z3pwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -g3YozDKs8xymE-wL_bUIJz8Kp5_0psQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240046

On Wed, Sep 23, 2026 at 8:50=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> > This series verifies Mohd Ayaan Anwar's patch set:
> >
> >   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [=
1]
> >
> > Tested on both IQ10 RRD and Ride
> >
> > The full test branch is available at:
> >
> >   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> >
> >
> > [1] https://lore.kernel.org/linux-arm-msm/?q=3Dqcom_xpcs_nord_emac
>
> Please don't submit two overlapping patches for the same driver. Wait
> for the first patchset to get merged, and then submit a follow up
> series.

Thanks Andrew

Understood, my apologies.

  I will not submit an overlapping series. Hopefully, some of the fixes
  identified while reviewing and testing the RFC can be incorporated
  into the existing series.

>
> Qualcomm has a number of Mainline Linux mentors. Please talk with
> them, because these two patch series are not great.

OK, Thanks

>
>     Andrew
>
> ---
> pw-bot: cr

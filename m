Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F236998A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338926; cv=none; b=mYceBAdBw7+yChOYg4hdCXn2EqkRrDkYRvfJNe/3JscKFd4c1jsLwLZ7FT6nadNww2ZHv1SLD8vWaYakrjWPCYfJFhCq46L66G513BbGljouB9RI73yza/2En824B9iRk3RUXnfRB/nURFkEd9c2tKHzAxZaHgHM44wyhZtTAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338926; c=relaxed/simple;
	bh=lDGQkV52tNAwRDdyqjc2iyUZklDZzWF2FU4BJj9YeNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzQRQVyc01pE2fC4pWomLqtfVVj7OojHsxozRGW+ak873ODF/kVpDqtyVxXV9YOE52J1uxk/aHFQPOykEpCsP2brn3mXMv0HddpSf5YIlJSu2qbKt7o0hqMmX/7Vg19+aFqZpmtPfyZkE8zjXQTSqN0Srj3+8cDc9GDOZ8nAtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obnVHUOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXU04xl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obnVHUOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXU04xl1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxkfu2526964
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=; b=obnVHUOWDNizpRcg
	30MDH1Ua9xMoqv2y+sPLzo3kfeLMjoSuNVBxaSxoCeUr7ux7I7WN9mkPDpzBd5+h
	A8CThln6KoJwSLsokbEHOUXmYY3eAHamM+kW3zzF0Z33L8v10Zw7DKmrUAbH9rl0
	RGrTIsAFbNhru6PwUjFuaNI30Uyq859BtyJT5DtXzdz7Bn39zkZTuRP4XJXh9M6M
	4jmtKpIJqueX8G1jsuVSbnGBT2yIaRt6iapo52DjsCvIniVKL1M5yG80Z0udAv/V
	PMEsPcSEyeiRoD8aC1GA+f/cZkUQASnBRPFe+xBTXv3Fcvb1Ryz1x3YtOHFuScpH
	pQr/cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dc8cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:35:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97ca6578487so2603078241.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789338922; x=1789943722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=;
        b=iXU04xl133M38EQ138/9HKpqae/WTF6KDQWp1kOHA/84FXj8hqGA7sgjK4NB7dVT6c
         iwPcibViz81bWYYjfL42jCmBS4r544aG8Gl9gAkhJVVOLmzXalXlsZPTya02Bu36clIh
         EAvhQcaUcJANjjMPPjybGyTxRrEvcZCKoQcKZJJSnbP4/uWyk6ylgqDczTZoVqJkWfZZ
         Zyt8qbjHc8gjh00X/VriHPeMA84kzt6j6PHqjkCnvXabCmyy9zrK0plJ5wqfhv4/qWOh
         Z/Z/FDAfW8QzBUgou7tYD3TBkf07JuTBZ34eZTP+Nib702oEn3L2OtL3dTptYbHWi5NJ
         IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338922; x=1789943722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=;
        b=KRGhd/dgRxDi0i7FBK7wrfO+ni1ITW/UvDSRIeKPYAb3fdK6aH4+0bUFsTfeoAty7L
         NmuZvbiF90oeqmqI2UMOdJiqoze3Hs3bt4YbNWohMfCPsQARPNqZI4JpYH5U8gz7KxZ5
         fCT3/WRBc3arxVTXdcYIVaoCghADBAXbtew2eHgpUYFyt26cxzU777NH+uawyu6DtfpH
         cS7gmfxHjcllv6A1JFMQYNIRTi48sS7bbfkYnjmXG97OzInEhjlz1v5alSH01jz/fqF7
         AFZkAHHjhU8mfudFspuzSfSQLzL/NsYvakwMFZKfZLOFZNTsgMkrSu5N+3oJ69stPj8c
         IR1g==
X-Forwarded-Encrypted: i=1; AKwUvBwcoIpiI9ozLLBalG6x64+zQ86RfrgdcZBrHd4kZQ6cIJRw6lqTuf2fLTOjifh8VdsyboFpZbt7S9BAr14=@vger.kernel.org
X-Gm-Message-State: AFuF++lqSb1jZjzPFJd4OjYL6QGBEnzbEGaT/bq34cRa4ScNhNY1h6bR
	djyeFOdqYUdEAmKyc959vrq3eePAdull6llOVlkuPy7jcueb46azHN0jgP22RYp5WQbxdkB23kP
	rfYDaxIUJCpJlbNZpX/kHf5jlwkz4khUOl9nBBAdf1tg/pNUXqkZm6FUHZKfjOlotTrg=
X-Gm-Gg: AYBFou1VPOR7fPZrJuz6uDe8FkzrDyc6Kyy1Nw9KH/GzUyqxhQga8UNYcxm9HUUoAij
	MjIW7N81+V0CHeRbVuTZ+aIz7YqifVwvLZ01JxIEJ+yLjdRobu9tocep3PDMdLdwNoDslgiTbQX
	5a+Voo1In/DqSclGyuaMgMzr08fzfuqthf5aUtp/zJzNaWNhj4C+qsAlyu+rXSlRof+krtmR6S0
	utodk84DawtPII+Yi3FVVA7FvAxbzorIWG+sBRsqvqZEgXBuQQvgvj5JD+nUPCyF4+U+dIHZWJ4
	zLm8U3uQI2kIiC1JoMw0rXIlMSo0Hl8xMVeeIKK8q6+cUIkD+SYKjk1J2ZE8eQ0IyoQgOvJwLk2
	//ntuPv+DmALsUqPuRW2K8gEqyea0jntgYm8jVnMkjG7R1RfN89wAcAIdXdbVwsxlG5sbySAfYh
	8EQqwzv5L0ALH8
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr13843911137.12.1789338921840;
        Sun, 13 Sep 2026 15:35:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr13843905137.12.1789338921470;
        Sun, 13 Sep 2026 15:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461ee3sm1974410e87.40.2026.09.13.15.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:35:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>, Teguh Sobirin <teguh@sobir.in>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: delete timeout timer when encoder is not
 busy
Message-ID: <cijlihrrros443ff3pivdlzxwpu2hhhsfpieb3f3vy675zi2vd@qnol7ixz2oee>
References: <20260903143004.1026181-1-jun.nie@linaro.org>
 <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyMyBTYWx0ZWRfXzkvAOb2y7L8R
 XzefVPrwXC3tjSMFVeJoH2ZnzFSBu9khpKbqNr1rMC8wK/oWVc8YanFTo3Hxe7PqXWsteU/8kuN
 K67RHkZx9WMxRApbIB3PT7ddGD/VjFfg2neH2hlX+UNkYndXa1YUdUQlu0r4wo2rBVlXLfC8cjV
 YK91WtMNqmodxiELYj48gpnyGHBlzjVddzE55o89RT8wanSZf4UlSpgGbWksEtyatHgJ1D/o144
 jpW3bjp3XBDc2rEtl9HbIwcUgQx9TODtadzlppKTaL0YkVfqOrI3n7aSp5WpJM6XiPhxXyauwY2
 yq4wkxh6J2xDZSRZg9j/idxTb7qu7gx+KTYbQ3cwU8pSkQAAYqj6GsRtwjbXVemh2e6FWWZNlnM
 qDVviNNR6eHgV7+WfKucxqQnYrTwy6G4rZ0mzndzAf1oW4NP7jeNW1URpUyXSOKyd4crIOvR6Re
 KgxJBHB4wI0Mhu+h2Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyMyBTYWx0ZWRfX6BdOMwrxPI1f
 0R6eM1L1HfvYExpNdNpzFmVpezAfzBG4Z4IiiKwcKTqq/3kb+4LKokM4v0grBQEkkj4wqrBm+lZ
 Psh1Lvc//SQhm+LuMdN1YE9rM7Kh+rA=
X-Proofpoint-GUID: X7xiG_BNvjHRLLuIWEPTweq6OhFaX8ha
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7252a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=Er_q02hE0Yr3fhQkg_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X7xiG_BNvjHRLLuIWEPTweq6OhFaX8ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130323

On Thu, Sep 03, 2026 at 10:39:22PM +0800, Jun Nie wrote:
> Jun Nie <jun.nie@linaro.org> 于2026年9月3日周四 22:30写道：
> >
> > There is a spurious timeout error message under the following reproduction
> > steps:
> > 1. Run "modetest -M msm -r" and press CTRL+Z to pause it.
> > 2. Run "while true; do rtcwake -m mem -s 3 -v; sleep 2; done"
> >
> > Resulting error message:
> > [  124.018206] [drm:dpu_encoder_virt_atomic_disable:1425] [dpu error]enc35 timeout pending
> >
> > dpu_crtc_commit_kickoff() calls dpu_encoder_kickoff() to set frame busy
> > bits, and then arms the frame done timer. If the frame done IRQ fires
> > between these two steps, the IRQ handler clears the busy bits before the
> > timer is armed. As a result, the timer runs with busy bits already cleared
> > and is never cancelled by subsequent IRQ handlers, leading to a false
> > timeout warning.
> >
> > Delete the pending timer when all busy bits are cleared in the frame done
> > callback to prevent false timeouts.
> >
> 
> Another option is to wrap the enc_spinlock lock/unlock pair in dpu_encoder.c
> and expose it to dpu_crtc.c to make the sequence of dpu_encoder_kickoff()
> and dpu_encoder_start_frame_done_timer() atomic against the IRQ handler.
> However, this breaks encoder self-containment to some extent. Furthermore,
> initial testing revealed a deadlock involving additional locks beyond
> dpu_enc->enc_spinlock.

The patch you posted has an issue of the atomic value being updated in a
non-atomic way. However I think it's not a correct solution. I'd just
delete the if from dpu_encoder_virt_atomic_disable() and always delete
the timer. This also would allow us to delete frame_done_timeout_ms,
simplifying the code.

> 
> - Jun

-- 
With best wishes
Dmitry

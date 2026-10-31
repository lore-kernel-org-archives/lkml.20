Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478695;
	b=YDTON0/oBubZF9+MYJclnkYDbw8ApO+iABJsR7gZy50GnDMoXqCxyZFKehGOiWQrh/5E
	 5FTM27EpG83+cIkFgixTFanyLiongRqf00xPM+84GJYHq9G+YXOUwQZbT/HZhhYJZjfIF
	 ULPFRCXAd1hsqIB3gl4WNPKt2lvUTxCGzlK6iqO0rENvvOk4Okd+BeIPdI/XAK6QTKQvM
	 W9TlXefvJTEyMdNz1MgAfXouvcNLlPUtVBbZupDqDJoQ/FLS3pND/vm1bg/mel2m/UQCG
	 SEvLgaCEHJKSnE1aX64Vj38p4bqc7n7lLIJtOkjJOr5UD0CVYLzTF+vlQ3HOxZG31aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
	b=T+7CaPf0KNaI0g1PrM0UBLA63Agg1MBe5JhibGxXcyRKTjPSA+lGtgDz+NGrvcCI9YQF
	 1ChOCFnqQEAGIZqQQbBCjJa9SrMUjhxJZbIrGxy+kLVjd8d7eQ8voW1U7Buu1f7atLI66
	 5O5IVWvSMpnnajjyy+dup1GQTu7IRXAtNHEsFuKCR3Xlnj7w7q6+qCEkew0NCGbE/+rgX
	 qVjFeQbQEFcYD8uQ17zwbYQqzyKA4gY1+f+kN1HwY5AyFCkWO+POWYp/bAp8iMB4mf55t
	 AAePlDPruwx9SCTZYcewD93Vtcys+dzyHQC8ItNzLPS5ClCwiS0IQVEF5rN4sGnGWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gorF3E5T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gpl2h49T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BAE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gorF3E5T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gpl2h49T
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFeuM3535283
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukK0x8ix9SWhHXUtQP3CPTLr
	QTiWMUDAJDT6GYiDeY8=; b=gorF3E5TzHG2eMX/5+4poZUAltnSP03K1fpI+ih6
	MHOyyjg5o3wWfkn3ydZBy6A/NIfc41lQDqWzwUjkWbpuBwE1+2JlxOPMIFyABWHf
	yFYDWaknyjT6YRAuypB+B3oVZrFs7iz5P3+L4Pn6u8JHilFAhqFPCzZ7sm5a+vxG
	JcFp7WiTTrtWTNd6Sh7NFhsQK4I5KA0YUSXEWbLoIf1F+AAP8trRXxDzffw1eWQb
	93XB39wD0J0JAMNlt200rbKNzNfPldCB3LvHjGnLl3fLenk7v60fso0TRq3Pscsn
	iu5pWL7gNXgtIYCmwczHS52MxHr0c+TWfR0yxanlZvqpbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j4uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:31:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so505480085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478692; x=1794083492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
        b=Gpl2h49TO6C7mX1s2risvVMzIHgPhiRoFiqgApCd3KVkgpZHY9bvGoAbLwCVewRORt
         kJ+tvj3nYKUU3sKSzMlfus66PmGSreB1SFsmrvzyWtk3blZ8vTB78a9oaMjkxRU+6B6p
         q33le/1nOriMvKoBBf+pX4tL9SqGVpra875uu3Ny3BTqE4fO327u4fCLuSgGSQQ2oOSC
         IRCAczxjCsSKa8AB0jNG55ldhca6isJ2CMS96u9LL4XTfQ9CHWvznnyIPuzVxtR+uaJn
         p8YTN7JZXR4XI+rUyJy6o07R1AcsYmncZ91L/wNIiqkYYiuXiBN4FESS/4cSB/ju5oEY
         EmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478692; x=1794083492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
        b=bCy8zC/Su3EN2pKQbC2IK+mOiLJ71UEi0dg+uXlpL3dmblWZec0niUmY/cd4L1qr6P
         2ewvJbXCF2Bcer/yDiKtrAMcmRQrb3CQVQ6B65dGhgpfQdkj0JBX05+4SsHRCA1iJ8Ck
         CzQ/IMFIzrTYT8iO7b4rqxDYA0sRatWDq5MdCur17qL+qKULArmxyrP15XdWGYPoGR40
         xZsfM1/JtTkL3H3cHX392Na4nEbg4eZYZb6t/uyluUb4owssFHs5g/+FuUj5/TIkKap6
         ZllZrc0KOj5Bss9vMS2/M4TplpIJFynMZ6zgtRQOJJeTH/jwn/nhgYdYjXyrYKBZND8I
         UCrQ==
X-Forwarded-Encrypted: i=1; AKwUvByEoSVswEo96+V1qNGDXTFl6VSdDbVsgJMIDHsanFPEYAVivAPQMlyD89138m4bf9TxU4Oq61bUaBXzBUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoQyESP8ZRAQUPX1TZD5SoPzhQIS3vnBbQ1rnRneyUECJYZ+ir
	DQPmUaCiAnYNI6dSwF/rvwCAgQ+yC2b3a22Get/gPd6aMxy0xmHCK5Y5MQAhp18ElEe6jFv5Ykh
	IWhhFTwF4hz2kIF4qIjf83DHo8RcVAXyipth4Yi5tOWNrarSpewVIsjGeWGP5mIxTg+o=
X-Gm-Gg: AYBFou1mqQJTYjfjRc3wc7pJm76i3Mu1xJEhPKRAI8f3Bq4rfUuTK6d9XrKMoJ3BwK2
	LzpQONZ+pPQikJhkXOP+XBhm8S6mtrJKEx/XeAPDKr/XIjaKkHpak/p7hQ3rZwXLBRPChrkoIJa
	LlkYSHoiVfj4OSmCqqVD1OtxV37WlXpFquDvMPYThbkLzHsfhl4w1RL6CG3WhTcrpMAd4oyf6F2
	8WFF2uWHK7L5OCJ9Yh4jwG0RqFaT+Wy3WGkDmekYUUkBimv1oeogBbihO6XGEhpbWhk/4cAYVq9
	0piE5jmGje2NkcX4PgMXYhgE5D/yL3O94g0uIonwoaWidjLvssmXyXYEJw7HS0k0PYcTl/IMzf4
	wel3vETzulKZiOhJSLwG5ILj72QfVqLQb0KUiBZMcxYnQ7pKHo6SMecx6Ux81kUKKcy5tvDEeJz
	OEVZxqwjLjtyaxrU1rgQXLO/w8dUxvqmMgOOFzr2S7QiE7ZWq3E/v+lrdHUwfSBw==
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr315062885a.29.1793478691949;
        Sat, 31 Oct 2026 13:31:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr315061185a.29.1793478691386;
        Sat, 31 Oct 2026 13:31:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0738dc4sm734554e87.51.2026.10.31.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:31:29 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:31:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dsi: take bonded DSI master cfg from per-SoC
 config
Message-ID: <hdft7yrut44wirysbfigpzgg33lucyb2ruyntcxu447kcsrsqa@k73fvjrhqcch>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031150305.1107572-5-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: Jeu2Fx2isuW_aS0q2Od_S3O8XTUBCSRQ
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae65024 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=LlY1mk_YLf5cAL8JajkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Jeu2Fx2isuW_aS0q2Od_S3O8XTUBCSRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX2Yz1ddN9EWlS
 M1bptLTwJA0/piJAkDhAmEQwab4IdNtwy47UBNLqDbpNueyInYUbUstmwbxThnaaspl5TS40Yvr
 iTb3yzb+fOLx72IJSSWQXNN4uiV9TG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX/FVh6gbFEYRu
 Y34ow8ALyYOis6sLzZntgoZBat5FZcpFIfH45CNcKbWEdCmyeHb8KKxPZqgCvU96lX9RVC2l58q
 yyQnf/3Zo3Glsm49IJuCgmuEcUxt1EHoCFCtKYM5/fSBYwvPsnCgg9MugbNIaBYj1gSKqVMFSpw
 nfDLi2y9LP+9H8Te29AA8bDDgxJKS+KKs1zLZBjAz7VGmgyV6CpmJSSCLYjuXzUiCJDFXFW5cjO
 GVAtP53mQq3pDE9VPIXUySqk1/HQGbxfT4AA1aT1cQy+H0BNxACav3dcwTyC+4LpVmICVSFFIb8
 JRvsn6qhQvYcco8B8CwcHPKQrGXBk6mRNVcEHDIsX69nJWRc4kv2okek8orSC9B+VTcymEXn9Di
 b8yB7XLRr0YczqOIcEsaviAtUg8GkPdjk3PdvREMlVKB4b6cN5oE1CIG6NlWBcf0pcVRSGTpgZj
 Qt6u0jsXsiY+jEcdG3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:04PM +0800, Qianhui Xu wrote:
> Take the bonded master link id from the per-SoC config instead of
> deriving it from probe order: the master is a property of the SoC's
> DSI generation, not of which host happens to probe first. Behaviour

IDs are not assigned by the probe order. Master is also assigned via the
DT.

> is unchanged: on sm8750 the cfg entry resolves to the same master the
> hardcoded value named.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 ++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 49 ++++++++++++++++++++-------
>  3 files changed, 48 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry

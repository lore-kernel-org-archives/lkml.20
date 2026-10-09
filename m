Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0C4582F7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552238; cv=none; b=ZK//nj4iStRmgRfgpJFz204JPzdKo/7AE2kIVQfxeE2ITaf3Y8ngGNfH78qerNqS3Pfa3iKv6M4EsGtTASm8c8kgCp8x5lYnMV4xwyUuyNr1wDxK63U0bckIHI3w+U9usTHmLyByjv/7ABXWQGj3ncUe5168f6CSXC386E8lBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552238; c=relaxed/simple;
	bh=RDoVcNfYx4gWnIuXkIiuuDySeKt6FSVcYGy5RTL4yVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUZSziWM2RwrciN6P1Fgq2Q8PKoHuuSh3yJjkoIAnes3crWpT9IgfCEXrXQui8qaDe0+vBchCD9p4eVBPfh5jiGIgzaplWIGrb2E1gBAQwKL5FSkoDdG2FILVZc+33jCzo1NL+xugJA/uJ4Zm6wF+gyC26rVk5ovq1pmYg/SbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAodCrab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hghnHY6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAodCrab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hghnHY6a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKpRi1886403
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTb/nAfNcf8kmDxbDKy+Ovtj
	nlCj5G5u+5gd5OlFFHo=; b=ZAodCrabe3fUrhjjoTHdRkIIE87+b2J+h/B6Geh1
	tmMSwvyuWk/IZnKg80VRBHtUP0RGB5IICsSGqhbUNxZCg3meVXqjUv/vyzAuSfen
	qRIwkQLhnCEbkulp70eSu36zEg4UXkthNNn+1HQHbRZirJuWG9zEDQYmXi05uZRW
	yp9125PWxK8dR5KwYaAXqCcdhXaTtZvBipdEdYsaXUNWa6tWu8Vd7b7u/hRS+/iC
	feKdKji/X+1y8JP2m4ZCPQyumYSvSbQYn+I5Pd7M3hPWX8/cQYUplxrgkj1hic1C
	K4lmOk2/oxUB59s7Z+iU/BH4MtqZwZW8eae8MNXySAwVSA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkbqx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:23:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so142679506d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552236; x=1792157036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=hghnHY6aU/io7XZYXfAwv/vwENUjMbD8HmBeMxvSPvo2HW+PP0/70j+1Sa/T5QsjVa
         Co+N0C+8q30GnnYEYQLfUbWI+tKuvGNb8xcLs2GI6V7LfjeKGaJrlL+mfPwDtXgy1+2U
         KvSoZrpHPlhb1vhkVwEasb1uG2b4AZa7CXYo/r7uwTMPpK+kJfyOovzvHVXd4gTCsN0N
         DeetdCuzej9wVTiP1Aqu52upy+OKM3Wn+b28D4OmWg2IJCZvPqz17aDluHrzkHxVmHo7
         YGTC2jZCigT4ZMCUE7j3jzVrifrDYb3iJXDl+nackGjzOZMKMQIJtB18l6xYaBx4c3iS
         euVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552236; x=1792157036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=Kx9ZWqtk9LDogz8aptH3isYtI0DwvU9zU0ust347z4cGapTiFyyrlXtCC1Dvn1QT4x
         QKYLRuDzWzFTBTIWP3Bw57heqb1eGqNBme+5yc/s68nQuS4zbG0+e5T2OHpaqJLnxs4I
         cGkHkIu0sYGF6LfnkZlEwVd2Q7KSszxCvrOPM6yOHLe6sLMl+i6cSC1arcZO/vQ/MMCm
         DcanzivGm6qb63OVQsAws1MOG5O6Zclk7Y37h/tw4fUfCJgwSPSTKo1Bm88ENYEn7U0C
         cOGN29yJbUrRlBvQ6p2muOWqliyxj1yrbVMnReGemK8Ky12PLUnHvU2etHviD0+2QiSf
         lFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwadB2UnxnhpXgg5vTrl/OfU4NNDwVZlOBIUX6rMN7+4+vUksyy7wE4lRXXHUZhBrefcqSRLUy7XO+NfYg=@vger.kernel.org
X-Gm-Message-State: AFuF++lPSZe/co/zoyetSNjMJ5AJmkZLNY4pMmHthDsL5luuGdh26RyC
	Zq+7zMEi/sDAeQ0E0VwS0JstvBOQAcGGfxoh8WmPt2G0m9IMqczncafEvGfghj0JDyd6dZbWcbd
	nzeprg3A7q4sOWknTtyUj0odaJ6w/44edafa0jCyw2S3GuNq6gA5ty8MvFRMJOmoleb0=
X-Gm-Gg: AYBFou34wJ9GxOkH85dQVKzYDy4v+EFYjq1OUeXGWTCe5PdG3MmjX5p8foQVu1hHEnl
	3N3lx0rEQdRtSFnjyAgUpgqML58ZDhnT6MZA6QCXfbnQEJDtiC8R2n310N9BthCGnN3auBopPUe
	5GlaLruKteRJN5vEOK0/g2MLi9+DiqScuKOgkaE0G/lPXH5yBUteNMSS2g6Fv2IR9AaD7LnxAZU
	oD275VxOIBacsoZuVCYI2IrpN9t+84x/VIEJ/XjJZsWC5mSA+xjiGJmLHp7An31g9o07lpIv9G/
	3BqSeeS55J2nNjL75hdbn43rWjeM3mDoLRJ5newEKQxbYn8/R+4XMV+Qvq2MR/VYIHVjBh7NHKB
	eFrch+Xpx+Ba+djVnHtU9decNHcuk+CP3J1PQNic81DQKgE7+kIqs7TtA5uFQAtP2yCTUXsx9w6
	Oe0z2iChBfgCpC
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr253000385a.57.1791552235205;
        Fri, 09 Oct 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr252993785a.57.1791552234456;
        Fri, 09 Oct 2026 06:23:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81e6sm634124e87.46.2026.10.09.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:23:44 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
        Junhao Xie <bigfoot@radxa.com>, dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: document Radxa Dragon Q8B
Message-ID: <kzqftw7lugumzzkafcnsa36n6nix3kmwee66bzlv67aoqrkovc@7lbdhwfchvp3>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-3-eda11e5dea8b@radxa.com>
 <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
X-Proofpoint-GUID: oibiANZKqBBDy1vWev_x910T8wGP8HYG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfXx9KFCg9siv9k
 vq9DJysE6WGAkmLcjHdXugZ+rjuWLo1yLMHbcp2N4uKopOLa+TU23o9Q4bYMa+4qjR9Z2FohLXK
 nNeth64KNpUi7H0AQaZKIyKrQUeDLb8=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8eaec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CDNH-pee2JQSj4idvpEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX7keJGksqnzYQ
 ufpc8QAvxCCHvDoEF9OD2e89+aRLBDM6O7daWm8x9Au/LuoAEyFC7rXZaCiCs0f2usjxJkQohM6
 9DwhW0xAWFRZoNAuBd2QjDR1fD8F6FicspImip01My4Bn0ODoKG15czU0coZdoZPSMp58f6Ej7x
 +UAYC/IY5XJCloEhv6fSEGh3dDM9MGyPbzbskD710tgEkpBbayFrn37XvcAUa3N0CfPu2cAapIn
 MCqhX+ma0sthU52LnDyEFapAwmdtawJ13fiVZ+DEaTUzkd7Ot7H9OD7eXmoSBi70mG14ACeN5Mm
 99Mv3ZIEg9XIX+v8Q0J1rLkm/Vg1Dr8sGeFj2ch639txZH8MSsim4YG4gGvCpylSKaTUiUH9RB2
 IgNY5gzKx6DsxLtTBAMnERBv0N7LfOl/wtKT8+oFrfkCfPwc3MCxarDIXEaqF8bEEOqe7xx6bFi
 kjnqCRtZKf0dVrCKiVg==
X-Proofpoint-ORIG-GUID: oibiANZKqBBDy1vWev_x910T8wGP8HYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:42:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 09:55, Xilin Wu wrote:
> > The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> > SC8280XP platform.
> > 
> > Document its radxa,dragon-q8b compatible.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Daniele Briguglio <hello@superkali.me>
> 
> Fake test, drop tag.
> 
> Why is this so problem to provide the tag ONLY to the patches which were
>  actually tested?

Please teach b4 to skip to skip Tested-by on dt-bindings patches (or to
have a flag / config to achieve that). This would solve 80% of these
issues.

-- 
With best wishes
Dmitry

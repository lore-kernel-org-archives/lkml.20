Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1C489899
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809314; cv=none; b=Hqu5P4PPZWqjdAM2urVHHOGwH5ywl6ltG96hjoF9hcfhHs5fIA4/0v3j2g6t8aOw6GmGX9YmDYvuXBl+hyzcVDc0SJZRYITw+jKFTwDLz7zZSp8QCQoOaRebxhqBs3Nw88r2a2VQeYr6zS48w4dv4VMkULc1YGqNbogrfcGASuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809314; c=relaxed/simple;
	bh=LoitFbl/+ivchCR9SctHVfKX1HvFK0aZ0Y3NUBG4rro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr38xMKWFw9zQb+57Jef/xGfnhfS+9wQZAfjz+p8d8jvF5pK0K2dr3beh2tcQI6CA6FMmKhyGQtX0UOiZTy2lbp12Vr/xsV5/1MPvhUn8c05qHEYXduYNYEIB+q6o+hvyEzBKmzMxUW2plgavYi9eFEriLOUT1CsPHy93P+4WQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1SpKsnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8/Olmji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1SpKsnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8/Olmji"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0XQm2252917
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=47vqK7Iv9Xuep7A6C/o1Hemt
	gJkLnTAUGBL9UovdPBg=; b=c1SpKsnFABlG0oAUswbhng32HHGQaOPi3tQ7ktDu
	V5WiKbfuFdchJ6e7rBuZvdNNGkQPPQKCIkgxdJhtxzOJoCC/jA6nfTyI5kT/C842
	gC75AimibBYPtQ/L0SYvdTgwAWBEAjOeeqvrHlEHUD3fii6/89GHrlHHj2Mj1hgK
	qmYzRj0Ks2DFd34WYKZ4nDRvpLxjd5lm9cDshTqGHaDtCi+damY3HhYITrPjUduf
	QT/jl+bqpGHP25gFeRJ98A0MsQ0dKtRZTXJrDcVpy0rckjVoTuClNmk7l+mMrNzs
	GK+2t6XmhAqT7WGJOL9oRnyPsRQHj2TwstivL8mE5mNbzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7131ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:48:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so446039185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791809311; x=1792414111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=U8/OlmjiSeROwZnOpW31kvnkyjQ0Mv+gJsngl+cKzFafVUCgB3xTWwkPU2X7eqGnyn
         pzRYl8Jv3Z1ZozHc7yh/cLHg6rYf2Y780VcGz/KVDgEp2nd0dKZQDomGz0e8ZQBvQzlF
         SEnaV6UcJeaXkdqzxad0UMjH/fUnN3Lo0WGQVLvfdgfXKBNnYAQ1Jz/hZ9oMqSOxgL8D
         3oM/WyAb1GwTdDO47hu/j6vzEY8Q+hTpu9Mly9qMijDhkS5CS8XmDNGaucbrgkoXC7+V
         VrBd5LtRM6yzdY0BgUutVVw2BQVnoETx+Gkin7BZxwv+AavqzSj46BcjTVX8j87QPeEU
         EqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809311; x=1792414111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=RzskWk/IJDwRepOUeK4GDp60Aiw8SAKWVJc51EDu7nBKTSkBHB+uD6pa5FbfkWXtWw
         XzBiAC8v+yMXU+vwztf0EqkzsX6EGK2STrKV0C5AWw7dphLc0XmNG2yDni95eMgSmdDB
         pktwLG4P7uOx2vb0FgIckz7CAPOC58mEnmikvdsOFyZLTF5FLDfeVSnRxPFy+vWzDP24
         1FGwZaSGGPhyN/KPkYhViOwKQ246dBtvydgw0ixAbhpbsiGpASfzDikK7dxvepaopjuW
         wUQ16lzBSvqcTndAkqJMPpQpr7ojyZOlz8Mq4CUaY0/1wFd1kRqoc1SbvHSdj0Sj/Tqu
         Zglw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Bzo1mLkx6fMYFMLJzIBTg8IDt2ANIRDjgIokpYlePEUScw9S6GXqW/rRvo3i76jmwr9mpOycxJiZiGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpdN2ACwnwEoAIkgNO6zrlf5SrD4Y+5uQdtNzXp9EpG8lpZ0p8
	w9Zv1KP/zX7dhNO4QANDL5yZFsUDFqYqfGRdu2a/tJdReNdlkghBMkYFmtMCH6Va2KiHo84BMKV
	hqGSlZgQumIPuJJt8cQkOTz1ODnCZHo2zbq8BbmMLwddMEh2n65GmZbMrbchZEhSQPLU=
X-Gm-Gg: AYBFou2DMoaigNOW9S82K9XDdNadhRfXVV0LoxsUKsOstb0FLXSBnXPxiyZevlje6FG
	JKqn+0wi0QzwLgx2udxGjZ3pq6O6GceE5s1p8DsxUH/UGZ5+qYmLPmPveXmO9fLe5XJ7zUWW2M3
	jevvfbFjnQzHaZL9XowWzapF8K4sXr02aWJrWIZ8KYNJ3MY75xfaId+XWWiJhU6HaHgJTSHeSyM
	1XA+0JY3nzqPXaxNX5vCUto0Byhf2SymZLuwAk2sP8frvfS2wxUkRsUblpQ8lVsMUUhME98Dhhb
	+e26WB8Pe5m+7XDkfi0LywD5Zprl2oPqvlbKsC+6MnxipDK1uIC+T9AkSaF5tSPJFM8iRFldOmg
	guU2kbTRN4Ng0M1PxIhQ469dD9LghdDubHvWRoPCoQIPeTAwaKzExiYlM61kYZWbXPErhzA/lIu
	8ArJj9kg3YTAWn
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568718885a.58.1791809311406;
        Mon, 12 Oct 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568711685a.58.1791809310825;
        Mon, 12 Oct 2026 05:48:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm2753995e87.18.2026.10.12.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:48:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:48:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with
 HPD processing
Message-ID: <wk4gnn4pq4jkm7rwxle4ivleqj5eb5jpllfkjep4x3kacbadim@5bsg6g33e3es>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX7NGY2SGgElm8
 uJDfwaGGtUUNCRfNSF8tkBETwKvSfGHy84OQewTjP9dvK4OF0sgv0IaftjwCwDEFS9yV7jBIX1n
 fkNVMZaIKDODj2zwL4krkRcDgb7R35U=
X-Proofpoint-GUID: zUbeekaXvyYp51l-xdYKZylMYMiHwGLf
X-Proofpoint-ORIG-GUID: zUbeekaXvyYp51l-xdYKZylMYMiHwGLf
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accd720 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ksxQWNrZAAAA:8
 a=gPIhC6YDpAGJdL8mzGgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX1w7Tqz/PA+si
 2KddEb1oTuu1CRzENSZfgIl17NNNQr6LU5hheRwtyOdDCcM7L5ZkoF5SGZ87sX65f0z7tdSS2O2
 9zlw3cq1vT40venuMJGDd2jb8A/Ma9u+dURFImVu2OKT6+LO+1JJNW2nHG7f7AbBEwPb5A2ZkGw
 THom81QRgPAqSi3xq/cDi1xFkb5Y9HF4YR64YLd/xQUBkjJNQtHkNwPrgLrkEpjMioFuVNBuQSU
 cXq5fetmfcfoa1cWOzDK8hYjnAOxG8ttjnph3+JsIvo1oKxQ14BN/TUE9j3QeloVy70ZkWqECLf
 cwFNahRLJZaO6YSJejXMPmUHKTwBtZCbF9+Dz4JNFm5VmwnBM1RMRh7xY5Ft9F3RJqHo4vaqeIj
 i3QT9leK9MC5I+RXIti+GGBifPNC6BORzD5MtmflFektHdsj+zAIelIEnUyAvAo3emN/9/Gj7Q6
 dWga+l8XBX8za3LS0WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120050

On Fri, Oct 09, 2026 at 11:15:59AM +0800, Xilin Wu wrote:
> HPD PHY test requests stop and restart the mainlink under plugged_lock,

What is HPD PHY test?

> but atomic stream enable and disable do not take that lock. Both paths
> can check a resource flag before either updates it and acquire duplicate

Which flag?

> clock or PHY references. They can also reset a link while the other path
> is training it or enabling video.
> 
> Hold plugged_lock across link preparation, stream enable and post-enable,
> and protect stream disable and PSR transitions with the same lock. Add
> lock assertions to the internal stream helpers. Acquire the runtime PM
> reference and handle the eDP plug event before entering the critical
> section, and leave audio shutdown waits and runtime PM release outside.
> 
> This provides the serialization required by PHY ownership tracking and
> the subsequent stream enable rollback paths.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

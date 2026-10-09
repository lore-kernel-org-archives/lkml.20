Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D96397338
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587260; cv=none; b=RdJakSMq732lxjd20wKg6w3qiR22RCqjGcXTEAZ9xQXq/8ZMB+plATqmASYv8ViVF4BSCwTnOwUMB/pNXdeivrBuufts4jQRlwURElW+ud4paUg7nci2sQK5CVxfDRjfHk8NUtTqy5Ec12Nl2jRQJbjEmBWNklH2n7cF1S5W40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587260; c=relaxed/simple;
	bh=Ve40xAhUwgsJmkDOTf6SSwLlAmWYW2ijle3RYllFIvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3+4SZw1MWGNJpJIYMlQMrT6v6PywRy7s8vC8ytmqH3lE/QhCwD+3u56wExa0DFzBeYoSDoJ/fj6wcQ1TkRk3EAz8pSFcsrz1xjULDvR4iLOfoUcTq2sCQYpgRGq5UJpoh8LR/kfzQ+be0t9E7JbrunlBpi0Re2sZxEwFQZmW5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poxeMDiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkposgGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poxeMDiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkposgGA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Khh4W3274879
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 23:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJQ+kf5MnL7xKpNUvo4gkckT
	69br1MaueIPMleCQVbg=; b=poxeMDiZBPhAJbo+sTTvlnZ9TltLVFYzd7SEHzl4
	Pv6xmRRMi5iiW5kRjFFQvb9nfzDRYWMJmDdnUooqJ0HbXW2PrnpRiwWCyjKfYJ6d
	0o+ov4AGkPZP9xBLDU6Pe99UWZFPuIn628qhgF2WHdI1jrMbrQ2Ci3r4WGCeZZWI
	WLdh4M4ktu1ke49A4DolJghNjLGhXlAy9Y6khoBq0HEniT/ZhUE7AUNoiXfL1jki
	QdlhDla+n+nLl8EF3ghk8oAtQxkD63HgfKR0tNHqYqNbsy1WyM7DzDPZ5WSVkbEY
	yAkCUtisPNdh3C6Dm9tJ7IDMvKUt9PAnkuV+kYHtxN8Fsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7h2d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:07:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so53738885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587258; x=1792192058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJQ+kf5MnL7xKpNUvo4gkckT69br1MaueIPMleCQVbg=;
        b=fkposgGAvf7ML+q7EzSzIXtxDkHGrzyEnnPlLiC2EFgS/EBHuP7cFVfgA6C32tGAX0
         hei1Uqj6sQJNothuz/GJjmWBA/XVyNZOWh1IpT+Kq2zJ1x6E902xj8+7o5UzrGMiC8ge
         ogbo5z8PQ9bqWCcJF8S1QdHOPjNqx1FnebhUYAlOZHud89zn4g8XRjpdmJmYy+QwQiES
         mUrsevCTxH7jXnZUMgfNUsWyF6UW7nrbJNY8EdrhXnTK1+ZLk7AiPH174n9ARs15ix49
         wwQvK6vVwh4O7JQzczClIRjubSMmP5xxZ3snVoHUOHwGamFVM3EncNqLAa8LQ/ifd2Ax
         rGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587258; x=1792192058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJQ+kf5MnL7xKpNUvo4gkckT69br1MaueIPMleCQVbg=;
        b=tlZx54AkBlulVt/bo7H7Jatq4pHErC7rpgl4eKgkOoMbjzfDYfZGhyZXGttGyuU5HC
         JsgymIbmTBpym/3iS8gIojIQ0ut59bvOy/dKZTtbLlV/4rhI5n0riQVETlvil/xFGK8i
         VMVaB945yhhGktuSd/SqpTGtID4H6emWDOOTMg7YxUTvUe+Fn9YuRPqbkfuhjyeAEamD
         3TWJpbhpEgsgJQCdZvZtQlOpmZ0cQKL0MbQLHCgTOeHWa3xDJXmEurGjII9pRphKM+mg
         23Q7UM2wM7JsRkyDFcO+rmq6CtEWE9g6gJrL6+pxkyOg5ftME+tuQZ/7/ptDUbh55sif
         kVPg==
X-Forwarded-Encrypted: i=1; AKwUvBymhxrDpnP9jalXwYfhPal9xtYXuT81SD2s/f7mT7Xc+yaRgENEaA2+8MSgb8+msX+rp/knq8Wtz2yKLHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Ogbh9BuWj648p+ewZn0gE7pQtGcEnzbxCv1oiognOGGnbNC4
	wGxtX4eOvFj4op8WApv6E6AfPn5Dpv89mRj7KHTzJHAkbTvJN30T45emoDql/A3+LliE4KwZ1FT
	cjHs4ZkrE8IhH5T8nA1UnHzuDW6nUyI3O4+Ul5/q+q8LqPLaoUgHbE8xrkxnsMf9W0ZE=
X-Gm-Gg: AYBFou1rTt7e/VKJ7YBkx2cct4mDeofSWU1YJvW4c2FY+dCeqJEO305XLhl0NtIFLyq
	mM9B5w7gCQXIF5T3w8pl9EF5VgZTDzWqceWYOewoO8wbDIJTMClUifklgJ/VheykgJM/QUssMvp
	ToED0ygmE+NMIyLfSN6Ev4skcnTeWeb4PSIdXjKmgkPctsVt1f/GeB4vzeqXwGDsrg/AOcFzOZU
	wGCdrmagIPb8LY9ipurjRNPKT6RCXUkRUPaj2G80gSkDuovdKS4+Gxw9IsRsjtNkxI9edyADqkV
	+ys7btT1Kj2I6bS/rWxgjq858A9otVSBZKdlHixDn00Kj6BKBPkM53Kuq5qvecJniiisJf4BCx7
	QKJvzB1H0EjYMjymeSq36c9ugH4Qwvt+fXfVxx4m3eqi1r375y+savkntr0j2y9T4AqHddpBel3
	bPu20Qjdcr5pI5
X-Received: by 2002:a05:620a:2b8b:b0:93e:c12c:fbb6 with SMTP id af79cd13be357-93ec12d082emr442615785a.67.1791587257565;
        Fri, 09 Oct 2026 16:07:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8b:b0:93e:c12c:fbb6 with SMTP id af79cd13be357-93ec12d082emr442610785a.67.1791587256954;
        Fri, 09 Oct 2026 16:07:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36571sm1047516e87.9.2026.10.09.16.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:07:35 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:07:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: sdm660: Enable keep_alive and
 sync_state
Message-ID: <kpkyqx4lxytqybw2hi7sgjn6yxjpfwiubebpjkbmqxq3rqhfto@eho6emqqfz4o>
References: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac973ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=jpwJ7B12E_5cSkMseaMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZnHWNp_6xCSiaTBzR7tbRZUk5K7WfDYW
X-Proofpoint-ORIG-GUID: ZnHWNp_6xCSiaTBzR7tbRZUk5K7WfDYW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX3TvuNGY+iamY
 HwJeyLzLJiIsfjug96BLsBb3TNrG1U1Iqf5keUFSIsSqXmkEMt4BuT0nlTsZnGEfwxJNhBy446X
 lidontSTdnVdwUYOu0BzNcOIJBmkqW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfXyerS1J76JI4L
 hq5qrwtSsf26hPNl+hzUsnD4avFCxZqoZ0xpJIYGRVJcC9ysvVQbwZwim7cuECyWA38E/BLyBTh
 k+iX+EPy3CJqYZsOjF94EN70DGUzTfja5r/C/ulRqugxeKuqCoWDB6fXtekD3PsnZCW+JOMmVbm
 dmxUBodGTx98EsXp9u4ie19M6yco6oVqhlC1RZ30idrrPaefTuYHUdZoJPXLZ8VRG6Zl03qCd4E
 5E5MGs6zj12dQjKzivIeXbuDH5/hJPbddiyI0vuP82qSFyb6j4373FUycGHuY7BoqRtpxJcD+YQ
 mZYYtrHexI6gumjmL7RgGqVcDkKQH9nerX1THh+PovV7RhcPDR3hawZQMXWFnFN9Uhqhr/+rfoi
 KVehX635UygxLzwl1ZBm88Q7rbc+d3uFhW9iSyoWkNNqVE/Ec0BRP6Sd9IFw2Qe3hh//7nhEUi1
 dd/teTpB0qotWpYX7zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090092

On Fri, Oct 09, 2026 at 05:45:41PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The interconnect core starts every node at INT_MAX and only lowers it in
> icc_sync_state(), which this driver never hooks up. Every bus therefore
> stays at its maximum rate, in the active and the sleep set.
> 
> Hook up icc_sync_state(). Releasing those votes also drops buses that no
> driver votes for, so enable keep_alive on the providers with a bus clock,
> as QCM2290 does: it keeps a minimum active-set vote and leaves the sleep
> set free.
> 
> On a Motorola Moto X4 (SDM630) with the screen off, this takes the
> battery current from 117 mA to 68 mA.
> 
> Fixes: f80a1d414328 ("interconnect: qcom: Add SDM660 interconnect provider driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Konrad Dybcio included the sync_state hook-up for this driver in a 2021
> fix of its paths [1], Marijn Suijten posted it alone the same year [2],
> and Krzysztof Kozlowski for eight Qualcomm drivers in 2022 [3]. Georgi's
> concern then was that buses with no bandwidth user would be turned off
> at sync state. keep_alive, added since for that case, keeps a minimum
> active-set vote on them; QCM2290 and SM6115 use it on all their buses.

I think, at some point we should get sort out if we really need keep
alives on all the busses, but it sounds good for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Tested on a Motorola Moto X4 (SDM630), whose board file is not in
> mainline yet, on the sdm660-mainline tree, with sdm630.dtsi's
> interconnect paths as they are in mainline: all six providers synced;
> the eMMC, the SD card and the USB gadget worked, and the phone
> suspended and resumed.
> 
> [1] https://lore.kernel.org/r/20210728222033.52500-1-konrad.dybcio@somainline.org
> [2] https://lore.kernel.org/r/20210904111452.248804-1-marijn.suijten@somainline.org
> [3] https://lore.kernel.org/r/20220427145616.523557-1-krzysztof.kozlowski@linaro.org
> ---
>  drivers/interconnect/qcom/sdm660.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

-- 
With best wishes
Dmitry

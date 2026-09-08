Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0C377A93
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851538; cv=none; b=lKCYovWpMWXgFZXKe9b+L3+z9kCW4kXZbynl7vej6ArqZVZbWPviQXuqxTjPBMBjJ7+jQBRbTLbF9j/YETptF0RkKL8gi39/7nNaJ7qu58VTU1DVjzLTFUFk3yyEtWfyQLCPxuwkAgEoUg9KCsbFYpSmBrLiaN8Rp3H+4guIhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851538; c=relaxed/simple;
	bh=gtxbTgbppj34ZTU+D+eqsM2L4hzAP6mpVxsCSxwIZKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQfq4INi/grrEiaKjO2djHdIi5+7ZbqGs4tLqmJdUq1PIQz1B5EydzpXc8qqaoLoLjDYK9f+HatCvFEwK9BD9NTHTjKrX2lFRRaJog+KvLHvOZKceodPFkUuds/p8NbYQ08lo+/K2ZT3XApD8sb/lDRkS+CuxWtQzcRZjw7gUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XECS56H+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RviU+lGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XECS56H+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RviU+lGb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9fB2363459
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E3zkujL65pMjgKLSlU6wYiUK
	MwvIEv4ajalF5jOdh9c=; b=XECS56H+EXYswaZG73P3GQ+f3tNMZUd71/x+iQ42
	ZfGE9lPVXBcTey5Rwf9Lz5PJfVmkncqWYnaaN/zyz+RkxBLUGorWb11ddV5cH764
	p+kRgmyrjg9VDjDded58M4jS6Zgg0iXs4SEDqEeJazAybOW+4zIIfuHqviOy2gse
	OHSqRt1CguJ/8+rFhdDA/4xH9d7tulGMnQXoB00KbISaRMbtOE/53kTsfPwwwV5y
	o7YqWV+U+nt12AkNWXZA5A+yqO/PVGZ8mHGJBu3jFT1eNlxURFm9ri1OTLyVuhLb
	pijHsUUwi2c+OLh1R+cysQ+o95+KxRI7L3RmU63MbcHupQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagugrm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:12:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso382577185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851535; x=1789456335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3zkujL65pMjgKLSlU6wYiUKMwvIEv4ajalF5jOdh9c=;
        b=RviU+lGbjc31gqppG+/OqUHHXtourLwg5+ShdMqK0iT9Ot4T3lykUZif/sMWfWB3mT
         druuV/wSPUECzbgSFnXCnCMoNHHIEeM1ypNGSv608T03+MbklnV+glktE4iYi93nrot5
         G6uylIa1Zk8cpJRoAJIbiKCJwluMKcw9PyGIyWuF49cbToujV4q9HfeWHWsLTD5LbH7z
         KqwAqJJWDesWw3xUT9I6YhHXRkeiHZ/YH+WgIEegb9sXRsQTHJ88qSEWU63S7kLfvkqv
         bVG7Ak9R+SZit9wvLMXH4jsOWGVBAvxg9Gw1BCTTSikEVbi1XtocmG55X3Aj62ZayN+V
         TQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851535; x=1789456335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3zkujL65pMjgKLSlU6wYiUKMwvIEv4ajalF5jOdh9c=;
        b=hzBKGUfoNpzThwDL2e75pqtvh7vdqi4urA4qTQgI54F8ww96vAJQzaJKFYPBfcLrxi
         57hQDL0404YLx6DJk/gIQR+dDYCdqHtbYRrkcc+1x6id0MnNUvVpXiS6Z8Pz6+C1wyzB
         NZP5pAyJ4F+Vgo0GZrxyKgpievwSxd8ehXDu0pcP2M+PehGpl72G4iCOeQlR5FexpdXO
         vQGA0Xk/QIiyRg7LAqePd9xtAzYdpPrabiWMajRyRcQq96BJ2G6oK0vCoKb1bBWiHeKE
         CIOddevFhyoNR0M56u4c36TsfS94GIyKvzXZu4p6tpWeMhevitBujGZw+fHWRygNkvOo
         Vbpw==
X-Forwarded-Encrypted: i=1; AKwUvBy9Qhr/iHODnEM1uxLRWE7By6OlY2OqhzPVZb2ZLyYlb+k38jelsI2gAsw4T5Nb3dOjCvUJw0Xag+UyrXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kag5kzcgUsLmB7VOEjpPiS1B0obMNuTynhMBpa/PBBgstBEPpY
	dmXL6byXZWp6m2FTGdCcvCPguV/N32Z4p+DHyFZJaUkfMVZ2lTTdce3Cl9vUvSFaawS2J34MFL6
	bYMhAvqtR8bFcc99juxhW/5OXcHhVkzZOm+UJaQO23Q5+rFGjcKe59yCIkGL+LpjqpLM=
X-Gm-Gg: AYBFou03+RnA6Mpa02/VYABpyos3cFaWnjWceLd8TlW0Lz34hck0yzlLiwLMWkioWor
	cBbzuP2pwEgbWrx5htn7lvgKYZDZCKqrxz8O71X4MgIqu8jk4Cnvw3WlxZ0Hy7cY0nM/OKoRvLi
	UsiF2DQ3uAB63RE/bpVLYynCTj6F41tkRAGSLbv5vmv/jdHse4oi/7jvlL5ADhcWTigiNm9a/jT
	Z+Ruei4fz4X6GcmhZAbF4y1KIXJd3G3RhJe6y5CD945frtpNFadW5SOBhtlKumHw8W0e+jbqNNe
	6MzlE0ykMQfnp8mKj1JmJub6EhWBZMFlXbwV9IpPtJhLMn5ss0hxTltDSNe1XEM1FFOWi9sRs0J
	3I8G96RHuYoY=
X-Received: by 2002:a05:620a:414d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939803ae0f5mr2973020385a.6.1788851535389;
        Tue, 08 Sep 2026 00:12:15 -0700 (PDT)
X-Received: by 2002:a05:620a:414d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939803ae0f5mr2973015885a.6.1788851534813;
        Tue, 08 Sep 2026 00:12:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bc74298sm30591012f8f.6.2026.09.08.00.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:12:13 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:12:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: renesas: r8a78000: Fix lockdep false positive
Message-ID: <cdtn7tdiuum5fzd7tt2idkrm4ioybmoqdlyqmh64ouyub6tkel@b3qmu7igqya2>
References: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fb550 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KcPQinvyHwY3qny0q90A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tDK3kt4ClbWrFctZJ63t8TaaEcsQMGu-
X-Proofpoint-ORIG-GUID: tDK3kt4ClbWrFctZJ63t8TaaEcsQMGu-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX/v0CPQ0pHRU9
 kMgTy6W1DrxBxI+V+rJt1m22TIu9+7JqKqJZv2zn5ECaq8uV2iaUtfqSzw++KFJZoZvJigjRAC+
 /KCWnx+nVetSwkNjZrteFABSYyRzNdA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX4j0rIfaigmtB
 WidCaDLZWe4MuuyzPVIQR0gFV+6AIBE/ElraP4YL61ZdK4fnjKhnTZmt9+ICK5zoAcJpJpTnKCm
 9q9S6MmWF6eFGFNd2c6jOV8TCSpdVOoAfOXeTX1qvcS12aOVK8RZQfljloLfHnwoFYKtcDYNncS
 02tyM/ooOzw5OIelwf/reO0AvD6KQYHsQJNQj/PpioSwLUTqQIGtJ756SXZQN/FdF/l8bqK28C/
 BDESNd2W90tZzo35B47Qm27sXGX5+dhnAL8dOKTw5JD/gZEiNQ0CVdaKbQZYw3T2hmseelGOPdS
 xY4MUEGYmbjqqU61tS7aaWpG4S4UxbdZaMBTg+10PBNM/CMv0HmOrKFyTtDhyjrJn54XcZwSone
 QiXRxS/EWw8iNkp7V84BFRwweN7GH+ghI1INq1Ww0nGRnsTjdoumoJSFNe2CaDR3CK9u01VKFR7
 JQ+bTuEW+g+Q2A8116A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

On 26-09-07 16:32:01, Geert Uytterhoeven wrote:
> Lockdep reports a possible circular locking dependency when attaching
> devices to an MDLC PM domain:
> 
>   - During creation of the singleton PM domain:
>       A. r8a78000_genpd_always_on_singleton() takes r8a78000_mdlc_lock,
>       B. pm_genpd_init() takes gpd_list_lock.
> 
>   - During attachment of devices to PM domains:
>       A. pm_genpd_add_device() takes gpd_list_lock,
>       B. r8a78000_mdlc_attach_dev() takes r8a78000_mdlc_lock.
> 
> As the former is done only once, before any devices are attached, such a
> AB-BA deadlock cannot really happen.  Fix this false positive by
> introducing a separate lock to protect the creation of the singleton
> domain.
> 
> Fixes: 89e6a71b35703f10 ("pmdomain: renesas: Add R-Car X5H MDLC driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7A36B928
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183633; cv=none; b=sfNoOPkTEsbsbwmNxK9AOhFf0mGZgoRFNxZzLqU5gDIvwTs+IIeahKaV7p9q0AbWiOaNMyVp5+byW/XgpuITEZD4D+hn1w5k86SAp4cMshR0k9PmrpxtXTRy7jS6Vww3TzGcK7PPN+y7s0y418WfolWnz+CX3cnLoVA4O/osDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183633; c=relaxed/simple;
	bh=EpdL7/5VREs7Us2Tm0M1lL6AfRDur6w+nbIBLGq+QZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ6tYu1FmqN6XAt6FY5C7dUtBtcMcZYcsnoIh38FLItZACQSA3WGrSaVYW7+H1Lw+cvVjljnizdJrmVWIygcouXOtpD7XFZpToLeMBtTUllToomCb9BGapuYhUmBbdzyoPvAs5w/IIhMkfMxl2sUXC8puuKsvXXn2H6AhJpC7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy2t6ZrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZhD7VAv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy2t6ZrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZhD7VAv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510ZGF094008
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDLcPqpIgNJIp/nmhK/GLcgQ
	4LMkcMF8Ghan1SuoF7U=; b=Vy2t6ZrQX/aSosTomawArSqtB/4XfThI+kk+iDjJ
	S6dngWEzFHQJjI937xrje7ZyexNu0x3G6+DPXsGcdiMC72HvyfwxXSYplIVRU7bW
	brjfztDbh7vayy1SisNNRRQWyeRfUWMAasfBmXpHJeisaDmN2NJD/i2OxlKQorbG
	/ILb4DuAYuNedf5rKouEmiPKxb5Q5Iw7616EmLImAXj4lzUNngD5muP2KsqFawlI
	3otTiX34U0jl+tHUBsN0xSZUb23F4aU09MiorUnYooPUZVXxfcgWG6aquPUDMnTt
	QMg/R81WjK5KlHHijrW4+Jl//3UUIfnpmbuVpVKMJQudjQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu4sv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:00:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-150efa76c57so1629127c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183630; x=1791788430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDLcPqpIgNJIp/nmhK/GLcgQ4LMkcMF8Ghan1SuoF7U=;
        b=MZhD7VAvxluaUqe9oRdmJcw7m45e1dcrMAik31ivlxO6bzA1FG/D4WRItiao2r0qVT
         AN6jOuRw0XQYoik+QEEfPZJsRfnYzjuoJ1ta0VL6RjeVLmSv3D42wE0wlhX5UQWCsFp2
         U4BCvI+YQWamvTKB11Nzqfw8l7yAeSOJ9+F/ZLHKA/zBClcdPzmp0zp9rbruO+mCqpDv
         PJUOUT7V16vTj81+HzTXki+fYf2HORFWxdotT59TQ97VFqPKa0tPEwU2vBeB1xq9PZtA
         CPd2zDhyZ3F2H9Vz/7ByOxO7QeUbjTSk/HU0njwvs+n0ZV6qaV/M9Xiq5tRfVHBjO1My
         qhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183630; x=1791788430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDLcPqpIgNJIp/nmhK/GLcgQ4LMkcMF8Ghan1SuoF7U=;
        b=hGXggml5CyzeAhlvaXoNae3vibwsWgxUEyJVgc+SR0tqEOJnxaeuQAa82Vi3Ra6frT
         1lI8NmLo+6VDMJyOWscHFKJo1/qOz/3I7hQUSl5JiaZVDYLQxDp23a4tWV1UeDyXMnxD
         gjJPa+fSyz8j1TFecWaW2knEFUYK5BeLcL7kcbsrw3VIcVlU1p6ipfYV4VEql2QkksW+
         hrokwuYr9mvWUcvlpXXJNwCaSRnkt4h6a16YS2P4rUqtgW2gxG7I7a0EJ4o1wk9LVLYS
         622ujGHv9u8es08nOYsP0thGGh37j7ZQuP/8VfM07MRiTCW5Vuh1K4Um7c/bL6C3V0rZ
         XpMA==
X-Forwarded-Encrypted: i=1; AKwUvBxXHlWyAm4I3cnf60uKWoUKfx8WRub3+tTdtz3leBfoEZaG6gx2D7wS2TcL6NOK/a8cBUaVGTqOWVD9Pxs=@vger.kernel.org
X-Gm-Message-State: AFuF++nSIpBV7MDaoPABg70NKEHjTTvM7/ZU1S16epgiYx/2aOFDl0eM
	y7/a6Kr3g9DWDEmQ5HreVAsQBbkQoXr0sQ7YlBfl2n4KcNkTyOswwQNrNjkdCOLtWB8GcG4+2xv
	qOUz2HqjWPc8BhHvlxSCHddzjEsgICfcSya2/I2KWLIYpLxnDaTIsiUGIuNlHUkuJXbg=
X-Gm-Gg: AYBFou31JAov8AXDnmYa4M61TngzndqPLzIWml2ZnJfuDKG4GUhMfhJ8zw5Q7Hx0vhC
	v1CleeL92dt/EzJW6wm/5MmMoFlIdOBg7i919NqozfeU9hFhcZFyba59WvcldahBpPf+22ks9D1
	V7mI8egAorx4kSa2c+Ctu+zRROLURxj5DcYeNs4pfxJ00UjMlrE4RzZYibDRsgUnG7la9U6b8Gf
	sESVi6TUh+pAFXE8EXXQtsxNSwpoMsdGy74BvoMh1ZJpwAfymAoXlkgXXiYlqq0TNA7ulA3A24L
	cyqkuet35lKGPQkmWxgynLFeMCV/8heKx97oNEiOegAmpKsY5SI3R7t48d8QejVWbTqtKKJ1JV7
	fLOgk8iBGByMR5Ha3Cotf7QRXpCw=
X-Received: by 2002:a05:701b:2917:b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-151c406ef8fmr7576370c88.40.1791183629360;
        Mon, 05 Oct 2026 00:00:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2917:b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-151c406ef8fmr7576289c88.40.1791183628384;
        Mon, 05 Oct 2026 00:00:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc3992b6sm21703268c88.6.2026.10.05.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:00:27 -0700 (PDT)
Date: Mon, 5 Oct 2026 12:30:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
Message-ID: <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX/psvlqPVad9u
 ZWgdGJcMsdTkKWmA82eDemCFPNov8ygpPWXeK9N/zbX0W1AaTMyMk/3nwkefBEU5T5/fubYcHDK
 fnHFmeRx8BnlZp4dkLvLKs5+AhOfHi+FP7oZWgKqX+iDnLhDArK0q/v5YpdvId3DUBmVeXydftC
 oGr+0py5DcQHqwzyiWc8LvpRTQ6ugn4IRR6OPndCRA+nDFK5Z7rWAoDx3cJZ0ViW+xnv8J5PkPo
 FlIkDSg6vorS0B1Tg3GaQL/WlDQgbfbN+15nCXzQieu2TMi4Y6ZQTbLsyMFnmSBWKr3KCAIc4Pi
 41X8A5YjSvA0BFZqjBT/RDHPYyjxZ1LwwsQFphhSRZfD773J1UhO4CRY7B3oNONNrElPUcvtH17
 TpXsTbHNvbb6J+W6fMOll80AfPzXViR0Yzu/pDE9NzBJA40P8foxYdvcvp1wz8nr3GTZjxvEFQ4
 jJUNOl3RlJy/HCm9gQA==
X-Proofpoint-ORIG-GUID: lDDfRJNq80PaDdb3mrNzp6GHnkoYBHVe
X-Proofpoint-GUID: lDDfRJNq80PaDdb3mrNzp6GHnkoYBHVe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXzJMgxePgGPfN
 pn5YafhOplDjY8ErdqjCvMJyltQ2E4xMV1pXG4u3yZO3OsNHR6jF6NubLE/DMHruk+A8yn4BHQE
 ToW0JSKPQWNO+Xh1U6kKeXC1u5H2Gak=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac34b0e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mkkI6cI774ItaLwqv1oA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Sep 11, 2026 at 02:38:13PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

I know LPC is going to start today, but I wanted to highlight this patch
specifically, as without it, both Hawi and Maili SoC do not boot up at all.

Can this be picked up as an independent patch for 7.4 as conveyed in the
cover letter?


-- 
-Mukesh Ojha

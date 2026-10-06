Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4D39D6FA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279629; cv=none; b=qJ98TBf4OwreGXi/RQPtvuhhp9OEElnGZFIo8GsWGm4Ag44WgSRG1OT4ltYZ3HjsuiTzZiVl3Tpba1qGy5CjKUKX4CvdacnAiXqmnZc868PBwD5yZ/XsrYhvPjyiOWLAiFmfPJMCaz3OUfuQyZim40anPIPnZtk4rzHNpup0hy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279629; c=relaxed/simple;
	bh=N28iiYVzeRpWwCZMUhXE6y6inhlFg6TGF9ayRfgenPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egilc1asqCb7ZkGr6JDabdtAekOAGPUWHPkOp828+eIJnyHTApHVdvLBzGZrc+eHoYKXAQickefvMKq73TJJvS213F7vY6G23Z5vCOMUhVIq37UlmUCREwcgJx4VNkoNpoTXUwvZIbg6jAWmJDBd08KPw85vdQMsqRGRwpgZd9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbofgccD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OK8J/fl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbofgccD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OK8J/fl7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eC4f4103711
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A0veD+NFMlS2z5CDLY1LoPHI
	xhJ/IEFzG0hI68k/Ono=; b=KbofgccDhV6gap1rDHWn8ghVXM29x5bhKZoR59U+
	TL+NpUCKlgu29qx4UCTiR8IzZ0buKSpOlzVKuxtIxveKuDgLlzMwX0ziKH95QX7x
	w0YsqQ15WHkUxCsbadwBBi1G2GjIJb9qR/NTjK4bvlXZxThhlcLKklxzC+5X5qGt
	aG/roHXRndob9Ojwz4kiD2UbK0dH4m1ZpoqvNRYcJBTn6XG29jWbX9U0lih37l9V
	27Claer4mT6hZE95TsAtUaUq7GP1TwCzTBHlW2B83QEpwKZNf42bQw5a1wGsgtff
	39i9KvScqG/iT9Aohyh+7aVv0OtGHMYFsKDbuqJJjKMwbw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0ayn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:40:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-822121639b4so4906139a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279626; x=1791884426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0veD+NFMlS2z5CDLY1LoPHIxhJ/IEFzG0hI68k/Ono=;
        b=OK8J/fl7X7m1eLC28jw12GTCDR8beyC2kTS5bF/FPxgMY5e/KjpPux3SIwaoZqh6km
         S7pG9qSP+ngWeGh1jkd6tDDAy8rqRET4Y/JYJtll8uuBStMx6J5Sva6UZWclfonsGLt7
         3NeU9CkUBJAefMuEwZQyWsjTuOGAriMArmTO709YJgvrcGDR1hmbB12xz6EXZcou4VPy
         yOYcZehA68tNKhNCus45w6S27KQd83prT+t0UHyYwWOqImXJuzZeGo/pcOO4aWS+vQvz
         vlKREO54imVeSW3uWS2ThLrs9m8J2nxCXwEoFuZbzT8m6OaoDaybLxmZN+UNvlVO6Eq8
         ug7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279626; x=1791884426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0veD+NFMlS2z5CDLY1LoPHIxhJ/IEFzG0hI68k/Ono=;
        b=aLYQHl9hkmuWdbLX8gZX+bDtAjzhxaUUhvEGVVbQt0vxhYL0ZDfI9dPo21TN1tVHe7
         Ch4NzXrWpgzOBEz35VyPVqt370JJznV96XcSd6/SprVPBd33vdBtPMqv/VH0CNGDlrmw
         4whDlPeLE7xgnHU9ySdc0RJDTfolF3f+Q443zeud36hoMNsvw9Agy/Bcnh4GO6PVclxC
         gHgxiIEEQ4WM7/3AsqcnKsD0d21jj0QIccoHa+KRzL4ZIW0IDwDi1SrVEHXo/Ez4NTgQ
         6j46gaiEaiZeEbJ8k7fxrtiI09KrPzxB2euW6XtT5lKTPoNEIx967LhUjtaH4Zslp50V
         0unw==
X-Forwarded-Encrypted: i=1; AKwUvBxFYfJH0zs7fzb+X6jPbnKBQdUfrqXRWv6F1x85cMwouzGkOdjvn78skQgW1jX3tJ2TPsuCXylKUfUfrYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9YPvR6DOUwefNhVb/m4piWaB0NaPY4wRYRAy0KkObyvGIC+5V
	WoTGeuegNrmM5VxrMNtB8jVRcVcb4nljM8HiTgHrYitBr57t1zAOZvqIo3Kcbdx4fqNscAFDpgd
	B48+mAC8LxDVOPjBBK6oCxhIE4Kl1hA7o14D/OaoMHlOadkl4lGrXuiypmk0TJhcy8bM=
X-Gm-Gg: AYBFou2K7ESgvP5pTu3l3OoK7rIATtQhPVIlCSrm09gg6PEgVSP7SeZBxUatYHnek9d
	Ona8Sp2hOQynOxYfxd1QM/1FBciioUYMPf/FUeVFVvLAniUgyr/fy0j/wHhWHFmOPlTaqmtH7Nl
	Xt7mx3Y1ONRgGrPnTfG6L7ig0CDwyJLJbq4PiFEzPluGSjGCogAMAWC7TGI5Cdfu7F5gSougMWN
	JIoyCQhOiJW1zAOw4DJs1Bw/4lgXMQcxQiW2aLLbO2il8l6xgvrWkfKOFtTSgmhcg4q0OGA6jgx
	cG8tuKt3durRAswoL8M4jE5/JOkX/0ZrQuFY9dfHKzmqqCyEmNQBGIWffva7Ptx+o1fXtPg5N+V
	UBwuWO9ukgCzeadEW4Ai+4NbvJw==
X-Received: by 2002:a05:7022:eb47:20b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-15eca35f11bmr1199901c88.26.1791279080839;
        Tue, 06 Oct 2026 02:31:20 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:20b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-15eca35f11bmr1199887c88.26.1791279080274;
        Tue, 06 Oct 2026 02:31:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbe53sm5153692c88.3.2026.10.06.02.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:31:19 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:01:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mailbox: Remove redundant
 mbox_controller_unregister() on probe failure
Message-ID: <20261006093114.dwtzhpfv5bp6xk7d@hu-mojha-hyd.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfXzNko8PI6eTNb
 TcsHzR3zzjkTh1cCgALVCsHMILBnkc0JX1gAqgz6AW1+D8WMMpxJ+ryKC1PU5sdZ97nEbXBL3jN
 VEZzT0Dxkb6FdtUkkx26mHDyYByblLy2CrObC9qgc3D7Lu1o8SEY5Klc4mSD76V3O19yREV4gib
 GgsWQeAnv548wkpWTWM9ULSGcwzmOQ35iIIddmJwktNQ3MxErVOapOksBgO7Xq7/RvsuhXnUVOI
 z1HABC9NKfCgTrGkFGtfDsPc3vU1VEvt24gFL3PbhEzh2UXNIWUDtovMyOfnCBdP7AiSfF6DHHp
 XUZP7cDNRKIo+0W2OX4lEk7cbPySrGZOuhApscv9qrImV2zOe1F3JGlN3yNMBVGwiXGs/yWwSsC
 bZOCuktZS5v8ViymZdPUV5dCD38hQR3/YWOPSWik/L3fqqGSxgNsR/55bgKc3mMap0lS4DSG9vc
 4hK1Me8tW7banSrdbcQ==
X-Proofpoint-GUID: fV9baVVSj4pQYiQmhkqW-WLMSou-J115
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfX6i9zqC9eeeJa
 oesZAiqgm9wCLEaW1bLfJUmD5UcHV77hkSMNcXtMo0/CoW5woDPWMcMhHzrvo+yxY17wHyBXsaT
 euePliP2bNIZiTK5OBnzPfBl9oF8lxQ=
X-Proofpoint-ORIG-GUID: fV9baVVSj4pQYiQmhkqW-WLMSou-J115
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4c20b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wN2alEwRXMQDqMsIGcoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060038

On Tue, Oct 06, 2026 at 02:44:13PM +0530, Anup Vishwakarma wrote:
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>


Avoid sending cover-letter if there is nothing in it.

> ---
> Anup Vishwakarma (2):
>       mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
>       mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure
> 
>  drivers/mailbox/arm_mhu_db.c | 8 +++-----
>  drivers/mailbox/qcom-ipcc.c  | 2 --
>  2 files changed, 3 insertions(+), 7 deletions(-)
> ---
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
> 
> Best regards,
> --  
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha

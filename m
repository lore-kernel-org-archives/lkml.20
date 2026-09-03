Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE583CFF55
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462173; cv=none; b=LhZYP2HYYpXc6fWF0yYJDS/xOAUpFkUHx/Z0EAP1kaoDWrtlL70/4JOBw5njEvPUTxwcNLKr9Ck+1x8w06sbW/wnGEhicc92AApruAONOq8Dc3HzPHKK2mIKhRA4XfozjVmax5qzJpItirNlwoBVY5kWmNLjMXoh4xgSQdb75Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462173; c=relaxed/simple;
	bh=gsd4KWtCsBvu5WSWvwFSKMFeW2aHCI2LbDE3Kp+Sbkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JYfbISjhm9uAaAQQQd8YXZ2yWnaAHGiANlpvolXX35CbbgvNxKVHZxSHhAJXYHoIvbXUKWyc9A3c4GBLJfXXZhNA7jXfeQ328H31XONshG8YPcEARlew8lX1KOIUvyqmrvKf0iguSLUtSD9z2cp2QifI75I54Ky1x5mFSZY2YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmSHvHWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVlDitc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmSHvHWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVlDitc4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3cc5820113
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 19:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=; b=NmSHvHWYB+vCIRfW
	Zh65/AzBrKTVGmUnXZ0E7b4vX0XXmNjcU7yHgvLRsItKGN7J4EycM1Qi18XhTmwX
	8n4bUhNML1Npv4Pu4ngNLHatq5rZquFG82M19rKf13LOOGyjYNK/opFfLeSnPvxj
	p4VfdYpug6yD0TLqZazxqWT+K+JoEmolnvmHaINFfcilvJHp5Pn3DA2mAu0jg4Hi
	X9zm7qBK9HVLFvOJUQ/zYvpFmEYVlpkCE2MZKLXe5GbcPC5tYfTgaA/EnTACCHr8
	KU6+XEgWW0fvE/5XGPSL030wC4fbbbVokPmDIPU9YQoSwLDOPSmePryUQmxEZQc7
	6Gb6fQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka4b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39906175917so152589a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462160; x=1789066960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=iVlDitc47AjWjbSLUx/zSLnsPU71wquWuBuNSh4E97aFPPkRiw6SSnRk2YJ7LTbDJy
         RpYSPl9Y0BYF0jUgN+XQ73YxD1K7mFZ6/c317weM9YQwYGcMHAUR/NkzxFOM9mE87R89
         Nc2RtqEWwC1sZWxii6uT1d6Ysm828iwjDuDz7eZxoTXwk+n8vW6nmeY9aJfd4axcOe/c
         ir/EybkZ4yuI5QWpiYJAKSf8dvuO6ysdhCi01UIVeruUIjdrtLli+pgvfq14+SZJUdu6
         WBxsLm/yFD6xwQK3cwCeFPOPIRMaXu8ucFLyYN1OeBW5eobyCsUqSAonO5516o47BCJL
         lOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462160; x=1789066960;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=PGr4xSJ1fGATPlAeY2xgikhULZq0fMhmHk8hpNyj9vHMdpAe1eQlNreqFsF73kRICH
         x7QxT+2ofZiMmnyY4y3lOM3utf6Xz/4F9keBhe1gYr/WCZF15l/lFdfes1nmipasq3C1
         IvY7V90FsuGfHbd/1qqzNE17iy0OV1qrG4W+nUioqmhHL0azxXzfaEpZMwEPlYQevmwA
         kll7icVwqa1r0Oe8wzek0Gr7XaPa9zFIXUZ80/5QPwlbBytHYJS1FcO3lvKCYFUpQnjm
         6j5sXzcUnZ7nR84Ez2aMmt8KIeZMweElAt7tp99kOxPH2niTpwSYJgvP9bMSzaA5RPhJ
         W/Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwXtRZZ55X7Ln5sDG2gapg4rCBMaHF7WeeCr7xRrie7Abg9zogaryNbWIl55gwbPldGjcrGHPHtdAiJZgc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGuQG/BGPZSUkQF3Q8Owp7e6GRbyvlBKN8H8fR4uPgm+XJGkV4
	gHELUzARptEygA3WD7DtZjWhcmENmNg4hJCXrGQq9B3CTyvifsjrHg8AVjJry3AuwqK8ITQ6CZw
	DQWLdspaGNwb1G7AkRAhrm5UuXYFYFUEn2RUtWchPgpEUJ2OawmiX25w05dYMJNRIkdI=
X-Gm-Gg: AYBFou0iU+u0xQ1LgN7jFmVeH4Yzxnq3mMBPeB18y3UKTigxtTLi5nuJWJSdR9/GFmL
	J+kW+f7XhUnV95sL4OAd59xtgSsygKfZ9ymxx2eKF1hXJT6lixOn6TXqQugGBmYLIrfqUwi5SAD
	Ljzq1+M7bitkgTqpiTmBtFGbGuvVwbGcu1y97Ti0jF9foZ80wpYvBsTs9aa8SIb8LpCIZcWZDoK
	9e3I0i2B6CDludz6K0n1BfjZJogRrrktgq2vDDNO3yD15Ob8Ur5s8Oih1FbVbeFUOOy9JSIusIN
	loO3mhiSZ98UG+0Y9MjKCcRxfukYIzH0ifRET2N87gc1O4xsusiL8L2qsEvsH4eJiZmWkprrk4w
	XbfFlWWBkXG0AWDWbrzU5tlob3AZZAWrfMNPujfXFqHESn2afDK95+MI=
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977389a91.9.1788462160078;
        Thu, 03 Sep 2026 12:02:40 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977271a91.9.1788462159534;
        Thu, 03 Sep 2026 12:02:39 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
        justinstitt@google.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, baochen.qiang@oss.qualcomm.com,
        stable@vger.kernel.org
In-Reply-To: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
References: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
Subject: Re: [PATCH v2] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
Message-Id: <178846215711.824911.14716922396673159484.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: FXjdrzyvEb6HQNjVD8YScovQpQcq1iuC
X-Proofpoint-ORIG-GUID: FXjdrzyvEb6HQNjVD8YScovQpQcq1iuC
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c451 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=znwm85vKAZ7j0MCq4kIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX9p5Y3HWtouVI
 us757qFwulW88DvF20r/XVWswTf4sFsWY3og9G4gxQ337Dkzve6DAMMqp0qfYMpQfR+GJ1ir+pn
 SlaMqiGulr+wF+uzQVv5erAQnvW5OASHVJL9uuOdND53jMOCcBl6K5ZqizeQQmmdifojm9765MT
 WRjcVahnZ/wjFuNaRepGD0VfPnxFvrjXHhEbPOxEpkKKKJptiNrily3PCN+CO96ck0b240oZvSQ
 SgzpCVk2S/ErWMpHuvIHpXSk+kb5JDczAOa9mz076qxevdREQxM9ESnMBTX/9gYSqy8afvCoxvG
 thpGOYD4QRLzK0vtXq+qWJtOk5qD1SJRY/MBxrFMbP6ySB4IjnY3cuWihfiDGJ7Ca6jrZSy1wd5
 cAklvVNPjiAxcsz6wZeNHyW11MmSmXsW4uZmxe1wg+ulzWU7efZ7/Bm0y6wNhspUt+HBMsjAtSI
 7myY6qsPWnCLLo6rJNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX7If5H8hWYNC0
 iO8ceVnPLIm3WXiQgPrI5gkyJSTZLhNLxHPnnTztxyWzxrgaArZQQ46y0R4HFlX3dtT7Z4M/L0P
 hYgoWh7+EfUrBewWxYkR7Ypzn/w8Gho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030166


On Sat, 01 Aug 2026 17:19:09 +0530, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed in the error paths that follow.
> Fix that by calling ath11k_dp_srng_cleanup() in those error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on the LLVM compiler infrastructure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
      commit: 6132d70d0890c03546f6970893fd71938efb2a2f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


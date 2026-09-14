Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68253370ACC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411588; cv=none; b=XgBEGnxkojKBuT2KaBrGnNY+bZmq5HeOZJ0Q0IsQ9lkDUHICNdIV8SJySQ84jQyQcy0NX2P4jJLSrsaYV/XK9/ADpKI2EDkpXOwLThyEpRLZxOVBly8NoGZbE9gj3vWgIoXeCXAACQm4EHecxwl+GjF/k7g5cgnjdi67L6iCXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411588; c=relaxed/simple;
	bh=XY/3qIYC2EQqr1ohxOSa5m4ZSvYy8JKUA6mpZ9fziOI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W9aK6KLwUZk/X8vCg+Xtv652atzvzczY4ozno+lgT+0sw+jQ9zlpGTnami1jFzqSPa665PBhTWmUw3UoFE+c90rKKNn/7kOmdu8f4Q/xOQItuoD97JIhGYS4qehpqE4Bm+0uibq4ldSizGwn4AVsEDp7EXcCxYtgwBul02onb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llX3C1pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMZw47Js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llX3C1pT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMZw47Js"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EIS8Hp4157598
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=; b=llX3C1pT2oJpHBmG
	63LvUiHXFHmIW14Nrh/mIaQfJKGQmLvv7i3MiioJbK3Dzz/7RMMrY8E6SYbM4da5
	xyREVw0AuY4NdkQq6+RU1ADpUWCF6EWYj6n/2mk63nfQDOfFD6pCh3qyj61Lkjg4
	rS8n5LzAx6aOhGgqv0nbnBSec60VCh0xPn1udjkOGTpUPWltYb5ddHGBtArnao1H
	hd9DnacfJPzq1hNqGP4RidZ2PP4Q5/uCGeHbPz9aBkvyuaqHy4TKexrY5nZIQWqn
	foSOON1A/2eWw4I122teVS0HHhq09I8cMyOnUUiqoos2wDOh1cG/7PeBQwu4xA0C
	xYqkfA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f2m4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:46:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2964119a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789411585; x=1790016385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=;
        b=fMZw47Js6jRC+dXQs7mAblEiEKvpZVNv/lz3fnAUV2qzbtw33bB0loWZcNd+nVzTD7
         Dl/sxohtZ+Sx6SXx/bjV8utfDtydQd75d/kp6pjplfClVxK5PtXpIrhocwO3gmnXBC7I
         GcBhL6OeSm9XlNKunjPfg2/pbi6Q7cfz9i+X6kC55fgTS2dwMUoXNQARuwt26w232upW
         TESwZPEg+yu9Wptukc9IAJblaw7njGbcB3pzcVWVkHIIs4UygWyKXZgo1JTk56ks7w/a
         XBuH75XjRV2GvuC36htxR66RpwISWXhDk0lv6/r2GF6oQh+ZHIfa3/BJwrefblIOHbix
         XhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789411585; x=1790016385;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=;
        b=NCBCCkN8qHDFD3saDvC2hYRXHSUiNJUwuGizWxBSJz6Zy7yUAsQ3AA3AOTuRwA6n+G
         BDsQZS8hbxG/WU8pTrcgMFNNfhMIi41gr3a4qV9uLIkqkAORMG3tuyvUpurX3EyJutpy
         DX9SjgRw4jHCDVb6vovVcKm1VSrKDIEByTNqWlJV2C7Z/AuR+0O1qMw/cYAWdnOvHDHC
         U/hVoFdhTUo3SMcUhwpf5gXuFN7MflSysOKGJ9DBOhr3bvSKzQpcGtSF1tAhAAO4olWR
         Ig9QuYULdAYkVIAjfaG5S5VW3EH+n5LcVLPZ+Zg1lOESDUuqcj9bLU+ZsHT1vAM8TO0c
         JyAw==
X-Forwarded-Encrypted: i=1; AKwUvBzA4FXcpTZbwbptWB/DoqCn6dy4dg5NgSgiTtai0NTtW9x0IOEyoxdSTeppF8rKADJH79AydlfUe6Jckm0=@vger.kernel.org
X-Gm-Message-State: AFuF++nnoO7m9rjPaNn74BSHzDCv0VXXCKTVUNzRYuKYPyPnibsFyp2V
	EX3p1WiDKxti3OqVlxRfmJKIDhqm3QLGeu0hWE/2CJZaAb9SoG2jcEoVFTRnCySYkCnO+H0m3fj
	W+n6e3rVwBCLQoAxG73GdpwVSrJC0Iq9uYbQ3G+EzJjtX3APgUVysQSfRm9SoEb2rbdq4pxWmO3
	A=
X-Gm-Gg: AYBFou0KPYq+t8Iai9aJXFwnq0nQvKE7M3P5a3C3/HT0+JoIfqr3CNXN0LgZ0pG73ib
	rkIgV8FH4gfWoZ38AsGLZOsnExEncQP+3qAtWRSz8GmWEC7vrU6swPWmGibgWYoyPuUsMyFR4f3
	ReGjlLuCypm2noJdTnuK5WT1qaXa51M7qkqRCZ6Y7qXcYFk9CRLxaCRO0IqJFjx16b5eOV8zG1E
	v7KWrHT/jXBfVAoVgUA56KyjRl9AUZEzaPOqaOsNTIwceFvCgtq+cCx0dvHdTGw9I9fd78WzbNJ
	txN2EKPkfXUGjVLiRkICehz9qJPetDsf4NZNO2y3I9w9hCz5QTG1gCukU4OjxzOaHuWf5je8qhi
	lc1XZx8DVm1STL/SmUznj6tO9Ca5sBEmOa5HTUwaA9F5cj9zEqoaLENc=
X-Received: by 2002:a05:6a21:481:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3db4039cbebmr8612104637.1.1789411585188;
        Mon, 14 Sep 2026 11:46:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:481:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3db4039cbebmr8612040637.1.1789411584633;
        Mon, 14 Sep 2026 11:46:24 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm32032524eec.20.2026.09.14.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:46:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: ahb: Revert undocumented ABI and dead
 code
Message-Id: <178941158388.2896945.2176290382706529944.b4-ty@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:46:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: a7q4eT2KbNQ9UVd94pA_Q6xLX_P9QXWD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfXwWXS33XS9GwH
 eQSD1GS4UISzpNrPt+16qaO63BHVoaa6vn6N9/+bPxJbjbAg8IGNesRPTAzJpAOAsfigh10je7i
 xXh9r032EhSpfqV08umtUYZwHJvRJ4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfXyz6EW/s3a0Yq
 berBdlzdD85E10Q2dWmacFBoKIpnpEN0lgO/jgbqgFxhg+mdMG2BypRX7v1+vrfiSdF2bUjqvjW
 XLr1d3GSQwgUTfLJtgzm+OIkrMAEvMCvACdKMu2kYMIx8nvgl2sDeWJx+pnk7aU3QKgjgX3xumc
 HxsFAYGQFc3ePnHIPEto7E+uEoE5DUY4PYKJUqNfKN88CpvbQ4oHEAbikKnoTFFsUn742nHER/e
 /kZhTUKDIUEQ6IpO81RaEsy4kLMGxpnBrt1tOVtr2gUxGZHRY5Q0WJmdHIrI55Wmtkcd98Y9nAX
 bUBCh7NsQTwJ7iT5iIvwfReDtpjndAJ+HgKDGVZ//jd2/kLVAOJzi4oFJBS4zd482DlF/1q7eVk
 ZplqtLuo7/IRDYPdamayu9OUqrSmPQt3afL2BXa5Pe4CqW63a3yEh353nrgZwahHDtU45dFk9DM
 XJtEOF8aL6zDau/3bxg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa84102 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qqqMIIPnSBjTorXjQPsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: a7q4eT2KbNQ9UVd94pA_Q6xLX_P9QXWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140267


On Tue, 25 Aug 2026 10:13:14 +0200, Krzysztof Kozlowski wrote:
> Commit 96f46607bbce ("wifi: ath12k: add AHB platform descriptor
> support") added undocumented OF ABI, by relying on a very specific node
> name.  This is not allowed and was never acked by Devicetree
> maintainers.
> 
> Additionally that part of code is not even used, because all devices
> have exactly the same user pd, so this was added "for future".  Adding
> dead code just "for future" is heavily discouareged in kernel coding.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: ahb: Revert undocumented ABI and dead code
      commit: ce9d5197d651cdd0fbb586c3d77c28438abe1b10

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


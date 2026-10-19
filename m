Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6840D578
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396949; cv=none; b=Ex2EFbAVsBSSs6mRt1G0+iEy/P/dr5uvrUEOXQCIEdLcCF6inU6XD7AWIy0ifE0r//yTqlF9HzQBaH/BUIsh/i8MHi+DvDOGxXrdthsxbGSiVwUGg9D19H7OLGT+upF02Kfw87izdLUs4ZXwKvVj4f6B92AUnniNf5VWNoSBHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396949; c=relaxed/simple;
	bh=kYlPJuAuIKr5qyWDVfbS3K51caxRUyA4HeA7cellua8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFxKUB8pIguThpna0SFMDjnXz6uwKFOsn85Mvcl27AQHCDZlxLhFvSC53DK1CM5iyJhRatViXS3siKlpt12ZijlzFJFDg+8CLWvF6S8thAgrfEpC1o25LCR6YHjlxkHvVeTPEPqtECpw1ZBX9IQCWcD1GUeTAvUR6Db2F6Xm+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m51zfZxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYOZX9Xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m51zfZxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYOZX9Xz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jRBR1555803
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=; b=m51zfZxG6tsszrz7
	5+GVSh7lRNYenON9mj/Cu50y0dYSUhsQLPY9IBZ4HC6hKHC6dySawbLFVZQqbRps
	THoMxUczMSeM3Gnt8836HH0l2gi+7L6+zaw56XFJFswrnFY0A7tinCwiasQq+DYm
	2f7AI0OnNaF2Mx90/XiDteQBJd/LleaQQZthHTslrYrAcG2ky2CfdAB7PiMucl9f
	4Ev3FGjj97He8hzcrl9Zm1yo126ysY5qi2PxoKLGoyIcKW11extuBPdnXUNkAYWb
	FsuV36I+OiQXTg4pMzFehWDYz2K1ZdldY9frtMKxlUdneRlkhIK5b7MSO9C1U44n
	lWXBqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1pth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:02:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so354228685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396944; x=1793001744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=;
        b=KYOZX9Xz52bNVG1I5wOypRyEyhx247XuvvDFuazByz1NzGdUKEScMFSIkgeiE17skp
         jgAZQwmTESN2b8D0gTwl5/0YNbEJkNfwDRRWLO6uYol5PaSV2OZc/N+qGd3Ug/K6Ze1c
         AFeULePvcv0hVJwNlk3khB8d1sFnyRlc/EDZp4+ZmMtD3AYokN5jdRG/ZqnJDD64a5nJ
         ibjJ4mSg1AG3sVXGClXzHia13AOUjqQnVV0vC7f8oQMGafDQZUtNpngbJAOaXKjH4TlW
         Yy2hnB0CwWZRKmB1A3TMYFXYYN4SWNhO7RUq8WzJmUic/BWRJw9s0fFoFO2CMf9ngba9
         0QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396944; x=1793001744;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRUwB6B7dL/KKexklkwCA5XaycFB7zAaLIgeh4JyMR0=;
        b=zj17U2hP6EfnjGveag1TFas9L4gcTWUm+bvdunxeuyz0FZdZie/2t3bCrHyRQ61LSE
         mfgPitblgk03fiC7h7l5Wt9GJCNp0Kfm4EYQz20fZmwkGj1OEjN2m4uv5sU3OmOPZBWa
         HBMEs20NFezB5dQX2WxdrGFsKU6EUb4m1z+H+Egit2KV+zBaZl3YK/9P3HkfN8ZbU3Yn
         zS1n2QiCe87uEzk+fL2Tyfauk34keNC+3yrapXa66aTvQtXTwhFtuNm38udGJDvEuJhw
         6DhA6ggsnnC/cwAudcDwEl8Pk2sXOm8GYdSabkY3lio8sHJl9Zo9DY89FXfJlaWfR+2H
         XM/Q==
X-Forwarded-Encrypted: i=1; AKwUvByQC636x/XHjVLc9YCtFcNXgJRgizZwF+n2BwQRXArzUhdbvRW8aM9E5rDhsWrngYpIAsNQtUATGb0+9d4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBBpwHXDcf8SyG7KL8L6ZkF/QPRhDYtNL9sL7nPnfn4mXS5/kw
	UrzlLjpKoyBjtC3Lr324JfDY1pX5+w/fgCSNVrnKUSVFP5oo9yN0WZ123gbP5yXUj033iwFz98d
	ICEmH5p/GUmS9mKrr+zZYDoOqYL/ox7Gwnx5XfEjjsNiXR7voB/pErvP/CsaoqPy+5+o=
X-Gm-Gg: AYBFou0hgv1rXMpsZP9mvHZRXrc0Cfe6tljDQdD8fb0VwC+ya76AU4X1r3AhYYzmPK6
	feDlHeFER2yJJqNEA4Pv0s/45Nfl02SjBemggPxkVxi75K8eb7dyvLTfu/RF9qwQqqYRoA4/rZ4
	nQXigAY9xqehI4R71SJaRuamh5XlIKLYyG4gfiqVVePtZf+BuEuwrtiMIGFN5bXHmCPGvrvVSdl
	lpEsxIAYMVQ1jWMW36YGmVd264meYXho6tvEtkmiJWjL6MS1Fsx1i3k3fUep6Yq/C+YtEhmVTt1
	MNg3ZgnNJfRJkuP+Buxzn//V6ZAjRrbsV0GIOkKJ23F0koiCfBNmthchDLCPP4r3xfbePR5PPA2
	LnDxJg6xlABaE9nsGZ40rT5dISW8=
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr994242085a.72.1792396944229;
        Mon, 19 Oct 2026 01:02:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr994239885a.72.1792396943788;
        Mon, 19 Oct 2026 01:02:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm251269315e9.14.2026.10.19.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:02:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kent Gibson <warthog618@gmail.com>, Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is released
Date: Mon, 19 Oct 2026 10:02:19 +0200
Message-ID: <179239693683.5934.5426638278693207577.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXy/KUL6sqBkZ9
 LLUhvGF0Xy19TisJBdRTXmLv+rqXtjI3IURTdWAXvTuwkxB/vMFRL2ZFudFN4HMCNH47ZOtCvDQ
 gt471Z0bv6aB4Z4Rt1Z4AQK7Q72AW+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXxHkmq5EtzYOf
 fhD6IO/xKbSt1LqMTqplTHlcqwa4PukvAm+MAyoMRBlTIJPU1qpGlRwFLAeHuaBon5GqsJ3bbne
 7y893O4DZVqSwnkjShPn1sbkx0dYSA7d3b68rOCHqfZyFrX+4PDQLGpirnJeZgrijqeTF3Pc0BX
 yRGD7QUxpX/sCLhUZAy7HundoUI29CYJSYFd6OPq8UjIiK+baxLDkXUhrN4ChltJcXrnRkr/mW8
 Vq1Wnc1hOKkSO4e9PchRBy+PdglhpMKpuh2+DY0w1V0vw3t+8RSxyFFTvZyArH5GLewXAOtUSEE
 xxEIamjVp6UXfGwrecvk8jGMtJl3a138orfvzl4WC2tSjfmC6IVFwim3uywSz9s2X/1Pk1UXktB
 UyU6zkkeFJzWuGnKTZT6bJnPEMdd42aZkxZD/RPzWHRZ5nbDnWKEEcoL/T/zk+s7NJb8fSG+NUH
 benVknYI21gvOzI4nWw==
X-Proofpoint-ORIG-GUID: aUW9Gydv8nLGCj3BUR0cd9yeYUflyah6
X-Proofpoint-GUID: aUW9Gydv8nLGCj3BUR0cd9yeYUflyah6
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5ce92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oiBmWXjJytMpFWU2:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NdVV1Al409Mjye1PRQwA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Mon, 12 Oct 2026 16:49:45 +0300, Adrian Ambrozewicz wrote:
> gpiod_free_commit() clears the flags that a request sets on a line, but
> not GPIOD_FLAG_EVENT_CLOCK_REALTIME and GPIOD_FLAG_EVENT_CLOCK_HTE,
> which gpio_v2_line_config_flags_to_desc_flags() sets from the uAPI v2
> line config. Once a line requested with
> GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME or
> GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE is released, GPIO_V2_GET_LINEINFO_IOCTL
> and the line info changed events, the "released" one included, keep
> reporting that event clock for the free line:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: clear the event clock flags when a line is released
      https://git.kernel.org/brgl/c/d35f61581ee67f8d4d58c325bac813cea528b6b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA87B5226A6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898628; cv=none; b=DT62+qWrnMeM5A+amCLmOplFe8E2NtGmzuB/o2uEpaB+HhmNHBun6KrtTLp02f/9kO6rVEq1bqwwA7KVdWPTwYs/NqLKGladpES8FCCSw06ZxMXwyYrEMoZqaXHmNkwESgPN2EjS4e8Cs1/brEyjwoU9WqLRdpqUtgiuBOndwDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898628; c=relaxed/simple;
	bh=64WuHEmxdRWNJkYPp5WOn0H21zhMZRGRnFl3heqDVqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtLlggZ6I6uNME6czjmO7DbdFaraR3BUz1QaiGUx0mtKYBWqpUb1ZcLl6m+ZwsfNbJOFRc7TCoUZxXSzO4USsdNYCBzrxpISnwK64UfA+PtIqSGMOq/5uqgV5IbZFVfuRn5TwCBxSocPPVjN8FEUb0y7H+pbNpL1Q8Vk86TPciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7wEF220; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1oRc7CM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7wEF220";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1oRc7CM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HQVb922856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=; b=i7wEF220NTpnp6Xs
	mnFRt/VjEHRo/jlOJTzWNsVZAC/kiglCevbxfT47GrrTMkydr1jCylzXO55IwF9A
	7GUI7b+WWXS707qu7gchZ0foZ37CQdSCdurTKUF8Qqgi0nWt0HsmvWP9xbcGmHz1
	8/Dz9Fm+a3NfcR0YcRLxlqrj4T92u+TDqIXU1tLWSBddUkUTVTBtbJJYfifbiROR
	uWHV+DIzBNRZYibblKRHtMCWZwFwLDLXdeTjJZej3kkZBl7lr2E/S9o6ExF8RsW8
	myHvITXP3aB2/zp/q0EqNe8ZpazIZOGeBk3szjv7tyvypXUIsV21krmuNM1ge+mh
	/SttDQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u6qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:37:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so2489728137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898626; x=1792503426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=G1oRc7CMc0+GnwcxQkw4vbKWBe2soxboIWv01wVyPPgt8GmGB/NLkLZtJ0GdLkYiLD
         eCzq08XVQLkLjbvst4yP+e2rrGVS5e68WpE+8wuUvzDhrfhEl3zjao0Ab5oK20bfeklP
         OM8FfiCdp9oT01loGtVXVgaIF5SZd6XBIanZWvNXLr/ahO9ZvxpRtXCSBIV231BqyRVc
         eWSFBTCAtXc3jj/1uXYUFYggD6DBnVuGNonUNoGrToKEAOhG+UFC9VamU112KTNkob8B
         P9EIQFkUvZeUllfNQWyQ9jgFaXwoA2EP/+8lmY5lIOZbdQUlD/5BvOZbIl2GlG7jDdbX
         lp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898626; x=1792503426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=uOR3mVb6QUxL1Omuz0aHRBChcNItww1+tZDJwMUCXDl6HMnnqfq6RkFYlYybFRGLg9
         /kG9GugXVakF23EgPSRVmoLPncjCmpVzOjU1MqsRqr9CtlV7M/KljbmwP7JyMpMzqg6s
         b8R72oB4pDXgC84AdxKQdTdNdsQqt6RcEOo8WFcNcwpEN9YuzqXOVpGDv6DeC8ZN1Ca/
         Ti2NY2+7Fv+rI48evRdHSnVAgW+M/eYDX1ZaWRHKX2HIlbDVdbwKTNw/u05Hxj+MDMe1
         tRSmo6e3uAUnYzmoHvpammfdjyPeA7JAxcZMbNQI6fh/E+vLhtNHaOSPw7C2NAgOsfEr
         jcyg==
X-Forwarded-Encrypted: i=1; AKwUvBxJs7g4YnOnMzRA62bOki2Hnzx9wyF7HLomtgpoLMVhG6bWgKE/NVrTj53ACbbmi5Myy7MxuxFRjFSk/WQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQJ+aZIJjkIbDdqyBNOYa7IXtIek6n2HK/N0sKF2Tc80jYfTW8
	yKRCFPCveYhHDKPvmfjzhjNIqt5ctenXtHjltBBg/255RQXCTeUfWN6gtrVrsbgAaKkxQhhzn8v
	wp8CmK03yu4r0DsisEgAaG8QGCsOn/f5VdxiiEuCjvG3yyco4gqVf9LGg7QbOopmCpCE=
X-Gm-Gg: AYBFou3N9wXWZGWJOHjK65BCQ1D9UsuwesIbPyUkhxWjHeoXwYT+F2oPMYAgyxuqi43
	xbFnuhejzkBlfdnVXcZw3OnK9R5cuuso+t/RKeqNPgs0UTFlAgsG+iVWem1iFarA4DldkxJYqbL
	pzl7bpKCeMez/nl0cAZ+dXK4i6CvUI4YwfHbFJgwC/FYGN22Y3ChIvY5W9bygY+5haIqOUva+QJ
	TkgYRylGvLbtYdVWtIZNm80gOTagmQDDiquxZexCXWF8Ud3NVrNV84yJGM++JIIH4x7xIxzNnDF
	ERyU3OTwVNmcS8lTshrEtS5//RWlnSnhEoosrT9Tk4wfUSK4JJFI0oF/6MAVkrtKxbQMFHe9xh5
	kjo/skc04u+eG0+NPsrt/9OanSjM=
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019572137.7.1791898625896;
        Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019550137.7.1791898623915;
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm66312755e9.4.2026.10.13.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
        mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Tue, 13 Oct 2026 15:36:59 +0200
Message-ID: <179189861230.27409.6716341566208896281.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace3403 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gkddGGStw1GqfmxTrhIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 4aLjuTyrEVATezvFBm1wJ-BvFxGEegB-
X-Proofpoint-ORIG-GUID: 4aLjuTyrEVATezvFBm1wJ-BvFxGEegB-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXxdtO01nEHUxk
 uXOkb0xYMUtGDBOIDvDMSNo+MaFA2yyoyxv4wG7OM4ywnrsuXZHD4btR8spJBLpqPNCRp1G5SQX
 Q8bkpVzDmJqA/OM4uv5cbcskXbqGRvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXxm9d4+chw7zW
 WJtceW5TixffIKt8kmuuAnJbuh7xFGCdC2sPvCgovQCU/vs96VJzf6XZKvymfJkMqFTmJ8NWsRa
 lvmSaBjBDngST0gtyQzdXR9fbHtKfiIl3Ua+cqaZ99glRMUrnsMj8PkK061dEvWBKroKFRQeD1D
 QMwquF+m2aX9g1HRyqxe2LjZnySZ1HfSGcFQjaSVDq0V0SyiXZlF2EhmXjyzMI99idoOOMOWQOq
 h6ubF1N7d2dE+Hz0WnjgXXSvn+bcQnaYvAF+Mkq3xrIqTCbKW0zBfstV2uTFXNeyR8sbSGt1hAx
 BqBQIgtOkoJXOx3/ysiV0Ssn8WX7Vh41ZoEsRQov+aTJJH2hf6soV47tO2Og46TEbTq5Y+yDC8A
 pqj8+oCOdEy6kFqCP4EoeWA08vjQVYdN7g1GOCoiBT6YXOwHk5A8GNUAd1UUbCLb3TJBt0eFBKl
 Znz8+0BaZJreY6OhyZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130054


On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> No more users.
> 
> 

Applied, thanks!

[1/1] gpio: legacy: Kill gpio_set_value_cansleep()
      https://git.kernel.org/brgl/c/93f4db6fcf0bf62a4e00c9beb571b35e6e3860de

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

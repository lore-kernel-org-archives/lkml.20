Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ED2501293
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682785; cv=none; b=dwntM+50HxBU/O9YaaHr0Dp9b8zdpOaq1TloibtIDearSStdSjhJVSR97ICHtdSp5X9FNYiPP5hS3KRg5KpA0CIxQzrkDK+jC2Nhl+Bq3P0lAEvKADv+wgiLYcSq2Z2HQ4ymQ2UYWM8D2zpSBWOvpyyDKhAzbizLzZNeZ6aMySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682785; c=relaxed/simple;
	bh=Qq4LyVpNA3VxrY74dQ66xruuSGokXlWRSJ3ANyBO3G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp6yWMBeBeqQmtOFoWRCH/5a0F9Bp0Ap+3m5W1sDk19Sn8Ema/v2+Kz7O8lPu5aAdnQAvnAKfQVusIcw8xLfOceVbg6xYwuWaBOsDiWrJJtmvzZd9OYNnnMl3Dj22fi7AFsd2iYit3iXeMvI1RZ+T9ETmxT3vbauc1ppUF9LP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr/eb0uD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnbRiSVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fr/eb0uD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnbRiSVt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj7KT3656200
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=; b=Fr/eb0uDuIOoxz1s
	57noKmRlC7krHWZUNMOqhCDKFgmqSrdsqW7Rt0HX6ilWZSQP+g1IJJSBPVZY4gt0
	RPfS0bjdmCIk78dBXOcDsfX+GVJ4xw1goNCNAs89N3EZqjUX6OztyzwdeN9EiGuU
	ZCBfpJCZUO5nFqy0BvqpQRNDfdOdwkZbLcRH/JYgS5mKMKoAMW42H6+m0fJxl5wP
	4XctCd3mTpEI6p3Wra8mwmi5dwvLlzyXy8L0sOGitjhqWZzMZeBPPtNko1YOxBGR
	1RTN1HGo3yU677qVXaitJ6dCpqSpximPO5VSxMeK5qNw4JXimmsYnmA9RT/Hhbkp
	LIc0+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1g9x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:53:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso40661805ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682782; x=1791287582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=SnbRiSVtmeMpb5qmiiPgIwk5tKlCxkv+Tq1YYvzom5CDJhtdw1N3C3/xqMcRumKD0D
         7xwA/1KnL3CRZsVudXg7j2yuH9du1PFhqSdEj1aTh1JqXE0FLuSx7Yk4knEn3MK4HAxG
         JsPwlovv95Tz4HVYAwotPFPnwU9oAgfsZmzOq05KGTEVtAZuc4YiZxvpGztmhOG614ok
         xB/nKFs9sizjLwYULHxBq44FaeSbp5uQnE5/9oXir4f4jG8J371fW809IWRpqafzuWbY
         WxgW7/uP9NoMu7jPkmhqf9RAJEiaic/5IqzKB1XU6su1RJ0nLUGv6FUUO9GGPyr5XZEK
         P+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682782; x=1791287582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=j1+rw3vIc8e3mtcptjCIjm3VGTDTFnzbR3GAIDZm7oG15Sa8fHO0OUfGHq064BkMAp
         +t8dUz2ZZ7Dnbn2qwEJf76f2wseUJSsgVoe5GMc7/tLfZxgQJV8iAUa50O84fvSE298e
         /0W2nPTbDRZSPWdkZTlTZTODGmxpG54IQaiIbUT5F6QP+ajlbMB96IPGEczE8Hss8EaW
         N5M1jwkC1ECP+W39gGvusJvMcu/X0qQj4EPp0k9Z6M4Al7TOlH/YwzzvBpEGAmmGVY/q
         3mqcMIvxJREqI9yxcidWmUFSu4sQT/Tv0divUElmEEzfC1c011PXuDqpV3DIzbfYYZbU
         09BA==
X-Forwarded-Encrypted: i=1; AKwUvBwuEu2yuFrDXYcUMA7A6vzNDLKve+ncoQ3yTDdAimS61tGEegvuLTP1Iprbavh4Uimca7CTtJPFzMPhjDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsOvIf77JA19EQRIvj/Z9r8U/JxceKsDfYWE5vAX7CBOxre7Al
	uiULvX+R9f+iQhvVhsZF4IFfgtI6u8FyY64iLnjfYmPDmUPhagYNYB0g/zDCsMD1YzzKobBAwM4
	eMiWae4GyGRL2VuHY3R38wh9k4ivulOm2cKDMtIwdQGAnIieqvubpuLoJ7pQPiocoOlo=
X-Gm-Gg: AYBFou002L3ryxEDfj3IspemRBl+KmyTvUWR/usa1Z890tjqJFIb7fADBtZvJ2P+iYj
	7e+nO6B9eDMScMudQeQA2HpnNGvZIg+HBX/9Dg/RbmCxc8ueBQxd9petlkDsTV+KVDtL/kKgYdP
	3YE/n+KA2SlCAPqjt0LRg7GkydpzizKgyYtVOFSctAdu3CXsBU67VLJWBFaShUKz5n0CLlp6Ifp
	w+vRwMFa8u07XqsHvqVdH+LxvAgj1XKAyaVlyqdg/ObPBsW0ma1vIAOOGMH9CLJKkDxWc5W8ZKe
	7LlFMUtqmzFNKUSfD4C8h1dV6tzNs7IHflWLDCZ0BplyqQ/uxbHteL76Fco1oyN7SLVfiU74T2X
	JScemlETSGl9MkBWYA192H9aW3YEP7TeqleLuXPzl2bFD6buP483RyLoU+XKRF9WTz9bIq9rsP+
	93hqPdMOO5AyM091/OTw==
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881805ad.57.1790682782201;
        Tue, 29 Sep 2026 04:53:02 -0700 (PDT)
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881535ad.57.1790682781734;
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9146ed7csm53972585ad.80.2026.09.29.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Message-ID: <4ee090bb-b404-4b0d-a239-5eecd93263c5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:22:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX2vEzzVxH9nM7
 et4axKwBpqSSMuN4zvvmpWq50iG+gpOnTv6uTjZ7Z/zG4IKOWJlyWSP2YLFQPeYxI27v+m2TTY4
 xaFc1CdFPIpK6mGrXKQtmtgQChT8hFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX4ajU4g5cfqht
 thSgxbpCArnWzdMbOFfFZunamBhXceWPyCsaegCpDPAwPY7dJvh4nyrtGQAec6DAUe2dUsBerz0
 F5ZsZqSSOq0BkdE/h75hZWF3lvQlJqmj2oxk+xEPz7q0OqHQMhm052ujSRCZ4LTVsQiksU7Z5k7
 kxKS6XKnW7WKRhNd8D1PiMIFwmTwpHV1AJ73fBxXFIFCz9vz7dqehX4UlsrMe020iBibKhzUAw6
 51RzRZaYXbNPU7raIhXH0R0jrOlTWFWMB4ZoycdeXfOjsIZw9Vgek66SN9Eh4MfibsKeAziRkcX
 b5dGSFwJZvq3gnRNAX9P/qKEffZQkEtyd9oi1jKFVTXTeoeXzSqYXL77cv/hwjiSwjvwf/wZzEF
 EX8ixRc4zhCURQDNLp53fBP6LAP1YVcm3ImWdB+rQohr2uZ9h7L1l05b2y2JPXkL7FRumTgHFHL
 O0a9ogJZxArGjatwxrA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abba69e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4UECf4yVBZO8k2hVk_IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: FEu6Lu46PRfcJDDxSz-br1Y4PmLZiQ2X
X-Proofpoint-GUID: FEu6Lu46PRfcJDDxSz-br1Y4PmLZiQ2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290047

On 9/22/2026 6:27 PM, Bartosz Golaszewski wrote:
> This iteration - in addition to the previous fixes - proposes to split
> the QCE driver into a core part necessary to bind to the QCE DT node and
> enable runtime power management in order to allow to drop the
> interconnect votes, and the crypto part registering the crypto
> algorithms. The core module is then enabled in arm64 defconfig while the
> crypto part stays disabled by default. In addition: the actual
> registration of crypto algos is gated with a module parameter that
> default to false.
> 
> Note that remaining reported bugs will still be fixed in follow-up
> series. This series addresses self-tests and disables the algos by
> default.
> 
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
> 

Tested on Glymur-CRD, the s2r suspend blocking vote from crypto gets
removed during suspend.
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]


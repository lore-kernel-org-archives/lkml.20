Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738645;
	b=xZebZad3ad9/62oSf4JI1EJJqHmtC8GHnstwK+KIYMQSbHPwbQQ6zYk83uRcFfTXtqpg
	 pm3cW6xkEPsFGaRvoLR2Y81HHQSCXWi6jDph+bGeN8/0kCjkWXCJJxhxIsDbc7QuG2CuM
	 c+Ay87KmRrP4nVLOz77rqNyaEucXqn0Aiu4WdZSk46KrF4RML30O104qFY4jqpdK2Zkcm
	 Ibz2OnJVVdv5RI8wfdGSfrNNyiwIfEjxqyx7z48tcz/MfST9l1x7ASviWXYNDvPc8qLsw
	 s+z1ItHksD0GIcNAI9DWSuFG3e3+X4hfkNJJ/daRuhZG9jcPW0qvR2h4FDAI3k6mXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
	b=EjFyK8OSQCbzFxku0Y4Y+dzFhsfgvkr9szhygPpgMSDeP5Q0Y7zTV8rDkvglN4ZmwUq5
	 37z+VVXPOHHlevK1x8HXDcxI4DJYSA/6mMRbWY1AJXyYbnVJxVXZ3y7yz/Ij5zPw51r9r
	 TLG3Rt0Gm8YiLpv/fGJ/FdHfzdioev9gN/VlrIiKEcg4uzBhkjZ3Wwpt30DeqrxX44lt9
	 mTrDMwXP2QZYyNZ6UortI6wGPDKFgoE6m0Na1pS8AdBSxqjmnz1IyR8FNfHdJh+ZEpdD3
	 0jEThvMxoQZOp4z+CmFjH2WjR96eOtufJY3SOqTXtXpTpOjrdmwD2HXoFk1XKmYbdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA96606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA96606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F87w425685
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DcoXlWRKjuA3ss6Tbgxr6QeV
	j4UArC2GCkRmhAMcuic=; b=cFfEZkKzP1uu2iyYQz7OI9qk4OXKzTsnaPoHyKaD
	JP1XeIGyQlTOtvR+y9SP+eL1MRCnTFUcTi9/gFVo0/mnlIhCuRHmC0aNod/Tk3LF
	YpvsVF3lD5MZUKL7pNMmlyAv0j5Dle3n1PyKGSsJ7BjcjcWoaII/dQuFJC9sO0tD
	GbAyeJdvrpHVMK/slqbhA5ng0ope0skxgIHXH9hpogKheQLEw1C8QWi5N4sofmV+
	BC5CahCfZs304bu9gFujPQ9176ooSoC7dC2CzycMLoYe4GYbnA9/t+ppfg2zkf60
	FNqSzJockmnr7VyZkdy8gAby+MBs/pwyGkI9RYL+6Z0fQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2atn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so152972a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738643; x=1793343443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=QgkzFYYhwUKV9b3HK59LHPnqqSaqEOzQ+Za2Ptea5nVHdp24b1JThnSv8PgxAh36en
         Kwa+rdlQNsRCYRl9oMPaQmJ1KFnQFYaSXCO13ZZbRTTCJ0vP6E0flWsNj4HLpAe5NRW3
         1OX7SrlhQChuHXPfvWj0UksZun7dleP4D+LEAF9PE8N6gOqo6acuTUEUKpNBiMawNVQ/
         MGqVVs/8mk2WAr233b10JQSBvAHYiouZVmFbnbzcGeRI33YaynK+zuK7T4NNpCyKI0lG
         YLd4R9UX1JeNnMaTX4xu4bGr2UiSpx/51aWFGjWcWGSJj9ps9zgnOjGty5kjn4ZDNVJ6
         m4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738643; x=1793343443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=KHZosbHMvZ5LjClYTsny0yAFrl8Hj/tflOd2nla4NYMKHQLNuLECCpA7NUtyVNdeZz
         uyWwZ0nh4oVCvLeDifUm86ge7Q+G8A7t7if2TY2hdmTj6ohYxOpqsw8CQ+9ZQg/7fhK4
         Y95Y4TfQmo8dbsLvZ76F40+5hRaIs7uq9XmImhtshtJCWGpy3MkHApbtTQ+J7bCxP1OG
         brE6+jeqwX/r0KO5a24oXCLZpKelk7+v+mUzq9xJRyLaXqFxOtXkHhBGB+NHP33Hmkog
         zv9jXh3jO9xDhbQyzOXwCVijGQ03yU5zOV753My9zqs2GnMeMQRgluZcxuztfAmj4QPt
         I/7w==
X-Forwarded-Encrypted: i=1; AKwUvBwtawCmekKjuchkJyN3j8tXAX4l5NceTqkVXzL86bqS99d6HxzHlMlYr3A+baYKWO/JNKL5InI3bdBW4zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRAe0WE5PKFiueHp+/XG0FMcnhSskZ68v7nuxRO0l0me5sGKoM
	S78sQJPYin3mboivI3AKWHvwd8eCj22IF9hX4mfTdJh0ApS92j8G1BHCgaloWHDWySDTdofqsi1
	6GSPNFlhgLi1enBI2As4CVVLzWFHaDdv98gNr62i2Wd2TGpkCGxwY04eJK3WhNr21ZIU=
X-Gm-Gg: AYBFou2oOpHL6NBm62hz4y3Y2eORau2o0hf1qsSVC5Vv4sibpz4lPJApMi6nP03y/nn
	p//dBWIbZoyAcEKMUMNFDySzhB+ZWF1SoLrmFtChiHWilj36Qk6j/Y4h4Jx15kYFKq+J6e6fBpN
	UF5zMxV8uMAEDIHqwP9RGDfocZvdTVZbo5+rx1HgSxIXkZOTi2rLsgbxsR9gkRleHN0SkkfMSK6
	hXrfnVZSTcvzmGS9ZtxH88Ya+jhQAV51eqVI6ExPgzgyr14gsEF5YjmC8w2nTtjoiO2y12m2b95
	138ASzWgm8ElKfuCmVsoERRe1Dpz0XDMu7N0I3v36PD3IWP5QpWPMztHhOx56AfgYa4k+CBYF/0
	lusNDZxwVASgwKTOjYhO9WFsUogcQhr5DbhvyKyt9L8CCmbDZJXASldCLbuInFcgkzsfGvsgvoK
	R1mKRmkSgDkKgFET+WktfFaBm/y5BfRPYEt9pVZ2Zi8/FUGwtU70c=
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847185a91.4.1792738643188;
        Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847153a91.4.1792738642568;
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2994cd2sm650567a91.3.2026.10.22.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and
 touch GPIO drivers
Message-ID: <atsFS4y9cnfKL2uk@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
 <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXyyIEcULI5Co3
 GyfmdEnnOKyZ1TJMLI+vXUfPln3vIVBEiYA5wuwo2z48Y8K4wNsZHJ9beGq6qAQ/j9uBpRQ9wH0
 ETFjJZipwxY0ByHeVW7eOaS1Rei/yHDQQSQAkkRJPaI7iXLAJZqZnsyMTxeM7J5ioFyuhGhWCS2
 /E9JHqFp11m6PTXgpPYZ21/Doj5YEeHy1lgsQl65sT8IjXFWbEmOvY47hUjRkzqbT4wiIvonIPv
 KF5d4vMUSC8pAM44a7IDI6DRGjWFaxyRfYV3Bf0wTulZbZvdTS+y0W4Gvc1gi/J3ECI4tRHXiYc
 no7nQYgKbrJ7dccciCHwnf7e5n2jLSqQEr4kduJJnwlC2XrTwextqdZ4YgjgCFmVuO2WvVT2kni
 fYMa57lnWPi6AQPfJ+sowMNXvuevYbppflC17i7oa/ACAzOehZaEmCju21XC8MGD3WQSmDheqv9
 qPtHocwV97C2vKS3qSQ==
X-Proofpoint-GUID: L_F2BuNbECvEu35psIYRTJDGVL1jh4kM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX58X9hCTSOOIg
 mUPtRxEhvce50oJVHlxJiaHREkZaoAcC5qwuwaxu3e+3Xoz6D7JiComSqKIi9uGDALYwCfDMH9x
 A9kdo9qVsQgtyi/K88oYTsmHyFVbZE4=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb0554 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=phjb7eYm-OhZhg8tdxIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: L_F2BuNbECvEu35psIYRTJDGVL1jh4kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:04PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the Waveshare DSI touch GPIO/backlight controller driver and the
> > Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
> > inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
> > EVK, Talos Lyra EVK boards.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> That's not a separate commit from other defconfig change.
These defconfigs are required for Waveshare panel, defconfigs in other commit are for RPI panel.
 
> Best regards,
> Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176382;
	b=yJn3pK39+FnPnDTewmDxbdzUVXsLaYaBo8lhrtrGI+WgmBZ3geu2H6kE3adlWnOaveEM
	 BJ1kUYkNcq6cwkmWv2vtrPCSc098CoyrgL9LbxpOVLDXG6Dnl2i/bLvkPHbNi49vj4HL+
	 FzGZ88fnf1V7cfhV6Bj0YqxpSCrvGhxvyQKIBfPic7TvrStIobsFF+6915FA3r1M8nI0t
	 n1iRuKtNPCysOtLpaF/7vk7K1GHvIdAKScIWyG9bUFm8QF4zwaQx4blLoXbXVb3E4BDRF
	 pDzHHcln9rFFYBjPVb1SBy6Hi54NY7UIVkKaNW/vlRzU3ZnVAkE73MfanC3iQVlg0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
	b=XAzcR2mct3juV3vXLNNSUNhC3r73sFAG/sywAHfCEstsD0vn8T0Oyk5So8uxuJYzA9Rh
	 o/9RpX6YZpF4nOVqV43gg02Hc+V+Eku89hqGgrvThpfqLlp56OLZ7oG6vp126rLBBmDH2
	 oe66IlgzIpTDiUrjZi+VvMJaz8cRnTtiikRudE3qDqNwHRAifmcAC0V37ehU1q7vQWNsX
	 phVak5oc09E6ZctS8DprfkagO2rZOpdNv0WDQi5zaOQ4j4flv1S6xSK7b8aFkYS8suZVD
	 HIILIRLRM7lomtHtVdzMIuO2NnLShHv1Wtk0uqnOnU9XaoZJ/T0yyHlBisbTrmYTuww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RmXN/UH9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pa1huM/T";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0521606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0521606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RmXN/UH9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pa1huM/T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KAlU1642956
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=; b=RmXN/UH9tAHAatHx
	tO9msi+c3wcCJMlbU09wKFIe8OCUsMhjnDOsS20mxFGGdZNLfUcFvCzq6KFzXAly
	5EvACi3kt7JILHBQge+1JoXlCti6IghG8dSCDbZJ0YeqxJ/56N37fKKg72zOHiXN
	7JvwXZjcvuCAosDDwcNGT/hu20qvuE+7Pujv/f7Y4n+VEhR5za8kNF5mAjjr//PO
	rVp4pRN53v6FqUMdQHuNPAYCAhpUYlkUoh5v+XlRmzDPkUhJvCSk/fo1qYHJCDNW
	AtxQEH4+uVCeh5fxdzvWJ6sqpFf8fvdGxfjfU0nkGvc3WzUgC+oQgTVzFhJZqTOC
	iKiCFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpu41b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so75021085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176380; x=1793781180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
        b=Pa1huM/TF70Tyd2ozmBuDm2EfW8YNGh7fC/mPJL5YYyP1vOXxHvsDkUKpCN8kBJwfY
         UblFHbKiopu5LGCOOK2cZocAXtgAwPLzAMePTiyyGLFTJh6gDDWsLR+Pg75RwoTha+sL
         2DaH8NICHSlO0QfIUTKoGHPMQjLh8wUe4kXEwg2tcpYakIQEw/XNwTtHMVNi+tDV4VW4
         /66HZ5SjSa4kqCroxiBLOUADpuG/YoL0PgvB5cdyD0y9X0Cs/IJjzU9pEVLlCArgkbqZ
         eYpyaYUIWzF7KyfStBvvJhmUU+9E30mM2RzxDJzwK37eR+5GpJWDW2TABSgtSFoiBbsc
         GDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176380; x=1793781180;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
        b=jLAfWwoFjwWCCzY7e/52xanv4ycJ1IAsLlrzPg3oL7aKvSynGEjndt3O2lEseJm9qO
         llh1u5EaIAgxVMOgRKhb9OXHtgR4uHoF8ifBWaRZJQBPzCfkvFl2nqvBV2U1Y+t5bh3G
         V/wvCAesnNmm2gS/mDu8MP54SfzMwCRpIEczEHM54CjOGumtGbXjC9J0q+3zZ4xwYMSa
         AAJLW/DddpZ6s6U0k+xvcaN3St0cAM60tvvW60bJJA2GFGgdAY0jDzleFhwRpNycQBB4
         MQSdTafIUUp3LezfJFhxMdV6DxD8ZWpCUYhQoejDnSeJ4dGWwj5rqm5gjOZjQOzL40Gj
         /HCA==
X-Forwarded-Encrypted: i=1; AKwUvBy793BmosodTDs3C2TP3zTyjbo9aWSt4hdyojbxhQv6/keysrZvoWZMRIKwLhkYw8v+l6zbpPLazpJMB/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQvqHgyqW0jlMd3Yl8ZLlwxdDWwe5Iou74/oc/BSbA35Gug6DS
	zdTgIls5PPTwFpNbSIhHcVqC9mkgKv7RxT6kz8W3k839hH0OcdSvShVXIgIRt0W5xRyAarsT+tB
	G74EhQ9/MANFi9rIsBPfMaTBMdzwuxO3YbIknTbpWkSbsJQ/KVwSAxQIRj7vVLYvNSfkvtK4eCy
	0=
X-Gm-Gg: AYBFou34ENcCphyA8u56jKo6WAiNlSZsQkZePyOP9WCzTsKfJskh9jecat4czaFRXRr
	EDiEns3cU7CPpCQ7ugRDZ8SQmHgbiPO/YFn7cqczN1Quhp1OQxLSyQ0jJLf7kg1artOtkaQ01R1
	VQ3vw0HpikW9XdvUBkVMnOwzY2+Pd30K0H9/ikBw8RJATfOfLjXv2r8FacscI6kIsZ28+FHrZOU
	xTPbWgKD6Ojn1vzmYL8NacKYhJPTcgM6Jm9OHFOkrpbYOd1JvhuKL3bqcdkpmfEAkXuZAvRFLHU
	KKapI3Zc6euFwjx7OGRaCVwTs6NGihTPUD/7DKIkc/I/muP0CZlzTxqy7ex3T9dfdsAjHFf5bEc
	TvSrgBEvuSM05rPGHSXYUPcdQ7z3PDP+FzIByfzDvM9K535K8TcAi+hbdQUVuPSx8/vQGnOZGpF
	WM
X-Received: by 2002:a05:620a:4147:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-94408cde155mr208297585a.51.1793176380032;
        Wed, 28 Oct 2026 01:33:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-94408cde155mr208294385a.51.1793176379505;
        Wed, 28 Oct 2026 01:32:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:32:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Date: Wed, 28 Oct 2026 09:32:53 +0100
Message-ID: <179317637229.6922.2864720743065087678.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX0ZSGYutgAiTv
 t5BWHrfjILLdOLgLINMGyvGuN5tkZWoI8wPRy0WGBLPE8k/kcSr6gCZzQbkg+38MyZUPFv4Bsx4
 vCW9d6RgqhUh7I9XziqxJ2bTFUBPZibDvC7Sv55WlUYH4yuBkK2n0g/ra9mHMB+4eSu64sMUtT0
 WADlWRwNP6iDtCygmc0pcXuRXD8Ivsjp78ly5rIwDio/LB/UfOkaG/sDZfzwuD5ssAQxV4Pz5jt
 lPenJH8aJt+0qAzgtjxsCY5a+/MlLB/RyO+aaD3CmVgVB231po/AEbtXmPJ6jqu1T3m/EuM74aK
 YbSl6bfk8GQ8bpYLc7dzCJgQq4Bj2cyx2uXDB1/cG1rz0NzuJPsbcjourDwxBMc6vh76vxX28uN
 7CxWhfb97QI9B7JkXn8ZBTbckqCTWtV7NvyT+QBod8ERNGgtkYY3sXXRLFM/4ZCEcRN1MnQ9SYK
 GnUjysI0+v/kPA8guLA==
X-Proofpoint-ORIG-GUID: GLUKt1yRbHJrZ16iQzBzOT3ddND8jBZs
X-Proofpoint-GUID: GLUKt1yRbHJrZ16iQzBzOT3ddND8jBZs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX0o64iCGUr0uz
 xD80Jmmi5jrS/OoTcNdROJ3K1ewrQ9m8mCXttB6R5+Dc+RjuWhkrURh+4aZPfb8GfRrLk685cha
 vKsw45JchrnJknNruWLrAiTxVPq1rNM=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1b33d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wRwPfHjqSs-fDICwijwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 14:31:41 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/59abcfeb59426e7575e80be53b7024a151def2b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

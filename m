Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400087;
	b=iIAWxhY/Vhr3ry3sTLBCuIoqJ/05N/9RG+zUYMrZhJ/VKNkku0UXs7CGV1d9MYNytWgl
	 sf4jxuvVquU7+qoW1L+Ue415Np54O+OVZirc22bd01iM/lxylItfos0SNMR8Mf7j6dnAM
	 pMGBlUKKMqytObzhUYGD3seAjm3vgtL/IN18dkomoWtM+1sTmAsORc+vGx8Ts2/p1Ind+
	 A6WkbqXcxU0oqT6q/QROggZwCi49bQ9kRPefndrqLNavaD2a0SNrgG+JpAo7kBQSm4QUo
	 fkUhEvj3qvJFgJlca8BgQQjZudiZPkzM+13fCieHfb4ONOB8GGYVHM1NJBGL8otCCIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fl7ddgUUfyFcUOWgCrUPWCqwQYDJhSCBFACJjcSWhdk=;
	b=4h3kiGiFrVJCHxfqm/6ZU5EITvr+gGXWXJpTQhyt4EY34T/kLj+JhASikEItgk0Zzc/Z
	 mKfq4QOdEuW+gnveagSDrZtv6hZweLkL7UWDz764CZrJJtUSd2Md/fIRn1Seio3TSCF87
	 7zMAzMFRPuNsd0Ld4X5kftVHOWxGXG4ZYjQXWkqW9/TUBv5EYe1392bE3waJSC1XcYfBX
	 tpWGuPvBUdUEh4mYu8KXaGFF8ceppJzvbhTA93EU0rXEgw2UUR66Bx7xS8WMiqpA7hofl
	 vLOvy7OS+YtIwrG8cfiC0M6lFK6MtY7mZMS2dXKXFXbI7KGQY452HI24oFgmn/kTZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvnc3Xho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaKRSEue;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896460A2607
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4896460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvnc3Xho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaKRSEue
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULuBra4188027
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl7ddgUUfyFcUOWgCrUPWCqwQYDJhSCBFACJjcSWhdk=; b=lvnc3XhoqH9ZnBJg
	QYd+pKAXSa01anmX0lclKrCW+PD1UGRJ08m+sLd4jyRm0rmzfWZagAeokcL9y23k
	Yh6nvKbBbq1kH2gxyX7117FZINqzsmqXa7rMUtOr6G40npA4fpv/DApVIKPQycVh
	Le02so6Je1zmrMoZkevDaaJx91NSLENg2bZTROTslO8yPC1vz1L8qJ1SDD4n5lIe
	jxRP1DdLylofbd5R3kDGXKo3RigHhE5vMKBA0AVM0PMGqSEdbnawbMj0W60uvitW
	3AlgguaYrkkcycuqMSl982rAb7cG5wcrZOf+cVbnkYbqpXFagwlEPx7anWLucGZl
	Hl4inw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x109vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so1756348eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400085; x=1794004885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl7ddgUUfyFcUOWgCrUPWCqwQYDJhSCBFACJjcSWhdk=;
        b=GaKRSEuevvLzV7BYKOLxjhFxvnmNjs39BCOUs3Me09hNNf/LhTR66KBegofVTMSr85
         RKCuUMGkDU0EQZT10qd/Mc47fSHILcIo9nt0S9LCTTT8jAGrSzK/jX2ZI9uiuts2dCzs
         AqP4PWlBNp7EYuSfn1t2y2VoleALs8zVzXcI7UnUqy9CGny5vG8bat4+lU+tZzALNEhl
         5VMYiKDHTMufGrYpDfxT6rKUyHbxlgLi7Ukmxm/nI56CZrKj/WpR9Wq4nrw92fx91L8U
         Nd5ZsMfTEtfW8emg7ZptWSdG/BBOOrNIuDSCwhIKGunY2Cl0PdKFZf5ERGlnb/3HHReO
         jk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400085; x=1794004885;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl7ddgUUfyFcUOWgCrUPWCqwQYDJhSCBFACJjcSWhdk=;
        b=iyEw1aBQHbBbMd363qROLci/1uiqPlImfEprSbHZLqufCdlQpzd/HBjDpu4i7sYW9U
         iUB0IlwxiEH7WXuP95F4Mi1bu6Fbrxj9MfWA12Z/IxILyT75Lk2PUgjfDEx/ZYQBqflx
         YFL+I01QjxqW0h2UAhOXcXIBKkqIYyYY8Ay7p/4PjiLKvHJSmHbeG7kjxmezEBj/9zHh
         FvSewFC+3iPmU9F3aapdAdrheUi5b6KoGSf3GAyDb+eptf2mG38jRtQljcUG2SCjq/96
         G7Llnh22RcFEziFFrhtXCaWRFEhEh0qjtaYuZ51zvfkFDsi338MpQlp2DsqrbMXgb6yx
         4lCw==
X-Gm-Message-State: AFq9FYJmY56S0/1a5LzR4GRSAtFmSCaXVsQo9v5yWl6HcBUnxf2t8+yy
	7+oSxTwlkO3GWRbZcL5AwXC5qj/cStm12Ssm0RIRam6yoS2mqeRQilVDCrz/gVss57FINKyI/rw
	AcDyqY+Wz/Pdqn/xAjV746obTSfSSiPyarf1N4pJeWlhbKCGoNTWWVUdnhGqfJSczOXwUurXPBw
	0=
X-Gm-Gg: AYBFou1QRg1CVqIypip5xrR4XSy88aq4nOlzVLvLoe2IUbiSdlsLD1nKK8SMmSC3lxV
	DCD5f6ycHt0xBH+fZ+skxS+Obqsk6mUdIqSbzR5zr0z9vAfv6A+Sfiuhge92dR+wYQOc2//AB+n
	kXFH3m+kXEYmmrw1YzXIGgscKZfXUFitmVPLCniFtzCClIPdaayPeYAOZRSmXDtL3qyvuwdG0b6
	zOOJscn90vUWRCgc7Vy9XZSe9VmV/+SUt7lhOyhpwX2fOw4ilWUE1+F0JZwU5vIVxMsYHFsGReE
	07agv/mUsA0bVS96Gs3XCa5UKkt/2NgYdcsm7Djp63/XqhRytrfa3BNMCp6+hWmIH5eqUkPYcpw
	kyTiAZgjSN38EQ+Pn0YMq73VWP8F7d2aCsUSOBa8GeR9DSM3KcMyyT5OcIzRPJD5yhsAx8J3YRW
	4+RlfSbclaf84XdxuBeJjJA+xW12I=
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr5138202eec.11.1793400085120;
        Fri, 30 Oct 2026 15:41:25 -0700 (PDT)
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr5138165eec.11.1793400084405;
        Fri, 30 Oct 2026 15:41:24 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261024053923.3585009-1-rosenp@gmail.com>
References: <20261024053923.3585009-1-rosenp@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ar5523: don't select ATH_COMMON
Message-Id: <179340008275.1790611.11842450357073169068.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:22 -0700
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: LDEdAViB86S5011ZkCVyE35BTVy2Af23
X-Proofpoint-ORIG-GUID: LDEdAViB86S5011ZkCVyE35BTVy2Af23
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX1dShUoeswfvx
 Ycg1GSTNltjo35RPq1ubhOAlRkS1Gd3tAOV9ah/RiH1U/A2h/ji8X43Kj+/QQmaImiVV83FvW/0
 hOfVB6uSDIiCMRcga7uctAz+yU1mzr0=
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae51d16 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zlQJhSe8P0IDTZ8m2KIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX/lFI6VYF+HZ4
 zQ7mA/Hh/cZPW27epzun0bSkZ8RUK6ER0oiSnGISwvbzJ1ZM3gbYK9PExoTceOd7W9m3ric5++F
 fO9rd0jRbThx0Apc4zJBg/38cCQplOSSAdbB4QGBRSyuEyhXEcQ9x0a3R7Rv5LGEERH8a2l8ZPt
 VyUCe4JfKDzn56m4JDYlKhKmTSWrT0zCX6eu3tiPtw6k0Up8PuEHeV4xjzk+5Lb7DHI0yPA4L1K
 eUWGhZB6/OE+AW4dLItXntd27ETgBMmNaOTZpdMfi8nXM5LvfKIoPsumOi4o0mQoxWJm4EtrMiG
 GFklkLvqamG9id198oVMziuGzQfF2UUdk0v+FbQLY00kkoLlRfM0gSSNJ9UResy0T1jAKpZmvKn
 PeEsc2Jb3QAYJvq6QjE5kh4/asVoU0GNB4ldnnb68EhR4esjpNv58gB/yGk+TzRssvIwz44D7RB
 NsZ4CGjBWOJAxO+opuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300090


On Fri, 23 Oct 2026 22:39:23 -0700, Rosen Penev wrote:
> ar5523 does not use anything from ath.ko, the module does not depend
> on it. Selecting ATH_COMMON only builds ath.ko for nothing when no
> other Atheros driver is enabled, so drop it.

Applied, thanks!

[1/1] wifi: ar5523: don't select ATH_COMMON
      commit: a3ddbb45768717b5c9f923489387cf55c838d1ad

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


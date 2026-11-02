Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=LEOiiXEKxgRkD2H7jm6K46JkUkY4VB07CVBHr3nAJdDBHqH/V9aaEm+FBLA3b058tGos
	 6A8OmJT1nWGlCLEwXqUiCaQ9B6sh7nALz23zvLABakqMHpS+3bHCXZcu45AhuoXagW47a
	 G99YiFiYZEp1417/kCBXjdbFVUl0wk2RN75wWeWA8ChWQAs159Dp5805TurWyQ6l+3hJd
	 rUCKDhAn0Qmq0VLXfMsyqpNdZ3h/pF8YWWC4lP40955PApRf7YhUcvg64HuW8SUjSuHbw
	 21isKgvq4NPNFoQ6u76n9vdkPuwQfOhNhkKUSjUrV7tI8DXxklFKfCnlmPKrcP8iJew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
	b=hfbxmw4vpB0BATtw0eQNXCRaoltuvlhcTBp8Cq62sdpII+cDwEFrvzBrtAPlsaZyNNvI
	 V952zPid8XlBgxwuPgWPjvZHGTej8Xd6MlzmR+HdvixmrEEtW5wRhmbpAhYsf84GK8RAY
	 HMSz3pMmHl0fjdRNNznCnlT2htd+wgjXhufl1JvnhrShTJgn9XMNyIU2eqzVpMpcaEzfJ
	 flytTizLIR0UAWaCC2WcY3ILrlse1jkFjOMnYcTyKqaT+tjrMyFxLAazvGCefru5kSACz
	 x+k4qWQObg6ocRtDKg74g9qFDd0CkkZx+pftgkJyzvv4huSppKS86OM/BrwYjodEJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GM5u7uVC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gnTZICHt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC88606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC88606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GM5u7uVC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gnTZICHt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2ItXJn210753
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nft
	AenQ++hk=; b=GM5u7uVCwYXNE+NH0yxrLu6LAfSBQylgvZLBgSN1Byt3D2gkflL
	J2J9FJik0nRbwirrMRA/uBpLy/X8RtQ/iqnagYpZi882K1apvtqhtMEQYT0VEqLI
	dDnJGHod6IQmlH+iB/AfLC61lgpti5jXFFYeQ1WBhPQGuMl67PrN3bnsbep2hea/
	dEqzZ2vMAM5qwcYAnY+/irAMzxoVu30mU6jPsvZdJl8XN2gDANColHYkmTZl+6So
	cnWDzKlligIUbRbwE1b1oqH2CmtnBbiuXlI2oo89DOdy3BZEuD5rLAjBAhff0OFZ
	50I5LB1U7NZ0HjGScdgvJYEhUgeJYzgwY8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r00un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so2841785a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646014; x=1794250814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
        b=gnTZICHth5vAmAa1FPSrB2uihkq6a78pv5SukDN9X3fyC670tKLa50QNIga793N7EH
         ZQ1+yNxHfjrSErli0JlFPFkOqKj/bxXVjFk3/LshL0o0pGEnWUQpRb9w2HBx8fUPaM2a
         xVByQoVaifoFgJBTKtUsH7o23zadxgJAv462kjZPmY2WKlw45Iun0TDRhB1InMt6YPSb
         pTz4B1EQ69gQhH7EBMfI+4IvpNymFOC53let5gPkAUfKUrWXp3R4ZaKXRkBVJIPdpxVI
         Whcq95/4r9oihnowaYRPrcQjeR/h8OQQoMCf0OLKZRC9UfGrivXjVBC2EzNm4GbFqUg0
         RW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646014; x=1794250814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
        b=qiY552zXPgTfhqfz3j1nryDg7UEt7l2WzZJhP9iwo9F6of2M29eDdA9ca8aNA+2xnv
         1s3Mqkj7GrwI6mlU/hrAcPSThe51YkQZ0zUitbgiW/H2W4esEBXR2cR/D5ii9uGZJyTT
         UvDn/eESC0qO+YbHuMMyr4d20KJHiY//QzN+wUrAIuz05pYN2jH6Y1SfiK/TuKmiwEd5
         QylVp/Q5VDsdknXcKT37tYxhtIlw0oI0dZ5xo42i6/AuezDP9VHRamnqyMSCa465UMKQ
         wn+vuAbsXUsw/ZnJ0HyZNAlZg3g495gBzw3J3/4uezw3MWXfmOcXAHtfz2bX86k4g8CQ
         TVpg==
X-Forwarded-Encrypted: i=1; AKwUvBxIIRBEnhKWNEN1mHSEz9IUGo+4L/FuQqsvm1zuVHE7McIzhSC5S5YdQ/g9JxEENeheT/WsmnBBbMaL6qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z95nNTPQ/rsz+8Cw2+JjwixjFb0WPaGhmhV5qgRylIzw1p1T7rF
	3fZn5Jnk3GXRMgbSoSDeiNKPFy5uZSw18rzVYgokwrJMzhl7oM67NHrNLuOnqD7fDb2lRw5H1NR
	VgD6J8WF/BiFSoTEpG6NOpA/TOxJsobqXzzocLr1+x1VFgMw/GOZVYxOBcpP4t5Z4gvw=
X-Gm-Gg: AYBFou23pdcO9DlsVEp5xdS33We9W70P1Qh87o+8HfWLED/4kuP948q63j8Xk5CMY/i
	HiJI5sxWNvh5jH8hFzyU2dhbTwqUKKdvMy+IboxmjvV9BvBz+m6X8fa8da0IvfoSq8sm1yPxhNX
	w5JIZjakez60EFEQGT80MEFdwXX2ZoACbiRnNMNvSdj86edcgl6CJl77/EP5Luj90fcjAucaC5t
	kWsD/f0XgIg/icevymRQhgQxfLKv26Qg8knpQD2vPSD590EcidYiJ53cQj2xpa4YlDEk3X/C0yR
	hMGaELNFP2+8JpASHQmeYl05LmGPeLe93/ntYv1GPgk+C0vGZ491ZZm4Gq/a/URPqQhy5j/jl5y
	R6oqu6CmlNht/szka1RBq7f/dOnHxwMdgHY1024zQtrMrhwNNgotEfwFSErWdRzRcP+WEkuSWmu
	JPDNE2tLMQRBkbhT/4ZV4/ZA==
X-Received: by 2002:a17:90b:3f8b:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ae89715664mr8609646a91.17.1793646013787;
        Mon, 02 Nov 2026 11:00:13 -0800 (PST)
X-Received: by 2002:a17:90b:3f8b:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ae89715664mr8609625a91.17.1793646013247;
        Mon, 02 Nov 2026 11:00:13 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5844acsm462228a91.4.2026.11.02.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:12 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Mon,  2 Nov 2026 11:00:03 -0800
Message-ID: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xLfKxg-xSOAGS1ydRpBKEio3hD1C0QRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX7hDqNP5PBkV3
 tw3zeY9Mnpy93HVT7tx9+gECGgdqZ6hQlh6XjYgBDJm+XiLItLDJWtYIjJT+QPv7u0qHB2ndoEB
 wux+EWlqwC8+crjoqxMoy/3JdFZrIm9gO76zi/tw2hdhCIeyWVRau3YNGQCH2a2uz/xm+vvD/gw
 mKuwxccvmzKQDLYuADU99+TM/MyRxPPGMmd+nrQnDbjkpSCKaTD0AstMz1Uo9rsByP7OGUeWnEb
 OL1coFcA7HG7ZyOMLMSSpxsS1jki3pWkUlPg7f2kqzxeED692/AOsZk6xtA1RMT9c7ZstxzZsQx
 9TAGrngh2JWWvqlpZlDyK+WDur+BcJ0lF1Y12oG3JKCbwgkQ1aiO20ynYYitkHnPEJNrnfdjwum
 diDfpTI2I800F9H9Qwa7S37wSAxnqwviRpSjwJ0Z+/NqdS6GdCLpU/iQumrZGbtxMG0AZB1SkbS
 ZFdRHUaP4/94qcTEuNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX8nT+g1W01tOD
 kVLXXtyFk6Kt++uADPMGFBwzlaxmVfBv3YTE4yEpXPprkFxNJ0ak+Eixyl8niveor0zHzfNwTGS
 SyiNpWA17r7czh6Hqr/bnMZlTHpo+cY=
X-Proofpoint-GUID: xLfKxg-xSOAGS1ydRpBKEio3hD1C0QRY
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae8ddbe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WAnUiRRfp7J0bigzDMEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 32 +++++++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  6 +----
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 +++++++++++---------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
 9 files changed, 72 insertions(+), 60 deletions(-)

-- 
2.56.0


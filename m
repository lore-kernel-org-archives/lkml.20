Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609A49BD83
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553781; cv=none; b=qkGmJuZklS3cLkjAz2GucyTQYl2Y1H0Z88430KUQeyZNixn5vT66zp6PQNkUG/Kd9WkHl6jbfOspkxGhLFt5GhBcsvIN/lOIbdRoRswARifJ5BGyFCVZso/z6J2yuaIuFEL+nggFLd0f0ZNa0nuYr8nTxaH6x6VfjOo2fsybCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553781; c=relaxed/simple;
	bh=QrRFpsVnRAEyLk25Y4VGMdUOQlJ45UkMXhBUxRWWrnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAoiE8OK/VaY+fM3TXi975zV3U/dleJwRnup98KaWsSZCzP744Fc0KiSIb5MJSuuy+jthoe1a2BnKeMpmYWxOqjYRGExTunGgpYM3ntx2zQsecwZyWlEJwZNFKs93sGpCGgsy4nX6ULf5CRJisQL3Z3abwbVXlMzfhVO7jVq2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQrGSZIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgVwT/Uj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQrGSZIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgVwT/Uj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK0cW1907357
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YxvPGKyNsWBvKdzUe72SpCUeaMvMNqz45LO
	5vcpm6OM=; b=AQrGSZIY8fgj1YLMFt+mSyQWJOJtjLQ4L4SYpU0qY2gb4UAbkHY
	XgLc6WsH5un/s5Y1vd6UcabQMVXpqpF9IC35UdNGCOcVpbprVu667yTZ5Za9i+x/
	ZHdM0GEzTjOYaONVhA4G9IWNsQOqr5hlGDx+n4awbUBWUrUnVPJxxUSV/7Pjxftw
	QryaRc6aPkBJuLlgMMfcSQGh6fwPFx8KF2w7YC9S17aZ+0ilB6TY46OVU9puFYWI
	TJxZSGne84IEfJLtn1m/wnagjRw44ulWmsekNR8FkE65dSdadkj34nxpMgVUls7u
	Dnybk8bRTUf1GrqkkGiGyCDRK3ya8zw5Bww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7gexw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:49:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbacbb996so1050999685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553779; x=1792158579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxvPGKyNsWBvKdzUe72SpCUeaMvMNqz45LO5vcpm6OM=;
        b=cgVwT/Ujd0fKV6jJPPfmU0Xg5fWyAAnvqh/DBUwYmpugfj0as222XkkimONpzpPzRI
         n30oXWdh6CLcALS9us8/RTZ6qLizxkYKTKHPcGE6loFs5g85Xu7FQs+HVOVk4kWrtYgK
         Egrrz0+/p1UI1qMlin1YJy7pS5XHnToOnS2MreJY6GS985KOG7wvhKmTx0yRKCgifj8I
         i9c/gOarMj9baQm5SG6qkQl1nn0mUytjFMrpcylS3xhMFnjgpv+mit1vYMJo844a4+nq
         Gy3NgcAqWNvNXvz2/+vs4XHjWukEYJNxTgEobnoGJsAFoB1h1F5GwFV/USYZKS4Z/jhr
         Xe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553779; x=1792158579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxvPGKyNsWBvKdzUe72SpCUeaMvMNqz45LO5vcpm6OM=;
        b=R+qatrEvI66Hejd8K3do9PMDesMPgR3FsFZpXc9hb/3Vby7BmY53y4o6lkMobqhG2P
         RBtZ0if1dOryqCxcn7xtEbbWyir4K739Ud2V08zr+jLY9RFqucZMxtv/Ae+49p7Helrv
         y2V/E393WKXqISCnw9zwz6zVACsHu7X06rpj4zPvZfVsPhPH+Y7h7INrF31BN1H0Yftf
         znhrlrlv2atHvW91QJxsW2iM4DAXjab7qyu4Eos9SkA5rDpp4eDKTOuOgxX3ITJbdnwy
         FBspkyiWRW2YWyub7iCgHNSFliKOBPGUm/6uFgaWO5FZaEYcuS6qq8yfL3o4Qq5BWGAX
         oPaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaRcP3i6q38b+0MU4IqJ9M4pDdP4Q4V5quV9WwOIslXpPFTKzpV9tYR9W/BBx90iWe0GQs6nN0YnDILpc=@vger.kernel.org
X-Gm-Message-State: AFuF++mQqlsH6XGITaztm88ABPZhpEtxSNtCl5UePws/n7Qcgv9uGcd1
	dAlF3EnZh1INuNa4dfBcx3W7sg1xoVWvFDcdece4wJR41EVgS487pH/zVQL1vywZ1zYuhP31mKX
	OGY6ei0PgkV+MGApfV/rn4sEq2UI2n5D0EkYhvIR32pApNGQZR//RoCfqVc5u1GhGUWgAGYCPLF
	0=
X-Gm-Gg: AYBFou2wCkm/8Vs1VpXbyKFwy9LYPK21H6hhRhIPlPH6Pp2/H86HjD4XJbrofMAemIN
	FLYQcvGXPAUGrpyLFc2k/EeC163k9bgd9eyLfw4apPRVl4NXxFO9MEPPe0IAMOwdQYQ8jxJFkT7
	ra1kvs/ufYxA4+Yk161pUFiX681LJ4OalBSbSdFf2pWL1NDuYn1HXm3PlHFwC6edpjwELHH9nI+
	jIJ3pdQYYvhb10h7kLuD8Ej/Bg1asEI7udLgSIzr/z1IMZSEdn9Exzx+D8tUC4FkLhx+br+gfnr
	JljJ7AB54g1kG/bAhuwEOACt0vILP58ohecVfJraPuewkc61dqc+lCTNnO6PNJyfAadaP9W6W0m
	XGtXCu8vYM/6yFm2FQQal3n6/LwXLhQf2LFP94E7bGdL7rzElByW2WqiJXw==
X-Received: by 2002:a05:620a:444c:b0:93e:6618:f4af with SMTP id af79cd13be357-93ebd28d68dmr292122985a.63.1791553778956;
        Fri, 09 Oct 2026 06:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:444c:b0:93e:6618:f4af with SMTP id af79cd13be357-93ebd28d68dmr292118685a.63.1791553778471;
        Fri, 09 Oct 2026 06:49:38 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31cf19ec1csm47127566b.23.2026.10.09.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:49:37 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [GIT PULL] MMC/MEMSTICK fixes for v7.3-rc7
Date: Fri,  9 Oct 2026 15:49:35 +0200
Message-ID: <20261009134935.20982-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac8f0f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=NEX6-byUaBDHWsRagW4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qIw9GPCJ37AByncnuXMteuJWesouRw6a
X-Proofpoint-ORIG-GUID: qIw9GPCJ37AByncnuXMteuJWesouRw6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfX8X9x7XNI1Zim
 hKnjcCI+OTP/cvbuoIeYP6p9Jl1iAeW7HsibxHhp0WAv8aIArxidjhJIRQDnsH3QtXNmNI0tjSc
 J2GOi4s7ZTkubSV2V6Zg4WM6J3JoCXJZ+N117JYViyr7OE3TXhzUXYp96NlCOut+0SvLez/C8g8
 tU2KsL4KrRTgXuxhod+SYutWjwgEohsgsVu8ulfNkpGQ7R2DkHqgoKALQDy3CuiEF08pte/LUTI
 n4LY6CwH9kt/aVs1TJrShTTjnTee7xgdLQbSqCGUP0keDNkcu+cLYuRdqB2/HVP+Jwc6oNCQIF8
 VkfDeIQooqCkEa9AuiGjYN6QuwwwgDErI/ZKZwijQCjqvsvkmDaV8ll/YbvPYZCSZ/t8xrvLQu/
 KuxeQ/7dfBqDmdEsF6OLeue3f344nWeQKC/e1W0aRJ2ux2b5aEtZrqnIf4E0irTvaVeQ4R2XKpx
 uLrO/N4g6RgD0BSRDSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfX4iU/reaO4n8V
 mvBwIbDRSkeBFLxuQgnpyQulNNcC2Iijrgg3ZH8DUGArph/OnUl534OwmZ1d6sN7MD6GOSfSKvz
 NFz9iPVkgCUu9mL4SlGVvUKDiTTTrqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090054

Hi Linus,

Here's a pull-request with a couple of MMC fixes intended for v7.3-rc7.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 4396d70bb7fec531bcf934fed016b2f3300c670b:

  mmc: sdhci-of-aspeed: Remove children before releasing SDC resources (2026-09-14 12:04:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v7.3-rc1-2

for you to fetch changes up to c96ca94425b076dc398d929366e378d1e22ec794:

  memstick: rtsx_usb_ms: complete requests after eject instead of dropping them (2026-09-30 17:53:31 +0200)

----------------------------------------------------------------
MMC host:
 - cavium-octeon|thunderx: Destroy slot platform devices on remove
 - mtk-sd: Cancel request timeout work on remove
 - sdhci-sprd: Disable runtime PM on remove

MEMSTICK:
 - Wait for request completion before freeing card
 - rtsx_usb_ms: Complete requests after eject instead of dropping them

----------------------------------------------------------------
Guangshuo Li (3):
      mmc: sdhci-sprd: disable runtime PM on remove
      mmc: cavium-octeon: destroy slot platform devices on remove
      mmc: cavium-thunderx: destroy slot platform devices on remove

Nguyen Ngoc Thang (1):
      memstick: rtsx_usb_ms: complete requests after eject instead of dropping them

Raj Ojha (1):
      memstick: core: wait for request completion before freeing card

Yibo Tan (1):
      mmc: mtk-sd: Cancel request timeout work on remove

 drivers/memstick/core/memstick.c    |  8 ++------
 drivers/memstick/host/rtsx_usb_ms.c | 31 +++++++++++--------------------
 drivers/mmc/host/cavium-octeon.c    |  5 ++++-
 drivers/mmc/host/cavium-thunderx.c  |  5 ++++-
 drivers/mmc/host/mtk-sd.c           |  1 +
 drivers/mmc/host/sdhci-sprd.c       |  4 ++++
 6 files changed, 26 insertions(+), 28 deletions(-)

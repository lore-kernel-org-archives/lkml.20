Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B03D668F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211797; cv=none; b=hgjDR/9G8s2RYaiQH/Cxewx3QEGsDchJpKZ4sKCaF/xvzQ6jCxBM6lw/1aWsftpWzrmn1Bp56YiOcgXdJvtzgQxzAWa4LREq2PEz97dJY/AhOrYA+BCfbpPoL60QBI65GsVSziRyzP9yoDiwxKHZcwWndC6C3nkCP1nNqyTF4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211797; c=relaxed/simple;
	bh=EB+f+bzbA+W8ljsrO0cYrdZuQZpcwBnFrxKD/OlTz2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B55+KiBEO4nDUX09G0dG7FJvFvbbXBv4365MvgwMrh/weF6Pc9zPztXFanVFQXlBWVXBgKqHlgNDmb06uZ9Bniqitm764Vx0e2CZnYXY7hHhu0sfyFdt2tz9kYxH2WtVwKyzo3Y7gVvUK2BxdtQQIX4siQT72PBnlWuX2mnXJiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fl59f9+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYo3A4e4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl59f9+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYo3A4e4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3YgUd4188358
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7
	b97exWP8=; b=fl59f9+E1dsx/rFzzRN4tJ4G28pQLIUaBgWfDjY2Az4G07QCJd6
	eB8+ZhnhRn1bUTjLdKZ6O/Toe6bhE3IcqG7cNUtQGkfaIw+5ORjJQ7h3eyOLRExx
	UZHu2xClm+wLhdlbvktUAe20WOwzay0MKRTCV96kHLkxrWi1oRQaBI20fTN8A/nH
	iGCcp+ymOhUI//7DxeSK4NENEhkMayVL+WEqATba2xtePgJra1Ug1mmYElsxL0Qc
	YMMCViaJqaS/yFB5NRVWwU0gWlL8ZQWPYc6ggC0Ztjwv2aKqrPgtW8qGenniIeRr
	nv8aUFyDukYLOL3oVTjEeyc38dh4+SdldJQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc18383mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so601063c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211794; x=1792816594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7b97exWP8=;
        b=UYo3A4e40dLAXXztgnXTw8nA+6Oz4JjUYU+7D/aDvetPPgvqFKbTAzwwx2PYDFZXiT
         tt1gTm6PGxDuagvinYXorjm2GWxJenPCXFUEB8NMezGphjalAu8mu8hr+T5tLFLKlqII
         5uGoXVdHmsRYFh9n3ZAUzTzQn1J9e7oAp1+Ps5C1XHmZvBfQDDJx8OEgW/TobUS/Unt5
         XsnBOeKx0dljmpSqZKiqpDjlinkj+bIQz7tmQFLtjsWc1NFFv6+g23ZdkDgRBZls/Lan
         izMotSBSLCGLNKXmhMc3artaMoPP5EvcdMgvCcSDxU+jh19P8buO5n657PxAYn/08AIU
         DK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211794; x=1792816594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7b97exWP8=;
        b=YeOuRBtnDpzK1tBPkbETlpDb2Y1Jptiy+ScSQlvn9Ls3BhRS931Y1meCTzb/m0pBsf
         L5Wa/mZPtnBo4Z/HjB13Kz5DDPopzV0ZgHgoo3V8A3tlxUSLOt/b47qMKoAVfpX29QVU
         3m+WvnjUTH0PM+d+lGsBuYM4fv2OYVih0YB1jxdfSNaCgPFfNgu0NKE8o9z7WkpS6ioK
         WKiKsEJxrT2fFrhIBDNZhyNXHHNjGmSE5dEtvm1G2vhrD2VWSvAF7AQjYZnx/w8ac4vt
         IVV4CtNp29ShTAzcfvfHPhiRNwgyiFCTYf1qOK/GbW1F2RyQtND35JFrLvDBWTwveIL7
         7Mow==
X-Forwarded-Encrypted: i=1; AKwUvBy8+oAszsatwSU7Cru11W9o8schSoNES/w4pQuLNpnw5m5XgRY2LX/Dtnit7nLw5cHfYlwcWN+f3Sd3LgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoUhzVGJfnKhsJTvycDNgXB/ugx1VfuS7X1gi9zp3FyHYcANwg
	ZzGw0d3dA9NasAwFRaL411ds6eIJLDB0EGVsaiUA8sPsS21eMH7NA0o3ty4U4F5J4DNwrUHO4cZ
	I1oEem3kEe3rJBEinH8G0oZyGfeovHaku+BFObn9DZMWnTRdFsjwELGSEh1726RtXlWY=
X-Gm-Gg: AYBFou0VQRpRc2TY/U4GxXsqBxLehOxWys4oFNPUgofcyFhJaV0XmtuMofJ8dNHF47t
	0XbJjS6BsQcMsnrWLfpNKxKIx5SWL15Tv0505eIn9Awtuh5SbtW+z85/2ZLLyIEqnjkum2GwbFR
	rpzKr6XN5OnPuY6TN9UvW/rOG2jDkQiUM+nl5n/ntO3f0y4XgrzlHAbyRb8FztoLOUhwHWE7fQH
	jGMNrLqrFmX6gwzhWKwsZljjuWunTMK1ROszFZvbluVbJd2r28Kn8Xu7UIsWurLgnnqEQIsD9x1
	zoOda8vmk/Ofm0bnZB/uCNqeAi9jJOPpYH7PTAK/tNpe0qoOoGGYOQTvGwfZ/5VRjgMu1J+IuEm
	qQ5p6RodYI7WxtcgVEDb6rBm5DTcnccu7ygt8x81jq+dxl60sZLUfhqKdvps=
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr3238693c88.2.1792211794077;
        Fri, 16 Oct 2026 21:36:34 -0700 (PDT)
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr3238650c88.2.1792211793468;
        Fri, 16 Oct 2026 21:36:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] gpio: shared-proxy: Fix line accounting
Date: Sat, 17 Oct 2026 12:36:01 +0800
Message-ID: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX89/xrqg1pysL
 paiuLnSZmQfoHzDRkczMSultEBkVvB71UGkWCfXYYC7XGX7gEhYhAakbvnOMYpH7ynMCjAzAsS+
 C2ZTbJTSu+pFkbL5B0YXsm1mlMssHVc=
X-Proofpoint-GUID: 4WKOK-WF9d2x9aiH5386jqVzXMUMOyhN
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad2fb52 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m3B8FXdnuE4ZOOmS3hUA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX2gbUq6KKOX52
 EqedT4ygNtYHQg82DY07hnIps5IUNiC9iJ+iawE1zAAUHglJ3kxjvmHyokgcjfB+pfBSB5GlFBK
 R+IUPgdOA+pcYSVSjx+VxzDuNNNStgEecz56mPMkVrqQT3EQQlQCG1iXnIYSwB6aaNqos1bChtm
 p/bocn2gg7AosK6gvM5MaXY5pnY519ufC5Vp5cdBdCkUkGWGlTy0pbu3V307N8lpGP2iH9reDub
 xkV38VUZi7r+R6pGMnIlN1vVDJ29P7tc35yirGvaJsfzqYQyJH0bKpIw+DwDINBJaUEeqTICdoI
 sDMKf3hsjHb9K1CvBQQglbm4fK2aM2OkYJ5jUcEZEXqh14pKuUTfjOhHFb+GXm+AaO83plltifa
 jsSrgP+2gILTzax2FLNehS90raJ7JGxZ28+JeMC6+CfdPqEnua/lIP6kcv4qFZFsEotIFV6vOtd
 /UaFlE9IRRKVxY9LraA==
X-Proofpoint-ORIG-GUID: 4WKOK-WF9d2x9aiH5386jqVzXMUMOyhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170018

Four fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Patch 4 drops a proxy's vote when it switches the line to input, so
releasing the line no longer fails trying to write the default value
to an input

Changes in v4:
- Patch 4: New. Clear the vote when reinitializing the line as input.
  It predates patch 1 (Sashiko)
- Link to v3: https://lore.kernel.org/all/20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast
  gpio: shared-proxy: Drop the vote when switching to input

 drivers/gpio/gpio-shared-proxy.c | 94 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 83 insertions(+), 12 deletions(-)

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498914;
	b=U5sepb8gSyXT5H91i0cf7inle4GrvgHy1ZFoioyAx1ONYbfieXMy7vV5mmV070MYuAJ+
	 Qzp9S1uE9bwefmDfUJtIHQpCfX5vK7QVHk5QEs3cgtD7x+H1aqAh34645fxSotsb+r3UQ
	 mraARLyDg4Cx+Ez04/3BoFKhq64JIJrwXhf4psqpLbh86LUsHid2sFGuqY8xWtnKecgWh
	 v5iufGAtFgsAYWRt7+/QtF3lGrjG7QhrctK2T+lJOYU/7qzTvBhMZrGIuARXnZOHCfLEt
	 yQu8osSyAqi8eKTmoPn3ggInBETm/G7BsrASdaixxus85yDMq0dOfH7AuRdx8Td9VDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
	b=Lt5GwvqHFfFA11AF2BPvD56PQmwKgSA2HJrWBUGqDcARedcBA48DYwx0xG1iCp0Jsjjn
	 m8lz8wSH39ulXzK3NeDbly5ftFBicfJ+D7uVsu/fbeKbd9+FPVLHFg61hpT6kReeys+Lb
	 dN+Ioao0zYXjxy9nqWzgKVqt2akl591yvEKeOiHZFtW+FpZ2aR8rDz3irPPQYkIE7Vozq
	 bzeZ31pb44CAny2iRml+987GLCC3EBjIq/t53f6Ey3FughqcUpWWtL/8MVIpFxtGqYgiF
	 85M0H5AxE1gcIgZMDnYgTb2Z0ahIQrdGHfXYq8xrYjagGUNZtZJ1o0JnJkff21/Svrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0LD5mDs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SN6nI+YK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69686606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69686606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0LD5mDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SN6nI+YK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZnXl1652582
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6
	+xLcO1tw=; b=d0LD5mDsj3RJPNPq1nn5JG8LQdJLOPBcSuWB2tmdPXZT28X+sWJ
	53+ebA0Q/5sXGL3DzkCNEIIcdtV2mgS9XjMCSDXNuIf5OrMzYIvsChCgNAPf3rk3
	nuDD9kCg0t/jTzulLG+wGLiOT0smIcHSaFtXtIccv6nPdEt1phTJ/sSDtswDc/0E
	2LolUmA0UYZciMabeAztuyEHhFiHcZmAmXq2UcFnBgkurW2+0/wkUTJhCn4wrbi2
	Sz4UmQ2wDcfSBqxiWu7VdJoybUP1zcznktZNK45lHT5xjYXU80uQarCVNTAqdnj5
	RWiHshUF0bzllw67wSET20bl9czpCqNaZ4g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc64574-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:55:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2e7fa9fbbso722802137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794498912; x=1795103712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
        b=SN6nI+YKIVlWpEDXUzhAmbzIzbPMepTcXy6KM7QWzSrefZ7v20JvaEK/6z1Z0YLXi2
         a/WUsFB5hS9cpjlx8RGSMzo7l3CbKdte4ZgVcf6ctkOIkP1QFtjMgPaGhAhiWmXLqSHJ
         DSIEmb/5XWXMjNs54DO57PjNYJXa5VqR8TzU+EWYyt4q2T9GJEswdgDtdT+7+wq61Cgy
         rtXyb2ycumGTkIGbsssj6dYyX+HR2nCBRv78lzFVzIoqFCCQ58/eJmGeZO4dTmgVFBUn
         vGjOQWPH/L8Y7NAXN1hd4FbluN0vV+YV9rRu+3W3HJEtLG+xXj/u7F8jLgBenXhrzbX2
         O2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498912; x=1795103712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
        b=cbqvHmFPQM3Ql+h9Rn85q6Mz2w9IzE1l0yux9vPz/kk9kKG6EOPqNEOeyVgg25MX8R
         bgDyBseIvWEOGGAaJEiP8yUY/xTUDs+WGaQUpegwMhtd8Xe6LKY5MKcWqGDS42PsxUI1
         d4PxDg0CF84pVcXNEyLa67c7Usut0rk61muB6w5XUzBFlfD2idIE3SeFTvH9rI1uVu1b
         2n1tBkgS76weznMVX79298VLfQvFIZ9d1UWuekKbV0I4mqr8HCPkphVubHaEUCStU0PP
         xyYRju6NGUY12KfAaZ6edJwcm1WY0cckYus2PD/T/YlvNTCeFjCPFTfSEY2a8JNEEMSM
         kUHQ==
X-Forwarded-Encrypted: i=1; AL+hErEKjv00hRyfrhq6debe8izKgUmm4mkl7KhNQ1RwQt4+jj3m8QSbVdOJPcUsyUBl3tndUB5KIgSGOwKu7GM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PhjkyGC3IMPncp92U8kt3fcJ6CJEycaFMcpMqE0EdSMnHgSLb
	vZ37NitSKgmI1r6IPr3ZFB4IsxPi6p2CVlbQ9rMv7j4U9w6iKpeuNfooylLLIib+gFoCo7iJNli
	LzqYoW3svENQVFn/IcDORu5G2gDbMrtuw03eFpgMNt9SpdtqKUrfqvueYbeieFcq02Io=
X-Gm-Gg: AYBFou1nusJrONMfurZ7JGZzWYpELH/gSio6DvI0TsXbbJ9/LmBiRVrhrrlABi3cFlj
	+y4HFpwkvl2FkCmmS/PFRCHk/TRFufSvvL+ZbXB9S6xnJCFjkkhxqbwg33dzL4jbTHvgBjnfb6d
	UALt7FrIqEHb2DX18LP3o1f/FkxMjNP6WcQzCCt/GxERtPgorBDK39Fp9qE7z+P1PIpFesWdDpy
	/67MskvmDN99hQqA2ivb+CQGEbWlyrDXi27SkIVjuvDkDxE4Ay/DCj5vbic6tbrS1VlrIC5Ebde
	awXxq/Gv15q3oyYppealFx6+anWMoLZiP+NH+hsyeBmnHAXGX2IbXQyreqnNDVPPfk3rmvhlf90
	tcsfYQp5On2RISU+/MVRaWLFJLjKbdPK2FU67VAHSDxGS74OJc/Y8RZc7G+OezFXP5WMDBTs6Pd
	awvUMxv8gGbzLHnCYf+PNmX+hKNlf8B9BH2axb1VZzBPNnQTuUaqzkSKMcjeKLew==
X-Received: by 2002:a05:6102:2c14:b0:7d2:cc91:1aaf with SMTP id ada2fe7eead31-7d631828aa4mr879942137.43.1794498912351;
        Thu, 12 Nov 2026 07:55:12 -0800 (PST)
X-Received: by 2002:a05:6102:2c14:b0:7d2:cc91:1aaf with SMTP id ada2fe7eead31-7d631828aa4mr879933137.43.1794498911787;
        Thu, 12 Nov 2026 07:55:11 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm87782115e9.10.2026.11.12.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:55:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc3
Date: Thu, 12 Nov 2026 16:55:06 +0100
Message-ID: <20261112155506.50717-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-ORIG-GUID: 4J6G-1OEJHw5g5DO67bGS3WvfJBhE3Wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX5y1vZ5zsIGs2
 3FfQ34RxfEatKJmXfZMZHMEaWJ8NZpeXy35rXUDc1wJs0uKs+5AHawTxHsv/nrpEHQwvGqZk+4N
 VQ72MJHiLSpdckjEN00xAwYrtCVJ6fHIDgaMijiA402CckqGK2bf1Kargwf/uKMYT60qax+ot5l
 NE+10Gu4WN9oCUMvRvyBG4gkEbPj0vmiwtlJGPGJVCB9Sn9WA2i9M+6NFZVKLMCDwVTSutUz5GE
 zazgzFRJkz6yX5+K+FWUm1iNBya3sf+L4BFa0yxH2JXi99NoDzx9DykcICPYmvDFWyKgttz+d3y
 3IBhGBLGidw2JBuw103MH3xKXBy/geTFrpoku8GCOCuAN1YM2UQ6ldi7T4kyojBRNFXcjU9uF9f
 SVT72TBSQVvU7AwFzoAr2RJ58aNqBYHaoMX3/w2FcRlL1DhpjUkx7bG4ANC3gf1AldU3lYKZeqR
 o50z7mBQ7ICXdOOd1MA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfXxgJoPG3tPPrZ
 ns1kwGQrWvjniaNhQxZo9G7tYJvWCNKCraOWc7l8eJgr/iQBwZXhg7JvKWsTDBtjTUSVgqXay09
 pJiSjWGKy0HYth8dgvU4LPNUtmFI6TM=
X-Proofpoint-GUID: 4J6G-1OEJHw5g5DO67bGS3WvfJBhE3Wi
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5e161 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=BQnds3YY0ppyBSQW7s4A:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120063

Linus,

Please pull the following set of GPIO fixes for the next RC. To no surprise,
this batch was mostly driven by issues found by LLMs (notably: sashiko) during
reviews of other changes. This is why it's bigger than what I normally send at
this stage. It's likely that the next week's PR will be similar in size.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc3

for you to fetch changes up to f8a4fdf57cedb9cb3f47d94269ff27fea8e819e8:

  gpiolib: fix stack out-of-bounds access in gpiochip_add_hog() (2026-11-12 09:32:48 +0100)

----------------------------------------------------------------
gpio fixes for v7.4-rc3

Fixes in GPIO core:
- fix a race in shared GPIO descriptor release path
- fix several issues in gpio-shared-proxy: race between concurrent
  initial users, dropping votes in error paths and driving the default
  value with no votes cast
- fix stack out-of-bounds access bugs in GPIO hog handling
- fix a race in GPIO descriptor consumer label update
- reset lookup flags on each hogged line
- fix GPIO descriptor leak and fast-path cancellation in gpiod_get_array()
- fix return value in of_gpiochip_instance_match() stub for !CONFIG_OF
- fix potential misconfiguration of flags for hogged lines on OF systems
- fix a reference leak in deferred GPIO controller setup error path

Fixes in GPIO drivers:
- fix interrupt handling bugs in gpio-aspeed
- fix an interrupt leak and two UAF bugs in gpio-virtuser
- fix a UAF bugs in gpio-sodaville, gpio-mpc8xxx and gpio-brcmstb
- fix a sleeping-while-atomic bug in gpio-mvebu
- reject unsupported interrupt types in gpio-mpfs
- fix an irqchip leak in gpio-regmap helper
- fix debounce arithmetic in gpio-rockchip
- propagate runtime PM failures in gpio-omap
- defer GPIO chip registration to postcore_initcall() in gpio-sa1100

----------------------------------------------------------------
Avi Weiss (1):
      gpio: omap: Propagate runtime PM failures in probe and request

Bartosz Golaszewski (8):
      Merge tag 'v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      gpio: of: fix potential misconfiguration of hogged lines
      gpiolib: synchronize updates of descriptor labels
      gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
      gpio: virtuser: fix interrupt leak and UAF
      gpio: sodaville: fix use-after-free bug when registering the irqchip
      gpio: shared: fix a race in shared desc release path
      gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()

Billy Tsai (2):
      gpio: aspeed: Clear only the acked line's G4 interrupt status
      gpio: aspeed: Preserve the pending G7 interrupt status on control writes

Cunhao Lu (1):
      gpio: rockchip: Fix debounce arithmetic for GPIO v2

Dmitry Torokhov (4):
      gpio: sa1100: defer GPIO chip registration to postcore_initcall
      gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      gpiolib: fix fast-path cancellation in gpiod_get_array()
      gpiolib: of: return -ENOENT from of_gpio_count() stub

Guangshuo Li (2):
      gpio: brcmstb: fix UAF after IRQ domain setup failure
      gpio: mpc8xxx: Fix potential use-after-free of IRQ domain

Isaac Adjei (1):
      gpio: mpfs: reject unsupported interrupt types

Jinseob Kim (1):
      gpiolib: reset lookup flags for each hogged line

Long Zhao (1):
      gpio: regmap: free the irqchip if adding the irq domain fails

Shawn Guo (4):
      gpio: shared-proxy: Fix race between concurrent first users
      gpio: shared-proxy: Drop the vote of a released proxy on write failure
      gpio: shared-proxy: Drive the default value when no votes are cast
      gpio: shared-proxy: Drop the vote when switching to input

Wentao Liang (1):
      gpio: keep the chip reference when deferred setup fails

Yu Zhang (1):
      gpio: virtuser: remove the debugfs files before freeing the line data

 drivers/gpio/gpio-aspeed.c       | 19 +++++++-
 drivers/gpio/gpio-brcmstb.c      |  1 +
 drivers/gpio/gpio-mpc8xxx.c      | 22 ++++++---
 drivers/gpio/gpio-mpfs.c         |  2 +
 drivers/gpio/gpio-mvebu.c        |  2 +
 drivers/gpio/gpio-omap.c         | 13 +++++-
 drivers/gpio/gpio-regmap.c       |  5 ++
 drivers/gpio/gpio-rockchip.c     | 15 ++++--
 drivers/gpio/gpio-sa1100.c       | 32 +++++++++++--
 drivers/gpio/gpio-shared-proxy.c | 98 +++++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpio-sodaville.c    |  9 ++--
 drivers/gpio/gpio-virtuser.c     | 85 +++++++++++++++++++++++-----------
 drivers/gpio/gpiolib-of.c        |  2 +-
 drivers/gpio/gpiolib-of.h        |  2 +-
 drivers/gpio/gpiolib-shared.c    |  6 +--
 drivers/gpio/gpiolib-shared.h    |  1 +
 drivers/gpio/gpiolib.c           | 69 ++++++++++++++++------------
 drivers/gpio/gpiolib.h           |  2 +
 18 files changed, 288 insertions(+), 97 deletions(-)

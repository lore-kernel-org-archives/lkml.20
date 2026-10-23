Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745299;
	b=wPZv5Nf5KBMkYzvf/rpWJrMByfhBPuURWzK51MLBvo91L8x4hbHnGfUcg3iE1TSO945J
	 yFEDjv6c1lpdfUCW01WvcEv3GVa+XX7QcCqgeX+TIRLSidOrSRs1Cp9hqMKUNmWfXA0+5
	 ZwXp06LAFuJ5nr0K18G10dAteg+0oTZI0MdxH0olSrYy/Rl1jPZcxm/iMR50b8X+xKXUr
	 X7unMgAUty0ETWQBcVfKNCKMDpm62N4FPXzbNxKArqITuMOPAlzF802DNLCQU0Sa060YV
	 1SJEdMH51oStak0FK6xVbt87ZfLRp5Y754+pg4vT+Kw5yBVKXAjXh3Z3sl/5fT3dfig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
	b=eTuEBpW7Ge4PrwmXhP+PM9XSc0+eGgJLJNiyuhncNmF5ShfFDrTGQ4zEzXHNWOzowcLy
	 xB1I1YXmcRY0NXLaF8qwsMHRg0xi/8YQmTlWdhIhP55AGKStuk6I8x6IvilK+qXrWyBOv
	 u4dmEkSr9vEdZh8ARDRHJlFLxcQ0tFSqSzSKZMuekWJPjwpCVnTKP+ImYOnIov7ICi2Tz
	 DNazocUrXv6eV3PgBghKLbWHKqxkWtI+8B0+4GRimyMVHwUDnB1Mi//HbRQyfImhGez9A
	 ZkYLJApE442u0BBKzmKz0dOnGPCNxh+YFv++NXS4yhfxtmCKq3B9v8/093MEZpVU7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkov9LPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gikcI5zQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C4606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkov9LPB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gikcI5zQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9GF2112124
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pk
	iXKYtJOs=; b=jkov9LPBxYXCcS7rrWsIZzm1VUSxll4br185ktXpzEA1C4C7rp/
	gQc68v9NSM+dlUEsyGn3n6cM+O3RkBCYmZpuZ20AjegkDCx+eWNrGZMmrF1/UGh2
	UE5smgUz1M6gI9CCUugPCPC9TUvr6u0L4fKwmZzEcGVtiIdEmK1AVLq5/9x04iFK
	QT6YntkFT2CYloF04okennf0+6qGw2cTZJS4DrFM4Vmpk4W8TqxOwpUG9Mfk5bOX
	E0h6zcZ2hABP9hMGYSSDeVO1U0aRCCEn8ej/SnPRUxlLcZkR/gLwLQF5lfeUwDZH
	zaxDJ2eK4uY6kgfUNCoc06dL+FKq07L2yMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyka813-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:48:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso314511485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792745297; x=1793350097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
        b=gikcI5zQL91d/nfM0qTSC76B5QpwQ7gCR5TRyW9iGW0xjnH4IOl0EsmUUSx1tXokMa
         t9D+GMexkWki3RY7d9zxICwCMTSekgiXQJ3ou18bMBxcb0VMdLjdX3R+KBvrr6C3yLyB
         BpJHamrE3ik5N23tUIMVNw+t/5gWPlK9oQWSduKjjQGWRHFEYGpahE89k3ELQZeQOBYq
         2islp7sFNJFDnLZNx1XSOKRejkd7CiPRqit7hmyxz85aRflSE8qindBrVPWeNfOMdGYp
         gOTd8gD4P/CSO06HBzKPwnoU4nBc+lxE3tgNrAoIoPvwwnC5PyhdTII8Tn97h6Qp2nOJ
         +D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745297; x=1793350097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
        b=i/giUZCTO9sJTck3lVyxktj4RrDSy1cJqJUGrEB/fGY1k/nccHmHqzge3jlAbmVKGl
         gbop31P3zwhfTqLZ5jabNtYnFe91XRQOM0R4LJcplwnGdtqyQ1pHDrP+Zlgz8eL0Emjf
         ghEJ4+gN3xTuH9I8CoaLCvE8JMZeutcs5VTysTqfcHeP50MztKrjrtqP+Q9U6hCvCdSE
         r5VBNXURHp7kbXmZyojfv/lU9L1DUwE3tK8wSes6yHymKp2X0gQJow1xDfN2hpLVFdHo
         k+vJEXem3c4AA7jEo6WYiTD+fWEl/72wwdvTKEY71rs+Io81dhxycvhI81xAkigjQwxB
         4ODg==
X-Forwarded-Encrypted: i=1; AKwUvBwYs77xu7aQDZ5D+bToufheivU9/Iibc3Mbqyz1Qhjq4/+U70RfnJCkC4NCcUfzZHDUK3KBeTRVSp51POI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS7Kn/FyjgnND2J8L2wBuoXL3Qed5TK8VznYjoJ6G2AchSat8G
	ERQH4ld/o6lz99LPpy8klBBydON2co7V7U5kNNsaFMPlLRpWkpe0Ql1IEY8wVgFpaCdYllCdofH
	/2TDebyxqsSBaOA/mD905nXXQj8OVR9fsM14FcencdaB7HxKebQ2xdlcK+BJaT3kgv9q7l1Wwvw
	c=
X-Gm-Gg: AYBFou0R8TPh9oKP0ZmbBdP7g0PW6/c/dl8UVmBtNBqTZpnAePwaI1jmCJgtTv2hAiS
	NtHu0rbxpEOJ3VMkEAvcATVf8nUft/v40XsPe5Jdv3vEMXH0Iu7oVc4pehhgCdGZd+Lq00ADCm5
	Ijsc6qv1C3CIC/ytqMllR7Z0AYtBgZbrbaf63WtKXlG3+G2PoX0j8yzoMC/fcXWUu7Ixsr5nfo4
	H1k9+MarqhvriZZFAcYfC5Qf7fpLsbNNVCc5KgclkH55cmgQA15ZcNeJYZ8k/qctihhUJ9Mo2ue
	UlpFacNVWPuG8Wb7FApl7CHPG3QhAU8RfOYFgfiY5HV+M9XFEDzB469EhwxJsSNojYitZqxoS01
	Z/65Gw6qW29fXgmhwdccjlMxOOFE=
X-Received: by 2002:a05:620a:198f:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-93f6f8585bfmr315579085a.31.1792745297134;
        Fri, 23 Oct 2026 01:48:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f627bd91amr718296885a.39.1792744895234;
        Fri, 23 Oct 2026 01:41:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bba03esm40720575e9.9.2026.10.23.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:41:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc1
Date: Fri, 23 Oct 2026 10:41:31 +0200
Message-ID: <20261023084131.49264-1-bartosz.golaszewski@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX7W9ZO7DN4XLX
 Uoq1ggYgT1OVJfP1/1SAd8qfUihFby9aADlQITOLSmgaJGsg/EbVuEJsA2X37pKbjFl8IsqGPNR
 jBFzhDTQZHrZ6VDw3UDiMQNDEURdIbkSHhUslzrb5GBxiBzWzCRX3127tGOjoHCy0SfJJVmWNut
 cizjN9JXY+AIqXO+l3xqZMRhfBw28gawyu8cQTKR5HkVuCx/t4mlZGLHZStXe2+0v3erf1JezkH
 lY/JbFXhuVJASauStbRl8ThutPzD7DVmCJxJEYHxq52Qbu50Go2uFtUdK5bJ3Bxtc39VDjJ74ns
 Zs6uFJZuHYmYqgtNe7VFCA/PQE9BQ/AXGHbmVILeQ6ubYyBZw3LlD47gnitCCVk53vGMacmuXtH
 EzrPaIWyFwbR3UZIopAGt61+Mal46JrBxYMRoiIi13nhCEE67GlmBz6nAN7v1gKUIM6EG9+IQdS
 pWg3CxNibLwpc4Z1+gw==
X-Proofpoint-ORIG-GUID: w31SlzuiMgNVJTt5i2408Q9CJy1gl7W6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX3OS/H9l27wbK
 xYkPdbPcLCK8OffTTmR7tEvSu7XveKHOiN3xHUxyKM5kMn0O/+bV/UqOHN6mJ2pTyccb7cdQinr
 Hpc+h3hPmjDj7ZOlaSVpmd80BkyhMqw=
X-Proofpoint-GUID: w31SlzuiMgNVJTt5i2408Q9CJy1gl7W6
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb1f52 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=y2QhiVGmr7caz0bHyxYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230034

Linus,

Please pull the following set of fixes for the GPIO subsystem. These
mostly came in late into the cycle and didn't make the cut for the main
v7.4 PR and some more were posted early this week. Details are in the
signed tag.

Thanks,
Bartosz

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc1

for you to fetch changes up to dae739137441667d67fbfcc4d303a0ecc6618662:

  gpiolib: don't report -ENOMEM for a requested line without a label (2026-10-23 09:48:36 +0200)

----------------------------------------------------------------
gpio fixes for v7.4-rc1

- add ACPI quirks for Thinkpad L13 Gen 2a and Acer Nitro 16S AI to
  ignore a wrong GPIO interrupt declaration
- add missing return value check of devm_gpiochip_add_data() to
  gpio-lpc32xx
- don't set GPIOD_FLAG_IS_OUT from character device code as GPIO core
  already does it where needed and it can lead to providing invalid info
  to user-space on request errors
- don't report a bogus -ENOMEM for a line requested without a label
- propagate errors occurring when setting line values for pins for which
  we emulate open-drain or open-source drive settings
- fix interrupt handling bugs in gpio-pca953x and gpio-davinci
- fix more memory leaks in GPIO core
- clear event clock flags from pins on GPIO release

----------------------------------------------------------------
Abduvaliy Abdulazizov (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI

Adrian Ambrozewicz (3):
      gpiolib: clear the event clock flags when a line is released
      gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
      gpiolib: don't report -ENOMEM for a requested line without a label

Baek Kyu, Kim (2):
      gpiolib: Free chip resources when allocating the label fails
      gpiolib: Propagate emulated drive errors when setting arrays

Bartosz Golaszewski (1):
      Merge tag 'v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Jayaraj Devaraj (1):
      gpio: lpc32xx: check devm_gpiochip_add_data() return value

Kent Gibson (1):
      gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path

Mario Limonciello (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on ThinkPad L13 Gen 2a

Sahaj Chaudhari (3):
      gpio: davinci: Clear interrupt status in every bank on suspend
      gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
      gpio: pca953x: Handle direction register read errors in IRQ paths

 drivers/gpio/gpio-davinci.c        |  6 +++---
 drivers/gpio/gpio-lpc32xx.c        |  9 ++++++---
 drivers/gpio/gpio-pca953x.c        | 21 +++++++++++++++++----
 drivers/gpio/gpiolib-acpi-quirks.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c        |  5 -----
 drivers/gpio/gpiolib.c             | 32 ++++++++++++++++++++++++--------
 6 files changed, 81 insertions(+), 23 deletions(-)

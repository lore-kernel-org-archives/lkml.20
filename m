Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309687;
	b=mNA2QvsowQ3pal39iAg7VJ5FtAMx7DfJR9Ng/+808lvg5I2oUjOQyayh5GRYXb+VZ3XZ
	 OV3Cq2ty/xXi29JRKDkQigHcTMYXEO3L7XkhuLz2GoUrhajYn2Baw5TK+na0Dc3hKJ2+G
	 Jcl8wRQ8XzBjHiBeIU2ZDFjvTNmKZwQRRzLk3On+WUAp489V2fP/LQjj5ORYIw+m9ROq4
	 zyKQCog2tEBEhrpzwz1F1OUXf47SpwIgblj+A3IEhCia6t+K6Bi4SqZRIf3wnRehqo443
	 fA1hcS+cKgCtAS2ho9hvZCXB+Wh8cFqUHlo5iPbamMSsJWmV3PUrlWzEu/68W38PXCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=634s9ey5bVDAAJWvmWh4EmNBuNdV1VszbOyaPeok9lY=;
	b=d4EzW/sI1wPEpFcu03U6pZ7wk+9S2rJoUoyJmTV8356kxc2tLtl/aOHX4r3uzfa/g40w
	 pNrhA9T/Fc7V5kU3zgXEqxy2IPWJdt8LIYBybJk0BYU3KJEuaJRBtEIk0Ts9KHm3NR2Rl
	 7ipA7gqGXxJrlsgEE7FSLARuuz+qMpld1fQdxi+1XSnW7t/UnHwlsznNo+/l2h4fVTj4J
	 NawoetYumUeqtQRCZBNdEyUjEUZ0dC5YKk0LS2qanhuKWu+VnMNRYnpp2nLTFaw/HDOqJ
	 +hqi8/Hz6hOm/Egij2Srk+R9d2sW2khnfNBqydwe08JRcVtDZXSN42s1SA1aTOXzBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH47qvFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8MPyVeW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989BA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989BA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH47qvFI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8MPyVeW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABABji2124856
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=634s9ey5bVDAAJWvmWh4EmNBuNdV1VszbOy
	aPeok9lY=; b=fH47qvFIu8/EMCCumwLKAUdnr6XTkxKY0Ng4W0Zj7U/7x8Tve5a
	Tg+kyNYddE/oYtwz4f6rXv6xnE/b9lF69Biqz37kujTpKyjYsoCUhPn1gHJrMzxl
	KoIHJEO0OKIc37MYoVIzrHX3EOPEKzovXzOqHBwxgMIzl5amh/Qb9wJMp8JcBi/w
	FHIv12S1IbkoW+3kTT+3+AKwyaXqeshdZ1wJ56z0vI0Sc5GOigsoGBI5koalXy1d
	UELGe8wb/NF5oxE8945BXNXAMcC22jwLGGOD1mkx8KlYWOrJSyCCYSQaVnri+/iS
	hBZ39V2fa23WParxsYItF4kqniDjXSHWRzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjx7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:21:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso341847685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309685; x=1794914485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=634s9ey5bVDAAJWvmWh4EmNBuNdV1VszbOyaPeok9lY=;
        b=e8MPyVeWXqnLK2finPCUEb0A2dQQxADUFnlDtZNAAbMJBIKtZijDxrFF/eaHr6NQNw
         ZRUrmGytc77nHWPVRbOzqp2PfLzwwJNrkdNvHHFE7LMe3zhIomxc0zaeTdnYUshWk5cr
         7u53TqjKgbJeXESgyce+WGbU1EZF+1hkgIqb0SSdZ7Q44KMYr7ki8i7eYb+aWPStK05e
         xQxf4R2PtvIrq/i4flYq72hQg0Wx0H3N0wMkIwYT5kMXVRM+2cJ4EsozHunIXt18ruUC
         xbAT/qC4ujo2qDcTzo+CsjkfJCWpAttfiNSQcAisOCjWhTbYfiNuZoe2PfjJBUNhQxs1
         4cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309685; x=1794914485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=634s9ey5bVDAAJWvmWh4EmNBuNdV1VszbOyaPeok9lY=;
        b=K9wRFnnb2P1iBPXuCQFrKrL3CpA1Ztq5Pdlxy4SAy87EfXMFzaVdRYzvlbta4bAW4Z
         ZTqeNAdIkguqbDSeVt2trqZ531bsOhdgC6o/efDS85aisMD1Qk1kXFq2IZBKR3f1NvZt
         Edr0LofKTsMW24v5QBKQljyE5oLQEDBluwJOzuLgocHNNqZsAszZr6Jge+AG3IeepwAa
         CwaM3GSPFXQQUIYPgBnaJyDf5iOE+PhuqBAKSRPigndbul9+jA2rHyYDLxWVEUUr39PA
         D1h8o/MSEMKGI9fMqGnhhXys2sqBczfWW9/p/oRseARh48yNluXLuAWIuRQlLFKIGn6I
         h3lw==
X-Forwarded-Encrypted: i=1; AL+hErF16fVPr+zN9RFCjpitNBS67dBguNfEdUKnxYT0i36VMnDW5kD+6T2c11lfj5W/uAr1xKtgbXZD27Nstw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AiMCUkx23qg5nDviPExcX6oPdjy0DQCZbO3OKgsMQ15959w+4
	lEy0KXekr3ZkxeBnl3mRvr0/1U62II/TBPP38ZZfBBnb3CYDw3Q5XqsWdVXhPWy/cp5MbYqwVcn
	RPnWF21IHnVOM14JXIeE4fFVyfGMcQRPzMQeQFEzNWIFLYrxBZf2YPwBY70dYTqnef9g=
X-Gm-Gg: AYBFou113QDyRBJjN8PQVs9YZ0D6c8OpCdpmoYpCYem/SdCtsY7tWB7/Uj3t64jOBVO
	vAnHzu44jHlgjXJZDP5TSVR65n+OAj63vD1TerFXDVumwJsA8NYzXmpNqvcS7+C7YUT4lsZ577Z
	5GIMd0YG27Cnd6QaNmFLWuHndwWDmfwcaDgvBm1guUjUEEp9V4w0IfgiGeQcQGshzfOZjkjnRfx
	m4KY1h3egxLjdDVMJzteDG4UrdJ8IEI3NT69fEvbdx95eUDv3+eQ8wjUos5sfUE1oiBjKreAhf/
	K8Qi9grc6sr4Iz+fz3YoT1X6NhDqt8NYoBxeEhHw42BqVJuwzwekFPYoHSxQd7kLeUoxMt0oswY
	QDW3mlHkIB754OOyRiYzYIfY/h6gGanfe5arS5d/ebsmEoCxTx8V33KUzlC1eNnV1+8mpf6/vRR
	sk36lcgNhhk6QJXhPVeZNejqb0OnF6J3E=
X-Received: by 2002:a05:620a:6f0a:b0:93c:7f48:8f46 with SMTP id af79cd13be357-9479f1d0c8bmr342015985a.4.1794309684627;
        Tue, 10 Nov 2026 03:21:24 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:93c:7f48:8f46 with SMTP id af79cd13be357-9479f1d0c8bmr342013385a.4.1794309684196;
        Tue, 10 Nov 2026 03:21:24 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a61f5b6sm96498366b.54.2026.11.10.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:21:23 -0800 (PST)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [GIT PULL] MMC/MEMSTICK fixes for v7.4-rc3
Date: Tue, 10 Nov 2026 12:21:21 +0100
Message-ID: <20261110112121.44583-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: wGBUl355Il8w4psIop_HHou0RhdWcpS-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXyEVEo1LjY1eU
 pYBPlOnwzQPXxjA8FgnnSLtNxX4huwdKKU7c7MolEq6T3wWDbZIn7uevvMa9VLqhNEOuoIIPx4a
 ecMIROI+DXmX5Vw8msbb6SVai0Jv6Ic=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2fe35 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=m3AxwWjehh6Nn5NoYwgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wGBUl355Il8w4psIop_HHou0RhdWcpS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXwwYRo7cPz+yP
 Q/TF/XFpidmSGW0ayuutyNe1IE1r3YMl5+sjWY/FmtCjJtVFzzZO2IOiH0mgntjTTDM/8CgD+ls
 w2h+Pus1H7vECqJZb/+DUS3CVfb5FjeVoTANrQc3RwEFbvqjtJPNojLen1e7g5i0+MQom0VbgF4
 uUySovdVR3RuLOn5CBLz/z3078L+Y12X09qPmxfs/F3Ren4hA5OCqvWFwFBlftF8aT2h5dThji3
 /ssuHslct01fW7X4aGf8/ycG9GFphotvnC4mo6RBhoZR5Xw6ze+o7f2CvAR6jFPskOjUjfg6qtk
 cOz2Oubx5L1PTnKsc0cjhrbwvoX/3s8CxuHq7LNLs0Y3rtbXOcxx1reZmmT+B1M6oDTux8lxBJO
 RRf/c8DCyGss/VEX5waJoP2/HfmAAOwX+94eBXlhrv6igr4Zq5c1rbpqd3ZdaEU0x7pHuK7RHnH
 40DQKjlBs/ogarS1eXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100045

Hi Linus,

Here's a pull-request with a couple of MMC/MEMSTICK fixes intended for v7.4-rc3.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v7.4-rc1

for you to fetch changes up to 6b8b1e8827837bf4cf1f87219038fddae9e81b0b:

  mmc: jz4740: Remove the host before resetting the controller (2026-11-05 18:56:25 +0100)

----------------------------------------------------------------
MMC host:
 - jz4740: Remove the host before resetting the controller
 - meson-gx: Fix support for busy detection
 - mmci: Fix DMA channel leak when mmc_add_host() fails
 - omap: Synchronize clock timer before disabling fclk
 - sdhci-brcmstb: Don't log an error for missing BOOT registers
 - sdhci-esdhc-imx: Map unsupported driver type to Type B
 - sunxi: Fix clock and runtime PM leaks on probe failure

MEMSTICK:
 - Don't clear dev->driver in memstick_device_remove()

----------------------------------------------------------------
Anfernee Cao (2):
      mmc: mmci: fix DMA channel leak when mmc_add_host() fails
      mmc: sunxi: fix clock and runtime PM leaks on probe failure

Ian Ray (1):
      mmc: sdhci-esdhc-imx: map unsupported driver type to Type B

Igor Velkov (4):
      mmc: meson-gx: name the limit of the CMD_CFG timeout field
      mmc: meson-gx: honour the busy timeout for R1b commands
      mmc: meson-gx: report busy from DAT0 alone
      mmc: meson-gx: report the longest busy wait the controller can do

Joshua Mulloy (1):
      memstick: core: don't clear dev->driver in memstick_device_remove()

Karl Mehltretter (1):
      mmc: sdhci-brcmstb: don't log an error for missing BOOT registers

Olivier Louvignes (1):
      mmc: jz4740: Remove the host before resetting the controller

Runyu Xiao (1):
      mmc: omap: synchronize clock timer before disabling fclk

 drivers/memstick/core/memstick.c   |  1 -
 drivers/mmc/host/jz4740_mmc.c      |  5 +++--
 drivers/mmc/host/meson-gx-mmc.c    | 26 ++++++++++++++++++++++----
 drivers/mmc/host/mmci.c            |  4 +++-
 drivers/mmc/host/omap.c            |  4 ++--
 drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++++---
 drivers/mmc/host/sdhci-esdhc-imx.c | 17 +++++++++++++++++
 drivers/mmc/host/sunxi-mmc.c       | 24 ++++++++++++++++++------
 8 files changed, 73 insertions(+), 19 deletions(-)

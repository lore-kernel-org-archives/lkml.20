Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880005;
	b=b/Xc1h02iyJBRz5tBL/ov2ERnh/DbeBSTwmfgvTv+aa5Xvgoj6lhmcrAjiZCeIN9QO7G
	 6lTsZsHIcK4IwgU45fCMhtgfS6I+oH86MmbDL4WoYzymynUJwvdwxgchCFBHmocbtDzU7
	 EVSZzGFXWu//Sql6sbRORMYLD+BDjt3/yL3FpTT36Mb8bvn3+N6vurdAa993Mik6FdMSp
	 wA9L11k/wqYpMVsKxIP0EIsewAwohflgWk4sYWVyPYopxtXUJCicVRuVrNS/rLUE6wRNS
	 QLFn7TN54swA2+uXnfza6eMT1e8fbvFOOXcHus0kLk0Yui2a5ojixkEQ0dotQ55S04A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
	b=Chzk8bAagDyF1/udktz+uk4AJYAPwuGjMvP8x2sY5bdgroPcLv1lgmJjJzjO2RkD+T6u
	 uRCh6r8tcZev/Uqi+ZKx470E1eOfTL8hzOP0eANrV6/rP0pw0VvvpeSGVxCF0hksePvQb
	 OF38+uuSBeII12jn+cbCOpNXBOq9d9rm1SnRCtYd4GsMsNF3FDrUkG2I5oUxYU4aJb6A8
	 e/jLFfuWDwobsuDNOI01EEKS7pUjvRcLiFk/8bm3FSEaLayN23iLbuwDFZuX32H5py33Y
	 Emfkag261tzEFG2hQuTtpH2bnXj3hWTZpbSwG++zFewmggE39EA1IYj9vA386xLGd9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="J/si1JGI";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CAB606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CAB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J/si1JGI
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1098446f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880003; x=1794484803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=J/si1JGIC/I90qBie8as03R/pjvBIZwpYccmmb9iWM7k9+1/1rdMhq/WDQOSykjYjt
         VRqsJewusWooUzixq2YMOnxb3JjPecQMPZ4D0zVldayzI+XgLGnWGU4Sg3X208Mqp1/Z
         md+QVKaH2c+6FjJsCbj52NCIBFSH6XC/g4c1nH65hTQznyzt2GiW8zI4D5Dd3TWAzUYH
         HLDbMZN0jxDw5mx7EXFijJXjU4QLZGYmcEdc3iNQt3gYDQwODTQiGtRta9zZ+2AEybDM
         2tSHxmIIB8K21U0RhOFP/WTZ01Ria527N6OpCdIqLupEwqLhjTWqDxWLJIi/pRF8dUwq
         BZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880003; x=1794484803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=QjvxrmT+FGr+nsoC4r3mi/BPvdW9SzTN8oBOMZk3fGF/3YnduAUtslA2Y72eh35D8K
         eXwhPEwMVXaasHOzenm5Um0j8EfbyY4F7K5EAoBHeKq05hhTED9yCdhsAmklLMxzNYLG
         no+CHPFvdCsmxK96Q8bo0L1PdjbqveJAz6Je+JcPoaUjZdi8+ENewmEB0O2hBAICNZ+f
         W4yZuviQg7IslulQsPGe0xlp8MPyImkimnDbofc2yvUwL7pQTsYXjabbD/BOZ3TKdTAH
         gvc6T3/wWCtIr3spqLrvJQ6v1t4Yw4EGB+I4X95mO4DjpFzwi1Jdc0iaMAHgFbmxEhQ7
         DzvA==
X-Forwarded-Encrypted: i=1; AKwUvBwboxqDCRxqm/BNPIp/v8GBQSDrDYcv60lwm40yWREhS1jR9QrMsjZ+7bzLSnJuUTqT1n54nNgMmvDSi5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uq8gPCkHLZnmOTSeuxxO3eiLddMXfQwnj9hWX9CwuuNKWnxOq
	/FLQ/ZlvU/49vwRcT92hg5qPIoLKi4LVuwijZ1VGKYiTBqvDjpwMy+XDEypM2Q4uua4=
X-Gm-Gg: AYBFou2C9omJUdUFSiRieM/YLSV8pc0S5SJpiBytcJDdY4nSyJ0uptwhjXpFa120sDJ
	ZUxBs2xPdNS5xz1STiX8OMV46YyEM74gnVTpo5TyZu9kXoBlWJ2EDoH2+DIt72K3wqH9tYiZg9n
	E/y0y9EKpOKKqDgyQOCEclYFI/ko74akdTKCNYZALR0sksd9lRFukNqNFZTE4kMMxBWuJPKnpIf
	cm7UEqOOBXxgf23UkwOhzezI9NdV9KrIleAzQQceU0YIQsAAvqCiiK64tgrszQzxFayjxEX3Bww
	fEy8F5aY+g1hROKVkzhx1Ox/Rpq7FRH/JdVUc7zyDP+xYnTDhMjIRtD2BHXXqUigdvxfRdLsTbX
	6z1SewTE+LnOoNH4i1eIKVl9Wu/sDiJMFYfm6Ug54zDa5ROFw6dEDLzj5M83Z8tg4/ivCr+RXPo
	I1RwBNPtSRPjwG1VgzQ7fJWx0Zz7iOm2h88zpn+z5blvC2L9FOfWDsxgsZPAfeufVdPNBmRSH/z
	7O+sCParllUMnMwyBdy0tVyhf2J4eYe51lKDRDEcv9qWY8QXXpIQAoQ98sRWwUMSiOTbT5C068Y
	8AkezpwDtdFlNA3/pJCbmLm5IGDGn1E/HF+SRfyiIAyGcdH5Y+2hsvr86gnkIlZPuHYUDnFHcPT
	4hV0D2Q/uKDX9cpE3w72wCzhGbuPwydzhulPB5A==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr39449627f8f.10.1793880002818;
        Thu, 05 Nov 2026 04:00:02 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fed0844c8sm10144620f8f.26.2026.11.05.04.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu,  5 Nov 2026 12:59:50 +0100
Message-ID: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dlFNL/7079gou5h3eVG+eT1NdVjDy6yo/xetSiy1KDM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+3SGG2PzkTYN2mOS+nHHZ3aUUEdmY7PqhmN x13lV6S3UeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvtwAKCRCPgPtYfRL+ TlSHB/0f2zV3hLCeaFMGvDmHjdg+j/5IFlFy/1I9gbbilHoloWIuNSZHyN699/+LVlSTqcMhmHi n9XNY0tlZ53Ns0hV6OQmn8m8/cJwLakBd810iEvrbK+zdlETADziNCGWLAyvM934XqLrTqtU3kW LzpfX+f3IaFpGimPEKOrq2r27Xrjr9nh0PtVDsyDiyVioGU1QtBmpOd0fxLvn8Voo5tLFAhDtA1 khBgjXt4t5TUjT3lIFKJjvy3aA0uc+uQsuMK4c9mb204Po+VX7aPr3fqzD+s2HHBnJAhjOg08tW YsL7ATmoSG56BaAFNoziJWlL4i89uLFwls/klK8i7H4i/qbB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since v2 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793117996.git.u.kleine-koenig@baylibre.com):

 - trivially rebase to next-20261104
 - update commit log of the first patch to justify the new callback
   working on the device address instead of a virtual address. The
   latter would work with imx_dsp_rproc, but on (not yet mainline) ADI
   SC846 it doesn't because the remote proc's memory isn't directly
   accessbile by Linux.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.47.3


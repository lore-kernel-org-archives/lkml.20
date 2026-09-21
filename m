Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595093AE704
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019478; cv=none; b=QZlgHL9pSubqjzM7EXmYKDmqTreJOmZsKfqMebQZDePFyQVog4rfgS8rdWuSQDV+ZdxVv1Mmx/z4ZSVrF8+sJ2cxavLRMmizGRvt2MgkoKd8Nw1Xn2iWad5Ckg4HU1Y8r0qZpBP23mN8ZelQH2pa/Qb1O632JSKjwny8SnCCh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019478; c=relaxed/simple;
	bh=eHNgYE1BdIraErQxKLawRC+Z1VdbqupeZ4CgZlyhygI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nxpCNvpUMwmhAMHk3llW7yHYY4D91EK3GNsoyB6MSp+0+4502MXbae/JCgZbzJgObEtN31PZw2j1nPLRo+CdOUuFn1YZFgyTJouUx8G8bVk4IO4xpeaU69swcajOBiMSP7wWd+JZcEv9Su+JFM2eiTch0a9IRC2qEC1IbERV6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=C7Nmjc0Q; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="C7Nmjc0Q"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2459714a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790019477; x=1790624277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24oiYNmQVTuE9tYr8bmlTOafQfPGTBwHcSANDMCgTuY=;
        b=C7Nmjc0QY8g4Vu/BpqzFyKr2Xy8mhSle7n2BvTkTs+zQU1adxgPgAdztx9xjGQ8Dkg
         kAXV3+6uGJp/cdxD0vXZ1pZXcC9J29wWlFZJinvXOt7xA44X16s+HmcAaWJhPqkIryyr
         Pf/ZnKeMy6ppYsAe/Py0Av35zo0Fy5rIpT3Yw5i3nre/hxM8fsGGObG8gktF0HtCI26e
         63EJPs4cPhohy7qdwZSsXyaYz3PwGOCgi+WaiWtpaupTUwKQk9Ot8MboguweUz1X+1AS
         eqvmEAjOZMMlILtK+v5CWiAESm8xz70sjs+sqD7huWzwjYM5Aj07QPIBM5T9dB8gaesl
         uJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019477; x=1790624277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24oiYNmQVTuE9tYr8bmlTOafQfPGTBwHcSANDMCgTuY=;
        b=a9wARoiqRiINB/+WtfjqK3xXRPEUOhFlBtazdYoTw//C6SMJrnnQLpVMqPCGaX9JB/
         WfkI+0rlPgzYgMy1MvXIatezQEOCSV7a69ULhcifRAbhcszOlLUPecWoxGJNgNAOB7nZ
         eleCZ5Sm6ANwFoqJRYRzWvwQcwLrafZydh6LlOj6bp0nThDf00hoWYfYEIWWkOs0V9Gj
         9v2KxWr2Lgvaxd8s1SM++oQFO7JyxjHZfWiohqvO3eVBpJlv46M8+58R5oBWu88/EUOO
         FuNWqFDSNOH8brxM5ljO+Og/jIKPCVcH9vpGJdvotRJMCokpHdKDkksOFvsAlDAGs1fG
         wrsA==
X-Forwarded-Encrypted: i=1; AKwUvBzyLAp2tAbYJn38dgqdTCGtAi0sLhz4yaC0nB6htHWy2R8U1FpU7gezdhkTCjBT8tkpyXah302ktZLP6Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++mKUjk+33X4+ofMlEKXNx3O5odv51rCewlkaDHjOBGFvXUdlP7P
	k/DA7R7h3NbFrejVlinviWrh/vg6pBslGCyVtaE8WUosx6Owl6oNC4u5d5X9TscM2Aw=
X-Gm-Gg: AYBFou3upTG+qfVdEUnVyiCpR16Cibx9adSJC/zX2JNzlo8ycf+99KUHCzkk7fprZGZ
	yFFCbgqihWu7iB5L8k83Ua7wwAP2r3P82xQG/NEWpe4l0L93mPhdUqv7Vq6x/1/NWflFsDW9Tyo
	VYhI44RJZqIJK7oyvR3IEuitu5q6BzdoiyHOP14AEWFx7t27hsjLTmD74Fs2tvrSPmQDZFIV/lU
	Rd8Pe2PcKHhj6dy53hvHOs0nU9o3bSIU7TvbPU+7qd16rynJNbWUpnxXAVqWvUbshSQQ59Bepjr
	ydI2YpUf8rbWW1Z4QzYdYpgJRpXf8N7IOidyOESRKXPIFvbSrMwyUC0zOLB27S0qRLIJNKciHLO
	Lae/6xXdwMea5569+WB1IfKhBPjanhkAoKODz/+HI+HM7dRfCL0N5pLqrf6o5KCDPoZmSa4HY71
	MClsmd0FcoF+8MgVwt1aw0wfdX/oUOH0R9tySfAqMW2HxXPfoGIjlmu58JDjc+xwlxJtPdVhEy8
	nAwnvxCYFbCxaHm8Ns5QC9bCVXYo3NDQpkhZcjBGmThjLNlCu8bH/UOlBRwOkYfI0uhXmCNiuLX
	/+UfcQ==
X-Received: by 2002:a17:90b:582b:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e54e3c640mr24749161a91.11.1790019476637;
        Mon, 21 Sep 2026 12:37:56 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:289a:f600:f11e:a45c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebcdbd8sm288500eec.16.2026.09.21.12.37.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 12:37:56 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 6.1.y 0/2] ASoC: SOF: backport CVE-2023-54233 to 6.1.y
Date: Mon, 21 Sep 2026 15:37:46 -0400
Message-ID: <20260921193750.82134-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and SOF maintainers,

I am working through the smaller CVE backports that 6.1.y still needs.
This series handles CVE-2023-54233. Patch 1 adds the missing module-info
guards; patch 2 is its immediate diagnostic follow-up.

The stable tag on patch 1 says 6.2+, but the same unsafe dereference is in
6.1.y. I kept the pair together and did not bring in the later topology
refactors.

Could you please queue this series for 6.1.y?

Thanks,
Artem Dinaburg

AI assistance: An LLM helped find the missing CVE fix, adapt
it, and prepare the draft; I reviewed the code and build output.

Guennadi Liakhovetski (1):
  ASoC: SOF: avoid a NULL dereference with unsupported widgets

Peter Ujfalusi (1):
  ASoC: SOF: ipc4-topology: Clarify bind failure caused by missing
    fw_module

 sound/soc/sof/ipc4-topology.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.39.5


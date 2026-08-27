Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7E33D4E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872605; cv=none; b=lHZOaHQ3vHLNoL/afOMig7mdOs5JkLgUcN765HESPaQsTALcoTOO0ixzacjXXIWIVl1tBJvLAWT25/RNZ68QAGzI4TCcTfQgLILfsukJN+AHui6lBSxKDphOHcQJzntyDShERRIK/Cl3LpJ79Qkszxap7xVgE0hFNsSu+0Z18LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872605; c=relaxed/simple;
	bh=UdT3hGNALeUvnboImYmMvZ5TECkCwAEoQ9XDAhgPc1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuW8ZtMS2JJLciif0EMgjzaQVSFfWwSG+U0cGqHIFpC2HrmNcyTb+M4G9HWwl0SLpCj65n22BpbSQdNARSofFrNB1hULFt5Pgk9vIDVTghASgz3Eb2ssVH2idXCsWw3W55NLFeI/ioTC3yhRHHzQHkWHPI/WfPQvwSXcBucaL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpYHT4Iy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpYHT4Iy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so2970465e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872602; x=1788477402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPhJkcevED7Y+KnWzw97fILHTL0049NkaJvngpw2zCc=;
        b=hpYHT4IyZnHuCgT7gsmtgEumiHvzIyRATexAxnncZOMfC+kuXdK9WrNqsX1UUegIH0
         hFM34SbWBkvqY62/XTzZWUXABYokysa9nkoVgPdtb5nGTHUPG1wqrddaj/mjNj5JK3sI
         NrP8WKN4nvMByTW4v0mHeEvtJUQY8PFSTX1/3Bq64undtMmPsg93GwJRA+9sbYke4gbi
         ce20f53SZJsR7BgVyoMQoB6sPzugamhUKpFMK+FURoL1ywrj0Y3VXtdqmTOrhZ0kk6qb
         i4xPA04Nfvkk492IaRpyltiK+XdZbrjHBrixuswjRu7pjpgAnLDfUWeOLF1o30PK69P8
         CSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872602; x=1788477402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPhJkcevED7Y+KnWzw97fILHTL0049NkaJvngpw2zCc=;
        b=dofa0NzDY6Ot7iDlyFbW3N5eazF5CwxPuuECYyHaB1iL2Gaa525E0ApNXXvWFIOXr8
         RE1hLAHtxgiZPuGSdUzyL7DLLm/EMKA1d5UahWHpkfPGIK/EJqf0bj3x6gt6DQHeyOdE
         SgmQYzml8/srzEXvyjFsvT21x6s8SAmli3z83mk4GoNlL4NrD+m13lwNA+N5LzMx2dhC
         CNaM94DyGREvMvyhpfmbaMby/yCGmLuUGQZ8fACxeWA6/iazCrD++xaDH+hi76xfK+D6
         IjPsH+Kc+7u3h2is5Z2hg8Q013SH+oFh5PHI68QY7jCgPq+Q9cmOTpAtcn+ZtUd6MLTg
         VrZA==
X-Forwarded-Encrypted: i=1; AHgh+RpFgONMpIGntU0CuQzIm6aCxBY9BS+5oKC+aQNyZ/Hzqqcm6QhnvtPLzEs+BUuYwGLJvR/wMj93TL+H4EU=@vger.kernel.org
X-Gm-Message-State: AFuF++mw2KcsYBfex891zZaES+x+yhzBXYi9657YgSN7E/HWrNem6qXs
	187GXQ9jW5uS/uPYZMUg7BkoCrDH+iFOJ+aM6Ru+8FHvwg6zh/lLqBRJ
X-Gm-Gg: AR+sD13T/ELddWeFRpz406h3SWYnUdKsZPMTD4jJbEtzXCnzteQiiGfj/iTkAJ5xWLR
	pWPvm6AMNFOQoQ94MC1kBG5BdfSr3IA860w87zVCrZBKubrBMJ8xSpTvp0Pv7hmoRs0cBaDFmQn
	i9ud/ZwivAr9d05dpOaXTRvlEGkmMoSOZaIOnoDmtrnn55TY/Vv6lTmc4IKy7w7FE7bqotiveq7
	jLTOJJBYXg1d8m3cVysBwTKg679Z4BiIzda7kOTLK2y//kOQn0QdiOaJmrvnkOpST4I4D669v5K
	Hu+1n7DLzSotUv/gakcithppd7QjTihfSBSjRAx7ndrWP5bI48yz31gRJVffJu+3CJoXqpbz40j
	1g1RN0C0CVtPiE8u0NUzmbOJ0Xrp89auJIc8f6UIBEaex7L8XIikT8oBAua+J9sqaTTH9n2K0Y+
	+u3DxL1M+Txsghblu/uY7ellsdPPJuWfGaq9D/BqfOgG33A+KQuL4ZO9VrEq9XSJSlYp73wsk/t
	wW9F89O0ZZed/srbRsRPadMikT8yGKvVEOfH5W2yhiV
X-Received: by 2002:a05:600c:1d1d:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49b91c2dfecmr31994195e9.8.1787872601879;
        Thu, 27 Aug 2026 16:16:41 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm9835725e9.4.2026.08.27.16.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:16:41 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 0/2] Input: drv260x: restore configuration across power loss
Date: Fri, 28 Aug 2026 01:16:35 +0200
Message-ID: <cover.input-v2.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRV260x enable GPIO disables the I2C interface and resets volatile
configuration when lowered. Closing the input device or suspending the
system can therefore leave the controller unconfigured when it is used
again.

Restore the actuator configuration when the input device is reopened and
after system resume. Quiesce asynchronous force-feedback work during
suspend, restore a usable state if regulator shutdown fails, and keep the
firmware-selected actuator mode unchanged during playback.

Changes since v1:

- add a separate first patch restoring configuration after input close;
- stop overwriting the configured actuator mode during playback; and
- retain the suspend/resume sequencing fix while restoring all volatile
  configuration after the enable GPIO is asserted.

The previously posted optional-vbat change is withdrawn, as requested by
Dmitry. The Yoga Book enable-GPIO mapping has also been removed from the
generic Input driver and is provided by board software nodes in the
separately posted platform/x86 v2 series.

Both patches pass strict checkpatch, W=1 and sparse v0.6.5-rc1. They were
tested on a Lenovo Yoga Book YB1-X91L with both DRV2604 devices. An
RTC-timed suspend-to-RAM and resume completed without rebooting, and both
force-feedback devices played effects afterwards without drv260x, I2C or
configuration-restore errors.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (2):
  Input: drv260x: Restore configuration after device close
  Input: drv260x: Fix suspend and resume sequencing

 drivers/input/misc/drv260x.c | 58 +++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 10 deletions(-)


base-commit: 9a29ee801f525bcad71fea021bfe2a030885c8df
-- 
2.53.0

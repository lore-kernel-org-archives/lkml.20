Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347432;
	b=tROs4K0TTPkQROxEoQUhmxpjpWllM4bZbeBhDu5+KvKKXG1JIReBiM9KTTc6xXfRcnzx
	 Rkl2U6rUHv7L8WtHE7xsz0gqoM02r+ZCFOzAXX5chKhLmUCDFEr8WzfSMpmTVlbrLMqyS
	 o5CVMI4Fhf8KIVblR4aXixivi0aw+ZOVl01hZP0CJao2rMLBOkddv24y5TeWA18Wp/wpv
	 FWbQqULdJ+c1lphfkUv1Y4dEwZBGzLccBnDYAVGakr0ExsygH4847QqeKzhwYlD/SvHau
	 HRxU0COx+51giaV8aeK62VHcAC+Glgk1/3N1F5SEWFJmZJSfsCFyNJ6luEcCAWFZsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
	b=zzhJAKeUC4vXCAsQsKyNsmyvSwMykYsw6nq+aantF0AcFommoLCKzUVuSZZVeAU20nUH
	 bmxxSwGnu8yAZkwH6+Jm9dSv3x8qowUf9p78JmqxdCmTSoDpddQmG9AR2K/t+po39Pu/e
	 1XNEYdr3r0JWaRvKsuGgU8RuVrerkR29+lp6Y4yTDejPQ4nypy5G93J5/acfqHFpMJlcb
	 pxZK/okXc4crNlAF6EuUa7/i+Hf7MBVbxWVgSkSBuovEx4NLARlG51R5eXeWPN7uuCxic
	 JohMob+K5vWbKyOy2RxZzliUE+ewkL2bhxeLK15qkTR0lYnUCgclAfx7JLoRvZyr+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXjqaw7G;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXjqaw7G
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso156418a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347431; x=1793952231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
        b=KXjqaw7GiZQ1Zenb93UyM8Fd4N32AwQfBcLIv/nMxX3/AvLNLBysoLbH3Y8VMYIB3M
         TrB1hg2jpJ9pfHbvD5wpBNe6Itb+GGs1PmDAHlmOVXLjCh0KSGHmDVPG/3SJuurzF592
         ie2dNkHDFZzOILzA+bTAidoyJggp31NLNmZC0FuvWTMAhlHGmRCnlBKuUng2d5bGUk+d
         x/0g3OQB1TzGUDZ2nMb33YA/IZjjKh7yPTkk1AEsXoTfnydvk5itRVX996GFh/xUWLrl
         7I9rPinvf84UKRlvpkDyg6dSOUCPAWREixcbiYDnWXgaWr+jZgGbfVYsQ/uEARaMc4Mr
         Hsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347431; x=1793952231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6QB/49NRyPAoCN2vd2BzB0Ebs4MdUiS/1UntiQymG4=;
        b=X+lSX6gDqlc80rzhDE4UsnTSiuyaimQjPv4mpMmfZWLc+j/7pujwYm8Dt4i0XzmVth
         22z930SBd12o4yGTkkN6XtPmGeM3zLlYQN447J7/QDYJKwdQ1vlkMUxZAHIEfKwoZbpd
         E+ezh2x8+73Rzemav7nljCgtWYPikXgqn6t7t2Bsc366NxOwWjGnY/ZkBG0m0DOB5lxW
         pj6fdRh/pZ5vjVpPLS6QH3LFKlrsPV0aMS07vzSKt4hxe/SXoz9/9YoCMHwDM6gIIR2l
         AQBhDYw1h2p4aKgIY6/C/V4qeQfsNxYQhOp/3+dt3S6eflQkPF4IXb4MkWA5JlJsK0V4
         AvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVXTJt/ePbSP6DsWyMC/zV0/+JdAhLo1aaZPYACiO6cLXNYSr8H78uWX3i0fOux0UbvkavCqee2f4ZQCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkn5L0/HYqUYFtlaYZqghvfJuWTBHWUS0PWDWraw1JH4l536r2
	uIyEsIECdZsEx5zkWKOeW9KrvVgS+A30xDJJJJ9UZgo1vLYXIW8wK3l6ScCgmZ/E
X-Gm-Gg: AYBFou3pm5su9pEi2ab3I5WvuWZXH2SukLg6f3ezedQ+RtyiYS3BPN0oEhQTCgoWQNr
	mh41ffej8gqWHuEfJuYgP1+9cNY5YX5ctYmVzukBE01plf7Danwpoy1PEgQixB3qlQUtdSjD6P/
	rJcm3o8szCiJ/8sAO+kIuAHQsyB15SXQmDMymh+U3TkzC2AeTutOsawUfHp08WEA/KLSHVLOr5M
	8au2aFbbzzJHrc3qVSkZL1Z1msQW2+Ddv4dGpb3JE1IEZYEnZ1ArUvQjkwNAaUQ/4qb+h+9FV9U
	GUOBZ7hEYejx69T7FYTG0PJaNMfvf5c/JsB4ToMpkG8LoqCdEyiAKwJIbeMjWkpGCwhCl0VHKTB
	g15XHOdlD1qIxRa6yABotCeIyNBWDZcCVKQXmHTkpODXso/UD9XrAwj/CTO077IiNNmNVeOD2jd
	dSLdvFzrDOGrmpZgGdHZQzpWFRdEAiNv+3WaFyqN3fUUuhvsRDq/ED/SC6ces+MiZwVlwjQ2xIX
	bikgJl0/XwG/pkIgCZpEEuo0rN+oPI98xRuXDEXE9q6208CV+gQPewCUQNrGqJM5erjIo7lPo+r
	pqGd3nAMmcXMzKeC08oiAWqT
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr1181473a91.38.1793347431081;
        Fri, 30 Oct 2026 01:03:51 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:03:50 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/5] ALSA: hda: Wait for PCM files on codec teardown
Date: Fri, 30 Oct 2026 16:03:38 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When an HD-audio codec is unbound while the card stays registered, the
codec remove frees its PCMs while files can still use them, and the
probe and remove of codecs on one bus can run at the same time.

Following Takashi's suggestion on v2, this version fixes both in the
HD-audio layer: patch 1 serializes the codec probe and remove on a bus,
and patch 5 makes the codec teardown wait until the files opened on its
PCMs are closed.

Patches 2 and 3 add the file to the card while the PCM minor is looked
up, so that the wait does not miss an open between the lookup and
snd_card_file_add(), and record the device a file was opened for. The
teardown waits only for the files of its own PCMs, because the card
files also include the control device, which a sound server keeps open
for as long as it runs. Patch 4 makes an open fail once its PCM is
disconnected, so that a late open does not get a working stream and
hold off the teardown.

---
Cen Zhang (5):
  ALSA: hda: Serialize codec probe and remove on the same bus
  ALSA: core: Add the card file while looking up a minor
  ALSA: pcm: Add the file to the card while looking up the minor
  ALSA: pcm: Refuse to open a disconnected PCM
  ALSA: hda: Wait for the files of the codec PCMs before freeing them

 include/sound/core.h     |  7 +++++
 include/sound/hdaudio.h  |  1 +
 include/sound/pcm.h      |  1 +
 sound/core/init.c        | 61 ++++++++++++++++++++++++++++++++++++----
 sound/core/oss/pcm_oss.c | 19 ++++---------
 sound/core/pcm.c         |  3 ++
 sound/core/pcm_native.c  | 37 ++++++++++--------------
 sound/core/sound.c       | 34 ++++++++++++++++++++++
 sound/core/sound_oss.c   | 21 ++++++++++++++
 sound/hda/common/bind.c  | 24 ++++++++++++++++
 sound/hda/core/bus.c     |  1 +
 11 files changed, 168 insertions(+), 41 deletions(-)


base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.43.0

Changes in v3:
- Fix the codec teardown in the HD-audio layer as suggested by Takashi,
  instead of retaining the PCM in the PCM core: serialize the codec probe
  and remove on a bus, and wait for the files opened on the codec PCMs
  before freeing them.
- Add the card file while looking up the PCM minor, so that the wait cannot
  miss an open, and wait only for the files of the codec PCMs instead of all
  files of the card.
- Refuse to open a disconnected PCM.
- Drop the Assisted-by tag, which has been removed from the documentation
  and checkpatch.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com

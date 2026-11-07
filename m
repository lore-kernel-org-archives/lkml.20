Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088052;
	b=pLoBzaW71/EA7bELaQiFa4S9J7jDVTqpUmtd+aKKH53cmEyWd1U5IQbQRlNHrINR8ksB
	 yGy0Ode9Z8Y4RBt5pflxPFyXEsh99F7bp0MW5pv/tTS27NnbdY1E1XM+PR916saL1PH3h
	 iQWCgg2ybsoV+nWIptToLcs1rQRHRRcVEuzGrJmIeBbokYsTAGhyoEaKUCKQu17Ysqj7X
	 Ilo7SvLRPFJImBLaO/hoVj143fvFohWWxN3MMdMmIQQ5noILleJEnC370sxJ0lXgQePW9
	 GDJq2y9fH/sLwEciM/kC6V1Po9QGRQ/CJDvMJpqDv8ZNlJVrPpjMGdCex9BcCiv9f4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
	b=hRFuNFYVQxrW9Y5jpkOYLQWjh9EspwXwmw430Sm/dXjRaDq4/26vJfemEvuWzUmu5TPn
	 MdAoiU2FRnZAmkCq1nVH3stVb+s0BBpWw+BWksjZ1PJpaDTGUnXrtzQygZS8z2f2nBQwY
	 B3C+IMsfXJ9Zz7m7r+ghH6kMTkVzVEbgUCEt0NY+Dce4c29VfOpznaZVzBorSdeuqYg7p
	 hmkw6DgKTddKGVBHOkQZyHJssgQ4c3LHExBWNaccL8tDx9SdRVPt2zpB7KCz4JbUMwMYU
	 UehT8FWVU1Ra4nBemBmiPpNhp3HzcU3mtUXkGSkTAec68P1y4AkXXe1HDaIDCUa9ovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="beM2/FSN";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C797D606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C797D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beM2/FSN
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-825b40f8a26so12047a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088051; x=1794692851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
        b=beM2/FSNVFndMgCOkT1MlABfEi1fk+mbDJUcWakvIzDXPFpw22jgVXX0imQpRTSmRy
         wwMOTqjJMVnMAhTTcwl6aCeAsI9oocumRfHrQJPk/Z5yy8vKB0/fDBdDGn+ptI5W1yF3
         1l8WvsfXqw1hMUxi51NVkApdvH2tZ+NnG9IA/PyGr64qXo6eDpRc1pAkUC/EgLJXY5T4
         nVvIPevFr3omJUWdZi6T/pLv+PA9Y6qiG5Tto3qFuc15rWgZRXHp5A4hatEVbEmeDQ04
         dle6KJv3XifexVu7FQcQipT+UiGK8eJ1NOYQZc1xbWZ/sKxC//v9Hpx2d5khEVCWoW++
         YMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088051; x=1794692851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
        b=xz7e4e/97n8nBeGhqR/gjlgnRBsL/u1Rj1F5RkAZfj4PHeguT8K9MvAtbyIgr3L0En
         iLPFpcI1QTPnF+mCLfCkY4c90oDpSR0HhQuPD4kxcu0Ilm+tLg8kFw6+fBEaU9NT6UIl
         b6gGT4VHsiaHoY/SZFtBIFbxZrMaKN2XdKvAs5wb+Uu3NMfWorX1Z1F0G3r7Rkt0KomR
         r8CgtnSfH8ijSGSxThxjb2pwepE1xdISfzsEAVxFIBysxzJVln35fKso2IORqjQTnTEo
         zzApmCkBPW2gpyk4tsQQevba6/2rp+6xvFstgfYFYTzpD4VWiiaUCl5SojEb1aSFFa94
         rP7w==
X-Forwarded-Encrypted: i=1; AKwUvByO4xu+GP0ijM1mEneIT8HRX3EhgpYE2Eq5ewIrQbZYEGd35qdNkVQ5L2Yxl+KTnyuGTgh/0kRFbtSlHcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ViZpir3sUpZIjz0wu9Z/jBnk6gCd724r6vJTcmVob1e21QJCm
	OAyY6ekzdSCZrd3wQS36STqqNIaCKQGJNpV911nq88eJNvJlh7zUF23t
X-Gm-Gg: AYBFou0R2uqyNmAcT9CDz4IgMHHjFfWL1jpYa1Vj58HiaaN3bMJLDeEcjRKJpt9B1t7
	q0wmgob0+2jgDt6N9jMGjpTTiKOyPvIXUWCD9E2uinbLNcfquHnxpua8yV+O6CDkXfiJ0d26G4r
	WPLn/XF9L9knA8aQlXigL0UCBuRpF8L9wbxi/pydpWRJQd2bUXVXNjF1ouxj0zMRMQ49GHSLWvy
	lrcodMMCcOjwTUAtv5iP4mIjz2ive0yrxORExSRyruhpczTVBeO5mM6TrFMHo4+n8uOtAF3DEwV
	fle/fZgF4AW7vYrdQqaUB4QdGuMCUS/7o1LrCNQHC5w/+e+g64YZXTd4NCMiv9aGvCEqeT8jcGX
	wAX4jhbKecJZdO78MD0jriqeDkMsCbBxBBYEv5a12XahJnGb8rv8Id1iiyeMIlz1pzmVdWZ2B5S
	UB01Ytc3ks1Bkyf4ktxu+abS7ueWnja0Ap6C5aDgCm/SS724cBcQ4XbA2FOhCdP8MyBCyjCYTt9
	oQZaa21VL+P6ktbqECp1qR6/eVgwNjNNkuxX5xsAUZStb7GHBStXKCsk+hFHiOm5GxgcUDCt/2c
	Eb5vfP47CHE=
X-Received: by 2002:a05:6830:25c2:b0:7f4:eaa0:1d14 with SMTP id 46e09a7af769-85f50783e80mr66616a34.9.1794088050868;
        Sat, 07 Nov 2026 13:47:30 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:30 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH 0/2] ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 15:47:12 -0600
Message-ID: <20261107214714.11392-1-samuelslg03idk@gmail.com>
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

The Huawei MateBook D 14 AMD (NBM-WXX9) has the same ES8336 + ACP3x
audio layout as the already supported BOM-WXX9, but is missing from
the DMI tables, so only the DMIC-only driver binds and the speakers
do not work.

Patch 1 adds the DMI quirk.

Patch 2 fixes a pop heard every time the output powers up: the
amplifier GPIOs were driven from SUPPLY widgets, which DAPM enables
before the codec output. It is independent of patch 1.

Both were tested as an out-of-tree DKMS module on the NBM-WXX9.

Samuel Leyva (2):
  ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
  ASoC: amd: acp: es83xx: Enable amplifiers after the codec output

 sound/soc/amd/acp-config.c                    | 14 ++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 34 ++++++++++++-------
 2 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.56.0


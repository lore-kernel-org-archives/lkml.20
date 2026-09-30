Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D53451A6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733282; cv=none; b=Mnzd/hOGqWPqLrhgw3gQN1CHwiMn4nXQJh9kh6Zj654OSCZ8KMqBo/KmwMZ3MPMU8I1+iG08R05LVucz/x8J+bBHICQ3h4V6JKpcP5+a1trwoTtES3/iwh1vAqH9BOmpGi/g5p514q7I5Z83CkRyLaxMYGaifjktqtqK1PYd9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733282; c=relaxed/simple;
	bh=22EAsRtIugCfhz8Or01nJdxLPEtPClXMezlZkuUu8nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwnNpWdj3yTwQZmPXLKc+Hp/DSgEMPvg9uIdggpZFyykfUI0pIXPPM8idI06RTxAIcxPYgGOlrDQCfPx/OmFNng3vreFOaQaDD+Mn8OP13ayxzgIVTeLCUd3u5Xn74XI5jEYC+vrWpKXP5oI3+05R4au6rh3DFO0r5En0lY3WWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMwvgBIH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMwvgBIH"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so15702871fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733278; x=1791338078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89ZecEDPkVxdgfsZnGb4glnfiTdHK0W7K/z1VS8tLk0=;
        b=jMwvgBIHDI7N2ckgImodf/JjyRvyjVqsJNmQALqdLPva55m/2Kk2L+86/bo1TZLOhJ
         UbDdKR8n3iki4El2hQrAWxjsuU785sfBICUzR6GvoWzctD5/ZrWhVkjC9g+I4OBodzMh
         Mrkqdn2qGH+SRxywjEGqBiYgnUjGu3FGdJPiFZzTZ1Zx5yGXPERFdi6lYVmddE8zkh7a
         /hj5D9JOqvw/LS6Mr4N2zZz6G8HtNd0mCqrAno6ciE/5l649uHzQ/L0jT7RrWvF/cUk8
         IcxvLsEbkUmCR5EU0cHcO4SfoOtJKKk9htqzJAUjzygTO7zCPPF0kIrzQ1zbLc/Q5yOa
         NddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733278; x=1791338078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89ZecEDPkVxdgfsZnGb4glnfiTdHK0W7K/z1VS8tLk0=;
        b=Lj+mhBisVI4TaGoWW9HtZ7tHQNtYG9pjcJVm9NisQVuqg7TwDYYLbyNHJzRO7mYOEB
         WsbWFqKvNumvUN/kAUFSLL5S6ZMhY4WaH6zx8FgTvqNQjHPMEvzCLOl2cgkPzG/6ZY1r
         rXltWV7+3qmrJjFXlPaH1gm+DSU93VNh61hbplEn6tOrwjsSJI/I2z65m+GVkLLoGIk0
         UtravJ1R1bWzEYZWFJ4LP4s+wAADS+GWaL8wENqsNi/miQdkvvJyfpHZxm2PEGBVTqGE
         5R6yyhmLvbcQhXHrCqKTHiRfN7v/ElIc+85Lj/KKQyiJXhBEyBNDvjuInVioP1ow5ZzC
         ZWeg==
X-Forwarded-Encrypted: i=1; AKwUvBxlrnPPyp5alNT44tMiCvWEGwE/SPqH5mLmmPjcdFW2B+ipjcvh6Z88nmzR2fxyda4325zv2K8c4nYxwEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRjeJLquLT51C4HvxN77+rIPY4fheWG5CpRdfu4y/o2LYEqOBE
	rnznDVBLicQ1zgTOT9tWqzJYORwhY9hPeFkEXcRmVBeQLoMr2sAFXMPP
X-Gm-Gg: AYBFou0u4cUM7Gw/l30TW45RcUhJ806KK6Cj4X44OpJvGf/QpKclkOHJCP16uh6NKr3
	NPIuhm6bIp8b1Vcy1+eoJkWPGyod2oss5RjJyYiTtiFQw9ccG4yrmdqhy1fShbiIRYR4glxPWYC
	qG5Mhz3mI7f0Ywqdj944nUXWH0Z102Fq+0oEANXCijQ1xOA6juzkXMkD8k7sc6l0qAiD3C3RacK
	6Y54aVg/7xwoSHNBVn0iAl3zjaXAs23EXbwLgMqFocJRcJ8CIUSKOp7WyHnGbAE0jXWUP6iZEAD
	5G7BgVnYcWzLzFOhGpWKcx7MgZbg6+UWTPmPIu0EpXKmCqKnt+WfQgJup2iE+DECqkA3dg0PgNK
	AkV295twqpb+QDpiD5zWpEI/Yf8lXsemjHZokH9/g11etyMDtAjIE0M/NnG7FSd0S6NWAXb0tWU
	9f1P4HJx0fQN+Cy7f5vwbmNNyRVl83jsIK1QFS8GXAf56Hpvi8NgqcqgL/MnFn8rxMNrdAEXVnF
	LeH5MQAxEezVT3FbT9ac9jIHVyROBKvdbGAaiJr1+cQ+FECwTcQbXEMMGiKd/Bwtw4T
X-Received: by 2002:a2e:a902:0:b0:3a7:635c:d56c with SMTP id 38308e7fff4ca-3a7791d7277mr62711fa.7.1790733278024;
        Tue, 29 Sep 2026 18:54:38 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b867f6asm347507e87.75.2026.09.29.18.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:54:37 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: W_Armin@gmx.de,
	martiya.ar@gmail.com,
	platform-driver-x86@vger.kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Subject: Re: [BUG] Redmi Book Pro 16 2024 platform_profile write fails on Linux 7.1.7
Date: Wed, 30 Sep 2026 04:54:36 +0300
Message-ID: <20260930015436.3095516-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3b58a0ae-f050-4dd5-80f6-bf2cdfc20318@gmx.de>
References: <CAM-sYPpgNU+tmfHKWg0KHfVF8f-K8oaNvfYwj-vaUGsEvf1tjg@mail.gmail.com> <3b58a0ae-f050-4dd5-80f6-bf2cdfc20318@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

I have the same machine as Martiya (Redmi Book Pro 16 2024, DMI
XIAOMI / TM2309, BIOS RMAMT6B0P0B0B, which is the latest BIOS Xiaomi
publishes for this model). In case it is useful to have it on the list,
here is its full acpidump (all tables, acpidump -o):

  https://bugzilla.kernel.org/attachment.cgi?id=310971

What the tables say about the Mifs interface on this BIOS, and what I
verified on the machine:

- The method is \_SB.PC00.WMID.WMAA, in the SSDT with OEM Table ID
  XMCC1806. It implements only command 0x08 (GET and SET), 0x0a
  subcommand 5, and 0x10 (GET subcommands 1-3, SET subcommand 2 only).
  Other command IDs answer 0xE000, including WMI_FN_SYSTEM_AC_TYPE,
  which your "Treat WMI_FN_SYSTEM_AC_TYPE as optional" patch now
  handles; unhandled subcommands mostly return status 0.

- The SET branches set only the return code and leave the function id
  at 0; only the GET branches fill it in. So on this BIOS "Detect failed
  function calls" reports every SET as failed with -ENOMSG, although the
  firmware applies it -- the same as Chris reported for the Xiaomi Book
  Pro 14 in "Only check the function id of GET responses". Verified with
  the for-next driver built for 7.2.7: every profile write failed with
  -ENOMSG while the EC mode changed; with Chris's patch on top, all of
  them succeed.

- The mode values are not the Bitland ones. SET of 0x08 stores the value
  in the EC register QFAN as is, and NTDP in the DSDT maps QFAN to the
  DPTF variable \_SB.ODV1: 0/1 balanced (ODV1 0), 2 quiet (2), 3
  performance/Turbo (1), 4 full speed/Geek (4). With your two patches
  the AC type check now passes on AC, and the value "performance" writes
  (3) happens to be Turbo here; "balanced-performance" writes 1, which is
  balanced, and after Fn+K to balanced (QFAN 1) platform_profile reads
  back balanced-performance. On battery performance is still refused by
  power_supply_is_system_supplied(), although the firmware accepts Turbo
  there.

- Command 0x10 is the battery interface on this firmware (subcommand 2
  is the 80 % charge protection), which makes the existing kb_mode
  attribute dangerous: writing "fixed" to it turns charge protection off.
  Verified on the machine.

I have put the details, including the test results, in a reply to
[PATCH v6 5/5] of the redmi-wmi merge series, since that is where the
per-machine table is being discussed. I am happy to test patches on
this model.

Thanks,
Anton Karasev

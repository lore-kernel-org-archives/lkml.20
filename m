Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EF4973AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340330; cv=none; b=ts+wu5dQwznaBHH262cW6Q4N6SC+kNfdA8JrgXe3Qhj/EM9Iu40gKBfRrjqGdSmJa3niSWERLBh2b6jVlY28W/d7VpF/9Hfo1q4EoC+LsvPYQdBlUXNYz20vCTnC3tuGkr2w7pw5qH8iAvWVa0+4h+49eyvX0gUVmiyQLOX8HR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340330; c=relaxed/simple;
	bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GKWDGejQS8TQBBglbbbZOzdl6iZ6Za6nhC+7Aygt6Gz8s7B0xZ6fu6ZJfCMJQ13Hkn4nuXnYn5WSlD6cqZAHX7TRY6JHaesxiy3rXiOyzFo/75s1OUsgXXiTNSCdaxh3A43faM82QRQYE+n7C13bx1J9tTAGtcWBiFTv0FCBoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHLo4fYc; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHLo4fYc"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so5415925ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340328; x=1790945128; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
        b=QHLo4fYcFsBEw9KbqWriFiq6l5h2ytJpyfWWWRCT0YBu3lf5BmBYRdGRSV7LHGt5e6
         fNrCXTOFvt/YINk6tPX3GsYO3Amp6agEgMuLImfug0TOS8heV+q+tIMkdP41KcKoRtOs
         f42K5ycJcQdEQWPXaguOV4nHTNP+fJ+Lnh334Q84IgEx9QPNMBRphpRdnwJQDEX6jD8k
         dR3FxrQB72zqfOU+eqxpPiBDzLdVSAgQOOjQm4T1BGSTLTmeb4IuwUnU5C39h+2YgK1I
         gYbn5p60uo8UmYjoe9GVSZuP+4ukDGq4yRzDys7Ne1tMxiDGODLh+/M6dTv0zEXqLbn2
         FriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340328; x=1790945128;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
        b=am/IchwZjS+rPMVt+c8tEIxV6JZd0divK2XD2+vayPS40bTFBZpge2MqVhfd/m4cKs
         zmHnTl28RT6UszxzlPFfFK8UvG/JdyTczewkkZ00bVcT1Bq4x6mWb3AEos5aFhNvKEsA
         ANJdrLwTJICJSyK0Ke6xhqRY4N7+17U/tWIvth2Wlof/UBRuapVOfoZ5tvJ3wzUhjgmX
         9z+8o0vOc1BevnCBG7xVaOOZVuFv722EV9Aqup9FwJbLMdHk1IypuMKYiAvFsHsD/9G+
         pynEock37E44QkbSh3sTaVQpDRPTvGBZsJn9FGcuY+sU/0d4WNlxN9Lj0JAlDrMV7N/v
         bNZw==
X-Forwarded-Encrypted: i=1; AKwUvBx+LNErtpn62gvp2JdTdwdUET962eaFRralZMVZPEEXGcUuxEbrUU7KVvwFspTa14LN4Kvw2yWxWX0TRaw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7JyDLJgcBU5XdgQHiqnAgij/kkaRqioSWIOj71pXN6XyytBca
	oMbpcwthu0m+UL+ARf2hRQHn3nrLYVVFeIbIhaHE59DkxGpsxFNU/JkC
X-Gm-Gg: AYBFou0eNhi+MdEU57T+mvhN+oJ4r3XJ0a2nekKfl0KY7kbw8jW3LGnQbsWGwdHByrU
	v5FmtDLTRgKA4/Vm0NxSomw0fdRlPJkrcpEFgPTt0IG8sneS+20r5pk70JDSbRd5bZTecj3+sfx
	eI/9u5e7EJS042T4F47glX8dyYi++RCA4Pw/1liT4llF0HplFTmHVZaJ3YsMrisZxOCzyomvZUR
	FCnDAcZ0kXkbB2Dx5z7gI8DGAOno6zRH/yo9ZIywImVblopAK5NF57gnWNuYmbOCbEgG/2ClPlg
	7OloH1mCmwQVuVUc1wjWmufuhjOwLy/rexrX48Wyjte1guBwl5msqMX2E+rRNg+wVBo5qbMak13
	SUY/83Hr5fA0w2dYQ7qQrpLeZGuC/RA7st6lLkNc4tvEiSKcE5gZthD1NqXEJAn3Y5Qwk59mJse
	jp6mnt4ZK33b1cns6pUE2F95kvpdwvK7e9RNkDuJpIWXt/X7D+1EvZ06JqpLHGYs2KV28J9g==
X-Received: by 2002:a17:902:d582:b0:2df:98b4:c294 with SMTP id d9443c01a7336-2df98b4cb7fmr9983615ad.61.1790340327930;
        Fri, 25 Sep 2026 05:45:27 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfea3sm9261685ad.14.2026.09.25.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:45:27 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Marco Scardovi <scardracs@disroot.org>,
 Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Fri, 25 Sep 2026 12:45:18 -0000
Message-Id: <202609252118.ReplyMarco2.lhw@gmail.com>
In-Reply-To: <mTEVQW_BRQmYsDDsTddE2A@disroot.org>
References: <UuqOxFagT_OBL0l5ZYtfKg@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Marco,

Understood, and thanks for leaving the SCSI side with us. I'll pick
up the dynamic class integration shape from your dropped version
and rebase the LED side onto the class once it settles; no
co-authorship, noted. When the SCSI driver is stable I'll post it
against your class here on lore.

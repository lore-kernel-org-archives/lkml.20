Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156A34BA50
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570396; cv=none; b=QuEsd0CdNP/R4gWom72GicSL0HV+NTk0knxE0Dnnej3VJtPD7H/f1fheOYbhQ7F3frhygTcxFw6KC06Hx5W/avaxj/S3G1ZWtXGZ8PDQ7epJigS7YT41yUntl704lMDvixJ7BAhBK6bD4MZNrTIwGqxkprqlrCHYABomXvhDUfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570396; c=relaxed/simple;
	bh=OuC/W/DNESdwVjHCYITglUUqtb1LIzuHPvq0FWVR0VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eU3uzKo2dkZ3QNlVYfPv7ymP//OJSmVJQtyo06ZLP+az79TDAXUSIhBzcm3/cUnK4dPOWPnJ9vghUA0UAj8umd513iw00qbXxvir2Q/utEvecRdGtLCZJs9GxHUfi22qk/Eu96ICHZFK3dV+YBw/2jwQpauIW0SATFWI1kpsbcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=XZmh/oNP; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="XZmh/oNP"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fb7119b3eso174009d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789570393; x=1790175193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW23e0CCUw23TNIxrY8dug480YZmKW8Fw0A6LLlcPJA=;
        b=XZmh/oNP32aU78zXe69kHDDX9SVy4LiEvpPNDqLOmx6LS6a7Yck4tikMYUWR9sxUea
         JA9AELJJVIldGwQDuKTD2SzXO428XaiiAckas9kVYi4+XCJbCL2N7iI5R6GuH45f2+p7
         uLZrU4a4bYKtwP47sMacr7DGSTc9e9UV5hLJMSgAcDvP1ir8dMw1dy3bgWOmFLLO6s0r
         7QTRV/cWymqw0Sg+SujDWvX+ZUotS599nnPMPXMPdKtQKULJOnrah3k92oT4b2LD9/36
         OlL2DnI0TcBW+K5qKbc/wF+nCavAe5jBWcZ3jBLIHH827BFmw6Fo3b7lFnirSMXB0Q7D
         8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570393; x=1790175193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW23e0CCUw23TNIxrY8dug480YZmKW8Fw0A6LLlcPJA=;
        b=h4pLy9cGh8eHYLkQmx9wA3OJmtNVFHUGTcaDSy3iEnu1qnWw+bbhHXUljiX6OF2vuU
         7WLc0Y931AQVg3LGPWaPA2MWWR5vmua4q0njn4dL3nnEDuFK0Qp7LJ7aU7FBravRgqwY
         zKwt/NlSse+bNHnIREGzOWHVEPqBzgAfvqMwGSIiFuRMrKJrNb53yPCnP6+nbRTA72Sz
         L7ivqWaF/EJU7E5MzvrJoMHgNoqkCv9qfvYJRlh2S36VwjREugTZ07oTTF+vTz+7ocD9
         2rFv26lUjZuIzykYRjjuN15TRy6KHa5wjwmVBx/TwtHgFZcqMj0/f5t1+Ds6DcqwdzRM
         /KjA==
X-Forwarded-Encrypted: i=1; AKwUvBytw+okAeH8sEt1siCCfrBcknixtS9rvxW6p9vkeYhpY/VyC+5NyZEdkKSG3DQO8l4lriLgQGQKP4QKQMU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHNE02/QUFMt26W4wYXb72c/G9SXGvGBB7k4ONdX6NyF8Hb3b+
	8rEFx/p9VL8g44OebLZj6WSayOUZ8uNjVgG3iSLHelMdDISrRj46QzRL47iBnLrC77e2XVj7A4h
	mBtQvgPGeAdhNWQ==
X-Gm-Gg: AYBFou3w5gHhqRRY397SP+xKOjtSkWbF8NYi0ks+3WIfhhQrRWUfciWm64uvPEVIkng
	O7qvAIxkHMaBo+aAgkWokw/HOa8xUTHErzEi+KQ2ZMDpNa1rA71WrE9rNNn2ADB3/s3v5M6oIMC
	zU2s0jn7eEz3tistm6hpE9gFG2FYGw0OoMIL3AygOBcv+8SCBu/mjfm6oORxgrBv27sV5hAfy/4
	xHVgHWFB01JMx9K0M8ywkfnuoKoJMpVIUn8nmaMLeseXAlxbg4RzMEtw2LLnDr2QPORCUj5bYj3
	0S+hN5rRwVVV+BxhKgLJkS9L2zoz0x99EDHn+gAadUKnQld0UbDGaTFE8zkIQb09vTJd9hh75DC
	45/GwBou4IItkA60s7SJu8YWhEkcUFSfpMjuviG11/mDvGXzXHvogRydNP5CgxR79hfYph0yusW
	pTyOD6yE1vWHwsxUrD5p4LPUWcRWvEmcKooZvpmMBxCSTtWmbbtxc9NknCtW6bRh8tcI1GlIE2k
	Tl9SGqn+yoT+ArAys51qcrplnUZiXJ6VqRTEbM=
X-Received: by 2002:a53:cd11:0:b0:66f:c852:209f with SMTP id 956f58d0204a3-671631f60fdmr1054076d50.2.1789570393120;
        Wed, 16 Sep 2026 07:53:13 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6715f787276sm1397653d50.19.2026.09.16.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:53:12 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify TTY signal scoping
Date: Wed, 16 Sep 2026 10:52:55 -0400
Message-ID: <20260916145255.1587381-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqqJAZfG9FC7PgMW@google.com>
References: <20260914.b8a029f9abb8@gnoack.org> <20260914180946.1462099-1-clusk@northecho.dev> <aqqJAZfG9FC7PgMW@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Günther,

Thank you for the careful review.

The phrase "or otherwise driving a terminal" was LLM over-generalization,
not a separate mechanism.  I checked the paths I had in mind against the
source, and none justifies that broader wording.  I am dropping it.

You are also right about the verbosity.  The generated text expanded a
two-line distinction into 15 lines and obscured the main point.  I will use
your suggested sentence and remove the signal enumeration.  I do not have a
stable kernel documentation URL for that list, so I will not add a citation.

v2 will contain your sentence and a short LANDLOCK_SCOPE_SIGNAL remark in
landlock.h, matched to the recent MAKE_REG whiteout remark.  I will post it
as a new top-level patch with a Link back to this discussion.

I will keep the positive selftest you suggested as a separate follow-up so
the documentation clarification can be reviewed independently.

Christopher

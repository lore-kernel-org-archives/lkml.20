Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216221;
	b=PZ3etzlgDEIrRy4YkYa7K098+ch9oL57z0FJ/FU7TL6173dsokCe+2DQCdo60T6qr5t+
	 rPPJldwE5jPScgwQdbULQ28lzquURyC9UJf2WhLRj0uUWcB89fUfQeCuIACsIGHbMyM9O
	 STgVdoN0kUecIDBXBpN+tZQj8emJYwP2PoPRWV1MN6AQIeNihX9OS5v+MjPMBz+G1R5gN
	 kHWXqIkelcVb965HRyX78Nb6ywdAD3wUTyn6teVDSk7rTc1R+4xWDyhq7oPefTwNoiqQY
	 3DmP+N/C59kK4bB5AOYXTlfLOZgGmgn4q68ml7ulPm98nqLcaPz3O67HQkcNfpImzsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFb6n4TRYRQMHItVUvZoh8iS3ZAnG4e4uqRFxHODcmA=;
	b=Q5amT3wyDAJPRnKFFMdlOgEs33pu9KddwJgugWfXsd3PR/8Uef46VgY84qOXr8nulp5n
	 Z6muNw2JhgsRxt6Ag6RFNkn1UdSXMSsJ5DeaOUDhD87CE/fSUyDVClFdO8VI4JYUHb0CJ
	 E3d5uoxUQhtzqDelgVgv+nZNN7XOLhd5rdpYKnimxvy1KXMNdAQ92q5pq2fX0jOqygfjM
	 190Vt0k0YgTWfYXDIOvyr3SZPAo+5qEgSMsH5FHZbiUALJHsXW4yPROrzUZMpu02/xabN
	 myNXS200bW8yRwnth6x3MDzuEBucwYXsOcSmq4DIRChWMQcEPSJLekXDGREIjaY9naw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+rIeEt6;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7075606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7075606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+rIeEt6
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so21340f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216219; x=1793821019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFb6n4TRYRQMHItVUvZoh8iS3ZAnG4e4uqRFxHODcmA=;
        b=Q+rIeEt6CpPE7F9GmV6ZVG6bNBW9xBSxS4jPWJRmIRxRh8hxy6RSMVzncRB5HbHWGt
         OP6zIuqBhz/Sq5ZV9EVwnWbn2d94slghb9HfFMX9RvmlGXz/3LjTEfg32REhOmg1YiYv
         4g7rk+NNrhO1koPKzqK9PO+iKwxEYPDHwo1BAL1iNrPXvXIypiTv7Qs16gwEOclfjk0A
         zLbuEdVpomtSbKJgsIfvhot83IOSbB6u+UbsBUoBSa/fWUo9uk8wBaulUrqfMc5e7mGa
         AOIHO5HdbwqFB54Ll/7CjcTZ1o7xDEP50ODsf6uW3qrJGXqtZrvFQXjeDuz5oG12yIK9
         7DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216219; x=1793821019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFb6n4TRYRQMHItVUvZoh8iS3ZAnG4e4uqRFxHODcmA=;
        b=aNDKKxEBmU5CKKH0zJMU/dcxm1f9a8oB4cs3cOc+Euaoi/J7eGEL16M4s+leql1Lof
         /tOKTKTY+fk+yfL7MwpoR9DIt0EZl23bh2Bzl5DOQJJ91fb39VsCnmIyq5pUnVEGHPtK
         sYzxN1ZmmBrixjjufnuponk53QhammJnogcAvzABzuxuPVmjvfPr1XCWGoVJm4hhFXBm
         1mudAwhZCeBNZxheZVJDHChJDSJH1osOy9m7hD7v8qF5DFzm/wA892kBTWkQpDaiQsxh
         BA5uUHb0GKWjngd3wOaNLTCxZqnUtGw90tlKB577dYD5/ulqh7v+9aEevS0pOMShP0i3
         SUng==
X-Forwarded-Encrypted: i=1; AKwUvBwuwwTEoeW2xM27/qhUN73pKp4QVyEW3Av62uR9LxzzB4HU7aHMKRIItiXXFOcSxwj3ueqeXIRGNcmoQdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Ww/IL3RNStz10PblK6M6nHCQQIViGKreJRBeqOK3ToBKDEHU
	CIh97hVfyNPTPs0+fQRF39pKeMrBj/K8EIjptdTrQyfERd0CW3F4qb05YNj8rD61+Kk=
X-Gm-Gg: AYBFou3DOHs2+QrcglIZCOZnKsTJufX1myR1aS+6Jb9YB7gHr3BTgm0LbeZbUkEdFvl
	nCVy6Dy877OFlECYLj86foYciebDUcvrNbKpbTk2Km3xjhfi6+IR/RSFlKQB8pm0PgYBL2iP6nh
	XWkaw0bmyBs63NdUtYLYc7twSnipa2TgE2/qXV5paZZ6H+C5K3O07P1qRg5CprOlKh9UwOz+slN
	d53mPvtJ/Zg1ZUgtoA5UX9N40SXN6L3NTbocpWcVVGakcAogn4dBdTYn3oP4P0A72U9Sx1QpTGx
	/xUzQCdgoG+BAN0Gt9vjcwJ2DCHr0VH2K3Jum7NcmjIcCdzt1mBt/29JgMRiZX/WXWxEzsRwZ36
	cSYEA8XWbKP1I/4Rk+gkPKS2HAzXGW4r/LuT9KzVDBmH0Cm1V2Y6mC2Vk7YWse/bqOSSdXKcJLk
	JkFvDhkD5NSiufd9ScGU6E4wH59+ODr73UaVlqRv4R3CGEaM2wZ/5oXvFqeJCsesvtzrTUYPnaZ
	i8ZIcVgM6DCzM58rDKgAc6j61mMCYrBSBGdZ+lvxnsI9nnJJccqT84p14BiX73D4Ce1GUzePIt/
	iBL/e79gxITq098hNXq9giyB6isk9t49gkabaJ2yJq65tORjEwa7bNVgyXd/xZgYAd9dfXNlb4m
	dG924yNXhhhx04TzY3PwWI6dpMtE8Xqq7j9RrFeEc2nFFCOfouaTfksdisHvGymPqv1paWlBWAR
	vD2ugQ3FD2FriFp6+T/LjON0BOivPsR9ITWHlnLqsf1aXbC0VsfpJ7/bEalQ==
X-Received: by 2002:a05:6000:4a16:b0:48e:5d06:8b66 with SMTP id ffacd0b85a97d-48e649b0958mr1497723f8f.19.1793216219054;
        Wed, 28 Oct 2026 12:36:59 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-3fca-2040-fad6-74df.rev.sfr.net. [2a02:8434:fda5:4201:3fca:2040:fad6:74df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm27004611f8f.41.2026.10.28.12.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:36:58 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] tools/bootconfig: Preserve filters when resetting and applying tracing
Date: Wed, 28 Oct 2026 20:36:22 +0100
Message-ID: <cover.1793216183.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Masami,

Here are two more fixes for the bootconfig tracing scripts. They address
resetting existing histograms and applying saved filter strings. The
patches can be applied independently.

The first patch fixes histogram removal when a filter contains brackets
or repeated spaces. A failed removal can leave a variable provider
installed after reset, including a case where the helper returns success.
It uses separate sed expressions for [active] and [paused], following
your portability feedback.

The second patch keeps quoted strings intact when applying a bootconfig.
Currently, repeated spaces can be collapsed and literal wildcard
characters can expand to filenames, changing the filter being installed.

Both were tested in temporary tracefs instances on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled. The individual
patch emails include the reproduction details.

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (2):
  tools/bootconfig: Preserve filters when resetting histogram triggers
  tools/bootconfig: Quote command strings when applying ftrace settings

 tools/bootconfig/scripts/bconf2ftrace.sh | 2 +-
 tools/bootconfig/scripts/ftrace.sh       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


base-commit: e28458ef30ad66ce7cd2299ec5ee8a8a016d67ff
-- 
2.53.0


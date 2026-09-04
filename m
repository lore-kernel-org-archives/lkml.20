Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824843F8B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520756; cv=none; b=Qo3hu25EkvFvrQJS8PduuQYl4cD3NrsxU+1719HaFbWLEo3D6KpQaaIexW6bNFdkTa3trdSSJa/7PWIMNJ64O61AWCyLadxSOwAQMIpAjwrei6bunkJ8cQHlkGBT+tMo5Eepy57Goq7Cw2rulJQ9aXqWJIn6v5QgwmlcFhFNO4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520756; c=relaxed/simple;
	bh=fPyQhwBryKptZWyJs7X93I997RoG0tDhkJEY8ITSfeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcvuFTv0/yDBjPhGLfgbb41k2zsuwhP5WhgVCu0tP57Br+Bc5KdQLrjoh1db2UeOcj06TLHiEvOKRWg3wvXsOwNWGYnr+5aUggKhPUvI3QfGN3Hz+L7JCtqTNSiCSSWLCRsINEN8f6T2vJAlpTuhzys1bFuxr27J/vAFtfVHlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTzUjrHb; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTzUjrHb"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso918483a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520755; x=1789125555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WisldUP/DmLdVhBMP2CPb5go7Arc7+dNtubHQi/dizk=;
        b=fTzUjrHbEUTMIFeUOcZCQ4r2CB3v/JZdkx0PJhpncUdLj50mobBr382e8OL+zD06lr
         WiLtpKrRo114v1leeDkrZ+wfNKSV1XDDp0ak/PyiIVOXq/bMmzN5H1sw5LBnHaBZkup+
         tX4ORMzCA1RUC/Z7hcco36JGITBlRl00ok854Z3IyccLC4ACxndPT/Jh62nmKZrYOk5m
         Wz3ZhJK0TtFWyC06DfvtsBkiDhz7cfntOPYyPCjHN2/qwrXFQPYyfw9haJxWfOvKENvd
         RgkHJHSAcSagh1vW7bpEM3hM9eTGpilwqTSvw315ErLy11f3eLCl1ZKYyMaKirXJ6ii+
         vS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520755; x=1789125555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WisldUP/DmLdVhBMP2CPb5go7Arc7+dNtubHQi/dizk=;
        b=BqvqZAqVog1vQC3VaNFzI+uZTrrFXiaStDA6WzZmBNzIBvq/8jKhXMdA2tvDHipVbn
         pKoxa2+AJ7Vkhp762RV1gljbGGgeXI++FF4wk3qJ0tzPk6BhKmdRvSWG3oRTfmd8P7eP
         HzAZaISoNnq7euy6PXGiWV7i70Jilz016KZdsMa0AyZ6Ai9FMuYQQ0vftQwmW7NrE6VX
         cQzpZyRgEzf2ZaM3EQ9AOroUndPUtIv9hCmG5q+SrgVdMacGy8NiFGrKH0VBJjIxB6xs
         dejnXqFvfEWmGyX2i+3MLcTdw1Ao8nIAsGlfMyWhjU8B4KTmKUcD0FuM5j+3KPvEyiwK
         77Wg==
X-Gm-Message-State: AFuF++ktysLZF1NrDX+tUXAhWN2413o0JiKuKe4jJKDJjiCnWaHuwZIm
	QrzUFqA+S92IErG4XqB00Zk49rerIRW3ud1GHRHJXzrDAVHr/BhpOv3KfKBroH8g2+U=
X-Gm-Gg: AYBFou2kFGZgapipGMPFCxC3bwH4DaQEJxHnixjQGqxM9gtEJatuev1vEEXq9RESMYn
	En3Ts/1t6+RUibgS+9iZRH9KoiXq4mPZuq67LsQKlQCUT9WI8CYVZpO/RlF1tdzfB4BEaFWEoBG
	CGtA5FOjRopAzDjg32dWm+5jSSpYLSzlE8oDuy3IacmTIHV3e1k5Y8xLBB/RTsMZgMM4JDcYXhh
	hqwm113zbaHzej94qsRRV/ogn03+QHJ3PJcekywPZ3l0VkYRu3hSZXeZTl2Jo2xR3Nv9ja4gplt
	vINcQXZ8+nDReFJeorD7QOq6BjkARj8nVmzqTIviosXHRAqN+O5+ybsni67tW4pf/poOKr6u7sL
	fwILlaAO63Lw801AJf5Mp0lkSkIz+uy3sBaJXU0shBctrxzbAoHR+jijUTtTFWC4rzQMx1dHM1q
	CQ2+ABRO8dJfg3Zlb+ThT3r4eGt/qqBBYEeAHJl6y+GjO75VqZsAnu25fbiX1qd3sINl8JLyrOI
	18hpZgUE3tfKrM=
X-Received: by 2002:a17:90b:5242:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39b08046aaamr14376924a91.14.1788520754846;
        Fri, 04 Sep 2026 04:19:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5190103eec.29.2026.09.04.04.19.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:19:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] input: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:49:06 +0530
Message-ID: <20260904111911.32224-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  input: fix typos in comments
  input: fix repeated words in comments

 drivers/input/keyboard/imx_keypad.c        | 2 +-
 drivers/input/keyboard/pxa27x_keypad.c     | 2 +-
 drivers/input/mouse/cyapa.c                | 2 +-
 drivers/input/mouse/elantech.h             | 2 +-
 drivers/input/rmi4/rmi_f54.c               | 2 +-
 drivers/input/serio/q40kbd.c               | 2 +-
 drivers/input/touchscreen/exc3000.c        | 2 +-
 drivers/input/touchscreen/usbtouchscreen.c | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1


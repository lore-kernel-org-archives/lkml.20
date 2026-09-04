Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D33A873D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521584; cv=none; b=SGAddqhZl6uQyUWr0HGyVx5VzgUJ9HBRqSy4Uv6wsZKPpN/YKFjFYLSSdS/hHNiQO8OLkPnga9N/4oXU8g3DFjNz+sv7afc1O8lsLkm8EG4JAePmljiupeyY+6MKTh5FB8UEnf8X0Eoh3t8bQaqLQkLOpXuyb5sEop41qDJ2Zi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521584; c=relaxed/simple;
	bh=3BRyvly5pUFo4GCgBbmpEzJVrzbTF3RDz+T352nRcTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZn84d8FB6uqjDQ8i1yLCmik+ZmukzeHuPrau/BH0dUGglmhQ2zLfk6QCRAA/FRL5VmpJX39qc4AxqYJWLTJxIZBCYhcjhuS/pgJA3reITuVQg3CEyvaC1BcWj/MRLTyhqwruEyWw5ucm8T6WCUY9GC6H+1RmTOZEcFIAX4otUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjH9bJr1; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjH9bJr1"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b13496112cso703011eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521582; x=1789126382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0AkRNmEDuV1SgJM7yTdphkz9gDGLCOhji8pZYUE4w4=;
        b=IjH9bJr1qvDZCmjXnY2XoFNk4LeQPyZftYgGcoWgf7MaVcFclacng1Nt+ubZt9O1by
         9LZF0vSVmb1KsH2IzGlDqvCcxNGJFZzxrjr64n1lMS7LNVHtOR5zofo9B5DtnB3IFBPb
         FgLVT7MPYKcG5h+fSusoGrM2axJwDyp8dXS1XrLF7ASzocGJk1xxQmIcoCBt5Hk+0/FK
         O8DTTp+GGm4LYhjBMlnCpx/Xn7Jj+lLgYJui15YSyEKDQORgA2320HmE88GCnzqUMlgh
         JjdoNdlGpLKRlkWkfISNnwDPFnv61cujxEZkBuk3IbrxmrOrR3XR277LclSP3CDceG/C
         fb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521582; x=1789126382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0AkRNmEDuV1SgJM7yTdphkz9gDGLCOhji8pZYUE4w4=;
        b=iWXBa1Iq7jAVX5/pPHCgmXIJP1o6wr9fAahO2CgIOTLtc63Z+XqJhAIb5wbJv2zIfq
         58TCwbyQMr7nGa6RmQPS550fG/QSXcyoaziPP8QEv7ZCEl+bvSj/ls9SfLUg00ZAhvOW
         UvmrZG/Glm6dZWULDoY9hoiCFiqhOK5Hn0wiIgie6nfTJHkX6NzbZB/ETqbIxnkmdvXu
         /bwEbSmPgK7ThhvE8n0aipWHINzYOQ3uqGxduljmhVXEmrmyFB2nPBGzO1fI/6V0vhmb
         Bhr0+18y2Lod9ngrxR54IeeHyE9y28GNUCLUP5Nqp4yfFhRmqzXr7oroTBu6HWQFl9QZ
         63Tw==
X-Gm-Message-State: AFuF++llo0XiWVwxZLnYz2JltZ2bCghIBfxO2jmvaaTBuHwPWBocjC9Z
	5QV7U5I+V9XO7JEH4Bai0EN2kyODjwsRzyWTFczyBGvG/uPBjTGIU3AWgKGLyJfSZJI=
X-Gm-Gg: AYBFou076SyyoUMZyXjDlBBOL/KbjAEb0XIa8Gj0LWePWbJUyWiECdVtT7miCx5udYE
	Gd4YzEkmQ+JQwXalQ3N32ORh1Q7z8ZC1dYebnhwvvc3urxyheRocCfiIsjhdhnyXCL6PdquKNWb
	NYzPwkSh6rvmluepkYVLxv82hjUy7ZCIKHxDxFg2dBmSTob/UI+lRUzSNzvg3cIpzZb3MHRh5kl
	w1IIF1SU6bRjacJbr6M+46l04y55KCHz3edSv9M+fPNZMteyMSizIntR1ZCywXzTELuPZMNn8SA
	iE1WiArtF1/Y6m/w5umq+zSAMMwT2qr/Ykk9x+AxBgXJ3oJZtp8j8jlO6hVJTebGO5sWNjIk43P
	alcSXoXrMRtOReFqodIvBlHj/hBU56gynhWUjkX6jIUiMPB/iCD+33fSbrAmX285wh4FCLO3KA6
	XWmeeEAgm4ScxmPJmkgYYlYBfbfzBTE9iOLj1xk/9JdvAfsv9iEII3atPt1wyTehl/OybtuGh/e
	gJTTN7lXLYfAo2cQzl25J5pB9Q=
X-Received: by 2002:a05:6820:81c9:b0:6b0:4d2c:1bf1 with SMTP id 006d021491bc7-6b6fb0d6007mr3782195eaf.11.1788521581994;
        Fri, 04 Sep 2026 04:33:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6469759eec.8.2026.09.04.04.33.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Documentation/core-api: fix typos in comments
Date: Fri,  4 Sep 2026 17:02:54 +0530
Message-ID: <20260904113257.13594-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

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
  Documentation/core-api: fix typo "maintainance" in comment
  tools/lib: fix typos in comments

 Documentation/core-api/housekeeping.rst | 2 +-
 tools/lib/python/kdoc/c_lex.py          | 2 +-
 tools/lib/python/kdoc/xforms_lists.py   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1


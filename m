Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81B4570FA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519926; cv=none; b=flBrE8umWhJHAFpcydgFHve3ma+lZj7ELvCrYF+qZztLaZ1oqhze4tkc+wowY1dEjHNetOeZYFQoYotc3JpI3YWONJjYH2buqNwskAgzW6SW8mwqn6hNQ3yWIzpDvz75oRV39YUeYZerd5+lNrItoabim3gNMLE6Lt0zaNiO34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519926; c=relaxed/simple;
	bh=uB0lDNXfeF9OHqYuAh1HYFdrSxZB4cmoKKs/Y/FQrHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gl5nIzHCDl358mXXsqTMox7yaVfN+tnGnI0uJL7yrsBHKeQXuRu9gS1cqvTD79u5PxH/zYOisrWsYnMOOulL0z8bHql4TUYYf3iM0Uhp4LrlfscVnDH+9cYJJY3AzoI/GuICK6eDryQ1qvdLUkGGz4rMFNFBLSBP7iJbUjw9AT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlC+nymf; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlC+nymf"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4a46a53abc9so884486b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519924; x=1789124724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=op3phjdySohZfJQpt5wPW4tgC5dPJYhrcjNgALHlzR4=;
        b=jlC+nymfZ29NB0wlXH1EjNLEynh3823tAFpk8mvug3nioEZCcxXNNKrOhX5DRXa4kY
         dpbCb9yacXuol/fldvPObMqL0aH+q3/mdsX97p/9lrhTMv/8dNB2O5dt1efA42HDk9dp
         cyKouS9ON2Rfn5qiIz4ws9O7GOlKeJLL0CCxPRQevOFsK3Y8vcM0xC734gRN9HGCrBhe
         dsLWgch7PA2jYwNDm8eQmyeYBbkIbbgcNSmt2TUgIjxuaPQK4Bx99SHzIdxfqLtqMv3O
         +xOA3MUyeBb34Lg9il0jB0iw2grQKrjKMvIPA8BkwujkBi3q0cmGrz9cyWXiDh5I9TuE
         l6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519924; x=1789124724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=op3phjdySohZfJQpt5wPW4tgC5dPJYhrcjNgALHlzR4=;
        b=T64bzkZpuojworYUffMkvNIt/8W2+LXa/CP2gPUGKGjcFZB7RgTxhQTQ2MjrI2VCbf
         uVgi0AJniWPZ5KBV1bDd8j0TJLeTD56YjcwDrya556xzdYmZQznbwGdpoKlBZtmDpMd0
         D9qW3Y/i0IwERXMOt0DbQD6Ts1dWb6cMwKVo/7/yaN8FQcloaVv2INtoFpa88+IPY7MD
         sSy5vq2BZaIyHorO6MINtgxbJnT2f70kQsByp0gJT/qTlEZyYGSUy4c8jRgc0ZI+ror2
         Vf44c1D8KPJ8HycCnhpAcJ31OVmIEHv/NXR+koUCayV7j1hvvZV53Z2l7cdgcrxKhIa2
         Ddeg==
X-Gm-Message-State: AFuF++nVAtUWmGx15Hqnc+kM/8S0hIE6kwRHRJbuGf3BaMHp+TU5rRmE
	VfKVg/tMCDoZhxkzDE1WNeYkRbz37xR7xIYvHziEmX3hjjuNh1PBEo09JDoU91F8SvE=
X-Gm-Gg: AYBFou1LFvn+zCFFLmSboea02S65kA4ra/LXXcCS9+I0LmwcDMgGElfN5tzVB3yvMXH
	c4muO7GW88cr3F14mbhzWDLUylReZPhOlRIMdPZv92FrXIen0b8E6+V6GXnyIY+MkB+dDpgcoHX
	qlLZ0MW84KpYHvk8BcdLChgehHjggpdsgADcXOW7eLXsNUf84idOnHRNgm9P8mvktyUqrXu3ehh
	vM5JJoASEc73vfwPbJ/gywYOjHp/2q1vN2pJG77YmHayT8sqhhCKW08qBPJvyEIjrcPXAY5Jcuw
	YYFd5eOLm4ObEMTBfnkyVWRLWa3Sia/bjKl+ZS4JNfQeWDZA/jSou6KssMCtW3v83bFpa2MQ+sf
	GUPmyn55HHKkLX5AUQz2ewqdmcK8czMwyVoyt/ZOQ1fVQ7spb0olo5HCp9Rk157blopUQtIoC0i
	64aHQGSMcPyBT1OrLZr/5z96Cp0IGYAypzvKm4C6TrA5a+hm+mTnBZdgPR3zKrdDOsSWs31dG/O
	NyN+uxUgeB9Ak8=
X-Received: by 2002:a05:6820:160a:b0:6b3:5a80:b32b with SMTP id 006d021491bc7-6b6fa4e04bdmr3786362eaf.3.1788519923945;
        Fri, 04 Sep 2026 04:05:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5220280eec.9.2026.09.04.04.05.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] net: fix typos in comments
Date: Fri,  4 Sep 2026 16:35:15 +0530
Message-ID: <20260904110519.15207-1-hemanth.selam@gmail.com>
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
  net: sunrpc: fix typo "miliseconds" in comment
  nfsd: fix typos in comments

 fs/nfsd/nfs4callback.c         | 2 +-
 fs/nfsd/nfsctl.c               | 2 +-
 net/sunrpc/auth_gss/auth_gss.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1


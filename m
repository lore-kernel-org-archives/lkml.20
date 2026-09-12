Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381A29D288
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242948; cv=none; b=AguEAVPl9053j/qjYt7r9qCKjjReGAAxnoY+xFIh8IiQtBpmHokWw9G07qOKFTcygOxJAtUQF/l2jqviMJ2tR211ZRV5I2pfsIBnECp+gfmMyDPpg2bKs31u1e4ZZdHhajZ54Nqmukw8tGgKXsBZXQOf/b8LBOhk+DI6gpm7Zr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242948; c=relaxed/simple;
	bh=SVClYd+7ea+Qkjn0gT6hYJyaUgyVmTEqLlR7g57fIu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cb25NhRqyi4LkGD2shcTK09urVfa92yWDgNH7YgV4j+AeefEHDGB40PjuyEWZZRejyYMnMaO8z+bgoXng8t5A4cmItWty7dHxhg37vXB60aCZ5V3hR2vx8d6MnQ9s44FihF6JeJZ7XLQbl5QBeDZyvqM6y58cb09j60+dy8S2e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVc9gQK3; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVc9gQK3"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcbso6965677b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242945; x=1789847745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IwFDO8UVJp+G6fJLERJAB4ELtanHIQkmCRixCWeWgXo=;
        b=TVc9gQK3szzMzJ2YmKUZBBQspY9pZZyTeTCM3/+9z7W/rJE5d80zash0UQjQ3+R0va
         5Ya/B56siB2aRMHgVGXXQcAUlOziiVa8QO+Mg5DWPKfUs0ZrFsvD1PzjTeWbveIYZriy
         A85Iyah0N5y4qH23urO7Jkj2UGsMy9834dmOq5cuAgxRtenOSgVq6/79H/ui+dEe+JOm
         cOU+Il4yLNYymjgebpFwG0o0dHlSKuIRY3r4hbj8p89Ak1F9UzJuApmvqed1fLjekz6x
         kXgP51bdYNvLrWYOHoe+l/ueywJdWPGpTlMJ+OqIo+VRYzv6U++r7c4MJ6+Q+oMGx0Rj
         DL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242946; x=1789847746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IwFDO8UVJp+G6fJLERJAB4ELtanHIQkmCRixCWeWgXo=;
        b=IwUPzBQUeywQg9hFyn0gVD0lKkIMGGv2RUoAZTE0oWbjpXllLvvNwtowV0xL3pO9+B
         OK84Byk7TysW9axt6iJknt8ALzVT+RJvAqwps3XOMRNi9k3NgKAdRbwkjJLMqvHug9mU
         sVlejNd/tKJPRjuzi4wO/vtWiGdCH64hcozD3YQFqlropg4+cmatgKzkDxcjmHj+FWI5
         y8dapbWcF+ktY+wGAMyEuNVSYNqDTpoZQ8kDVV3roj3fPVo/iA4Wa0hafV8zNwTFlj6x
         wxp+ZEG2ciVcJgBGjqm3dGXYdW1gACsAfm2GUZ3kzgrTil7biiIQ36uiFZqg2fLHRbC1
         PwyA==
X-Gm-Message-State: AFuF++n85VCY+5ws9JOAtOeLVmL4VHFtXaaAjHn0cCRLDA3M9z/83Fsj
	/5F9RjeQph306rVCvq8mCu+R0A89XW8wx6UcsX0Rlr3iXV3iQ80xCwI258++qP/P
X-Gm-Gg: AYBFou0koRjn8fAdFxLPS+1mY7BE95WHu3e0COGU1mKKS4HOipbFCUQtZ2r6V0VL+gP
	iRXS5HyVqZ0FaJleM79tyaAyonIwX7k2lh7bvxZ4bhFCZQoBJjX1Masr2Ya6EG1HzcRbOx4v8PE
	b9IRsEYettKlLoHxQEo1MGaqcn0JU4jKlxcmVp8sE26MBup21hR5dtjRdj7RMaArVKbaYeDCGh0
	zAGAzk1BoqglofkjvmpO39fVZrakszqtE+PFXlaiIlqAiHDZL/QGhwGSs4ZEmt/TVpB80P896+S
	/4laFbYF979cnQMc8c/ABjx7G4cWDrb6XtIfGRwBv5LPeilW/anWHAQGgz0XbvyYZhBWz869f/Z
	htv3m4kaZwfwH9uosAmIWo3pbyGAZG9mYPbaT4ZMIxEX/t9KryRIE4X30z94+sX05RLCy7tGCM7
	aSpFoJd5LApoug5/TsS0Dx+b5Rb+7r6exqDuaZFvTDPHi0QnsnOjFzy9LLiUk5f/0euvTScaY=
X-Received: by 2002:a05:690c:d8f:b0:816:b469:ccec with SMTP id 00721157ae682-884b08b6b3cmr45087267b3.15.1789242945467;
        Sat, 12 Sep 2026 12:55:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488e28d38sm22394187b3.43.2026.09.12.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/3] alpha: self-extracting compressed kernel images
Date: Sat, 12 Sep 2026 15:55:42 -0400
Message-Id: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWw5AMBAAryL7bZMq6nEV8VFs2aCkTUQivbvyO
 ZnMPODJMXlokwccXez5sBGyNIFx0XYm5CkySCGVaDKJejsXjSs5SxuOx3468l+EUhS5qYUyQ1V
 CzKMwfP/rrg/hBUamRJ5qAAAA
X-Change-ID: 20260912-alpha-kernel-compression-2043f806fb75
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=SVClYd+7ea+Qkjn0gT6hYJyaUgyVmTEqLlR7g57fIu4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrOb6SvHxOF89c+qlf/XLPhzXWNlAu+qc7UrFnrYV
 Uu6qR690PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXfHvB8M9+mti7Cm
 1my2Cll0KTLnyWlGlbe3fm85ATsawbCpfZqDcwMiwQ5v8VKfc+O8czs7G+umWWg8hn176Jjnym/
 3gClj/T4wcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha is the last architecture whose boot loader decompresses the kernel
itself: aboot carries its own inflate code, so vmlinux.gz has always
been plain gzip, and adding a compression format meant writing a
decompressor for aboot as well as for the kernel.

Build a self-extracting image instead, a small ELF stub with the
compressed vmlinux linked in, which aboot loads and enters like any
other kernel. The compression format then becomes an ordinary kernel
Kconfig choice, and all seven formats become available: xz gives the
smallest image, 5547496 bytes against 7677280 for the equivalent gzip
one. The build now emits arch/alpha/boot/vmlinuz, since the image is no
longer gzip data.

The SRM netboot path (bootpz.c) has its own boot protocol and keeps
using gzip.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (3):
      xz: add arch-specific tuning for alpha
      alpha: add self-extracting compressed kernel boot stub
      alpha: support the remaining kernel compression formats

 arch/alpha/Kconfig                       |   7 ++
 arch/alpha/Makefile                      |   6 +-
 arch/alpha/boot/.gitignore               |   2 +
 arch/alpha/boot/Makefile                 |  16 ++-
 arch/alpha/boot/compressed/.gitignore    |   3 +
 arch/alpha/boot/compressed/Makefile      |  63 ++++++++++
 arch/alpha/boot/compressed/head.S        |  36 ++++++
 arch/alpha/boot/compressed/misc.c        | 209 +++++++++++++++++++++++++++++++
 arch/alpha/boot/compressed/trampoline.S  |  46 +++++++
 arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++
 arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
 scripts/xz_wrap.sh                       |   5 +
 12 files changed, 478 insertions(+), 8 deletions(-)
---
base-commit: 4407825b2f96b0e48a4bd08ab196b50a30eb3aef
change-id: 20260912-alpha-kernel-compression-2043f806fb75

Best regards,
-- 
Matt Turner <mattst88@gmail.com>


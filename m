Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820A13CB8F1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439353; cv=none; b=Ipf0YxGuspC36cicU7zz4cKacJqqcuxMYD5UXfFdM+8Yl3bJTEb+peP4/ps2q1w3WnAm0hfRXNY4kDAjxDQF9cQTjDSsIELpqwePmEyicrzgNG7tVCW37B8rWCWraB3c/+4G3olJPmbNjgeBVJERt4XyNbQJLXmGfkvnJNkrEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439353; c=relaxed/simple;
	bh=9HTDFgh78Fe2GyC0xWcWnW7NoLWn6ZeHtv+E3f+HaN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTF/N0EtwOqE2cHNczEt/OQI5jFT6IS52PnXx1a2gmTYVbu29up3zFywi49usUPsYfHU6kg0NLSXj8rLemGL5e0BbVsFCvCxur3YrnfK3tE24tLf44sXW28btZRcNVljz33BCeiRbScibNXm7Fgz113MQuEhgxc10AyZfS/FWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4lwo2ef; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4lwo2ef"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90ceab90152so38467336d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439350; x=1790044150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+JbY0VAboTvC1W+pbgoHzATtoYfEqLTAWX+x7DyMb8=;
        b=E4lwo2efrDzfW7p3Amfmlb7ZM7XPdjo+OW9J4ZHNGZEVCuWOZCNSlWptUFVNPgTnPp
         wrM6Y/DCElHTHdqrJOfZOs+2JZIfpUiNZwNzKHZAeEt+cuGOkctkVVbS72dfYRqcCO/m
         oVd9plYMVnwOc0Z4++QJsR8RFGV3tiE7RelFtKlcBhjKGZGjxxIFc/U4SzRO3H6EOXJV
         h38JdwdHhgf+CKx6xaV+AoQzN4L3e0jSnIp7SbOtXj6mWaoFhTu/nbxez0l1pL1CfbiI
         i4amPK6vLaQTb9GtGxjfGV3PlzRHUzwhmNdVhyryu7ko5LeLxVSYX5W1tH2jMDjAOYaE
         a2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439350; x=1790044150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+JbY0VAboTvC1W+pbgoHzATtoYfEqLTAWX+x7DyMb8=;
        b=gatcjH74ZQ48qVpHnJsziVvn7Qg5J5HA9Qy80ouq8dOZKLEeqqL9kCjRry5XWet4q1
         9IQJ8Nr/BwQg6bTP5nQ6of7SggG74JUHpNZIyxwsAUxXYN9g2Ap44P5V7dmobItiWLj2
         EK+nh2m/lEKyCna4g7DvyYa2+bH3MeTN+Y/Qsvhppn3NZMe4kdc5C9uq84DSjiL55Tx+
         b0TdwzvYldAKg+0Gw/fFK4TlylwAFtw6on8XgvaOn2lrDxeUAkLpAm7k69EAtbrzN/Wz
         SkV2OZs3mY2KKv8uWC7Abvpwu3fzuBRqPFa1umm1o/Iy64UFgb5rlo8NeJinARwd8Hzm
         xJOg==
X-Forwarded-Encrypted: i=1; AKwUvBwT5ihRAFGQ/jfzAVKdxhDlRjN+LGlpI/HFU1Bj+hI9giYwN7z09N73/bjjFIsBhVPNW0dvsBCJ3gLDejM=@vger.kernel.org
X-Gm-Message-State: AFuF++mvUoDM+upwhfORtLvthONZIYtfp04SPvhs2sQ3Sc/13AJVrhVQ
	c3FMM34yD62JIldQAx83ybHIpRY+srQX0HxxqyIx4BWc5AmUWvmbHiH+
X-Gm-Gg: AYBFou2yEVlJuakVNeTsX4cLw1I3goJ2a7JA3zzCSMEnbUne2LBHZYZU7xhXh4eknVW
	8l881wdn2M7EE2q7H5Pg1ClQeKsbmtKUrLY6KlBpPX/nuMI2QPb4Z5E/5bA9sfqFrNoXWrk4N2m
	BOwWCX1oxvMx/JULrlV4bLIDshS6Vp48tPRkCbv76qU7HjDw3fQZ/V/Ql/YR269lqwK511kyjYo
	lFDVOCqKAH+hm7VrH2j7XI56zI3N2m+bPQ1HSAraqfIQ0zzLXoJYGYr6TQp3hQojPXV1CqNjPTK
	YE65Gg8qdd0MVfW4TUtZIFTGrDFnLFZk59Lqv9k+d78RjsCiOhIDqTTaie+6e3BmHQnU0F5BPB0
	UbO79PvJ2xuiiFYnFIPv52TWGVGQKILQyocOa2Ibcfl+WEKUN1Lmd7nQlniKH7dVrdRLa1kKac+
	A0SFSNcSU6hGLTbeyo6Ie2cVGRkhFJzkDFA7w/CQ6VCb94G1kIoqBahbzfWxdoKgvGsA==
X-Received: by 2002:a05:6214:2f10:b0:910:3156:1639 with SMTP id 6a1803df08f44-9122e54f416mr95104606d6.28.1789439350417;
        Mon, 14 Sep 2026 19:29:10 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a4fb3e4sm90358906d6.24.2026.09.14.19.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:29:09 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next v2 0/2] bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc JITs
Date: Mon, 14 Sep 2026 22:29:03 -0400
Message-ID: <20260915022905.1535566-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parisc BPF JITs emit unsigned divide and remainder for signed
BPF_DIV and BPF_MOD (off == 1), so neither implements signed BPF_SDIV
and BPF_SMOD. Negative operands therefore produce unsigned results.

Patch 1 adds signed support to the parisc64 JIT and shared signed
64-bit helpers. Patch 2 adds support to the parisc32 JIT, using those
helpers for ALU64 and the signed millicode routines for ALU32.

The original series was tested with test_bpf under QEMU on both JITs:
the signed division and remainder cases fail before and pass after.
Helge has also tested the series on physical machines and QEMU.
For this rebase, both JITs and test_bpf.o build with W=1. The source
changes are unchanged from v1; no new runtime run is claimed for v2.

Changes in v2:
- Rebase on current bpf-next; no code changes.
- Add Helge's Acked-by and Tested-by to both patches.

v1: https://lore.kernel.org/bpf/20260717190544.257306-1-main.kalliope@gmail.com/

Nicholas Dudar (2):
  bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc64 JIT
  bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc32 JIT

 arch/parisc/net/bpf_jit.h        |  2 ++
 arch/parisc/net/bpf_jit_comp32.c | 29 +++++++++++++++++---------
 arch/parisc/net/bpf_jit_comp64.c | 35 ++++++++++++++++++++++++--------
 arch/parisc/net/bpf_jit_core.c   | 14 +++++++++++++
 4 files changed, 61 insertions(+), 19 deletions(-)


base-commit: 5ef40d69b38a93bc9951dadb1a15c85c597e1a40

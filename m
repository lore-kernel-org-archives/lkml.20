Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717872;
	b=IiIKMr1o0uo82kB7D3eHG3BtoFvuiZTtG8C9psEJISAd8BsEFXX+4jZGFG9BUmz0Xcor
	 RhRciMtSWOFQ19DiAh/EfKgGU5mPKf+UO6hlU0/HfiwvX4h8mE8xzo5MBZomU36xo0wI0
	 dqeGr73fuiJN2b4jXNNa3NOWT9x2P7Z+OKAfmkXWStgXdfzS0rPS4qboZhvR+mnBefEJf
	 Ea3fdz/TPcsh6Vh8nstnTbl5lfj6NdFww77Di0EDGuqspxUcZ+lj03FJyHCrggrSTfAAJ
	 D6rVlSFtzkIKQfZ7xUPTdPgbAunk4lXwHizCZrufqOR5B18CTLiawXVD4vze9V6Do2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
	b=P4oewo6iFi7P3PS4QvFBR4fUJkYDLhaBwsmBVjuGZ68r53uP4lviHdZRFub5Gw62XUOm
	 rsRsTrFbt6z3Q9uzUp9JmIymBYLWeMuGFFjNZuRRZ1dMDYoqKPP9kU/J+bOeZAthAUZwb
	 W68nhziTZ0Q//Cfs76T5JX67XoXhbTo1YCdPpcNoUo9UIk+Bxe6d0LsS8kVMCLWcUsZcX
	 nzuIVaSxZ9dpuluKNI8yK56RJ/ZVn6M/6yI+DFBOdMnnVXPjdKABiqqRailTQgN0WKNEC
	 oxIBsWdWiecXp4Js3unLSPZUvbdsmyyoEAw3xe9jxDaebfvnnohWWeY7hwpudS96PuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6WV1j5x;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57588606BA23
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57588606BA23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6WV1j5x
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so6457584a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717870; x=1794322670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
        b=p6WV1j5xXG874wk7PArFP5ZRw4LM9P09fLU8fWNlvZNYsq6XeAmVW+axCc7BtE334Q
         OLYWFYNZHOeXzV42UcwdRCoa87g2vb1tbBgTpbUGK1GyzD1MzRv7By7b4ET93hkze+1X
         hWaAArnpALLpnihpMF53D8I7MR/Gu4mzaE5FgnJp2nfTWuRwTk0O7VE2qa6vTu/WR0ep
         kM5s/s1XbhhW4QrB6/NsxlZGJYoJdhye6EzfYDEd8hAMBHrJgLXLdMkhwSU2OPQgdpZ8
         RG2FvIWbDQmPS2kP2Vj52O9VhjSuNSZ1mpbotFjn6Kw9g1RdCaXFrdGOjAQzwfMGqo0L
         WA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717870; x=1794322670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYV20rPrJp1IkxIFXdFHHE13njY6A8crxl8/hatCo5E=;
        b=zEiZGDD2n5H7MfHhzFxIIK+KhqFeMjfmH8pX+xyhIimanbGok9XdxkSKdMplM0c3bg
         uBwEySQ1jvIAdUQ13DGGl+ZKhaOhSJLUpczUaAsYr6LW+Y4z6P2Pm7YBQa0BCPMQC/5E
         6u590rFwNpIwKKp8Kl9/vUETpRv5D+CmCPYVd7KrvSvqKPJEQwuH/UF2/r8W6DjQXsW7
         Dz6ciGfDr6obMCFNdfQobGdcI9kE4d6RcKh386iXkuXpOoLzfN1tgVCYmAYZCbOneQVB
         yvuFwE4lkbfSfjobfNipGIckHJkIUWONqrP5ZbT6ivp/vj/9eHkWyEvjgqDWgPBeECj7
         cZLA==
X-Forwarded-Encrypted: i=1; AKwUvByBdhlPltuN+J+209dQGkR/R1CePG0AfGxSSRIETX2UGLTKNOV56drTqEmHKawnp9J6IqGXso+CjPO03GY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MbmlMU88BJb8Y7r3nIiCpABjc+3W+nIeIQ8RfRttQy5z1XiZ7
	l+TSYnTN0756b3nptGUpRgBU4NEiWhLRSY47GWATSf/Dm4QlY4BTpFNy
X-Gm-Gg: AYBFou19OX4e0pTT3XeMMipVq/NjdSFJiOfy8DUcQxGaDzEcZ22zp06yTTdljy/2W8p
	yMPlcAEiVrlVjgX3rvafz/8bu1M0LcVVfGRT2hjBjHQxTNu6AfKYhh5VRCUBK9Xcd3YPVPV0r9K
	XcGVJckJ96QNr5sgsa0B0RbqeZEZfhadpod0Exour8NhZ1Yt0znvmXpLEXXy8ywLAiyAP6KwnCs
	6v+RyCAc2JYO9cRij6CjvqHO9w4/iVAHBo8tUf9f5eFS3x4WNizmnCiIWY2OIKB7o5/MhLcA+Gb
	tSCqRpMhshCsG4CK/ZtqfUePKwwbi09jZ/4p7SkZMX4S5R+repQ/nkcW8tYruVZbXVF0me6mlqG
	om+1ygRHlK6whNRWkFjgeslODjkgLn5cpsm/YR8tGq2fRDmvGXDXmqAwK26UoCBcua83qrkm/ec
	AeR0YWcucCSzPMX0NB64X9OoUpmsaT2xiI/qGHhxKWG/ZIogy1gOLu7TQ+oinMCYWPSvj6UNi6Z
	cPFyOKh16pGUbJgv/+r/pILLyjVdi/84yLmJYmdn7pvROr66CIElNut1MnDRE7FuvAkKZ31eRPC
	7dlfx04jzyO705/1RAKQsLRGcSl7ohOKy0Vdjhl8IvJHsNsVLF966n/DPkxjgK9ZSf/yzZmvAU5
	+lOhbeSTJYMGHA9hROi5MWEsv7I4RvTTnbaS0Dv+Zyenq/WwmbB/m9+FCU5UIG3T5gqTG7xmTFA
	gbFylvbiY4dKfNUzS6kV/LEDV2ZAydt33oZRwj4JpY3Ke9UXIn6Q==
X-Received: by 2002:a17:907:7f90:b0:c49:bc1f:fe2d with SMTP id a640c23a62f3a-c4ca7a858f3mr1272502166b.28.1793717870207;
        Tue, 03 Nov 2026 06:57:50 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec78f3sm93656366b.23.2026.11.03.06.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:57:49 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v2 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Tue,  3 Nov 2026 15:57:41 +0100
Message-ID: <cover.1793715774.git.krystianmkaniewski@gmail.com>
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

Hi Tejun, Ian,

This is a narrow replacement for the earlier kernfs serialization and
autofs changes. It follows the suggestion to refuse splice only on files
whose write callback can look up arbitrary paths and to give those opens
separate lockdep classes.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A normal
write to /sys/power/resume records of->mutex before the autofs pipe locks
when resume_store() resolves a relative path.

Patch 1 adds SYSFS_LOOKUP and kernfs_ops->may_lookup. Writable opens of a
marked file refuse both splice directions. Their of->mutex and seq_file lock
use separate classes. Read-only opens retain splice support.

The new property cannot be combined with mmap or preallocated buffers.
Kernfs rejects those combinations for direct callers, and sysfs rejects
SYSFS_LOOKUP together with SYSFS_PREALLOC before selecting operations.
Binary attributes do not support SYSFS_LOOKUP and reject it at creation.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs.

Other stores also look up paths. They remain outside this minimal series and
can be marked in follow-up patches after the interface is accepted.

Tested on v7.4-rc1 in a QEMU guest with the syzbot kernel config.
Without the series, the C and syz reproducers trigger the reported
lockdep cycle, and a splice from the autofs daemon pipe into
/sys/power/resume deadlocks. With the series, neither reproducer
triggers a lockdep report although autofs receives the same requests,
and that splice fails with EINVAL. Plain reads and writes of
/sys/power/resume, read-only splice and splice on other sysfs and
cgroup files work as before.

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: refuse splice on writable files that look up paths
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 54 +++++++++++++++++++++++++++++++++++++---
 fs/sysfs/file.c          | 29 +++++++++++++++++++++
 fs/sysfs/group.c         | 12 +++++++--
 include/linux/kernfs.h   | 10 ++++++++
 include/linux/sysfs.h    | 22 +++++++++++-----
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 118 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F828373BE0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618168; cv=none; b=S0pQJHmBsQiegq29+wRQnYyVNQGyu+5mjkRwNQvotS9UmUuc8ampoHE2SZq8/ANOpp1qee2v98RUPeo7RLC9ugAzYU9vMeu5AxhGdFL54PYAkvS3XMU8u2Sff1JWTmyxR1U7ZhjLuNh1tvPYaX9kBKwmwvIBzv/mKz+lAkeCPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618168; c=relaxed/simple;
	bh=qHuvSTbzKTQ99mPQxhPgubTCtOl/pceEwTRUqIC9LiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQwjCBShYsiorLlyTJrqh++4Q9USRlNmY9RCgwxS4HiQ9whMugA0n+ZwZvThI06pjL2N+qc2UhBSv6V1mlOlFU67Jw3DU+UFYlCQgA/lsK9vCW5Gza3TCYZzKR3y7zgYNMDEjGGWNaoxnV/3qLLJ1mjIWxFPPiQFIp7+m5HDBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AMSyqTvg; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AMSyqTvg"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93a40a9a01aso10358085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618166; x=1791222966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KmmJxySPwG38CbqK+KUDBFApZhpWarF4JpRDp51PqIc=;
        b=j45L6NIrMaR1Osb5vnzGceYWBjqEBI0sz79DDYsQRJJxdWDID5Nsuks/Q8ODjKAQ2a
         33PwGp+T+eqmKSFn2rcJfzJ/hTn9/SdYNhkJOC+qDlVd1oJSgdoMaiKM13suk7QxGeN0
         /KSYqat0sS29QpOLHmO7tY13md7Yyj4o2ICimpS0DhnrAdXARO3fZsB07FFswBX4guhE
         z+q50Bmdq5n/2CU2gTWNLHC926g+a6oeBmGDgDKL7N0vU/xY2pRW/Cuvs1V3ZLxxIZPH
         Oeu5iCozMAWn6XvV4/wYKEyhJXPW5wZ79sBRaOm8Dj3CWSHRCoe3jsVTTkAvHygeMGNw
         xOZw==
X-Forwarded-Encrypted: i=1; AKwUvBzhTAs2zf96MHAlmBFhf5ij2fBewb/GJ18Mi4Zkab3ivVbv0GLIGGJVBYBWRkcrigqS0RNWbOyaWOQ8ddw=@vger.kernel.org
X-Gm-Message-State: AFuF++lGLr7/G548CNq4ahGUSS9v6GZ067saeuIDYgesjOD2V4Gm0gTK
	6df5Fmq3tnO6NC4m+0UHUiKR6RLh1fM7fgUbOklxvuKDcbvz2HTtB+DODggCaXgLy7aI6+gHN1s
	gbGx75Kk08HfzRYWkDnJ71k8OZF35cdOkbZX0dZWDCjRGJ+t/5PGMB+kTDnFTHqPRy9YE8pmyGU
	yGIFiBDtamONpV++AUGdHilvxjur5K6cB3+WqS2LEB0QZCVzkP42HjZ2UQiuXzN5S3PVFWh0k1N
	lPbEo1jGekBO83x
X-Gm-Gg: AYBFou2jy4Qz35TcQWYHk51Syno7mX8cIYLaL46c7TUVAvtdenN7B0Rfl0JGUEFOmCo
	mYWp3Wlm7ynZyBCqCUjoq6BGOn6I4klCcRRhBQbfv29dR4h4HBrD1mNyfBtU2z6ZnD8vwdJb+lM
	kViQixQh6Ea7uc/UmymrxfBGhdlYGC6u0+twXU6o88fs0hrazdWShKrZ5SIYelFqieOjXkYbCuT
	dCStYx2UlQ7523O7s/q7IzSq74FaUSf/zsIQdhrlG/ZQs7DbEJLMEdRv5gtrWQrsX/rKawhDp8y
	qLGFLzuYJmYdMzGUaVgECCbepcDrIpL4yC2RW/MAicW97QeQ+i0i/0c+uNaSZD/7hfByCj1Br/+
	p/XTilhbmq+2acGmUD1moAsuHINSv4ydUQhVIjTQIxPRlMZ8x8Qq8eZzgcvcYBJMpHjna3wtB+i
	a8yOtS/+JW59R5UunTXderdmqXZvfyrbeg
X-Received: by 2002:a05:620a:240f:10b0:93c:58bb:7214 with SMTP id af79cd13be357-93c8be4fa31mr20760085a.31.1790618160601;
        Mon, 28 Sep 2026 10:56:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93c813fb37esm65496985a.7.2026.09.28.10.56.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342b66c0b06so119070eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618159; x=1791222959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmmJxySPwG38CbqK+KUDBFApZhpWarF4JpRDp51PqIc=;
        b=AMSyqTvg7YOAaOo4sIAY0pcRYwHSW0cH09GjKbqzO4apiMMUre94O+4j1U12+P2RKc
         thNFz4BDgQu1JWPb2Prmfj0x/3+gp1f5TNhwJdRBccsEH9Kg8d61iKzddQPkLXzvvA2Y
         czPVjFz5/L4SBh9PoEC0hHpQAKBZzbU0jsBOo=
X-Forwarded-Encrypted: i=1; AKwUvBxzVz9PVlT6Wen3WeWA491SttGtwWRDd2KW21vTd1bB9IZyKT+ZuVahnncK4Z+qdallQ5m8Wn0gL0Nedmg=@vger.kernel.org
X-Received: by 2002:a05:7022:ff49:b0:13c:e1e2:fc86 with SMTP id a92af1059eb24-14b2d993e47mr201600c88.4.1790618159196;
        Mon, 28 Sep 2026 10:55:59 -0700 (PDT)
X-Received: by 2002:a05:7022:ff49:b0:13c:e1e2:fc86 with SMTP id a92af1059eb24-14b2d993e47mr201547c88.4.1790618158548;
        Mon, 28 Sep 2026 10:55:58 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:55:57 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 0/6] panic, x86/vmware: Preserve crash logs before kdump
Date: Mon, 28 Sep 2026 13:55:34 -0400
Message-ID: <cover.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A VMware guest may have no persistent storage or working userspace after
a crash. Preserve its newest kernel log tail in the host's vmware.log
before entering kdump, without enabling every panic notifier by default.

Following Petr's suggestion, add one generic panic_pre_kdump_list with
VMware as its first client. A set-once helper covers panic() and direct
crash-kexec entry. Fatal oopses can reach kdump without calling panic(),
so patch 2 adds that call after capturing the original registers under
the existing kexec lock. The late panic call follows sys_info() and
precedes the kmsg dumpers.

Patch 3 adds Guilherme's suggested escape hatch for debugging kdump
failures involving early callbacks. With panic_pre_kdump_postpone set,
the list runs before kdump only when crash_kexec_post_notifiers is also
set. This can omit hypervisor crash handling as well as diagnostics.
The late panic call remains eligible. This policy is a separate patch;
I can omit patch 3 if it is not wanted.

The logger preallocates an 8 KiB buffer and bounds its register-based
RPC transfer and retries. Michael suggested increasing the buffer
because 4 KiB can omit useful stack-trace context. Ordinary guests
enable logging by default; encrypted guests must opt in. Use
bool/proc_dobool for the sysctl as Joel requested. The potentially
terminating REPORTGUESTCRASH event remains a separate late dumper,
suppressed whenever a crash image is loaded. The v1 assignment to
crash_kexec_post_notifiers is dropped.

Tested on VMware Workstation and ESXi with ordinary guests, and on
ESXi with SEV-SNP and TDX guests.

v1:
https://lore.kernel.org/r/cover.1788414671.git.zack.rusin@broadcom.com

Zack Rusin (6):
  panic: Add a notifier chain for pre-kdump callbacks
  crash: Notify pre-kdump callbacks before switching kernels
  panic: Allow postponing pre-kdump notifiers
  x86/vmware: Add a bounded pre-kdump log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers

 .../admin-guide/kernel-parameters.txt         |  14 +
 Documentation/admin-guide/sysctl/kernel.rst   |  20 ++
 arch/x86/include/asm/vmware.h                 |   2 +
 arch/x86/kernel/cpu/vmware.c                  | 250 ++++++++++++++++++
 include/linux/panic_notifier.h                |   4 +
 kernel/crash_core.c                           |   3 +
 kernel/panic.c                                |  28 ++
 7 files changed, 321 insertions(+)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780

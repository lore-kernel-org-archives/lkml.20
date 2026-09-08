Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27654596513
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891186; cv=none; b=rfjepcLgh/w/IjsFOWaAu1l2d4UETXsI+8+F4Vo4oA/a0xUAluiWUYNkUXFPY3E05FpWzMAMRsXmPyEuGRXltKNgIcP18UwMSULODYL1iHoKak4EHBHCHuwrof7ds8jeWfNBSGKyVNgaJn+OEnYf5eGlTfYHUOMQtzUkOnyz5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891186; c=relaxed/simple;
	bh=aVct0QQQt2YqktuHDZgb/IGehlIFoCNOWmk87ahbsdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A3bnhdWh3Z8LPX4Q3Nv4SOgXcEaNJW5xFM5IIrnU/aetNQbg8FE63W+FXni3FuPCqDLyOFaFkP2BdjF/hifrHy9DoCQBhhjFn+uBiHKr7glBG7tHBKVdx6RQz3GvofLdm2+WE8lSUeut4z+USlG3rkXvFswyEFGpPRGXZCF6Noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gmU1lIrW; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gmU1lIrW"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-97ca74bd6e0so1123588241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891184; x=1789495984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r+VLJNR2ClH5aaw8GL8jeSbQjtC7qAwKNhxP9YK5biY=;
        b=n6IdLpCXu/qbuAkQevFaQMGhgOlM23cNoPfVfJBdjPVjsbootShcrCFEM4N7lT1gq4
         KSLLLSf7vJZUWea/7JLQIF717sJVS+DOX4V/IXnPf5CEsXTUREsI8gAnYKd0/QQG1wKD
         PhhJ9W4WyiRwMkvsAA+uh2bmEljYQ9VkFhWzcGc/Ee+3bahcYvQ3IaVfZUbzlqjVn/Ga
         LGYnwWpYmYhwmlgHwgvAg5UvYtjzY3I5GyYDWvcvGOy+3nKe8YFrFQUax7U+8GRc+pXf
         /sMvrrOjfVE+BGiLE7NlwKxDD4fSsNZs6siKfiCnWnr7Eca232RKQrhaIsE99VlaIoJk
         fVNA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ybOoyzLoiMmmLGpLw7SXZC5H7BIAJi8i7QT8ICMcfPlw5t11YiivpFkWVFTWHzhw3OCvfvRMcHh/5Bg=@vger.kernel.org
X-Gm-Message-State: AFuF++nkt1nCZU9PyzFrIXBE29Nv3PBJAC2YtnsQRR71rQY3AIInouk9
	4tm2siVsHKHKqurpDhgqA5joFiVavx9eZwwG69A5zDsVo5VEjZfVyw4WvRIeDXiob4PD5treOTj
	rCrF4/JgX0FO4y9i7aFx1e9IfhHvG5Elao3NxS4L3u2V4DyO+QKlSOMKDG7z9glHvB3WaJxftWG
	sVyyl4ogKF58bPhsy/uPzarKeWnbBXto98XepYkOr7eDEI0Qt/t8a9f9xi64Hp4GBzTdsxbKiIT
	okcD/3/bF0DRWFD
X-Gm-Gg: AYBFou2k0iSYZYvyG1p62u569SssHO82IilohBBU5mOiMtaoy2L+LjE4qIAwD31tM08
	IWCmay6cBIIf2C7kzQnEJEWXybn81eOsQG6yQTCxQdpPYdgYnm2O535j6u+bFlMD1AfbJFC9ZH2
	KIByjO2U8Ms7HIQIf7caDM0fjHHjzH4YeUSfn18Esql0K/zl9XLq2qLJ/xIVrf7+SEASiy1LP+o
	PLLs82lFmwpvipSXZAXvX2KEmY90SIDYv6gKGpegrcHB4GOY0M9tEgI3CAiwfqHwAaCeFHR/P6M
	wRTT7GV81ZwxGs5ccQQv6G5jFEmIeCK3qJv1/j+dUAtwrBNRdKqq4Fll1h6jtzZjOmSLQtoo0qf
	ABvJhrIeRgSSOD3p0+crAbMK+WgDMist7R2vWl6obqpbZlq+jhy35r8/lj2GIAlqH9UaQ9oL0Nu
	VQkw9MOv/GT85VCZnIP6rv0iakOGBl2w==
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr11601900137.8.1788891183849;
        Tue, 08 Sep 2026 11:13:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-78a6afc494asm196928137.19.2026.09.08.11.13.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:13:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d9952a5so6038692b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788891183; x=1789495983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+VLJNR2ClH5aaw8GL8jeSbQjtC7qAwKNhxP9YK5biY=;
        b=gmU1lIrWWJJ98XKPjHVzrMvqWQRnXcTiEFlSYQGHvL1WA2K7LMpVqbF/B6aMYFcm5I
         T+VW6PsRk5GpZQ0xD0+jZzvbrsuvkoohnBiPaBKkhzhLq0vng67YNf9EIQb57zUzIM+1
         mCmCgzohbKQCJFbyXH5RURNiPJP2KEzFkrHfg=
X-Forwarded-Encrypted: i=1; AKwUvBxmI8eRSiTdrl6mkgidyYTjv2nBn0sRE5LLmUCs3w+8jEhSJ0dXnkcEk2dcyD29vbBoWP3Sf1COwHRXXPw=@vger.kernel.org
X-Received: by 2002:a53:e8c5:0:b0:66f:c1be:84d8 with SMTP id 956f58d0204a3-66fc1be866cmr7220915d50.70.1788890852138;
        Tue, 08 Sep 2026 11:07:32 -0700 (PDT)
X-Received: by 2002:a53:e8c5:0:b0:66f:c1be:84d8 with SMTP id 956f58d0204a3-66fc1be866cmr7220569d50.70.1788890846854;
        Tue, 08 Sep 2026 11:07:26 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:25 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 0/4] x86/vmware: Preserve panic diagnostics in vmware.log
Date: Tue,  8 Sep 2026 14:07:12 -0400
Message-ID: <cover.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A virtual machine may have neither guest-local persistent storage nor
working userspace after a panic. The host's vmware.log remains available
after the VM terminates, and a production encrypted guest is the only
component able to export readable panic text. Hyper-V already provides
this class of host-persistent panic reporting.

Add a panic-only VMware logger that copies the newest 4 KiB of the kernel
log and sends it with bounded low-bandwidth RPC work. Ordinary guests
enable text transfer by default; encrypted guests require an administrator
to opt in through kernel.vmware_record_panic_msg. A separate late dumper
reports the structured crash event after built-in dumpers and suppresses
the event while a crash kernel is loaded, because a configured VMware host
may terminate the VM before the reporting hypercall returns.

Patch 4 makes panic diagnostics run before kdump by default on VMware
guests. This follows existing platform uses of
crash_kexec_post_notifiers, with Hyper-V as the closest guest-reporting
precedent. Unlike Hyper-V, VMware exposes no capability bit for this
behavior. An explicit crash_kexec_post_notifiers=0 still wins, and patch 4
can be dropped without affecting patches 1 through 3.

This replaces patches 2 and 3 of Alexey's v2 posting:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/

The intended merge path is tip's x86/vmware branch. Boris please review the
VMware transport and policy. Petr and John, please review the panic-only
dumper use and registration ordering. Joel and Kees, please review the
sysctl. Baoquan and the KEXEC/KDUMP team, please review the 
loaded-crash-kernel guard and the default in patch 4.

Zack Rusin (4):
  x86/vmware: Add a bounded panic log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers
  x86/vmware: Run panic diagnostics before kdump by default

 Documentation/admin-guide/sysctl/kernel.rst |  14 ++
 arch/x86/include/asm/vmware.h               |   2 +
 arch/x86/kernel/cpu/vmware.c                | 245 ++++++++++++++++++++
 3 files changed, 261 insertions(+)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0


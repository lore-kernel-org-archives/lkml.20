Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203274;
	b=tMWl1ckhFLuu0qoqyd8WVJUzDIg4uyixRZGrC6pjT8lib36+H27nPPLMT+XoIURwHhJF
	 hy4sVgBrMItQpqWb4avW8lk5s5IkMYJfW9RH8aByecl5j9/j6Kc6U9WspRBmphlBTRAI1
	 7tAfRHz9OPjqGRalZYLq3bLK6NpCNegB3kAO8eLXPbGE+npM1O37NeaZ7/B2qWqqt6u6u
	 Mal1Qt3F8N7dfJCFVDieH4a6irF7KMQr2uh8K4/aIqXFCBdnVqjnJy9LQwgpdG5Hp4S6N
	 HtU3VdkIWOCUSJr7tItDS80VNSJz+NwcRXnOQF1xLLdt9pQCROI5POsS5y4BC2NjwvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203274;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
	b=TG/OMN32PFoKXmLHDpl2jqWrsf4mfz+Q7DGAV0IN5Z6mYsmolHihefF7r/GcyCShBKV5
	 r0mmEox4kXZpbRVpNKwu5QfJBnbcIGKkhH0Nv0YFX13HtGtMC0jHOG7petTW0QiOozqk3
	 QPTMGgFDWRV+f5NE8+5gigjSbYtt22lfmv0SaKCMi8wx+pW6kcj8qz3qjn4wYs/R+K1zG
	 +NuK+jVwMeUvXEnyTaBsZB73IJ3tSYEVzKoKnXZPMYWpIl4fqroKn7DTqDQI1qqKMAAdK
	 NdxymNZskLINIXPEKvDG27PyoSK3eYP8z8basOlSplsC1KDA3FPK+U7I6Y89it7lXVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W+9rPuKc;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39783606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39783606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W+9rPuKc
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so229010a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203273; x=1794808073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
        b=V5X/zKPn1F1+K65xZGLCvSeWswcGJgF6LFi02UZTsr2ne2SKty7zzCqkFPzvdfarYi
         k5gWPhUve6C8nW9vYmfsTBoo8P1a11cvdlB6ANBVYIuc5PSxsDSWU9MiT4pwZ5GT006b
         at01kzuW8BsRbd9GHdLvOkpzDaZZ+MHM8iKQHagfvMvaNA3PiAnNA1ddxIOp8ZlTQN5k
         AZ0N9aXQzz0gJRKdgquEWmDWN1/170d9GqVRcBYXcYt9mYW9YU+0sc0C6iekuqI5YIPh
         AQrCEJ2iisi7uY2yNeYYlaL81ZOlfiFkG8TvcVX/Siz0x93I+pPRTofI4i1cGVJXhTOl
         /KlQ==
X-Forwarded-Encrypted: i=1; AL+hErGExeeA/NOHO19/GAR43CnYB8BDZqrCdlZQmKsy6dxcZzvXaECLT/UMB+MlwNzg/7F9zEV/bmd52ZoBnjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mlalzdVLgUp9XwG/mEANh9WmJ96/nhE1EXdRcQDsTzOUkURSl
	fkgBDwl2j8v5TQNbmg03nQr+WauguP5mzPa5KKMbSBI0YdTF8aMsx8LRngi5/UdNBLw5M7p+JuO
	PqsmQmHuaqFrgRnOBC2aqc18YesJkjRZne9C+T4yn7LaR5LPMjU7r3/2+3f1P1W0Qn2VlWXlCjE
	YEA6B3RC+jCALb9qr6ZPPESpCy32IKF4GhjTtYCJXCIEtZj0+gaBWN7ssypA8uKd30o9Ck3GVQb
	J7k/X2Y7GeHNYso
X-Gm-Gg: AYBFou2Jyptb3GIqzOZslYYsZ0nTzI7ffHqtipPAmLYQSTrmXdnxcVHw+10rYjUQ17h
	vaR5S0UQcG0wv+huqlJhfgOiG125IcXFpBE/gfxRASC4/O5foExBSCPVZcoRurgV3DFSOuvKM/c
	Ex1yn38/aIiJXPmhKw+7I8X0px0wGI7+SwpPwbQROgtdCzho3Cg1ppfdkJ2D5Qfm/HL28WAkYy5
	A2b6G4Cpr/poCc//d4XyiEtOpGDGeoWvKTaX/BWr6eWKw8UCbY/1aWz3NVzFcSMZcvUMKSRUWq2
	AM0I3EKxldSe1yezcGluxsH5eR04ln/Ee8jZFKd77wLE++BvMuhT8n3aAs05C0PB64JjksCYA4d
	vGb4E2zW6KfyL3stEQZYHx9TEKm2U5mkcUV4+EbadDDe9X0se6WAXyIvtlPRy+74TBmqAtDJM+b
	amGGeYMxeDbj37SK7lB0sYyJPwgnPTWLF7
X-Received: by 2002:a17:90b:380a:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3b12d0e72eemr3281851a91.4.1794203273496;
        Sun, 08 Nov 2026 21:47:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b127728964sm2915189a91.1.2026.11.08.21.47.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:47:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37390b2989bso1879421eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203271; x=1794808071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
        b=W+9rPuKcJGMZGzYOBjbdWgNueaAw2e5ot9Bf0ScHKAojAI+sy5eba4+i22mtGeF4is
         1XNCegruzNNf4jBdzbrbvfQW5ItM1OKtIAXSVWCfjaJfEaP30HVTFW5Hsk2h6hwcACm8
         8D+Z+Tm9cCtNjrO/J7SR1MwFVcBq1FS7U7nNg=
X-Forwarded-Encrypted: i=1; AL+hErEWIbVAeBzyxbnfmIx1beNN63PELxf9J8Wordn2eqOcs5aXFuHaHYocuQ3O4Oe6sv4rzMoQDhxKmj7+hjw=@vger.kernel.org
X-Received: by 2002:a05:7022:1407:b0:145:287:ce91 with SMTP id a92af1059eb24-1b39fe87be0mr5170872c88.14.1794203271456;
        Sun, 08 Nov 2026 21:47:51 -0800 (PST)
X-Received: by 2002:a05:7022:1407:b0:145:287:ce91 with SMTP id a92af1059eb24-1b39fe87be0mr5170811c88.14.1794203270668;
        Sun, 08 Nov 2026 21:47:50 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:49 -0800 (PST)
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
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v3 0/4] panic, x86/vmware: Preserve crash logs before kdump
Date: Mon,  9 Nov 2026 00:47:36 -0500
Message-ID: <cover.1794201807.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series lets VMware guests copy the end of their kernel log to
the host's vmware.log when they crash, before entering kdump. This
preserves diagnostic information even if the guest cannot save its
own logs or the crash dump fails.

Using the existing panic notifier list for this would require
crash_kexec_post_notifiers=1, which also runs unrelated callbacks
before kdump. Following Petr's suggestion, v3 instead adds a separate
platform panic notifier list for callbacks that need to run early.
It runs before kdump and before stopping the other CPUs. It also
covers fatal oopses that enter kdump without going through panic().
The callbacks run at most once, and the list can be disabled for
debugging with disable_panic_notifiers_platform_list.
crash_kexec_post_notifiers, the existing panic notifiers and the
kmsg dumpers are unchanged.

The VMware log sender is the first user. It uses a preallocated
8 KiB buffer and limits both the transfer size and the number of
retries. Logging is enabled by default in ordinary guests; encrypted
guests must opt in through kernel.vmware_record_panic_msg. The copy
is best-effort: kdump and reboot do not depend on it succeeding.

The separate VMware guest-crash notification, which can cause the
host to terminate the VM, is a kmsg dumper registered late in boot,
so it runs after the built-in log dumpers. It is suppressed while a
crash kernel is loaded.

Changes since v2:
- Replace the pre-kdump list and postponement parameter with the
  platform list and a debugging switch to disable it.
- Run the list in vpanic() before the other CPUs are stopped,
  instead of just before the kmsg dumpers.
- Correct the sysctl documentation heading.
- Rebase onto v7.4-rc1.

Tested on x86-64 guests on VMware Workstation, ESXi (ordinary,
SEV-SNP and TDX) and QEMU/KVM.

Platform list proposal:
https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz

v2:
https://lore.kernel.org/r/cover.1790014793.git.zack.rusin@broadcom.com
v1:
https://lore.kernel.org/r/cover.1788414671.git.zack.rusin@broadcom.com

Zack Rusin (4):
  panic: Add a platform panic notifier list
  x86/vmware: Add a bounded panic log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers

 .../admin-guide/kernel-parameters.txt         |  12 +
 Documentation/admin-guide/sysctl/kernel.rst   |  20 ++
 arch/x86/include/asm/vmware.h                 |   2 +
 arch/x86/kernel/cpu/vmware.c                  | 250 ++++++++++++++++++
 include/linux/panic_notifier.h                |   3 +
 kernel/crash_core.c                           |   3 +
 kernel/panic.c                                |  50 ++++
 7 files changed, 340 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

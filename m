Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690445;
	b=YAKvJMzyvvrRb1yr6aQnF2k0l3+ASALHzpvF99vj4X7vaubRaTDy1aJqwoAgY6G+ocNX
	 4Yso38nUws8yHEDRILRC73MGZQ0AmyYGo+vizf53o1MoTm/epVau84pO/YUVvh2F6caU4
	 45llY/skFH5QuuKbdqW3p0MhlsqHKdYMmz7ZqCMGu82gG+NdXcRJtGk0ECIE3clnleKin
	 7qbIopwjwqXoMrnZN3yKQWbtptNl1MHpXTbjXMVBE8cac0NvUguyAGXJy1Ls+kcvFQVmG
	 u2I1l62xQu/O1//BBTl1z1JauDfjnZd+x9WHbEjr1WGDl7OXqAZnHafMoHo+iWXiBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690445;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
	b=gBvUEl0yFDESSpX68qyPiDkM3Yw9L5/bkpo+1q3TS/vKH8k8jnYChwUkP8vzhez/mJVg
	 FwBHzPM4yZhhHxnvBOGF4luBtFnrkizLSAHC8xzcfalP5i3aBYZJTgqD5g9pJFQlBqF6r
	 YQgXlgTLE3tFtP9oCDr8ylpt0R9A4aVoikRnevDE4yBG5uVUR6I0tDYAFypKakdd3Vvig
	 6G5si6Thsx8na64NC3LrceEDwNuQBiHac1lxZXg8DKIUfmw9ihhUI9h9bVX6a3vTiLL4G
	 UzZ7LgVbgf6K78Badp5JuFWXb7LfCPiqTnF85fEp3JrbrjjUhdiNFhS6gdav2hP+5XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VYR1gr4s;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73E606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B73E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VYR1gr4s
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2819506a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690443; x=1794295243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
        b=zCcu9bvV8BtI31tHngkWOt2x5Tiw3a2Age+7lGtTFLA4KHjxi6XqgnzBfz2SBMHXxj
         Nl1LlvibloSjH2zXh56A3VdYgROY6YlDET8rTzQJPk0MCsmfnmp2/Jt4chrGOp70jcj2
         AEf/riKKA+n7HULZhBPaxKw5G4zAl6X3RthpswnGe6R+qgJbk/4A1PjS9VgAXUeP73Hg
         dnSD2MZ3R6CrJufc5tPAMYmW+qZSAD9EN/jOamfxbvbR5ef2XIacKahHy4UDXGNxBxlM
         ltXoRplZP4m6ailiviJlSz280LyTeiJdpCzE6Bz/X3YyceoyJCpMsrMYllJihFhPinA1
         V9+w==
X-Forwarded-Encrypted: i=1; AKwUvBw6KSheK73TzJ7TCvKWlrxCe5V7z83qZiwEkNqkhJ9lgtYXNoVRTd3zu1ZtvwpiSczi4wbfup0VbCRQb/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oxE9rhbEH4guZf6HkIMuY/zmt8GRntNNfQfrllennhvJSBxVJ
	wB/yk9Ojqw1B/IHwHD8zHcUzHANyiBmN6dqak9rPj6tqfNp4/Fnv5+udJF81kITZTReqEyH85dZ
	/MdOQncEX9INK3C6dbglxUZJD/m5cZTjxkCIjpoBSlQRSnBDKV4i67wiZuHdOKl+XOrmZSAQnN6
	vEAfDQ6nbBkNQHZFi0Jho8BqThc+KvNx8LifyHYtmfg5YOCDaxWbVGVS/zYLa7RSAA8dR7QQvNl
	UiKTMIiaU4qzmPT
X-Gm-Gg: AYBFou3qdFGgN92woJbbZZ9C1Y+dhUJGzJYQv+yrOlXsmoLHEY+lxAt98RLaeKzrveh
	aryUf6Yvrl0v8wA7VK9RgQ4O0zV+d1ORkcK0YSjelI+h5IdECibZh66Rf5sL6DNkNit63Dvsu0U
	lQTO9lfilXysg+0qfANvjBsTvnWQrW+Z4b4xqqdxHehXEdKcFrUR0gW3aZmrwvBmvXM4AbpTa60
	qPxOIGTqdHhuZO2/wD3nUJmJyHb8DaxoLSOHgmVpIp2gUoas2vwSPomkisyv4MM11O5xYXFz73v
	RCMrUc0a8oS4nJZn5ApacDKtEbdIos9Ir2iDVODZ+54dlYGx1+2/tWk9IOHMvbYTHTxZHofq3Ea
	47gQ3hP3d/XUgA4WJbW+dYdCe5IP1F/ZVHeCDQeRFGbWXbiLYp72txZhzzf6B4m6/jiC36sIJHb
	yILZxf0P2MHpQZBIu2soSAvm+RRWznqPut
X-Received: by 2002:a17:90b:224f:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ae8983cf4emr11263443a91.53.1793690443278;
        Mon, 02 Nov 2026 23:20:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae8809c5ebsm4423128a91.4.2026.11.02.23.20.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:20:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so45503761cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690442; x=1794295242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
        b=VYR1gr4sQXppxDQLuGFj5ToiZH0PchHqYEKDxI1CjWFwveLbk4tt9bWHHGhlYNQFbf
         +53LVYuppWFJeyOX8Hp+1orzncSPbrQ7VlLNMYvyUuwxbwko80FSzm40344syH9cC/wC
         41l3S8Ef1E8nFM8e7qt7siBMXybpCFNZX34dg=
X-Forwarded-Encrypted: i=1; AKwUvBwZvDbK05g8ilnvVtc6E1yQlgz3lzSlbhHABxB94s2XmsYT4nzuhJjumICZSiBETdlJgi7ynfd6uduorps=@vger.kernel.org
X-Received: by 2002:ac8:5a86:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-542b7c08be6mr197740991cf.63.1793690442080;
        Mon, 02 Nov 2026 23:20:42 -0800 (PST)
X-Received: by 2002:ac8:5a86:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-542b7c08be6mr197740811cf.63.1793690441651;
        Mon, 02 Nov 2026 23:20:41 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498c379989sm18885491cf.19.2026.11.02.23.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:20:40 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Bo Gan <bo.gan@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	virtualization@lists.linux.dev,
	linux-coco@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] x86/vmware: Share steal-time counters in encrypted guests
Date: Tue,  3 Nov 2026 02:20:33 -0500
Message-ID: <cover.1792471114.git.zack.rusin@broadcom.com>
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

Steal time is the time a virtual CPU was ready to run but waited for the
host to schedule it. For example, in a 100 ms interval a vCPU might run
for 70 ms and wait 30 ms for a physical CPU. Reporting those 30 ms lets
Linux:
- account CPU usage accurately, without charging applications for time
  their vCPU wasn't running;
- base scheduling decisions on the CPU time tasks actually received;
- show host contention in the "st" column of top and vmstat and in
  /proc/stat.

VMware writes a running total into a small per-CPU buffer in guest
memory, and Linux reads it. In a confidential guest (AMD SEV-SNP, Intel
TDX) memory is private by default and the host cannot write it, so the
guest has to share the buffer first. Linux currently registers the
buffer without sharing it, and ESXi then powers off the VM. This only
affects VMs with the steal clock enabled, which ESXi enables by default
only for Photon guests.

Following the v2 discussion, this version uses one packed allocation for
all possible CPUs' counters and shares it before registering any address.
Setup moves to an early initcall so it can use the normal memory-conversion
API. This avoids converting a page in every CPU's per-CPU area and
concentrates sharing in one allocation.

Changes since v2:
- Replace the six infrastructure patches with one VMware-only fix.
- Leave the per-CPU allocator, linker, KVM and early conversion code alone.
- Move ordinary-guest setup to the same initcall.
- Rebase onto v7.3.

Tested on ordinary VMware x86-64 SMP/UP guests, ESXi SEV-SNP and TDX
guests (SMP, UP, 66 vCPUs and percpu_alloc=page), and QEMU/KVM x86-64
guests.

v2: https://lore.kernel.org/r/20260929040256.543767-1-zack.rusin@broadcom.com

Zack Rusin (1):
  x86/vmware: Allocate shared storage for steal-time counters

 arch/x86/kernel/cpu/vmware.c | 130 +++++++++++++++++++++++------------
 1 file changed, 86 insertions(+), 44 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222

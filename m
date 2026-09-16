Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE219CC0F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535154; cv=none; b=JKALtAKS7THqqbPlGvu39uFSFJmUZgsijUMCmD8ul6HmfDntZXAxE5nuCRWQpi+R2TOqu5EhwmhMbZoJ8aC8+s2ozlo5rVHd9OW3iNfjY45+03zc3Gdlghxyr+Lfdkd3uD7T4gVTlyyezfMPgIDA/DnjIuERuYlVxFOLh69sjWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535154; c=relaxed/simple;
	bh=jUsdJh8Hh+QQW+V8f3/afoIgbxaF+ULvWELh063IS2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmoNuYSm1TpuPSV6DCflUgBEKhw7Ib3hCy6P8r0Gd9zJZAnpb68C/6b2iUh/ugR6n8ShHIK8MppYWCjzCif1tHeAeaZSWxIHT9p65kuklpD+WmJ/0znSrZ0FOk8YT9ngPXcenXCtx4UOv0qbGtVOmZMKx1qpA+pnFooUcDQpPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P0ueAGi9; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P0ueAGi9"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1345342e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535152; x=1790139952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+i3/9cwENYafIlAkV2jcoorZwd9xMxSWurzxiZS8EDE=;
        b=O+nXiTbVXCCe5Mm5PcNY2MbYlhsT39jYiMEHyoNbTyZ00ZZQtB9RrehfKWWfND2zvv
         Pnx26uIPAaF4c59ceDvxqt7fQZMBamVCcxaRkZDIn8ywaPQMqMFGa8Q9WXf/wJ3+OyVI
         UhDajegule/pc3KzBnw++BsuAd8Ew4HpZK9cIjnko4TTRKfoT6rLpf6NVGV0W9SDTIWM
         ruMLB/vJLS3ZuI/1wlh+ciAaRqIcL3A+UfZdDC3LLPus+PHZjrJeFLciIyIOlXSLJ4QN
         QgLc95y3AxN8To1MsLemheptvWDHZ7XfD1rxTuaVjWgsLHFn7M0sGXuT2WFNyUNskCYE
         wT7w==
X-Forwarded-Encrypted: i=1; AKwUvBw1Kgpl1vJQE59gKveQ8cGcxxiSxWlzLRlB+/lR+s5dqkHIp5cnG6r/j/pfWnUsAiSI5d4qLzd4A2p/QWY=@vger.kernel.org
X-Gm-Message-State: AFuF++nC0fkXfC9R6SM63kpK3BAb1rknpOnGvmGZtmUer3l6ckyGpEEV
	K2ScfP77QZ23+DJeCrevSZxRFjFoy5A8Wc2E+9evWsJFayM43vdm4bq7eNKF4ii44FtRbQdwhde
	aLIqTUjtBpNYIQhp9mkvYndi8FGoKP/x4vrFMRoY9lp/1X+YjsuSmhTtjjDn1hbHFQ8e//LHTik
	rR5jYVOxlO8GZ5dE8BZfgmxEpyobFQ1g7sJgoNjs7M4Kga7slMTVeV4/LUACozfDe2puINrqZP7
	37tGQHya/sBDzIJ
X-Gm-Gg: AYBFou0oBuepdH1mQo71XYXp1okBXKOU2z/pSszZ0cAJwx5CkGV5/0NS9imqxPRSJCt
	kpYpf8bFk4Ou92Gs3hOWeaFKr2mZ0jiZl26166Ywsuluph3DK7Bfiw/61XLDIkODMT3Qj0N/NWn
	u7pueI1MsMz7fW8FtKmfGDThopHtsLNOsRTHsuVQ4cVqgi6f+JjY+Z12m0dAEWQbGcxH10eR120
	P8QjqOz1lBtcV79v6YjDznRUe4QRH6EbXpf8bOFb5JEbPqItaFWdunESTvNfzZRWZMozRAhtRtN
	lVO728iZhLVgZoTNYTI1awsH3ZbcI1UDrWAM9iFRy2vNPjFJwebODJZ0BOpXasixvoD6M0mYAmq
	hBHzWChKvwtmCtcEZi9dZ7ebf/kR8cvDuHk1ny0GGu/XVPOHCnC3ZQH2r2qfNiyncUnnqhrVA22
	+vWE+aXv/v8XQGELfndM+Lrc3ufZBvieMvpSc=
X-Received: by 2002:a05:6122:8b10:b0:5c7:f1ba:aa12 with SMTP id 71dfb90a1353d-5c99aea978cmr475009e0c.4.1789535151793;
        Tue, 15 Sep 2026 22:05:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c99970521asm658941e0c.3.2026.09.15.22.05.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:05:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so1253018a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789535150; x=1790139950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i3/9cwENYafIlAkV2jcoorZwd9xMxSWurzxiZS8EDE=;
        b=P0ueAGi9lhbFeMzfjCFdjE0M4gVt8p0TORIUefRcToQHQeAkEK4qv+sYa0SpqlLgf4
         SPhASxE07mw/MbQ6b0fjj0/gmZQvdLNigxj4DiZzgmYdl1cJ9EV3VO+qc8zZ9RneVVHr
         mzHnLxJfguW8JDHirUgT1h0b4vUAzi2I7WtDk=
X-Forwarded-Encrypted: i=1; AKwUvBxJxjIlQ4iDMbYx4OS7cuhlRA5nrHojLPEyqqztiViYCPJN3Dw2Ky2AyUteZUj72RoxVIw4fDB50KR3ETE=@vger.kernel.org
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr9817211a91.23.1789535150517;
        Tue, 15 Sep 2026 22:05:50 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr9817170a91.23.1789535150025;
        Tue, 15 Sep 2026 22:05:50 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3951386eec.15.2026.09.15.22.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:05:49 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 0/2] x86/vmware: Share steal-time storage in encrypted guests
Date: Wed, 16 Sep 2026 01:05:38 -0400
Message-ID: <cover.1789488039.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

VMware registers each per-CPU steal-time GPA with the host. An encrypted
guest must first convert that storage to shared memory, but the existing
setup publishes the address without conversion.

Patch 1 makes the decrypted per-CPU section available with
CONFIG_X86_MEM_ENCRYPT, including TDX-only configurations. Patch 2 defers
encrypted-guest setup until allocator-backed page-table splitting is
available, converts every possible CPU's storage before publishing any
GPA, and attempts to roll back all conversions on failure.

TDX's conversion callback uses __pa(), so patch 2 preflights every possible
CPU and leaves steal time disabled if a TDX guest uses vmalloc-backed
per-CPU storage. This covers percpu_alloc=page and automatic allocator
fallback. AMD encrypted guests support those mappings and are not rejected.
Supporting them in TDX would require a separate conversion-API change.

Conversion need not preserve zeroes, and the host initializes only the
8-byte counter. Patch 2 therefore clears each 64-byte object after
conversion and before registration, without disturbing other decrypted
objects that can share its page.

The intended merge path is tip's x86/vmware branch, following
commit ac26963a1175 ("percpu: Introduce DEFINE_PER_CPU_DECRYPTED").
Per-CPU and asm-generic maintainer Acks are requested for patch 1.

This replaces patch 4 of Alexey's v2 posting:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/

Zack Rusin (2):
  percpu: Use X86_MEM_ENCRYPT for decrypted per-CPU data
  x86/vmware: Decrypt steal-time storage before sharing it

 arch/x86/kernel/cpu/vmware.c      | 96 ++++++++++++++++++++++++++++++-
 include/asm-generic/vmlinux.lds.h |  2 +-
 include/linux/percpu-defs.h       |  2 +-
 3 files changed, 97 insertions(+), 3 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.53.0

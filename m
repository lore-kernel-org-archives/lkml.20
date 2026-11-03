Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690512;
	b=e3eo97hvsNgXLaNbUoITeqTHxtkIW9n3CEjKFivf9bGSkRYP9DSE/mE+Ph3m4HwQKDs6
	 RHtFT+bqYzIuSX+Cto8pRcZn+2x+en9D424khF0MYOfQ03PGuyxEEab2W4QOQCfb4rYe0
	 XznsEi1Yd5HnkzxWQod2RarZ3OlmBN6MBs6E8ewoL0ZgRgq2nhAI5eIkdvrjbe3VNxVB3
	 7FXO1FolVuoHu7l7pkt1P6kFHvfhaO816B+VWxPRn9LQxM5LZQwXEqoxmdtK9d6r8s67D
	 Om5ZBQXfI0unCq4ppEozFNZdPYAjsDLCDaXM3NQgUsC+2N9fGvKQNiSpMQySByNq6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690512;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
	b=ntewNpD0UJCYDvkEy6bgytfWPWjedXryhyzqX7+cYATRwYC8GxN1J7dhwQFQ6OujIB6m
	 2d1FtXab52DoQdum1XULdqU8C6c1VCWP8GyBUkNzzI01z5gfIUGrV2dMhaQegBCjoNwii
	 Z/CI2kic75ahzQFIL2Yd0cXrcFlhzudXyV3XJaR09Zvl0L32c6bsl/RLrJATt0E1CaWpu
	 26/P+JdgHAL5suDl+dmgaWuBkhpzTOQG6S0Dj8WPF9h71Y6rmxuK+NDvxyrl9dplW4LJV
	 6pQ22sKtILT03sM1GNEbtH1BcWDIKeWbAhApGrGVXZqeHhKsq0j/Z5Fsm7t8ZcFYpbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NNAsckEf;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD1606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCD1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NNAsckEf
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2932458a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690511; x=1794295311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
        b=sE9BAjFZhKSmED/u6iftUzvJw925F4aVJbTsC/4pKi2FQujFGip6utl8SqEFRn3s5/
         NQcyGC9l8tGir5xv99lsQkc92PDjidCdsMqci53BtzpXoHxhlkbuOn7GPL/QdCLcudqM
         joAi0XhAe2py/9e4xOaUJE2gFW9YQ8bHl7JTrHpI85Ux9RznLDSQ58wQBsqI0/lu2jpC
         gcAq7gGwFyT6GHaj0X/fSyt4ho1/FuOJRedjJ638rcSva75YM3h+EU6gulx1WmVI+SoJ
         Hx2oQonJPD6HF3o37qrF0I/V0lKOpLT/kU2vQ020Ivfe0yegP7RCcgUrw/1xhFzMoBOH
         fROA==
X-Forwarded-Encrypted: i=1; AKwUvBx/d5DHIcm/O2fpAO8vBYCV2IqSH7uIPwkNPOLjY/mVAxcJ5SIGiGIGUM6h6Q0UZALTII1gjbnqjdxFtIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oQJ/rrSCcgDalgm99ltV7ztLWbxGPWCL7CoMjt5QuOTD5NPGL
	6wrWq6XeZl2XTM95JmJ6lX+N5P+UrxngLwJG4WOAAiu7Us/2y8KmzVREeShewM5ZrdopWTvL/Fa
	hJNT/0FAp1hVkPrRUZeM7s+epwdvSs6xSDeksS3DLX8lFrc8vN566lfA8sa8JzCfFFXeJes8H0N
	KTRtCIhdhW+SJaNzrrYsZAjEhFssx/CM5bJAq1WZTHyDgn6Wh+ZGrlYZgI6A193ZqpvGFLeV+LQ
	K3+Pkoxkx48o48n
X-Gm-Gg: AYBFou3ZmPuGeu6z6AKzBZLa3qCNmfRkT2R4phQNQRyYMwyVXnZ124jvbzEy6pB42Mk
	4GdxYlvMsXpq39jZ4024qaFaX0bmjKYE4GfxQQcVPWe40fjnjrti9THZfVPvBizgkKmd9j/u9hv
	WhLFAmnlhqOVfv7ImPGIRo6FHBXc3aUsuFeY1YNDIRzj+1dVpzYhhQdgysgMe1TZm1e7ZGdNcIw
	rtFaenFlPl4e9nICO2gZrAECRMB/JbrKGOah6TIdR9H9zXd3r2DvTlQJKYAP5zSU2cQpNOG75LI
	uuvF5ZpJV8hqoN9rSDvCaZa4w+F5ZVY5szYBGCBBIkWVmMdIrXhnz2cyk5coXWqVh0Ao1J/I/98
	le2ay04CFO/PKaOCtiM9P6bIpokmI6bDe/dbVPJKFPt7WTYIjMrOrPuylBYf0nuWHVX57WJZbGD
	jBICG07hv7g/kg97Kd1ayJQClx3KD5Sd5I
X-Received: by 2002:a17:90b:4c81:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ae897c85e6mr10070284a91.18.1793690511414;
        Mon, 02 Nov 2026 23:21:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b087409c51sm290088a91.3.2026.11.02.23.21.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4a72bcd6599so3336701fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690510; x=1794295310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
        b=NNAsckEfATCo3/TIU6E45hSaKhzzbkpE/jqzzCK+38pgvt4S5qdeqL1Pjgbs5C75nz
         B0maqyX16kVMQSLUevFEEgHbmCX7s89ZTWlrFKQHDjCINMwu6icof8i8Kf/IXH5Fhw+f
         ZyU69KQj2AY7AnA8byGaD7swdtaDdt1ZpmNsI=
X-Forwarded-Encrypted: i=1; AKwUvBzrKSLTgHBinxQrFfqtyKnlp6R86XN4SWjuxWtbSbh+ElzYj0S7CX+Mdb0W5F3A/tLsrOHitzvhU+u3efY=@vger.kernel.org
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2136143285a.28.1793690144067;
        Mon, 02 Nov 2026 23:15:44 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2136140385a.28.1793690143503;
        Mon, 02 Nov 2026 23:15:43 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:41 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 0/3] x86/vmware: Clean up the hypercall code
Date: Tue,  3 Nov 2026 02:14:55 -0500
Message-ID: <cover.1793685318.git.zack.rusin@broadcom.com>
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

Move VMware hypercall assembly out of vmware.h and select the
low-bandwidth backend with a static call, following Linus's request:
https://lore.kernel.org/all/CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com/

Patch 1 moves the high-bandwidth helpers out of line and removes the
redundant vmwgfx caller annotations. Patch 2 uses input and result
structures for the four low-bandwidth backends, selects the backend
during VMware platform setup, and removes the early dispatcher. Patch 3
retires the unused VMware feature bits.

The caller API is unchanged. The I/O-port backdoor remains the initial
target for early DMI probing. Modules use the exported high-bandwidth
helpers and static-call trampoline; the static-call key stays private.

This v3 replaces patch 1 of Alexey's v2:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
Its panic logging patches and steal-time fix were reposted separately:
https://lore.kernel.org/r/cover.1790014793.git.zack.rusin@broadcom.com
https://lore.kernel.org/r/20260929040256.543767-1-zack.rusin@broadcom.com

It is based on tip's x86/urgent branch, which has the i386
high-bandwidth fix this series builds on: e0e022004bbe ("x86/vmware:
Fix i386 high-bandwidth hypercall arguments").

Please route this through tip. As the vmwgfx maintainer, I agree that
its small annotation removal should go through tip with the assembly
move. DRM maintainers and dri-devel are copied. I'll make sure there are
no conflicts in that code while the trees merge.

And yes, this code is a bit like me, meaning it gets on everyone's nerves
and likely looks awkward in shorts, so we're just trying to make the best
out of what a politician would call a less-than-ideal situation.

Changes since v2:
- Replace the ten-argument backend interface with input/result structures.
- Move the high-bandwidth assembly out of the header as well.
- Preserve all low-bandwidth outputs and the backend-specific %dx flags.
- Export the callable trampoline without exporting its key.
- Correct the ABI documentation and retire unused feature bits.
- Keep the backportable i386 fix in its separate posting.

Alexey Makhalov (1):
  x86/vmware: Route low-bandwidth hypercalls through a static call

Zack Rusin (2):
  x86/vmware: Move high-bandwidth hypercalls out of line
  x86/cpufeatures: Remove unused VMware hypercall feature bits

 arch/x86/include/asm/cpufeatures.h  |   4 +-
 arch/x86/include/asm/vmware.h       | 371 +++++++++++-----------------
 arch/x86/kernel/cpu/vmware.c        | 299 +++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |   3 -
 4 files changed, 351 insertions(+), 326 deletions(-)


base-commit: e0e022004bbedc7caf1c18770980eb5372019189

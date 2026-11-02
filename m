Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624593;
	b=hrxn2OaYs170f3eiedFtglswPAHVAAWBTSk1d2PzmCz4w7WUyOc5f3AKK1mjV26dtd5x
	 9YTknKSbLYX1i7J3NKVqf/QiuXI5lK9K4kxG/xxXihPwRSz7f3Ak+0RlqB7vLcHfbk/hv
	 12+aEH0n4z0REIX9w00OljbACkpXZfmd6b8F3V5hwXEQpx34r8BcFDwE00xAlpme9kmk5
	 TP1iGSeFUt3L7KfzU94t43bA9y0zOJBSmVej+NtZNnFsj/OafylhLF/D22tPicnkaKGyS
	 Kl4xo6vWAbuzTtl8GFN27iT39+1NcFKwAQmEgiIwQvEjR/YGT552UFoUca7FUmrPSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624593;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LWyZ1UkaDVoP3VWJmfwDCKmpQUjYhiraBCsKNKTFD9o=;
	b=36jIha+45NqE+JQc/cdyGCnOi0qZ7MFMSWV+kAtaphzAzghsVFRAFRGvebPipmZmTlNa
	 CxMOawvLmhn/w0xSwhhnj93FqSZGmomYjsv96T+myE+MNJdEf/LTuAaIdOel6t9t6LR5O
	 NfWm5EMbWft6vjHzvUvLsdwr2ZJwWCuEbS2iyElo+/pkD8le5lqJ8VPcf2YsbXqklbSDM
	 b14/PHeD80/jjRBctfymStO4GHjsf6BknPKlu0Ee+kS1ohoOvomPDwXqX8HeTzUMaInlj
	 oCqom1DPCpSrSyF+6ku2NF4w1xQ1T92NnylAQ4aiQFcDT2/o/MMvRW1wIu8Bfaxtwyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AyNUsiyW;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45F606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B45F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AyNUsiyW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DS9B5U4J+iTHwDTvPcTcDhDaIW+dVQnOIDk5Q84LEB8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624590; v=1; x=1794229390;
 b=AyNUsiyWPHUvVlLm0Ch+hskD0hLC+FTCjlnZY8sp3N9AFrVOsYilvnhDTRAL5FSwum5dJGyC
 aXwJ0D5Gv0OUNQfdN1xo0hajYpoR9LqRXlOf0FwMg0R45SA1PmmYtY/4J2dajfX0I/PFLUVuHhb
 eXnW07vHhxA+dayiKJfaxGT4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28a34c058c471d7f;
	Mon, 02 Nov 2026 13:03:10 +0000
X-Mizu-Trace-ID: 28a34c058c471d7f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] Documentation: KVM: arm64: Describe the ITS hardening
Date: Mon,  2 Nov 2026 13:01:33 +0000
Message-ID: <20261102130133.3684226-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
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

Add the ITS hardening to pkvm.rst: why the hypervisor emulates the
host's ITS, and how protected mode differs from non-protected mode as a
result.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/arm/pkvm.rst | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index b75bb8ad6f26d..1ebae35f8373e 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -89,6 +89,38 @@ DMA isolation using an IOMMU
 
 Status: **Unimplemented.**
 
+GICv3 ITS hardening
+-------------------
+
+Status: Host accesses to the ITS control registers are trapped and
+emulated by the hypervisor. The LPI configuration and pending tables
+remain under host control.
+
+The ITS reads and writes memory at addresses programmed by the host, so
+the hypervisor emulates the ITS control registers and command queue to
+ensure that the host cannot use the ITS as a confused deputy to write
+to hypervisor or pVM memory. The command queue, the ITS tables and each
+device's interrupt translation table are owned by the hypervisor while
+the ITS can access them.
+
+This gives rise to some user-visible differences when compared to
+non-protected mode:
+
+* Protected mode requires the hypervisor to take control of every ITS
+  in the system: KVM does not initialise with more than 8 ITSes, and
+  if the takeover fails the host is not deprivileged and
+  ``KVM_CREATE_VM`` returns ``-ENODEV``.
+* An ITS command or register write that the hypervisor rejects is
+  delivered to the host as a data abort.
+* The number of devices that can be mapped through each ITS is limited
+  by the hypervisor, and MSI allocation fails with ``-ENOMEM`` beyond
+  that limit.
+* Interrupt translation tables are page-aligned, so each device
+  consumes at least one page.
+* GICv4 is disabled: direct injection of LPIs is not available to
+  non-protected guests, and a guest saved with ``GICD_TYPER2.nASSGIcap``
+  set cannot be restored (``-EINVAL``).
+
 Proxying of Trustzone services
 ------------------------------
 
-- 
2.47.3


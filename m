Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A520249BB44;
	Fri, 16 Oct 2026 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175270; cv=none; b=cuGinxC4jPnUcHpqjzE0FU8IWtdCcBgOAkcbGMhE8j6c8FCZlNlipGq7A9rlOuFxjPCFFFPU19ssJbCtUBBsRxLK1jUlB5EL2U2WJHbzF/mTZjjKYeUgWqEkhImeADhCnCGELzD6bD+3WRFLC34l7X6Lg7BtB13nmbV7gCKl/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175270; c=relaxed/simple;
	bh=eXLo4l00IuxcldPkqFxylRH7Wps8yF41ZAkJADgaRHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQvDpRqi4makpq4NinMJSMgQlrfImkmCAbQ5k8nfN0nS/LgLR/ZpH+0tTOTuFS6Q78aBLybpun30lJgUJvioJPjdL1bgsVj5avcdby6gRFHaQRUre2cob6xsYUu6jCSy7lNu7hqDnSQnUMdv+kcZXH0+mupNeaP34rZNkYvu/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U9oPvj8X; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U9oPvj8X"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92031516;
	Fri, 16 Oct 2026 11:27:43 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B68B3F7B4;
	Fri, 16 Oct 2026 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175266; bh=eXLo4l00IuxcldPkqFxylRH7Wps8yF41ZAkJADgaRHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9oPvj8XoObuD+WeGmW/awIze3MNcps1VBQP7WKlpK3oui9Isgen1bES+kKFi2okS
	 iwtfuedTFUCfHN9qMuctoHYlAqfEGgk7N7vt5x/pOsY1mBa589VpGoTY95QdDTqH5R
	 v4EUHkpwPfOKfn0uu1fmck+5VBGUkVMcceYAy6FM=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Date: Fri, 16 Oct 2026 19:27:12 +0100
Message-ID: <20261016182714.1835813-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attribute files as exported by the LFA driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa

diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
new file mode 100644
index 0000000000000..4e93a1aea91f7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-lfa
@@ -0,0 +1,106 @@
+What:		/sys/firmware/lfa
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		The Arm Live Firmware Activation (LFA) spec describes an
+		interface between platform firmware (an agent) and any user
+		on the non-secure side (like the Linux kernel) to activate
+		pending firmware updates at runtime. The actual firmware
+		update would be provided independently (out-of-band, or
+		via any existing explicit firmware update mechanism), then,
+		if supported, can be activated immediately, without rebooting
+		the system.
+		This directory contains one subdirectory for each of the LFA
+		capable firmware components supported by the agent, identified
+		by its UUID. Within each directory, the same set of sysfs files
+		provides access to the properties and actions for this
+		particular firmware component.
+
+What:		/sys/firmware/lfa/<UUID>/activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to trigger the
+		activation of that firmware component. An update must be
+		pending for this to be successful.
+
+What:		/sys/firmware/lfa/<UUID>/activation_capable
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component is
+		capable of being activated.
+
+What:		/sys/firmware/lfa/<UUID>/activation_pending
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component
+		has an updated image ready to be activated.
+
+What:		/sys/firmware/lfa/<UUID>/auto_activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to allow this firmware
+		component to be automatically activated once a new firmware
+		update becomes available ("pending"). This depends on a working
+		notification scheme, for instance via an ACPI notification
+		or an interrupt to notify the kernel.
+
+What:		/sys/firmware/lfa/<UUID>/cancel
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to cancel a recently
+		triggered activation, if that has not finished yet.
+
+What:		/sys/firmware/lfa/<UUID>/cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this component requires
+		a CPU rendezvous in firmware to be activated. If true, this
+		means all CPUs will enter the firmware during the activation
+		process, so will not be able to execute kernel code or
+		handle interrupts for a brief moment.
+
+What:		/sys/firmware/lfa/<UUID>/current_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the currently running version of that firmware
+		component, as reported by the agent (if supported).
+
+What:		/sys/firmware/lfa/<UUID>/force_cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to force whether the kernel
+		will perform a CPU rendezvous during activation. This has no
+		effect if the firmware already *requires* a CPU rendezvous.
+		Firmware components might provide services to the kernel, at
+		which point is might be unsafe to continue running the kernel
+		while the activation is performed. Sending all CPUs into
+		firmware provides the safest option for the kernel. If you know
+		for certain that there are no services provides by that
+		component or the firmware component can handle requests during
+		the activation, you can write a 0 in here to avoid the brief
+		kernel downtime.
+
+What:		/sys/firmware/lfa/<UUID>/may_reset_cpu
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component
+		requires a CPU reset during the activation.
+		Currently this type of firmware component is not supported by
+		the kernel driver, as we cannot handle a CPU reset.
+
+What:		/sys/firmware/lfa/<UUID>/pending_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the version number of a pending firmware update
+		image, as reported by the LFA agent (if supported).
+		If not update image is provided, this returns zero bytes.
-- 
2.43.0


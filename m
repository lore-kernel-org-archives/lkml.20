Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638490;
	b=ZNjO0aZUjoHLgRFKFSEtBSr021gmNmjovzxxqLRPw1xvTxMs8DLgoApkW36Qzn5qa5eb
	 OsCYmau5YiRejTbnBT+gIZeFA9nxYQ5XFtsvyD4NlI9pxxLuZkcC0SQ+B37AiY/DcB7RG
	 ZVf0AOgqCtn1SXSZMFbuYTHVcM+fuUMQ8Xv9JytuiGFB1J3Cp+WKMBw+XwlGc35E/3ktL
	 cDTrZKI5Id3fg//DuoVTVadMgiX6x6Ft/j84WQZXA1nth0AIKst6qQetogUY/nOpSBrV4
	 Li2rfrlEnAxzJT1KTskw/m44SLmNY9m13k6yb3d18wfM6lQsYpMYw3NACSFA0iaIhVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638490;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ymID8oqHCFAIWyYfqk6ucVD1Jsgmc6jMBtt8WzDyRFw=;
	b=05Ix2MUN3B0Br75CVtgmFriDbwDB9+5Eyp0PHG7n1QHYfss8+73JkHwbIXjL3EhFcQnp
	 hqifzhtrAgJ9qp8xnRsfK7qUHvGThUO6H7A/WOxxC/AwU0ItR6CbTLqW515NO5E/tqgOk
	 4D+oVePAr68vBc39yUeiMSLz8edVt5Xy9Gwtq2ATphdGYseR3GaU2bFkGs9fQStiKleLu
	 mLP+joKXMgIiWRMANmiCvkYqynExKAa/PrCwQOqXX86eihluXV/hcbBmiDa1Qp7rSsUNm
	 +6bYz2YOLUcnQFRl9dbuV15UEcq2FwErSOybdpJHcrgqUs1hxslzv05iP9UgiJSX4gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CkMNFUcL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113436093D6A;
	Mon,  2 Nov 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113436093D6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CkMNFUcL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC3016F3;
	Mon,  2 Nov 2026 08:54:46 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98CEA3F871;
	Mon,  2 Nov 2026 08:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638489; bh=eXLo4l00IuxcldPkqFxylRH7Wps8yF41ZAkJADgaRHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkMNFUcLyKKS7hFmChYHo7hyq6fTPx4zFHYNUemvl3FwrUGKiLuSknrczYGFwkSHd
	 kLGyZ//v5qh4KUF7Tk0KhNKCc6WK+DYHpiO73M7NIY4xy8/xDfGqXF9KlgjwQRl0EP
	 az4/kOSU9iShP6Gn8aHHc3YvDIiPm3pPbKEukSuI=
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
Subject: [PATCH v5 RESEND 6/6] firmware: smccc: lfa: add sysfs ABI documentation
Date: Mon,  2 Nov 2026 17:54:20 +0100
Message-ID: <20261102165421.3651202-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
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


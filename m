Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E9E2E7165;
	Mon, 14 Sep 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401552; cv=none; b=gNnZ0EsKRgtLfHARr+sxxaGc/igQ+NrCmB1tl/UnM3Y+U4QbFKGWB5BuK2ba6DW2iEu3UofQCITp/jJs8ayIhrKw0jAdOjMQV+F3TmyTUXH71MCzW0NbCImc2pyjWAeVFN0yigELbtuQ8CNgb5Rx180ow+s3MEjorZx8iLrvtt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401552; c=relaxed/simple;
	bh=2JJYCeko3eqMrTvIniIMVGjbWBYkK9bljBFySlRMBr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVvs+XAdtOT/K4jBzJg7YxJzCUaf3OrD2rVCmkJX52Qzx6T5qYa/qC2P/uI0Gd1hYXMLXsOvoKAql/zy9qnD2I4eXTpUg+vhPNUop6d6Fkx3mqvmQC4uixgVQozMOh53OKxy8mCzZ70ukrVfhxoYJC4TWhap3WDXDJqJqSXncj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gkJ2bH97; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gkJ2bH97"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5467152B;
	Mon, 14 Sep 2026 08:59:04 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30A1B3F882;
	Mon, 14 Sep 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401548; bh=2JJYCeko3eqMrTvIniIMVGjbWBYkK9bljBFySlRMBr4=;
	h=From:To:Cc:Subject:Date:From;
	b=gkJ2bH97V9TiuX6JV/Eo3Q570wFVj9wPU6FbS060blf7nxkeeJrdyjMFfzpfsTI2x
	 K+vfyLDxOuWEDk4hUec4czkZ2Qy5qfv1Nm2l1dyH1rS0VtQkBieFh9jjtH4C5ppYjd
	 Of/MZYf7EHuLxqABgv1o8hjclpaHfmQ+99Xae9iw=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: fvp: Add missing properties
Date: Mon, 14 Sep 2026 17:58:50 +0200
Message-ID: <20260914155854.123341-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to align the Device-tree description with the ACPI description
currently available in the edk2-platforms repository:
- repo: https://github.com/tianocore/edk2-platforms/
- at: Platform/ARM/VExpressPkg/ConfigurationManager/ConfigurationManagerDxe
Add some missing properties to the Device-tree description
of the FVP RevC.

Pierre Gondois (3):
  arm64: dts: fvp: Add cpu-map property
  arm64: dts: fvp: Add EL2 Generic watchdog
  arm64: dts: fvp: Add additional PCIe memory region

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 42 ++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

--
2.43.0

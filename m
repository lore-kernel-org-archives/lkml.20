Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B2B377550;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791012115; cv=none; b=GjyOExc954vlX5T0TrpUYfh2s388aShFbY8zBAqFXBOs8lhhSads/ioV+H2iZmPz3zcMeCaCT/3/u0GhNf6L/a+/5azeoM4qyKm+IJYBZpZUH9VHBUFvGRCucUjd2SVOLdXoG8Td9H60AWje53SJlbV10A07Ssg5RB4e1H9jSr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791012115; c=relaxed/simple;
	bh=WLaw8WNdTsVs/wqmgeBzRXibzeRyQgwXxQpiJCZIv+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqzXayvtZ0nDygflEDqm7l/QZ0OdFpdBmvFiEL2NsWArzg1YQIbW6YwIZPjgkazq0GEd0W5Py105eb6peSsv1bstM+usMP1vsznB9axJFQe38UB1tY/KONQi0yKl14gjdCkqQpv/8cdqwlccAgA1ixnGgrYcNACwQ2OTQYtgrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boqFFFpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boqFFFpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3991F0089B;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791012113;
	bh=Xoc2jJkqxh0W1JpflqN0cFCgG8i+IFymj+idMxZoelg=;
	h=Date:From:To:Cc:Subject;
	b=boqFFFpYrdheYDq+BAfBc47tcGIE56gKYmwaUXjqUzJa3whInDoUwlhJVChsCamqi
	 5CyFRVEV3w0BZGCqlUEVrcqZD0FU0MGIVHIT4bGVUPj7G0NMZ2LlVBIkBZNrigl2Oe
	 D5wV3/KgXlHANqgpjMkOI4tGv1dHs8l0TyDafQqQD03/DFyJbAUkDW/jpow6Qha6XD
	 JJxEPySjnF+FVlirMq2BclTauHUD11jVqit8mkWxRY2kozqP6XO/R85X3ea1MrueGk
	 ejVheY/yyjlOqkIZR/kxcD1J0FFco+7BGxg7ATVxZHDWinJ696/RlWtXIQyLRTDa0e
	 srdaOM1W+UmKg==
Date: Sat, 3 Oct 2026 00:21:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.4
Message-ID: <asCtEGcXwUoOHyMA@x1gen8.tail89d63.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.4

for you to fetch changes up to 2414ca8f5a0cafdfdb2b5899fd173adc09b5adf1:

  MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org (2026-10-01 23:34:22 -0700)

----------------------------------------------------------------
T-HEAD device tree changes for v7.4

Add the Milk-V Meles, a single board computer with the TH1520 SoC:
- Document the board compatible alongside the BeagleV Ahead
- Add the base device tree with UART0, eMMC, microSD, Gigabit Ethernet
  and the PWM fan
- Enable the AP6256 Wi-Fi module on SDIO1
- Enable HDMI output through the DC8200 display controller and the
  DW-HDMI transmitter

Also update MAINTAINERS: move the T-Head SoC tree T: entry to kernel.org

----------------------------------------------------------------
Drew Fustini (1):
      MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org

Han Gao (4):
      dt-bindings: riscv: thead: add Milk-V Meles
      riscv: dts: thead: add Milk-V Meles
      riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
      riscv: dts: thead: enable HDMI on Milk-V Meles

 Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
 MAINTAINERS                                        |   2 +-
 arch/riscv/boot/dts/thead/Makefile                 |   1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++++++++
 4 files changed, 352 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts

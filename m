Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76C72F28FF;
	Thu, 27 Aug 2026 18:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853995; cv=none; b=upE8GqvjH7LMDk5VaTk74iYvZwczDzjAtDVpoJwFf6DEx9Dco+wvfr8gOQZlVDxYEamqFDSXv7uIoaKh3qvf5Og/VC2f8pGM0nVsqXz67UAPjLT03ryOKhht2jxsvRYIayLxx/S/G82ZTRsTI+iEHnFcdOEX+Xr285DFAwOOMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853995; c=relaxed/simple;
	bh=GDQ4qyxjyiQjJXedyvUnkzGEolv8uzyDYtIRBse2+QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCh8ejXRgKS5WhLhS6Ld1lKDVTYMhgeUNGxzuYizeC+Gliff/IBJF5oei3AbvDXGzm5Z0vqG6ER26Mo6EyyVRWdVSbf9pa6wmh+uQOgcXHGjilkKOLErfnoMIjUhYFvzkjbX8gd5GSNQl16DjvSfsoiYk3ppUsgWWlaCCIa+IFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsMeXLkR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsMeXLkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CEC1F000E9;
	Thu, 27 Aug 2026 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787853994;
	bh=9v8mS/PK2gekS2IrJ6zb4wTI1VOvdN51N156CQzs2So=;
	h=Date:From:To:Cc:Subject;
	b=MsMeXLkR0v1ivkiEdTAHHNR2waV7TyzKg7zK4I2GzR0mo2yzKT6RTJaMpLt+1F5le
	 4Vmk9LDN01MdujK44obT0rNPCFu/uqRKDBb2ffSjDymoaQQdXjOmflI0udrCJMzfap
	 UQ9Fwy5g/DD4oxRLPnijfHnHC1Eco+hWRocxlx8XTrOzQRV4FewxVwjn00wbJzY1wq
	 yzz1cgnasdLpAdBHgLLR9A4G5Dr9nt/eAY4cBbZ84yKboD77KibNNKjlAzdgoV8Fi2
	 PzE4Pkgt1Aj1aAxDKCXlUd7lNotQMtYHdVcQVHuLgkFFHmZ+FEFCvEgl9m10bGe4sZ
	 ANndXMgxi+snA==
Date: Thu, 27 Aug 2026 13:06:33 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v7.3, part 1
Message-ID: <20260827180633.GA3385724-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull a few DT fixes for v7.3.

Rob


The following changes since commit e1c13aed4a1641550e8c9518c96f016e1d52d09b:

  dt-bindings: interconnect: qcom-bwmon: Add Maili cpu-bwmon compatible (2026-08-15 15:46:52 -0500)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-1

for you to fetch changes up to 5bb01c657ff9fc807c2c592ca18af34c4fc3bc6f:

  of: fix out-of-bounds read in of_alias_scan() stem parser (2026-08-27 09:36:05 -0500)

----------------------------------------------------------------
Devicetree fixes for v7.3, part 1:

- Fix possible out-of-bounds access in of_alias_scan()

- Fix refcount leak in of_irq_get_affinity()

- Add Qualcomm SPMI PMIC haptics input which is already referenced

----------------------------------------------------------------
Abdurrahman Hussain (1):
      of: fix out-of-bounds read in of_alias_scan() stem parser

Fenglin Wu (1):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics

Fuad Tabba (1):
      of/irq: Fix device node refcount leak in of_irq_get_affinity()

 .../bindings/input/qcom,spmi-haptics.yaml          | 116 +++++++++++++++++++++
 drivers/of/base.c                                  |   2 +-
 drivers/of/irq.c                                   |   4 +-
 3 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml

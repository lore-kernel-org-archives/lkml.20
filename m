Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8B379989;
	Tue,  1 Sep 2026 04:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238270; cv=none; b=rHsblUuq1Qb7A9HAOEAQKJ8M9JCayTDmtXKh4+6sQJiSxsH3TjJGsCbPfvQAu1HSzh/mXqAJRFu6EgflTSyZSxGI6UA4vKmC5LlszWbQEnQ736H1FFl0s2OLPU25wP0cEGEjE9T5S0cDAWnNYDKgyhvdUiYvctBHSA37SEGN85Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238270; c=relaxed/simple;
	bh=to2uNtMR2ciL31qDhayk3BF73by36s2XRMc0k978yxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWyVFZ8AhzWHjqgBhbFWHCImTnh+D+/u4pWwwRB6y4Y7riVQHOZ7S7Vtgq38P1VqJWUc7uyf3bbm8npVpcV3YUtoD5OzjuREgSkFGzgMIGvBEeoKHv+I/8YqOwrLvrGUXNwKGMhOFfrFfIJjhx3xS3cG91g5Lrp6xKFdRP3Lskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt53Hpbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt53Hpbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4791F000E9;
	Tue,  1 Sep 2026 04:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238269;
	bh=7IP6WyGEwFEVVxjfBoLriqLn51EvvkOVB8zNye3VTco=;
	h=From:To:Cc:Subject:Date;
	b=jt53HpbvtEm87S0/tF/VLq5rmQ52aQBTJUiwZlMp3cbFXCmovep2XcFzZFUEu4uO9
	 1i3FJW5vDziqIMomTLC8KQ/xyKegizg7AgqOzhmFE/4StHR8ThOn5d2tBxcbapriNi
	 fAcgDryNOA0W2oGcCLy+lmfDXEfZ+mXaZWF49AOFFcyjv1RHwSFnwF+R5fSCKeVXpM
	 0CA3ewqrV+2YSX3/BFNd4TuoeGXgyeS1F1PMEdeT6tjTljG4tjsMr7NydwU4889RPy
	 igJ07ecOWaucuOZiSb0mnR/SBVPQqCrQb7oNQ2BMb+KrkIhJrQQQ4t40QkJghTnb3d
	 YB7AW6YHRrv9w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] regulator: mp886x: add MP8864 support
Date: Tue,  1 Sep 2026 12:31:20 +0800
Message-ID: <20260901043123.5401-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MP8864 is a 4 A, 21 V synchronous step-down converter.  Its
register layout and voltage transition handling are compatible with the
MP8867, but its selectable switching frequencies are 600 kHz, 850 kHz,
1.1 MHz and 1.6 MHz.

Add the compatible and chip-specific switching-frequency table. 

patch1 fixes the vsel_mask
patch2 document the mp8864 dt-binding
patch3 add the mp8864 support to the driver

Jisheng Zhang (3):
  regulator: mp886x: fix vsel_mask
  regulator: dt-bindings: mp886x: support mp8864
  regulator: mp886x: add MP8864 support

 .../bindings/regulator/mps,mp886x.yaml        | 16 +++++++++++--
 drivers/regulator/Kconfig                     |  2 +-
 drivers/regulator/mp886x.c                    | 23 +++++++++++++++++--
 3 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.51.0


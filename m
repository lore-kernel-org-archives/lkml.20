Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057565;
	b=fyidks+jwxPhUbYUfQU6/I8d3FYv1z4oHikS9GPqQV1Sg1g4jV4p50XQROyyKlvCQX4q
	 To+XLz6rzF3CJDLE0n+oJRbhWAw7r2gd503pYbhKa9s7GfP5mBTjQRPF3rm30kBLgN3lt
	 kYAe6wmHQXdCcuzI/RT9lrPkugcj7rDh5t4eYpM/qXPb/EZ33UjRu06o5OysPGTj5W/cT
	 +V9K/yz3auFP1gO59w3ieYQsKWoJ2GGVuZ0wxUnij7QakaKd6tJ3DP8Sxt0Yd6NzSV+oc
	 1EUx1X2Q3w8BjERlCn0vBha29O4RtaIqEruYlOAN2gYAxreosVOiXyHu3Sb+gXM2u9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057565;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qWpDpMLmFaXT9JtQQDBaik7ooyuX4varZ4Dsj2I+Kpg=;
	b=lSyYJ8PzpyNIKmKg2PfmC7dHT/tgnc9/tE7Zd/x59VM8Tk/tKZhkvuJGgRXY2KcgAvKs
	 U0pD3G/nwoH5a5Uz3X8EC7Vk0jO3shoZpVV50CovxrKRe8DVpUZvp9HeI47qC8zIvpdFO
	 0HAs5BN29cpmLRhsXXhVrsaRCpp/9OySKrRXSVej95SrZEA26YWQj3VtoN7KYwDb1Rplo
	 c+EPQrXzCtNzBr5T5Q3reYQk6AdGlVoCdv30tEZHdHSJxl/4gpYQnp+etPsocTW1y6nXs
	 Zw53sp+ego4SDCZqrETB2c2jKWxTP2py1ezoG2GXB4wZUGNNAreWm4RhRVIPXrZJnOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoIggnBe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoIggnBe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B261F01825;
	Mon, 26 Oct 2026 23:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057565;
	bh=qWpDpMLmFaXT9JtQQDBaik7ooyuX4varZ4Dsj2I+Kpg=;
	h=From:Subject:Date:To:Cc;
	b=hoIggnBe/qNh544MT3CnwoaIwpMDkpEMmEC0hUP4Pe65akZIehdjJ8g/P7lN1zo0b
	 LHjWWKkY4+u9nvEMdWRXOr/fi8pSZAiPZjXQLjRZzgbG1pCBo7Hp6glb0lHlXFOLxh
	 VBIlYSs7d8KBBOJznryrEeUIuTQN0j6B1VJddfl1Zg7zFycRjRuwQpvhBzg9s4Q6pi
	 CdS7MsHkhPcUuRKe0+/exi2qzMRJUIMKg05K/3RoK06vQ7mvaJN201xpGfE+hhnBap
	 IEQJkcw+h9A12zCpLoI/m6Hq4qL16YKPwr+cn7uYR1pl493VwROw9gXmx+VrYB1YCK
	 +A5033KfvdcdQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] regcache: Validate bounds of regcache drop requests
Date: Mon, 26 Oct 2026 23:32:06 +0000
Message-Id: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfi32oC/yWMQQqDMBBFryKz7kASSxe9SnGRxIlOQQ0TK0Lw7
 o518eA/+LwKhYSpwLupILRx4WVWsY8G4ujngZB7dXDGvayCQsPkM/ay5GvrHSdW/I7BpvSM0Zk
 2tKCBLJR4/8c/3e3lF74U16sIx3ECo0SVOH4AAAA=
X-Change-ID: 20261026-regmap-drop-region-min-max-b1ff4cc203b3
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SIT/JXfH5vUxxh4RL4GHO8jvXBQcwSW/kIt1H0Kp98k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuP5ZQeb0/sFLUf9UM3v2eCXp6ercXeDpdSelw3ys7a
 /5qsynsHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI5xuMDEtvWFZnfz7caN6Q
 s/praPfiI8mxziXX9x/299suHeqUmsvIcHEp86xtid+trYSV7bIeT81elX9qY2PZs///u9Nuztu
 sxQoA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

It is not valid for a caller to try to drop a range of registers from
the cache where the minimum register is greater than the maximum register,
and doing so is likely to trigger bugs in the caches.  Reject such
invalid inputs and add a KUnit test for it.

---
Mark Brown (2):
      regcache: Validate bounds of regcache drop requests
      regcache: Add test for bounds checking of regcache drop requests

 drivers/base/regmap/regcache.c     |  3 +++
 drivers/base/regmap/regmap-kunit.c | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
---
base-commit: 2dee91ee94eec85d09c13c7ca83e3005906d3732
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4
change-id: 20261026-regmap-drop-region-min-max-b1ff4cc203b3

Best regards,
--  
Mark Brown <broonie@kernel.org>


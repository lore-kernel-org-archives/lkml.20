Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEEF4AB1AC;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820286; cv=none; b=H/ZJ0uoBErr4xmkf93FRdLkBvcK651cB4CCIW8MKp6qpDIOHYxojWIYjs6w1bnT1bVt/Vn7Vb/x2cAEEBzpFRB9S8ywN8WC4FagM9quGtX8nLmsjKpRuqOmuM5UnI7b29kp2UOWm/ODzCu7CWjWvYO6UYkqEv3aZC+JPL4/sQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820286; c=relaxed/simple;
	bh=OnQos5Xpwnro4uBKQCOScxNwAUrZ1Ige4PTKboABLnA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gTM7hai3YHbLpNhiAXrJT9CE44+ya1MJKnEITvn+VwM6L6DjYTYXALz8ABXR2ZKgQZaQpRgXUv+vh/3+LQNl7c4lbpw6ilOiD1zskeu3hYmANyhwjsAeNbYtzp2MzNMm67UCd0F3gzvKjKk9P/p5lcUrhUEHD7T+8PAw1MttHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE/G00CL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE/G00CL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18073C2BCFA;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791820286;
	bh=OnQos5Xpwnro4uBKQCOScxNwAUrZ1Ige4PTKboABLnA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HE/G00CL4kqJ2sKYinhI934AcrA3Mo5eANQJBpOvSXpTxCFqWovJp/0wKykxEbfM6
	 L5e9TlFREGu2OSnvEVBxvQ0nGOgNDKTX7b0r/2jjVyS15HZvuusyypg638wvE7D7W0
	 dOBB+SzFpOote3mSL76k02NfYCMfCnZw2Axm8dG6vqxuOd4usMM7gk882CILnoCHCq
	 DfEgvigaTZ1XjoBsC2RxuRnIkM7J7gZQxUoBXJX+hcuuiZTxEG2+svUVw29UjBPgkB
	 XKHd33W+hGJrqXP50lIXXIxpRq+L9XWtiy6/aZjIrG3vvEVR4KgMxB3oGEtQxh7fb7
	 XvfVfXkhBlAyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007EECA9ED0;
	Mon, 12 Oct 2026 15:51:25 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: HP OmniBook X14 / EliteBook Ultra
 G1q cleanups
Date: Mon, 12 Oct 2026 17:50:57 +0200
Message-Id: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOIBzWoC/5WNTQ6CMBBGr0Jm7Zi2En5ceQ/DorRFJkIHWyQYw
 t2t3MDl+5LvvQ2iC+QiXLMNglsoEvsE6pSB6bV/OCSbGJRQhRSiQjtHfBkesZ+QR08t8xNXmaM
 ZnPbvCUWbX2TVqtJKC0kzBdfReiTuTeKe4szhcxQX+Vv/kC8SBdalUF1piq7W4ma0Z09GD+f0g
 2bf9y/OZqmA1AAAAA==
X-Change-ID: 20261008-dts-qcom-hp-omnibook-x14-cleanup-0b4318b27d1d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=OnQos5Xpwnro4uBKQCOScxNwAUrZ1Ige4PTKboABLnA=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzQH7AyScwbjWSJRaa9My6uZbV0JAVowAUE6De
 MHXJ3g98MSJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas0B+wAKCRAP04sJC6ZC
 t6lbD/9eEr8LN92e6cuUX8yvkeBw0e34xIWAJKN26ZCRE3Wbyt6rotvjF616sHrVD0qQSYrvPk8
 ETLfpKgwKn8MtMYcdDEmVVQbnX4YqGB30Pqz32M/IW1aGc9XWlZqmlAvzedeD8Qr61wpvCi4RlO
 uJnUfzUTI2k31fEjitWzNnnneMEBjPf38EYzuP8UQmM4EuBC12zQ9Zna5NXQzN4MEhKVQB7P1Id
 ObysjSxVf7wh4G7Fl95Zd3g7eTqTjoDBHeqh25vZPQUswFo65sGStnU/wMPjIFh//z2SHvfYfvd
 +NkSoKcUwG74hHE7MvQtUVXlHY6ScTZKfTF92LqIP6R9GXkv4SrxiwcAG3UdvCSs7j1L8tV15fE
 zzSXB19QiWhdeRnEnR0zyH8VAzlyefvK8Mgr9ni0ZONl3+nDRk0+HUQsN/uH+QitAELYwOyeFYR
 ic5tFGyC9eByvDLRcUJD9bGl/aGrr5ZVdrBjnS5O6LpsJKCapsMG3gzhJMknaf755qPUhG5DGJ3
 bZU8SjBp1JdFwWIdqFxSJDtitTR3gqB4tIJW5da01NtBf3MT6DOHonELlHoCAIfjo/7xkWhZv0X
 Du4K1gjU0TI258cRfKaIOe6PUFZxkXpJ4MKMb150VbOVVGclvtROQqO27v0fpB5i1jmScDNzZr6
 sB0obC2B/zN0rvQ==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

This is a small two patch series that cleans up the device trees for the
HP OmniBook X14 family and untangles the HP EliteBook Ultra G1q from them.

Patch 1 consolidates the duplicated hamoa-pmics.dtsi include and
chassis-type property into the included x1-hp-omnibook-x14.dtsi.

Patch 2 makes the HP EliteBook Ultra G1q a sibling of the OmniBook X14
boards instead of a child, so all three (2 x omnibook, 1 x elitebook) are
at the same level.

Both patches are pure devicetree restructuring, no functional changes
intended.

...Juerg

---
Changes in v2:
- Patch 2: Mention remoteproc enablement in commit message
- Link to v1: https://patch.msgid.link/20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com

---
Juerg Haefliger (2):
      arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate pmics and chassis
      arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop omnibook-x14.dts include

 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts        | 2 --
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts        | 3 +--
 4 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
change-id: 20261008-dts-qcom-hp-omnibook-x14-cleanup-0b4318b27d1d

Best regards,
--  
Juerg Haefliger <juerg.haefliger@canonical.com>



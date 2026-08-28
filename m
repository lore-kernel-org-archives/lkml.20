Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914403F1073
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787960489; cv=none; b=RWLSKpeKVS1UAw+o7tb6rNzfGWe+sA2NzJcZW4zO8su2xoNQ5DQ8mk2bviXXfzWH+1CTNAQMRL2ZXvhKRea1d3xL3u+Aagf6covh65fBdWqs6gJ1l6Bluw1ArusPk5z7kw3pC7CtYVcBddJOD95CXfLja1tT4iiZO5qtUg8xjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787960489; c=relaxed/simple;
	bh=szZYi1/PWtC6cof6wC853VNeZydNhRJNJ58cnUeVUBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AUYLfYwg5Wczlmixjjiy7HjQkWJ4QyEmSUh8NZp7zqV9SgNziNjfMNXgaaAZ/xT+Bvq5kvG+6hqN9zBBfV1UHF3/A32wKM2bSYXOSdjur46HmqUGfPi/yqMeDdhVgUvx4Dz51yeQezJLlqym/nRAP0U61Sz4SnhN60+dYfSH5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp85lLzu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp85lLzu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BEDDC2BCF4;
	Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787960489;
	bh=szZYi1/PWtC6cof6wC853VNeZydNhRJNJ58cnUeVUBE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mp85lLzu34Yt7/wEigYFyn1/zS7sT2T0FaXc9D3+kjgsvPUiWPrp9fDzIUcVTRQHH
	 ZOKK4EnjLIy2Dipzg0ljg4aMSB7NG/c9G6U9ADHnXXZppm5Q0/m1bbVh+xeWoCFA+m
	 OnX4YvG8E1zP/YgWRlEa/3NV3VXtXv7lxamaf3N5mLNCMsi7WicygD8tNIlYiQelkR
	 1C2Ge/ljJQix7g73oxbeZLQNDIcCjhusR/m6xM4t2YZq15vc+qb554DRPw+iLt4EGZ
	 XkwmNuO2uzficgy/UGU8/1DHkyF0XOVh2XKp6zFykvxzEoaWIQaaKgN1O3jE7u5/9b
	 uDnVI8Heu8uJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1325AC61DBD;
	Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
From: Johan Jonker via B4 Relay <devnull+jbx6244.gmail.com@kernel.org>
Date: Sat, 29 Aug 2026 01:40:57 +0200
Subject: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260829-cpu-v1-1-33dca576db92@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIgckmoC/x2Myw5AMBAAf0X2rAn19ivi0NZiD0p2EYn4d+U4m
 cncIMiEAm10A+NJQqsPkMYRuNn4CRUNgUEnukxq3Si3HcoVaW0HbGxeZRBKawSVZePd/LWLkR3
 5ExvjSNe/7/rneQFSUuj+bgAAAA==
To: Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>, 
 Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787960488; l=1108;
 i=jbx6244@gmail.com; s=20260824; h=from:subject:message-id;
 bh=Q4ZSXnEGPX/xMD0x0AdrlN53Gm6CKYRCS3MOUSLsunY=;
 b=Vw6eld+44Gh/khFTRVcv/sOa5YWLdfmEdWq01JtLn4DNUXt+gABYGzH9ZTyfxX2eCa+C2CNu0
 VDZe77oCt0WAimJY5KI+u9V3ya0gu5smP2WQO5UaK52asUC0kxxqc/7
X-Developer-Key: i=jbx6244@gmail.com; a=ed25519;
 pk=MK5Flx1ndjAF0uwXdNm8VvvoghD4KWCNd2hQE8QGyl0=
X-Endpoint-Received: by B4 Relay for jbx6244@gmail.com/20260824 with
 auth_id=971
X-Original-From: Johan Jonker <jbx6244@gmail.com>
Reply-To: jbx6244@gmail.com

From: Hüseyin BIYIK <boogiepop@gmx.com>

RK3066a CPU1 fails to come online. Fix by using
a similar mailbox construction as in use with
other Rockchip SoCs.

Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/mach-rockchip/platsmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index f659d894bfae..d7d080c29f3c 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	if (ret < 0)
 		return ret;
 
-	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9) {
+	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9 ||
+	    of_machine_is_compatible("rockchip,rk3066a")) {
 		/*
 		 * We communicate with the bootrom to active the cpus other
 		 * than cpu0, after a blob of initialize code, they will

---
base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
change-id: 20260829-cpu-c518bde9b473

Best regards,
-- 
Johan Jonker <jbx6244@gmail.com>



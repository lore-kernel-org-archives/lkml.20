Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6230442B12;
	Mon, 14 Sep 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384902; cv=none; b=NbjBBTMg2NOk10t93MvorrWEE4cXgqmg5kZWwng4E7hcaSbYiqESSnwpJPYwSIVdZe5vsDuSVhv1yLYWZCZex6Sh+PgHF+ILLDJu3COu5ynnXd24gxaiAUcJzAT5Uy3MeeSMpujkH8Q7Zz8wAJAFJJFreTsvuqUj03lc/CN/jEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384902; c=relaxed/simple;
	bh=8CPNzfXXQkXjqXEZK66MC05qLo563eN5yGa28t3moAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DVMiZyr1JueWGts6uIVCdtJmMpyPHg+zet8NH7QqcoLIVz7w9H0vf2sJGEgTYBDOhIZAtaNnLk4HfQWfBXHTYNZx7JED53Kxz3qBuSvnKMNTEDZ1AIiajv5syBUgh45KfPU4iYZ3haszKqLi+h8/708Pmff1Tu5u0J6Q8zbOEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arPNEJa8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arPNEJa8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08E14C2BCB8;
	Mon, 14 Sep 2026 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789384902;
	bh=8CPNzfXXQkXjqXEZK66MC05qLo563eN5yGa28t3moAA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=arPNEJa8e35n5gN4GJo7wd8XJvvTRLWe3MbrW+x20onq9x3j8bzt8OODWzkuas48t
	 Dc4U50cUM7gfCPNAoohpUu8LIogDPmHvWgnAcb4TXF4ysj8wEIolky0VpYsckwV6ov
	 GfQ1RGklOwhvn2ptfJa4lyOFxhDpQjRHffmzMOlV3bkjuWfnJHjVUzyDR0H3YPHTNm
	 AJ+a9xnjBwtcYilXIrYImGw/vsNhwzoZ+J2EXeMP8l1JoayqFL9f7Gsg/A5cN+lrLT
	 KFRyGSW0QSHYMXGstydUGQoF7/W0/e3iqccUOEnjpWJi1tERzdKLkyZTmFUj7xZ3Hu
	 gtfT0oYlyXKqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97ABC88E50;
	Mon, 14 Sep 2026 11:21:41 +0000 (UTC)
From: Maria Lisina via B4 Relay <devnull+sekoohaka.sarisan.gmail.com@kernel.org>
Date: Mon, 14 Sep 2026 16:21:31 +0500
Subject: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is not
 initialized
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com>
X-B4-Tracking: v=1; b=H4sIALvYp2oC/4XNTQ6CMBCG4auYrq1hWiDUlfcwLtoyA034S4uNh
 nB3CyvjQpbvl8wzCwvoHQZ2PS3MY3TBjUOK/HxittVDg9zVqZnIRJkpkNwNM3a8m0LgNZpnQ4E
 jkSyqrAahCpYOJ4/kXjt6f6RuXZhH/95/RNjWv1wEDryS0hpTEpFVt6bXrrvYsWcbF8UxIRKhQ
 eekqbC2lL+EPCZkIsBUKAxQppT4JtZ1/QBcTp+fOgEAAA==
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2463;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=X4qdixAU8o/DioyAqR1f0aRwmV99DvMST7JyVMM/pyg=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqp9jEr2/RafuZN8XLeg2a9rt4Oef57IBy8oV13
 mIQs+N84gKJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqfYxAAKCRAT637qmaOf
 ogVTD/sHI/nnVU7P8mpgE4SF5wD0se1ghune6fC6a/Ta74TDiqUgJd6RanSpMg6bfj6UwpFzuTT
 YtRjIextWZ+Yv4r6OjSXPnxdcL7S8SH7Ruso00unF/YDMfo6bNsDPCWzfCQlEpdpdc6m1EUR9kJ
 4K4dUePlLhKc/NZfktlV2ETYkEFqli7EyC7xXOSe3jcra8pN/9JCXSP2VRONw3kzeP3mEkfSHTS
 OKP+3pv2ZV9t/tDi6Ke6w/FAuJazp8r+b54BG3jfF+MYc5x4RVqm2t7jLawwZmnu8eeGixMCKLZ
 MbUkMy5Nh7I2gHjRt9IoePZxd1Phh0oLV7CEnt+lPfzbNEay4X05DYuOuOUD4V/FBT1Wus1fgJw
 BeEmoxbJwrc2pdyU5/QW95LTiH/Kd+Dwak4zmmQxY2doV7pIdRbvpY/NrCGwe6xX4fcoppQnyKb
 PD13SDJ4XZ7+16+pYut5JPgDPAduPpiqQV+qh2Y1FNxGoyc+f0dq/1ZW6S/zUcKBo5SSXa+vWb6
 tf+6dY44dWLxhxBsYxc7Ftked5TeuBEFlN1iRl5klfqiENn8NLblo7j6ood5rSEFVMEEmhKkFEr
 WI2uCWHnKv1IqSwZbRllbodt/NaCADSiydJXH3URqhi+k9fjSj4msB7Qtsosn+gDktobMg8b6vr
 5G8g8ncrTn/E9AA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2
X-Endpoint-Received: by B4 Relay for sekoohaka.sarisan@gmail.com/default
 with auth_id=1030
X-Original-From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Reply-To: sekoohaka.sarisan@gmail.com

From: Maria Lisina <sekoohaka.sarisan@gmail.com>

The original code expects DebugFS to be always initialized which
causes unwanted warnings when DebugFS is simply disabled.

Therefore it spams dmesg with these messages:

  intel-lpss 0000:00:15.0: Failed to create debugfs entries
  intel-lpss 0000:00:15.3: Failed to create debugfs entries
  intel-lpss 0000:00:1e.0: Failed to create debugfs entries
  intel-lpss 0000:00:1e.2: Failed to create debugfs entries

This patch adds proper check to intel_lpss_init() and
intel_lpss_debugfs_add() functions to prevent writing to
uninitialized DebugFS.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v4:
- Keep the dmesg messages, instead check whether DebugFS is initialized
- Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com
---
 drivers/mfd/intel-lpss.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..d45728f46c499b3f0c3713d30a17b0ae12106095 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -146,6 +146,12 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
 	struct dentry *dir;
 
+	/* Exit if DebugFS is not initialized */
+	if (!intel_lpss_debugfs) {
+		lpss->debugfs = NULL;
+		return 0;
+	}
+
 	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
@@ -538,7 +544,15 @@ EXPORT_NS_GPL_DEV_PM_OPS(intel_lpss_pm_ops, INTEL_LPSS) = {
 
 static int __init intel_lpss_init(void)
 {
-	intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
+	/*
+	 * Check whether DebugFS is initialized to
+	 * prevent unwanted dmesg messages.
+	 */
+	if (debugfs_initialized())
+		intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
+	else
+		intel_lpss_debugfs = NULL;
+
 	return 0;
 }
 module_init(intel_lpss_init);

---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>



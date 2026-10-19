Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604848D874
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395318; cv=none; b=rpDQNxtmNb21KU9fP1MrgBi5PwAODZ6oKWWOZLX56UgHdHjU64L3odB1upyorLN9SJtFiJ3A70ZlPwPfEiaGtYELhXs6qVZyJoxc52oqemA2Y8+3qcLyd/1QTVwRVpXKowN6xU/MX380atf3f0BfvPnS/Y7DhfvfVOWZUJ4JXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395318; c=relaxed/simple;
	bh=gL2AwLO62UtKz+GVd/oR/psj64G339PMmz9OxdDfFDg=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=dYhlYw/IC48O3SfzXmB1F0FyKcPIWSuZbhEjmU837xEmTE6bZw4Ao5dGto8HrCbD6oDIRdHywcgq3k5CG6MFMAsw9sXAbHtRaoNdXfzFlYjmtlZ41EUcHogo5qN2HUu7GA6jk1xIWiWWPvcg/o+dOsNt9HbgS+P7gplBvB0f6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=za8XM3+w; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="za8XM3+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395305; bh=c/iHdmWhSbNVHm7zQDWZz5ZIKyCY+s/HyPEs5x6Fd6c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=za8XM3+w7pnEBnRVw9RuRufdmQXhh3YQq6oNMh6v1xJ3cznb1uEwkiiLPaAFqOng4
	 34AcBXN/tDIwW1OB/sc7f01HvODF9VGbRVLQHb1egrWqHZDRH8pbOCNFdlDR8AEdj1
	 cFzSaRXc/jF2jsROChxyMmrJN/LbrIZRo9rPGxWE=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395302tqiyl744w
Message-ID: <tencent_EE73134E88CBB73A521833EEC70B2B546908@qq.com>
X-QQ-XMAILINFO: MBHEkxMsYPCYhz3hlpcpc9R91n2xC+G+FjBGayjKqDK1lVSaOlCHnZ2W/i4AVL
	 6aPoU/JuT27hFu+dOylO/MfYWYIuCe7SbYmZviYKPvkQA4W9h5cnlhSuv+9YaWqZV9GyOdv8B3lQ
	 doMARKzaVhUqHgdjT+4KpZN4drCkFLNKzeSOtv/zhwYa6HU7jWQh9QZTgd/RwUFXyjl4KXhhbshV
	 Mak43mThyNZ9knUs8SVyMudUpQ/IlRkJaDvVdKOzR3B6L08Gn0pJvWxaG8WhqKNAMWQLHwSlpQKy
	 b5Otcppy1uLYBPsX/P4SywKk/PP+hiiwU7VUyDuOWriXLUgidOJU2Sillv6usY4bBTvDd0094E/x
	 vvjj77xNeIio9BM0b45hVBncFtgmXZH7cey7SGObYfgnaolmbjXtLhAtMceSjGON16AUb6871CGK
	 iGs9g8lwcUs0Hbc+7rnLwdWP0M7CXu88RaCfNDln2KvAPB/1GU51NWvbrRcfA/oQxMt2zi8HRt+J
	 8oCEaSKPSz+l0m9mQOuZB9RN/pZYHSkiXQC3ctj5k7uEvwGLqJXBdCjz/BeNV3Ftu9Y++HKhacxR
	 aif2asGD4xtEyShpDJApBY7vCiHma/BEqHlqge32CjvQUrX3cPput+9EkDxCIkhXcfgXf1lyaxde
	 zMArFHQ1qUEqKaYaAslkoDeRZSNPrQewDY60GM4schzh7M93XuUKJffk6X+AAgE77PyUWSYShbBW
	 WATKVdfSShjUWL9O+/M7u0VI4yQKwhnSHhJvueV2qIflrBmhYmH6D2vbmF4pylNNYZf71Vi5HM2g
	 kaTWKNheU8n6QaupcxyMemORgaEr9vmsyMyVIx3ithYRYtDN/3WrSVxoFvai5Ak7Z3SSRaH9Kdrk
	 gzatF348FwuynRl/Wwo7hEQYYAvYCfjbhZlnZ2DDjMEOdDtpzA7/5pt9SoBYYOd1AxQvRjaHek9Y
	 nEQU3EttxNkO4apanjJhMkOQ4aF4CwoTlKMU8sIQFF/vgNzLDk/4kfQsg6J7GT9EuYBJ3e1DqtHx
	 jx84yh5vzgmmCkvKVXthtC7vOPDkScvNgTa2uWK1qL2WmdWqafyKoSURsXUwMZQqOGJBHwmNqDu9
	 KhhBxU
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 04/15] arm_mpam: Fix infinite PARTID reset loop when 65536 PARTIDs are supported
Date: Mon, 19 Oct 2026 15:33:30 +0800
X-OQ-MSGID: <20261019073453.2142856-5-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

mpam_reset_ris() and mpam_reprogram_msc walks the PARTID range with
a u16 counter bounded by mpam_partid_max, which can be 65535 on
hardware implementing the full 16-bit PARTID space. After the final
iteration the counter wraps back to zero and the loop never terminates.

Widen the counter to u32.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..61cbc75625fa 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1720,7 +1720,8 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
+	u32 partid;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1777,7 +1778,7 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
+	u32 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
-- 
2.43.0


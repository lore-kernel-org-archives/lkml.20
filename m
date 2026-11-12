Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489204;
	b=YTZm1SR3JkcDTfF6gbw25IrY2jXOcJ1dm+pEY7vXFGejKiRkQysaGqXYtilMYRBuNfxl
	 NYgnJ+bGOnSB0kVrP3C1fJwRTYFBUrmU9STQ/5nFFDo/F6PiY+ZIAh2rhg7i9rz6RlsRK
	 jXlDtrh0iNk5cY/V23G+i/WX+J79BKobUlKEvSGZ9Hb1VGd9SArHhhNTONAWR4DpL3hco
	 d7SqvVVwqoOTH95go049vAzqUj2a23ntq62AaUrlmBJZF616gZ8UQwBEHkuNOlFMOp55T
	 J2a/U0HGXupEqnmv+fAN0co/TJJMhae3MvQiI3BDsiHfQ9UGo19u3+IlYJnDYui2e4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489204;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hFS8yRfxQ5OZUtkjC4uzd9WD96DZbQ+krAj2khYgeG8=;
	b=lqzEnd9YrqNxa7wsZVykgKzv6YkrjrKz+ttToRjYR04W2VK0gezHknOWqMUx6kGA/2Ii
	 swzMlN/tmyZnHg81pTMzDRT8einUKUNYHq31Oft9Zcm+W1DNmPjc6emwPNxatnYS8hulX
	 TfhIlTXK3eNCgPs8i6de6LX0XEq5CwXOJgLIcTEt8qVTwPnutvOYF1kC2yGV7sIcBoR0T
	 +KlCjQl5uJ4dMJd5vQ1ClHP0U0r4lshh61TOwoQPDIyZ43mf04kEWgKBjCK8VQ/MeWQ0v
	 i9lX79odMQUpSHDNAL+6kLMUz4No7io4/eVFcwc6lvq4JXrvJ9gQ/kBHbkecv6oFbRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k2rEr47l;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252360A2610;
	Thu, 12 Nov 2026 13:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B252360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k2rEr47l
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hFS8yRfxQ5OZUtkjC4uzd9WD96DZbQ+krAj2khYgeG8=;
	b=k2rEr47lZ+yX0EcB1+iTV1UnbdloEkv9yMsupDOd3MOLwnL7zV5rLYzMSaY8jSogwybKzQBoY
	XQfXg6cxmJ2SMcG7IAIG+ZJwovPKaG4Msy6y+pPhG0/AXpiSoksOPZyt3YOB9YtCKtd5CurMPIc
	gdEs1o/NuK/suohR8r0M5Dk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jQLQr0JQdzpT13;
	Thu, 12 Nov 2026 21:12:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E97340579;
	Thu, 12 Nov 2026 21:13:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 6/9] fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
Date: Thu, 12 Nov 2026 21:12:51 +0800
Message-ID: <20261112131255.4043381-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The controller lowers the maximum bandwidth control when the measured
bandwidth exceeds the target, and relies on the hardware enforcing
that maximum. A hard limit does not service requests above the
maximum; a soft limit services them when no other request is waiting,
so a group without competing traffic keeps exceeding the target and
the controller never converges.

Add resctrl_membw::max_is_soft_limit for architectures whose maximum
control implements only the soft limit, and refuse to mount with
mba_MBps when it is set. Architectures that leave the flag clear are
unchanged.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/rdtgroup.c   | 5 ++++-
 include/linux/resctrl.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 518d89b0c67d..9f10b6ceff8a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2613,6 +2613,8 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * The controller needs a counter for its event in every monitoring group.
  * With assignable counters that requires a fixed assignment mode, with
  * counters assigned automatically while the controller is in use.
+ *
+ * The maximum control must also be a hard limit, see max_is_soft_limit.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2622,6 +2624,7 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
+		!r->membw.max_is_soft_limit &&
 		(!rmbm->mon.mbm_cntr_assignable ||
 		 rmbm->mon.mbm_cntr_assign_fixed));
 }
@@ -3370,7 +3373,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM, linear scale MBA at L3 scope and an enforced maximum";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..933bab2b8289 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -250,6 +250,7 @@ enum membw_throttle_mode {
  * @bw_gran:		Granularity at which the memory bandwidth is allocated
  * @delay_linear:	True if memory B/W delay is in linear scale
  * @arch_needs_linear:	True if we can't configure non-linear resources
+ * @max_is_soft_limit:	True if maximum control only marks traffic as low priority
  * @throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
@@ -261,6 +262,7 @@ struct resctrl_membw {
 	u32				bw_gran;
 	u32				delay_linear;
 	bool				arch_needs_linear;
+	bool				max_is_soft_limit;
 	enum membw_throttle_mode	throttle_mode;
 	bool				mba_sc;
 	u32				*mb_map;
-- 
2.34.1


Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F501D9A70;
	Mon, 14 Sep 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412937; cv=none; b=Fvo5EFigtmYLe9MW1+5GQMIB9KtcR8pQA53ytJjpr/KduAfqSou2Wt4pkF4WG2C476m3vYNde5N/uqVC8EcqZu5Kset0ok/PsHTpg3zEBJSfZxxGz8LTdSJ0eYywYGY4aafzKkWDzH6I2TziL1GtEsS+P3Sdwz6XKFyR/KENGc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412937; c=relaxed/simple;
	bh=RIsRANN7ugEQL7qQXQlS7dthjTbi6u3BdbqVlpeEhug=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uUr1nvitIUmqI82OuJX8FOIZpCB0YN1xSEnLEHkuVP8zUfZRyhRsIrJOfwdcvmBrJrdqyaXGTMT0/nglZDSuwOLszvbc3plEIHdpXqJ3vlwf8b0d4C0zY9qs77JDR4w2UUGECkriiMxCKyWsdzrjlYUSGMq2dnO2yqV3k9833N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CVtfoLDv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IrYtzDyR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CVtfoLDv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IrYtzDyR"
Date: Mon, 14 Sep 2026 19:08:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789412930;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8UVXm/OOuA6eGCTD056zFxzSx81ByMvVEh9yzVs0F4=;
	b=CVtfoLDv3lZaDaB6NRDlzNj2nn4ubqVtcyT4S3VSykquSPVVJEv1LEpz/P2IHIngl6GIM/
	xLzTBJZVPGNmb/29O7498mlU17nD9PQvUDo4PuwY8vlszkXUMluGMXnMPxltpq9Orlo/BI
	VHpH/869S/kmWIHwHz2JIRu2DUkKHvXOThA4L08W5bHSG7Xcr3UOLIpyziOCF+Q7kwdMY2
	JselFqtULroTtZiT2ZMoADgOzG8moDW19WMyifYngrjWU1+/8rurrjr7gK1+a9zS8oPGiL
	32kdP48+YLcrIUboxftLXWT/twmru4BS2gS/xv6nTL+bVXBLJ6/DUUv3YCSPXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789412930;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8UVXm/OOuA6eGCTD056zFxzSx81ByMvVEh9yzVs0F4=;
	b=IrYtzDyRM4hfYJlfj2HRR860RKmwlQCtqo8JSBEV4Lxf3JUCUOzp6E/Pb5hDP1qeYqbQCL
	8zfmzzmo1g7kwKBg==
From: "tip-bot2 for Dave Martin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
Cc: Dave Martin <dave.martin@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, Gavin Shan <gshan@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911163613.1131447-2-ben.horgan@arm.com>
References: <20260911163613.1131447-2-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178941292892.1720534.9402544682385889030.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     57a354d20a01287bd173b13231eb5afcda337eee
Gitweb:        https://git.kernel.org/tip/57a354d20a01287bd173b13231eb5afcda3=
37eee
Author:        Dave Martin <dave.martin@arm.com>
AuthorDate:    Fri, 11 Sep 2026 17:36:11 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 14 Sep 2026 08:15:11 -07:00

x86,fs/resctrl: Add resctrl_arch_preconvert_bw()

On MPAM systems the rounding behaviour of the MBA control would be improved if
the rounding in the fs/resctrl code is removed but this is not the case for
x86. To allow any rounding or conversion of the bandwidth value provided by
the user to be specified by the arch code a new arch hook is required.

Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
This is currently unused in resctrl but when plumbed in it will replace the
call to roundup() in bw_validate().

Signed-off-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Link: https://patch.msgid.link/20260911163613.1131447-2-ben.horgan@arm.com
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/=
resctrl/ctrlmondata.c
index e74f1ed..6204448 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -16,9 +16,15 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
=20
 #include <linux/cpu.h>
+#include <linux/math.h>
=20
 #include "internal.h"
=20
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return roundup(val, (unsigned long)r->membw.bw_gran);
+}
+
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *=
d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2c..10dfdca 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -505,6 +505,25 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_res=
ource *r);
  */
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
=20
+/**
+ * resctrl_arch_preconvert_bw() - Prepare bandwidth control value for arch u=
se.
+ * @r:		Resource whose schema was written.
+ * @val:	Bandwidth control value written to the schemata file by userspace.
+ *
+ * Convert the user provided bandwidth control value to an appropriate form =
for
+ * consumption by the hardware driver for resource @r. Converted value is st=
ored
+ * in rdt_ctrl_domain::staged_config[] for later consumption by
+ * resctrl_arch_update_domains(). Is not called when MBA software controller=
 is
+ * enabled.
+ *
+ * Architectures for which this pre-conversion hook is not useful should sup=
ply
+ * an implementation of this function that just returns @val unmodified.
+ *
+ * Return:
+ * The converted value.
+ */
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.

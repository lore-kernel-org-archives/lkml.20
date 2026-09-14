Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7DD34DB56;
	Mon, 14 Sep 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412934; cv=none; b=qKt8y49+FTlsNvAeP3kxIS8+bHd7i6JQTFGGSX3B3m7hjIrLGcfxfrnth6zTnjlHj52HzEGmaQ8VU0tMEpRJvkHafE9uCT/OdHdquTRngHNwZ7NtyAjzqRfItb23dgvtRWBFKLbblEZWcLmUt6slMpSf0YaRAotoj485rlibZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412934; c=relaxed/simple;
	bh=hqxICu7CDPARlo5B8G7JHWNtjo64htzL0+lzlSJVEwk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=J3760FmQn2bipQ/2QKX5h0eNBhZHbISt/yYgV50NQWgpO2wWLluGwzYuXLk76+iUD5ffGBWh8TMgRO3RSohMJnb2EeO2teZW19IBl4mUQ7Z57+LN7zVg9U4vjwEFGyGtfslp5d7HTyFL2/4ZaYCEEpblm9Ie/spl2+pSgPQnXWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1AjVoDEE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C6ik4llC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1AjVoDEE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C6ik4llC"
Date: Mon, 14 Sep 2026 19:08:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789412929;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGLq6/IWz/vmkgebvaHJjD/JP+GBbLA+LlGh9f/3xz4=;
	b=1AjVoDEEOIOAKOUd6fvuJvVJMeBaN1pNCBPNzNN5a4u07pyKDxfiM/QF5KuTTd5QpuTst5
	IOXPXZMTUteqEC05EuiY/q0vCakohG3Ivbiokk/rusQEMBKEGQupouf+hIIartAxHrhM5l
	qCwboqxoTv1LNbCCdm3Fr0xpwbkWNkYwVGmsooQOaidWEWBIDo1fs9cu+4Q5mOfREi0Htl
	be1ZFtVW5WxNbbCqlO35P/5wn9g916WV3F/vvUBstA9sq/c58k3FIcmFTt1gpgdwNsrVEA
	Ufn8UjN/1hQTFM4Qb5VM3PvNkM3WgGRNxj+hPjXkF1lKhPipTgl+J62DGk1L+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789412929;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGLq6/IWz/vmkgebvaHJjD/JP+GBbLA+LlGh9f/3xz4=;
	b=C6ik4llC59PEbDTzYNziqhyj/d4XvDORe7jOInwVCsp0vwIP1ohg18ewdgMWN2H0Ls9eAI
	YzTBr8/cFKd2VTAg==
From: "tip-bot2 for Ben Horgan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
Cc: Ben Horgan <ben.horgan@arm.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, Gavin Shan <gshan@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911163613.1131447-3-ben.horgan@arm.com>
References: <20260911163613.1131447-3-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178941292739.1720534.12042226155070189903.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     255f92316ac1017478e9ace42cafdeb6c98c1f25
Gitweb:        https://git.kernel.org/tip/255f92316ac1017478e9ace42cafdeb6c98=
c1f25
Author:        Ben Horgan <ben.horgan@arm.com>
AuthorDate:    Fri, 11 Sep 2026 17:36:12 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 14 Sep 2026 08:18:23 -07:00

arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

resctrl rounds up the percentage value of the MBA based on the bw_gran. As
MPAM uses a binary fixed point fraction format for MBA rather than a decimal
percentage, this introduces rounding errors.

Without this additional rounding, if the user reads the value in an MB schema
and then writes it back to the schema, the value in hardware won't change.
However, with this additional rounding, this guarantee is broken for systems
with mbw_wd < 7.

resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
to specify the conversion resctrl does to the user-provided bandwidth
value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
conversion.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Link: https://patch.msgid.link/20260911163613.1131447-3-ben.horgan@arm.com
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d22305..f2c651e 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -148,6 +148,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level=
 rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
=20
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return val;
+}
+
 /**
  * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
  *

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259598;
	b=fGD8dBz9GL4ESYRCz28F7w0qQKM7NgrkKSyFqZq/OeVE59vGUcmUrBEmPNou+s6k1cBy
	 x0LGZ5Y6biBwEq0h7TLr1ptjuOp6nnpPMTdwkI3v1f8brZqjUYt0D+tBk6zjbFfMSLF2s
	 n6dm6kcWZZDmy4LmGlvNhQ4v3TFNywyD9OZWGhj5IymMDbwNDzgfD78zw+pUPcHq2H/8a
	 LnOfZMlJyQszaHlhmIWQjMpboG7CIzCnD7rJ/91yHH4IydtRusSYrF4GA0J2mZUbuE6eM
	 4tmTfh6jRgB3p6L8+ZLLRfMLh5tZfy1yvTGjt2VytlwJuSy1yVzuxSXzGZRPgd/ACMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259598;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=duwJk/Wws+rRjMwG7vuzmSHDUb/pQjF+eqiv4bEhbhM=;
	b=hFXzEmAHd2HJz+X4fCqB+DxWfb+g3w912jebHuUl/b245jH2v0n4sFxWnu7zDrITRMDH
	 WerRSbUpmDSOZ3CutqQJ2bUDMXTc5SJ9xsvJqQ3mrSUrvfEpYHwUQt41gbtMM3p7ct5Ba
	 WTJ6AWFfWLFN/bIP8IDDZzo3vNZHizd+xqQX5vdMKh7C1mZB8ECx8EtGN9NtkY6txbZiF
	 jnvlQfuFkuPOjIJFs8selRw9QWzDbML7cSiTE4MJ5ZKNv2t5BgYvvM8x+Yv0HmK8npbah
	 RgUPCDX/Jci5D1m0rCGX9gZaWAOpLof9yKN636j2bXvVQedFj3PBDQhzp8bHD6AmmOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6pFJPBk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=puUFlHFK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822C606A331;
	Mon,  9 Nov 2026 21:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7822C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6pFJPBk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=puUFlHFK
Date: Mon, 09 Nov 2026 21:26:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794259595;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duwJk/Wws+rRjMwG7vuzmSHDUb/pQjF+eqiv4bEhbhM=;
	b=L6pFJPBkcboIV/FtIibZlIbG3oJ87Ks20CcRunH2gir7yc0wsdzwa9ayXsq2HhkGRrKVUM
	JLAZZpM210dqdHHIq1mhX1g0+3t1E2u2PjnASlYn/uPnDS7QzryAPFn1S8tkR6YJEgKEXc
	smQZ2c+MfJJkbJjiELYNLrppEeNl9XohgHMq21dVw4kBxlPiHyq2aR+ocfMmmb1bhpUgUw
	Tls8SNuOBJQBftkEywA1WVMfp+7oieR0Ioa2ccVHhUdrbrkiplMmDFalzUpzGtZyETMGPl
	k1KbBJQgkCUmxUibPH0Hz2pfqEEwU1M7Jeq+JGPKMX9zUrQDQQrTdIivdEMdVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794259595;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duwJk/Wws+rRjMwG7vuzmSHDUb/pQjF+eqiv4bEhbhM=;
	b=puUFlHFKebZSvoNw2WjbMnKBeySPefs7sZesKz0gkiwLTtYcHj8yLsLhodBNA6NOyDibTE
	wVx0+f3sQ8PJ8lBw==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Drop unnecessary is_mba_linear() helper
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Chen Yu <yu.c.chen@intel.com>,
 Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C493995284247554d05dc3813722168fb053d5d10=2E1793834?=
 =?utf-8?q?224=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3C493995284247554d05dc3813722168fb053d5d10=2E17938342?=
 =?utf-8?q?24=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425959390.2093942.8201170258762923576.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     79d147bbc7e3e4d99fc3e460fbb671c87a0453e1
Gitweb:        https://git.kernel.org/tip/79d147bbc7e3e4d99fc3e460fbb671c87a0=
453e1
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:13:32 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 08 Nov 2026 18:55:42 -08:00

fs/resctrl: Drop unnecessary is_mba_linear() helper

is_mba_linear() assumes it operates on the MBA resource and returns whether
the resource's delay values are linear. There is only one caller that
separately makes the same assumption.

Avoid duplicating the resource assumptions and let the only caller access
the needed property directly.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Link: https://patch.msgid.link/493995284247554d05dc3813722168fb053d5d10.17938=
34224.git.reinette.chatre@intel.com
---
 fs/resctrl/rdtgroup.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090..443b41a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2577,11 +2577,6 @@ out_destroy:
 	return ret;
 }
=20
-static inline bool is_mba_linear(void)
-{
-	return resctrl_arch_get_resource(RDT_RESOURCE_MBA)->membw.delay_linear;
-}
-
 static int mba_sc_domain_allocate(struct rdt_resource *r, struct rdt_ctrl_do=
main *d)
 {
 	u32 num_closid =3D resctrl_arch_get_num_closid(r);
@@ -2621,7 +2616,7 @@ static bool supports_mba_mbps(void)
 	struct rdt_resource *r =3D resctrl_arch_get_resource(RDT_RESOURCE_MBA);
=20
 	return (resctrl_is_mbm_enabled() &&
-		r->alloc_capable && is_mba_linear() &&
+		r->alloc_capable && r->membw.delay_linear &&
 		r->ctrl_scope =3D=3D rmbm->mon_scope &&
 		!rmbm->mon.mbm_cntr_assignable);
 }

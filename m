Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07F400995;
	Mon,  7 Sep 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810690; cv=none; b=T0ydUHYdMAW2vclJSi0MB9E1/AXJW/YjwvLdNicV4ZersNPPL7zMiAgGON5XT7DC3qwWBYVHUe+1kqhgj2BtDOZtRMlfTAv3ytdCY/nIc46XZLUjHG4QT+YDbTdB884H1/E1ZcBJrI1M+ArlTh31xZfT/GKomzFtUlbPG51e/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810690; c=relaxed/simple;
	bh=8UopOwxDAjWNzz21X0vSsMkHZaHCni68+WcC1ysveUs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RqH3uXIgilDtc7r17yiV+kvonQy0xHtUijf98wlO6aoDqIISPvExlal+RqMhmTihFuiJIXx4vObaW/MJM2uEtKAELTRbIydhGkwF9Eu3yIlKDRTCvIHlGQp8dmsYfUQZNLROa3CKUXHOerrcx1EJAj+lBM9q/xS5vFb+D42hFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q3A62zEs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bb4AGkmt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q3A62zEs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bb4AGkmt"
Date: Mon, 07 Sep 2026 19:51:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810687;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZvVPeqWwNexHXwNdfXnA98d6v6MEeoUSrfKq1VfhuQ=;
	b=q3A62zEsvrQzdmVMSN5W7qUEk5WuA8HnOc3p+r7PPthg9tmDqNyz+HBZRksN2p6qAZByqB
	eyMZfJtNJoWHMd0L2sDSabv4rIWLzFZQcgvPAGlgh+q8FbMuEdbg00okzR9MQ5sGX8BzZf
	mdldz7feJ72RR/Vk5Owc9Tl7BBm6XrTBswaJNVa97hfarMi40rRM47r/HlCj8+kjdF0WTx
	qBzuPZeL03/iTCSAbL2KelvgcSgNY5rqKiIZr9xoLStcQepNqN7el4zDFPhxBL68n680Kl
	7P0b3CbblWZViw/mlzVwd+pGHhjtA9RGBgwujHSg1XIcZk8vd4ZlY0rJiMRD1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810687;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZvVPeqWwNexHXwNdfXnA98d6v6MEeoUSrfKq1VfhuQ=;
	b=bb4AGkmtPyrgBIKhP1ozcp3O8xRgN/88KxiE9NNVjFenZyyvHBSfbRGauiKG1w969PF8Ze
	nsv2CnD2MNLL02BA==
From: "tip-bot2 for Qingshuang Fu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] soc/fsl/qe: qe_ports_ic: Drop redundant
 IRQ_DOMAIN_FLAG_DESTROY_GC
Cc: Qingshuang Fu <fuqingshuang@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907024046.28845-4-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-4-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881068553.623050.12210269765357470538.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     c6d93e52d8c8f05898adf29d3b6edf6570da83af
Gitweb:        https://git.kernel.org/tip/c6d93e52d8c8f05898adf29d3b6edf6570d=
a83af
Author:        Qingshuang Fu <fuqingshuang@kylinos.cn>
AuthorDate:    Mon, 07 Sep 2026 10:40:46 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:49:58 +02:00

soc/fsl/qe: qe_ports_ic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC

Now that __irq_domain_instantiate() automatically sets
IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
flag in the irq_domain_info is redundant.  Remove it.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Link: https://patch.msgid.link/20260907024046.28845-4-fuqingshuang@kylinos.cn
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_i=
c.c
index 7375f92..fb3b920 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -140,7 +140,6 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info =3D {
 		.fwnode =3D of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags =3D IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size =3D 32,
 		.hwirq_max =3D 32,
 		.ops =3D &irq_generic_chip_ops,

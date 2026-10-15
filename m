Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E0514764;
	Thu, 15 Oct 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059770; cv=none; b=iW+Z6akqIkJgHrjS6rvZgs93sedgoiduGySbc5IXpkkDuIXdwZ/QXhHr0Rs/JMZUkV7yqB/1ZlLWCW9c5RBDWB/PjwJTeTae8+yk2zyUMl9QJEDRqQ/xsnGzObBuP0lVr3Pzad0vK7C6iU2w2fzcO1KmwWEzUtqyGxn37n2gct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059770; c=relaxed/simple;
	bh=jht4cnt2AGo4KWoPL7xp1HC+sQ2CzEjFi02qijDZapQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IOBb+ADtdOt0vPbK+qFWFrPA162Z7vOIGvHKAuD+HOt4ITo5aIL0EHGR4x8W9Y90aqEtXt7dWv2h7E0r4oR6caB1Yap13xieh77lslnPLsd6/Ye9AG8XkI+peF1i4Dnz6UQhi8ot7jQqlXdEKtISzXemxE62cj7qDsM/v0DjtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wIcuDsKK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aZNNmCYw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wIcuDsKK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aZNNmCYw"
Date: Thu, 15 Oct 2026 10:22:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059764;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dFxWn9ZCN5Z92plFY+2X2zXk2SfM9xYzH+MQiXil4Ns=;
	b=wIcuDsKKsvNgVHLbqPsT4Zp9CSVPeUEYcJn+3p90HLIr+6i+wqA+mX11gGBgg09DLTsAlu
	W8voi/GiW4NE6hNhfjP0SD0E/s9tJqxIlg0h8aqm8z8htlHi5f2oBQvFWRO9MST1c5IXkr
	av1CCbYbYknpnIKTLsuAqzP8lzUojj99Lw7coF6Y14+axiH6sG53BrZbjuWZQW9kOoUe8K
	W5/iH6Ro5Sc21FWhd2e07SoU0ijPWQSEYRNlctRPYy3U6ophb6i5x6g+0M/KhKeOuzbFre
	pR39Rfht3cOVTKv6wKUYGb2yocHlZ0a6ACjszYuc0SVnRq9w+lMfUjREAcFi5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059764;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dFxWn9ZCN5Z92plFY+2X2zXk2SfM9xYzH+MQiXil4Ns=;
	b=aZNNmCYwbyo23lE/0rOg1hpM0SDwbDJMI9I1MCDZWuYaVmA2gN20RZ8ytjqEWgNiNHM5Wh
	mBeJE7dcHa7iwnBg==
From: "tip-bot2 for Lorenzo Pieralisi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v5: Fix standalone IRSes OF probe
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-2-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-2-d4b337b7f000@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205976261.2666988.11264649248286635540.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     64212d63193cfd81849f5948365c7b0ecd011745
Gitweb:        https://git.kernel.org/tip/64212d63193cfd81849f5948365c7b0ecd0=
11745
Author:        Lorenzo Pieralisi <lpieralisi@kernel.org>
AuthorDate:    Thu, 15 Oct 2026 10:20:26 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:16:59 +02:00

irqchip/gic-v5: Fix standalone IRSes OF probe

An IRS is architecturally allowed to be standalone, namely, with no
direct CPUs connections. Make sure such configuration is allowed on
OF firmware by skipping "cpus" and "arm,iaffids" IRS node properties
parsing if they are not present so that the IRS configuration can
complete successfully.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://patch.msgid.link/20261015-gicv5-irs-no-cpus-v1-2-d4b337b7f000@k=
ernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-ir=
s.c
index b3feb63..53639e6 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -609,6 +609,10 @@ static int __init gicv5_irs_of_init_affinity(struct devi=
ce_node *node,
 	u16 iaffid_mask =3D GENMASK(iaffid_bits - 1, 0);
 	int ret, i, ncpus, niaffids;
=20
+	/* An IRS is architecturally allowed to have no cpus associated with it */
+	if (!of_property_present(node, "cpus") && !of_property_present(node, "arm,i=
affids"))
+		return 0;
+
 	ncpus =3D of_count_phandle_with_args(node, "cpus", NULL);
 	if (ncpus < 0)
 		return -EINVAL;

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58150AC3A;
	Thu, 15 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058092; cv=none; b=NZtxtJK0I1UhyCs5HFlX4n5vdLhBvWJfLxVCjQ0yVanK3d8fsNEX8ulELmc0JjNUPru82dYF8aA2qqq+mGdRQY0A2nnhYY5hNcvxUE/2z0foiLSB+cmCxMUEozyzj89I3cuGTLqHJ71GLfWIi++6rBuGR6ynclhiMphcK3v0lzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058092; c=relaxed/simple;
	bh=gR23xSyIzRPHL602YyUG9gkiEtfa+OstDnGpZH+orxk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FNrNaUcjUsKxVyhSrwPd4g/es5m+uK6oigl61K2DT31vnkyp0T1a9llRriEGdMzUXRBNS9Xs9AGBIp1Jg2AYMv1+227oywyxF6O+OE3SV1y9xvsSYmAdcWU7wx+4LWYTJC8fuPbf4HNZxS8l5bxfZpW1jOP+er0e2tvNy0cpMrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jRKR8rft; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vhtSPXRf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jRKR8rft";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vhtSPXRf"
Date: Thu, 15 Oct 2026 09:54:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058087;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZvuM4IOLDX0oCWmoHHyzJSyOgjj0gpXJYkKHRb1Umw=;
	b=jRKR8rftI44XoV2+A/VUdZjtodCLfK4j/6kvCWeJU8TiKNDJjknlkwF9DlQ2xYYA9xtH/A
	WRbihGUfveqzaAc17QwXVTfC9w1F8MnGheKrcdl7FJe6AcjMd/uPtLZfDa+2Nl3v+NDNcJ
	8jR//bwMlAiFKJsrvs/Ul1C52HDqWB6yBnNKYMEQr45j9PgpBw/1xokIGKr5ORsFu9uLub
	zfMn3WCW9ZxblbtSjN7iptbFkkuZSQMjsRMIAT/Gs7lobnNW34hK5VurOmerchraAR0PQo
	vOOtmkPJ1yOa+qICJ5vLLim/vpDiHDRQSkKLTafJV2fDvgq+a5ECdS3oedNITw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058087;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZvuM4IOLDX0oCWmoHHyzJSyOgjj0gpXJYkKHRb1Umw=;
	b=vhtSPXRfWs1ljwL86Ca0Xr2wDj/OZPqH9mISdgUtvh3bXbMwsayKbizlQq1WCYTpDJpqoE
	A/NSDHyoK8n1DACA==
From: "tip-bot2 for Pengpeng Hou" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/riscv-imsic: Reject overlapping group index fields
Cc: Pengpeng Hou <hppiscas@163.com>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel <anup@brainfault.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205808597.2666988.2381906930105082201.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     8caa8fcec8db5358437b9b7ca456bc3093d2a4d0
Gitweb:        https://git.kernel.org/tip/8caa8fcec8db5358437b9b7ca456bc3093d=
2a4d0
Author:        Pengpeng Hou <hppiscas@163.com>
AuthorDate:    Sun, 20 Sep 2026 21:07:54 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:48 +02:00

irqchip/riscv-imsic: Reject overlapping group index fields

The IMSIC address layout places the group index above the page offset,
guest index and HART index. imsic_parse_fwnode() checks the individual
field widths and the upper end of the group field, but does not check
that its lower end is above the other fields.

Reject a nonzero group field whose shift overlaps the lower fields.
Otherwise a firmware-supplied layout can assign the same address bit to
different indices when MSI target addresses are constructed.

Keep the existing upper-bound check unchanged. The new lower-bound
check applies only when group index bits are present.

The issue was found by our static-analysis tool.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early drive=
r")
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: gpt 5
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf=
7eb8834a@163.com
---
 drivers/irqchip/irq-riscv-imsic-state.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-ri=
scv-imsic-state.c
index 9505ddb..960c71d 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -740,6 +740,14 @@ static int __init imsic_parse_fwnode(struct fwnode_handl=
e *fwnode,
 		return -EINVAL;
 	}
=20
+	/* Group index bits must not overlap guest and HART index bits. */
+	i =3D IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+	    global->hart_index_bits;
+	if (global->group_index_bits && global->group_index_shift < i) {
+		pr_err("%pfwP: group index shift too small\n", fwnode);
+		return -EINVAL;
+	}
+
 	/* Sanity check group index shift */
 	i =3D global->group_index_bits + global->group_index_shift - 1;
 	if (i >=3D BITS_PER_LONG) {

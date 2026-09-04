Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF66480350;
	Fri,  4 Sep 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531848; cv=none; b=Ipidxnd2rpKNK7r2HHJFffkAUPbN9/71bJNW+32ZZNXJcp8c3OJs5p2m12WURwKYDK/ZW8cfcdFoumMxasMeZ9k0I61apYearJDiSs+NK8AM6osyiyIovduY6gahEXYTsk2lVHj6sFXJugPmrRYpYa2rtwE7C81IMsgG4um2im0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531848; c=relaxed/simple;
	bh=v03RM2/NSsDyflRUpVUMdkpgQAgz9L3zZh9wiNI+M6g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=agGfVyyLJDylFKI3MODvtWifJrRLpZignCS5DDmumj2gb9hRBJ35xiO8pKgWk/vJDYBn+2wjkhTYNSkUzs38h2rbofRCOJ+35Yoq8GKW5n5a6Fk5JLGhm947Sy4BBL7ITPNQAnH2JtWgwOrbMK7nILMgBebKZROAiMzbElw0taw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bdz+ZfVL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XxhR1I/A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bdz+ZfVL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XxhR1I/A"
Date: Fri, 04 Sep 2026 14:24:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788531845;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHfiNfhRfRpZyAe3sYJTCjHLbSqb6xcJph/VBqZi4Is=;
	b=bdz+ZfVL2gxjl7RAYkmm7I5xq6Pr0WAnS0gxo6NeKF1mKmPZ6pY3XdB1YThYNP8yILgBjN
	dBqovb3abIxNb2jQgCnxxAZhydnCB1vXGYdMA7YvMXdCpY0A+/i/nyo7+uimi7iDYvG9py
	TtW2W7V/rSDD8aLrngRoQZovsxcpaSVkAtMcCuwKgXYf3lmn7sFblfsT5BEhxhwBJo6o5n
	XyfC7FnN41YQ6JaU8J1EVILxjsRxqh8/GGDkbxcCTNcFLc+K2UQTISt5m/TeJ5miJgzdiL
	DeyZsu7EToKrWRLBzfi93fHSZN/NyiYNG+RmwExVFqRRGdK8zkEUCZSdnjArWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788531845;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHfiNfhRfRpZyAe3sYJTCjHLbSqb6xcJph/VBqZi4Is=;
	b=XxhR1I/A7o/ypPEfQzHuzKR+pwSOXDLb+eC/UNzbDq72CMFjjVkwLVZvQnXkFO1cKPUsFO
	xLSkAA7p3qF5KgBQ==
From: "tip-bot2 for Maulik Shah" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178853184376.3717435.6058829149604971378.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     086eac130a946610892d4219b04f8efa9ef28727
Gitweb:        https://git.kernel.org/tip/086eac130a946610892d4219b04f8efa9ef=
28727
Author:        Maulik Shah <maulik.shah@oss.qualcomm.com>
AuthorDate:    Thu, 06 Aug 2026 14:26:28 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 16:21:02 +02:00

irqchip/qcom-pdc: Add purwa compatible for PDC secondary mode

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in silicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualc=
omm.com
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c..29025a2 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, =
struct device_node *pare
 		}
=20
 		pdc->x1e_quirk =3D true;
+	}
=20
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
=20

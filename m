Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336F51A726;
	Thu, 15 Oct 2026 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067545; cv=none; b=SQq7ELACwt2V1BOIPF8p1qn3eMtgS2LCZrCpyVN1ARl+qN3QtOyTaB0/aLvXAX35Y0DtoFfPTnyQmzLLOismXUQJmAMP48UezuOLDCx21OSZW44Xx/hG9TbaH+aUdonqBSUgq0ZBVK2rJ2wqCEGF1dkgndWTeoPe/Xxw1XAhsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067545; c=relaxed/simple;
	bh=okj/Uivh/9zWhVJsxzSA3VMMun/h5pAgEjNRdLiCFLM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZqKChEy94BaeOibobolEpO+dtsMjkrp49TcZxTVWqpXeD5CAg4ynFrtGrzsV7hH7579EPd1WG3FLCkbJT/uocx19fRSnWf1LXBDVzNhgDjlbXXIWEQ48YKHo8P4rPlizQ0JKT4MEz438qyPkvfxKp88ZS4mnbI+I4tn2q+mfn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dTRaEO2E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N9fAwGwc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dTRaEO2E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N9fAwGwc"
Date: Thu, 15 Oct 2026 12:32:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067542;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MrDx9t6JIbd1nuG/4TnA0/mTJWV0IfS1Ufvaje7RdG0=;
	b=dTRaEO2E0T0lvyttbbq7HWtYHjt1MPMJoaPhTC10XR5w1Ioyyf+HeVuLAUlzWcGP0KuY0G
	ge4aRuCJEzFhzisEYYD6a2z+HPyTru23EIbt45UehjwhEshddk1OUq4byfiAod9JX2cvRA
	ezMD5gCV/iRrl2/TSuxW5rQL0HcCj+YSnxAHOg1nSULZlJOdCJqdlWM3KTsbROIJDlJZUr
	ho7E8c36OHCdqaX//Ff/UcmDpK4fNOEc67kyw72jIS6+EH9kSz6luL4TM3A11cdG+CQI3l
	M0oM2BAyufAL7jovTVOO3E0+aHEe8Dmtw5q0UU3+5FE57TvG5drKGxfvbqGJKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067542;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MrDx9t6JIbd1nuG/4TnA0/mTJWV0IfS1Ufvaje7RdG0=;
	b=N9fAwGwc0pKcagJtYyVqM9ub+qs3DVznsG/ZqHIX7y6HFZuK0lJdioIfGnA62zS+xi/442
	W9dabe24JQsqjVAg==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Add support for FIC v3
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-9-farbere@amazon.com>
References: <20261011050449.41903-9-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754078.2666988.8831377571169305348.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0b9bc458d9607388576c759483d0ff2d4957cd93
Gitweb:        https://git.kernel.org/tip/0b9bc458d9607388576c759483d0ff2d495=
7cd93
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:47=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:07 +02:00

irqchip/al-fic: Add support for FIC v3

FIC v3 reports version id 2 in the control register version field. It
exposes the same info/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-9-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 33de265..eb74c52 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -44,6 +44,7 @@ enum al_fic_state {
 enum al_fic_version {
 	AL_FIC_VERSION_V1,
 	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
 };
=20
 enum al_fic_id {

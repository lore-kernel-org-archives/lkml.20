Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586573;
	b=T4/xsSWkiwwF3/k924LDn1yvs3aJFqV8jOn0U4duaJeURTnJydI+VCyP9q0dc+Ok6c9Q
	 BRyLIUeMTI+mzoUrb9C1OK53jWgsVxdy02CY2IahLDhwd4GZQp589SVON9ASYWN+3zlxk
	 fC4cWD1BZMkN75vbIyPB/SSJYGLrHDgsr9JB9i66irBiv1ytxqsyN+H3q5vBfb0CjUQip
	 IdxacTl71J1Lw63t5OfVnIMCYyWeBHwHtCLezDhcbRHH8Iys7lYVVhrzk75q8PMnFF07+
	 0jwwd2k161hOVZwOBEH2Q4VLr1WLT7694Olf7VjnwHg4diBVTKSuL1W9pVO4y8UKchw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oraj5/DBEjTdYiHJqe6PkDC0IxB+a0MZ66ytJCd3wwk=;
	b=c+R92e8/sPSG1j9K+TeltThfn3CsQrTBBhGGp1SqOHPvLmSPAAZdH/4ceW0bUNUJXZYy
	 6DcckuTFWbMpof8fv5x3VwCNpr3SU3n919XSJtutjdIq7wM5e0K+SaWrvVpjN3LPsqblI
	 lFOWUGL/MOuq+aZN1lrVnfWm63krm3cMzp9yb0Q+6+K3d6U/6HiwnnmQ/+Ar5Twax96BF
	 3psdLzow8FtjGRZxlIM5dF2U7AOmMEwrpyquYkpzU0lsEq+S2jdD/KCnNa9V59Mw1F3hW
	 7xshh0UD5ulk5jlkn2TDUt2C7dCuWayRwPgoQayFrjQ8vz9QT0JKb8G9Rszzwh3wFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQ8lJ33v;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162C606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2162C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQ8lJ33v
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so807624b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586572; x=1794191372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oraj5/DBEjTdYiHJqe6PkDC0IxB+a0MZ66ytJCd3wwk=;
        b=EQ8lJ33v7UtNQ/YwA2kxe3xxDCiwk80K412vJUCrTthmQsBrqkZSzWKZ9oKB2s7R9V
         teVYNZXd4NoqJpVQduLK70fSd3jCQUNBtNx0kNSUBPYyxzc9UbykHjjObkXy6QhnW9Aa
         FtzblfKdGoL4GIi71DsGkWXz0IUY5fC/SWrNCJm8CbI36SMWxaY0z1JOk1N2J6qEw36L
         Pp2Q0mzA7I43JL7lRiKpuMo2fFbjI4EHIj4WvhYUG7zfBO81vTkABTimOh4DUdfIIxMr
         8RiLDBoGePM/JR70Z/ywBjHMgBGGOeSxHw+pnERNhtFqIFmFbqX2m8HsucVbN0xoy/Py
         MhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586572; x=1794191372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oraj5/DBEjTdYiHJqe6PkDC0IxB+a0MZ66ytJCd3wwk=;
        b=bfxG5geuDWmtQfg+O4zNGUb10m0O2dt9wutjgueCAQz/BIUJTM3KXlo3kLnY0sSkpg
         Mn22GoF6dC5myPeAv2pHMWUpBdAQ2wMhPGy3d0eyTLabaVT+Puw4ghV0eAfaFHU5vbnQ
         uFuQe4kyfOaRb09sAZuhhZfkN5wVzpSABD0mulaIC/u+VdpwA/3pUZK473wUwa776HQ1
         Sq9HHEurYHJO08T9Q5cDmzkxKilvMKd82qkpAOurR6L18txksG0zrrWairAiy18SimIK
         zyCk0tKV2dEbDsvQNSwP/XwI5kjfuzxaRFn6QxxrRP1vEXwAZs0eGd4s3VsZLgZYzUIw
         perA==
X-Forwarded-Encrypted: i=1; AKwUvBzrko0dYPHGkN89lgKmCrmUImj0Z5MNXOw6yqkm765OFMZy2Cb08XcNZW4L4/pH+mvKGcEnbmiqs/JTiOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgJIm1gm88nSjiepuy//cCgx26/wBDrnZ4L52m61mdt+dBpTbe
	8sAB+htj6tqQYS10Tm6r+ghpvbJGpw0POaNqdtBle33jotlqSTfIyZpa
X-Gm-Gg: AYBFou0/S+xkPBHM+3Bse+YzfvOkKhzd0MbC18B4sinNyrPnqHdzc8R9trKV9DG51Jo
	gpYe8pvrnJ6Z/RiAK69gt/RgsN1b1XVZqAIF5uE5DziOAluCk1T6ks8FZ/bjKY4HtFDqDaGPDmr
	xfRBYJUQ9JMkCAIMo3mNYPOdS+l1ODQa2rYBox+jgDrLO5m8v3hL4bcQpb6tcO3Zjmml0/ED892
	dG7baIwPNPVa7AiotlpGQD70mmt5OHoa3jar5CuwpuQfH8u2UQX2OVxToaT7E7OktU9uoysifY/
	cMeznJezfSzg4zk+xGJoD1KBuEzppuCwUgalRN3PQ1l0lsWkfZ48HJ86U9XdOi1EtuloRsiSSEP
	D3o0LnvKd8fw+eMjFZ7JRmeQ9LK4+yS/K8hfCL/DrpFSdJ6Akf7zb+L9L2H+vN/hoKRAgWs6+hY
	Kqekpy4Hg0baQDICRUwdVJA/oefwtWWyWQ/offotNLGJLb5CgTVHe0eHScCLvL9JkzD6U7oHxmM
	QrtdtkIXAw7fFKrr2LI9fOjPWqJ6R+WcDZQew5YeqHP2IvcaCFnWY+cgcl+0LJYR7cmdHpQtXO9
	VsxDHc2sNXrgd6uYYhCRnB2+kxPRi/Zph7/usYatyEa65QYAPBZ3s6gxY5bqIDO7nOoH
X-Received: by 2002:a05:6a21:7988:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-3e928dc794cmr5954941637.37.1793586572482;
        Sun, 01 Nov 2026 18:29:32 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09814cb9sm2441382a12.24.2026.11.01.18.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:29:31 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BeaCox <0xbeac@gmail.com>,
	stable@vger.kernel.org
Subject: [RFC PATCH v2 1/2] mmc: dw_mmc: drain bh_work on host removal
Date: Mon,  2 Nov 2026 10:29:23 +0800
Message-ID: <20261102022924.51343-2-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102022924.51343-1-0xbeac@gmail.com>
References: <20261101063719.88570-1-0xbeac@gmail.com>
 <20261102022924.51343-1-0xbeac@gmail.com>
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

dw_mci_remove() does not drain bh_work before the driver core releases
the devm-managed host.  The interrupt handler, the fault-injection timer
and the DMA completion path can queue that work, and its callback
accesses the host and MMC request state.  A work item that is still
pending or running after remove returns dereferences freed memory.

This is not a regression from the tasklet-to-BH-workqueue conversion.
The tasklet that bh_work replaced was never killed in dw_mci_remove()
either, going back to the original driver.  Commit 921c87ba3893
("mmc: Convert from tasklet to BH workqueue") only replaced
tasklet_schedule() with queue_work().

After removing the MMC host and masking controller interrupts, drain
the interrupt handler and disable the work synchronously.  Disabling
the work also rejects later queue attempts, unlike cancellation alone.
Stop the fault-injection timer after the work callback has finished so
that it cannot rearm the timer after teardown has cancelled it.

Fixes: f95f3850f7a9 ("mmc: dw_mmc: Add Synopsys DesignWare mmc host driver")
Cc: stable@vger.kernel.org # 6.11+
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 drivers/mmc/host/dw_mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index ff0b25d..5b47643 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -3406,6 +3406,11 @@ void dw_mci_remove(struct dw_mci *host)
 	mci_writel(host, RINTSTS, 0xFFFFFFFF);
 	mci_writel(host, INTMASK, 0); /* disable all mmc interrupt first */
 
+	synchronize_irq(host->irq);
+	/* Stop the work before the timer that it can rearm. */
+	disable_work_sync(&host->bh_work);
+	dw_mci_stop_fault_timer(host);
+
 	/* disable clock to CIU */
 	mci_writel(host, CLKENA, 0);
 	mci_writel(host, CLKSRC, 0);
-- 
2.43.0


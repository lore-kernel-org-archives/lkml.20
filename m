Received: from mail-qv2-f13.google.com (mail-qv2-f13.google.com [74.125.230.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CC4BEE37
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675303; cv=none; b=ebvyrXiCp7RLKNywNwu2H/LN6LffcrXBbYL6vUzghSZ1KuHr2WmQuftVLDlHlPRJN/7DwpEWKTsQ2KP/CIaYI7cJvIc4WI51VUr3wmVCYZBEZNNiCBOCUs6hA55UkiCUtVmwXExS3+cbbjmfba5qfAmnpY5+SDBmDxSk6ci0Xe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675303; c=relaxed/simple;
	bh=jbXqgsp2QbsCT2HQihyZlzNIRaDmi5THMQMNlweLIig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpLbfW3/KhGzVDxlVShnbgwb1B2cQHfwv6nqXfJTXFBaftFiFp6ysIDbu7RYgRoze7LW8T0nsjGLWmTUMEzD3ynR5URptp5M9h/iPtv0EeLJR/HWtZxg3VAol/bJN2FPv9qcke2PgE1UFoi4fE5MlrG3K8eNryrEHIis81n5bOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXY9SBCO; arc=none smtp.client-ip=74.125.230.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXY9SBCO"
Received: by mail-qv2-f13.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so647826d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675301; x=1790280101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMbyouNW/EVz0LVN7bS1sUKezudmEDE0W2YcHDpgEIY=;
        b=hXY9SBCOuZ2xWyfT0MDQs0ZJ9KES2fsmpmGqttt9l+qEKv1QCQ/vlwoCGKauzsSdsD
         vD9Fzevxkqq8a3PXo/yFtf+6nz3B7M+ZYjy7BlPL43TDSWbjUInRMSZOsw/eg6fp3fS6
         0MEdwglhyDpC4PbUgl5w/lT5TskLEeTwsSck1yzVKeAVuwHaQK2mqhVr0/WNtO5yo5gW
         sfJACrbp3v9E2h/ohV4M06BLWlyzPzBDbcwIWKtjfetzwUb6NxtasnHzr3WfXGVWyxJ5
         Zxc0cd+gsbqW28vXIU+5IS/3bQwFkwfn3ThUs3cpaBajkUxGADfrdlrQwxKW6kYi3sB4
         ojUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675301; x=1790280101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMbyouNW/EVz0LVN7bS1sUKezudmEDE0W2YcHDpgEIY=;
        b=cLljVarmPZCdtJo8tj5JOfG6NOWVf3WkP52FK4Dl99W/RCWrGVNFA+eKlQge/4FuE1
         Vb/gNCETTO+edRiF51fNoicxEp6I6yIp2U8ebyz1QfV7R/g509E9BF95YojU08go8INw
         vTN3aE7WETCML67ynkr1uo8g3tmI2A9EDy7dV8WAEVgaxASBWpbv7WAq/NaR6hFjd4rn
         uliM2rB2zdKMLtTzOOUOPC1n/oJ8eeDaA9vSecKw/Vx1piR8lhK6tPGCJzmaxT5S2zum
         E5VpNqYgW5sYxiVCfjDjPkz2ja73dxnhpknJDDn2OMAZmQDj96zk9Bui0kauFRGwWCN0
         plkQ==
X-Gm-Message-State: AFuF++mkJqTxU04/jZEGo6IzkI5JAliFfwEeW6NoY+WvtyXpofKZaJ6b
	R+nwZwk8+a3UX4BBzW9ALpc4Wpk3IvyoRbUYC/aHRsZ43o6fnpqbENs=
X-Gm-Gg: AYBFou0GT7h1lp0F5GWkIspGVLHLmsDy0rgoUfqJSWgkOKzHv9J+efEW6kGnaD0IqEK
	A4hajIOg8m+rDgrUxnT6IKOzOj4G+/Uprsus1gdPNJSRWD13CmSudrDCIncmWi7DE3Kee0nlDmv
	lq6nXcxMKapmNJRtTZK5WqbhgYNCNQ7I7W4nyIySi5KYYR/RHmpMia3hSEoBJsNsEUZM3DIybyh
	LA6EqbHsJOFRJuRbIIOsvN2A57eRbkjMPi4aKJZUatl+aGPPsW46tO/K+r8JxxkCGi9bnOWCz/E
	BIRWYlzx9/TXywu82+psE6deoEdIZHMGzRv3Coo82fi8/kJMyDeJZVjLftgOGX1+L0q/khlTDbV
	nBKJWNRqaxyrrMWYT/OZJ5n/OA7QDcBe88niubqn7SO/bUSAKi+pZCTnr+hQzi2L3OFIWihGYp9
	l6q68+0cH1ibEuK07Aq19q6ysg+nZJXcUNj9nSHlMlZRYxSRGC3en5DWi/wD/7ZFOMyc5J4XyBZ
	RFvdxH/M2PGVArC7vaSkRbctOwmrXNSLaCRllevDzrfXimR8H5xw/9Yu1qRaklD7WaRJBitg8NW
	wxr8CHXyY99Ui+xylLnonLpqFj2HBWpsUJWu
X-Received: by 2002:ad4:5eca:0:b0:910:39e7:dbb9 with SMTP id 6a1803df08f44-91254bd01aamr5451946d6.33.1789675300564;
        Thu, 17 Sep 2026 13:01:40 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c7a362sm5504776d6.18.2026.09.17.13.01.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:01:39 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] soc: fsl: dpio: Release the I/O object on IRQ registration failure
Date: Thu, 17 Sep 2026 16:01:38 -0400
Message-ID: <20260917200138.75755-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQ registration happens after dpaa2_io_create(), but its failure path
only releases the IRQ resources and the MC portal. The I/O object stays
allocated and published in the service list and per-CPU lookup table,
while devres unmaps its portal registers after probe fails.

Call dpaa2_io_down() on IRQ registration failure to remove the object
from those lookup structures and free it. Reorder the error labels so
that a failed dpaa2_io_create() still skips this cleanup.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: fe8fe7723a3a ("soc: fsl: dpio: register dpio irq handlers after dpio create")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -244,9 +244,10 @@
 
 	return 0;
 
+err_register_dpio_irq:
+	dpaa2_io_down(priv->io);
 err_dpaa2_io_create:
 	unregister_dpio_irq_handlers(dpio_dev);
-err_register_dpio_irq:
 	fsl_mc_free_irqs(dpio_dev);
 err_allocate_irqs:
 	dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
-- 
2.47.1

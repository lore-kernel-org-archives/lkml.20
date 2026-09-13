Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44645233944
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272204; cv=none; b=Ju3QuaxBBef1lpE7fH2jsyKciWCD81mmwWa83c2esxd5tIQGfo/YYbiCkDx4QsMFpIDRPXLLx6/e5etWdFMfPWxSD3gFz99UQo7pBHjU55M/0nePBaQiZPr/tdWMmj/6u+aNEauicq8CkgkP6uqHnCUESZoctlnJynpXbyykGIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272204; c=relaxed/simple;
	bh=4eRp9ovMmpBudHPEfFmH+GHalK0lB41ROHYez3TAZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRmSNsxBf66K24V3ExcudOLjxc47Or9zEQ7IZvemfT6emJDU7RiWOnj5+WBNJJKmlL9uR0GtAw2KlGtFKXv2OKrqfQDmmSCn5zS29MbIofvRT3ueC8HbQ3L/24xNTir+O97KNy5YGrhIrhjQ2o1Df/+1Azk9r4urMnn5FPNN9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMhXzdm6; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMhXzdm6"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so16218441cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272202; x=1789877002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=TMhXzdm6RzpAgkxS+iTTvqN3G5kSltF00lFB5Kbi/uQR198rm9I0AR3iXHxhppdPDs
         McHXclarAr14t49ntxVMGEkvpWBKPwtsC2u3zDE6gezdWZq8ja5FJ1X3OOaSBAtzlum+
         HxutLO2DEmZM+6ZRcPK2oS1oKo1tNQ32jgK2ZJuURQEDWvqFsJafhUGVFJQ8UNKW6XKm
         9AHa1lKrQmRjoB+gnH3go/BvzbPnyW5M4YKOrZyFkbKenk2/oIXRTI7PxdT6jezfayZu
         Ip1RsZQ+Pm4wrfCJMJryenGrNSoAAPz7HBkKbp3mzNBHyV72NUBSpjNOLd095WHAASla
         vjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272202; x=1789877002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=kvFEPlyC7T71lj6KD+crKlZNXgn+6GtBl5LKJDLEtZppX16CS49M6sKA6PDyMXQBGU
         kHE+nju5xUgn0hOYFZdF/w1YExst3kUMGYLIiFA2vEAVcEOB+PajhVYYQBW0KOCMKqr5
         bZ4+zPC9xxFJY/zFO+ADROktu2yrJGRL66xfmUzpcWAhVhFcxrgaQycYH4G72VDCW5Yc
         uANmKPj7hvqIvbP/1phjtxlVckNe8yh94mtBxyUveFQVMaadNNZibW2afC/l7RngPPrC
         PS8RjgnuUxGls8ZfZXWsUkHiv8QD4cax0Y6YqNPw9V7ZBke44iTWHE8/Tq/W63Xqnxsq
         Z6Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxuS4NvqEEJ8UF1tEi6ZJWKLOCaIj7TKVS6iOLgce1ahj2I+3Ic3JunrdH2pREjz6sCXqdGhi4Dexdlxx0=@vger.kernel.org
X-Gm-Message-State: AFuF++nNolR+Gx4nbU8wwbOkZ4UjxiBTgO4EX0FOm4nWwY/yEPl2qDXv
	sQvYhMCaYbgO1youxvR66gc37JT5L1CJG99rQeJdKLUZZNAUcxYWnJo=
X-Gm-Gg: AYBFou2QyrDDO1EeWuwAEGErn43Yv2DDMUMMht2lOcS9DeVwOr4+2MnbDDPEYUw8Dfh
	w4BH8v77aTi+ku0rz6EjZkwCM/LRkH/SAC8EU7DRpybOadb2LkZT6blgKaCLjODeRvmNFNWUfDt
	JlIOyasnN9E4nzjloPTjgyhLnaA8eKa79IQz0GfJmuJ4HwDZaNJ5z7gv/YHkWJzB13xynn1cOd6
	rMncWC/JHU22DHjr6OIHo0J95HPb9xlaoOx300V4jmdaVqZyS6pnLbuH8Wa5vOwmRA4wexqcIEb
	MWx3XqjKE/RGTvt5AeIIPfvYCu3uJN2ThbNiCKs9r762BnbK/aABPb/qvtJIL2Ux5r7Tbr8PQ17
	98uJx6Ymo4g/rlxdUGXptnsaG5eCn9OhGn3u6U6xxj/ELwGREUeJmFhRs6ghSkMAYbayQVTVsAF
	EaLgROCtNZFTTZ7gkXDF8RisgPFqQOyTYIi6jSzUuA33QolJ1NUVzx3GbUyofvA8aYoN+rEAAGi
	LyngsdD9JjM69q8BAIIv6nFiSgPIJQbN6Fwg3SDA6SLmJ04ss1IVm1i+gKol2i9uI2iaEL/3Lu3
	r/hACEAiC5B8wxHknA0HKzHt31AyF1qTog==
X-Received: by 2002:a05:622a:507:b0:527:631:8d6 with SMTP id d75a77b69052e-530c859b38fmr160895371cf.25.1789272202056;
        Sat, 12 Sep 2026 21:03:22 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm62329021cf.9.2026.09.12.21.03.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:03:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] pinctrl: single: free the IRQ on domain creation failure
Date: Sun, 13 Sep 2026 00:03:12 -0400
Message-ID: <20260913040312.21966-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcs_irq_init_chained_handler() requests a shared IRQ on affected SoCs, but
its domain creation failure path only removes a chained handler. That does
not release the action installed by request_irq(). The probe can continue
without interrupt support while leaving the shared IRQ action registered.

Use pcs_irq_free() to undo the appropriate type of handler registration.
At this point pcs->domain is NULL, so the helper only releases the parent
IRQ handler. Then mark the IRQ invalid, as the other initialization error
paths already do, to prevent another release from a later probe unwind or
remove.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3e6cee1786a1 ("pinctrl: single: Add support for wake-up interrupts")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4d5f85b7e..e0eb7240a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1628,7 +1628,8 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 					       &pcs_irqdomain_ops,
 					       pcs_soc);
 	if (!pcs->domain) {
-		irq_set_chained_handler(pcs_soc->irq, NULL);
+		pcs_irq_free(pcs);
+		pcs_soc->irq = -1;
 		return -EINVAL;
 	}
 

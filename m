Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452235C68D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750903; cv=none; b=BCjYcnVa4w1q6cVN6soQH1xIC4bzqU6QcfeGdZrj15sauP3YC4h3O9xUM+KWBmUnd/FyCLTqYJWmG3VvI9dVuEjGL5m4QK2xYWyeYVtTQfFFg/kfWAIkKV0BYcc6uRkGjGOx9h0Hkl+W36do5ocypmhOukWmLgbxu6ScrGbbTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750903; c=relaxed/simple;
	bh=8pPUPEpS4/9H0EzasgtYbbVYQh+w382UIvaqr+P9H7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXPS2N49n3geVMMeo9oZSCTiRWQxvgRhTK+SACx/Xwx52yTxUUMX2y7cnS+ISYILJJ+CunL3uK0Roa41zaxsK1EzHneVhbr7lHstE1Vohe55najIK9w3XXFPJMJC0m/bV0k6fT3wxdRkZWpLtA5nro1YtQB3PSYW8JH9dqoPRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn00dsAW; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn00dsAW"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91986c5cb75so18738396d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791750899; x=1792355699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5hMfMkm1g5zpUNftZ1rPfIr43hX0MYnqvDCNhs3New=;
        b=hn00dsAWdKDDfHwe/LFNImtujQEDBDLVpJWQMZJlEzXYRKxnQFR6nMoU3tU8ASFGYN
         2987sdmASY0VWIcZ7u+vMvEix0hd2ryyCAKRi4mNgxee077jTWhmwJ9IOQjIKK2vGkuP
         5Tp43lVSEt99mKkLSjznrRoaF4bVTU+S6O67AdiK7sggySAJA5fUfFx+y5DwVX9gwxje
         Pi5UZ0QMc+lE20pwiHi1BpZmLkkGks6Az/GjxsbSIIohoQ6HsBrlSwhuMKZOacS62wDq
         Uk0sKtJF4/TLNVQVGlbaCJ2Ukj62BB/dlbob1bCscwqTQbVL9XwKzYPWCseXsN7yDY95
         l/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791750899; x=1792355699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5hMfMkm1g5zpUNftZ1rPfIr43hX0MYnqvDCNhs3New=;
        b=md+YrQ0L1OF8/hipXOzXAZcvICMEhSAL6z3OLmzhNkLc0RVpDGtGAdtGjV7ZI01K/W
         mQ1ejaLm+gaEH9z/SQcuFFUVp9L1MuGNVshZmCBhl/NBlpXN3tuRdSrTSEGi/36ihnA6
         tuD+irCN84KHJ/TAaVysFldJFdboVhpJIcUMwtnUDdr4IOY7oalBEZfvCg7zXwkBl7HG
         p7tkrjvKbTbEtCiB/PEZMDZsxiyRakVCZKZr8/rmy1pEvjsw5XNsDmcHEXPpLACgAnJ0
         1Hua0zyuo6UxrYJRyk0jI+rWra8QpdCZh/VGHuXJTlVcAzBOUzYS1jvxjTicwdSPYOMm
         v6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz1eU7gSgORmSfrmfiFe9RD+2tO0tJIhYhqRkedjJ9u1mtKzOeQsHM+z0JZuO53sP5X3l8HgqVPpKQpsaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa6aR8Be+bfBnIeKF/E1td+2HGjaVTZtgGtfvZ/3EIiKXOnp3E
	ySHOEX+h7hqx5iTW91gHE9AvmTeCu5w4s1x2IQ/20EOXigcNPncmgZA=
X-Gm-Gg: AYBFou1YaXF1Vzl9WkyAYna12YHfOPwL/efrStEHBrylLVBnrGwNdEYggq54axCf0q8
	4q2XQuCBZQ/dqBJsvg1A7+3vB2LvkAczxFbUrcwR7dfXpCsHcY0pDxHGrM5/Xy2IoywDI69Zt/u
	MRp1Tfmsoaa0TQvDAP7l3Zl2ijK1FfGnLEqCtNyb12A+AZLj/amEBTnmO5q8A1Bx3yzYkeuHpwA
	ek+ru7GinYnYYtJqeq7E+IQ9Sqd+68mPEMWr6YWL/TUqwEXZEWRnwYYLylgO8xlITJ68i7n0bWb
	9Tm8q6LWfXb2PrcZ8y5Tqa6PW93pZJB7pLVx+mxxK6KkTW8GfzEj1J5/OSeVQD24MW70k+lia6B
	VuFsbSMJ5gsiO1nLnezxWZ4/f74xMJVFzxDIEpj2EQf/DJpHd3cpdypvFkttsz0V3odgmD0+DNK
	XNPv+EXU4FB08STJEtWcoitcayqA2rYgIke7nCV2BNpm+LOzyA5K049h6TQjW41OggyF80DE+2t
	d31HA/7Szuq3V24vZ+cvqcHzeFJQk+VSskYDBCuV+RuHYWO5Vi0WD/h2RoxorgIHSi/FVVJgbOs
	KzVNVJbkMs+BoSr1QKlb/2Wox15N
X-Received: by 2002:a05:6214:5904:b0:91b:7f54:8db3 with SMTP id 6a1803df08f44-91b7f548fa1mr27453476d6.47.1791750899068;
        Sun, 11 Oct 2026 13:34:59 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501f2e3sm78200556d6.8.2026.10.11.13.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:34:58 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Lukasz Bartosik <lbartosik@marvell.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] crypto: marvell/octeontx - clean up VF resources when DOWN fails
Date: Sun, 11 Oct 2026 16:34:56 -0400
Message-ID: <20261011203456.1879639-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed DOWN mailbox notification makes otx_cptvf_remove() skip all
local cleanup. The driver core still completes unbind and releases the
devm-allocated cptvf, leaving the raw IRQ handlers registered with that
object as their argument. The sysfs group, crypto device-table entry,
software queues and PCI resources also remain uncleaned.

Keep the notification error diagnostic, but run local cleanup regardless
of the PF response. The PF only acknowledges DOWN; it does not disable the
VF queue. Disable the VQ locally and poll its INFLIGHT count for up to one
second before releasing the DMA command queues. Warn if the queue does
not become idle, but continue local teardown. Clear PCI bus mastering
before freeing resources. Remove both IRQ handlers before killing the
tasklet and releasing its resources.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Disable the local VQ and poll INFLIGHT for up to one second before
  freeing DMA command queues.
- Warn on an idle timeout and continue local cleanup.
- Clear PCI bus mastering before releasing resources.

v1: https://lore.kernel.org/r/20261004042634.1130247-1-mhun512@gmail.com
Review: https://sashiko.dev/#/patchset/20261004042634.1130247-1-mhun512%40gmail.com

 .../crypto/marvell/octeontx/otx_cptvf_main.c  | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
index 159c1d2..047bfc0 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include "otx_cptvf.h"
 #include "otx_cptvf_algs.h"
@@ -930,6 +931,8 @@ clear_drvdata:
 static void otx_cptvf_remove(struct pci_dev *pdev)
 {
 	struct otx_cptvf *cptvf = pci_get_drvdata(pdev);
+	union otx_cptx_vqx_inprog vqx_inprog;
+	int ret;
 
 	if (!cptvf) {
 		dev_err(&pdev->dev, "Invalid CPT-VF device\n");
@@ -937,22 +940,33 @@ static void otx_cptvf_remove(struct pci_dev *pdev)
 	}
 
 	/* Convey DOWN to PF */
-	if (otx_cptvf_send_vf_down(cptvf)) {
+	if (otx_cptvf_send_vf_down(cptvf))
 		dev_err(&pdev->dev, "PF not responding to DOWN msg\n");
-	} else {
-		sysfs_remove_group(&pdev->dev.kobj, &otx_cptvf_sysfs_group);
-		otx_cpt_crypto_exit(pdev, THIS_MODULE, cptvf->vftype);
-		cptvf_free_irq_affinity(cptvf, CPT_VF_INT_VEC_E_DONE);
-		cptvf_free_irq_affinity(cptvf, CPT_VF_INT_VEC_E_MISC);
-		free_irq(pci_irq_vector(pdev, CPT_VF_INT_VEC_E_DONE), cptvf);
-		free_irq(pci_irq_vector(pdev, CPT_VF_INT_VEC_E_MISC), cptvf);
-		cptvf_sw_cleanup(cptvf);
-		pci_free_irq_vectors(cptvf->pdev);
-		pci_iounmap(pdev, cptvf->reg_base);
-		pci_release_regions(pdev);
-		pci_disable_device(pdev);
-		pci_set_drvdata(pdev, NULL);
-	}
+
+	sysfs_remove_group(&pdev->dev.kobj, &otx_cptvf_sysfs_group);
+	otx_cpt_crypto_exit(pdev, THIS_MODULE, cptvf->vftype);
+
+	/* Disable the VQ and wait for in-flight instructions to complete. */
+	cptvf_write_vq_ctl(cptvf, 0);
+	ret = readq_poll_timeout(cptvf->reg_base + OTX_CPT_VQX_INPROG(0),
+				 vqx_inprog.u, !vqx_inprog.s.inflight,
+				 10, 1000000);
+	if (ret)
+		dev_warn(&pdev->dev, "Timed out waiting for VQ to become idle\n");
+
+	/* Disable PCI bus mastering before releasing resources. */
+	pci_clear_master(pdev);
+
+	cptvf_free_irq_affinity(cptvf, CPT_VF_INT_VEC_E_DONE);
+	cptvf_free_irq_affinity(cptvf, CPT_VF_INT_VEC_E_MISC);
+	free_irq(pci_irq_vector(pdev, CPT_VF_INT_VEC_E_DONE), cptvf);
+	free_irq(pci_irq_vector(pdev, CPT_VF_INT_VEC_E_MISC), cptvf);
+	cptvf_sw_cleanup(cptvf);
+	pci_free_irq_vectors(cptvf->pdev);
+	pci_iounmap(pdev, cptvf->reg_base);
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+	pci_set_drvdata(pdev, NULL);
 }
 
 /* Supported devices */
-- 
2.53.0

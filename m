Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30063ED5A1
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791087999; cv=none; b=YjMW8ItvL/FvI/htj6hCkYxcwpv4nNjuNAIu6y1g7SVBsCLqyIMtHxylMy0ZJH68s3jNf5qb2/a+6SEVLFM/gC2TGUyVu38kKrOJ/OyS1gA88iXdlnLQyGLHxcHpXJgLolhBdI1LyBLv8NYV8d8Q7+FV2xHEyMd9VyWbuH62ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791087999; c=relaxed/simple;
	bh=SA1v7m8+a2Ph1dwt7YN7E3qaLG1ZxbVKpYnbGXKAW/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IitG4TagZAB6d6/ywlU3/gglnmlo32UDLBkmZsszac/cR5E7NNTTvT4aH1oG0KMfzGr0TKAWEu1xtLTZOHV1qoBpKK9iQsiALIcyQHFcIvzk0lOgMUmaFWeRcKb0iUHBRs1QiOy8Pxo0QOvNiZkjkvU7Z/2JKjvlB1EA3eh5zGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4O8O7mI; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4O8O7mI"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93e479c36edso43912785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791087996; x=1791692796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rrUctqm6Dy9eiIYp5kLscMDUQowC1+vgzYg3FmL2FU=;
        b=b4O8O7mI1BxA3yZkmoIW7N5WotuhLsnSsM6erxc/kANV2lj8ADBx2JLapbXXbgmya+
         C9cdvQrf/wSNsm5awAODq7f85+hTfx05LOnzaK/UoMJZfggp30dszscPYox+As3ClNT9
         T923PF2sSVW/UXr74RlgVbmOuwVQ6cTRmiuKqHJWC7hSbwUxOPj3S1n9SQJiUAOlvEdc
         aG9SVhjlCrdEUXidhY7z9Zp+7q25OlSojwJB2quuuLyFiraYbSUy3r0MIzhKsGylHbb8
         keCCqPrgYWP1s1/kHyh2GgBdRU2qhAWjFk0T3a1nNzbvCdDVwA90AVBz+ucdjAsQoOWu
         xe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791087996; x=1791692796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rrUctqm6Dy9eiIYp5kLscMDUQowC1+vgzYg3FmL2FU=;
        b=m3lK3Ya7ho3ENY6FhQmj9jrQlR3F/wyvMLtjwVR98LRwxSaLS+P/N9dzSSZjfO0v5+
         AtaFalWKX6tN72fSiB8iLIkZGuFrkfV+pr+tNFp7E3llzlDomTy450fZQoGsAOYJFJAs
         WNAfY7jLeOKbb/1cf+2oZiKxoV+q93yinP4GgJXnKODj9DAmVDxVA495zIHzU57enOmY
         yfDy+RWIhiZqQ7MCo7aLVpo9mw//m6152x99p0/CMuhutiiVb6K17N9LUJ6jjIsSStdH
         PgwOu7W7iZPjSJIpxWPolo4F+AEMcHnS68esY33/kG2lYSvFnhpKd8FiDB3JlweIQ5vK
         Cmcw==
X-Forwarded-Encrypted: i=1; AKwUvBzt5gGRWBaQnjJSpoYSg+IxCm/lfWEAV0dBjE6XEiL9bbicHQqgmM1QKBuZP6rnUulMaJ7j6i9rEnYcfeM=@vger.kernel.org
X-Gm-Message-State: AFuF++mhL7aDMXG+G6Z9+F5yt5uE8zQO1shKpoF1cZnjimOU2ceT+b2L
	r3PxvLV8aEat3TDRqLEe0DPFkuaFpZVHRfN2YkuLZw7DbyRXT6E9rEY=
X-Gm-Gg: AYBFou0wtQMAG1sTxgRvG3S568rg9GBjdmOXKH5InjFq8TOdjIe8bCxfhcwDMU0XvH7
	pb94+e8izY5IgJ8WhkRT1cdvS3z9M23QdNQghqx8Ff4F18lIT/KogrAUrJ5yWv+ntD4PrH5chk/
	72/ggMFc2Gwucti18qcYj3+edlrz3DqMaPAMZh7JnxQScm0YRtaptQbDemER9ugE5RgzUR7eleO
	BmRiCzXwdkFkpNFg0tALc+nyKbO5qaoXlE4h1VWzzziHIZJKRQFCVt0gQSbN5rtAr4mtfn6cnV/
	ms71ZU8FbOdWjAajBFWCJenR+cX2Tc5JPAOPZGiIRaq6c2VBXk2/ylB/xQ5svTY6BtFSqFdHvCr
	qYoRGVTAdNH6IRwyLAJ0CW2e2kGmCVicdX5fjgeBMDmvTS8x5nED4ENJccWSAA0BTsAeNXZKeJB
	kwq5hKn15wKHgG1ynrYbuL3a/tYwptOdfKR2G4bJzOLnGVKPM91K69djvt0eSG20BPc60rDbMxu
	lI6V4Vez+g3Wa78nyAh3PVcKyJzlvNU6QVupDtp4vQIQ+bCY+vzbGsaoMiDPgRW9AIoqpyIR8Zk
	rNg+mOlXnjR1Al9Fn8eD2V50X/q7
X-Received: by 2002:a05:620a:2259:20b0:93c:2dae:ec5c with SMTP id af79cd13be357-93cf188f68cmr935971185a.42.1791087996607;
        Sat, 03 Oct 2026 21:26:36 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e57b9cbsm367051985a.11.2026.10.03.21.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:26:35 -0700 (PDT)
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
Subject: [PATCH] crypto: marvell/octeontx - clean up VF resources when DOWN fails
Date: Sun,  4 Oct 2026 00:26:34 -0400
Message-ID: <20261004042634.1130247-1-mhun512@gmail.com>
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

Keep the notification error diagnostic, but run the existing local
cleanup regardless of the PF response. This removes both IRQ handlers
before killing the tasklet and releasing its resources, as on the
successful notification path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../crypto/marvell/octeontx/otx_cptvf_main.c  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
index 159c1d290a36..27d7b094c861 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
@@ -937,22 +937,21 @@ static void otx_cptvf_remove(struct pci_dev *pdev)
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


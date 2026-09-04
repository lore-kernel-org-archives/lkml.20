Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC31483816
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525354; cv=none; b=D+5HQDbD1vhvIvW08LZ5vysCInwV5fUPKY4d2yiQV1LKLT9UI84Gy/JLfOn5ctwsGqbHz9x2HZ+RG3Rm0UzosKBNlG/Mtx8ZJfKvt5YvAR6SfFkMg1AIN3i39I1QFTutT6zSzVeFxbah7c3uwHgnLnQNPdqhSpmNpSgMdlNhqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525354; c=relaxed/simple;
	bh=DeS+VD1yPFqoI6SUo0CVGOrpqwFRMspgLs2melatTvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCZojtJhlWgDfF64g/2a3IwtZIMdNlQNv7Sq0YBJuKg6l5iXjkzIHdq9p9FL0AA+aZdRbHwKSTZNEh+gsnrzH+DPZKf+txqx5W7jYhoXuibMYAJOFztlTH8hsoDbVsQeNr+MqJb7co2AQ+Pbw8I8VBCC4p+0j/Yn4Hd2tWOdX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHadmkoL; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHadmkoL"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a483a552efso423670b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525352; x=1789130152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ye8hj6N2qvNGA2gMQYOs4PavKXmbhFPMCLKjkjvEeRo=;
        b=kHadmkoLcZclDbd0t7+3FYXKNZ1Q1ied4+gnv8JVO6zqaXvv0kwPj9mqWR6wHRmBC/
         giwO2S0I9PzU2CFz7Jmdf/xJJQeT3PNc5KL8rjIUCpn1dVG9ovmiHe9UiEbu9zJj/IAd
         TZ55jvbDKoRo+mWofB4omN2ZjtonWfNjpYf2XTTQi5CShlK1yx3LzC1h1C3CGBE9juv5
         BgyLTQ+bY6rHfEg9Q+4ZxWd6AsER6Fots2ZK0MjHHOYMNzse2HEqk1nR/HbuRTh4LKvk
         Mu0hheb8F1//nofzcaMgXj0K85Nw+kuS3YB1L+D2uX9UZKYkSha7YgU8TWGsAOmUBOWb
         UG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525352; x=1789130152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ye8hj6N2qvNGA2gMQYOs4PavKXmbhFPMCLKjkjvEeRo=;
        b=YHjp+fimMZ2tomNF7W+Xtyl0eDqV4HP0z4kDK5sEyqgaykQoOWXo9d2oDNOm1ctlvB
         QwTAP4r01eakrv76sC9foLKaKG4milVJqU4u2bACgHTChpI0ow4nnJrFYUBK4srAh+91
         TfhnV1YDNK5T/UsIzvwb18ZcfW1sy6pDSWmpPpjWlEIGAiyHTRESItdYUoMmqmEfmKBH
         iIe7W/nw8fywIu7ym0nLhEKQuR5e2JIsnP4FtLoVt28v3Xn06UhxQohBl33KeQq39J9J
         d6c+IHAmRuVjLOU0YHleKKoP4RGX0hBdz8Ya8irUKiyWf6ZOfi39PT1+Y8erLdNOlxSM
         nn0A==
X-Gm-Message-State: AFuF++mPndOPntU9jOIJVUTto1gTxQBI2Hc1/WWty+96okD+txihhIFw
	Hr2GPHFDZeFI1caSEJ5IugncrdXkUzgI95yOXvtf7Q8IvGo3WNv1LsR1
X-Gm-Gg: AYBFou0yf7FLYpmb5bQG0BKO97Ho8BlGColsPzvjA+gyB86csR3wi3KKtTJXdeQuztB
	3hT6vm4uM1Lqrie79YjHYuMusWtiVe/wN/YzXo/3utUDSEy0oe9fmoGxtujeGWBsaKAzo1MsjLw
	jPqWrrV2+1Osp8fBAFVQEuxREpDtdifuFZ7np0sMl66wnt83mNTrAJ33qgWLJsX+slz/6mCo2Qv
	tr+S8M9Mo/AK0PlFxFel0FVh54vtQJoFffhF/YuBsqx15QQbBPlk0gDY8uZJxZVdx6z3aFGEBPl
	vcFJHw668m9j8f0/Al15m7hSRPXiCJfKgKgwPTxo77VAbeZ/c174tm3vlPU33huKjrLGTr1h+G2
	aq/Gf65OjbFihdNjo3SrRfq6I6BJLa+ENv8JkwGQsAOeDgzMVm8Fn32oSkhAxpPrI+pYfwfVvnX
	0pevwgE/cCo1uINCR0mP0qokICCrHfkCpp9s6EMKSb6/DaOgNZ2Bi5V7iGTmqPls+6kvjr9Aigr
	6jNB1HPNJ7n9oo=
X-Received: by 2002:a05:6820:f00b:b0:6aa:f585:aabb with SMTP id 006d021491bc7-6b6fa7e38a4mr3826883eaf.1.1788525351811;
        Fri, 04 Sep 2026 05:35:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6229374c88.1.2026.09.04.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:35:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/2] perf: fix typo "binded" in comment
Date: Fri,  4 Sep 2026 18:05:39 +0530
Message-ID: <20260904123541.38602-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123541.38602-1-hemanth.selam@gmail.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/perf/dwc_pcie_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 6b9ed59de26e..e2435ccc04ca 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -639,7 +639,7 @@ static void dwc_pcie_pmu_remove_cpuhp_instance(void *hotplug_node)
 }
 
 /*
- * Find the binded DES capability device info of a PCI device.
+ * Find the bound DES capability device info of a PCI device.
  * @pdev: The PCI device.
  */
 static struct dwc_pcie_dev_info *dwc_pcie_find_dev_info(struct pci_dev *pdev)
-- 
2.48.1


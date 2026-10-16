Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352A2D73A0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148085; cv=none; b=anIwfRj5WK4yRdqfi89d80TeHoiZc0OKNnhEkCXHdZYERbsWNxXqby8z+aKUaztthKjUZaDirF4KleTVZMkWb0i6PbFoQKybUY2Wfn3CWJXR61XqrXvWJ3nbJny+uyIt7FVZPT6COEbxPV5NhVoDB6nI7Oa/lOWO7ivGGIRyikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148085; c=relaxed/simple;
	bh=baiPuYKS8h1yRWoxkvl/V8ei0sD+upqQsB9Ig4UK1vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wx8u5J988PpGHAaUYRxQF3AduUeqgK/OrMQQsbLvmZqnovpNBjE1zpkG+MNJVSZN2NhTYUJFmYFGbTtDCi7JZGReY/Tz04kzKY0QGcL1YbUKfZQmcQpu7pA4NgzTnSW8didLTUI7rIx9iQCmvYpTODDUOIJmObuywm8/tKHCKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=kJT0nhZ5; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="kJT0nhZ5"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4829678eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792148083; x=1792752883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOuZG31rNHAlhc4zRbY9f7XJA4kNSQ3kS15l9uKpwY=;
        b=kJT0nhZ5VaEjryCBscvfe69BAj8F76Hn3U50ZzfEArhNwEU+tfLHsdAHy2MByJRik8
         jCHXPB5Ta/SE3id8CnrK90I5d8Wxjdg0dgM64lMMogkwrryMX+T14X+MJ8ahhKNIJzg/
         6ADWQdI+BsegAt+R+KOPGPttsrqy0gBYH5GqyiCzpCdHf9VAcovRm39Ro+uyZzE/PikM
         7pYETdsaqAJo8zbU4r/XB7GYoHfh+nvkOIjApXAgd9oqx8aWHyJvJwQGBMwN1ITJKADV
         yjl/Vwka9F0HWJ2cxGOdUXl0xwNPZldOZYZ7aPwfzKlml58OS5CRDdFAb+Ucb5ijf8YQ
         NJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148083; x=1792752883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdOuZG31rNHAlhc4zRbY9f7XJA4kNSQ3kS15l9uKpwY=;
        b=xb81E8v22mGwrb8T8iv50Y5rcjjSUh39qkjvhgBW7P3Gz+UK5YTyBeCDy3GhHL3g06
         I7xuSdIh2YyOzaHE0EA29wWK/l3eLWZrW3Vro0hazizxgXtx/69L9t/b36B/2RbjCinF
         L+hekS2ma9Ngnc7FYeYioftMzJLrqGW6EJTtiBIDEc07+NAxH+N2TexYaCrppjOLpGqr
         36C5UZtZ+jJ4uvXzOenLbrF8goFUz041z7CCxCaaAFEblFNqScSD1HWxCfYOhm3aQDAH
         sX96967rI4DtUtd4ebDDYjniL76o/FM0VG0x6wGbPQ6NrWU7j7AeZiYeXQETfc9C7c0d
         JsNg==
X-Forwarded-Encrypted: i=1; AKwUvBy1Y371JCG62rSz+51ZFmXs4o28uMPpAG5gyHQXftzn/vN2IzPT+mONyIn34jxnpLXD8O5IJpWqEaRb9+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdwfDp8Bctl/hn8Jo06KXCR+rxVMsJhlB5d9VVsPEsS8hJtjMT
	UC36rpgmRb3yiAwMNRa9OLgtwQjzbFLSzuTzfja22Rxy3KkfDq1IB1K+BohJCuwzJo5WhTxyXij
	elHA=
X-Gm-Gg: AYBFou0Syh4yq4oc/yv/ETrGcJw31ouoJOeshgwm9F5diKTZyakjuBpj6NaleF9qHDV
	fmIgpoFaErTs5nkfpMvaJmOnmyfirELSIM5PLMnwRxzUE5A3XM4YzM9o+DKEYfMCZAQq/q07MzY
	cfh3cRvpB+eqagapS52hd3PhCHy1+dKJQCmmuA+/5iDEajwY1LcbM21svqvE2zyp33ehmKZvCat
	WQtTlXwRJq83QBuh6C732/GLu24ll7/pjyoor+WpdI6sTF2aI18LC8l8Ac7bZJTnLVTxqNun/FS
	AdojI+eynKRFLyeotz1XDDFaI3F/RbK1BZ0S6ePdSkD4/HhnKuKwbFaAu4JGnT/ei4lnib7Bj81
	HyBJ0Y7GMMGI+aZ3XBj/WgZbjSL3pbuJGHHW+H38WSAjxaT5PMU9bys44rIwUH39eP431Dxyd1Q
	LuO3Cf+BEsHO8wv8+rknoqcJXv76uj24qQ4omYFmmdUC7MIX+cIYlOaE9OTQCEqfuuWIw/HMAfM
	Y2X2mT6yjeK6P09fzF4iCHAhin96ZRNBaEoCHyqcT8=
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr27319215c88.6.1792148082970;
        Fri, 16 Oct 2026 03:54:42 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm6465494c88.12.2026.10.16.03.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:54:41 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] PCI: pciehp: Add PLX 8600/8700 quirk for missing Command Completed events
Date: Fri, 16 Oct 2026 10:54:26 +0000
Message-ID: <20261016105426.1366992-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260918212343.D98451F00898@smtp.kernel.org>
References: <20260918212343.D98451F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All PLX PEX 8600- and 8700-series data books say the Command Completed bit
is set only after the Hot Plug Controller completes a command that changes
the Attention Indicator Control, Power Indicator Control, Power Controller
Control, or Electromechanical Interlock Control fields.  It is not set
after writes that only change the Presence Detect Changed Enable or Command
Completed Interrupt Enable bits.

Consequently, pciehp waits for Command Completed after changing these
notification Enable bits and logs a timeout, for example:

  pcieport 0000:90:02.0: pciehp: Timeout on hotplug command 0x07c0
  (issued 2032 msec ago)

Like the controllers already handled by quirk_cmd_compl(), these PLX
switches report completion only when the same four Control fields change
and fail to report completion for notification Enable-only writes.

Add only the PLX PEX 8600- and 8700-series switches on which this fix was
tested to quirk_cmd_compl().  This makes pciehp mark Enable-only writes
complete immediately while continuing to wait for commands that change
Control fields.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
Changes in v2:
- Mention the PLX 8600/8700 series in the subject.
- Include an example of the hotplug command timeout.
- List the PLX device IDs in ascending order.
- Clarify the comparison with existing quirks and wrap the log example.
- Base the patch on the PCI maintainer tree's next branch.

Base tree: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git (next)

 drivers/pci/hotplug/pciehp_hpc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 4c62140a3..e48e140ba 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -1122,3 +1122,17 @@ DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0401,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_HXT, 0x0401,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8604,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8608,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8609,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8614,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8717,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8725,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8749,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);

base-commit: 732c4f7d2c04f8c175d85d9243213783ee024ebc
-- 
2.51.0


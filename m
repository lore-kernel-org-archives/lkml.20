Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB14052BC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763990; cv=none; b=AvUcqP+4jmnwVOrcZvBS7AiLTmTvIYcGEKRQAlIncOFRs4b1q9xlkZYXVxExI70rsqUDcanA7jKuIvARiiHOUVOgccHpj46E6YuCNFALRRNEAlA/BzrWAj9of9eaPsZEyX6lWC3b2Cwecu/LGJT5GwKlCwMZe64yOdu742YUqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763990; c=relaxed/simple;
	bh=l4XA1IJgHk4Tz9wCjNpww/BCuqWnknpQp5Xc069Ho6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pk2U9dAolxOWIPuwGo0cHUxJMK1RX0xCUYGN5UPeEO12Z6t51wybPx6CK8b0HQrDU68kLFZiTR7bR6tiCyXoW/G4oLTnT/fPMo5BWnd9iZS1A0CpIR9uqpfQV6a0djv7vQ80pIUkvJV6ivH0hADA+Q53e8Ml+BiOtbTg+tSCwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ldh13u7J; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ldh13u7J"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8534d507f59so3409080b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763988; x=1789368788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wN/gXyQs9R8fuh0jssN3Mt176hrPwO98oU7xZk1KsaI=;
        b=Ldh13u7J1zXeu+U8d+Ej8OLB9JmlER6ksR/aNFtuAY2CDNQNNohEjtoOgujeQJD3jt
         ZbK8z4ngB4vezXHFO+FWg8xWiszVOXT2MSsS6Ycl8rZXIYuNZ6tedxE8sU4zzJMBo6fR
         zPQEyuT9fO/pXqyrFYjufpedErD3spzjtkebKnEx3e1GafXsmQG0l44GSoc076cA2B8Q
         H6TZ8tQnxIXeO4+hK9SOujCSqTeOo3Yxmjgmu+8fR8AiVoRQ6iGGmuETydWRgEshhFg9
         rMB1F5itOd2sIThm0i+DjmEgfFC2r+qQW933pD7XUkBSdyfquFsvuG+rIfL+fD1CPRTs
         1bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763988; x=1789368788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN/gXyQs9R8fuh0jssN3Mt176hrPwO98oU7xZk1KsaI=;
        b=ZKZP1C+6JStiYcC5ftw4nH6XFyJOzCl3zy8Vi2UBSuKS0J0NRT+F7ZwhuacJ5mxiVC
         zLUSlMpZCp9uA4lwbOkqcgqhOSSW/hVrnwDY32cUHDgYxN+1oxDZC9SEgZso29m6Au92
         7hE6KkHB+L2CSLG9X0fP31lp0VEmu4ZfjO6MbgxFJKmGXD2cU/HV+N1WhgbkfzItAGlg
         P8HmWXYvfZ42vb/XHds4xWbFXqBi+6bRfeBA4LIqaD4/k5KK81w5jKXpDxUpb74bOk+X
         kHSOHIQsKFpC+JyCbhKWjTysKlP1o3ZV9dloxYy27acQddfBvLL2t6tmInGowCSBqohy
         I1uw==
X-Gm-Message-State: AFuF++m3cNMiTvA62PjnsCiw3n5nOoniBHtjogKamXmUXIjp6RuEcKY/
	uSe/nhVxPEDVwENJhD7fZ5twCs8DXrluYCrV+IOZal/lfA3Y+4+nhAp5S2aF8hTTe2Q=
X-Gm-Gg: AYBFou1SDhf4pw77MMZ+BbDNwEjXk1/Ns42rSlWVZm887P3YXbqnJlnTkiCqWy176DJ
	eCtoNYtKR9IZCqRO6Jvx9rhLzLIP88w1WPvM3Nkrpbas5tkNbXj8FNXfKu3KUQqFf1sqgrwLQwL
	g/LbQuxwNCNR8oVKw+NndKGVKrVeMr40VaqDSFLEKELE2ETGs57T0FOo72jFQw5pg6Qs91HG1ld
	6Y/XGAbbZv2XhnV7euAopxpcGE52adHf19Csj/DGPG4eqEtnnp6Onl9DLTezPwvUhff2qCmOhsR
	0TnfPWi05ml3198TOqw9epbpsX3n3syrMT3lxwzcyYEtp4u0BRHZVNKe7YrCGrQcO1GPx0xB7YD
	vp8DvoaVDFYQzdjWheIIuov+f+MA7Plr4Vgwkjvwv6BustzKTEvPfpkkar74Tt1z83nrykfEIoP
	qRVckpUm5rcAIgh8tgtaJdjOQSXKP+HeiR9NuwhZvsZQF/kwkl0WYCcfBeOD2fJylIpfoq0U6VT
	YCm5Tj2KOlilQ==
X-Received: by 2002:a05:6300:278a:20b0:3da:7154:2ebf with SMTP id adf61e73a8af0-3da71543fbdmr8173602637.9.1788763988284;
        Sun, 06 Sep 2026 23:53:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm24018479eec.0.2026.09.06.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:53:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] genirq: fix typos in comments
Date: Mon,  7 Sep 2026 12:23:03 +0530
Message-ID: <20260907065303.18034-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/irq/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..b22d74496af1 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -142,7 +142,7 @@ static int msi_insert_desc(struct device *dev, struct msi_desc *desc,
  *				insert it at @init_desc->msi_index
  *
  * @dev:	Pointer to the device for which the descriptor is allocated
- * @domid:	The id of the interrupt domain to which the desriptor is added
+ * @domid:	The id of the interrupt domain to which the descriptor is added
  * @init_desc:	Pointer to an MSI descriptor to initialize the new descriptor
  *
  * Return: 0 on success or an appropriate failure code.
@@ -416,7 +416,7 @@ EXPORT_SYMBOL_GPL(msi_domain_first_desc);
  * @domid:	The id of the interrupt domain which should be walked.
  * @filter:	Descriptor state filter
  *
- * The first invocation of msi_next_desc() has to be preceeded by a
+ * The first invocation of msi_next_desc() has to be preceded by a
  * successful invocation of __msi_first_desc(). Consecutive invocations are
  * only valid if the previous one was successful. All these operations have
  * to be done within the same MSI mutex held region.

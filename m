Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAE945DF49
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205319; cv=none; b=SpYbEe8mmsjMaEBWhNmQUYDYvOd2vg9eOleotAQkjUuXOVRiYKHJlWd9a8IxNhTQ+2msKI2yMe4XebgtXIV8T6GdC9VHCZ42FP6uKzqC8+bPJUdGJYxP7P2XkINVoa6DwzCe/PFXZMm1m7YmZZwle0PzRFp7cMe2ZbZrUrA1Wws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205319; c=relaxed/simple;
	bh=VvilBy3XcUhF0XYjdlJZyZ52j6ao/IKk5T8hVx2QVuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rW9cFwSGnTr2qj+4oOBLarY3Pj3awuy+mSCjAAFXHw+7rvpic+nvRUc9TF178k/j964gOSPbpOtqspRm4kZZTPHT790WJk5oXWFuMdrCRjW9+1yuJK6ADfdjjiBp8aWpu2SZeIY+Dlq76qcXEA51PCa8wU3gAuRSVCZ2PMnAePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynua4U+A; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynua4U+A"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49fd76faff2so1089095e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205316; x=1791810116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=Ynua4U+AmGdC6hXpt7xNuA5XnAgKcStwIYOn4G4HmkcoQ/hgkM703XYybQJUZ+LcJ5
         QRtHk7WEYzQtCvZc51eSJ3Ni018cwRhkuYlCfFy6ZztzfMkWVGSmwdC6SiPL0M/013q/
         X0nGQzZYBd2yh5sBL+fhbgOPUlLkz2njnCBGyStCBDqiEM/wJhPCdb6sq54FbWiudQiR
         v8rrJ3J9D8dy9hrLxrgCPmPPP6Jla4fex4aSR47vpvopTYj61ET4fhZvnD6QDIBiN1rP
         pyFMF3KUihFgcwZ8qdqIM7SdQiidbb4pwaQCWp29ucPlofUtoxeCYKo36aSwf07IggHg
         bhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205316; x=1791810116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=BKZsnTw6h30ht4CX8a/Bv34Mg8OiG6fLI2widZ6lETC79BuB+Fr0owDWQ8TOIemLSU
         1jaqhlpqsiQ+vDm88v9A86a1heU2qSWY9Ckxg1MnllzxHG0bKAZQcn2A8b7wHlzmeonb
         uII1Enro2Q82EJj5JxIZWwvPS/2MXW4uKXrtUV253mexWINRF0yfJ2VF5gDntgXPfrHc
         enD9CbnZqJu4EqN+MHKY6ARMPBo3vHGd6DHOl1pr2kZBrRJPZu5HUjvugrjdqBI0PnzM
         WKGHJ1GygnGV+C805H1y25LIUKCNNYy5EXuMVXQLL5IonB/1IvA90TgJ8bb8UAX+kZkM
         0oDg==
X-Forwarded-Encrypted: i=1; AKwUvBwxj0pzWPz2QLjE3ZtekRzST+zuj1G/B7rwm6c0+PDfNMXFDyLkhF2ibdMiuLsPwe12iSVpsAzlzZUKHDE=@vger.kernel.org
X-Gm-Message-State: AFuF++kVu1Gn/4kuqXAOxu2w+8rBCCmIYV/fgQGlgIZA6KUTL0xhe4rV
	bH4EweIjUU3Ucuq6e8VkjxZR/uQppV0p7LwGG2xf80nOskBXgLeKOKko
X-Gm-Gg: AYBFou0LeCB8CXz0dRuwwSHZtfqrBdAFP4lw918FaQSxFJmPKZmWRJZrEeZSKSJectt
	hoXU+JE0s8NHCp/C3eLF7VaTnweAmf+ReAK87PnhUB4mkapDKXBIhsH7QCK3TNGvG8cX9tXpf2C
	08X9fGhBMcFCOWkxv8/ZPC9JnXDdZHxnv0te1gs/M0xGPE0yuqC2NteCZdoGf4Vs0AUF4zDrWKO
	Yb3ZILJle6ROficB8ECUf99B0Wxb8Xo9SwX8d66PqWr5halY/sy6sHayFam2KUt5hhTlJr+eXyV
	TzL6Vz64gK2LDqns56NCuYy2EMp5c+B3ywRu50OxhyB8vc4eOO/lygde59hkRVWQOjCOzMJuzf1
	z4jBDLXGCkGsUnucmduvIWdHhAwkrZrm5v+vp0ANRNeDYFqyzRMpBWQv8jPg9j0VOphKWGf1bg9
	bOOJp/Ub/gtVcLzyJ027VMwVmMg6y1wM65hN7/baDi2qXRd9WXFB7p4Y2IzmfP64g6dxmtEvHGq
	FU180GScIRAagB/
X-Received: by 2002:a05:600c:870f:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a02753fd01mr186622465e9.7.1791205316083;
        Mon, 05 Oct 2026 06:01:56 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm137485215e9.1.2026.10.05.06.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:01:55 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] staging: vchiq_arm: Avoid NULL ptr deref in vchiq_dump_platform_instances
Date: Mon,  5 Oct 2026 16:01:41 +0300
Message-ID: <20261005130143.138638-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Wahren <stefan.wahren@i2se.com>

commit aa899e686d442c63d50f4d369cc02dbbf0941cb0 upstream.

vchiq_get_state() can return a NULL pointer. So handle this cases and
avoid a NULL pointer derefence in vchiq_dump_platform_instances.

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Link: https://lore.kernel.org/r/1642968143-19281-17-git-send-email-stefan.wahren@i2se.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2022-49106

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 178cf90fb3e5..adde80b56073 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2063,6 +2063,9 @@ int vchiq_dump_platform_instances(void *dump_context)
 	int len;
 	int i;
 
+	if (!state)
+		return -ENOTCONN;
+
 	/* There is no list of instances, so instead scan all services,
 		marking those that have been dumped. */
 
-- 
2.53.0


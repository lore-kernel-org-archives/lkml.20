Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC837F012
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057210; cv=none; b=omF10SwfL6TCIRXQ24eU3oSw57LWPo8Qj2czXFzE8WvnXMlV+zSFKITjGk9vEm4YKiqDjD/6b/M81U2TzVktlWkRKS+Mi8D584z1sroBS43grD8iA4BxlbkhSyKDVNfzqRuLzuL0I2W+cs/3tLSUbT7v40pwztKm+WmzPQB/Ah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057210; c=relaxed/simple;
	bh=72R64NgGqodNaY2EYRZSoEw8HQDUWOzttNv/6JvLRRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7ICS0LAnKpFDbwex1NGLo0Q4NHi0x4f25nzPgaHDOeTKJwj7sRatow0CG2IvMqUS6SyiP53Fp1XLl9s8W8biQXWuAwnc7olyA7uCWcPE2IM4qFPKrmjskwDcNQHcyF1/Y5Vg5fkqtzVMa1In3fpgbWnO4YiC3nof1RtSVi5yBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMC2O2VH; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMC2O2VH"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df90e859e8so1684315ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057209; x=1791662009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ODm/v6+HJBQfxMagJqNA1a/frsMk+53MtU+BX7MWQM=;
        b=EMC2O2VHI09QJ8Inp7IiTAsRy/1vJHSBiyaKOrdsZqKmhgC3bR5PQzaP4nkmYRw7fm
         GtV+B9D2x+glrG58vGOpSL2VKPVY9WAGO6b8W+kmXpgKQG29KVTuadRnp4mjpExTVO4k
         zPPaiKQ9mZjwgkVS5Lq75iO1dPcPVu5iopsIK00xt43Vb9o8bkQr1NxJ9j0H8SDJZifa
         IYdosnSoLYvU6/Ym6zBq1kI2E1fm1jZlqAOjjoxO3bpitrHy6S56uPQT2SccyRrbHwOL
         Oc8uRKHwiKXpNa/fnrhecMz2GkgOT1w/BrszsKnDcUM9wCAlpkPOFgXTFOM9vkeDcgBa
         nSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057209; x=1791662009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ODm/v6+HJBQfxMagJqNA1a/frsMk+53MtU+BX7MWQM=;
        b=AB0ysvdAGfvdCQrv4U5n8EOOLjYeYohQ9fUWJ/a92QbO06OwVjs19qEKJKgEoSZjM2
         9F5HQzaq131MgLWf1FPnRzmtf7kvkTx3ksIqPySIA7gHTBvOC1fMxDg0SSE/Wus/NS6/
         5rSdaaAP7ruZFEaB6M6oN5PHti1A2hcFCnAsXI+pPRSPDLZwiqGv9c48Fk05adUBD0j0
         sxBK82XCcQi9HH9o4q2U85y2WpK2amvLQ7Wt9cdPIJuVrfzAJYKp2lDMN85Zeprf5Z3W
         q5U9VV7JO0SeX0yOOc7MF6v2djckKIvXpqZg2jwlo1GkwZ2KgwEuxuOw1ih6tWRj5md+
         TFkA==
X-Forwarded-Encrypted: i=1; AKwUvByJ53IC5dFyYrwoSJV6c3Ju2GxikZ9BTV+YmL1ZTSI9nRE8q6jn04KKvGA4UyQg0GcKNtTBKCPV+GOBUUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ60ZOj2nAgwJrgNYM7PyBF0rTaxQDKe/bLmwvKGoT973kwKC3G
	E98BHc5unkicap2CYY+Y66tWob+7Jd5lKHr9QfF6mTg18461cCdffS8M
X-Gm-Gg: AYBFou3dyHbC/9udpsXnq86ryrxEwpOpjORcbjsMtw4p81y0bchF12g6gbYZBkZYxto
	EQh0+mnQfkG17mk/8Ocd3chXXOMRMd+3WwzN/DaqKZFRxaWtzSncSSZhEyF5h+D5MpO8xgh6Bn5
	FpRNnkkqnOSWoWNfJDpn+cGa4cTk89h0wQPRHwHKL5OtkKncAZ7EX9o72MytkqpCTIKXw37E1Fv
	uSVP8zl24gbFNBJ8ftZfAdsTF2iWUaeL68W70ua1L/LCEDje2fjJP0eZn0mnOx1rurfujHt7NLp
	iQjJM9LLSKdGvq86+CjXjCADlcnGt7sLViHZjobbFXQx+3FYCkQG4lTV5KrYdhSdd8HxfvHhoU1
	NsMke4ihX7DsHinrAU9auwIQB/ZM9A4yGbPI/y2lbJvt5lpA0zp0Nm3yGQvm1ZGvWymiBoJ6uGO
	n7ghZwj22G5RiRzPUYyWlJaxq09UCYB+Us0PWDSg01mPRaFyRoIGrWoM06L3rGzjG6oPR8ZdaYP
	NLnJwRrbboX1HETi0cEd/L3ei0eNTyhqRli1qKkOTaeNoyUbXyj
X-Received: by 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a6cec8cd26mr3724608a91.40.1791057208655;
        Sat, 03 Oct 2026 12:53:28 -0700 (PDT)
Received: from casta ([2401:d800:1f1:cd06:9f1f:eeb6:21ad:cee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e472b48sm3838211a91.8.2026.10.03.12.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:53:28 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH] mm/gup: fix NULL pointer dereference in fixup_user_fault()
Date: Sun,  4 Oct 2026 02:48:46 +0700
Message-ID: <20261003194846.205918-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fixup_user_fault(), the 'unlocked' parameter is checked for NULL
early on, allowing callers to pass NULL if they do not track whether the
mmap lock was dropped.

However, if handle_mm_fault() returns VM_FAULT_COMPLETED, line 1597
dereferences 'unlocked' directly (*unlocked = true) without checking
if it is NULL. Callers like s390's pci_mmio.c pass NULL for 'unlocked',
leading to a kernel NULL pointer dereference when VM_FAULT_COMPLETED
occurs.

Fix this by checking if 'unlocked' is non-NULL before assigning to it.
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 mm/gup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22..64f709a45adc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1594,7 +1594,8 @@ int fixup_user_fault(struct mm_struct *mm,
 		 * could tell the callers so they do not need to unlock.
 		 */
 		mmap_read_lock(mm);
-		*unlocked = true;
+		if (unlocked)
+			*unlocked = true;
 		return 0;
 	}
 
@@ -1608,7 +1609,8 @@ int fixup_user_fault(struct mm_struct *mm,
 
 	if (ret & VM_FAULT_RETRY) {
 		mmap_read_lock(mm);
-		*unlocked = true;
+		if (unlocked)
+			*unlocked = true;
 		fault_flags |= FAULT_FLAG_TRIED;
 		goto retry;
 	}
-- 
2.55.0


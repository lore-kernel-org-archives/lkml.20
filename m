Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414EE3EF0C8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427775; cv=none; b=bL58cYSZ0jYB+RnRliVxdAkjAJySAJUsJvnKDrDSzmF/SzhI9ABtByGTsFEN3eXzMDdFqW3joXRvJv6vQ+PBSVRS0hIt2RfCzGQWV5Cp6gwOJJHfXVgn/KcvfEF0WxLCuAp9+YDSVmSTs4hDjyfQJ7tYmLn2QvqfKT2XyBJOVyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427775; c=relaxed/simple;
	bh=slMj07LDzh+7KKdhde6CDLMQ2ONvmT8oZoEQIoEqyBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EwnJwbJEHIvHBdTJtAfxwFqbHU+2rvyjvmLZbVmYDrQBHwPAkdr5QQ+57+7tGjHAtgDaWb8rGNjpn2qRGusSLrCO7oNxTybVrBnrj3OXj4bLIPghaLWX9iyncJ6v2qHGWseQDMiE6z/6WtEpCxztNsMbkOcI9E51lacZ8rHX888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpoEpwpn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpoEpwpn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1372775f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427771; x=1789032571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTlhcsnqzkHfBDGujwqi+RIHWDNjq6XrFKufOw7QT0g=;
        b=XpoEpwpnaisuEWYNzitEQl+0qAU0xS/aS3EsiYQ/z0uHL++798cAXpR/Q9N/g9rtE9
         UmasRCOxrkt2asK2UZGplffd14VsGirzSpi7dAjKOiz1pSuLrNshMQVKds/9BBN5vgJd
         wvAM71e3UH1IukJWgxDzTH1fu4w0w0zb9hNX2bpe1ZwZ2MNBoRiD/v5thmdnZ5Se2v9s
         +M5inA+Am9nMegsGHmdRd9Ox8bAyxUHS6vHQDpu7WxJiMSSI/mcMxcVDLE5U9y3Fb1FK
         Wh5zp3q767ucbKFTPY8wR2hrYonVVdteULcYYdilfkNqBS2HS/P3S4UtVWcPvqr23tmX
         AlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427771; x=1789032571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTlhcsnqzkHfBDGujwqi+RIHWDNjq6XrFKufOw7QT0g=;
        b=HovJNdGfLDCj41xrqfah3VXHmigIi+JtbBf8l+AO9H0zbxVIA+1aZuBbz2D4fwnCPf
         vk9yGBvXCIoxrtJQOgCqaUOfgPpFQJHvI+W/ZFcWnggR4STtQO69POJMFo2975EXJ/LJ
         ZiMa2Fs/NXTJtI/72IHO0oBmYnaK1q0VIkQJqlZynJ4blG+Bv32G03Zvp3/unO2CKbfa
         1JK0TIG151aQH+Ao8SNosYeCrrX/3gBFL8LbJlURufsmB90839wsRxUMn6qTc7wubY/R
         d/+yR3yxgQYfvH8msUm4rRTO+TpSxhpPezryaX5TPVtWGFd4X7Z1UxcJ61WUbAMPCm6D
         seYA==
X-Forwarded-Encrypted: i=1; AKwUvBx/A3NzSyYdxFogGBrNjscUcvvxVvehY83JSNQCghZB+SzEi7mOHJaYcOKJaV+aReTe1jdhg8vY9NV0OH4=@vger.kernel.org
X-Gm-Message-State: AFuF++ndbfKdLDcuIQPQJGkTjCrpeWqe/gGS14bkKyAX505M9/ECLVjo
	rWOMPDF7FI9BSEgIXi038C4Sjq8CColWiFoZARlHI6k9NJVkIR/4Ir16
X-Gm-Gg: AYBFou24iqQYaqidPHprRrpwyi/IYGh0yMS5UIuj1Z97LoMNLfzXZc1FvPEjO4ILnkE
	rIfC+8XFGS2LwxdLb6aEJigVNTqx8iDJlB3ChkkM/qNRVQqqNw3SEKJHtP304VvwB1RvlpFJJE6
	ZcrhwIrK3dRDWj4hY27gWJwX/91xJgRwrKG4vTnKcojj0BZ2cOguZjUeC5VotKQMcH0H7fMvren
	5dhTSbI/rnCbRj7FnoQtpysfrrbNEeQZ1IIvUUNP5T0MbJ9ftKBDDoWzRq/BQVjDDRY8QjvRY0O
	F7BBa+dZR6d0qrewWL3MF1qj94iw13m1IrcI0ePtpHuPw4WqcyNWyvJCacO8Y9dkOygJqPf9gHo
	7zOBwdtOms1WyxgISx8J2DTrorFblvMJcYc2WWFv6gFhxa8T3PPSDaKp1mnUksssecLJCyOWFXV
	h2bxF3l00EFimSKqdLXPN8w+//HQg2hZC8p0KC250NVqVjiJSWzwKF+RuT1LiWvv8xiQI=
X-Received: by 2002:a05:6000:18a9:b0:482:f724:f4ba with SMTP id ffacd0b85a97d-484913c37dcmr19695539f8f.19.1788427771368;
        Thu, 03 Sep 2026 02:29:31 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.114.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm12772159f8f.24.2026.09.03.02.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:31 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH] vfio/platform: keep logical vm_pgoff in MMIO region mmap
Date: Thu,  3 Sep 2026 12:29:27 +0300
Message-ID: <20260903092927.502-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_platform_mmap_mmio() overwrites vma->vm_pgoff with the physical
frame number of the MMIO region and passes it to remap_pfn_range().
The VMA is inserted into the device file's mapping->i_mmap interval
tree keyed by vm_pgoff, which VFIO expects to be the logical file
offset: the core links every device mmap to the device inode's
i_mapping precisely so that unmap_mapping_range() can revoke all
mappings associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to remap_pfn_range() explicitly.

Fixes: fad4d5b1f042a ("vfio/platform: support MMAP of MMIO regions")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -559,6 +559,5 @@
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
-
-	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return remap_pfn_range(vma, vma->vm_start,
+			       (region.addr >> PAGE_SHIFT) + pgoff,
 			       req_len, vma->vm_page_prot);
 }

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886929;
	b=UD/O5U3aL4w0rfM3clnPMxKmnzsyajN3rjcCx48IkQENzJPhkQ36TMBRGw3FJLRq1ze4
	 LE50CaZctElkZmyE/Ma88ndV5or0XSvmSoeBYy2zfHsjc4bB+I79d1QD/ip5BMVqLBxZ0
	 Ugeo0rhJjw76XafwqfE7lBPPX4+D/a3IXrQeM66Jjcm21unS0ZBaS+hTJV9R+gpNwN5B3
	 IdiK7ZMPW1koN1cqvf/Bm3FxBW/aG/RPRfjKgvL+DDwUT5WiiMJeMEIHKwCRna7fhYKc6
	 lFn8Ijk83puLRgLmitOj0+Sbptb+J/xkeiGffdZxO+NEMFx7RrMtmRCuu1XBmRipuNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OSC4ftnTo6YGV1dHbcFRy9QyJa8EnMoA6aGGO4fBdTk=;
	b=jjbKXsiqeLyQDRi5j7yxL2K4RYfzFzh39CsVN/XEZuy0laBns4ts02p/DDkgdWj9NbJv
	 gRdkrG55SjAsdeWGEC2+dcjO0lwX9Tggf1R+ucMta9UENnDxknrRgRpMx2BwFjVtHrMDB
	 a+GmWZhTIccyNaV5pCAUI0+m6iTkLCZG+FaNQ4d8FyqdD5ihFPYsxePB/yW/WG8xXBvnX
	 EOvVOASocY6ZTMr/+e8Z2gNvpS7ciG6JYT0M73NpJE7/B7kOP1b3LpkK3PIfigrcpNCmB
	 XwGM/ncinEi+UYIDfLVyv9Oom17k79KNJoCnfVa6FpwQRBeM0fFRaPlX1VMrZ3xj/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a4kyn1Rs;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7E606A333
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D7E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a4kyn1Rs
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67999045530so1795999d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886928; x=1793491728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSC4ftnTo6YGV1dHbcFRy9QyJa8EnMoA6aGGO4fBdTk=;
        b=a4kyn1RsoXyAe+BMj98OM2o6BnP3ig0CSWjT1CR8Plhkum6F65npCHTANcuDOfFv+w
         mo9x5EodTMZhJIf9XQLRWyfmzFjiZXJlnPax69on6IKwLEA2mkSxywTRCu5Jo3/kKklj
         J3N5stlQQ5sn2DhMc1mnDctZ8ND96MPj07F0WPm7RoAVW4bGHDK/CP8Dnl3H2xueuilT
         UPekTtBsnRbz50O/LDPEAcRWIVCtdAAPaFL9qFt6jBrqP81n8wlJv1DTS93ZwKvr1Fua
         1L7Pt0ekrQ4dkiyLndXoJExf1vtytp/I3ifG3UuVXJ7kaDXfmK0FzjbinEucHGHlG/dy
         Xeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886928; x=1793491728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSC4ftnTo6YGV1dHbcFRy9QyJa8EnMoA6aGGO4fBdTk=;
        b=1f6F0JTU3/c7PeDA389BivZopOo+TcZGxwQzBa5klVpCTL5dkLbloJm0E+zggpFfyy
         QVPiXCYksFOTi2D4ndyEjwP66T0Mdj4XOHz2aDuPSqwh++L5E/KBtAiNZdomL9ZoZuvv
         ZiwKO8Iaj4X6kldl4NGB18bVe/hDAjH3DIeAxUuO5GLaMO/hZZPFxrh2mtybIcHjmJtE
         CykNFehqdA0Riys/7cA6jRvhl4iqIL5z0OD8hIydPF84VFasjYbh/UvZcDQ6NVAvQMS/
         bx+wx6arfohBYw38k02jDy2c82WwFSalyUrLQ59tlKnWf/fz0fVMsIxXMqE+D+CQdf7W
         LtEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLDzW19At2JoRKNptKoiUQnE//pyz8eTSFfI6bGvsEpv+3VQpbdo1xHZxMVUFm13o88/8EfuablCKsVh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVbWnz1ASLY0/V92A8Ci9ctM1vgxi3PUNI2606JCsQU65kZqmY
	9apH787JwLzp698+cHnAT+X2GCsJcgogto8J9mXAaFXFAZgk/ImBHmDm
X-Gm-Gg: AYBFou1a5Q8lt3Jx+ivd6L2CpsQ9iPo7UU1R/OKY3x5q2pyuC0a4/rDJicLvzOdJ2xi
	Evuca5NpSKtsSDQdBrznZ7Q7zHr9N81k+1WYBAaUBMiNkyWwB+T7S0vogrPE15W1xEJjY78ozfj
	GOqMUSrofb2pMeDyehNINeJtxJV4yLQZNYqPA5LEJNwr2+41r2S/MQpOjNZ/lzhWh9qJhDS64/T
	IQljGuXhvnlp6FzzXiuMrB7w4kOUTH9XFtJrJZShIqZ9VxKm8lnhMGB4MaLGRpr7q7j38hRXrMm
	SI3xYLIT2QcjQ4youxF1lGib5sEKrwv0ap+9RVxDidnikj6Zr7aF0HtpKXkW3kI4wGamY3t0Dm2
	PAYLymA0xE31up1Nb91y7lmbnlcDo4A5UhHgfXnasUJd9O/VWjvpbVdDSZoYb0JFcQbq13k59Zf
	bsY//kNSygv0ChA/xODqWB3C8yvi+JfO6M6ySZ8ByHDPGsclfLIoAhIZC8Rhhlclw1XcesKvtBm
	tdMCl7kZPQVWCWzh7cLVMSq0XVxqryoD33rrn7tJ3ONswgLrxtwST0=
X-Received: by 2002:a05:690e:4851:b0:679:9b73:bf9e with SMTP id 956f58d0204a3-67a453f9553mr2071640d50.57.1792886927621;
        Sat, 24 Oct 2026 17:08:47 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a45ff8d6dsm1551707d50.1.2026.10.24.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:47 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Nikita Vetoshkin <nekto0n@meta.com>
Subject: [PATCH 5/5] PCI/sysfs: Use user config accessors for serial_number
Date: Sat, 24 Oct 2026 17:08:33 -0700
Message-ID: <20261025000836.58294-6-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025000836.58294-1-thepacketgeek@gmail.com>
References: <20261025000836.58294-1-thepacketgeek@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

serial_number_show() reads the device serial number with pci_get_dsn(),
which uses the kernel config accessors which don't check
block_cfg_access, so a read that races with a reset goes to the device
mid-reset and can fail with -EIO or report an all-ones serial number.

Do the capability walk and DSN reads with the user config accessors
instead, as the "config" attribute does, so each access waits for any
pci_cfg_access_lock() holder (e.g. pci_reset_function()) to finish.
Also wrap the reads in pci_config_pm_runtime_{get,put}() like the other
attributes that read config space.

A reset can still start between two accesses, but the next access just
waits for it to finish, and the DSN capability is unchanged by a reset.

Unlike pci_find_ext_capability(), the walk doesn't check dev->cfg_size
first. serial_number is only visible if pci_get_dsn() found the DSN
capability when the device was added, and cfg_size is final by then.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nekto0n@meta.com>
---
 drivers/pci/pci-sysfs.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index a272f8583a8f..cbdd56b92d1a 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -696,10 +696,23 @@ static ssize_t serial_number_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	u64 dsn;
+	u32 dword;
+	u64 dsn = 0;
 	u8 bytes[8];
+	int pos;
+
+	pci_config_pm_runtime_get(pci_dev);
+	pos = PCI_FIND_NEXT_EXT_CAP(pci_user_read_config, 0,
+				    PCI_EXT_CAP_ID_DSN, NULL, pci_dev);
+	if (pos) {
+		pos += 4;
+		pci_user_read_config_dword(pci_dev, pos, &dword);
+		dsn = (u64)dword;
+		pci_user_read_config_dword(pci_dev, pos + 4, &dword);
+		dsn |= ((u64)dword) << 32;
+	}
+	pci_config_pm_runtime_put(pci_dev);
 
-	dsn = pci_get_dsn(pci_dev);
 	if (!dsn)
 		return -EIO;
 
-- 
2.53.0-Meta


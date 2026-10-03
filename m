Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CCC362130
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039882; cv=none; b=nyKOHGGS6DdJ/nc4clcr1yEFswOI9uXvthRcH/gaMXfDNFN+TGMWzhpCTPEySN+169abJhgen120ojXROTudQv3HytEdou1cuPmiGrtIWCkzlAywnVw6hOWHMeLDHndADlePkvv/b3gukTsk3vsti02r8hJR3kRLnNOV/XYJb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039882; c=relaxed/simple;
	bh=tLra7EkT3EFPsXDljGN2dDzdbp8MnRtwjnX1m5YYotU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGgc0RLvHljojL8Yn17ppj9QMSuP2vws0JHG+DjnYYYJ4NaFABr1JkJgj3CGb3VZbrTsfMrXWKtEPp/ne7jlgKirxECNU04WjbO/XA2ftC8ee9RQqMExSY07TcV3Cg0CGnYx6yTiYsGf5BiSX2AarUVooPvUXSdZWSVM1mx/ZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARmeG6aS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARmeG6aS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso440861f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791039879; x=1791644679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uA/I8lyQcDZsc2YjVolehpWwzZyK4/O2zJKsLK8ONYo=;
        b=ARmeG6aSkje8voHGhTD0EUZaILdoN1iSAsbTO6tozdKcFvqi7XcVvep24GVOvuBG0k
         wvHNuz5ErWwYIaAO9sCFMRBxMV1mC+tK4hR5pF7H2z98jKRIDS9D0uBIcGJf/nni/YWh
         IjdE+2znop1muWPZermVg/woROXOfO0YQZ6lInoKiMVnmgdxPFU6Ip2+GAS3tlfesVrM
         +o2VlQBdzUsTefiAPgJ3Zhdv3YjUSGI6Nzu6FdFjNo/v8ZUM7110xBOnSwwRWusocqyJ
         WqF/mb0TzqlhK2ydAfJpE41h01mVnsgiou15XB2WseJHKgj2uJPoV/BeuwBcfWYdNC7q
         ua/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791039879; x=1791644679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uA/I8lyQcDZsc2YjVolehpWwzZyK4/O2zJKsLK8ONYo=;
        b=oSbfpsdLELOSIpQ4Yd3JBrR009BUT7cOrKaK6LWYutOpnJAcQ16iPPurmtnZAx/SQn
         3+PekSFcoycX7+Uv5SmcOrp8CV02v9Qbl8rO2mNinwGRqZjA6MzeowF8oYaZMRHd3fk+
         k5UvhhBfwiJ3xhuB+hyYc1FiUiSIGMWV5n7agDrYgpXjWfTguEYSC1DIZ4+kNrcXsMyZ
         uYH9YV/MjhwLDzOkRMRQwDQ12f5GFmptMxj6AekdgXAvFJkVMnyak61+M/Ja33tiiBzF
         QI2/VtmHHsFY0FcpmYMHsYHIU830q424hQWKGXX8AXdKc2SAnogmNieXNDzud4QwM/CC
         dgZw==
X-Forwarded-Encrypted: i=1; AKwUvBxIiU5pIkjJ2uKLL/ZbH0vW7aVqysneBulunA+cYxwP6c9iib2jkiTKwHYpGC/mnLZCbdPtFQFKYPPce3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJycy3o9khj5Th0Sg+Yufs9YKvI/1/kZH9szZMDjqgB756RQYaA
	deiHYtb3XbgihTCyl5+y0+x2ZEeK6a/U5Axx1c32VG/x00po2LUfzCVR
X-Gm-Gg: AYBFou0jDg3Z2HLOItHAbdqU/Gim7R5vMFyfNKEo/gD6tN2gyu0CTIjGfFzAXq25aV3
	jYE170VvwpAzGioixVC1M8fC7Alcu6kfn6jHq+z3cywSbzperReKak3yZ9BXd+aYFCEKBHvB9GE
	yqdLyb3wZWJdUv4lv+ps+/VCJT/3L+nQcWn75xU9PI0THWqaQ6k0I5MCLKce0Lq/fmt8UAExCxh
	bgRT+QkeOKDalBNPAEB3Ig606nFpv4Pedy76C/u4CQlqkMkgOrsUN4ph/139th3ftE7S5Liaz+2
	wNrsaMbimkgeHNsIe48DF5gYoSbJt2RYQRpXhJlWR2w6IDYDWFats+3skueiy7+zenctHvh/sHK
	+3mRsxMmFigl4SH1qYdWb4sk0eXuMjZizle5F1+mhi55gcdSU6evepgIuTEsvt534iZN6f0NNCp
	Qvr66D2ujm+eZ0sKYjpbHKCeP3Q+/x8yVpgVIdVfiTBSEbwsVuKP8ReHv0hOdOtztPxSjxyN+9i
	3GBVr/m+T+X/Yc009aJj7BItpOIKByfVXf8+hHAtaYVOGA1yxc+wtuxVu/E3ZFitmCIzBhTdYmA
	kNBf0lC7YPOTgazWTGmc1Bzbn4SdVWVYyGsnzZ7xOlwiixvIQPBvVZJbtNUbca2OzeuuPBKI8UW
	d0SpwcwmLnNLthXRnFPOmWeFeFrcs9RfcwaEvnDniGf8mD6LUb+mP64fJinolmXLNJAsO6pstkg
	rd3+xp
X-Received: by 2002:a05:6000:310f:b0:48b:59f:db9c with SMTP id ffacd0b85a97d-48c48010455mr4658976f8f.53.1791039879008;
        Sat, 03 Oct 2026 08:04:39 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b383065a4sm12008692f8f.44.2026.10.03.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:04:38 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vitaly Lubart <lubvital@gmail.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] misc: issei: Fix issei architecture deps
Date: Sat,  3 Oct 2026 16:04:28 +0100
Message-ID: <20261003150433.1369234-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issei driver is Intel specific and hence x86 only.

Fixes: 65f0ecb9ec85c ("issei: initial driver skeleton")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/misc/issei/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/issei/Kconfig b/drivers/misc/issei/Kconfig
index 12a3fd8099694..dfcfa2d30b9ee 100644
--- a/drivers/misc/issei/Kconfig
+++ b/drivers/misc/issei/Kconfig
@@ -2,6 +2,7 @@
 # Copyright (C) 2023-2026 Intel Corporation
 config INTEL_SSEI
 	tristate "Intel Silicon Security Engine Interface"
+	depends on X86
 	help
 	  The ISSEI (Intel Silicon Security Engine Interface)
 	  subsystem provides a communication channel between the host and the
-- 
2.55.0


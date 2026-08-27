Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F073955CA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828598; cv=none; b=oIBOtCANXC5dVrHvEk9jJQLWNaEsB4pTAJxlGK3SHvDpCg2SV9rRB1hNPtgh77TZBupTmf6IVC7yryLZ6TRupVlTrE8AvNJZrEL3PPAdrCloBoJ/f2riTqvt49Ij8i6i2qPumS3HTfDzLzehT6L5bMnKvcnHOtPoUeNaXzHP4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828598; c=relaxed/simple;
	bh=XTB5xuF5uY/8UybwiMT72tjE0QsyTO6cDMaO3SC6jUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LU/lfYYtpk66++xXqRm+o9Jjf/3yHwmp0ztoiFTQXPDwdvbvFuw9XNwwdO5cbx/DKjKPdD1WjiZWbMseLnuePrYLNq0ALZly94C3SQxG9yRRD8ohR07Vd4QYNH9ZsRETpYiHs11h4mYM/bx4h7hEd8LOgzuU5VVRtAUrzWvr2Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=ByUayKZg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="ByUayKZg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71ae3455aso20088665ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828596; x=1788433396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bfzXAsxwnf/4gzRnr8dq+1MNvADmSphpzw1aSpUIeA=;
        b=ByUayKZgiG1qPK0/VMaTxk7RP9dnv8e368axD1gqNs/ezBTbfumzCGh+VB6vnh8xBa
         uFWpWPjf1/hLXlxpTNw9uyny7u2x2blPwtb53O0/fQb/ZoTruPzpTi9cYL+hFdU/9zpS
         qkNIJ2AFw8ra106mq/cNO4ifByjkdxyvtsyaq2p3EinKiOujOtn4ue74QKZDXOVW+bku
         u6hScyxUbrP9nS9CRzJ/UKuudF/Gz/sHoYkuQtgaJpeaVGy/aCrwNk+vEF6Myr9UZ2W9
         LUBFf97541D0ak/rDtxIHUGiOcxKHuw/4/3YTTkoCFzyclFVuVZGnUmjGUZ1mOCPhizG
         zhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828596; x=1788433396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bfzXAsxwnf/4gzRnr8dq+1MNvADmSphpzw1aSpUIeA=;
        b=sFZR6dvZT77ecGjVmz4iF+CL1CiiyLGvP9I/aVeYdJ1y7CJZtYe9ST9Sn8f7LwylhL
         ZOJIMIAK+sT+iQsQDpq8iASU49zqMqPbGZ4eEibMKGhMvi4k3BzvwtGltJKkdYTWfLrM
         l+2EceBIbvUbF+UM0oyGaSh4q3jp5iLdAUeTgIUM+d3DXixigqIUHEGw43rkTtYUlaUB
         OfpPqhohs593Pae3gVLMAJSL190TNDirLU3c3h9jmlugJbPTuJIXtJz93z9xSSByS7/B
         Cboa6Zh3M7K+IvAX1uYU+4vZyyCxfo/zE1PriO7Nh8tjFFEa5g0q3RED5+WnZp3JCnpm
         MqbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFJBv9berOjte15QikRrgYHtisulCULMuhO9K3aDGaXz33468YW1E4x40iIhRQEMTZkkjF2b8TrYR+o94=@vger.kernel.org
X-Gm-Message-State: AFuF++lrI7FfsQMxSVYn4dcX0E1X41S4G8a6X6HkIBCJXXR3sss8BtJ0
	j6IGVNKAutgivQxa/gWvl8YqBvdkpBJQXg2lsOxNl3C83j0bAWtaW8rDPlrr2xuR0VY=
X-Gm-Gg: AR+sD12ehB3czcjOu7UOf/3xNA93FfZpZCAUxfZM/uWZKfIWk6WXNzMIXZuQdQ+QCaA
	5AuPZxrY9HdpXZ2C+rIPHwM4iJJ8pW4cwzVOi1HvuuurEkp5HpyWlCgawE6dcQc7YjDw9ytwWbZ
	py9NVL0+CS4+JM+Jpu8dpzdVkeSUwbAitOn4yYYTjkCO8nB3xKFP64JUSR0kTkXXoDjAH8bvMUK
	PFRSzaPk0Uht2eRJ+W/L4pjDimNWAk2kpHMu4OkYQvvRazWZrCz8ZW1ZFVVaW0NTLU2yMTw+stC
	1/KnXdWlwi+gHHou/ZcYmA3DV9O2SWdFrTCd6jQGtjKbtJfHe9hwkUxc0hXAmsOFkBvwIZPCUQs
	u+rVT7ujM4RH9wTMZoCbhfvQJ5QrFnfKrhoKFa+Y8dWhX4rJ7eZ7jmEUBlTBl+ZKyVKjwxIYYmI
	BVQTGm+Ib2qIzE2VpD1Cki/vhxKXiBgo79UjeY4TTxE6GrJGFavGX/Q8EsMAYSnAsmFlRCUOsnp
	ijBqdFfvzlNZwAZjpzGEGMV7VT/3wKfc5st3Y/Ig95rMMkfLdQQWqQ+AsH1/lu1SooMYPKMNVHc
	U1SpDfw=
X-Received: by 2002:a17:902:d4c7:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2d7079fa6d5mr226663585ad.6.1787828596313;
        Thu, 27 Aug 2026 04:03:16 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:15 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v1 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Thu, 27 Aug 2026 19:02:41 +0800
Message-Id: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1


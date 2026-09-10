Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE03C1F54
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073595; cv=none; b=MMSh2l6nciAt+r1VUVguZRvDN/tNp44e2KAm1TkzPPKT1O3rwKgidxpZIsAd7GKM7ldcy/N5oyVmUPx1kEI4NZqKmKKGRP2cZ0oJFpVqUv/MI+B9bSy3azpe7lumYW1paMpzLKe7TBwxr7wHi2teR+JeFkYpvYWS/9sV5kkLVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073595; c=relaxed/simple;
	bh=1etk4KOXi29s0+VqLc6HiucY8F0vF73XSX3ZY6UDxlQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i69W9sid+Y0htMl+MT8rLT8i1EKiTwkdcuxA0vvup5xZ8wRO4K3bZcdD9fMLwsL/V+PIKxSvfG3OMVRSjyLYqASo+Tv5wjvd8OiuUahWA0q1KH0v4meD7HBdfvxaCoxE1oOAksnojtXALoVyRRfv+yz6miV3suXDsPJuODes384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAS2Z78I; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAS2Z78I"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc41f38so20242b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073593; x=1789678393; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a73flGMOwQ2zw+tC92cS5o7YqiRzKglgGjirm26OwL8=;
        b=tAS2Z78IHB8vYGX0XrZituet/YZ55bFHQQvrAPRj+7ntMAC5kMr4nERJ8tnRUhDF7V
         B4+KbAtkRWDsXvKVDeUGeUuSYz/ZNn1J+Nfk474tans9o2YkQY54HsXfP8a/8hIYzPRA
         mYK0H7qbE9M63PX/k0I3GfLz6I19H9v7Ap8ytypZz80LS4DXlY07Dp2JaE1rlkNx1hF1
         HCgdl+VJ7+1jzUZvMBB5gTpw2axtXbxsJdGimgDjloOkSBYTDHouJAWZEFsFRy7ckh9g
         1URQwgeLYhFYLnhXAeCDOEPJB1c81v4g79daXrtEH2yVy/J2P+zvAFwnY+M8YqCVjtSj
         8PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073593; x=1789678393;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a73flGMOwQ2zw+tC92cS5o7YqiRzKglgGjirm26OwL8=;
        b=KyWsiMsbyWxiv29BX62xc0SaaXEwm0ljqLmuMagfod9hrvIOMnjA0cVU8xVpFWPSvB
         Dnm8M1CB12SZN8NNdlyAWTuEFhidP5YNAkUqrDjvXVl7Ock9jMwCmPrExIOiial7Tm7C
         vd4v7AwG+cr0QPci7OA9f5wDtt0Xzwcls6oYBqTsd8phXHS84PBDK2MLg3pWkrQnOxah
         wNqr+Ojr5HcpG8jURb71woB19VIrr5deBhRwKx6rOQY73iwe/LGQ0jt7gOhBgVx49vRp
         R3jJnyVfmO9EyJrOHzapY0/N31v6mexv38GU7uPWNIEWYEN7sxfKuPoyfOh9uyLuNCUI
         i5Nw==
X-Forwarded-Encrypted: i=1; AKwUvByfBkNUh3TW36CgFs3EAGFQTF0eB47d/u99BVebC3tfJRvkyec5S3mjz9riIMLJaPSNpRZuub8+PdcY3uw=@vger.kernel.org
X-Gm-Message-State: AFuF++l5DpWoqxtybI7WfjkfQRRfIZGWGRobBNOT++wi4o52u45pc+Pn
	RA+5/dhmcruIXKX+uPue563O9tx1Ht/VSGkA4LxYnt4BtwPjakyAeAqAaVfNWA==
X-Gm-Gg: AYBFou3ZoOD/S2uPjnOWEG2Dh8iOnkpbS/3KID4Isj1p8Qa4h0XMX/EotbzEhMh1pJf
	a+iCB69yBCarON0jXW2B12NTnS9q4fv6Ah4g0sots3dc6S77bPlVPXLwl0BwD5t0KNf/nmSvMGC
	eBKYsmCGtBmg5ws23jyTNS5I0Xw0mwcEbqp1k4Da2+uwWkKtOnfJbjrVm+6yrO5+EpSwix2BL1S
	M6qQ3I7j2dvRoR0Q+MwBXaqP6dYMUOW7O8CXsUCqzopiDbSlM6RPNqa3cwGt9bQLjuQWQTIRY3W
	SyZfRvkwGqU1jm/kyUoL/T6XqtHneBX6oNvTaYPD7buNerOm5KlOacIq5jbp/2hLJ0vo07qbTI+
	YZz1axzxbWQQwo4sy36+OkDNOd662x8ig1KbTQNH7EZWTCP59U7yG8mhBcvKE+bQBEcib871mD1
	HbDsYOz5hHOlrtVJgHvxG9nZ/Y4AeGxapNOTL+uXspYld5wLPJEXgMf60AOG5IICivTL/mE4tJ1
	V8K1zkazhKA3Q==
X-Received: by 2002:a05:6a00:4706:b0:842:4af4:3080 with SMTP id d2e1a72fcca58-86b2db09168mr433675b3a.1.1789073593092;
        Thu, 10 Sep 2026 13:53:13 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:12 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] ARM: dts: keystone-k2g: Fix usb-nop-xceiv dtbs_check
 warnings
Date: Fri, 11 Sep 2026 02:22:49 +0530
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wqDMBCE4VeRve6CifSgr1K8qDqtqxAlm5SK+
 O5Ge/kNzL+SwguUqmwlj6+oTC7BXDJq+5f7gKVLJpvbW14aw0F4xKJhcuCoDc/9wm/5sbEdgLJ
 43Isrpffskeaz/Kz/1tgMaMORo23bAREne817AAAA
X-Change-ID: 20260911-ti-keystone-usb-phy-fix-12deee938735
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=763;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=1etk4KOXi29s0+VqLc6HiucY8F0vF73XSX3ZY6UDxlQ=;
 b=I58F2Ztvq5Yw4MKly35QrlL677tsLpM8s3BEC7GGLLbtmngGRS/qsw1o2QnO0jUDXBqppxWC0
 z9Y/0+VNb2ABnG833oRMZ0sMVp2YAqbDcdPe6agtuKmZWdS5yaEXcZN
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

usb0_phy and usb1_phy fail dtbs_check because:
- missing the required #phy-cells.
- simple-bus wrapper that forces unnecessary reg.

Patch 1 adds #phy-cells with value 0 as required by binding.
Patch 2 drops the wrapper and moves the PHYs to root.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: keystone-k2g: Add required #phy-cells to usb-nop-xceiv nodes
      ARM: dts: keystone-k2g: Move usb-phy nodes out of simple-bus

 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260911-ti-keystone-usb-phy-fix-12deee938735

Best regards,
-- 
Bhargav


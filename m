Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C44E01E5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981349; cv=none; b=NypnecFtJnM2wbf9+xRa2kXzFTe3rXNBbc3XpoHe31EJh/zUjbBUQHVhFGfwvSM0CNqH6CbprEBUJ5CBqU/anKu6erIsevxysBTCbbOmvxC6W79NCbpqOTfAHM7Rs+E1Dzli+LzQOYZ/7OqkU/tr6HkLkaYYhD79zxcwZ3WsyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981349; c=relaxed/simple;
	bh=Jz1g63wBph8z+pjdHc0gSKp70UAE5wnC76nJPFvqda8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hh0rMQSXc06Iyuj/BVf4EGo2saj0kgkc406RvyumSEf0QIrr6jjoeAsOh9//yxGuvWYWK7f5N4x7pAhSTHiqh6UGSf7fv0KJtP+O+s5vpnijoMU7IHSmDXXPccuaKZCqYd4s0tLdiuVI7H7OoDte2sW7GhlU3TiDXgLfoIgQvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgVbfNho; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgVbfNho"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so33499725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981346; x=1792586146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62WR7HSbpTYVFTv5L5GyNfp/jte/MYhYGnFTixB56k0=;
        b=KgVbfNho42fawTPbqL2bIV48wdhG5Xd/rxFDzQU6XB4juG1AsoHydlHBPDptsaAsE/
         hrTpY3e8K/icnF9zAi75LzSUaaxjCwGWeCzSqPjuywQZZ739BAQlwERhk0z1nOlpd3ZM
         I3iiWZscBj/RaBbhWFyeyl/IOeaKPVWUYlmv8od9iS1BcfXTye9a2TAIPtuFJWHgAfPX
         bnZJEjVXxCKm5lUPUmYYKDYy6XvlhEntTf6B80KcSzcgDMkIXbd52JnSrc8kbsyxyxxZ
         UAio8MSYxZ4AVPguStZGc2MvIUm4VvJfAG+e+V5X6V2Si+F8pINM60mwUuC/64Jg+Ied
         UCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981346; x=1792586146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62WR7HSbpTYVFTv5L5GyNfp/jte/MYhYGnFTixB56k0=;
        b=bYfqn4YI6awRoPe59ceHK3Q32q/stQVFnDnqlTu1JcfcHibWudUHaQbqxcMojgavMR
         TbasuGMhGi6pHuvVFoIEaW2f8JHjqaOJlEL5bhM+Sd4pxARlSJx+aaWE2zYb1mFEAyRI
         JHAgnIX0qmsWGqia87lfKy3JfC+oJ5KTzmwAc3pLthroE8qvkJryCEc6kYQfOsQusFv3
         iNgo1mEGS0+X0FsSxz+UwV+5s3B4HVZ8p9jge5kF7kLPFSLuksZzKVatAzkQFWN1BVNQ
         8meagKF7iSXhZciJopdSew8hz3klCFVqSoN0IyG6GQLqXTQuwtYSE79t8YO4GxdFGK/G
         xMEg==
X-Forwarded-Encrypted: i=1; AKwUvBzDGiq+FV1Mzawky2B0E8izJjxQYAWbwHCQWxI3l4uhwaNmsr4ahJi1DMnBGhIdIrCQA7LSK4DGLHh6K/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiWKSVGTe53Yw/WCyqhUZekROwo16nPhKQTl5MFkEYJ6lWInEN
	AWaY4IHidBiwd5IJVqVhZtiOQJ0Z1uyX+58/VvIPJXR+n7FqLasMZbAG
X-Gm-Gg: AYBFou0utXHJJ3a5kVkZu0jwpBFPK2SF7OpZDBz6qCoKfXH8g4ut66rDPoOyqKvOAO4
	cGl9oBVW6OOd/W4JSF3EPQAwBYuBWg1Dp/dHgBlqbbt6wY52mYwuD1XXY/hHlNO76+xP0RZCL3R
	m8FOLeUn3y/+SJsNB1oU06cYlQ5PBhjubqScvcFrfwG3D8rxkh1ikFPHE8nJ5vgxGaExg014jDS
	mUmubmxkNIMi0T4aLVpmKQZDkAj4Gb1slmVZUWgJZplK+oRD5gnun3zkq3Lhmif+OEbar7OkVK0
	2BhZs9sIrIU60qGKjodzAjFlT7c3SUvBV6ODXBtint4OS0Fiju+mo1GculJrpD9W9yRk2Uo+J5r
	Px25y/OL9Q+T5UB5uHsp80xSfIHSjLY1iBOIy04ZKznqHl1XnIaoASDJzhlFH5dh6G85Vbtpvwe
	p115Y13zv3V/aaAS4XvtFLaentu+Rvf7848J8gvk0zpHAWYWhMPjf/qIatx9GBmYZVf44s8YJP4
	wC2ix1BWTvY8p/Rr3/ooKM/wCYD8YeTmse1Uk4euyeXG+/MOTFgO01fF8umNxQn
X-Received: by 2002:a05:600c:c104:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a196cd32b0mr167859285e9.1.1791981345889;
        Wed, 14 Oct 2026 05:35:45 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Wed, 14 Oct 2026 13:35:37 +0100
Message-ID: <20261014123539.2259230-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met.

Patch 1 of this series makes the select conditional on arm64, and patch 2
adds stubs for arm32.

---
Julian Braha (2):
  irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
  firmware: smccc: provide stubs when discovery is disabled

 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.55.0


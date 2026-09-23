Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADC4611F4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150345; cv=none; b=uhwVOhXln9exequT5oXRWoWRilV1y8USS557jEk8jyysyjQSZ3OUIzlvb4eVf1SBT+AthNW2naghq2iPFzlyXpsibZiYdPjmW8aH057Us4ewOeeMuLe5wjq98KFxZNJFmJjcI+OD7MyNChZPoyCO1ANa/sfJd5u/yJV/RGY4FGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150345; c=relaxed/simple;
	bh=tOF3Q53sKK5kaYPNGvvcCdoivuiT7tpbfRxl8ojJ2OU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LADeILRowmfrgluhP8+zeJik5x7fMuZI4Aqat7gT5F0T+BJCNsqhVTo2QMuT9s0tOdjC6lE9ln4RNSo+ht3qBqVnwCIaaSGfKbw1bh+uc1fLOtyd5CeU+q8J2wOq+Avn9Ntb6FMzsWbz9SB0Z7NTLukmSJZM0BamcIf3xwPnkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pAxMbr2b; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pAxMbr2b"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8688139460bso645799b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150343; x=1790755143; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baj4keq09+k1i3lVFY1qZ9vzdStk46/qXFMJ6IHQMnE=;
        b=pAxMbr2buWDfN9Rgbr8afjG5+e1GvNou6atk3MhqlhIsaOxrhdw4vSFqsyLddlLpvD
         3J+BAeX1XLSSEIOGfKd6i59vUAjwKvwnPQSe1cPJW1quAk1qRrU93BhBBbguuYVFvFDM
         ZjA9/yweSXsa9K0sQQ9oVjfaz+yO9rdZ7scjqXjGQ1L+V8Fcd8Og/tS4GoEznqI8htZg
         wBjUEqQ7jGgreRokAfBrzUntcXpg/f4TOHxjMRAiGuDyHr4VUFX8zxtNTcTbLDqOsVxj
         I4FNWybbGMxz8OFYigmSONHrEKWP1wQutGsRV/liigdtdJwYnqMnz/FNDjPir0WZX/Ar
         x+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150343; x=1790755143;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=baj4keq09+k1i3lVFY1qZ9vzdStk46/qXFMJ6IHQMnE=;
        b=varsBNoDLx/oKaEzLkgop1PuEIjXLIh7CNdZ/KDT+ocm8gXfg1hrYzSVe+ThljXbGp
         ygrw7tiUhgIfRXwZdN2QkQST24TM0qelw7GrDHKGqdF+MP2hrY9xcO5fixyb+rehTNwQ
         QPXm/23ZmSrikK0Ls/bS75+/4HLxkuj5IEphtpGNO3JhLyQeEqesLD/gd0zZOhVWZMxA
         TwHNcVb7RX8x6vrUbkXU1en2fqmI8tlDtoafvjJe0BrMVQhToXFK5SIWuLvYKazDpPVR
         XAMgAL38lHXiYBdgrdF89V9E7ahPr/2RBs4sUhGLN30ByYHxzb9WEY/9R6pWTklOj3Fy
         hhEg==
X-Forwarded-Encrypted: i=1; AKwUvBwgnfb9Fyg4LpTvCNA66/DoiUp6kSCu4dvm6UEktrK/yviALcNR0qSjiNaAP5e7g4BQIz8uQpkSATnryHc=@vger.kernel.org
X-Gm-Message-State: AFuF++m4NhbSRZXIcRJ6waL9hMgAgmn0Yi0aBaumcPAo5qsb5nhFz/1X
	zMkh0JfNyTTNq3NSZt+sje+Kj4xkeJrN9VbvASqYwRbQ27See0xJKC5+XmVeHH4J/IwJB6tirpE
	JWWlIXg==
X-Received: from pfcy24.prod.google.com ([2002:a05:6a00:93d8:b0:87c:bf52:8514])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4191:b0:86f:68:4427
 with SMTP id d2e1a72fcca58-87d1b6ac38bmr1616277b3a.25.1790150342849; Wed, 23
 Sep 2026 00:59:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:58:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKqGs2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNj3VLd1JKM1CLd9MSU9NQS3byCVF2jtJSUxLQkY/M0I2MloMaCotS 0zAqwodGxtbUAhAgEs2QAAAA=
X-Change-Id: 20260923-u-ether-gadget-npe-2fddafb37f23
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790150340; l=1114;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=tOF3Q53sKK5kaYPNGvvcCdoivuiT7tpbfRxl8ojJ2OU=; b=NEa9+Sfovl3T/t6GA7JKIo8zl1KCqLcmdn2fnsZGcLX3EOOohoICC1y7PT8wp7r+nV6XqTWcw
 6lyntEWrSnsDyOVNEL0SZVBjsi4Pz7v/6ejYM0sIlFIWVyET1MT5oaH
X-Mailer: b4 0.14.3
Message-ID: <20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@google.com>
Subject: [PATCH 0/2] usb: gadget: u_ether: Fix NULL pointer dereferences after
 gadget unbind
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Faqiang Zhu <faqiang.zhu@nxp.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Hi all,

This series fixes two NULL pointer dereference issues in u_ether after
the gadget is unbound and dev->gadget is cleared by
gether_detach_gadget():

- Patch 1 replaces the composite.h DBG()/VDBG()/ERROR()/INFO() macros in
  u_ether.c with netdev_*() helpers so debug logging does not 
  dereference dev->gadget when the net_device is detached from the
  gadget.
- Patch 2 extends dev->lock to serialize dev->gadget accesses across
  eth_get_drvinfo(), rx_submit(), gether_set_gadget(), and
  gether_detach_gadget(), closing a check-then-use race in
  eth_get_drvinfo().

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Kuen-Han Tsai (2):
      usb: gadget: u_ether: Fix NULL pointer deref in debug logging
      usb: gadget: u_ether: Protect dev->gadget access with dev->lock

 drivers/usb/gadget/function/u_ether.c | 84 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 40 deletions(-)
---
base-commit: abc36cbda29d8f19cf3a580cd86ca9e865186a41
change-id: 20260923-u-ether-gadget-npe-2fddafb37f23

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


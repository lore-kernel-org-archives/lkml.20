Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96319355F57
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314240; cv=none; b=imh6GXsiG24PMNNfJ+LUeZpMFiRp2YnTiSMF9lAe9N70+VPrxkwIqZhJhmKQjZ4kFCrBfjGu27PLh8IrSDcr4bhp4WFEPOJbVVdXbJK3H/eOig3j7wxIcoNg+ofubZz7+kxzN2Erwc6cyxV8jdC4VsLvmNtnHN8uoimrjktnTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314240; c=relaxed/simple;
	bh=BbAaCQB7dbM5OXIrUKctmQd49Nq9NQDn7kVzcUeO+rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEW/z54JFT4hHakMZtWVU3vHpGTeVxUbewXJ4Y3y0w20DY+k6YSbJ9SfdiOt1sBlz0nBXm5IAtgauVliKCFHWoGBoD9G/GHfZhAvp0MzM85gDJJePAgiI6JZtk8MGgjVH5T4IVSXkZ4usxyzG4IIX/TgvENVd9qVYhlLt5AZEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=dGdZoZ3v; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="dGdZoZ3v"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso5141345ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314232; x=1788919032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0K3a0PFyIF8VGBlxiVsFCDBZmt3O9FnRDsP9ifnbj0=;
        b=dGdZoZ3vFIb2KISyBUB5T/fh31fs22aWPM07ZFxZomzhha79WpdM1ToCux02oMqMMi
         PgrSNUgoo2WFawWqvjF4XUcGRQTqkBWgVDO3s0YmjGjjK0yIx/6bYAPFu96eNMm2Qw7J
         2B9qdq01/PufyKEEoi6wB1ajwvL+rYwQS6qdpga7oRlpWiZkLnjyoV0GEfStPk0wI56r
         RoGWcS36QrdP5Ky6+V5Y23fFPG4hr3lzGBD7Q3YGznPqMajv2c+fpB+I6CClPsKD2Fxe
         cpIDbD2pP5c/BWd//GMttc6U53p7AYa4ypGKA9XtMmRdUJG7IZelGC7VyJJvf2FxhfI+
         BppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314232; x=1788919032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0K3a0PFyIF8VGBlxiVsFCDBZmt3O9FnRDsP9ifnbj0=;
        b=nPSSv+/zKg/fa1FxNX1QuM3GqQ5saurvMjEvO9Q/CEaP7WhhGhfIJMjDg/bdSU3PMN
         H7WNQ1gjk94AyRuxZXP3SbvYNUT2hXqrqKzjbKqgILE6hKUgrhcIS0LgulPGoTggApxz
         ixFpO0hlAPkmGSH8rwkz3GK7waUKWFpNZIaTQ/3wiByVspCvcE3w0H8uhJkf19X6wW5T
         OKTwqI07/2OaFdhmRgDxGaZGNYSSMNu/w350/tN1dnsQMIYvbtCiS4UmJHcWEky6z4eh
         5314YyV6QPd8hGwQIYUjXFUuMdyUwUkupq2q5JVXoGShqm5Wa9LSEHtN+pxRmfXPzSiN
         vYYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEXnPx4OcGu5QyPkCkra0SYwTwVWT2zugqR2V3+IrtSS6SaM/5IJUvNVSREQQfxMRYjK4vrV84K/z/hQk=@vger.kernel.org
X-Gm-Message-State: AFuF++mtjQqY/sS03AXt9XbSjbdRS16eXeGx7v2a41e/3xXzZqpysdAI
	9QeyCRWJZsJvjGQmDeQUopDnuq8uIXR1q3vKNOQToYAd2kQLPowvTRLc4ZgDUwp0JhM=
X-Gm-Gg: AYBFou1WMpzEMRmF2cmBpDMl7BAhr+MO3LpdAqGEo7CtjzIx5gdHZSEXKrGNXTVnaID
	Ea+9c3DZLGabHSNcav4v5auvFNANCihixgG74fdQncICnXMrdDXEYi8YBgvK2yulMSbuPqUku+/
	SwVBSftwVJrFtsHMnvx6SiIlyF7KObJBEJBwEUjmTzsOoOJT1RFEjEyrfiwdTsd+XgzHqVJfR70
	Ryk5SztDgKYlR78SZs9M5L5Ly/RhE+BiMleSoT4vhoBRo6PIp8Uh55IETfBG+lMEA3rpxl0fClV
	Bd3Z7NFR9vDcZ+tAeQ+lIEUL9wLcl8rvW7GNJ6sEbK5tW4mKIzZ7sxINZlFyF7CJJHT91I5F+gR
	IToeWlx6KDPl2FD3+uyPqwpA3FCR2qE3yXZ8evjhHS0TKU5L6OZAQoMBSUxPKy8WahvrHyFN7EF
	2cuVH/QwxHQAoGhcciiA02hGaWSc4ERvfC0+oS78cA/9cmiJmjHro=
X-Received: by 2002:a17:90b:5384:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-39aee1bbae0mr2087119a91.18.1788314232120;
        Tue, 01 Sep 2026 18:57:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76622csm8876306a91.11.2026.09.01.18.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:11 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v5 0/6] Fix a variety of TPA bugs
Date: Tue,  1 Sep 2026 18:56:43 -0700
Message-ID: <20260902015652.2421609-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

I am sending this series as an extension to my v4 [1] which was just 1 patch.

Note that patch 5 of this series can now cause the device to fail closed if
memory is tight; bnxt_init_nic propagates an error that was previously
swallowed and fails closed instead of succeeding in a degraded state. If the
maintainers want the device to come up with a partially populated rx_tpa[],
then patch 5 can be dropped and this series can still be applied
and will otherwise work as intended.

This series addresses a variety of bugs orbiting the TPA code in the bnxt
driver that Sashiko (or Clashiko or whatever) pointed out and the series ends
with the patch from the v4 [1].

A lot of the noise generated by the AIs while reviewing my v4 are unrelated
bugs with different fixes tags that, IMHO, distract a bit from the crash at
boot that is currently occurring with Thor2 hardware on recent kernels.

That said, I've tried to wrangle this series together which I hope will solve
most of the important bugs the AIs are feeling something about.

I do not know what other rabbit holes the AIs will find when I submit this
series, but if there is some reasonable stop-gap that we can get applied to
fix the crashes on Thor2 (while I iterate on the rest of the bugs at the
pleasure of the AIs) that would be excellent.

I boot tested this on a Thor1 and a Thor2 machine and there were no crashes at
boot.

Thanks,
Joe

[1]: https://lore.kernel.org/all/20260828190900.1767611-1-joe@dama.to/

Joe Damato (6):
  bnxt_en: Only restore LRO if the device supports TPA
  bnxt_en: Don't free the live ring's TPA state on queue restart failure
  bnxt_en: Propagate TPA buffer allocation failures in
    bnxt_queue_mem_alloc()
  bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
  bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
  bnxt_en: Bound SW TPA IDs to prevent crashes

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 57 +++++++++++++++++------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 2 files changed, 43 insertions(+), 16 deletions(-)


base-commit: 1d2929d0850fff683b8aff051275945e65f082c8
-- 
2.53.0-Meta


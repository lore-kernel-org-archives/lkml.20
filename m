Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267288;
	b=KOl1Z9xZJcG+jUEpU5nUulHwhCrhQ8HYVEKLYsjJ962zKNcM5xXPfqFoh06p9N4rBHO8
	 tRDigm6MROf6QrsO1HxovtytzJYEFJi+IE5SJ+UJiIL8fx4ExgrrrzdN2r8TDQdp2ENuY
	 J5rXmxHGaYmcK0e80/LEDsVYSr6IsIZICXbSMjy3fiKWSBTnsTfAycsovWd4Qu1jP4DPX
	 UkekgXf0BmPbzc5bLY1k/UXxoGRn0HFUTZcENhy48Oy7XWNXJmfWcu3Ki/FpwNQAZtdkK
	 tiZcuk9CAIqZJAsqwW0+W7MUnWngWUKpUqvwyw+pckJIT3Z9gTyskjJmT5K2ZHg+Wmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aA4dQ1HDNVp6PloZLXeJ1kd3NLKw0188KeBSwOCLWMY=;
	b=o2b8mf0Ye8BbY1TinI4unG4TzLeA6xXzpELpa7EQWH7zUanEmdwnlfPzbtAqC8dq88ho
	 mOoKAP3UgbRRIwumyqyqbtGK+cAEvDDx5oyXEsSaD+BPRRr47MkTiCHaUW1TqZeUHKN0r
	 ThqFwG3ZazFmBRXa3wJKykJMQid7W0LV6YfXLmllGXW4thCn33SnCb1hsoVLivI15vAnK
	 fM8H/Q65CPZjdtQkPzZzFr8Ak4BHRgZTR7V3YwV8VrZOxIIuAkbHIEUPRseH5mxlbq0oP
	 EzlvtSUtYgTlLoaOsGqMr4sVFSOhE+L/OnKDSwLM3OTZbmHZ18/yGbNwBlpTnwj+IiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVw43DXB;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C67606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVw43DXB
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a058f74a54so928175b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267283; x=1793872083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aA4dQ1HDNVp6PloZLXeJ1kd3NLKw0188KeBSwOCLWMY=;
        b=AVw43DXBiUII8K4oi4Y9CYkVK44ibUTbT/35PQgwdH65QJHiKCdQnkdxjFOqDKpppt
         cXK9SDiuD1mh7L/uyLS8yunJYr/FFn5c//YgdwMFHjfS12T/bWYdHDqj+XXHNo8i57L3
         4IO6z14DdxtLa6OJnl8l9IunM3Q33qRmOPPPgy8IWF6RXN1wscg6XNPlGzG2iqf5WBYO
         EEc1TpAPwDt8IDhhPziHZgZBSWTdxK6ZMMtv9FvTnHschxj0ZVHaUi0Y8t1uJJQJq40C
         H5XuCNNnaHRiP6ltJDemWOJ6pNw/JLVsrXLqraekWZfYD45xmdBiGYvuFh8IciISJwdr
         aJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267283; x=1793872083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aA4dQ1HDNVp6PloZLXeJ1kd3NLKw0188KeBSwOCLWMY=;
        b=qed4I39Of05o6pWRTa/xTI46Yn4jVk7QKfeQ6STNm3q2+fdo6kWqDJ0ZGhJ0fUXVl9
         cc0iZQOGU++1kJqd4O8kGsIgQ3IFpsTbMuCR2hRMEM4MTn4a/KQdYMySQ6PZNRurSigi
         8SMJN80uT70AuPwvj8WhGbugrWB4Uf9nHsIxwItl0Q3q+yyHSSpgqM3TzCI775lhW/ei
         uu3sHi5rQTQ3YI1SCXgVnTI4C8yA+b5724OtbZF/Vxz7Re1XsddS+pcEgpZlY4BLD6In
         24xA0ldg350Aa0P9PLpm12a5s/Hyy85/YMUIYOs4VxL0krGFeqtxUiPMxL/KU+XAqLs/
         4Yuw==
X-Forwarded-Encrypted: i=1; AKwUvBy6kfIjwSWrqUNdJF5n9lx/KdVSaIdmJIaTjFhBFt2gnXx7uFpzLQ3ku4GOycdZmSgd9fq9p+GFVgcakOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4qf0LTTGCTPRmOjb2BcFc4LbvKboxFDv1DlD9FE6XppY9/Aww
	wm9B85v/MHjG4CbIZ4EPEqcgBi2WxbBLhFq0kri+65f/rnRRxwChWvCp
X-Gm-Gg: AYBFou2mvQ64zTOmwSBhwUV78+Q91aV7D4Al8E/9WvtIHS//ZZPzT0PM3mK6+iWb9on
	5bYpXFl+1v5sVyEv0Yd64D0zpaV2Vts/C/jnqjwOFFSgJM6lkO9MDNNdtYWjfIqwT4OZHs15pZS
	TEEgFNTE0smNCgvv5lYbwdfrvtbYKapPudKaXsCU37GBMAXtMpkcbV/35h44Jxo8DBtUxZE83wA
	gdJVNonAfU05gT5EJyvkuS/hcxwx+Wl1X4fZyEBhRb0FJlbPZuRajsftSqcG3HabJatmuEGti0U
	sWBD3pXiKDwljrzywnvu7ibqNahxQv94wE58mOzAVykjnbyV+1y3oPcpO2fBPRAzwygPguN9Eq8
	E+Dkrv40w0B8/2Z4qRc2HtT4nS+vKNkoZVaMvjbd33cXSwaxTgHa6pfGg+JgCXeAQqT4TyRkfPW
	YZ7n1xnudgZyeyNpP4pxSJf9266d7h9uGcG4ISLkJ/W+uIT7ytPLyjxDpgxC/rpPkcMsuOQJ6A1
	Wy5D/M5MiyC59nkicLbWdKoxhFp+1tIwLv+hmRrDq3kmu2iURTQdlxUTkix3HjYwnoYlR6cgF7T
	Pb3Mqse+ShjA9gh0xsQLxdkHYwawzUsTn79WcBJ223gsp6oS7PL6up/RXSHtGn+jmsN9a1Guy2B
	QLwDwo37Uyw==
X-Received: by 2002:a05:6a00:854:b0:89e:ba55:119a with SMTP id d2e1a72fcca58-8a6e83aa99amr3590208b3a.47.1793267282263;
        Thu, 29 Oct 2026 02:48:02 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm2187143b3a.21.2026.10.29.02.47.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 02:48:01 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v2] wifi: iwlegacy: unregister the LED if 3945 hardware registration fails
Date: Thu, 29 Oct 2026 17:47:42 +0800
Message-ID: <20261029094741.21162-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

If ieee80211_register_hw() fails during 3945 probe, the LED class device
stays registered after probe frees the il_priv that embeds it. The next
LED trigger registration, or a write to the LED's sysfs brightness file,
then uses freed memory.

il3945_setup_mac() registers the LED before the mac80211 hardware, and
il3945_pci_probe() unwinds a registration failure without calling
il_leds_exit(). 4965 already performs this cleanup: when
il4965_mac_setup_register() fails, il4965_ucode_callback() calls
device_release_driver(), and il4965_pci_remove() then calls
il_leds_exit().

Unregister the 3945 LED before unwinding a failed hardware registration.

LLM assistance was used to find the bug and review.

Fixes: 5ed540aecc2a ("iwlwifi: use mac80211 throughput trigger")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Explain how 4965 already performs this cleanup (Stanislaw)
- Describe the use-after-free concretely
- No code change

v1: https://lore.kernel.org/r/20261028142328.18560-1-enderaoelyther@gmail.com

Validation: A W=1 module build with MODPOST passed. Not
reproduced; 3945 hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/intel/iwlegacy/3945-mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index f7ca182d1494..5e11f0597255 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -3529,6 +3529,7 @@ il3945_setup_mac(struct il_priv *il)
 	ret = ieee80211_register_hw(il->hw);
 	if (ret) {
 		IL_ERR("Failed to register hw (error %d)\n", ret);
+		il_leds_exit(il);
 		return ret;
 	}
 	il->mac80211_registered = 1;

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0


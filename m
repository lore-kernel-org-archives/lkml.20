Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2443552B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344502; cv=none; b=e8q/xHKybeZJWSmZ3mnp9d5pK+DSrHQ8mKfSmrYC8FwksYZaUuNeTyZ90U26ceyXAVvr3qspL9iOoZjUfb80SzyDAH4N9arpvhG0QGg/73cV1tY4mbcA+npAPNctVmzqcESyKzLYP6+SN4TxOdn4zevStIea17xpIFA9fzgDYYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344502; c=relaxed/simple;
	bh=PN0SQykzwIuDfzW7cM7x9d6iOw/F95MiQoWSfYFmBhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ui4Q+PaGnXnslCGkhp2DboAFsiNHmCTI+EZBSD6RcT85YqYs+tbzT0ob0J5EOgED9Az9fMFI/N+LimSRt6CwFd0LPDzTestZtGX7Z4d4gYdMFNfa5W2nF1PZYSSOUOoDkFscxn6jF99LvzL1Fu/wF+QHv1pRuCeIYKSLncbWo+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8WNoy0u; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8WNoy0u"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843f205a5bso607019f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788344494; x=1788949294; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RyNaTqC+dGU5WjZ4HH9rH2GXhsS16BNv7gX+HI8+RH4=;
        b=A8WNoy0uVJwnW3LaN8FnwQtPyz7kK6JVqgatnLc0ZgTFOgkHclSNGBZTT/MGaN5aBv
         jJXSYGc2qXijkt/RuZBGHeI0GH4STWo6em2+i6C6/hXLTxB5viub7YP7/kMYHbYG+9RA
         pjgqj9l+jXHSJ1q/A2WGi2WBATLrzYPvVobeyTnIag9dmktRCK5IQfNrG+NvFFaWhtiQ
         o7AIqAw9SwiovOp95ZMQl11I8zyqgdOBc+bvR17K9n4nBzWTwyRZ2tzvzXctc5KcNjT5
         3w3ckbC5dYPt5mWCozVZpZKSBdJlPad+qcGPvYyGMKrUgMVOc/GcpId4zXL8w6sGcm+M
         aVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344494; x=1788949294;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RyNaTqC+dGU5WjZ4HH9rH2GXhsS16BNv7gX+HI8+RH4=;
        b=OqczrGc+A1+q8cT7d9TviL+dWJztBP/DPN6vxU8OTEjnUuB56pPvbVdl2/QnSXbJDn
         GxUFa7ShID+6jeVBugpf0e2fkPwgNyN7ov7AO+2C5L+u9LclkeXUaXiZqeEZ71CDfHwa
         ja11SVA0iUwAoMl8/49DdUKhNqBN1QtZJJzb4v64qcqNqi1OdxO5rmaIStSPuKd2eABZ
         a+2+jbwd0w0/ilxf0Z3v9ptkNP1AvD5inNzTHytMrUAmlwBw5RFAhKitA7AcHIk55VIR
         7cVHE9YBu9oVHWsoztyZSqCEHSy3ZX9EEvjQ5GCdDBQB2036kkQ12Gso9J05cHcfOLCS
         GT8w==
X-Forwarded-Encrypted: i=1; AKwUvBzqr8Wcz8lxZfONdtcSo20Q7qsf2MkVvZFrY8V9VtSXfgpQ2+MAapqZga3ADjUcUB/8hr0lE4wwew/RxgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kgS4QTX/Uo6/DwBBxIGx1zIPIqsIOQXWneOKCTFXyim56CEZ3b
	n/mlUhlYBq3mmSGSOVwUH48huiBhpAHCa67mH08yJuPbz8b1YHVNDjNl
X-Gm-Gg: AYBFou0N/jkMnAjatSMgZFBQplnfA32eEi1AMvoKad6N1hLBrTI6WQS/yCPC2jrNulS
	reth3+lxsVS1rVVqtFD57eRWCaqdw/DUM+ixHgp2d3nw1KNAA3y98mPEmWleYTvWSBGskNE4dth
	UK/JV43sS8GmsbbK/7ld0/NqJ6t/Z9k9mWgk86h0dvZY6SDYeTaRJc4AhP2MFcPTfIabm+kt+1F
	Re4O5tdtW9DTmhzHPBFxT/WSGHZzBFs7VZJiD8W56+ERl/75N7RqkCiErWUbxhDG2ZEA9AaLFD3
	LS3q/MhC7+SwRUuFMHE37IfK5eGIWAWmdbtrfnjDFKijte7pR+cC/9d8AzrCetqH2Hfhlq0hk25
	XkkEbJREBHQ82glHpgna9Brbl7N3dFVOFpiZ6UI15hZc5MjAyilipP3Ine1ridNF3Q2JKp9UCt9
	U0+NKuoc+FU38uC/NFu+BKn4PkYqHMoDLRPHGhmxgKsPTtNanioQwEpvwvFZ0ESeXPxSjy3fYgg
	EU2P7eIrZyrc46uGF08eEnKFO71zpUpug==
X-Received: by 2002:a05:6000:4698:b0:485:4277:fbab with SMTP id ffacd0b85a97d-4854277fc83mr3594765f8f.27.1788344493846;
        Wed, 02 Sep 2026 03:21:33 -0700 (PDT)
Received: from valmpani.valmpani ([2a02:587:f24:b00:967a:9200:4108:5b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdbfbsm5485625f8f.33.2026.09.02.03.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:21:33 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Wed, 02 Sep 2026 12:21:19 +0200
Subject: [PATCH] ihex: Fix 16 bit truncation in ihex_binrec_size()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ74l2oC/yXMyw5AMBSE4VeRs9akzqIuryIWyuBYIC3SRLy7Y
 vkl/8xFHk7gqUoucjjFy7pEZGlC3dQuI5T00cSajS41K5kQlGFrCpuDbQuK6eYwSPhu6ua3P+y
 Mbn+3dN8PutCOp2gAAAA=
X-Change-ID: 20260902-ihex-62b68b7e2bae
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344492; l=1905;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=PN0SQykzwIuDfzW7cM7x9d6iOw/F95MiQoWSfYFmBhc=;
 b=7erELQ4frAoctqDjCU/gaAu4a4a4lUMXAJuFpt7OJYsRYu05Yi9tqSjwxwMVXn9UUIOrI+pMK
 bC9tpR4iQwjAoHvaXbK/7xE0aNNRFgQnb6qy6HlWuKngX9XfBtQxPCf
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

ihex_binrec_size() returns uint16_t while computing be16_to_cpu(p->len) +
sizeof(struct ihex_binrec), so record lengths of 65530 and above wrap.
__ihex_next_binrec() uses the result as the offset to the next record. A
length of 65530 gives an advance of zero, so ihex_validate_fw() spins on
the same record forever. Lengths of 65531 to 65535 advance by 4 or 8
instead of 65544, so a 14 byte image passes validation while its first
record claims 65535 bytes of payload. emi26_load_firmware() passes it to
emi26_writememory(), which kmemdup()s 65535 bytes out of a 14 byte buffer
producing the following splat:

  BUG: KASAN: vmalloc-out-of-bounds in kmemdup_noprof+0x3b/0x50
  Read of size 65535 at addr ffffc90000075006 by task kworker/11:1/174
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   <TASK>
   kasan_check_range+0x10f/0x1e0
   __asan_memcpy+0x23/0x60
   kmemdup_noprof+0x3b/0x50
   emi26_writememory+0x29/0xd0
   emi26_probe+0x2d1/0xb64

Return size_t so neither the addition nor the following ALIGN() can wrap.

Fixes: 9fb4ab4d3dd6 ("ihex: Simplify next record offset calculation")
Cc: stable@vger.kernel.org
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 include/linux/ihex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ihex.h b/include/linux/ihex.h
index b824877e6d1b..0da1c4e3e693 100644
--- a/include/linux/ihex.h
+++ b/include/linux/ihex.h
@@ -21,7 +21,7 @@ struct ihex_binrec {
 	uint8_t data[];
 } __attribute__((packed));
 
-static inline uint16_t ihex_binrec_size(const struct ihex_binrec *p)
+static inline size_t ihex_binrec_size(const struct ihex_binrec *p)
 {
 	return be16_to_cpu(p->len) + sizeof(*p);
 }

---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260902-ihex-62b68b7e2bae

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>


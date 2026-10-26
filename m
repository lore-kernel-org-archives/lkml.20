Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013716;
	b=GteS7ZH8TAOEGLOer6UstslieAl9YICBEnDYmHFFR3SzrLPjKf3lSdkTIozv5lxI+/VJ
	 +o7TTx8Z8NtqsYhwB4H+BIp8PJ8ujLNsesy/TTGfvzVUz+lmTytU3fAh23+zvFfX8RVOm
	 QcTqPs6jUxYPDlmQqB16ZlNTpSSuEw435IgkvYp7IIbjgNXjx7qNObzkY5bhsJeWQLEEv
	 h2bgEHa25PtcqdsovzjV/X3qftATCRzlAUIRF6K17k5tG/uzzRlVRjbaiapGeCxJ4wIaj
	 uJJ4ZEaoQdPyctfvZFWME0KiaCJEOi3DR7QaR20OKqIE0C/r6w+yRFvRpDYXxB51gnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ab3qsq0Zm/wtrlV42bZPrMrfiWNQtv9iNLW5xd0R+EM=;
	b=JNucr6Sqyg5EbmJ2XNeSImsbI51OPxyASnC4+b9Qpt5s31+MrCK9brQPSeYbSuOA+kNR
	 hdk/b3AofH9bMEpEieMNj+o6iwYMFQvYFf5WaMYOHENH9C9eaH+KvZmqqq2CJzxqfD08m
	 ybkgnC9qyZquNqHT6qUaPQVWWeqrCXXNnKf0sKie1aMqLvn8EsR8qZoV1clYu00Jl/5KB
	 dqFmBSLIJ0/NOoUd8menqVEyGvgSZVgFCfMs4cWczVGyblJx7yDnd0hx48H9a5UarCfqo
	 KafdDMGPFGMGWlszFGR9O0j/3+y4WXjcTTfaUDTKQ8pzAJp/Z4VMeGDFm0/o/nCaCSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HdjiHgPA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F83F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HdjiHgPA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1386302f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013715; x=1793618515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab3qsq0Zm/wtrlV42bZPrMrfiWNQtv9iNLW5xd0R+EM=;
        b=HdjiHgPAzwt2JgdA8b+cpEzFUMRzTseR+tU8GvQdsFatxrRF0b3mVOviRInlkvJdZo
         rCqKmwQ7mFhleew1GAsOe0yU0+VOk+57HdtMp5pMhJ3TVz4XQ/On2jnDmOLuw9SF94BE
         MjFUY1IN7EG37pQud43tdpITRvJo9K4G1Sr808f02MhPzjZ/qy84pm60Wi2Gwcv1I+C4
         5aSTq7PL1gREjfz1DFxHsxduoqSMls3XdU1I6zOyN2H42TGgyyOSPHR35fgB6I4wKvNX
         QzsZdfmokJji7OqFUAyRKIZ3+U/rxIqdF++wwI0H8VmLtP6kVzzlIDao/mMZhb16vlX8
         GBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013715; x=1793618515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab3qsq0Zm/wtrlV42bZPrMrfiWNQtv9iNLW5xd0R+EM=;
        b=hnwA2CCDiZHV/D1Dzxe6iAFW0j8bvY78H/j3lrn4WTaYRDA2lTn6RsR3kEXeQN267+
         wAXfHPVr1KZaT9w/7t1cFPqDn5lYgNY6G4QEI0ntCeTts/cjj3BaiOQBi8K4inHbU/fW
         NMFV6mWL8QXP+ToIZlk5DQ+cDN2mNBKLKE7b/BdlOdwU6QDwpJdrsmr1SjYNAfw/TONq
         P9RPHbsozKQO0t8fz5T0MjIcQ97nDbOD/bYNfXBsbSkvlhIzQbWeCABqQgKcK5EqsqaB
         +NPUKMqRKV4bSn5MDbyzl4K0KHSbHGaPG+G8OD+HkwyETfsNhoBiMh8G+zBlcb1yNH1u
         iy7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkzYzXHCK5zamruGvTHUze2AovnxAsZ8cv4anmOel+//uS6jfGa+mCeww6dKeV+J8xD1/wtT0bViiUADo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4FENMWYRUvwiE1UBsftRZp4d9X7i+9Iyl8H2chq2jIQ6zSWwV
	d9j3aLDt8L/k4xsqO28sDLDllrU+VdshJe8eCxl57E55KRq3z16VVcTJNY0sKag=
X-Gm-Gg: AYBFou3I67goAsP9E+VryRIWvK1T4HCTTPf/VBCO4YcTnco4Aoh9ucO8AvKa7VfWWoa
	dsupIViGbJrnQh+6Nq/XV5ch4WnmcIQ8o6mcw0Q19DrcN4hscWYYJJkWLD78u6PL3Y5vl+U+wcB
	bbhOCEaWTE2GKcQg54Ri7B11yAxY6ztE4vTXgiHpqzQbdfbFvGJ08SC4OOT5boW1BVGx9PbWpQE
	CkRkK+y9ak+KusISeIdaFFeqDv1/NTNoy67HoucZID2SyAy0M+hoAcH6ByhTVcvwMurNgiVvjSN
	ATLAqs7WiMrPekYQIxWVCuOCROUcITy4R68kXY66+6ZQMecQQ8rSjzbdySnA6UqRTNcdTfgo2qs
	5Dgd35f/h1RWzfzYUdfKid7dYfa+A0SaaFoKIS7fy7NcFgIa6v9T1rAhPjMf0p2h4cEzfkYZ6A7
	TVNi9+BsmpVbmuGC6/XllJmuDJbV3K9GtbDZL5IDyPRuaBmeB2dG//5YOIKWawm7RL2qqb4c4o+
	BgT7QnsaBDPQb3NHYggv8qc
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e3eb859dcmr11804667f8f.16.1793013714844;
        Mon, 26 Oct 2026 04:21:54 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm15048703f8f.56.2026.10.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:54 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Christian Lamparter <chunkeey@googlemail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Kees Cook <kees@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 2/3] wifi: rt2x00: fix IE parsing loop bounds check
Date: Mon, 26 Oct 2026 11:21:50 +0000
Message-ID: <20261026112151.2515228-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112151.2515228-1-tristmd@gmail.com>
References: <20261026112151.2515228-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

rt2x00lib_find_ie() iterates over information elements using a loop
condition of while (pos < end). When only one byte remains
(pos == end - 1), the loop body accesses pos[1] which reads one byte
beyond the validated buffer boundary. The read happens in the bounds
check expression pos + 2 + pos[1] > end before the result of that
check can prevent the access.

Fix by tightening the loop condition to while (pos + 2 <= end),
which ensures that at least the IE id (pos[0]) and length (pos[1])
bytes are within bounds before any access.

Fixes: 1c0bcf89d85cc ("rt2x00: Add autowake support for USB hardware")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 4d94b7062f440..5623ab11c6142 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -564,7 +564,7 @@ static u8 *rt2x00lib_find_ie(u8 *data, unsigned int len, u8 ie)
 
 	pos = (u8 *)mgmt->u.beacon.variable;
 	end = data + len;
-	while (pos < end) {
+	while (pos + 2 <= end) {
 		if (pos + 2 + pos[1] > end)
 			return NULL;
 
-- 
2.47.3


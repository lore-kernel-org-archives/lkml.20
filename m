Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE793B8950
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135799; cv=none; b=m1D1EJ5/wUOlrMX26YdmjJ9wWrvMunZu5v6D0qtx71E/mObB6tBq8Yez88AqQ8a2s2SbnG1l5DAzCSWJA5RA+W77HBjnIe3Gz0nbk6M+l2q7KYjCwy/pfEuZRufKI1eijnH7sdvHUAoEq5wrUk/kFRHbwu7lH1f99nSISH541eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135799; c=relaxed/simple;
	bh=UHxbXnNz5HUYTb29HGjKrLh62KMUdOWP9PPapwJ8CWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGr7qb8B0Jvs8iB0VfvgjkDqmtfLDed3ztlsyFaFayDdLWyQn3U3KgMAkexiyxUvtBx4wjIlZ+A6YIQ1AevTNK38Ez37egQFdnameSp0kVVt7qbwL6Od3apNPp6RmERKYEaGAYIKE8AmKkcxAhSFls5iqbLvDUg2ixxWsNoOFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1YhHyHy; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1YhHyHy"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso2219305ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790135798; x=1790740598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLoSPPIDOuiot3v0sRPK1oQnqyJuz/HjWQDWKSdrDik=;
        b=E1YhHyHy18c/LyeTZJ+Yjpn0ENobfUziZ7FBEG+cfxBq7ZWkxbB0ho9+N4ES9E9zn5
         ORzZqMpAKkpI/HYuCQWUDMqsxNTTdSb6fE3D9QifAWwnBfBkzkSTd22ITGdeVRwfcBHO
         XTKKPxe03/8zmTR1wBa6Qq2jt5ymzY2QX4G9LurUBiU2hEsKlX1YIO8kai7GASW1M7oz
         KIuYaNy2VEN+0qMkw7MttkICf6+ilDsYFo7JjEkGu9QCcopGDFd7kBmZFaWmnrL9dNPF
         G1KZxPZ11gjJ28SlMciB0AHTZR7WBZnNp2OQhw3XS7c1IQSKqFwpjLuH9mVWkCgUo4Ob
         IQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135798; x=1790740598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLoSPPIDOuiot3v0sRPK1oQnqyJuz/HjWQDWKSdrDik=;
        b=x2JKYSqLU549lJwxgKuZriy+lcyKnkKoYLzYV86NIpAEvGghZm1RZBKOV52WflWCgx
         mTF5YF4WksnoqXP6+14sHL/aVgAM/ELVgL3+MjoPdFZy6ClIVhzCphYBPAWHPvYGYhwr
         YcFWTPtvZAbNyGcAD9RhMU1hXHOeUzEl/4qvkMuZf0KfMkudh8d/meDK0F4O1F22PtIA
         eJoOXKG/gzzUt3tlqoBXZhlx1kxWpevdnA+evlv0ftcaSiprTqCxzNNbljiLCchqm4Tx
         GCLj8qup9jBoETTKs3hmZ/0ft8z78DtpaobSR7ZGzUr3fpiDFCIqiPxajlR2PslS1dq0
         S0UA==
X-Forwarded-Encrypted: i=1; AKwUvBxX3V9fpvDwuHu/YyGZpg0+idgqm92cHwHWZoWHVZdtc6noj0XHDrAVWhyvKkG0GtWhV028j0oYZaMOqxY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+hqJelH69hz1gn8q36o2uOMkQuyf6Q8EzqqdcRsIw4YSJSCKz
	03bqu0geXBYzxCYyP/Nfpd9+DRhhTzuGjPZ2YzQcNcG1Z9Sp3TTtgMYU
X-Gm-Gg: AYBFou0Zppbj/hp856Pkx5oGfBnES/uUE/yiYNXpu/wGEwsIkbI8b5hU6uRjmXjVvpg
	TNQnQO5lopcClXX0caKZKxU86XI1CO4Iz7T3UiLgZQVKQqle3GHOoOU/KOBGmcW4YimYwte654v
	13/1qO7ezdK8mbc/cIyuJ7H9gxUDfrpm6M/7o+k4FLfqt188dIrGIgHAY25a+qCO9DnGstd1tvc
	NNciUigLRLrwx5638iGFjjDz9NWwuZZB6PRiedcTDzZQGnOPo9ZrDrDvjCfX7UOkcwyKMPj8raw
	dDneieqteil6wVgX8PP8ns63OjWXLaw+lv4xx/qGA83Zd+TgkDA3vT/VVyCWhDng62HtMP1nDAt
	PcA1Bod0qCSmln9+8Qal8mq672jrunSeAtOy9GsCj+1F1RIdvVNQCDbxfgOitGrAyha4ZulL3Gr
	MgisJNMWmwfkDE6k0QxyVnRcY30GznLddjTP+OmV7SPCk0iPxL6RKDov6DJbYFfhxyOwhmysveB
	FomIDyYAHAaqN86s1KsRuBuLkrjbRmdAs0iW/8jtvmblHjp8Ay1ygBwzb5AnHDVV/oL+wdsLsY=
X-Received: by 2002:a17:902:c94e:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2df69d5a776mr13052365ad.19.1790135797674;
        Tue, 22 Sep 2026 20:56:37 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:794a:555f:d5d1:ac0d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a843asm3850835ad.25.2026.09.22.20.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:56:36 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz,
	johan@kernel.org
Cc: kuba@kernel.org,
	gregkh@linuxfoundation.org,
	error27@gmail.com,
	michael.thalmeier@hale.at,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH v3] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Wed, 23 Sep 2026 09:26:27 +0530
Message-ID: <20260923035627.6210-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

frame->ccid.datalen is read directly from the USB response frame
and used, unchecked, as an index into frame->data[]. A malicious or
malfunctioning device can set this field to an arbitrary value,
causing the driver to read far outside the received buffer.

Bound ccid.datalen against the maximum possible ACR122 frame size
before using it. This replaces the existing datalen == 0 check,
since datalen < 2 already covers that case and additionally
rejects datalen == 1, which would still underflow the
"datalen - 2" offset used below.

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Assisted-by: LLM
Link: https://lore.kernel.org/all/20260906054336.20187-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

---
Changes in v3:
- Correct Assisted-by tag to "LLM" per
  https://docs.kernel.org/process/coding-assistants.html (per David).

Changes in v2:
- Replace the existing "if (!frame->ccid.datalen)" check instead of
  adding the new bounds check alongside it, since the new check
  already subsumes it (per Johan Hovold).
---
 drivers/nfc/pn533/usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..9471c34b4d4b 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -319,7 +319,9 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
 	if (frame->ccid.type != 0x83)
 		return false;
 
-	if (!frame->ccid.datalen)
+	if (frame->ccid.datalen < 2 ||
+	    frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
+	    PN533_ACR122_RX_FRAME_TAIL_LEN)
 		return false;
 
 	if (frame->data[frame->ccid.datalen - 2] == 0x63)
-- 
2.43.0


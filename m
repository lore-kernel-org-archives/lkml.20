Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE6328B7F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185844; cv=none; b=PIT43Re54fEAXMEu81TOdlAF0CxSVdla48ectFSmfp4fvESfRKKuSt4J/GUdM+HQ8vtkfsIqVZ04IZdiUag4leCLJ7lXNZtIF8EuXkz3MGW2niXxT1l39bkzynhBbq4txRNRlhqdsqJkzqgKBL1azSrgfLpHcLk7XehcC9DoYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185844; c=relaxed/simple;
	bh=n2+a3bHoasD57GyzTGSQRXSs6iKWYXA4uMXs9bwZOSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KEtpmmJbHfkdXcWGaDOLCjnG1F/+IOu7j2rWfLC0iRc8tne7azYQP4Ib10zn/UEqdIJvczHtn5TeozQwhL250KLhn+ssNfefBl477Ik8zdBCNPWOZmrjjqcM2fL89kOHcDahAp0Gw0y3jQxmY9rj5I6jJlAm1d6r1iwefG9rCzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKtqbKMn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKtqbKMn"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c6920so168322a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789185842; x=1789790642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UClbOqJghVNS+HetxvyOx47BLVX5S3LX2RS9VshAjqk=;
        b=PKtqbKMn6ocf5hPmyRK0Lj/A/YvpTTf06QgNwIa26Ps52xTNCBb6bHD8nfg+hcjUig
         pfgQkWUUtPCczixwVmMTrnpqNq8F0aQnEMoPWy/Gcqueh5Xj0NQN2EAICnXOcNx/T+f5
         3krAkntNKWMY2hKV82a1dnJKXRIjKc+0wptkjXCkes4M4mphAsxm91f9JMerfGE7QQoR
         Cs5ybkFpS8ZtKA37b/PHaKhf50GOgbXaLQk1/ZWAyowDlD9AuW3SWGtMa1xbeBetN2YD
         SY2u7SrDWk+Ub832bGmASdabhMmFexKt5Ln28cJYwFpxH5x+DM5894mNAJyspJyoOG5R
         tnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789185842; x=1789790642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UClbOqJghVNS+HetxvyOx47BLVX5S3LX2RS9VshAjqk=;
        b=SKwdJfGDF4PDrXj6J5lUHlOzIAzyu960ZDKzESWZrSTLnsgFg4rhNIdCuyv7QC/xxw
         I/ytPNQp3FBYYH+6t6b8rf7d7hkKoese05EM/BPp/9ztAs1xncMCxilD9H7m7U2Rs1pA
         WGH1Zd1h6pws/bQNrelw5b3RgJP6qdIUeNZUPx73Jaww7zVPdxqs4anhmXz6O+7dGvUX
         Kmh+EmN5hmUNyIFNRTECK1I/QP0/hyNWVcYm1GpkygI2ufIFnEWb2yBUK/YUPCIcDImR
         d8v4vGt/0+JUF1BpDpibxLuG3pfw97KGrUNDaCQHC2xq6tCnYt/bU4MrVG3l3KNcDy+o
         tCPA==
X-Forwarded-Encrypted: i=1; AKwUvByvJc2GVUhhbm6fwXVpCPGCqQ8IuVv7bzN4zQh48X81SjCsLiZUaTAfyvyITtD2Hyl6kTjWhWGbhFT9Ms8=@vger.kernel.org
X-Gm-Message-State: AFuF++mgSxHdfZ5Z9M/oZ+Ub2ao2/CnSH49Sh5WMrna5oIAlNsNwsEof
	pkybR0jXfaR23Wl7tAkm2F9tC/RmDRlEKcBZIy9usEetXkg1Y27sE0d9
X-Gm-Gg: AYBFou1qBGrE2ISJ8mlPDKs036YnGEabPqLyOmSLpsn60ZfjVSW4mpOwvNn+Nn5t1K1
	OgTYzM5V+jsIVo9PGnTIpq4r1w/BJl0pH8zQ0T7W1gfl0SXtGE3gkCMwpT9K6o7KMKNDJOfTouU
	9rEkNrap0WpVwbVrKxAJ5HcUB3R2etZwQaeKAnPqTTgNulrJgbkihcOaCUv4Eh6HsYD6am4z+rF
	pTL5YFWe7iF9LQAKB4hULk4bUO3SKdpiqn3t0ieMoNvI1/S+/e+OuIwX37JepgJRF+o4P6DLPFz
	ieX3C4gbt2gEWCdHG7F3BcVv8khJthaig4y4Jti8m713+1rGaGCAg/UdFyYJzmvcmbenQmKgOq/
	MzMzEzk7As0lRIRfZZ4Wl4Uh1YnAEAP/UsiPdXvnVokBoBYt1+RyOf3lWnTJpBe3YEt8KiGANfJ
	5W0MepA1SslNZc5vY5cphYpbPFg3+i3XdG8huVSuyk46iE6AX52jHusbmoB7AQbbQP+FLu86Nd5
	xPR+DFbK2NMgKWoxnZLDTJVW4ZgII/V1k9YWn25z6FQzdkRxX6ZVRpQzzyy79p4
X-Received: by 2002:a17:90a:c2c6:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39dbbe85d7bmr2067589a91.4.1789185841956;
        Fri, 11 Sep 2026 21:04:01 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3e34:fc0e:e4a8:fba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d7ff2c5sm1937554a91.2.2026.09.11.21.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:04:00 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz,
	johan@kernel.org
Cc: kuba@kernel.org,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	sameo@linux.intel.com,
	michael.thalmeier@hale.at,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH v2] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Sat, 12 Sep 2026 09:33:51 +0530
Message-ID: <20260912040351.15056-1-kartikey406@gmail.com>
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
Assisted-by: Claude (Anthropic)
Link: https://lore.kernel.org/all/20260906054336.20187-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

---
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748413;
	b=QvvcGkzdBqot9dgsdfFFvH5j4N+zOl238oyuYHwkAH41OZjAlhFszOodizfN1OHAJvb7
	 UaBWWoeHIxqOaUx2ly6waE9MqiAC0AvdzJPMQbmzkNl/QpieLODo79b6WXefhiCbRwTCY
	 E9roL+yJfvaGDEfEWwsewK+48E9nhvLgnD6JZ4raWfVVz0FGXju/GDFN6BNzWTYfANnt/
	 05eCmeAK2Ysw+P6OtJ0YtlRHGNG87YP4H47yn1qic3oo1O3JS8nvqGNLGbfkIOrHYrIYI
	 zJ4dhGdIk1XtDofRRtZ9yI2s8Y+A+RM5DiY07rUAKJJPu3nDqrUUD57JSwYKQ3/3AIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6GC1/D8rCTZG76ZRBb6JFA+whGRoK5mBSHc05PTJ2Kk=;
	b=kCDSuZMEht+XWv1hea6PI+WawwXaY/cDROaijAjsYDkga915gLPJfHLD3f6UAF4UNOIK
	 b1m5/r3e4s2K0i5ED+ZPO5NfkAlACC0cr0U6TNrE1kMB6AEqyr1RBVpL7iqoN8icDohLm
	 jfgv1VneHpyZIGZN9bae1X5pUHCcEyBx4d/6xWQ0MwZfC3aGcLDlIvafGWUo8FlRRAbb1
	 PqYu6WI91ut5nvpZS/IP1nLuEuRrWwk7rb++xtCq7fliKErK2YYq0SXGOsX5pPUEXYgqE
	 xaSiLgc1U0R7/CTLUUL84ioMuS8/TUwnajyqcV+pNo/LSOJXnSMTEkcSA6UHuy2ZlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Nn3YTE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED8606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37ED8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Nn3YTE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so747275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748411; x=1794353211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GC1/D8rCTZG76ZRBb6JFA+whGRoK5mBSHc05PTJ2Kk=;
        b=O9Nn3YTE8dyOZfeNiT5qpPNlfOm3EpYECrP3B0GPokTicn25MDq/RklC3lk/43H4o2
         YwK5z7zAxc+yq5rl3ajLofqGchDVxhiHP4kdq85jIj5F70xyhoRXzXtkg2lW02UV/BF/
         0XtglXYfHNqnVdECtu8K0Y4rNO9WiqaDuopEEZCCIVpGbHrAY1EgS3Z4YZBYhlxmFVAv
         RKqPEJcilYuUi2qnG7qmEw7L9cNB3HppLx17T4mXPAvR49XenhXqZgIMr9MtTrfMk57w
         pj4Syrncp0XCTySp4/9eonuhN307DFVRjQIccB1QOecqL76g28Zlbl1dUvm7fhW8LcG8
         UTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748411; x=1794353211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GC1/D8rCTZG76ZRBb6JFA+whGRoK5mBSHc05PTJ2Kk=;
        b=RM4fw9QUpOJ5VXYh8LrAh/eRl1OIE5VOoo+ys6I1P+56eV/75VdhQydLxaJC1FmcDZ
         5Nx9I4ZOrjX6cu4Ni4PfVprNtqBWyNADbRuuN2rN9Fr2cn055X61mnXzTyU6zlTjGDMR
         HmMUi3aIgPosj0LXiLsDOFpzmLyKSSkxP7P9axfz3plnG4psiaRSrmhgUebnnMTYEV6O
         YvttkEHWDQ8gKhpKt9BRp0E1sAmQ9g6iJzSL1PvZVY6vshl94S4bbdYUrha33jl2eFyy
         SEHdR3hCCr8vohzPSV+s3nmU1X9eTFRGiFl2t62ymq5GuzEs4Vt8lO/O9uM/cKegfL9E
         Nqiw==
X-Forwarded-Encrypted: i=1; AKwUvBzym8s7qOdqNL1MYKnxG5uZWtdWkZa7uXEXY9t1B40/MeUSm4uNrzZVmwBcWyMjIBiyxrSGtGVF7kMmt0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cPKM2QgHD5Ny1qIcTUufMp+S2ltTk6VoFoDuj9zB31NxrnLIL
	QU6yM7JKlvD/ZGtpqLdWqO9vWOg/UQGSnDWO3f4ryySiZ/0OC4v+x5g=
X-Gm-Gg: AYBFou2iXjoLBwq764YSq848a+PwhwlN1TQksyidZIbvrihTsc2bWvx5waQ15sh0eGE
	hABT6msCvexOnM19OKsM4kD3fBBKghlGyLAV9xKLjD5rY2vo0dIJKdcjA9Pp+Z7igFIMYefcQct
	csJjSRrvyux7N6C9M66KDBo/L9wFW0zRe/60VVKffbDhMEP1G3SUOvhab6l5yfSFpjmmqPJH26W
	imP3XwLXoGwcDiay6hbse/Sh+FqO0qHuF2eAbKqR2VL5v1cLBpRFyVqapVK8b609P884Ij0qiM3
	RohwoirhCemvi+IfO8zBj5nKUQEwzFbhIZYTnzSEdkyFyvV+4UnxUx2vio4lsrX6MX1ELBuYTnm
	1/5fcyc/bmzNiOtTTmCO/yJFtl7ivJikMOpPtKdTjW7zgc2AcdIGMHGolJxO6VIXBnDgLfDDJMV
	VFEUrYOJ+6GUTkdGwyv++mWmWmadjDcxO7geiX0iOtIiv+VKEZlFkLNq2r3ifEFIZElmtzv/49K
	pDrVZT5FyCT4HpzLV9WFisypNEPRg4U8KfE9fmNSiQwzeJYbdUNiJtBtvAQm9F+sVLzY4ndeMqH
	S9GUKoQN6F56yXr9mgM=
X-Received: by 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr282294535e9.33.1793748411490;
        Tue, 03 Nov 2026 15:26:51 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm13822005e9.5.2026.11.03.15.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:26:50 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	linux-wireless@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless] wifi: wfx: validate num_tx_confs against message length
Date: Tue,  3 Nov 2026 23:26:50 +0000
Message-ID: <20261103232650.13350-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

wfx_hif_multi_tx_confirm() iterates over the tx_conf_payload flexible
array based on body->num_tx_confs, but does not check that the message
is actually large enough to contain that many entries. Add a check
comparing num_tx_confs against the available message payload before
iterating.

Fixes: 9bca45f3d692 ("staging: wfx: allow to send 802.11 frames")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/silabs/wfx/hif_rx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/silabs/wfx/hif_rx.c b/drivers/net/wireless/silabs/wfx/hif_rx.c
index 64ca8acb8e4f2..42417db66c128 100644
--- a/drivers/net/wireless/silabs/wfx/hif_rx.c
+++ b/drivers/net/wireless/silabs/wfx/hif_rx.c
@@ -62,8 +62,17 @@ static int wfx_hif_multi_tx_confirm(struct wfx_dev *wdev,
 				    const struct wfx_hif_msg *hif, const void *buf)
 {
 	const struct wfx_hif_cnf_multi_transmit *body = buf;
+	size_t needed;
 	int i;
 
+	needed = sizeof(*body) +
+		 body->num_tx_confs * sizeof(body->tx_conf_payload[0]);
+	if (le16_to_cpu(hif->len) < sizeof(*hif) + needed) {
+		dev_warn(wdev->dev, "invalid num_tx_confs %d for msg length %d\n",
+			 body->num_tx_confs, le16_to_cpu(hif->len));
+		return -EINVAL;
+	}
+
 	WARN(body->num_tx_confs <= 0, "corrupted message");
 	for (i = 0; i < body->num_tx_confs; i++)
 		wfx_tx_confirm_cb(wdev, &body->tx_conf_payload[i]);
-- 
2.47.3


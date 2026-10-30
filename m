Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399848;
	b=Z4B4t80KtS26XPubnNaKxrinzhE5iVeVZ/uQ9hVHXdZ9YSwE0C0RQneI5DCvW2kmyj7p
	 f4hGH4pFwlC1QGxVSVRFwtlf5qE4/HXoKAKrnERGAzAN/2M6cZkTdRsuXWNxRnkT4QXJ7
	 Dwu0CAyl32MPfTr/vaJJY+8a+khpJy9KrlSL5gN7I5AEHABoqIbbUTCrUYP8/4/TLfNBu
	 QAFTewzBBGCi7o7Nw9tysTY3PQ4ZIMDTYgAtRAC8I4yFMtwLMVAhhJth1uknfBtVTgPGs
	 m+UC2GtitQL0NGXHoj3WcnXHeZehHqqNvdhGqHfDJwRO3rPmcv2bvTFM9aXim5Gf0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
	b=aRmwZQUrflQP6xZDgzY4ymIdENMaOAjzk9tTH/SIObg77A6ttvpFQdsTEbkEg5xaNLoU
	 IkboJkvr2ZhVBQtTGYvXmU32Ma4g4goqaPIiBZH1UlQavIasQuk8XsANAzTZ0CyE43CgH
	 e/T5loXcoBD2Xu2/rDgqbC0JbjF1a2dIeK3pPROtrE9d1D2XLypd/IUE6CaHhZ7NWTnlW
	 VCKAmBChQZnLCjL+5e/xd/Z5B+ZZOeaInOeo9GKE6sYKmHYKPPVFJzv5+7aLzex+ggo/s
	 3Iq1CcoKKq32bnRECKIrF4z9SnyAj9fbt6mnedaqapJuPeIdrAMMOrGoOgN+50Ghi3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2I9t4hp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510B60A3801
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5510B60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2I9t4hp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9382165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399847; x=1794004647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
        b=M2I9t4hplWMbO8tPuee3YyWYgEo3wyjcr0/4BG4YKzu3NCWdVKYAMmKMUvw6UbDvx8
         BcX4QsuLLNI3QShg+6TAx6QfEBf68vsNfxrxlN8naod6hf6myRsr0HkCry0hYrdWCcus
         L64wCfLUnofWYSxXo2tF9h41gd2jGhtnHCcBjBz2pmOic55Yq+F+E3fJFGdlUWdZDvrt
         NdJEUlNXC79r72UKiAgOBXdnjy7b/kw1mYOjqhjZ7J7DbLKb3GW+cm14TLJfWP5er6Km
         7tPZrlHXLlrek2xUExAq6V6GQVUhH0faZ0GJK/JU8xJwzv0Fg0PINfnJnb6sHm94jy1q
         eZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399847; x=1794004647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smxd6atDvW+XcNIEKcY809Fe9dqPoq4HuHxsaG6+qd0=;
        b=rcR1eZjMhJG9q8h2dM7fwIHWMdL54GU7zAmDZ/A0IAJoz5qYwvy4xHGKF82nAc+nbg
         iYR9F+zXasaoMgs4HOx6fEKVylTSpq0qkPSswJW+KP4pLAsuROo5gpk7R4Pv8wixGS6p
         j95chlE6OmxGr453UuW4xfAW7QGT0gFZFk9GK9OvnhdJXXLUJ2kcEHfV3mMY2gr/IS9h
         Ekm3iyioeE6E8dTGAuo4Djzw5mFGXvAxSUGCo3mcmEBwt2DOOD+GsP9r5YNS2e8EOdN5
         CF3BvS3rrI5Y/r5MJCmb7kuvp+/JMzPD8BvgRvuFLfZGFea/NI4WC7YSONYWNJJkd728
         n8aA==
X-Forwarded-Encrypted: i=1; AKwUvBy0zGhRV44tUrsE685GAk9wDIOP0P7PGtH0wXROyieuAAQv6V9C8n4+jZ3XwhC9uBAjYKDOQxgyzoMW7+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrnjiqeZPpCUb+FF5mTEq/nbLC3CHRAZS041qaK3pikEhulolA
	OqPkaF+XCAKURnnly0lli416mkvWMpOUxaQmcZ6ADyAJqp+Xx6Iq958b
X-Gm-Gg: AYBFou2Di8N43juSWzsbLgx0l3X2AKVH9Tp6V0Miv1R2R8ZMwxToPATVnhttAcCNzn5
	xxHr6BtoHq1iRAX3a+KWUq137oiVL10IF7AliHVCiA/mTBia7JGUxA35HXJ5GHODaCmE06Czq95
	S4RL6XjJeAuNEV+5lq1udRguPVFmSGun8VGjs+C8KeU8Z8cejAdvSRaREz/Kl3uNn88Rt1rgliO
	Kitvaq/VR2xMyAlkd5f2ijdKq8KRYrJzaD7gWV+4VK/OJkdcqiK5AgN+gGbj1DSF+Y3Z/94DnAA
	os5UU9PqZKltr/SCslhiMX9pJo/ottqIKAsjd02nXchCkTivh9H+KqMLYk+cWCJhYDDVaa3aRH8
	quQIeUBI96ireakO1e8jovPzqKIV+YwEX9tPWPpKpVMHUYAOmVWu5a9K9IMylCZKBTjIZd+2gBt
	ighz3smUwUFmEOErjBAaCtJAyG2lBuG3XEBwWdcCdjs6mKVQHyvHR6ueDpqMlZrDDPTTb5dc/4N
	VDwQ31xe2ZUehUnCogiBQsIDd1FintfFyY/3nMIROIBz8WudfX0mXDwUI+QMHLZmwcX1BAp4AH9
	I4fbFWyIZtWHZXC8qNEr2DFFvDENBvkFdN1/rZRBoxp156cfQFM=
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ac17191009mr83697245e9.11.1793399846753;
        Fri, 30 Oct 2026 15:37:26 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:26 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 14/15] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Sat, 31 Oct 2026 00:36:36 +0200
Message-ID: <20261030223637.86907-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

A sysfs store must return the number of bytes it consumed. kernfs
hands that value straight to write(2). i2c_reset_store() returns
whatever ft260_i2c_reset() returns, which is the length of the
feature report it sent, 2, not 0. The "return count" below it never
runs, so every write to i2c_reset returns 2 whatever its size.

A write of two bytes is right by coincidence, because the report is
two bytes long. A caller that leaves out the newline, as C and Python
code usually does, writes one byte and gets 2 back, which is more
than it asked for:

  echo -n 1 > i2c_reset   1 byte, write() returns 2, bash ignores it
  printf 1  > i2c_reset   1 byte, dash reports an I/O error
  echo 1    > i2c_reset   2 bytes, correct by coincidence

Return 0 from ft260_i2c_reset() on success. The value is discarded by
its other callers, ft260_hid_output_report_check_status(),
ft260_i2c_probe() and ft260_i2c_abort(), whose own four callers
discard it as well.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f7d01d9e07f7..cd1117c170e1 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -551,7 +551,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	}
 
 	ft260_dbg("done\n");
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
-- 
2.43.0


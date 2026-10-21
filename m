Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611022;
	b=f4ywms9C5mV4dnlwJvNe5Eh4QooA0ZUZkSRxyyCMEgNKQliI2UigOvIj8GMcC7IewM66
	 nCj1h/lAQnw7bzfE6h9BEV5gbEh5SGiw/+xsaiCyHSyDIl/CzDRbaFlV0x9R0HP2UI0b4
	 RodjaD5+qvLQLpyjmJFzRBarccONz/47XtBwwYc+wPiD5NFdcO52EG19Omd90TYHtcPYR
	 dG6KVz0Egd3MUO21w3PbG01ahZY6s8r4iDxzPSptQYeK8qDm3LvDBjHtz52QJiQj5BSKP
	 NUXxbOqo8r/sK3F59q5DOd8qaFmXK/tmnrdkJ8XWcHExss1TnLDdNFshlpIIiYcRXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FVem4HDPdj0ylTWviCW9/5t/RL/Ax9AlEndJECBbr54=;
	b=WAxFgd2611YQUps4S4rZhW9etTBDPoLAuI1NpMAhnN/yDrOdH+g6HALfOkvAaVFs1sBu
	 mMKAXptsrFUgk3ZT1/KvLzn+mEkLQATH4jSaUQmRwhbm4TUlB3hFQ7WNDGIDS962m84se
	 G2xJOQobXCtIyTRJINaxR3JG1w1glvEdx4LqZ7ZtVFckJ20Eu22/5p/F20oQ88yzKeYAN
	 nW5qD7K/+qeQZRQtaXKBb9mHu9sAkQQ/EtacvEavf4CJ+SL1+zB5K90VNAOXemPwIdOcN
	 PdY+/16q2/Cl2oAK5dIyjgTlF/t+GmStfmTjyP66yryW8QTnFJou7igYSZFH+bE81YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ebe0LduK;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B45606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B45606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ebe0LduK
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso667445137.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792611020; x=1793215820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVem4HDPdj0ylTWviCW9/5t/RL/Ax9AlEndJECBbr54=;
        b=ebe0LduKx5Zxrv4TLRZSOx7scv/d1CtMFA5nivOaBt7J8XXZcGqpOzT/z7Ix+bMIiR
         aHfYde+pkHxPrPXk3eV5LM1fzf3w8XcfRME5DkrFbB6Q1NeooM5TBdAB0GQNFv5cacoe
         jTT7PIxjsYi7Ox++xCQpoaX8z8M30QvVxkIje8yPwBnxdFl7gLkfUgUNSc578ceEtgUs
         17mfRuf0sz5o5q+kbZl9eidhP4HKLZFtEHLU8yb+3Y378mbxUE4PoZ/K40jj4PP8i9gh
         STxKDvHh/DZMZ005TX0g+wiTGX+MuL2K3XMC8UFwcTsUDqrLM9R26ar+IFHB5t9NNh0H
         RCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792611020; x=1793215820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVem4HDPdj0ylTWviCW9/5t/RL/Ax9AlEndJECBbr54=;
        b=e1yR86qiq5IPMPtdSXr+w8mcqcUtXaKs1Fpl9M9OEKHuMkcxip3KqO0Xf6TTxpoUb9
         b5JIUf4k9QXDFPyl0Y1oGBTOGTL0EABj3fv3XDGy3fEUHBLIoD8OoYnLWL3ZIRsuGJWA
         Pwn54/TI6NOk/LoD1ql6rSSO2uMV68RuHU7RAPBOy5VUwokvBiKMET9Y/TDgT1xj7bi4
         jw20N275hyJOg6uBoKz3tvFhG1V9OtFUUGmvSlPXylI/e0iIUoHljUMF8fNjfa6ivKei
         OZywEhbLZCalVb5sl7LhDYzhBmBwKV71OHFSZMsne2BKDIz9sRyO34XnP9oUWh6iiHbw
         8K2A==
X-Forwarded-Encrypted: i=1; AKwUvByUg6gDuCC82wsVCJKh472CPrHKTTecfHgloqTtS/S32ifb6nHISsagyN+TT01Ql1xcIbCgg4XTmoptALw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ0ZPaTAu2oEEHz/IHYBDesFEoB5mVjpmK8vYUyT6HMRW39WgR
	TdrAIX3KQM2yPUL3dMUIiYzytsfoDd3ti9/kACXaof2OM+5tt+h+yKe6c17b9TuC
X-Gm-Gg: AYBFou3GHroLp+4Y7uFFK1Kmp4kqIinO3UdEANUnUCNDVvncXx2Hkc6qMAf/iDBUAxA
	+39g1e4aMdTLQCq8KFeESVLpm6gY85t5eyqH7AxgqMTFusy2Yx2oTq+MSZfLhf5LoFok3NbPIWf
	a+NFmZSKrWYjMb7CkHOUWX1nE3fpwbGeScytsPckbQcrXHB/twlt+uQWDLFI6Ja118LM/3djSXQ
	ERr6IeLUDFwUt3RWWZuE78qJHjG793tudITZU2wuDIPt2VNmGvgpxhiLfANqoP/ouo9T1iCJ9qL
	oBi+E7xFC5kUjoctvcPalI3U7QgRvrX07FEKn6toKP1YRC/fLx7s6aQE05LqmU+FP2AVSuESrjn
	aWP/XczJKNdpaAbOEEb+vjUD/7ypex5tNf/uc/YnSHuRXUI7MNP9x9fnG7vyAN4oOTST/zXdbJj
	4wYwKiHMV6Etqh0iuKwaxVwaJoOYCDairclBalW030pw/w5eN7KrCnoSU7vfbEwFi/NSDZPjuSA
	rDWtfZZD64PFcCgghm3qp5zhOCEUXriqWXFS3j1TRWOyFAzBnAz4LvebHZ6WOJmjMHD6IGacs3R
	tFiXZpNk9EM7s7z6NMpEYVOqzmmD9zsOFjxUWFDARZFa31hgy+R8AHC6BB54vlunSjujRM7IVlx
	4qZbK9OZKfd+FcPX7ANsWSIq4Tcsy9xioLDkzHwYSJ85riNuV9zTyrDRVVOs=
X-Received: by 2002:a05:6102:f81:b0:7cc:80ba:5e5c with SMTP id ada2fe7eead31-7cc926283abmr1384658137.6.1792611020525;
        Wed, 21 Oct 2026 12:30:20 -0700 (PDT)
Received: from bruno.localdomain ([168.194.106.37])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d11db523sm4136093241.11.2026.10.21.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:30:20 -0700 (PDT)
From: Edson Bruno <cloudflare.ddos21@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eballetbo@kernel.org,
	sebastian.reichel@collabora.com,
	Edson Bruno <cloudflare.ddos21@gmail.com>
Subject: [PATCH] Input: exc3000 - zero-initialize vendor response buffers
Date: Wed, 21 Oct 2026 16:28:02 -0300
Message-ID: <20261021192803.776-1-cloudflare.ddos21@gmail.com>
X-Mailer: git-send-email 2.53.0
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

exc3000_vendor_data_request() copies up to EXC3000_LEN_FRAME - 1 bytes
of device-supplied data into the caller's buffer and returns the length
reported by the device. The callers (the fw_version, model and type
sysfs attributes, and probe) pass uninitialized stack buffers and do
not check that length.

If the device returns a short reply, fw_version_show() tests and prints
response[2] and response[3] uninitialized. If the reply is not NUL
terminated, the "%s" conversions read past the copied data into
uninitialized stack, which is then exposed via the world-readable
sysfs attributes.

Zero-initialize the buffers. At most EXC3000_LEN_FRAME - 1 bytes are
ever copied, so the last byte stays zero and the strings are always
terminated.

The problem was found while reviewing the driver with an LLM assistant,
which also helped draft this changelog.

Fixes: d862a3068ea5 ("Input: exc3000 - add support to query model and fw_version")
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Edson Bruno <cloudflare.ddos21@gmail.com>
---
 drivers/input/touchscreen/exc3000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 037bb35238a3..40d74f6deeb8 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -262,7 +262,7 @@ static ssize_t fw_version_show(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct exc3000_data *data = i2c_get_clientdata(client);
-	u8 response[EXC3000_LEN_FRAME];
+	u8 response[EXC3000_LEN_FRAME] = {};
 	int ret;
 
 	/* query bootloader info */
@@ -292,7 +292,7 @@ static ssize_t model_show(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct exc3000_data *data = i2c_get_clientdata(client);
-	u8 response[EXC3000_LEN_FRAME];
+	u8 response[EXC3000_LEN_FRAME] = {};
 	int ret;
 
 	ret = exc3000_vendor_data_request(data, (u8[]){'E'}, 1, response, 1);
@@ -308,7 +308,7 @@ static ssize_t type_show(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct exc3000_data *data = i2c_get_clientdata(client);
-	u8 response[EXC3000_LEN_FRAME];
+	u8 response[EXC3000_LEN_FRAME] = {};
 	int ret;
 
 	ret = exc3000_vendor_data_request(data, (u8[]){'F'}, 1, response, 1);
@@ -410,7 +410,7 @@ static int exc3000_probe(struct i2c_client *client)
 	 * or two touch events anyways).
 	 */
 	for (retry = 0; retry < 3; retry++) {
-		u8 response[EXC3000_LEN_FRAME];
+		u8 response[EXC3000_LEN_FRAME] = {};
 
 		error = exc3000_vendor_data_request(data, (u8[]){'E'}, 1,
 						    response, 1);
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814815;
	b=NBwuRnEkJddFB4/mol4WIzHhzVtsGCgem1F1BIXT7FHvpko0KMZZuY+XfwV5b0/CU4d8
	 +JgYMdr/jNLnf/MHJ/rydXQWrR+Rm+TUKUQ3qmZWHRudAw477q0A0RtN9LuI0FSZjjOaZ
	 1Bjfy1gJcU6ymVsYJz3AGOP+O9xqzwYmlYesslnyIKhOqbbF+W6Ry7/WwNdWU6XEVMmrM
	 DjxNggj9SNUwBraEnZwygp6UOl839J5C/xvTFY5qdib8FffWrnbcy7W2iEOFsEZV8nhmr
	 6MU8FQhwZoQ0xO9YST2JS3xivoFFjIhp217pvGOJyUZ6vgu5exYJ/qGc4g7H2VWj2Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
	b=gY3VKX0ERDVw2qXv/jgBRPTc1viQY4OozbRi3WFB3bqS0j6nQ4vpjy7DjPwsKU3owaWD
	 ggFRow8cOoN2FWs/L4pai6efWlyw6tko4juR6dHP+Z7xTUvEFKi2ndMJM7k1SJO4eQiXY
	 qSFRkarfij68q3tKrgY2mNLr6LmMgJvw9nkizkK8FtTAtw1xjtODIPJAxtpBKl/yWLBlK
	 Pbu3wsFpRP3QJ1nobXTdDBCTeD/qj4d2afrosWGgE5s/lp8lTJmUms6tHlFAyNdaBtvJ9
	 AVAZUSFAbx8CoPW/xL2teyn5ijLl+vPISONMcjflLZH13Ho5mJtYQthovbOpVqKGj+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5WDcqG4;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0969606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0969606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5WDcqG4
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1777638f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794814813; x=1795419613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
        b=U5WDcqG4TmsNfr3IbzcNFeq2gadvFE+xr8kas6k9lfnVOjRzHQc7swGbyXZnpUxnfE
         3GV9LnvKz8QhDM2o5XqVpxFod5uw/gvQAxJ9pGXoiscbaFwdiqNa1CSjeHAfQslteucn
         CdhG2ysUIgb3vGTjDK4KHBnMpKnrLI88UN8YB2FXKvybKpldG84dzu4N/0vK3bTMxjGN
         proA5JLJY/KKxBaBxrlPZRvH+4XS26yFZA3jF5DDUvhn9TCMqSQMjnvuy6Uiwk6hHR5Y
         +aCnVai3XKHVfG+OxwM2xC616tHFZ04fcFTVHKEpxzFjAzRpy6CTeCsEA7uCDxZT9Ujk
         gc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814813; x=1795419613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
        b=jSUPSZQSZ7bZtPzdxlMxxcgd51Wiyj5SEMnUiGOFn3LKq0k9nb98jyfLZw5UT5/qJ3
         L833y/ejjo1Zez62A2LTp1HQOx1FY0mDO/VcpFDQEg6PSg1jAYJqhnfr8iSF0ExR441u
         S2/46RdVdcnZ5/uO39hByGe/HckfGVkhXKLEG5X6NKfk42rMO/nzhKHnM5izdFDlMdQ/
         7FR6k5STZyFUmcfkjs0CptdrH5WLSCFSKl4pvlj47FgGcrtIFU1ezLFvQjdKLacAPpKj
         RdaWBO49wsGnl5jwX3XfEO9jN7gJtZzg9NLcDClrQhmRSfW0TNq2V6kJAJCHOLPSIbUH
         aW6Q==
X-Forwarded-Encrypted: i=1; AL+hErEDly73NeEyiWOTxrAw0xmqcZNjpBeYM6+qUoBUo3YgMkwK4/wmzsf0nVd7R5lgIr3MyXbX6hzembc76Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ET3jFdLi5a+/jZ9sDXz66Tq0p0sJSjm/NphHEUbdPCamWWoYN
	DIyjWkO0KqsBmy0fU0SXhK++JTjt57rNCOvjFexq15MdnedafpxiHfD0H+AHRPqCKoM=
X-Gm-Gg: AYBFou19Y+Jzli1jqM9Oyjq/aNBfQ+CQ9mACw3Sp8og93n54e9OO92D+PxsbuD9WbuP
	LWlzvAOJr9VHwL29ix4k+V9xn3AaYjJgPZI1rJ2LToKSvKNb7S+JNzeS696GpyTKVyfl382ud60
	P5YhXtiBJkWiQjJiAAD6lMctbfVI1yKURMwNZmig/CctdgCO5FyWzxjiTBYfPxMwM7rkqHWkY+5
	wwUZcthyzNK+5Hno9Wq0svUgsUn3l3qX1eM0fFL+77qti4xWrURXp7AmWJV+e/xTAvv36BB64v4
	fqgobK0nV3lccz75lwcp+Kjhy11ugRtkE1FTZ1Tr5ei/DrbSrXHPK13qJqE06NZLtwxwOsEY8VK
	7wz8VIuNMOl64fBHU6rBU6CcygxFS9cOznKDZhHi4esuQf8eRcMz0oMyNBJqPrzEFXsoh0fUJXj
	qXJYO4QeVr/qtQ1KsrPxVbKqMzRMGU35APOxAT/meNuPwboWa0nNOcdQ9EnexPMvIChK43j1/x+
	+CL8c+qhu1e4drNepS1GMXiarPWGy5482hBzg3mz+vQ36KGwDJkuv4OxGOIz0mOrIWeGFYRuTla
	RXKVfkFv6inSfWLpjsV6cRynABYwOFpTtKumRKkkYuvnQPDofdF5
X-Received: by 2002:a05:6000:41d7:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49c70824309mr21417195f8f.20.1794814812963;
        Sun, 15 Nov 2026 23:40:12 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm20106374f8f.39.2026.11.15.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:12 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Vinod Koul <vkoul@kernel.org>,
	Vincent Shih <vincent.sunplus@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] phy: sunplus: don't read the disc_vol cell after nvmem_cell_get() fails
Date: Mon, 16 Nov 2026 09:40:05 +0200
Message-ID: <20261116074006.20357-1-ag@ffroot.co.za>
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

update_disc_vol() returns early only when nvmem_cell_get() gives
-EPROBE_DEFER. On any other error, such as -ENOENT for a device tree
without a disc_vol cell, it passes the error pointer to
nvmem_cell_read() and nvmem_cell_put(), which dereference it.

Use the default disconnect-voltage level on these errors, as the function
already does when the read fails. nvmem_cell_get() never returns NULL,
so IS_ERR() is enough.

Tested on a Tibbo LTPP3G2 board.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 0ad4c7160d17..52d80a06abdc 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -84,14 +84,15 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	u32 val, set;
 
 	cell = nvmem_cell_get(usbphy->dev, disc_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		if (PTR_ERR(cell) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
+		otp_v = ERR_CAST(cell);
+	} else {
+		otp_v = nvmem_cell_read(cell, &otp_l);
+		nvmem_cell_put(cell);
 	}
 
-	otp_v = nvmem_cell_read(cell, &otp_l);
-	nvmem_cell_put(cell);
-
 	if (!IS_ERR(otp_v)) {
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;

base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.53.0


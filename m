Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697718;
	b=jYNL1dmsZhoCxJmDsl4+TtCOiG88ygPvOIG20fhT3Ri4qMd4nfVAoSj8Zh7NgGuI+VKt
	 st3xRSBQFIsypArEBq6BIHE+MWH4KCLJSv2917+kGfoNnQY/G+U4FLJsEMgiHbDnxYfmg
	 G2jOuaehkY+GtiHyST6hwSwmWjTYObgO2NrMPvjBNl/g7LiWE45yd6WoQIGjeGPNd44aB
	 KNiCWA18FvMDi4cj4Fp7I6VPXXXTrxlBVvZaZWgYfXR8nUfagUkbQ/XWKhwsV7UVmRzh2
	 usUkWAJSxi0hxI4qzhLbAJ/nhrAZlHYr6YNndlBlC3/q450HyrNIemOpHVp7PknQVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OSqdRG+Xct5NqgpqBzobcU3MbGZQEh89MxMNsDRUZg8=;
	b=wGMskjeeWlsSfOQUeh8e5+eBsSGrDA54AMLQWnthLIigo8MH6PgvKv1a3/9gVOJaYXSh
	 lYjON73PZ90/h7Gjxw4ZimM/IroGgrd3RaaLwyGxF0l7/BgPjOT55+q29ue17Uj9VJ7P5
	 UvC1inQvkHYrqFBkfKxVuTiuVWauImwnhzwLAF+185bY9wbCZXwSbXnLTW7GsuSjNLEqN
	 yRoSAyAM+V0ov2lOw8ItPFcKvEBy9PNJMEQ1IpGJ11UrmynuVxrHQJk4FzGS7AxL4SNTu
	 8xO02Bovz0Sk6+Or66fY2Y3cHDC1+BahKYYfaqhWfb0Wy6ns0wPhd+JjVsFFLOQZ2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvU31w+9;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEB60A2626
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACEB60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvU31w+9
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so1471849f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697716; x=1795302516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSqdRG+Xct5NqgpqBzobcU3MbGZQEh89MxMNsDRUZg8=;
        b=KvU31w+94nb1cErfYmbg1u4f99C7TlkBLz0aJN4/pQnN4ydmCM0hbfUvGIEsSnv97C
         mavbbWgp5H4XpxoEk2ZPPS1a/Oqsga2vScdlpGbPrM7l0WE7KLQAA+IMKEFgw1qq06hR
         tsSqZCPo6czlwGudGlHQUV09pfSVujYATrFEugdgAViqQ8gJYbDHM6CxvoXVLV0qGLiy
         CXSRa0d5mn0s8pHZhLYNFAt/chWeTbWWhc1UNVOn7QW1z8RiXt78FZ7Bw2yCYmhUjm+I
         ayBJ4hnVGJbcYFLVJvrD61xaTA599XAA195iASuvR/KlYCbXmMBGR8ejUaZtZF+fhMK6
         MKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697716; x=1795302516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSqdRG+Xct5NqgpqBzobcU3MbGZQEh89MxMNsDRUZg8=;
        b=Y7huqUetVtNyrBoYIvVrq8pf62cVLcbBbmNd4BbMJQG33ghvi7R1cF8o6c0cqbTkow
         VwreYOQO0oGfDA3f3pAJCChlEY/WJ1j3hzyvKzfSto53FFfQvVegmgRjD4qNI/DyAxW7
         7+HmCwTOwIO8V2OTDNRbB7AsM3BZnNJ6rRIEyaO3kzNH6gGS7k4NerQKNSqbiLeVGU/t
         hbMOyh2uJ6vHoxos9HE3j4Q0eIoLlmGulCaCaiSEE4DGynul9PNQobZw2bJKMF1OWJlR
         GW+Wl6Ofv1YNkX0mi2IAaU2s4DXwAEpIIAI19ggNXpnF1zvHIOw5NReX4LfMMny7G77j
         rI3Q==
X-Forwarded-Encrypted: i=1; AL+hErH64vvK1IFfA1bwBC+7wMOUFagejC3vBzKL2AVR60JjHIFIlGRQAme3W20GFwtfBitHY/jrxB3utDmcxcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PCULSOMW3w0rTcSfmQdSFnjZsOAVGw/prsAZ++6OHEsKSa6Fy
	8KvEUgjL6kg7cNPY6v2WbbhmeV75l4ppVIzzQV2MuA1YMXWU8JRKVgzg
X-Gm-Gg: AYBFou0OlMgd1fGO4kI9UgwBa9sdO8VSQt/08KbomL5pyqPUjyQe/kfmTLDmnNiIOPf
	fvHVmo3nJFmlH2VpgOJu+qZf3bmKEw3eY5t+JmFKdTYkDM0nfjKkJwTNlanluwmp/2L5w4NupWF
	ovbEvm+/5sbLfRInSGF45VoUJPnQnjlHCJdd1M0Q90w+Xj1QrQTj8Qca+Y9mRgNUecPaZCJXM3D
	MfJIyZ+M9ayHmdh8RRCyqO2Dg7VpMgS3dtfMnuBON+C9roGwTwHWLe99vAAVGG4frhxX7LGoOLD
	HE0qP0uDD1Beo93/TuyJ2P2JOZ/cQEjbiDaG36OMKcqNj/wD/PJO5MDHHg2Ai/i488Pa0jYhPBk
	lYJa9xvC3wk0i4G0npiQcGDpIpOgmXZBaVhetJuTPSuCwal4hzHWzbKEQV5IRtm0dxnXKpH/DCr
	Pr/Y2dB10OaZTwbJx2K7063UCLlKNddvopwfpOgEDtD6MMLhXSQH+QPYYmsMq7uFw5nHzDyvlAj
	fyifsyoru1lsJlb+u8yFDJqu75v+ZrN9nI/8PI3n99z0ZCfN+wq7sqGo7h2QzpplH1oyDXf8mX9
	nTIqMJBQumBpbN1Cs71NvQRwpxVV
X-Received: by 2002:a5d:5f05:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-49c7026072fmr13647580f8f.15.1794697716378;
        Sat, 14 Nov 2026 15:08:36 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:35 -0800 (PST)
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
Subject: [PATCH v3 05/16] HID: ft260: fix sysfs store failure notice for big numbers
Date: Sun, 15 Nov 2026 01:07:49 +0200
Message-ID: <20261114230800.1344401-6-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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

FT260_ATTR_STORE returned the feature-report transfer length from
ft260_hid_feature_report_set() instead of the sysfs write size. For
values like 1000, userspace writes more bytes than the HID report
length, so the VFS retries the remainder and reports "Invalid argument"
even though the attribute was applied correctly:

  $ echo 1000 > .../clock
  bash: line 1: echo: write error: Invalid argument
  $ cat .../clock
  1000

Return count when the feature report succeeds, so the full write is
consumed, and the error when it fails.

Parse a 16-bit attribute, such as clock, into a u16 and convert it with
cpu_to_le16(), because the report field is little endian. Before, the
value was parsed straight into the __le16 field, which is wrong on a
big-endian CPU.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2:
Fixes for the issues reported by Sashiko:
- A failed feature report is not reported as success.
- A 16-bit attribute is converted with cpu_to_le16(), so it is correct
  on a big-endian CPU.

v3:
Subject reworded after the original out-of-tree commit, "Get rid of
sysfs store big numbers failure notice". The v2 subject read as if the
patch hid big values. No i2c: prefix, because FT260_ATTR_STORE serves
all store attributes, not only the I2C ones.
---
 drivers/hid/hid-ft260.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 50389b3e79d8..13dbff661fab 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1484,56 +1484,60 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 	}
 
 #define FT260_SSTAT_ATTR_SHOW(name)					       \
 		FT260_ATTR_SHOW(name, ft260_get_system_status_report,	       \
 				FT260_SYSTEM_SETTINGS, u8, ft260_byte_show)
 
 #define FT260_I2CST_ATTR_SHOW(name)					       \
 		FT260_ATTR_SHOW(name, ft260_get_i2c_status_report,	       \
 				FT260_I2C_STATUS, __le16, ft260_word_show)
 
-#define FT260_ATTR_STORE(name, reptype, id, req, type, ctype, strtou, func)    \
+#define FT260_STORE_NATIVE(v) (v)
+
+#define FT260_ATTR_STORE(name, reptype, id, req, type, strtou, func, conv)     \
 	static ssize_t name##_store(struct device *kdev,		       \
 				    struct device_attribute *attr,	       \
 				    const char *buf, size_t count)	       \
 	{								       \
 		struct reptype rep;					       \
 		struct hid_device *hdev = to_hid_device(kdev);		       \
 		struct ft260_device *dev = hid_get_drvdata(hdev);	       \
 		type name;						       \
 		int ret;						       \
 									       \
-		if (!strtou(buf, 10, (ctype *)&name)) {			       \
-			rep.name = name;				       \
+		if (!strtou(buf, 10, &name)) {				       \
+			rep.name = conv(name);				       \
 			rep.report = id;				       \
 			rep.request = req;				       \
 			mutex_lock(&dev->lock);				       \
 			ret = ft260_hid_feature_report_set(hdev, (u8 *)&rep,   \
 							   sizeof(rep));       \
 			if (ret < 0)					       \
 				hid_err(hdev, "%s: failed!\n", __func__);      \
-			else						       \
+			else {						       \
 				func(hdev, req, name);			       \
+				ret = count;				       \
+			}						       \
 			mutex_unlock(&dev->lock);			       \
 		} else {						       \
 			ret = -EINVAL;					       \
 		}							       \
 		return ret;						       \
 	}
 
 #define FT260_BYTE_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u8, u8, kstrtou8, func)
+				 u8, kstrtou8, func, FT260_STORE_NATIVE)
 
 #define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 __le16, u16, kstrtou16, func)
+				 u16, kstrtou16, func, cpu_to_le16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
 
 FT260_SSTAT_ATTR_SHOW(pwren_status);
 static DEVICE_ATTR_RO(pwren_status);
 
 FT260_SSTAT_ATTR_SHOW(suspend_status);
 static DEVICE_ATTR_RO(suspend_status);
 
-- 
2.43.0


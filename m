Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C534A773
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272122; cv=none; b=Aq6243R7fXaTwksLpIlu4X+pqWRegCLUkQLFGNUH7cE6ul9arT6v2PzYz2sIdF5U7cKUr3AziiTQKFlhfktgwV139OnE8osrDyBrbwYzVqlD2xq7xckce0KLIuSzQ0UJuwB4L+1OO/MiKs90muCNuyiIHK9bWIKDdKgMthjALd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272122; c=relaxed/simple;
	bh=qOU4mOdJZExzY66rPx/p4PHpUpxs+QTxG3UNNWTlklo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0Pxe5TTLalwxXuT5yqxCVbxmv262FxkXdrcRcrZ/7PfZmn0H+l/lPtmh3MJObOY0j+4RDN/hI9ykSUo0+PHlK9IrvNayidR2FjeHUNGK+cibosArzMC3Zog21gBpH5hUqOcvOik+s65loGMawqy4O2xZDaJLCUX1dA48SHnPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL784V58; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL784V58"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so22450b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272120; x=1789876920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUaIWeESj5beJuigMXgXrhS+tGPcUhdzld8fSkS1OKQ=;
        b=KL784V58wIuDnuXqenQLvuL5orC7rXdZDhrkOMhD3a5ZjhJ4B+UoScneZ0tdsuefrw
         Pf/ar54hPmTOfNbuxXCw+6F0imtvjjsgyPTbfftAnotrva2gj6wRZDU1n8og1pm4U5hB
         Hjsf6xVhcGaHbN2lf+QTFGr5CXfh5O8CZWzE75Ku3LZ7j/TTdliwIV2rS+P9bjiAmKog
         kmIz6jg1S4qQAxppQ3yjfnLBbtjlj6Pu+EwjMlQZgk0ucAdEVrNf9sXPqLekn1/cmKgj
         L2+Xf39HUUewqb4ZXTqRsIvWOBZdyjQ6Yx1lacE/pgfkIjeVmtcKqYvf3hXp+mTfAZvE
         EGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272120; x=1789876920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUaIWeESj5beJuigMXgXrhS+tGPcUhdzld8fSkS1OKQ=;
        b=ozcIv6PoM3LqIO+RpVV6YqP+7dKT9/mjwW52wx2k77YMELvex4i+YHSYTVzO9WMgRC
         NrLC9e94pLTv2c3igx3sfJvLwaM/1webemmDZ3orMuKc3azA94E/1kqhNrcmqKPZRd6s
         A/vs4wfa2oUgLkRHdQEHvAe9QNtQveW4bfeFi3PS0bAYWMeGh26wOQMs4Pu2kljiroXL
         PDDWCf9wNJLGOn/Vu8/C7pI65h3Ni5oqUGk/VQ3bi8KFQCHorcBUMbb7m6/C/LNplqTp
         SVx2w5SGCMvm1UhJsE7T7QZpjJL6W2nfCbLmuul/qEg91mxBlLumuIKWv4AXI8mIZltm
         p83g==
X-Forwarded-Encrypted: i=1; AKwUvBw10j0w+y8IXYea6z/rV6NDVn3ZtJ5peo74LMS3hf+AQwLlfgKSiZL2KLdD72N/wn3qoStADgFTLZ81RxY=@vger.kernel.org
X-Gm-Message-State: AFuF++nEl1IwiQ/LI0P9ypCQhnbSElojFj0FC/tI/ryYvbw2cuwoXz7/
	/FNKcEGjiXVYLWChfU93sc+tlycJywUwVulaS5FLjwsu/MCHXs53/3T/
X-Gm-Gg: AYBFou3MQfjL0NsgqeXp0O8gwelj9O/Q5J8oZBfqwPxoL5ivt1UnGupi7l1a+lFqyoG
	60IhQvWbf0zNvKNHNxmdRtYVqTaFTAJNi2Jp7LtOcIxKn+BqezjiCdexGB/9oUy4kNsGxr/YhDI
	2P0lNxayjdg1as+49tAKuIyxP9mZ6vi3CSiAXu6x2PAd4SFysKVRF4f8shrGlu2rwVpc2PfHZrI
	IMqDRJyGbTv1RtErd12eYKExte00UytiuAF4WKN3N22O3IRfqDy/H2Qxxo8QI7Z6LuVmbxx8yo6
	QpSgSaRcpVVbROcu6OX1Wi036hj2wVgtG4mDuNAjyQ7nC07VVqrjxm6iF7/tNjc5YDBN0dSEKYg
	ld9/SPV4O7Fjca6OJOuPJ8Z2YMUe/kvjrUcunt2FP8bNVdl6aJFyIvxJ5W18Xbf+baMIm6CsO9U
	d0aC0+bK767pVs9+TUGTZjLmO2uu8mM2R28GD51RSOv9ETNqs83TKkZEYc7SSYzOLjSljnXvT5A
	Wu3ejuhdbpOzh77Vxw6OmbEwJq4VlOYnBaViZovfO7gtxEvFaKdBZf9AOioKNJnBjwdsmJ5Y+Ur
	tosIqJbNf3GT8QDw3GNJwQvTHgbUeLO72R6ZzADWaMuxVfYBlQ==
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr8738679b3a.20.1789272119714;
        Sat, 12 Sep 2026 21:01:59 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-60-64.hsd1.wa.comcast.net. [67.170.60.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c659b9a3sm2957890a12.29.2026.09.12.21.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:01:59 -0700 (PDT)
From: Gabriel Changamire <gaberashawn@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Changamire <gaberashawn@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: clean up sm750_hw_imageblit() kernel-doc comment
Date: Sun, 13 Sep 2026 04:01:39 +0000
Message-ID: <20260913040140.4517-1-gaberashawn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @start_bit description contains a stray ">-----" artifact -- a
literal copy of an editor tab marker -- that leaves the continuation
line "0 to 7" garbled. The @fg_color and @bg_color descriptions are
also missing their closing parentheses.

Replace the artifact with a plain indented continuation line and close
the parentheses. Comment change only; no functional change.

Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 6db54c6526dc..a0fda56d955e 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -223,7 +223,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @accel: Acceleration device data
  * @src_buf: pointer to start of source buffer in system memory
  * @start_bit: Mono data can start at any bit in a byte, this value should be
- *>-----      0 to 7
+ *             0 to 7
  * @dest_base: Address of destination: offset in frame buffer
  * @dest_pitch: Pitch value of destination surface in BYTE
  * @byte_per_pixel: Color depth of destination surface
@@ -231,8 +231,8 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fg_color: Foreground color (corresponding to a 1 in the monochrome data
- * @bg_color: Background color (corresponding to a 0 in the monochrome data
+ * @fg_color: Foreground color (corresponding to a 1 in the monochrome data)
+ * @bg_color: Background color (corresponding to a 0 in the monochrome data)
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
-- 
2.47.3


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611151DAFC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793104; cv=none; b=Xw12I0euFMhqHnHqrd57aZopKslRGR4sUSkY75ajByrl7RQFUhtJfQdEhVEFTEcYFRPQo1MGikgTltwnzkhLO0xG3FlvZiQcRsOJJxIOQ8FdjuV346zUXUj5dnrsftXVgMV/mYD7a2FVKEB7CcHjwN6QRhthsAFClmF/mOYB4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793104; c=relaxed/simple;
	bh=Y1AbxReCbFLTK+kcmEyfal/AtpsMKf257UxzgRjpa0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwyE4ISnwPAsEuHxzHXnDr4pMerlv1GFqISwQt4FdxPi6rmGXXBcKiqPe8eVvWPi/91MqqCsfBbuf4g4dBRXrof+sO8WReN0kZ9lVvpiv5IHjjO/E9I7gBdiwiGFzN/7c/bFS/0PONI2MNG50Cxef/VJaEMNqAsjOoxlgcLMGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6dSmWzL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6dSmWzL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so9693445e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793101; x=1791397901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uonPwqQ8NSF80X5POBxOVp7O/fMWR2NlnkM8fy/9nUQ=;
        b=q6dSmWzLcvGNhJva+d+xfnNv7G8QqqxEudnDRWdTW/xM04Lb03sXJGezoW/Z4V4+4c
         VS+ahrQ26lPcA/oO3OTUdYOSIYNX81lgmseqqTO2baoVuPLsmH7g9cXsW6kRjGI5d6EA
         hE2g5aZkeetKveOh4x+v/CnAk8Jj+lThETUY1Z8BBlCcfiXZo3h9gTgWBfTsy1XNDeKz
         ipt1KOnb6dHXQps7Z8+DEP2mdZQ3/y+HTTTEQ2j4kTMvEgfJ42E2+ClXILLDq+AvWk4z
         MBEaeTDH98xt5N4w44vz49GWmfWC0OKUBBq98kK8IHj7JVRG64nMaqLca3lMPdtfBBa8
         /uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793101; x=1791397901;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uonPwqQ8NSF80X5POBxOVp7O/fMWR2NlnkM8fy/9nUQ=;
        b=hbaCsg/oJZEb648lYYMNSf2CbVI4MCcT81rXvTYJUK0ztDfOL+VPLdkAuNA+GLlRPM
         QOsuJ6F3XQ173jr26vIJ0YK8p8aPXtGmbvPqWgNhkMYxu9QP660/mLybMMu/S/nmMIWp
         t+vcUHWo5CrmL6IGKqe5wgZVoXhFUmmnNaSYCAvZkrHsuuhARV3t7E5K/VHJ5dvGXH6F
         de0ecgvKxOPCjvEUBrTMA3TfApaXv06RakpadugOVb6IyuCzJBtg6zuCatNHwmQ0yN1C
         DV5wg2kAut2VaNVWOe8ZptRfiGmRD5XgO+cFXzMYlXdeVJihZ0NlNFGn5UEmH0MDo2Ib
         LESw==
X-Forwarded-Encrypted: i=1; AKwUvBx3Lp5exy4sqMBYBBq+xELdEpLsazDe+CeykmGeEGOkig6hm5JrA4KXV9E4x+8Cny/VQcEit7YQg1DJxGI=@vger.kernel.org
X-Gm-Message-State: AFuF++ljkAa3yI3MQO1B/Na6Bq4t5WshR8aGArtRvj2C6aEQsAKarUue
	BU93dmLOzAAOZ6x/kAaUAwpoctFqm5qmcKR1V43sngSaEm8pnJ2lPudc
X-Gm-Gg: AYBFou1VhIM1RLi3OWi31zmgEDhR2Zqva3KKom8d2+bn65wHD7AQtDgGf72rQ6qG8B0
	ca5ZgUw5VtEkWgvLzokbiXAW7VdGB050UDP42dLY5P8xZKztDhVCJQq9/qRrRlmYiRsXPBDTmMN
	oWOnrBE2R9KrYSpbj594b8mJ/sQlRMaS6pVayCeB3+ZbU1osXdycUfjkCQEo15IT0L1OQDmKnT7
	u2YbdO8ft2hzmOOpB0bpFkIUh60qZAfbQTEsAB3w8q7AENhoavYTF0J+moIOBCEYh2xKDd7/Qcj
	jwiSq3h6yR1dCNrRwQf2kzg8azxvYXrxVVl6ZoJ4RTCsj3oQTEw/QPoZbyUSaqtGLWljn12Cou6
	PvGhazR2tc5svwbZYz9LyC4bIGIWDoKmPl/5+nrEYhNGkeFIriVFw+J7SvzXTKlkmhZyfC57wf+
	2ktG01Dasw/oesWn1nLgoi8O/Tm0ZaoUE2eIaGMonCboB3aCnjpYrSC1KXwRL2RsyCigDcMwsQl
	wdUjpoqSmmhNH33AVjzS+aFxF9ZXzMkowW88H+afe0EK4DIJVrk
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr6099075e9.17.1790793100639;
        Wed, 30 Sep 2026 11:31:40 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:40 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
Date: Wed, 30 Sep 2026 23:30:16 +0500
Message-ID: <20260930183018.49629-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
References: <20260930183018.49629-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The escape prescan loop uses 'size' as both its bound and its
accumulator, so each escape character found extends the loop and
reads past the end of src[].

Use the original u16 count as the loop bound. Also include the 2-byte
length prefix in the bounds check, pass the u16 count instead of the
byte count to utf16s_to_utf8s(), and advance the buffer by the bytes
actually consumed instead of the escape-inflated count.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 - Drop a blank line in the declarations (Andy)
 - Mention the buffer advance in the changelog

Changes in v2:
 - Split the bounds and prescan fix out of the conversion rewrite (Ilpo)

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 25 +++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 309634c..74a9086 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -54,8 +54,8 @@ int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_size)
 {
 	u16 *src = (u16 *)*buffer;
+	u16 orig_size;
 	u16 src_size;
-
 	u16 size;
 	int i;
 	int conv_dst_size;
@@ -63,17 +63,20 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	if (*buffer_size < sizeof(u16))
 		return -EINVAL;
 
-	src_size = *(src++);
-	/* size value in u16 chars */
-	size = src_size / sizeof(u16);
+	src_size = *src;
 
-	/* Ensure there is enough space remaining to read and convert
-	 * the string
+	/* Ensure there is enough space remaining for the length prefix
+	 * just read plus the string data it describes.
 	 */
-	if (*buffer_size < src_size)
+	if (*buffer_size < sizeof(u16) + src_size)
 		return -EINVAL;
 
-	for (i = 0; i < size; i++)
+	src++;
+	/* size value in u16 chars */
+	orig_size = src_size / sizeof(u16);
+	size = orig_size;
+
+	for (i = 0; i < orig_size; i++)
 		if (src[i] == '\\' ||
 		    src[i] == '\r' ||
 		    src[i] == '\n' ||
@@ -91,7 +94,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	/*
 	 * convert from UTF-16 unicode to ASCII
 	 */
-	utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
+	utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
 	dst[conv_dst_size] = 0;
 
 	for (i = 0; i < conv_dst_size; i++) {
@@ -117,8 +120,8 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 		src++;
 	}
 
-	*buffer = (u8 *)src;
-	*buffer_size -= size * sizeof(u16);
+	*buffer += sizeof(u16) + src_size;
+	*buffer_size -= sizeof(u16) + src_size;
 
 	return size;
 }
-- 
2.43.0


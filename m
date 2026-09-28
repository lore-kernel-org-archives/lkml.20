Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B9A4F7CC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625819; cv=none; b=ivRsx9Sd+DBp/v1XETEeXeOleu3dNQVlMPuTMO+P2Bl7l6gIWaAWs/MhSJ8oUutyH/eHze2TjyvZssnj49ijyL3jiT9zXvvZgzvVCACDwFzgvisd1ZSf1DdS/YMvZ4nWbR6ZjPg/8sBKTTn/EiEMURHmBTU/FECgnv3+aVm52n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625819; c=relaxed/simple;
	bh=uOML2/178IPZQoTSo0uKM+Js2VxpLOUyptyCozVxu20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+BZkZFnPmIjrHZd/W5LKI/gsxyYXtxmkHNyxY7ypd3cTYzakOLV55QFVaJDqgl/oA0k8wC9yqrzSuFC9ySqVa99a8vk+w7KhEYq1vkWxFhPI9ldUMI3oKYdifZuQNFcrTOuj2NoZR2n0V4gTPkzoy+WmMaxhKVUOAZP9AmK/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC3tbMI1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC3tbMI1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so19216345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625816; x=1791230616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oM9uQbJcIIcV/RJIYRMivOP3aQ1VfTLc1kOlb224HyA=;
        b=jC3tbMI1WmwM/PhMdRB1u9TC0WPWsj47IajNoxmjyuKxblxhY0IIr9eQYEXPUDfBhk
         olABRwl/wOaGDGuk1OJBg/iAb1KRyrULnhpBkFN+QczmAu+Zh68F7fT6Nso/KeBEoynJ
         jsqLw5SZWdrIaB3xwE8h5HXxdHdRrkne9wXB+rp1siSw/Z4+1Qlszf8O2FzPHL1J18cn
         SxjNekrACn5LjqYnhMKa0ukHFlA8UHGN+eJslI/+aZOQeMGfE9MRYxYvWj+TjWwfVmc5
         CiryLEO5echiXg6gR/0pTyT1MAGYtWu/8942ehlTtSfIUdpsATFvCcKmQ2PJiMl09fKn
         jgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625816; x=1791230616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oM9uQbJcIIcV/RJIYRMivOP3aQ1VfTLc1kOlb224HyA=;
        b=nBGyW8z30y78oyjiXk9MlwLSp7YJSuUx7BUlkAupWiqe2IFPzvMo9vugRktutxpnGS
         +OvkogUAWwwARr4buFrKx7C9NA2Q6Q8IXxqkTZ8XoHZ7nwgBug16YtMZCGG+o+wAdjn3
         h+c02TGPzkSaeK6zlKlmt9/Yok1y2wOuopDk5KEbIY168P3239OCA0h6yXkK66jLXPyV
         mf2op9YvWUCEu+GntoGjnopqymwOmcZ4ovqKgA92A2F6xtDZ6vgyBcIckRhXV7b8R0Se
         qj3Nmhh3JG03kmb1Qsjao1CN/DHZcREk+01xdv+fUOLwxTC1bmlMJrZlheTbFW7vnDfX
         +bcA==
X-Forwarded-Encrypted: i=1; AKwUvBzAgPuCwT9BRJFhC1c8zUnR6pIWd8TdiMZmIcn2wF15pRMIRhSBrT+F9fcc/dyeoeKBwbJjr8Msb5XmMAc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8A+IOIOx5JGjjLqYmn3CRJUnjXAIdpEfQ2iUXDbfumx4PNPCu
	AXxCV15CyYrqvA25wYDKLuf4IuDiSxZQS/JVMV72F/iDZoxDW66EnRR8
X-Gm-Gg: AYBFou16LR8/5N5zENNu34xjSo0Pj7jqoZ38fM20LCPg7O0n1CcpBjdv552fDEZDTV+
	jbomdUt2Mw00CsRdVFbUwNiu1Ica0GPPXzpfJbcPg2T8oEuHCdI9h6NJW+WmUyDHI/yauFKBkhq
	0tpz8JnMf4teIqsj9/tKtl61nOc9u5Ojvbj8w6DHLhdVaxZKrPkO25GOyshJiGrZRrYyRhAfGi8
	VuciJtbw8kzqQdZwdmemeHwWiLYPWh/A6gZzcZAnJSbHJznC7e88s7hMHgMtobijimEq+ypy86N
	Eq+MUdq2crH0+7tANlNxfjBlLNaYwc54QxVpT/Wnt0e89FdDAcdx3rEc2qCj1+aMW4XJcf7daUn
	7wsrVZV9+VNsVWQR2tPJ187CtFApKG71Vhadzpt7MfnLaQmS1RcvLJpv7CS1djlxtAtO33jB5jh
	3G0hkWAyzH1YpAFj9JNmyOuw/0JENQYw+IIESx+ZU+tDsVntnYd9tYcPHKTtSmJDgHiD+VngmVz
	cmCJ+BYwOGTGlR5sjSu/sx1zHO211sLrLyDGHwf59HhaCebT0T7
X-Received: by 2002:a05:600c:608e:b0:4a0:8b1:f32 with SMTP id 5b1f17b1804b1-4a008b119d8mr52346175e9.4.1790625815476;
        Mon, 28 Sep 2026 13:03:35 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0730a8sm26506625e9.0.2026.09.28.13.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:03:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: hp-bioscfg: fix non-ASCII truncation in hp_get_string_from_buffer()
Date: Tue, 29 Sep 2026 01:03:17 +0500
Message-ID: <20260928200318.63383-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928200318.63383-1-meatuni001@gmail.com>
References: <20260928200318.63383-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

utf16s_to_utf8s() writes into dst, but the manual loop that follows
re-walks src from the start and overwrites dst with truncating casts
(dst[i] = *src), discarding the UTF-8 output. Any code point above
U+007F produces garbage.

Replace both with a two-stage conversion: utf16s_to_utf8s() into a
scratch buffer, then string_escape_mem(ESCAPE_SPACE | ESCAPE_SPECIAL,
"\\\r\n\t") into dst. Passing the four characters to @only avoids
escaping quotes, leaving them for the existing strreplace() call.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v2:
 - Split from the combined string buffer fix into its own patch, as
   reviewed by Ilpo Järvinen.
 - Drop lib/string_helpers patch: pass "\\\r\n\t" to string_escape_mem()
   with existing flags (ESCAPE_SPACE | ESCAPE_SPECIAL) to escape the four
   characters without modifying quotes, as reviewed by Andy Shevchenko.

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 61 +++++---------------
 1 file changed, 14 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index ab1eff1deca1..fd3d54ee3a94 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/printk.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
 #include "../../firmware_attributes_class.h"
@@ -60,10 +61,10 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	u16 *src = (u16 *)*buffer;
 	u16 src_size;
 
+	char utf8_buf[MAX_BUFF_SIZE];
 	u16 orig_size;
-	u16 size;
-	int i;
-	int conv_dst_size;
+	int utf8_len;
+	int escaped_len;
 
 	if (*buffer_size < sizeof(u16))
 		return -EINVAL;
@@ -79,56 +80,22 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	src++;
 	/* size value in u16 chars */
 	orig_size = src_size / sizeof(u16);
-	size = orig_size;
-
-	for (i = 0; i < orig_size; i++)
-		if (src[i] == '\\' ||
-		    src[i] == '\r' ||
-		    src[i] == '\n' ||
-		    src[i] == '\t')
-			size++;
 
-	/*
-	 * Conversion is limited to destination string max number of
-	 * bytes.
-	 */
-	conv_dst_size = size;
-	if (size >= dst_size)
-		conv_dst_size = dst_size - 1;
+	utf8_len = utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN,
+				   utf8_buf, sizeof(utf8_buf));
 
-	/*
-	 * convert from UTF-16 unicode to ASCII
-	 */
-	utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
-	dst[conv_dst_size] = 0;
-
-	for (i = 0; i < conv_dst_size; i++) {
-		if (*src == '\\' ||
-		    *src == '\r' ||
-		    *src == '\n' ||
-		    *src == '\t') {
-			dst[i++] = '\\';
-			if (i == conv_dst_size)
-				break;
-		}
-
-		if (*src == '\r')
-			dst[i] = 'r';
-		else if (*src == '\n')
-			dst[i] = 'n';
-		else if (*src == '\t')
-			dst[i] = 't';
-		else if (*src == '"')
-			dst[i] = '\'';
-		else
-			dst[i] = *src;
-		src++;
-	}
+	escaped_len = string_escape_mem(utf8_buf, utf8_len, dst, dst_size - 1,
+					ESCAPE_SPACE | ESCAPE_SPECIAL,
+					"\\\r\n\t");
+	if (escaped_len > dst_size - 1)
+		escaped_len = dst_size - 1;
+	dst[escaped_len] = '\0';
+	strreplace(dst, '"', '\'');
 
 	*buffer += sizeof(u16) + src_size;
 	*buffer_size -= sizeof(u16) + src_size;
 
-	return size;
+	return escaped_len;
 }
 
 int hp_get_common_data_from_buffer(u8 **buffer_ptr, u32 *buffer_size,
-- 
2.55.0


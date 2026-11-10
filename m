Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332137;
	b=rMiHLuyr95Ug7HZYtDBp25a2n/bHrzb1gW3uqt24ycMHn2557z1eBAlaZpZSGr9hG97d
	 gOdGAW9DJWsJeHMdjBQXjccNZnsQX/Xsk0jAIxoufvAp1atQeSMSieeHDT5siT9b+2t9f
	 pJKajzxt6+IvJzLt8K7Zf4/eE8J/p0PJn8XrhVsqd0a7+FIVzG7FINAiWG8MOjPSdCXnY
	 jR3+vwtLieW4HgPsRFHOnglYqWmgaqbmr0/5mRWCB4XYYpF6FAcChwhByIVLNyfHEvzf4
	 K3wtQ9zWi6XpZTORZIqYyhiW1XCyqK49d8dc1UPD0bl1NFmPrRNxzVvsfE0NeZD8fMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
	b=RPn3/U2YoN2RnSZUTN6LlfcAxTLGXNzVeHCFDlzUhoBL2Dz6NYufoW60hIE1jIoR5Kfj
	 QjSbPir1vcjS9TS3Gyz8ayUNJ1SVyUd9t9XhBIyu+6TBKUrA9A5TLXYR9ksFkSTaG2HzR
	 H9ZWfVHlm1uX/kgNrFowBt1hFRb5YO68kuwBeClwMLHTSXDsqVyvTpojJaSfhBOeJ9jKn
	 xBuuC9ccjM+eNAVg+iG2MdY1IgKrlNQt67nsyMIuEXrlLZ2eXvMNy3W/72Ckv6WQXSiK4
	 1kkwC29WRcm/MpRxQPi16YJ9K171Xirxpx6HEkt4bAJSEyC8Sr6KfJfuAefbthCvA3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687E60A261E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B687E60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so28624095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332135; x=1794936935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=aUlfYej77ygzmzcD1XknZ8Xa1J++Uv47fItDW84lx4AY49JfBMzyc2G6y75h1qFrGE
         Lv+JKxk4oNbdBT49Mezge9HBuGF5cJZuDRgqN/+rWMjrxaqBL7+1HjgOsMeGjkwR+W5B
         qgW5kVMlj9rUsmV0dTdvR4HS776XaIMmEP08OGplU+iX3fd55MiuYp1bEHZfHU1bl8q5
         EFYJoy20+HdKc1iUv+OJ9aKlQ9XhsQZGoYtclAeg+wsDp6kP387asDvDnw9/0Rro+2dL
         cDsnv2Ho0sh/BOcXxdI57h88hVGN4G2mcXqqSD+PWO14JqORz7V6Ku605f5il31tHiwB
         7ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332135; x=1794936935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=uCkxvGXYY6Mw37ThpAUnAizq+BUW3+2iaNsdsFkHoHlh/JqVK8tBh44RsovGFxgCZ/
         WP5uiKxHHiTIqORU+OzYeSyZNTuuw7YB1nBY7HkL3Vt7UapuaYjb6FJe7aDnOzEPmEVp
         eO/euEJDCOwyJPh78Ngix+YGGz96N3buAyc/hkwOgNJydcuTdt6yrcBb7+62C8AC0e5f
         ZMPzbgMSrBWaHfSq1h7jKxx6sGVXfyxkM5DcQInQxVeTmBvIYPbVaWUbMIFLqsuXPEPo
         M3+MmQHkHeazw3H2agFtn87dNS3E4MIV4l/KxLtl5X98I3ljknrjOPyCt1WOQRQpEtvR
         GgiQ==
X-Forwarded-Encrypted: i=1; AL+hErFCgNLotDL00eC+mYCDMNci7IZhUCYuRrPHf7G4lX9Etf8EOq6FGO8DW6F4P5Jm6cYNDf6E0SbI9yJHi70=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7HVkVzVFuRpaz6qUqAbA0Anhew8heG6Hq1cZjDz0OHD69TVU7
	UBe2HrUYjH4X4MxxfqCN50tVy8JSnTSUfgB+1Gp1t5sFuF0Uzeh8I60v
X-Gm-Gg: AYBFou2dkgZrlzv9cN8/9nw4/BbHKzWFgueX+WsCoHp5aRxulfjWoEvcpeMKYGje8m9
	+vKwvO97eKrr4qIO5gK290fBYjQQxrxpH9ppa0pxmXpsw5xUxCBOyL1N8WrTXOJpwpyMn8KzRwk
	GMIMT1MdxpT5QuSHpiEhAj8aBhMKmL1VT0XYOs6wTWrN7VCCFEqtU3ZPhnltiuBkG5IrTefX4i4
	nI/TH6OL6NPknTW71wCk6RG44hHpqxBxcFOU3EwBdcGaKZW/8ovbBQxncLcocdg2hYpa862e14u
	imrjhX0KT6nz3Iq1OyHktm6nLHSZ3UUDYbGBxupANT+VH+1ax4S8rmNxDTC4OFC5FRKwJkbzhU3
	NNo28LFwi1NtlJ50NQhRMNqrzSs9PLio9LYHX0geBuMZJZ3LuWdUlag90OLgoYxQgPA7zmfQGqz
	gLBZS8vFJeZKbpiXIgkq+ByyZ87N+CcJoQhn5kEJiKUO/GskYYRIbObvzhN1ypaIeuAWowCHTJr
	yGl3Bc6im/g0+Ez2rsFepeO7DfYtiGM9VY/1ekRskoRTmRUT8VeIv3uOokKdgHF4P/U31KaZxBK
	cU8UCOOSBdwpoyYskmokxMCa/Ry872s4bw4VL5yJavV7XneQF80BKcOzG2UuEjXeLXBvqtoZfBR
	c0GZN4FX2amnWrsXIJw==
X-Received: by 2002:a05:600c:1d1a:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba08db09ebmr1603255e9.3.1794332135087;
        Tue, 10 Nov 2026 09:35:35 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:34 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 3/3] kconfig: show continuation at the end of wrapped lines
Date: Tue, 10 Nov 2026 17:35:26 +0000
Message-ID: <20261110173526.1548434-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110173526.1548434-1-julianbraha@gmail.com>
References: <20261110173526.1548434-1-julianbraha@gmail.com>
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

Add a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol name instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 0b3f2d7bc809..a539b617b62f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1167,12 +1167,15 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 		if (sym_str && sym->type != S_UNKNOWN)
 			extra_length += 4 + strlen(sym_str);
 
+		extra_length += strlen(" \\");
 		last_line_length = strlen(last_cr ? last_cr + 1 : gs->s);
 
 		if (last_line_length > gs->indent + prefix_len &&
 		    last_line_length + extra_length > gs->max_width) {
 			gs->s[gs->wrap_pos] = '\0';
-			str_printf(gs, "\n%*s", gs->indent, "");
+			if (gs->s[gs->wrap_pos - 1] != ' ')
+				str_append(gs, " ");
+			str_printf(gs, "\\\n%*s", gs->indent, "");
 			while (prefix_len--)
 				str_append(gs, "!");
 			if (!sym)
-- 
2.56.0


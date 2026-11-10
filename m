Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332134;
	b=tOcD79dVE1cScK3RLfNg3kBV1MMH9ghZRrhUKg/PrsI52uli5lN/LwSxz8NhiQbuTjF+
	 eZEkznc+PYYreilnxRrGeP0ZIKZyqQDxlMwQ+dBlrbgtouQXB4mnHBueoEdWvnY+F3zrE
	 tpV/eyr7Pc3zg5IdnLzhpahkZTjcXkNeL5pWS+DXY7JT8DDemOb7ipSrl7ay5c5o6RHcQ
	 yza1OWGwLNHXZfYaGeOI8CaHpkVKRYlswhx90W8EO+soTkMQQsU14KQn2HUJPg2ugcqtA
	 3fedUvIJsHHd2X2AJA75k0Mij2Y6y2cn5uz6tvfEUn+D9PJlRMdtKUuTGvxI1umEcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
	b=oEo0JtdfaXtT/mqMaUUep7Zk6B/4WwuzxH3sfeKy8UHdWo/OI/rcDLdA665rmWnmx/m0
	 Y/HgW7I3rVv13guHFih+75sbhy6SRIwIL2DRebbHfWyYD2WEsnStozl+fSHfqgU+bEUX+
	 u3O1kKBh0vF5Srf+xWEBTtz07dG8ASFYfJdyOEUIVZcCq0QR8npGLYboSR462OXpr644/
	 Z5dIKa/U9c7phrLJA0LBl0LvMr3ezT4HegeUhGrHB7P2RNENxMYZjPM2By8YIHTiuFGXt
	 WjYMpsN5jDR494mAJ9/mXD1535tGGQAHmAhOZi/AThIkgd7iKJsQ9O/PLS2qUG8OxYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N/ceMGKt";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEA606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADEA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/ceMGKt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1561887f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332132; x=1794936932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=N/ceMGKtm+i6+xJoY9ITibg1IKT9/vxsdjK+ngauxjr0ae1Y7JjZGyDukNRKhbP7ED
         s3VJ80RzGE1YDa5olmFvHx2oHsnzrAcI8w8RkH6qp/gTkFqdylf9LBs44eFvi9HMKydn
         pDs9XnFbwxjFRI9kBCvwmfqSeU4ruP1ZbQOujrQ1wpnxRShtrDJ91RncqrI1CaZUUZax
         zYHzR/1taog5P0miN5xqemiagnB4QfBLKaLFvWiOC6AvrqmROL7wgpoqr0SG5S6eUO/A
         xTaWP1Q+gAoh8YfCXZWFXbrinXxzwsNvd+b7F3+5CXu/s7Yj7Ak3qHawQTY654pzTnHA
         qlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332132; x=1794936932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=p/Psm71We805crZCx4mtKCxF0/SbIgNJxJBVYubRQwrpGnZQvN9fupVe/7REbeoAii
         KKJACk096xCOkbqRFzNh1LY8x2Dy+WAlyQsEg5da2cIglT5iYouCikcCsoRAUN9nmbiO
         g9P5APLXbT5njQjceMzVU0P9JQJR1cJ3WsZM9+8rzcZOScT4NTlJHemeMs3WoGZt6L/k
         LgpeArVLy8q3qOP8gByBdOc4gtAwbNZ219CSjShy+QILrnz+nDQOr1HkMgtSGqECtkJh
         I3NJl65XNYYY9nb4Ut2olsySuyh0nVfBXvAXYqCu5uDEkZjDCkscX0Ou11Nhrval98+i
         Y4ww==
X-Forwarded-Encrypted: i=1; AL+hErFEH3dFQEEUCY/2IFlPgqkC5MOdzg/NfmLhMxj9e9TnZP6Ttq8Uj/5oalkCMsKt4fTjtVDg0R6orby70Lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NDtqTSR0heSkkCRir5tfGdlGOGey9ZU2qvKHi5ZDQEn6xHmky
	V96nmc+oqhYFukeiI+UmyepnWhDGDqXJ+hdUderg4ce52JZKMy2zSYgXIx2uiXXfxCI=
X-Gm-Gg: AYBFou2/KpZL8gc7ckjgV43rlBqzbyy+etGy9KA9UMDKj/25jmjQPMhKFTXHEgWwZXj
	0OoYGyodUVfqTISogaiTqgDCspwOP/LPG1p3hU4bEcDJAoxg4Nx8EVS5R50P3woD3BPH4SRBij6
	u7QPmqSe4FtqtqdsWOFHmgzHAa5Jbn/WmBM2aT1r8sCSV+C1ZA9l2KpIgwt4WjVwKxEqe9ftkiz
	JD752MzmVSeMhYNGmqnqiPpW2c3J3+QBxUoTIXEapC19ZmBavSt2Puj5mb3KZlRiZFzY0hprIRN
	toQ00jGiDh4SFi6UZlhC+6Z6V2nr2AzxdKGJxmFtmBByQ8SdIbJMWkCL0hZUEGbd5t8zpqcpbH9
	2TXR4JacMEyKskGH0K8js2AupGw3azJj9V4+nZwR+8oynO+Uas/cxTuj8V0IHTPpZINi/2BN8qV
	Fi60PLy/QZToObwsQh7FdlX1DCxhWYMh/W0A/M+LjBAuV8rIh1Ony51E1VcXxI1mhw/TNM4SyHy
	G4KPckm5kIDPLIK39FkXxNpjV9f+s1A99dZHDL027GSAuAB07mPIka+h1+CgRqjxT8oET4aXdmt
	+QzE4kSAZGMFomg9n4T5JyjVVY6y33lfBFj4Ygr/BOQJfvHlA+Awz/3G8FR2pWZVFvmKyX5cnL/
	7F08CO+itdbhfibzuGw==
X-Received: by 2002:a05:6000:40c8:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-498302fb9f3mr6993067f8f.35.1794332132102;
        Tue, 10 Nov 2026 09:35:32 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:31 -0800 (PST)
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
Subject: [PATCH v2 1/3] kconfig: print the output of expr_alloc_and() instead of printing '&&'
Date: Tue, 10 Nov 2026 17:35:24 +0000
Message-ID: <20261110173526.1548434-2-julianbraha@gmail.com>
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

Clean up expression printing for 'select' and 'imply' (which ANDs the
select/imply targets), to properly call expr_alloc_and() and print the
output, instead of printing a literal ' && '. 

This is necessary to ensure that any '&&' at the end of those lines can
wrap properly.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 1a3ad09a92d2..2b2166edeb25 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -761,19 +761,16 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 				 enum prop_type tok, const char *prefix)
 {
-	bool hit = false;
+	struct expr *expr = NULL;
 	struct property *prop;
 
-	for_all_properties(sym, prop, tok) {
-		if (!hit) {
-			str_append(r, prefix);
-			hit = true;
-		} else
-			str_printf(r, " && ");
-		expr_gstr_print(prop->expr, r);
-	}
-	if (hit)
+	for_all_properties(sym, prop, tok)
+		expr = expr_alloc_and(expr, prop->expr);
+	if (expr) {
+		str_append(r, prefix);
+		expr_gstr_print(expr, r);
 		str_append(r, "\n");
+	}
 }
 
 /*
-- 
2.56.0


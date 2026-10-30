Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351368;
	b=hMDw0fkPzUHI+9EJe2Btpm5FO/4/OB1j4G2GgzIUbIJ5RzmkaGfDaZPEgH/OpHdoAGga
	 S9jP3scxf4luJfZp0HQW/dNeLQ2Pa29chlSndilCMcQFKW7COYSwvvj++xVaORbd3effu
	 7e2+mAhvFmvc33+f4EhrbrAaYmYnqFoUTZty4W7dhwTOpU20J9XISx2P8PluNjrCLAYD7
	 fLV7ujykpOeXKKJKenztFwVhs9zNuQ8kRtuQ65p3me23pXjBMSSzQhnJN88nYXAZitzpW
	 Ov+ttfO8JHIL9+yJIEynX1sXq/uyBeCcy00AbBRi0VvjhySRo8MhSdj4RF6+OogHlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LUvsIkp7/500y2lt6LJqZ5I2WBJLtnIUyPWDTSgmUgE=;
	b=oJgS9+kGXf8GKHT8oO4DD4dJXOO65d1+JUx2gXXUUkkGg+e5kFLgAR1vjFJLhQJ+m5Vk
	 ZwbbF3iNTMGTL7WtRX8rBRGNdPFToQnzkoGughT6jdHN7jez9UaJkhir/xiZi5tdxM1GD
	 a/TUwb+7uTIcVwjj8FROCCCHZQFMEU2VFgvigliJozlebrg/oYyp90HwfljeETGBEL0y4
	 aD9ZWI4qnVavOquGjLDvMhO+Dag48DQGSOqRBSPKsRKkqAzxlK6jLvZhh9rubFaFQtnUW
	 DP4AXIR4ZxEohrv5mlAaHW5T3SUzvCXSHhmq6qSeJVwx7g+oKrYmzoPDVpTUaSrayLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKaukWJO;
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03521606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03521606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKaukWJO
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1949fbcbe6cso24172c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351367; x=1793956167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUvsIkp7/500y2lt6LJqZ5I2WBJLtnIUyPWDTSgmUgE=;
        b=EKaukWJOmlmCmCOrqE+396RTZy7uu2qczhHFVxe2WkvPErEZOwSM8MHKiIs0xRxdQe
         +LFbi8JWToATxv/nKr0XWqs+RIFUB4IrdGkcV5h8VLfm51c/ffquyPovtniSGEzoK1cB
         bX+wT6khbrU/tWkE9O+dCpXdN/k/oJz/ZvIgxSWSh2jdBru6Og+giSGqgWXYWUfSTraZ
         yNcvYVdabJ8QO38kYkcqwEoweGeFAXSRBtMu6hcya0G4+FTZvb1vaI1yekxWtNNo8KZ6
         Ur/AfWe0v9k7ibSRldaCr2FWhcO0/iAQdned1SxwZNrpuRx46RUmTv7mfITbLUjKWP3D
         JKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351367; x=1793956167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUvsIkp7/500y2lt6LJqZ5I2WBJLtnIUyPWDTSgmUgE=;
        b=HlaOI3iMffxQeqAbpmvoCcDm5EekYL41waBFExP+WCWqEWMdbMQ8k9Xu6BhpZVPnlB
         6pXG6SxSC72QY42ZeapAXSjt09uv2azk9b3jiOHVVwiV83n2PjRPjApN0sMSjWcMDD0/
         Nx0FM2OuzDTsHic72LgCTzPKVC9JbF1CFY6UlPXctu0OBDUy6TS2SJ3DIzmgnVLBw5r5
         /bYE8cLmyeFfnrb0OloNo84+YmYtzA22ICAA++vTtufJ3epEPkeSZssIWRk+n6qfc1fN
         1s/BBjaD/ZaQeSHbZup60Hd/Nop5Gox5+qM1L02jpF9VBhBGTVXcChEqM00XvwsctZh+
         xH5w==
X-Forwarded-Encrypted: i=1; AKwUvBygzSOggt6PqxCvhx/3JMESATDUoAz0l6jET07U0/gkoTAfLoXG0kIABm8wVAkr5I4URbT50hvL5gbxIKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK/L1AN9k+puVkFfnw9J1I74rslNu87pz4szGeBVvd4y5FQrCe
	+Yb2inVPvjth9WQCgW4nrMCbDKBuIkwobF12xuoMaeX8s+QnB/Vo1L+9
X-Gm-Gg: AYBFou2IuQ6rzS0MO46oWnp0BbuFkLQpGU1fZa8QXI8B5SRfTP+cXQU3i62FvgriDIV
	r2+Gjuxjgco3RaS4psD8HQ5DIuTWPAy0nO6/flaeyVcbjfspYB9yRhHHB6G5TFYb2l9FKzhc3rw
	Icx7KsEusg8g55HxAtmPkun0wAjYHlMLmADCoklODb9ckre06TxaOUmYc5SaH/QN0sKiciCa3uk
	1x7BWfXVNitHIpiGBBbkzQE3HrD313hVrAt2pL7h+YnB8w5JxgvkKl1sTQcECnPcUX3tBKSiAaW
	iZ/v18SsSEy34aZrUWtsmfwAhy9x9/YMocNNypQXjDnKBYJEJxSC+VwZVXDvVgLebHG/sfzGZVj
	ZcKaZ/EDoXXECzSCnJWwYJ7e2MrEMjCuXQD8nx8YrZMojURyhHGK1yhOShq4TBFVktFGAca104s
	LLUrR9tG9r47s5k67Eoq4KB4vALYcsulWWWW/B6wPIeLyJaXfeCJ5zXjuj/uy0bZv4fpGEf2qv5
	U818mRHtslVzAii35kYR7lc9J+wgQxcsgkMcGGjZzpMfs4mAkxyl8lX6S0W0tz1l8HCwbeC67Px
	Zmyd00fiezvRWBsKDF7iK656f4/skr7dCvgKwIKPmk6w3dNOrNzoErXzGw==
X-Received: by 2002:a05:701b:4244:10b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1ac5b211405mr2439430c88.15.1793351366854;
        Fri, 30 Oct 2026 02:09:26 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm5371762c88.15.2026.10.30.02.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:09:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [RFC PATCH bpf-next] bpftool: avoid sign extension in unsigned enum JSON dumps
Date: Fri, 30 Oct 2026 09:09:13 +0000
Message-ID: <20261030090913.76944-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The BTF enum value is stored in a signed 32-bit field even when the
enum is unsigned. Passing it directly to jsonw_uint_field(), which
takes a uint64_t, sign-extends values with bit 31 set. For example,
0xffffffffU is printed as 18446744073709551615 instead of 4294967295
by bpftool -j btf dump.

Cast the value to __u32 before widening it, matching the conversion
already used for plain-text output.

Fixes: c93cc69004df ("bpftool: add ability to dump BTF types")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/bpf/bpftool/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/btf.c b/tools/bpf/bpftool/btf.c
index abd661db91e6..385521e6b028 100644
--- a/tools/bpf/bpftool/btf.c
+++ b/tools/bpf/bpftool/btf.c
@@ -482,7 +482,7 @@ static int dump_btf_type(const struct btf *btf, __u32 id,
 				if (btf_kflag(t))
 					jsonw_int_field(w, "val", v->val);
 				else
-					jsonw_uint_field(w, "val", v->val);
+					jsonw_uint_field(w, "val", (__u32)v->val);
 				jsonw_end_object(w);
 			} else {
 				if (btf_kflag(t))

base-commit: 7101b10cf281f629ac58c99697ca6f6d082b99a7
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284505;
	b=BWe41R+WpA/SDRrUZdW/zs1zXG9ThGdhVa0pConjP0eytx/J2LTbMmuHJ2c+aKE54+gF
	 79rn1dhSOBS7/Eoy09JJDhTNIiv+lolHX/YfKg+P3DOuzimS+3d28zZJxVMn0/42HcGut
	 XgU5raAGyyzrRgc2GakCKNocTUvtJ20cLVvNR3F3Ijgrs/ajZaG3zF7Y/q7CrzHziFFqS
	 M4SoqEb9NBwfUmf2cFJatgoSuJFfxZGcQzKkT6AqEUtIEXuV+J8l+8q9E6IKftKjugDql
	 x8sgUsrVItNoxSR/NFAT6i9B/Izzfa+2G/aV+9nctX0+dXWA1TU/O3CzMLRn1kdQsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
	b=H8bbKbXQUsykGGAr3gY/UFtLc9gPHTfMuHu4mS9komuOg37HAYhd5Q3mJ4WDbcb0w4CJ
	 J9Cvoi8z6f2Vo5v26VZSumBCqJhm9jK7/V3SChHA+H3Pqos6ZjUxtcb1VdOvOtvFFjP8u
	 UZ26GeoaOcZKvkBgDb+qf/Rd5WJ48pBkfkDSaB8jxJrvnlPko4fvj7K3wxFHevQiS47we
	 4TCEMKzHzQbYjkgrpyj0eTE1CKvrsYDTWM48BgCjmcng/5OajEkplPeRhm1j6NXM8F3DH
	 OAifkxSwzQnjEOR7WOqtXcozbF048j01vNVzp6P3AlyZaWGTKfFPCrSWO9dqYbzeX4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CkUNtGc/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18A60A2633
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF18A60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkUNtGc/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37198ed3727so2149648eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284504; x=1794889304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=CkUNtGc/IdLYYEBp0KfBNkDLcjNwOLWYY5889OwOd8dCaFE/pf6bgKCp/rWI52S3ig
         toH2RRyJFa5nCKyAUhemTo/KpcN1Sol/MHnT6mreE+/sBMF+rcYuk/vXC7DLEpb1TksY
         40CIWTNqGVX/JHGWNy+FnSxhT2nwChIEo6oEBwK6JgP3c6RVyAmVg8pzY9URuyqe/WIb
         ILI+4NBT8WGoAw3WY0T/6s4zF9RNfmSqRkwAEtpgwUbdKA67MMBMEBigjCTB/EEYiroC
         D+7soLk29vQwyd6m2sF3Rxojj2AfCDcxhi6pqxHyjzb9Vrbdncc8wTMokfoL1xd3TttE
         074w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284504; x=1794889304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=TCO73j28QJsa8vhmJZqid8MYsbccnKpaaP5/MW3Tt0MvhqA27/xnovaLK/+AxYzOFo
         YWn8NyFzpDMhzapOUAH71F2h1uXy0GYkL0JVjeOmskLlnYt8xeHl1QFmEaRdFyjo3jAH
         ySP+tv4OnihUdzjp5hSV06yHW9LYWeIOCBZxnFHo2m/o+l8Qo+3D1ahq2tzD/alXXeHM
         U+hXJDSOb5xrUjH5ZqOZzIKkUS3apjvNRGRc2dPSgRuvw2UJMRf5KLz74t2vAfrLKoTL
         dnih/DSwF2Rv/rlAZaLWsXyRr9tfA8iaHSWOuUTad4UZDmGSysMhGQVFe88ukI57pi/c
         9lNg==
X-Forwarded-Encrypted: i=1; AL+hErFO6sxevl5w/nltunu5cncx81RrmYtA/MNNJIimFM460BCPY+M+kHV02TVThJaYMz2GD1Bf5eagwMJ0NTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QWJ0+1rlcpZwnfxkxKm1PIEpok8X4R6lxF2KMPgYuzjybGSJI
	MSFp2ylGCOaAoIY3INEBpdQHb1apff25mZWj6J5a1pW8RvMY94IWd/4Q
X-Gm-Gg: AYBFou1h43jN4AlzSre/hRSnEgrx1mnlcRwszmoqZlR4QVMGsW34R2oLXpXq3l6FjO8
	Uav/vGnX4bN5GR5TeeogplU0Lh/jtoh5HaHHIWdx30SY7XA7T9sHMlttV0Rm7bwhBe1+2crwoMX
	5Xit5iRjT8ZuXBN6VWe3Hq3nHuwF3BEIp7LxrO4doLczK4RJzTOd+KdcgJs+I+/plteUd+Ja4MI
	Bro/SfrYWB5zkxxUUAb6os7puCPGXiA4ZoUtx8cPCYAdQvu6y63tfKwGQ/O3mkyQ3fT3dfaLfvB
	hHbc2ULZexpbpSNVZSN+LPMEuD0hNCMGtck0coVZUKTaN24odsQKhOZV87Ug+OPW5ARqxaLOMFn
	Hg1SCC9TfyAjPu6LYOnF4jk/Ln/OoJR4++q8BYDekjNYJEVXXXEeDsFi9EHx45Ys0x2li8Dm7Ft
	W0+Mes9p/UR8lonUOUufAWdMVNapFnTXJGuHlzJpEnxgOsGPu5ljJedBVXxrPn8pqiILGoJ8vw7
	P6lapgH9OYhMMUUI9BUX8x2uAYEOOBIaYXqYbsZEB2OskXgCpgseQM/DS3cwV2CDAbfFzsOgT0y
	fXvlkalXMFS1LgQFDwQM+FKp4qIshjpBBsFLhEuBi60CD2o=
X-Received: by 2002:a05:701b:4642:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1b3b5e167e5mr1932957c88.5.1794284503989;
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 21/25] keys: Guard asymmetric-type.h behind CONFIG_KEYS
Date: Tue, 10 Nov 2026 14:18:28 +1000
Message-ID: <20261110041832.1730924-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

The header keys/asymmetric-type.h includes linux/key-type.h,
which is where `struct key_type` is defined.

linux/key-type.h has a `#ifdef CONFIG_KEYS` guard around the entire file,
yet keys/asymmetric-type.h doesn't. So if CONFIG_KEYS is not defined
including keys/asymmetric-type.h will cause build failures as
`struct key_type` isn't defined.

Guard keys/asymmetric-type.h with a `#ifdef CONFIG_KEYS` to fix the
failures seen when including keys/asymmetric-type.h in the Rust bindgen.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/keys/asymmetric-type.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 301efa952e263..b77bfa7bd5904 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -13,6 +13,8 @@
 #include <linux/key-type.h>
 #include <linux/verification.h>
 
+#ifdef CONFIG_KEYS
+
 extern struct key_type key_type_asymmetric;
 
 /*
@@ -93,4 +95,5 @@ int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_si
  * The payload is at the discretion of the subtype.
  */
 
+#endif /* CONFIG_KEYS */
 #endif /* _KEYS_ASYMMETRIC_TYPE_H */
-- 
2.56.0


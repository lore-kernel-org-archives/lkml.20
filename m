Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732576;
	b=v7DfC13OwHq4e2f2hW7R3WZcSYMRqrCVPs6uybMuTQ3mwcmtOE+Zpt+h+ALyaGFmWs0I
	 TQiab80Wrxdvy7kUrqR7o5YXIr/Ls+QJEYVXsrGcXH0w8KnFXfMID1T/Wmuk+gyGuh3It
	 3JQTiQJ7T+ohv2hH9NGpobCJxCD8EklwGiZ7zApEGvRtd0D+1wdURe4oU80KC1pmtV7MG
	 W7ZwlZcUDGp8rA2pxO5KdECsNpUYsGK/udynnL2fY3Ae4ZIklP+BV5u9T9ecPhrzNWoQr
	 vMD8+TQQYZ7jAQWQOAMWxSP/Ls89l7j50+vQRCFWsRQbfvkziTshShMYEw01B/36dHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=ypFaBjO3k23x5K1zo4J9CRqYQL8U4qxAyqA2wF7xbG/zFsxMovDCqSbEnmhdmboahppq
	 vyZ+RKEXs+5vB1OxtaQrY3kMfu7r2tjnWqXwTGBJFbGOk3I51pCffxNn6yCYzWOwQYhKC
	 aW4zv3bYzrTDytBUGz8N0NyX0o2CnsKuZIXI97XQrNT1H6PWzDmVKfkVCfhNshISIXAed
	 ZbowfDo8dGXQ03EUwM7m2a7tFgJFxTCli6g20lxJSmRArPp/Aqi8IaYuDJAXVIApfr9jI
	 BD9VPiO9Wv4JSwI79AArTjWKW9tCt5vKPOOKhwJkpe+1957zAGd5tk55SjNIngATDbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VupFcbpI;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559F606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7559F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VupFcbpI
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-375c861fe62so234885eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732576; x=1795337376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=VupFcbpIug+OPHMYtzxL6kyFSS9B6l9i8X8oidvMJyU3vNpzJC3sMrqmykRqHR8Gbj
         WR60m58rvUM6RNaNwyiJ3IspyOizxODUadi9ud6Q+LPhPcd+pgQMiogHZ4xR9P8PC0KJ
         KKklGkdZbdb1HgXY70f9+etFWcSFfwNaV//8ncdXdvvEl8+Xj9xY5PZtqzq05CIEDNab
         Kd5PGh9Cb7YowEf476VyU4XRcdNLyAPMTt7wJQwR85SkcGM6tv9apDlaAATOYFPp0J88
         H+UJbystko3F3sSqoS3jRcbortHYzKHYJjwTJxvE9ca2WF1Nyb8UCa+IVyb8ezGFO9F5
         +Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732576; x=1795337376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=Hvvem68D4fp1/99PWPoPWYubZ+i9m0Qkd23vaQzcQNCo9jw4ZWvMi2Z5A0H+Fl2sem
         VYj5KqeJaPblbphksPVWp23g9EvIUEbJzIfeTqcW5v4Q2ikDuvuC3MIire+YbqwHZBdv
         +Dgq3vawR516lFr68/hTw02H7vkb+oGvJtiJklHZA9OREY4e5IK2qpNhSFeVuY3QWn+C
         YKwickQHe8teSN9iowv8IPxXqCz/WL8iSoHpHTRYCYOo2W3oZGrOUZeZQqio588JszqO
         VF3VFSKNcuUkmmFS1cPNjE76cgQyFZliRp/6UYeIjgrDgayUJsVO7D99i145iIXEvD3W
         9GpA==
X-Forwarded-Encrypted: i=1; AL+hErGDpZZz0XFeSgir6YSrFa5p6oR5EcZWmYlD7rQf+T305d5vlgdI61SWYTEXKahppWY8DG6om0rCO6cigkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zgBqbrtU30D57ZM8iYZmJebS1A6+QurDQiA90EfXu6bEKe7z1
	Cepd2q/2KAPXl/5gNqoFN74QnQy6caydRNVhLdu3jLuZ5sLibsGXLRBm
X-Gm-Gg: AYBFou3uzFfShpGKJ/LBQMPuPPR620fraYauZ/WFi6+ls6G3G2vZfq4NSSt8tkIFZH7
	1NMTQX3B1HfTNRF66o328AD0CliesfK2T03LgmYXqpxqU6UrjngyQ2VX/DikQoxZ2soiayEifKX
	3TRb0t4pH6tRhqqzj2XONnWEhctg6o+jMMt3Uu46zybXHBvwrZr2SiO+pkUXU880B2JxZMlbJ0u
	rptQYdBHaXrYewXSvosxONoRSbHieeMzykyGaNZpHMCsTVea3l9+pbmiuGdom3uLgtTI0DT9VWF
	3WpUvFoFCckLMZyB8V+FwQ3dRW1mkVSm5tH3GnNLTdLIBeqi3LmsapiJuJYUtg1fli6lpIllrEz
	aT4KXohfPLcnLyh4n3OCetrd7HYvwjPGWA7lfr7gh8NHet9Hlle4vetlfw6d1R0LJ6LvHEE8u8m
	xBt2KewJgb9GHxorWHypmr3xNn0NeEGfxhqi0/C6/2rVDNzJZMPqryuhP1HJo2X4fMyhm/O2d9H
	MLbxWy49WGDRdUiGiqw1wZF4jKr/91ePxrJMhSoZyoJV768WXHCydGteON/jhbEaDZBECY4MxKR
	ZBPmnakQhVtzowCUbcoP5KDE7KaPoBc35uefDBOHgt88tuvhfgGpoFQWSaA80P0aK1jyHy5Xd1V
	YKcQrkyT2S9/9qyFM/EFYCeM2H5FFYw7hWr3aaw==
X-Received: by 2002:a05:7301:7108:b0:376:b957:bfb with SMTP id 5a478bee46e88-3796628d619mr6973061eec.17.1794732575687;
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Sun, 15 Nov 2026 08:49:23 +0000
Message-ID: <20261115084923.53182-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115084923.53182-1-dennylin0707@gmail.com>
References: <20261115084923.53182-1-dennylin0707@gmail.com>
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

Dump the signed enum value from an unaligned address in the enum data
test. Also dump a zeroed struct fs_context without emit_zeroes in the
struct data test, which covers phase, an enum bitfield 3 bytes before
the end of the struct.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index b5c90f729339..d6fd9933ff25 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -945,7 +945,7 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
 	__u32 high = 0x80000000;
-	__s32 neg = -1;
+	__s32 neg[2] = { -1, -1 };
 
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
@@ -994,6 +994,8 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
 	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
 				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, (void *)neg + 1, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump unaligned enum");
 	btf_dump__free(d);
 }
 
@@ -1182,6 +1184,12 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 		type_sz = btf__resolve_size(btf, type_id);
 		str[0] = '\0';
 
+		/* 'phase' is an enum bitfield 3 bytes before the end */
+		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
+		ASSERT_EQ(ret, type_sz,
+			  "unexpected return value dumping zeroed fs_context");
+
+		str[0] = '\0';
 		opts.emit_zeroes = true;
 		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
 		ASSERT_EQ(ret, type_sz,
-- 
2.43.0


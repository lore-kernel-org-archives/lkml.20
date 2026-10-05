Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA03002CF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190657; cv=none; b=KG3bz7YJSy3YgDT57Y8pv2VQ7P/PQFJ3W7g/HzSm//15JzkJoDaT9G3htlX5yQrK994kz3PdTVpZYTPyKD9PMjBBpEZyNF9Kh5x0K54ZdaBbvmSPaui6cJIH8YpeBFmnwITvSJdt1pmDjqH8O/WXQBNArtEMOxKYA56FqcJWe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190657; c=relaxed/simple;
	bh=meebE/h5u6rOUA/vPbZJJdVkADIHNr9DhZxBNZm44SM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OlixnN93aApwic0UsMq4E9ZT3e7Ney279RJjeLA7W6way1Nddkg+zqHP4ExPpr7USjhyMZZIlAnMgfwmDOEf6RVIZwwrn90TIov/bscYc0ZK1cKqLDPdufH8R5NFlDVda+JLEyhxFhHwzWK/SEM/awi8tcT9lsSFsBS3Mehk9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsEe6koi; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsEe6koi"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ddef424972so1516353eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190655; x=1791795455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgapWjxckwHwiqh7aA0j5a3SO6MCzmt6cYgXvBBHOoU=;
        b=LsEe6koiwv3jLSOLOdFuvIYrSflTXrO71IkQiPuWjR2IQbilgTk1Q/tb8dsqjGSkLQ
         fyWfHTvFnD1UDocwa+2M83MBU8gBJ/b8M8Jk+6R2UCXwseRp3pMpEryDnoOBYW6Cp1i7
         WCa3mx6LBBUhkCzT3cYDW8CKmdoR80DlWZNXBVSppQCBnxbwcG1M9QlKYpuIxrfKxfCl
         YWUcQTu/duueFB55GLclQQoclraHoaeWyqDkAH4gwyaCRyIlBkpn4WuPv2NBMlWHo58Z
         Z6tf4DVbMJs2QdP6SmGb720nRv+uC5dHRFBuMKyQpDdfsOh7irOpFaVUkVU00wOmqNbr
         51EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190655; x=1791795455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgapWjxckwHwiqh7aA0j5a3SO6MCzmt6cYgXvBBHOoU=;
        b=d6B0lEke70p1OJCEd26fMW4IsnymDKz7H+MRMEKJ/9xkjJwX3i34QuUqxqmpPZApD3
         648nlxrs0+J36xgtkw/CxDHIQjUb3/sRfzROTPQnQmQzzKdBoRWa8kKarVc4tnI9sOd7
         l9vNwMRwRMp5CskicjCtGkHypmqZkzcDDc0V8x1BNl0QzXpL3OB816a/NH7x2zYjHhFi
         AxhsMZCElsGWcFWNnQs5eeEhqjOt6DKF08YelAtwTDWg1OidXEoK3wrik+3tsrCuc7iy
         4rGsP9SNXKDyGwaTxHGxgbyJVtzDTpBRkKBGCaCs3N5nBi0qYRK1D8Maniwydj9+ogGE
         Omlg==
X-Forwarded-Encrypted: i=1; AKwUvBwrr47Y7sGsqdBO+q2+5KSJM44DAbgUhOlQylZYAuIV8w5UKittoIn31DTUX9H+OMq7rCbMOmdlV2ljx3M=@vger.kernel.org
X-Gm-Message-State: AFuF++kcawhg8y7O7y1qlubwacxV5MxMSPOFqZcM/6KqvuhUacuZIcU0
	6S4rj6g9o1s5fg7+t3QR+LZ+J/Dk/8GT7AQZhNzOZkLzzAP26qpeTM3k
X-Gm-Gg: AYBFou3dkqNxggrcOFZV6cMxoMW+VGkVlNTXBytSKamy1m3GhyhhZZW6d6a12QBIx1x
	/Bx8iPvTxSc20rSK7Zn/sGHmED67l3YTiK/sZm/vO/B6lwzww1I75576Ep5FYL0x1/t2jlInDwV
	XRLBnP6c67b/mxj8gn4D7xs5/Tmg79ouRKG67ogURjbNykixXUF/vJ0JjQPmzeL581z2ygoSjAK
	Ob7+XKApnMPOM3ONtXFf25OOamMDrbAG7d1BZBdQvozokkP7fXmZ5JypfKADihptf59lNdiQDp8
	7Hi25qSYlsX3yzWKCdEJwwNzuzhc8P25E7Ser/fcpAi2D0nT9ebVQb4TmAc1DDKomX5zFmpdXUI
	eo/fCb2AWivctree+0kUXMqSTFOwwiuFNixeo4aVQTIw3bjG83R9D3kQ3QMDP144tcJbpfgo5yH
	mqqxIfR5kmWNrrfpU/Pc0K6FaoJuo4fAklJVGe/RWXGxlXgfcRStuLc1A+GLLEpZqgh1FyJVv4q
	LRGX9vUI2hX
X-Received: by 2002:a05:6820:310b:b0:6dd:40e5:3788 with SMTP id 006d021491bc7-6e09fafc51dmr4924556eaf.83.1791190655282;
        Mon, 05 Oct 2026 01:57:35 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e1b2e3664sm7670463fac.7.2026.10.05.01.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:57:34 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gen_init_cpio: stop parsing on lines with a missing argument list
Date: Mon,  5 Oct 2026 03:57:29 -0500
Message-Id: <20261005085729.872402-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a line in the cpio list consists of a file type followed only by
whitespace and no newline (e.g. "slink " as the last line of the file),
strtok(NULL, "\n") returns NULL. main() prints an error and sets ec, but
then carries on and passes the NULL args pointer to the type handler,
which hands it to sscanf() and crashes:

  AddressSanitizer: SEGV on unknown address 0x000000000000
    #4 __isoc99_sscanf
    #5 cpio_mkslink_line usr/gen_init_cpio.c:169

Break out of the loop as is already done for the other format error, so
that the error is reported and gen_init_cpio exits with a failure status.

Found by fuzzing gen_init_cpio built with ASan/UBSan.

Reproducer:
  printf 'slink ' > list && usr/gen_init_cpio list

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <lzsx618@gmail.com>
---
 usr/gen_init_cpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index b7296edc6..0f0c61ec2 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -756,6 +756,7 @@ int main (int argc, char *argv[])
 				"ERROR: incorrect format, newline required line %d: '%s'\n",
 				line_nr, line);
 			ec = -1;
+			break;
 		}
 
 		for (type_idx = 0; file_handler_table[type_idx].type; type_idx++) {
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268867;
	b=lhPufqHKEmvu7hgv6+sl4KHUZWADbDCfwnlib6+1N0CDU8dZutjAl7RL+2KuBQdgBmML
	 tTdg2nsjNSlGQ3GIoBhPewnH2epagdu4yG7VnBKCss7iDrpQ3ZxX9yTc1G5Dh5L5f2LnA
	 xSnx3udO6CwR1HLyZYliVxM79JKZrlkX7cRspF3t3TkYBHct2LJebtdxABmJNKzRpXcAm
	 4tq+VowZKHRE5gaVcfFYk2BlscdYZb2vulnt3JMIitpS49z46I/Eha9xNRMNeUtmYGCVm
	 ZpIv1eV6COqs+YcKX3Oguli7vgFmTbN7SYYsc0xBD+H+KpiQpBVHGR0b+Bs4J0qr6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
	b=G1CVneqR1ZrsTPOYsYdEQYEXqk8dp9sr7Imlm5OYy1ItvhukeilNBwMYsnYfuRE/5WTF
	 0qn+qzdyMipJIojbCf6IcwH2MJzqyQrONmcmyiedGPDf2URbkGS6MLxGrW41cOl2mqfZM
	 nt6q4uoKfojuy89iVzrQW8W3G1XAbrzOm5sEpIR45lAeWCE5vDimArJNqpZGzsUvm/zOF
	 hcVyLUFkMBUvSvXZ8FpG/A4psXUB8vf97ET+Df7BNzFJbpKOHPCSfpj/rGd30OMH3IWsx
	 3FK6vxFGP48KtXFczmlbq7Qg9wO3T2BqC0BQ9oXWZGqd97oJDBy4qyh1PmBvp8Svcmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWMxmg6g;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB8360A2610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB8360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWMxmg6g
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53ec2cc397aso816558b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268865; x=1794873665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
        b=CWMxmg6g2abgyUL5n3vZf/Z9PKy3GyA5VprFxK1HtxhTnu7L0zo6Kl9i5Dco9q4JYe
         L45BL6POyL/UOgpR+NESp6BFYJd1egU9vqKj9v7LjGw2XzDIYKCkPUFSL48hRpNONyma
         Cpp66jfSduBkNvP9xWrkTi67/KuKkHPdM9N9cy7J/vul4YdaROCfUQnNMDJhqHnhO7Bj
         pexc6Kurpan5ou39HoL0Txe4yzqXCisy8qrstnDtzT4kN0cY7ckG2RxIdwougbkz7z+l
         NetBoFnVtmBvxAlLcCdQwVydp2nVwYgHpdqKudef0OBb9KCGazMx92HZaHwkxCH8PX1/
         lvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268865; x=1794873665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
        b=sJVuoIY+FePUzXK0ZtnPd79AjhtkoEXYPjYUeyRkeOANQvik+3Bq69CSl1+1cZjquV
         6NWgNy1QcFH3xM4B38m7WJYpTfJbNzK0oIG+J0Ek2CrDeplp9UxrVFYDYIrdApPP/4mJ
         jlq7is1+F2xvVJjwHSWgGdTEKtRhiEdoeD0ZeiyY3pEzJw/7IZCAnc/g2/QsSge180y8
         7aTf8omfbFgdbRSfuYWqUkLpZJjzTTtM4fWZcNHJvqaov89V3go84WxHOcQbJZfmUQWt
         Z4RVoedqKuubtSxehtkeVvEm77mMHYbJGE3XwOJieUTtBq+rUxcplnfc6LIN/JSQyBxf
         a1iQ==
X-Forwarded-Encrypted: i=1; AL+hErGyTNd6jr+g50s2C/oT2Bk0InEvahb6VuFM54AWappxvOFBj6zrETRpxmZbaTxkxYF9qsLdauD/oD8NTFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nlgo0APouAIr7sVyet3uL39LzDiKHUi+Gp/ve2NqwBei2SNv9
	/CZhZz1K6fN0Suy9zOEJ3DBacS+4fB3QbpK+24Ic0Cg3eoKjFmYjDwna
X-Gm-Gg: AYBFou1DY42OcVZAVmOW7TYjpRu+hlicm/4l1bYbm8JfzeUDREsK95ZP0qKrs7pWrKk
	mWFS82j+CipJ5ZMCGb0dzQn9Z9vlgZun/qsbiv69uU2V0TvdGyPj5f7v2c+drTma+OjxWk69Rzx
	l+ohqbnWJvHsigbE/vvmM3m0AaNr9f5Ib9KoVKNlLcXk01tpchEe8z4PiuSDqHPz6P40hPmLr4K
	TSKkz55Mzr8BOLS1L4PN8HqVWj+PBHjKTb71341gzDkW1Xpu5b/sIWggNTkE9LsFoJgnrf7Mtj1
	7pfO3mVXi8hBaMeW7qJTH3hmTbVdi/pEcecEhRpAgYhGc9Ej6q5Nbs4rM0pio0So+YkV8OoPdt8
	JSViFNRKRtXwcQs9jxJlIr+1wS1Swhnh6Isq1EEOKc/GEwmza+tyTNDk3b1DcLDAh8koWL0uvdf
	AfgjxJWKT+JMVTaPL162PB90i4E1lEr7nJTbV+yUlCv/HuSpenzk0EouHtg/A4y7UWJasCk8+VX
	9ZJuRzZISGd4MGxdjmpwCaRG7KPS02scwkAyoijeCMUw7KqliOC/wQ+21aDBPRrNeDXcrF7HqcW
	LVICVh+lQKZrRhgMsP45mV8c5tsc9tkmykiMQHF+j8s=
X-Received: by 2002:a05:6808:c123:b0:55c:844:98ff with SMTP id 5614622812f47-5683cd4858fmr845306b6e.34.1794268865523;
        Mon, 09 Nov 2026 16:01:05 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:04 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 5/6] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Mon,  9 Nov 2026 18:00:02 -0600
Message-Id: <20261110000003.1719966-6-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4251..0425e00c490f 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -788,7 +788,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	sort_needed_sec = get_index(shdr_start, shentsize, sort_need_index);
 	sort_needed_loc = (void *)ehdr +
 		shdr_offset(sort_needed_sec) +
-		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
+		(sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec));
 
 	/* extable has been sorted, clear the flag */
 	elf_parser.w(0, sort_needed_loc);
-- 
2.34.1


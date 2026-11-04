Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826557;
	b=ugd6X0y7JL+SKa63q/lyPVJGGeVmjtJM6r+5IgtxXwfDZkeq9lOXGj1wsz7SmVwhu5kC
	 8nvVp8WPfoPK9kMJVg7Sro2FsE5akuKzZZk4uYrl5uAYT26213vooDqHtovBCZ0ToV4f8
	 pkJOvqcrwADKsOzlLGZgwX80A31YHrKAZf/mHZkDobQGf142raMloeRV9/OOgkHw9pN6o
	 YIKw8F8h/76YcewWbkZKuS4Zx54e04QHU89cDfJz8rPVZapciDT3/7QtCrJZTYN/x5Ait
	 bW42q0/SeVsxy+CpjwWChtfSEvwGlLWb4qZxzFd7lkOhk6FKmXcxF1E9juJjTUAtsug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
	b=f4wmIGfLwE3wW6TlUoVT6Hxgt0V7cDIBMPPAvRBlnc+U5tt0qT57qvtxom/SzCsxWwuP
	 qQL9RhXYyIXJu7yyFZ65f1hjP0dpGGnfijsy5e6ytwsDI+KgA+xyyPQo6omVD5SjEDEC+
	 jvF7cMZ3Yyx9iCw0FC5JhX8/J7p5x/YZiAD7BITl90pPeo7zdfr3HYD+D1wjNNWjAqm1T
	 MS0WHJ01ONfnTJJpI9Qm5cLciVPQRM307C0BoLbKm8FyQQwBpRDNkGCsZIXf9Wh8AgeBL
	 L4aSz8ezhEzYA7piWUwn0V4jnHOl3PPi2pNsgASswtZd2ozZWkyx79MS60qGVH8R8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oX++8FJC;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA6607E92E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBA6607E92E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oX++8FJC
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso554387f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826556; x=1794431356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
        b=oX++8FJCCxku5U+GQGQw67eK8Chub/aAMqjWqSwhZpapRvc6a9EhHorokWblRDuge4
         t4GFnaPogsTp0+y40uf7V2jma56d7Xs0gWQU9vWXT6wn8V2kLxnCnzrUDc2T3Lwrc3/M
         a6fq+xBg/NWgVzVFt4iwMl2q7/jH9ObyoogHUZb68+auN5UKzXczZ+UWVawnVLQnbRMI
         JDbGnLZhQsOxBTfiyquSmf1Iit/haHWA52577F/hZCVJbKeFcqjFL0rrXpbgP5rBQP54
         q7BdXyuzgctp+4V4sLJJeR96bPRG+YZ2w9gWAJ9DI4Fbx7uwSX8ZCSai4doqpvTsxgYU
         +qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826556; x=1794431356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
        b=ZsGokzwIky0D9BjtjvvqPGwETsIcayDdnqkAVHKoyijh9ffWdEydoiyDCbxDHZdi2F
         5tJRtK+zLHT50k5PbRNxxiYy/CuTnPJNKCHiZSuximjIiGJtRaC+GP+O2gJLeWzdVyHF
         W0BuugbhUpf6NhZGOtDzi14kg7JfqQXc2YF+VMgZ6rXMoGPOX+NjRxFfAiPS4oS6yT6+
         nzdvMcVvBsdMVhspjYYdxjM0ZaxhFuIJNLyUS2SqCxvA1ivzufHApxt0YpTNMlYc1FTb
         yc3lR7yWeAt9oL2C/9H0UmcK3e8NKhQFof/R03v6207ijc7nF7Jlw8K6BPP4DQonCNv8
         /PPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxphy8CHYGmSYLeF+4aVxz9eD8sbnYEeEsnAPknl37Tz8y0bhjabE7Fsn/l7wUadamGiMfpS0rBXsqhPN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z98hTZYDMArM0EVGjiYoalDraBV1CIi7fUAQaSAILvF1KF4cYpD
	GYmmbhEqzvDC/fGXfMkxjEXGRN2wYi5lzKKqM/OS+snzDGDenEkouJDe
X-Gm-Gg: AYBFou2rYChedlVjgwsno2/aRAqArtNkNcV8HHdouos1vVjnZSIJ2q/Y8JKxoHQyiwk
	krUx7U6g1Q1KPeteFhx75PV75ocnNv2UT+gsc4GKccg23F+BDTE3IdEszCuepP8SE1aNZHOykbK
	p2AL/QpK2lCOn7YgVj58WNNJbqWYTIo+CHqS2PYhaAUOZzzwMi3LguMC9DXiIcXjOKWkGzRdza0
	np78hMCvraJzakeJayQY1mESErS8+5BTZtPnfhFSZGOS1kBp9yTJI2zW+9XB+umBswhAdMPKjIl
	Nhuz0ofNHIJ3QCeSULzrkwPj+P9DG2R3YR/tS9bWLUTBMM2TXlD0owFjIWN1TKyBMzvdu69HCem
	s0XbQGuzwgG56GoJmiDoyn/XZeDfPJy7Xw+axE1djEUSWU2KwUW+eERvwwzmYKsLbIT2EIgdfX+
	0gHmMWzdCYand3sD3fg6DzzqIZOus92cX1KSXzXkpyX8vEwRJF/rWkimlUbRMORORYvKno05pnI
	pK+9XTXE9tkb1/RR9PoyYb51mBmjd4x3v34DEx4jJ0X5eN9ffn1r/M028un1kCwZx13f7wGnfZ8
	RenGZdmFRzqZzvLYcVD3L97z7nEFzPZEWDzgK3BuDb0KVe+IzXXFLw==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr42004728f8f.46.1793826555914;
        Wed, 04 Nov 2026 13:09:15 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm5654092f8f.10.2026.11.04.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:15 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:59 +0100
Subject: [PATCH v2 13/27] selftests/landlock: Fix memory leak in
 audit_init_filter_exe()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-13-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

audit_init_filter_exe() does not free the buffer returned by realpath(3)
when the path is too long.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index d428ce802f49..1e533b4e26db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -507,8 +507,10 @@ static int audit_init_filter_exe(struct audit_filter *filter, const char *path)
 
 	/* No need for the terminating NULL byte. */
 	filter->exe_len = strlen(absolute_path);
-	if (filter->exe_len > sizeof(filter->exe))
+	if (filter->exe_len > sizeof(filter->exe)) {
+		free(absolute_path);
 		return -E2BIG;
+	}
 
 	memcpy(filter->exe, absolute_path, filter->exe_len);
 	free(absolute_path);

-- 
2.56.0


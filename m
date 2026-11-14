Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675434;
	b=BWKKF4gckmVLm/qMb9ZQqI1LEoUVDM3/xrcOVGri4Q1I5BaTaFVpUkS2Mvz+GZZ0xQKj
	 pEEUichRGme1YIJ0v7reEANH1ShQ3BtYESxMA6bcv1q8Vasxif2cZtSX+7aDEGWmbbgEb
	 dl0FyaOSB2D4U2QQtZe8MSu0pKOswcfWpY0NsnH9lm/NONMj3Y8Gv4DVWgdrY1sUUQURe
	 2Ay+4P3nzNZPa3ZlGdkBlSRu3xKty/K3IxE0bjoSfdQ9n6isEWccq07pMEaAUBQRyskoq
	 9L017VTppdXz9v2scBekm34tmODIR21SdIcHJs+xVcgIuOyTYCp23Xgqg10H4dcsrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xh/JynNTX1fmwNcfG4bQeiu1bsJt9TMh9rc1KBQiQOg=;
	b=fpg240vqk8zqyauoXkSeoyXi1iwFTfquzfYKfHlK/J/Mo+pTdC7VoDzlwHnLYGbPvji6
	 1tCxOolJUv96Sk/IKNOQ7hNPDqDQbtoHuEubUu48VoILe1O4Ar+AONxqEps3UVrtxHG25
	 bfVtZyJrwv1ebQzKXuuXPY+RUln4IPtrWmykUBjFyvqORLSD/axtXa5CYYIgIUK/kqCcR
	 sKcMf8kqtwVex9d/Rjw7r2cSxiOxCt53uQrE8jSxChhOUlfuhQhX72BmJYEdtW2aOrdKl
	 5lqzJrBQ15ZqKguWN6FIZifjNp90OTW50r6xnKmgtKKd3rmWj8Zl9NQsHzpdedqJuhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuzOaLcK;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E4606A893
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6E4606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuzOaLcK
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso2097138e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675432; x=1795280232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh/JynNTX1fmwNcfG4bQeiu1bsJt9TMh9rc1KBQiQOg=;
        b=VuzOaLcKnB47CFlSxaNBkrfoGNLdGbdhWvHVyaPsHRVhzIoRRgixcyDQAGiGA1ofU4
         /a2hJbeZ/jq//pd70uWzpPOhAeUcD5JMFf9PoPMKA9azhSGpTaXJCe7fqWNiGzR12N41
         bCqeJPgYLB7/pMW5jJOSOlghZ/BVyCs+XTxiTQLGRv2aUum1wDgFlZbopC0r9FAXDJjY
         ZDGQ23CVhKny3xcdvwTOvqHKeX/xKcWqJRyBMvIRw3gDfKZYUVl4F9XGaZnfKI9c2qd5
         j9B5A8Xqpo09JUSYfSfKdRX/qeNcVhVacSpNazwiut4JWXmMC3ccEMLByoYlEOISi/Gj
         ftew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675432; x=1795280232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh/JynNTX1fmwNcfG4bQeiu1bsJt9TMh9rc1KBQiQOg=;
        b=c/tpuE6GUcOGwZBsUbIo3NffQKcTtSl2celN9/6nDmg0rpohFfYM+UiGjizCJGFXtM
         24hDFJGV5/KluvxCNqRTRA51EpLXSLedxpusF2EjxOk2/5gVSZjQFCDIfZXfk0WoKkdD
         +phWx55VsleLs1GuBLhPrTkIL3kQANHL4wSpRwz3IGnHM0RYcUgkL/tM5JrJZ5qI83JO
         8mnEjoZ0JNRPVlQlKhDAOWDwrrTdp0yljVXCDHq3y+E3Fcyvjr8upokAAo6bYUXkf4VG
         VlWRmWMEXnrCnsFx5ltkuIEjnHvzC8uX5UHUFlMYNdFmeGIjm2+6J7WXLB7zoUK0izQK
         f6Zg==
X-Gm-Message-State: APuU4Z9kOe4VhpHkYiCv/PAoKY/0bfqh7eLyYLNRRFUea+PxV6qTavEU
	odi+v680oxjLb7GLANqkKV+Aabiv7hgT9G6agQghdsclk8U0mUACdAZcwFE/v9SF39DNH5nS
X-Gm-Gg: AYBFou3+S/KL/sw1nCNiSPe9P3JWZgW5bQmdC+goG2/cSBRwYyR2nJ4KUx1V9f0WWlB
	nr3sb5NYQ4W8l3p8oPpzZeO2+qg+eZy6yex92BpTmdEhimNzPXICdIkX5+rIvYrEzS00zC9eAcC
	4nH3YOyEEjAJhMMzyCAFFJl3rrHzIpuMiuFAXaKpD2Uvuqxifmv0lxTTkpQjaZNyeVf7ffkPYqL
	16gMmb0V5onJCbfAU9UNuA0DTwRVfZXWvyri058d8bW5DBEd/F12hq3sajda4bj3VTdCZRWl2KD
	zTgKKTY62mFz5AErzvMZAgJ85wt6K+b4iWZAwF7XmGLyTIsMbUgzhH7EB3xny+Ig6zTBKfwnR95
	SWlWZzMOqWVocpIFp26lZP3Hh0DK7+6PVTxZf/DZEXnxYMC0+igBMS0dBPEmMFY5I8CduREzYWN
	0n26+luhscyZlatPtDz7cRhOoolubolMjIeg3qtaa/lWTb0qCOd8jpjdA+RP1dH9qrz8uQ6QLgG
	mEUbvSlNqYcPfmy7v4lONB5zlDkdto6WirY+3t8aFo5jnzeDQiwXR0UAXBfDj+xxf2iWQTf/HVx
	d6s+aNlvKGNSa8tlSE3eJoVK5fEtv320RrGtb+9BPUtqL3noNI4LbGBpaVblUPxY+ekcRX2LR4p
	hmbXf/kYEew==
X-Received: by 2002:a05:6512:4007:b0:5bf:cabe:23b6 with SMTP id 2adb3069b0e04-5c1709a0ec5mr1889491e87.33.1794675432269;
        Sat, 14 Nov 2026 08:57:12 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:11 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] start_kernel: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:53 +0400
Message-ID: <20261114165612.368785-14-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/start_kernel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/start_kernel.h b/include/linux/start_kernel.h
index 09f994ac8..5855467ca 100644
--- a/include/linux/start_kernel.h
+++ b/include/linux/start_kernel.h
@@ -8,6 +8,6 @@
 /* Define the prototype for start_kernel here, rather than cluttering
    up something else. */
 
-extern asmlinkage void __init __noreturn start_kernel(void);
+asmlinkage void __init __noreturn start_kernel(void);
 
 #endif /* _LINUX_START_KERNEL_H */
-- 
2.56.1


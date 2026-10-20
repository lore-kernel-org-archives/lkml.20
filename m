Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530403;
	b=SJbk318vP7N/BAD/Tv09ffK2F8u4+IEJIcGaG4DhtCmYrODXdmGaazJnm8rFRCt74CSF
	 qQIHDG8cQy5RkgjzlQZSWv5H4rRlgWOEBd50Xd514FJYIDFBycFnM+o4reeHEgX/Z5EwZ
	 kpduTL+87s3YhoWPCGnzqrvT6Ogc9gnka6hALZSZ88iY0Bnvn0QHOMR0I012p0qd4kznP
	 rSH2LR61g/9SGeZPOHscduJaQcym/vPhcR4orcHsBnKpDEoze9i9ifvfUyA38mah2x+R+
	 xXTnqqtSyZ5Cn450c+MjPynvY1tRJzcMR0IulLdZSftqkwj/GR5mr0leQdSDi9Y+fmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+d6eEbZKJ/aNP1yn+6FnJEHBwBfqiaSaba+IM01vpDY=;
	b=tgh9u/8h4hsTlCGQk0DZUEiUqVDCnbENxRN+NigRPrm/cBlRSVhD2QNYUjRqjK72tJgg
	 WQfLitPW/Eiqp3/ak0nWuIt1x4XmoW5g7jinAJx27EvGcpc4bI45EpbZfjTpOJGgVHWf8
	 wvsu7c9YS+Rwd5tnCzbKLqJ206odjhoMfDljO62Rodx01PotbHo0ExmpDrzkNmYRZw9OX
	 UtkEMI29JfKO6sZUorWEN1IUQMbp1+dgIpc5WJZZ/To1qnUEahQvGb4BlJ9nB6jj5oIid
	 6GsD2Yhza+pCRg1W6+Vw+wjNdKYDkSCGdFTotnxUmAc6rCoGMgQQzVBsQ7XOxcjeVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LvzNWWQw;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96D606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF96D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LvzNWWQw
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35fad13ca97so214397eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792530402; x=1793135202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+d6eEbZKJ/aNP1yn+6FnJEHBwBfqiaSaba+IM01vpDY=;
        b=LvzNWWQwUrnlVEXkdxA1pQnsUttbPFEoCibBVemm1J2KWDVc9LAjs08388l95wtvNY
         C9nsApf9w0rfW33dyL9NJiZ+wTnHPWqyWuU2xw6q82oWMW2JcifkTYP75TUgUyJLPcNL
         atwsqngnfR5TiRmKRHtzA7IsKLYRze9YSvpdamh2O/2OMpgPj6tQb9dpEFSu/sNBs6oS
         gvJz9eqNQsmmpk4DC07BukVzEWdmNO2GbGPn5h7936WTPrAhLr5NlSSkBS4MCKvl47pR
         ixsq2XKLrj3SGn8wwejV421oTHkuXB15XzqAh0dFnPfJGv4V/WKt77wiyzCa/bGuyoeQ
         2AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530402; x=1793135202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+d6eEbZKJ/aNP1yn+6FnJEHBwBfqiaSaba+IM01vpDY=;
        b=OC3BZfyVPGivfMl75jwjAeB2JRAYkykaPX5H6pezitye+kgz0SVPP4HUp6M1j5l8DH
         Uo1OviOZNsX2fprmGTs+NR1WVCFS/Fp4Sx5Qtk2xm3Jy8JwrtAOnQEY2OwBLs1+UPQlK
         tSP9WHXdtfLOjz4eT8BO3j1EScI32fhXqo2MfcK97/zO25w5v/0BaMtqJKa2HIvnQgnN
         bHekvQkbCA3LfO26A0KIXK8+e9pB8nyoUTBPdAiitLNHdp50Xb42q4K1F7e5FeQXiVX2
         G33kQFyWSWnHmMOFoWMzXKLxE4AANJOSJ3TlM83sHlwAoAD/iKMgJGacTZtSgGokrYNw
         jfug==
X-Forwarded-Encrypted: i=1; AKwUvBwVy2e1gcKVeFriXMt+tZXE8Ia66eR8b+Brdq31prJ0eqxSg9a0RJ7V2D0FIwaoaCI1qxQuOr5c4n27jHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Nzyb38EszNbaoq/J7KEFVnxCqFphsNyYu2F0yG9QPXexkArO
	rvJtWZeo6dpmgrygqfZaKWtOLZgdZfGaAT9d2nwdFSzX+V4zuI/eSjMx
X-Gm-Gg: AYBFou0dzup3yt4cHHgNpWBtVxwkwg8ThEoB38wTnIIlcj8XjW0t/ZCZDsFgsdxxFrq
	+qeCBPHPYgqNfwt82GgT/mMq4angRM9eCh4bhEJ8OicGzGeJPqZaAH2B8Dlce37J/gAyEc1w0jZ
	UJx0gRGCBzmL3nRnFhWQT9AQ0H+uTBGagzzOH52/ym/xp0sT5zMJvos2J8fetHh4HSgQPTxiY0u
	18XKCmL6tbFXQ2AXsE0RM+B086/IC++EN6LPVLJuJwVoOqZ3gzCxDZvENyF04K/FEJivQ1YM2v3
	bQBCnPgaLgVUOL9LRjOrjKfA50cVYfCCygu7GAh594ahaDRguG19oIeNPF5cwGootEldBKz/GCa
	wQBTU0zbIiDX/QnLTubHJ3M1AFGmSYMb109ug72YE/mikGNGEqek1rp6fu8NimWhARQhn2UK6cp
	5LOqZAwgJpawF+7CI7Sh0k4A87DSVAbwZkUpunxTevmO6jdVwoLKVZt0KA/1hrshStLwoEEUV4E
	w/9lUOnfIFasSD5XOLDAk5t7g==
X-Received: by 2002:a05:7301:4549:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3674df47e40mr439488eec.32.1792530401643;
        Tue, 20 Oct 2026 14:06:41 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm1703196eec.2.2026.10.20.14.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:06:41 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: arnd@arndb.de
Cc: akpm@linux-foundation.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] compat: Avoid double rounding in times()
Date: Tue, 20 Oct 2026 21:01:57 +0000
Message-ID: <20261020210157.52057-1-dennylin0707@gmail.com>
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

do_sys_times() already converts CPU time to USER_HZ ticks. The compat
path converts each value back to jiffies before converting it to
COMPAT_USER_HZ. This round trip can lose precision even when the two
userspace rates match.

With HZ=250 and USER_HZ=COMPAT_USER_HZ=100, one user tick becomes two
jiffies and then zero compat ticks. Every odd tick count loses one
tick, so any of the four tms fields can underreport CPU time by an
additional 10 ms.

Return the value directly when the native and compat units match. Keep
the existing conversion for differing rates.

Fixes: f06febc96ba8 ("timers: fix itimer/many thread hang")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/sys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sys.c b/kernel/sys.c
index 35b538ba843c..755bfa5ccd92 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1077,6 +1077,9 @@ SYSCALL_DEFINE1(times, struct tms __user *, tbuf)
 #ifdef CONFIG_COMPAT
 static compat_clock_t clock_t_to_compat_clock_t(clock_t x)
 {
+	if (USER_HZ == COMPAT_USER_HZ)
+		return x;
+
 	return compat_jiffies_to_clock_t(clock_t_to_jiffies(x));
 }
 

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0


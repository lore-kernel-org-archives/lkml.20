Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264124052AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268002; cv=none; b=fYb1BTXhd9ezZoayn9cWnzvOrKGMGPAO4x8V5BMPEdaZBgGGR1iOvWVxGTrJwiO+LyiI1mvaWrhqetRZKe3gmB6RdMDhJDfgPZksOqj8OnSMdXxg0wdLcn3QL0cTKmk9U3yOo8RB5u8tDoN8HuJgnY/Qr0RqIySYjACBSjkeFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268002; c=relaxed/simple;
	bh=8oafQKn5E1afmjR0jBaThKt8NuujDHb/1wpNQn0jknc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByYiR7P8Ue6JaPUBdmsDoSScFc+PeFLuxBcF1CDm/G6oEwXwDx1cwJNhhzEyLAaOS3kF+TwQNvSCGGKJUQsGMP4rR1TvYV4Zr9xue7o+mKBrBj5RYN73tBk1DMu8yqO4YMos9c/c/Qwg9PoFNSuN9ySEHOVz/IjwzZnKai73Fws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6Btcb3b; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6Btcb3b"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8565d77c277so45888877b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268000; x=1788872800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7XTCNgZ64MJCC1OTIr3HJaK9bEsF0FVXR7920AQRVk=;
        b=R6Btcb3brXw0ZKyH1xCJstdChuCpgMpeYfUIsBtKfGAR7lkq5AQ/CeYmxfwmTsOLtn
         DDzUZvH95Jik2Kk1/VsnuWNSLvZDx1jUfhI9PUXfqagtgBHxkxv4WE65xxZoqXJZnTzM
         BNGuyx4QOHNUPLbjJaq3EnshgS4maAQhID4hzwXrYaPyxh6KxR/1rXhiuRvReioaZU6H
         rfqJ386QyyT85P02c5suurWspHRq0BtZYvEbvR3QGQt9yE4BExmbHkZS+UyUsxDNmzKC
         l5qKc6tOIDF/tX31HyqbePEjCmcarbc0lnnjqODh6G+Pv/i2gQ1/s6USKxtcwqhcxpQT
         A2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268000; x=1788872800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7XTCNgZ64MJCC1OTIr3HJaK9bEsF0FVXR7920AQRVk=;
        b=Hmb2hyN69cgmajA+o0dXc8pf7q8JEsd2IC7NZS4jBxNJ5hNVFoIJyFVyz6JKaBjmME
         DAACU1AsJDMB7sxhiZW1febwpYRoLFB6kJ7XzbSKZXv2m96OG2o7c3dW8Xd4lk7kDK8n
         Yofe3wsXnjrDaIh/z9ZLinfl7UVvonJI3/nRJG2IHut88oQP0MAmNqTw8oiVqXRM/Jle
         mh9J3UBNDwekwyPZnqVFpMQjuBCeLfTXa2lPlFhaE7cCB/iElG4MVenvf3O1UxOD4oEp
         XjYR7IoBLr2t67yKTTpuJVr1u6ssrGnJCiVqmbEAm5QkT97a8gseUbTOWdght3YEgg/x
         6GpQ==
X-Forwarded-Encrypted: i=1; AKwUvByW5WKxiHOQW8NmAwvZhNTUpxOKKO/JTLImzIo7aIQ4bN41n55K0kOyuhx8gAHZngrlyh/TJd3TFIdaVvE=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ctt+3pZ5rNz5gRSH+zJua721FZFtx/jnAd/MmdtlfgZhkCq0
	Xpf9DmhAWhQShWTW8q4a5tTXBQE49nfcdLL7VArtDtsfs7uzir5s1E1i
X-Gm-Gg: AYBFou30aTvoyyb4Ty9zSgQkYfCs175N/lxigpEbcPuaxxATHJVTyx9IoCqTcNvmAhu
	4uA0+ROWcJU2SKNpcTqe0eeXMHxBnvy4x+hIMwQQoA13BgdXDDQAXWyqIcaDnltvRuMh9xPAGL0
	0da3Zt7er4B1ZQZyOP+51gePJVy6spF1hqzGFX+iQm0PIuwrR1NXWplTs14beFBeZarea7TXRH2
	vIAkE9Qe+FRukezghHRqOYcpN9NOmWGeB2b0eSPf2EPso2xyMVb7c9e9mhrZCByldaUz9JffRW0
	NLc30Ig9DxxrCZt5xDR3MxQEw/3ZKjMnRm7fVGKUoEptiG6NrTmpl6B7nZvdTcT/laY4XrtceZE
	yxDyx32kVgP3Iy5j7NotQG76BRd686PbSxUxA1n6PgFdw/pxG+b1s7QUcYodem9SxnIv17FpzJi
	ytPruRtpbQjHEejA/H8t6lG8kHvlVs3/f3U73LkwjJQyKVCDJPwlTSdhfz1xydGolQ
X-Received: by 2002:a05:690c:4005:b0:856:98e2:6e9b with SMTP id 00721157ae682-85d69640f36mr102875907b3.5.1788267999872;
        Tue, 01 Sep 2026 06:06:39 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1cd5bsm73290547b3.17.2026.09.01.06.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:06:39 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 2/2] Input: zero ff_effect before compat copy in input_ff_effect_from_user
Date: Tue,  1 Sep 2026 10:06:28 -0300
Message-ID: <20260901130629.24078-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901130629.24078-1-ivanrwcm25@gmail.com>
References: <20260901130629.24078-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the compat path input_ff_effect_from_user() aliases the caller's
native struct ff_effect with the smaller struct ff_effect_compat and
copies only the compat sized prefix:

	compat_effect = (struct ff_effect_compat *)effect;

	if (copy_from_user(compat_effect, buffer,
			   sizeof(struct ff_effect_compat)))

The tail of the native structure is never written. Callers pass an
uninitialized on-stack object, for example evdev_do_ioctl() for
EVIOCSFF, so those bytes keep their previous stack contents.
input_ff_upload() then stores the full native structure in
ff->effects[id], from where a uinput based force feedback daemon can
read it back via UI_BEGIN_FF_UPLOAD, disclosing kernel stack memory to
userspace.

Zero the effect before the compat copy.

Fixes: 2d56f3a32c0e ("Input: refactor evdev 32bit compat to be shareable with uinput")
Cc: stable@vger.kernel.org
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/input/input-compat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/input-compat.c b/drivers/input/input-compat.c
index a5043193ead8..8860a0730294 100644
--- a/drivers/input/input-compat.c
+++ b/drivers/input/input-compat.c
@@ -76,6 +76,8 @@ int input_ff_effect_from_user(const char __user *buffer, size_t size,
 		 */
 		compat_effect = (struct ff_effect_compat *)effect;
 
+		memset(effect, 0, sizeof(*effect));
+
 		if (copy_from_user(compat_effect, buffer,
 				   sizeof(struct ff_effect_compat)))
 			return -EFAULT;
-- 
2.43.0


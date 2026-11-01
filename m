Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563653;
	b=MHXLCvenpDcp69XhQbEqPrJa5BwrT/D6IHFlJR3aGDDnVqsX9BHf0sHhxEscwjZcqNIa
	 efbznmTtK92nNOgPHLlNunzwHsnOgoXdfBo12C+Gft81xkc8fCkLbm5bhfLeyprjidaLQ
	 TZyHXUr4Zaz4K0CyIj2ii+JHNoLGOF4aK0rhBi7JNa+rft5hiu45EjtQsmUu2MDyHRIiF
	 mj61CL1mTKOk7I6OCcJwYYF8XQxqYXJH8FoL9QVw30cMOsE3YDSI99gPdGIO3ie6lZPpB
	 Yj8kPJA+N70MhxGy/dh/ZjblSctD3dkpexyR0Qq8+m7yJp20U6LmGG6PesKy3IYGj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=26V9a9aMGmLVeqkqAbfZgzyyhjfF3Os6qezAyBkdxJI=;
	b=gky12uHuEnRvkm2sldCKcz/3WAvL2qLA9wk+rp1c9w1eNlmt4hwz9lob38ESZ5Fd1qDC
	 XHk/4wHGDTq/5oZ2jI8RPjQvj38tktqn8vEnoThZar1LlFTgbgqqNqhpDkkZGWWXOguVU
	 f+H94ekAMZ1MfjNumKbLThL/6yj9L5gQQUHirJBLBa2yoYmhQL1KYfpdvOqT9a+cROVVw
	 JouTKHc1ngIB5swZCK1PxSVTstqDD5R2V8B5n1piyO1kZnVGPYjWJBx0sVKT19Ra0iK9G
	 bZodRwim8lMgec9XJ4wd8Esm6h6hKveQCwuwKfJED+EMsrufwlpXHK+JrLSxRFdEETg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H97WD1p6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B30606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B30606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H97WD1p6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so2875272eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563652; x=1794168452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26V9a9aMGmLVeqkqAbfZgzyyhjfF3Os6qezAyBkdxJI=;
        b=H97WD1p6d5/EVI7F57TkMr97HS82HTIdDZuh7Sw77hyT1l6Vq6Ethtfh77aGCKH1NH
         goxg0jFmw02vjTXGwFkETieEgB11VZliuMuh9DddXIYEr7DLKfns7FPqTNWmyeNZgf16
         Lntlkx+e1ARIHqW4vzzcFHuaqHuPUb2QUgk+gFJz2igoO8hdbLpHwuElOf4JbiMr14Bs
         +ThgFK3bZz4Jz3+d/buaomWz5TKVZqNTk1ZaGPSXOz1yEfQgWTQ2GH2G0vxyD1Hxvy9Y
         9k268S6SvWRKCp+Ve4cwabuwZNryq3EVV1AzznMKJ4bHxTzV9pRNqvVJL0REvxZ6qO0f
         brsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563652; x=1794168452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26V9a9aMGmLVeqkqAbfZgzyyhjfF3Os6qezAyBkdxJI=;
        b=uVhIGo2ua5LAiYOjaVfq7ISklSmBZCdHrdtR/r/Ho/linclH/uajFH+b6I2S/jIXHh
         Ox5vy2L2C6DiybFzaGp1fEcvi3TMJuI+VBkmivQ/I2hNXkkbPIx7z3vEDQHoUvOzg1Q3
         NAQuA+INlHYRrIi57VbNQNTPPAb4ZLUXbtEn2CXdWnxOKx3/No/JMnvl3g9f7y6fafzY
         I42cLvawzwchJHb7ozFUm7zvdB9GHcfM9+BlJ4fm+qiQ9WhuU+YbQXXKn/2k1qBXmjSd
         Wo9wOUFUoohiOW1X1ZounMp3xscfaIPVgODCfxE4U3VwJ40wTs65l8ZkO+TtgZT6SKOu
         V6aA==
X-Forwarded-Encrypted: i=1; AKwUvByRixdw+zYZzjzDCzeuXEp2kqlIbL5D1gjGEtZ3zYFazQ5xpwAj1atDJeJIyzqV/IGFNgoPiUIR254EAJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ySqED1DineD2mb1n88HP/HmKPOnn07DAo8xRSdvvxKejot0B3
	Muakivv9U5adWVsn1UFyOV91I22RUSNTgWB3XTxwZV0LFq05N/a8lPTBFCf+Nw==
X-Gm-Gg: AYBFou30tk/ep7COpNoXGoTVXNuJ7+kA0wzSPpa1FvSR9t14DuxZxRnadBdlQ/ORKyo
	xOwcY2TNXL0jBtP+hwlX+Kht2PEtMt5ktG1hXbCaOhHQhft5DekLL5wKUmu/t0MuIbtCX57raGN
	oFo7Sd61clhRxUSvFiFJ7OA9jHcIvRdGxW6lMbypaBB5svwC9hZM+zJugGIHdKrHcJUDpuqnSK2
	G/RFRwHHSGHGXac6ohpv7FjXl93S6s7xE8YPm+gBmskavR2cYloDJzqiswDrF5NybHcOYH6HiXy
	7Y4jLrZBi3wcvMgQbbXGg9Zze9vBsUA5wsdgdSrViRoQxsCKEIe9F76CIbQbPpsrIrHrYKO1hfG
	4eACJmTqeV9dfrOP+gnTef/tz4fXErgb54e1IAqDV90wgE9MvIYOQ9eArTl28RdciBnqrN6wTIa
	FkpmJO0hzzU54C5/Nx5GipO0DYjjzth2Jwn4ig9rbQDHVVqnd+Lxf7aYipdudP/Hl/hCxfjo/gn
	I2Lo5lZJmMGESk4Aicoth5YaeUUnuD3rh+3HW8Z+gHnK36WN1xxrg76Sufb+cWeeVtHxzHqOMK8
	VI4pULVOzBr0RxWrT6NOmC5JcpDJOWAHScydZtynz/C01P8Xt8htm5EboCpsL49+dW5bnS+Ng7p
	YfXnlIp6ZI9s=
X-Received: by 2002:a05:7301:4290:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36a4238989dmr12095636eec.7.1793563652095;
        Sun, 01 Nov 2026 12:07:32 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm35052920eec.26.2026.11.01.12.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:07:31 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH] file: Use release ordering in file_ref_put()
Date: Sun,  1 Nov 2026 12:07:28 -0800
Message-ID: <20261101200729.2872806-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
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

file_ref_put() uses a fully ordered atomic decrement for every put,
although it only requires release ordering for the decrement.
Acquire ordering is needed only when the caller may destroy the file.
On that path, __file_ref_put() already executes
smp_acquire__after_ctrl_dep() after successfully changing the count
to FILE_REF_DEAD.

Use atomic_long_dec_return_release() for the common decrement. On
arm64 LSE this changes the fput() instruction from LDADDAL to LDADDL,
so subsequent independent loads need not wait for an acquire that
the common path does not require.

A pipe workload that performs 20,000 write/read pairs while a sleeping
helper keeps the file table shared runs in 2.92% fewer cycles with
this change.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 include/linux/file_ref.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/file_ref.h b/include/linux/file_ref.h
index 31551e4cb8f3..a5e262d7083c 100644
--- a/include/linux/file_ref.h
+++ b/include/linux/file_ref.h
@@ -154,7 +154,7 @@ static __always_inline __must_check bool file_ref_put(file_ref_t *ref)
 	 * fails then we need to handle the last reference drop and
 	 * cases inside the saturation and dead zones.
 	 */
-	cnt = atomic_long_dec_return(&ref->refcnt);
+	cnt = atomic_long_dec_return_release(&ref->refcnt);
 	if (cnt >= 0)
 		return false;
 	return __file_ref_put(ref, cnt);
-- 
2.47.3


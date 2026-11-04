Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777969;
	b=4FnrIyqRXpZcyyFLkFmEzTCBmHL/a8V8DfAIp6gKSV7DE9MQ5dDdfmKrqDsNU5ZfLT4Q
	 cvATbT/3yH4P9bNU1ZdM5npwtHjtX0iT9OpyQ1FKt4tvBvzOfXCpUHFUxrdNIvVmViDCH
	 rXt35Q6P3FyVAojBIxFVFEFAQFml1ncELZ1Ohhhbcj/i7nQ+dhQn8kU49u8zIl/cQ2+hA
	 NZXAufZcuH8OH5wLw1wyZfY6XqUZI5S46YWSLLCwot9Jt48CnfkDWrFxhog7NvR5xH7HV
	 rOubPLFybKYOn5QEJU4HKhh/PbUMoHjoLBAos12zIl8Fb+zcStgBnbrGad5W04BkAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9EAdgIQz4nvohbB3aPtkZzQ/pmklaWN6Bcgm+2iXAkI=;
	b=f28gff6cistwwiSwGqZoOVfsNygnBzEZKd/RAkIR371pN6dOKY9XyuSzWd1EsSEuR7HU
	 WVjilZvv/acrsMyq74y2nCizaEbUnT6UL5S46ucHCnaWRsx7q6/tF1ub/l+80s0jek/kE
	 a6SID0Bzz7RutNVhW7R+wEI7L5Y9c2iYe3cgntm8cWd0BF3mlfGQjYlUyJKyBNrxbcgn0
	 krF+0s0PqkGxOBtjDqh83v9/O/wMEWD7flG39V2krQHn6QDszHaDtJblWf18Hlvmvuy+7
	 ZGRHdKWXNxZZt6zXAwnDCklq1NyaKzTqaBd7kBzzHfRirvO0sXZXpfAH4V8UbnqiIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9ZKdorX;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79F606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE79F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9ZKdorX
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06e79e152so242609b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777968; x=1794382768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EAdgIQz4nvohbB3aPtkZzQ/pmklaWN6Bcgm+2iXAkI=;
        b=T9ZKdorXcu2PN/Ts45n100OvbbaHHylreUNCC21E0+EHUysrwm/Ili6ngy+g8YhtXl
         NIs2c2uZAB075C2h2myPime20E88o3Noc8G7FSKFken20TJ0V0qo+1du7pSjvVmR7iFc
         wDlxIxmn1pjEvq4mgo/oitPQib34aRampzJPgdHewghlRBH529icz1zMmqqgPRGoQmf4
         28ftx2KAi/nheOw45yK9r65fkyZKP0CTVpcNOdUcoIm8uYahM7sC5ME+gg852Wavq8FD
         QjBm6w+/fUM8p0tPoqeyuyfEvrk1Fd951DkHhZ8icg02aRt98L4IfUcvL2sMxFnnMRuz
         PpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777968; x=1794382768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EAdgIQz4nvohbB3aPtkZzQ/pmklaWN6Bcgm+2iXAkI=;
        b=aCJ6VOP5C7bgxw0hMpb0YjjsN4o3VQt3RGpFrL1qr4qTCtUDGlo6wRVxjI33rC6RH7
         xhbvv3rsSNmdmtDtwlp16mI37KD8ubqrIehNVUA3VVvPDe41VsBR7iuokrHUBdt3jM0s
         VxiXh1UiH+K2zC95Z/HqRQJMLnXI65TS6RI+1EWVVkAkTsja4H7fv1pg6EsfWCamIDgv
         tsFHSrTFOQ7QR1UX1fVjDHpccotrrgByqE1yBlc+/YOvqh3NpxcCqrakRkBPnAfbMofu
         6pHhGmdpM6+l+wSujnV4y/TNWlLW8z2ZBWqgQNQVVnhxKFeU0xbf2pd5gGkKpJaiy8k4
         Jv4A==
X-Forwarded-Encrypted: i=1; AKwUvByjBEhsXe0O4gmsLctHek70ODciAl+yRa1Y36vYg2Lw+snfDfJsLYPwER/h4zvGvMlo1iaJzw4yQehzwBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91M2abNEt+BzJleDisdA31BGYCQqW37KK9XrrM3oavPXBDyVyD
	a1E56D0v8dzY2p2/jZB7ZoYlWcOBJ7v38MIkO9W4at3iusowESQ9ls76
X-Gm-Gg: AYBFou1Eq0WVgkFbOVLrdh32P0e8H39M8giVzMbjmbwqfqWtm0aHOIe/53VbfOBVvWp
	ZMOpqsyNen3DPSNffIRaPccJehX1Hxrljyy1rMcEsii6mt3HBT9EYNhj5BFcINZi+rjW6dR0KaS
	riNe9C80kzU/jqhzamsqxGCH8pn6kbmNkec0K/V8PMZpSnw0lkIqhd5O6IDYPJI9VD/kgry0kta
	spjcgazZ3VQzbIPQGChlJPBXQjk5C7+YoZI/7+kpYnT/D54A/4XAztmI9H+OTX1e+0QEy9TJosu
	YnlGh62ZQFUTuRbu7RINfqhvOTLdV5EETWXWogpT8sVbsKc9DGQXaj0MgCPQaFp41SONVy1vrnR
	vTWCqrAmI20G0TtU092TtvxBsmJ1a4lwN6JL4oRApnrh4gxLDn6bsiygSv4EimUv8kybCiXnKje
	utXxPpCkqKyizxhDGV7phbNBZY3VXNyaMtWoMH8czihNrrV0agHP4r3SK/gabzgg8M44+mN5deB
	bDYB4B3nSDu6eqhzCIHhpCxMpF3waouyF+cb3YjPLNtyBLwaWoJgtntYNDE5/u8njV+J2Jzvos6
	AZf+iqdfY8sAld92FPMLz/L4IgBkfFBVzbiW1vNQ3ZP/OMbTxjKIOYSrkHk93gqoWnDdPp16VkE
	hZQwE8bgQGHF6fLrM7YfhHOI=
X-Received: by 2002:a05:6a00:4f8c:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a9bf0472a8mr12029053b3a.32.1793777967924;
        Tue, 03 Nov 2026 23:39:27 -0800 (PST)
Received: from localhost ([103.109.144.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91d32sm543783b3a.25.2026.11.03.23.39.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:39:27 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Zhiqi Zhang <zhiqizhangg@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/bootconfig: Test listing keys at the maximum depth
Date: Wed,  4 Nov 2026 15:37:42 +0800
Message-ID: <20261104073742.21202-3-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104073742.21202-1-zhiqizhangg@gmail.com>
References: <20261104073742.21202-1-zhiqizhangg@gmail.com>
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

Check that a key with 16 components can be attached to an initrd and
listed in full, and that a key with 17 components is still rejected.
Compare the complete list output instead of relying on the tool's
exit status: a failed key composition currently stops listing without
changing that status.

The existing good sample checks exercise the compact tree renderer,
which does not use xbc_node_compose_key_after() and therefore misses
its depth boundary error.

I wrote and ran these regression tests after reviewing the fix.

Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/bootconfig/test-bootconfig.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index 530ce7e28d63..d19747e47890 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -100,6 +100,16 @@ xpass $BOOTCONF -a $TEMPCONF $INITRD
 printf "badnode\n" >> $TEMPCONF
 xfail $BOOTCONF -a $TEMPCONF $INITRD
 
+echo "Max key depth check"
+
+printf 'a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p = "value"\n' > $TEMPCONF
+xpass $BOOTCONF -a $TEMPCONF $INITRD
+$BOOTCONF -l $INITRD > $OUTFILE
+xpass cmp $TEMPCONF $OUTFILE
+
+printf 'a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q = "value"\n' > $TEMPCONF
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+
 echo "Max filesize check"
 
 # Max size is 32767 (including terminal byte)
-- 
2.54.0 (Apple Git-157)


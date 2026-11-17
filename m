Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908625;
	b=SkhLCljkZBqJ4hEht5xh69Ro8CPUS4IKhrvmNDv1UVnhPXBK5yQVAMBHQDTDtrANnIKt
	 QOAwolYVJ/jDviAOWcmfVIDNqa7+l/iUzY3cW6sFzBMhjF93jS+6TWtagCTXTnixgQWEg
	 WzsM+BJsB4KSQrc0lc0VNvSBJwRQWxd0QRqOoc+ltqO5HELFoak9kQp2CQ3ickS/L6Pnt
	 OI7szeDSeHOqwtNMVlg9j46uyC/EsFlk0Gvw/w6JndCSCFjhZwPuY6kXJlW+CYroO9JpN
	 n6+lQ9/kRl3FTvOEyEGM9Aarkp52VYp0XhMHETjpkPLhuD5vBW/vy8Z3l3d+eYXkdVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sqv/SgQ08rWFoJUPpiruSJD4TJXVLiHEu5SvhVq+K60=;
	b=G7yaPcPqqGW4I2GRZoP4otZXb2Kf7V9FUHAfW0LRb2jJjbwG3TTw0zRe17jz035qGGvB
	 48ZAuy2EqwH6IjxPewtn7TBw+UhWfXIwqKiplQMdLPRpzW3/Pfs63xIfqbvMe8Opyosrj
	 vDpueq/Mdzll+v0k6kqc+TN/42beNzmZyOrwjpT15Y3c8Zj6FmJ6VVrMUYpveAvj+YLiR
	 2UJv5IKI5ThDTWW3bpKsQ31tpSIZycCTTr2e8L3e7RFQnXz+uMuMI6FQRmpxx5BlL6Lux
	 MUAd+UnOocMex3tuCKPKI2cRUy5slqB66uaNkeC+i8d/K5mukv5qmqo69a1fgnq6j6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqiS2TPY;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FE0606A8B0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FE0606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqiS2TPY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb606491faso16028315e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908623; x=1795513423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sqv/SgQ08rWFoJUPpiruSJD4TJXVLiHEu5SvhVq+K60=;
        b=LqiS2TPYuC4gs3tigs/Oyc6Oe9U6Q2gFu3pjNtN6/eMOyueDEjGlXOjlC2dVN6mbdt
         G2hWzLK7kUuvqKMYgn6+rU5lnq7jJn5otxLOSPEA91S3pgn72pFtY8PWW6NqxLvaKuQh
         +XBEH3oNAVE0AumkmV5yG5VyhNYhI4SkxEIRdIqsZ46aBCiy8NiNITxKYqsfQykUpVXx
         dPfAJQ7WFSGqtVkqQkVqINUp6xsAsF/AC0ws19aFLqIU6pzE10ZLrAMHTzV1DawcFcjz
         KUJvoAQ8FLu2JXJFABjfYHFtxQ5xCd4jF7MboJhPChuuAhOKK484yx82LqsiW4Y7G7Yh
         /fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908623; x=1795513423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sqv/SgQ08rWFoJUPpiruSJD4TJXVLiHEu5SvhVq+K60=;
        b=Tnd4nqcSnRttof3xeSwXim116hZWale4sbM+tipBa2RtE21Meifa5NU4MxTdcmM+gl
         eDoNbG5bLguYShALwJ5bfeqwrVufqe5JWCQRc0MVw532uGCQ/m9fCuOwKxaryxw5mO2w
         PZ/oj8OO2wG6qp9s3CmOSuEt1nQ7jVRGEyVRyNn3jbW/BhNWyjoS0l17wLIrCNpb4UPi
         TMJKAnsNXpUDwTayDy5OkS3po258bNAZEM7bEDXWT7ra0EgZFkyB1p2WjBRdvlVuZJXX
         F2mUWiRpE700ZZQuL4hUHWxCVJu9LLMIFHgJIUtNEjffNQkGw0PfZMieyLpDOYOshlip
         BbtQ==
X-Forwarded-Encrypted: i=1; AL+hErHgZJ1aZGFgFI2mPhAUfuOyUsuiiJd2jHnoZRAzwPtyEnXWKIcVPUkmSeeVABapeB2+6T9zQPyRACbKM5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a7Ryd2luDPJpyyX8ku1ZuEpTzeCihsXma/R4dlL0kTVQUbXAk
	EoaFrafIWyfHr+Swvl8kCKScZw7It+bY4CHMxig7LkMUE9Mw9j4CeuF1
X-Gm-Gg: AYBFou3uUOhInGDwwiwn74LqLr3bwMmS1OsOMED8egZwsmiJ292O65zaV0M1Donpn14
	x5622q2mXq8dsdMUz3OtOTJI+fePzkdN/dajR9kKmRHbC7RyVXiAlvuQDT5KFMLT+V0YzfCy0hS
	SGFWNGwG7kFuPzGjlgCHpPlULCMmk7Idq1ghBTgwcfrvSYoyRDFJEEmfcvoCRZRKSdGiUJu18xK
	DSdC5i8QyRymTLykgZU4xbzUiw+lgsRgNqa74x6KSSmwGWhHTIP0y5yECUU1aFcAk4STzGhHDtV
	noF1a34vJLpEIUTublpRMSaQelpTMRy/kPsh9ov0TImR4T5BHqhn0JPTpRgjS/P2UBie5Z/O4gs
	Va+lVYOqFl1bYcOE5osqdFJVthbK0J3e28xXAxzUQ9DM/24MCLw+uiBzmYiMBKMdZ7OyIWT1xl+
	XlbyeXIYgRAq7jIMQXuGFs6WYCLkRjSTVPRTYEoHN0Po5VbLN4juxQ8vexmZGnTLg0ZpYBvU7dm
	RapwjfNzT8TnMhpgHuv6tsU2el8iBdyVTwT3US6rtMjQ5C/gwUdwbFduLKShnEZWoy/DXfUrPYS
	yvXhj0ZqUHRn0Ou55jLpf2SBq4B9uu2NgrM/vi0OfiwzTdBDAmjJuuZ2vQ7sIbTIIDm39rHSxVu
	Q7Gx+/nGoKr/hTkJcEJvyoZlaK1hcQpKyf3I=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr205720385e9.16.1794908622593;
        Tue, 17 Nov 2026 01:43:42 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad96096sm16212925e9.9.2026.11.17.01.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:43:41 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Aveline Noir <jm5905938@gmail.com>,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/damon/stat: avoid 32-bit overflow in idle time milliseconds
Date: Tue, 17 Nov 2026 09:43:22 +0000
Message-ID: <20261117094339.30978-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

On 32-bit, the region idle time in microseconds is computed in a long
before the division to milliseconds. It wraps once a region has been
idle for about 36 minutes regardless of the intervals, so the cold end
of memory_idle_ms_percentiles reports wrong values with flipped signs.

Do the multiplication in 64 bits and divide with div_s64() so the sign
of recently accessed regions is kept.

Fixes: e5d2585d9e85 ("mm/damon/stat: calculate and expose idle time percentiles")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Ref: https://lore.kernel.org/20261115173343.82437-1-sj@kernel.org
 mm/damon/stat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/damon/stat.c b/mm/damon/stat.c
index 6e05a2b067f2..f2387aee675d 100644
--- a/mm/damon/stat.c
+++ b/mm/damon/stat.c
@@ -130,8 +130,8 @@ static void damon_stat_set_idletime_percentiles(struct damon_ctx *c)
 		percentile = div64_ul((u64)accounted_bytes * 100, total_sz);
 		while (next_percentile <= percentile)
 			memory_idle_ms_percentiles[next_percentile++] =
-				damon_stat_idletime(region) *
-				(long)c->attrs.aggr_interval / USEC_PER_MSEC;
+				div_s64((s64)damon_stat_idletime(region) *
+				c->attrs.aggr_interval, USEC_PER_MSEC);
 	}
 	kfree(sorted_regions);
 }
-- 
2.55.0


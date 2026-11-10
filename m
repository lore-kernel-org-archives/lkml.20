Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268864;
	b=riYFMSWr7TGtaoDs6ATJhVPsdKzdn8/KgqFZqlCfK0TDg9nD2Sx7jrLznJz0R4Zvb1L+
	 oMVlUhDqJlqcnQQ5UwCmVnVXuv2kYDkSiqr8vfwv7QV6dW2eKL+VyvS1cYIfwa/zaWaCd
	 yeUyYoKIyHTwHNx+A4v0DrhDA7z0EbLRgzEJvvJ0yjhx5buNqAPI/vi+QL0EQ2V7xKizk
	 dgZhomHPWzlkW1qw1ZLwip/8Gdo3DctLfkPRGdJS134tj6da9baokmadm2pJvumE64lfN
	 yeMW4iV9jS7NQseIzw3TwdQRPIL/NUK+Jy6BXhiKtk8UMBeUXWNJjsNQLc6/mQjM+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
	b=vbKxLh3TKF3EU/Jo5h3MlPy1fGn5stiZFBPXmHDPDyWctTfm6OfKHUdCT4boD6HcoSfi
	 aiDmzPCQxG8piXkpeiffBsUVLBdYfZ8sqAnHVKaexWKHSBP3WPbPu/zQKk6rF380BdHrg
	 Lu/g1mjkNQdEF4uYXlnZI3W/wXfrCtg96ITCw0r7KdkUiOkaJB9hPi+2HnJt5ojryVs50
	 4OD3meQBTTzBW3IgQ0o/s1MnWumogY6TT+EBNr2Me011HfJgApKoh7cVTyt3PtpkhZOvb
	 4J71XQK/jl5OMNT6g05BS5AOPqGDzB2/KOWjaFtqEA2xLLFPR303UB8wntQ35BYY0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYZmPJ9C;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C659860A3812
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C659860A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYZmPJ9C
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48ed188ee81so725617fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268863; x=1794873663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
        b=BYZmPJ9C4iKDt41duCZ9z3I3JPpn0tmSD1L1L8RWTTgQr7K3hZsRGCJeGJOA3T/wJm
         1N/2/vTfkxcyPP6M8FLvtbJGUq500XCsSoLnFu4DeAnXLygTHUeDXPLRGVG8xCvuUuaD
         bRsdtx57G8RoHynWfN8u/mw0Tgdk7IW5Ww6WyDwvDAcu1OOQAy6SwkEtteDBdFn6Cu/d
         2mjdC9eZ7vxDbmcOpZJpVCZvRuxnQIjTt3pMPoGUW2uZruqSJPSMdJc8QX8E1+T+bmNo
         ZMD3O+pvpWstMklEL5ESDfk07clM/8QLZQ42rlCbNJnwnDXlputp+RVP9lmf3mEzxNwI
         wqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268863; x=1794873663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
        b=vAdmanqYi+ab3t1DhIOWIfbP8lTSGT0VWpunvJf3KvFnloqAVrPIdZBZJzRPAEytUy
         4anFHUiBG2eR20EB7GcY76is/GbP0b50JlD26Xw+yGZvcE9oqhIn/gFgXdDYahBGFrhH
         sAdXEj8vpHHQnyqGcWx8p1kBIddbZcS/UXjeeujqsyOE1bhi6WKaMRP0owk4TMMPr8vu
         LpUCqOcF0OApoyntOHWco5+9UoCe0DXjd+jdv7YpxGWCJfN6YTHGXD3UN9mQVrZzjANA
         Vpa+4If8ldVVDrryb7kNws64NmD8plU3uOv0eMi+1S53lf9c/BvxGQMAUvNjjUeCtTEz
         yvxA==
X-Forwarded-Encrypted: i=1; AL+hErHDdSTyeIm2sPXFoHNwMTER4nNThxocLDUePZuuPU+k8jPRIsiQwGhwqZlHM5qznb2qazyIY0cyeguJax8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s+HX8qGFzlZ7RP0MI7rRffmSznRbqKen/DfSzGKbNqJtAyPzE
	Zjc8eiXzu9dL8IUI2itm8h4EfBonQKnF7gm+ZwAPyeZx2C9wu3mCR48f
X-Gm-Gg: AYBFou1DrztYn3WlXeT4ZncBEyAPOuXBRagd9Of5yE0rgXs+MdzEjv3EpSen1DBW6RH
	F42AaVrJ2YJyKWTwh5U5XpIc8I56LvFRBoskaD659faf35/pASukE4/coO8wnYymB/JN/611cAc
	5jKW4BRnwefJgA/9kr1J7/Vm7fnNNVUHnwsp1wxsulNXZuiKjQht7hzS/ECJ0Mn2VFqK6blue8r
	RDViOMjO4Sqtr74P5KJ7khjU/zujYm+8bYygKDhGnsUQQ8UAP5MX0bgYsFyJhx3c2PfxRXXCPia
	pauPYcFnRJWZOgCLJkubSuZMjNl6va8C2hLuTbaINWZN/wF8ik+0iBsHOl5KVcm+Vg2k6DIPi4L
	r14ZB2J24GoRndNquoLpxurhqMbE6FxRZRuNqk406lJrIp9a3028UjG9YdrEXbY4rkFR6spzrKX
	nImDIJNWWnieMEAVzhkOt84/kO/y9QUXqUzn++HEdGQAnbao6JH7nvO3fhGUjcqxww8A9F2THJQ
	IB9JGoblN37Szwp+eWk3bK0979gvfvjhpeo3Bli8uY1adRPnkHGtDovV6bDo+4UpvWCdkMIdm9u
	dCgn0p0GyyJ+SxfIZ1hbfqmYyrDfU0ZX9Hq5nwzLCGw=
X-Received: by 2002:a05:6808:308a:b0:564:48f3:dfac with SMTP id 5614622812f47-5683ce042fdmr929817b6e.47.1794268862779;
        Mon, 09 Nov 2026 16:01:02 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:02 -0800 (PST)
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
Subject: [PATCH v3 4/6] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Mon,  9 Nov 2026 18:00:01 -0600
Message-Id: <20261110000003.1719966-5-lzsx618@gmail.com>
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

parse_source_files() checks whether a dependency is in the same directory
as the object file with

  (strstr(line, dir) + strlen(dir) - 1) == strrchr(line, '/')

When the dependency is not below dir, strstr() returns NULL and the
pointer arithmetic on NULL is undefined behaviour. This happens for
every module with dependencies outside its own directory, and UBSan
reports:

  scripts/mod/sumversion.c: runtime error: applying non-zero offset
  to null pointer

Check the result of strstr() before using it.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d0099..4c59e7cfbcbd 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -364,7 +364,8 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		}
 
 		/* Check if this file is in same dir as objfile */
-		if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
+		p = strstr(line, dir);
+		if (p && p + dirlen - 1 == strrchr(line, '/')) {
 			if (!parse_file(line, md)) {
 				warn("could not open %s: %s\n",
 				     line, strerror(errno));
-- 
2.34.1


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775DC563FAA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092533; cv=none; b=ur+F70i0V2MLpMPTjmqfF6OLac5/hxit1AP02jnCrKRSrL0D6/ch4CO6u/XxuV87IuhIPM2tcMdvjf1lLWER8BygpfmZ9NrS4vX7hlc5Y4Ee9pzI3Rv2EEGperjyGCLrSwrdIpNHb7X8Vx5WMU02cOFmlLIvH6m4id43daTfXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092533; c=relaxed/simple;
	bh=LbyRcjRHQw/+xkQGHr8tsvAw+bO9ob1kpAT7jwfl9bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sg4gWKXDANovGl3kuNYGm1npVeGLnDrltol9byLXs4sLK6kO9rzfoHi+EbRrEcDqcFgAKVHQ31im4OjSLcucG9WjMWUUJmIeZTU2MWtEuurX5XfFmZ9TNFs7TBBpOpLcf5LLOMhqCARcOeMdulRJZ+ccX28HRv4RuOsPkM4nmcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvMiZVH5; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvMiZVH5"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so61647a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092532; x=1790697332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpJfO8QkHNHZKvD9yNEk2TGRf9tD9f/5UmHSoPqjBK4=;
        b=UvMiZVH5QgqoM0tGZGzK18VNddaap+02F4EcFWY49Bp2JARAgauWxeYbkM6xlhC6yb
         HkGG60obDttqseFY2CUBA7UD86qVlXqE8LxxBY87AlI48+55aYbjkqsh0maURgA4VLRm
         HtBVufx6tWFQod6Fe9XamLy9awE+qRbj8cDYt1Zy7c60OWCRQrTpJocMqVB7JaKQPfZl
         Fhy+HtBJ2h2ljYWcgEAd9dTNEC1fqHQKc7GZ8iHIRiSwOJn/StVg5oDNVxes9j/aAt34
         TNF3bRIreOiMLkJMohqeGm1wlPqzK6ZuoaoSzCp1cxiP6qxlFWI5L/upLpxm33PopHt3
         BhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092532; x=1790697332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpJfO8QkHNHZKvD9yNEk2TGRf9tD9f/5UmHSoPqjBK4=;
        b=DqGGeIiR2ikCQB/u/nqUWk7LYd/7C83gaFJz16k6kWGnMe6XFpHQVnpdtzTbdpN4Nm
         72w26abjdI0pn6qVLplxh1/JWsm3tufTVs5sCrtbiQYhjUEoIXvlsQZq59NCMX9FwFoJ
         vBncoO664T1Zc0nsfUTYw9OkQs5rcHYJP2DC3yCAVvtVerxAREiS2Xq7N8qDEB0kX45n
         00IE39J8kFbcYhCyrZy4TGOdNoeKlC5wFKLXw62IarAKkp3TWYG5FKlA468YMRADP6fy
         TuuaM66pTsZmPl/2IOtuh1Gxcuv+kWHzXUFg6RgpfOX/7NrgLWWMRj+YyfKZIOpUuc9Y
         oRjg==
X-Forwarded-Encrypted: i=1; AKwUvBxE0hjwI3DdRrOr0TkwArvasiWusTreCJHa8l1DKoWKd2/kPtUDxr0D7KkL/ClmY9XnKovmRq8wtSCW0Ww=@vger.kernel.org
X-Gm-Message-State: AFuF++lUTN78dsgPtcUdkbeKKvP8iTn4iyyt0RDxOQi6POT7Hif7fPE7
	cxLDNYOkLOoxrL5UxrctOoZS03hOaeadFKtyccgyUOXyNeM3qEJ42c2SnQoyZ84j
X-Gm-Gg: AYBFou3KNl6FyVDhBxctbaU7dahWGz7Fr1R3WeJiURgKvlJstdYMxq9pVQWabGJDN1O
	Reh8PfRoAoApFkKzXzs/Phy/uJU81nUcZZ8m8dp/2Ltvcu6nv1u2I+B8dm+c2VtZcrzc+IKC5w3
	BfK6jDLDcs/vKYp8+nQQeiz7OV564xNonPZHHRC+0RhOVrBASjxwrEvQZYlBzbZ2KSloyEabX8m
	C41W/Ml/cbNnB/UVm4UeM0Lo8BaSDmEgVxxPQK/MPJMDrNJsJVMYe1LE9XlM5LtsM56anzgar6k
	6An+a5YjCUrQSAWo9ZceDEyjTT3jUfxOTTDEiRymGQbCXnY2SaQBnGVQaoG83JTVhcbUDrgj3l7
	JRAyTa1Y/8M39AInIwczB+4ji6a5VXVK4mVoQvcUoh+s5Hi1LdWHm9dHK27ixEzqucC81PPuN0I
	dhP6zUhYxOZIlX/bdmXpVdLjYGnUC+vEF39mvlevd1PT3mR2QgNpCsYFmykGT5490tUfbEiX1/q
	EDdtyzFXaXneoKs209O/zjKtnxht1c+Cvl/kuYgltZJTFhchoQ4KXL6dhSDjRZue923mIRZBrf9
	D4LMwnlkc9PmPSS7ckzOuJuUxlY6/g1uDc+F9Bo96+OyCYjImofQNp+TbJCG8j2vFWLwmXQH6w=
	=
X-Received: by 2002:a17:90b:558d:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-3a07309f90dmr1897591a91.12.1790092531487;
        Tue, 22 Sep 2026 08:55:31 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc5451sm83910a91.7.2026.09.22.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:55:31 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] isofs: bound the Joliet iocharset conversion by the output buffer
Date: Tue, 22 Sep 2026 23:55:24 +0800
Message-ID: <20260922155524.1993425-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922155524.1993425-1-matthias.goergens@gmail.com>
References: <20260922155524.1993425-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uni16_to_x8() has no output-size parameter.  It passes
NLS_MAX_CHARSET_SIZE to uni2char() on every iteration, which bounds what
that one character may write but says nothing about how much of the
buffer is left, and then writes a terminator wherever it stopped.

Nothing bounds the total.  It fits today only because the caller's input
is bounded: de->name_len is a single byte, so at most 255 >> 1 units,
each expanding to at most NLS_MAX_CHARSET_SIZE bytes.  The previous
patch asserts that relationship at build time, but the conversion itself
should not depend on it.

Pass the buffer size in and hand uni2char() the space that actually
remains, stopping on -ENAMETOOLONG, as fs/hfsplus/unicode.c does.

The result is unchanged for every name a valid image can carry; only a
caller that passed a smaller buffer would now truncate rather than
overrun.  Listings of plain, Rock Ridge, Joliet, Rock-Ridge-plus-Joliet
and zisofs images are unchanged.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/isofs/joliet.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/isofs/joliet.c b/fs/isofs/joliet.c
index b1f4a105ee87..0832f40a9a2b 100644
--- a/fs/isofs/joliet.c
+++ b/fs/isofs/joliet.c
@@ -15,19 +15,26 @@
  * Convert Unicode 16 to UTF-8 or ASCII.
  */
 static int
-uni16_to_x8(unsigned char *ascii, __be16 *uni, int len, struct nls_table *nls)
+uni16_to_x8(unsigned char *ascii, __be16 *uni, int len, struct nls_table *nls,
+	    int outsize)
 {
 	__be16 *ip, ch;
-	unsigned char *op;
+	unsigned char *op, *end;
 
 	ip = uni;
 	op = ascii;
+	end = ascii + outsize - 1;	/* leave room for the terminator */
 
 	while ((ch = get_unaligned(ip)) && len) {
 		int llen;
-		llen = nls->uni2char(be16_to_cpu(ch), op, NLS_MAX_CHARSET_SIZE);
+
+		if (op >= end)
+			break;
+		llen = nls->uni2char(be16_to_cpu(ch), op, end - op);
 		if (llen > 0)
 			op += llen;
+		else if (llen == -ENAMETOOLONG)
+			break;
 		else
 			*op++ = '?';
 		ip++;
@@ -59,7 +66,8 @@ get_joliet_filename(struct iso_directory_record * de, unsigned char *outname, st
 				outname, ISOFS_NAME_BUF_SIZE);
 	} else {
 		len = uni16_to_x8(outname, (__be16 *) de->name,
-				de->name_len[0] >> 1, nls);
+				de->name_len[0] >> 1, nls,
+				ISOFS_NAME_BUF_SIZE);
 	}
 	if ((len > 2) && (outname[len-2] == ';') && (outname[len-1] == '1'))
 		len -= 2;
-- 
2.55.0


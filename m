Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216228;
	b=WtNMFkfzgSBXwEzXr4F/66uLyN3ki/phcdPcGapCsv85DRpp4/4pHSv6xLVSymT8qRPy
	 TrfUH8CMiHKfPAqMC2McUMJDzUsl8jFVrGTD/jnJ0gnvZ4twPS7oMxvM9kh9YUpW/Q/H4
	 B0YMXEApFqG8nuwIEB3qaTwTw/oIepLm2C7A3swpkscqUrSWVh3ZBb3QXF/H7Fu2pKkGZ
	 phbpU8papLimzb+fD2CGAaLzQB7wWwR0Y98JNuGe+NDwngKfPz6Sg/Mga/FAEw1WDnDN9
	 BIoau7t3I3T7tCmgm5F7A4jnz+LAgTu+4sGzmhkX4jh9yAcsWVQ0hxSjqJY++G3u/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2yS6B1fdODzUh4XgV3Cebo3LhVzp5X0snjiUXq/0jiU=;
	b=OYS5NnqIU4zeDZYwr8Z1hxRImQnkUT3miqGITx+9WpwyDndu8xmghEzzarNB3cMqwM0r
	 kYBgX/AwJXqrv7nqz8Hy15zEg4JiXi4gyU0AAjoAPDlhhjq7bzTOIRU8aAnvbuSECTEWz
	 KUC7PC/TSTZg67POCeJCyAShw3UjwiFuv0TlAd1lCkOnWhbvQ7VLKzfI+scVsOmYssJE7
	 E0dEdd42qYL3UHjpCvUavpl0pjhzA+Mbkl199ZFYJxZRBpP0j6wH7a2xoTAzLpRqUC67h
	 87AauqTYbNH0cK+/C43Sv1xOlTrPQVgy5puCNXfjBYcP+7h6bfW3OLU/zNsOfxGNf7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUTQlOEa;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43112606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43112606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUTQlOEa
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e46e449e8so850820f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216225; x=1793821025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yS6B1fdODzUh4XgV3Cebo3LhVzp5X0snjiUXq/0jiU=;
        b=kUTQlOEaEk4kKhvJEXcdd8ICHwy9lwjwxfP+jr0bFV9BQmeknLAEhDf/8mfHtqmy2r
         DsykJtGs9CyKxc77xokx9OZQXDgQIf23IM6rGMadOb1W7uqhF6ptzScJCZNQTGZDc+dn
         syHiN3JyCIq7lApRCP1A64puUwwsAZL3wu0bBJe7XdoVSv4GBT133LQ2eSpJy5/CPs97
         /BDrW2oGQE0MORQnqMOIY+zWb5n/lD6bSAG46kb0DBH9CmAMRGltBg1XfW/7yivMClub
         TOrpK079S79OgF6g0rlOA9nT81DTHaPniu5KlqkwxTW+r0M7CH+p7VM24yhxmUDwGTvq
         8txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216225; x=1793821025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yS6B1fdODzUh4XgV3Cebo3LhVzp5X0snjiUXq/0jiU=;
        b=ofpZUUnccBHIeUaOxj7Q63o8oAo39DLiKfcPW15HwaIY1RZVr6t5Kwmh9dSDZH9G1i
         It6Zld5Nzr0/dO4JuOONAgmeofu3G33Wo42+gF5EL3Lz0QYT6faidFFp3c+0EbmG1SbW
         Iy1fPsheZ12zr/BNVX4fTr2H4fkxBsYfTZ0+ecEXY2hhDth8E8jz22FILmNuRPbyK4Rl
         bszoO4ZBMcxZYs0k1hbQu6xiI0s0QEQvjLmSGDnoikDJEW8PHflwhA5ISnXZJsRewv2Q
         vLuQqaGB6ne+MWiZf3zOuIXvLOTpQNc2u2rkxZ+0dQpOD7cLgfUnJcOZofCP755RzhI7
         ud+w==
X-Forwarded-Encrypted: i=1; AKwUvBzedpaeh4TESuAL28qdjsNwQyLy0dokEa0HROlru1Rd8kZ3mgUbJXNyAa5xWkUypkZ/N95Pr609r6re3JI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7J5+AxOSBgTMkb8q20F0RxmmXu5qdguI75DaQ4EEhfhFu2Bk1
	uVogYXr+HV1P/ny0pBuKIvXb1DNHN2nqNTNW6XxC+4T/Tzemr+31nLNO
X-Gm-Gg: AYBFou1XShleiAMsMgHwcWPmo5QIi5JSUGRjdKU65+rqDf9+sPLWIx0nX0ATf24Q/PR
	1MXlJ6wRa6V2RXkSxg85eH2hcJoyFXUzku+Nv9psD4F5VGjftSz+PbwAZIjOsttItMwsEQJU1Cx
	7iOagV1PEWv9stwj8NYuZ1sCcmYSmH/eT54oYiEmHX1TpBxQH4AKAg54VpokrYqaXz6Gb/OeiyN
	FVreTuOagD0c6jyq3aYtDhf4LZQKnSgH9uFzI/u95ATVFmtWYQ1viUH4hNwnxZwAF3mNst3txiH
	IPkMQ3fZHQdW5rYUBtklK1vnc2yBv1IIUMYqVqfWsfZmjyHlmIe4+Vri43hBKMXpGOKJz0b5ZWz
	vfNVXI4e9cs96FT3lxCqZa9oR3un4V8UHKA1S8snLGTjV/DqwS9xv0Xt40XUbYT9B86hTegTPVR
	11esjca6hVc+Ll/jz16QRy0HRYi+pK8kn3os7bmJ3webCS+CAbUpK5M+d60Bx+O1wCAhCzu28wu
	xDYQ5NVdsLnJskgGh9PWLELQ0+80U5lQk9yNsJzrUD57UbH/Hc/1YoU1+rJLVRq5H2+Ej6Zn5W9
	cIVEoC/xlJNkff3v3TURWEFFv/stC1kAv5qAr9Z8EnhUuy32vQl2rxB47fXUsZHCyGLlIQItiil
	eFthZh3E0AH+PwNBW9tcO8QFyORTRdK3WCI9IpETzYRGh5LF1+kOk6nJFY4xHvrj7WgrdhSW2/A
	Ls7NsokJJZUr5cz+RrfMNCTYtmibDeqgwQ0KWTI6xPLw1yrIIPqXAhKWhN4Q==
X-Received: by 2002:a5d:5f52:0:b0:48c:4658:602b with SMTP id ffacd0b85a97d-48e5d2e7375mr8599298f8f.10.1793216225566;
        Wed, 28 Oct 2026 12:37:05 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-3fca-2040-fad6-74df.rev.sfr.net. [2a02:8434:fda5:4201:3fca:2040:fad6:74df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm27004611f8f.41.2026.10.28.12.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:37:05 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/bootconfig: Quote command strings when applying ftrace settings
Date: Wed, 28 Oct 2026 20:36:24 +0100
Message-ID: <97454eceb5d56bf956740b8998972767bcfe6c70.1793216183.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793216183.git.edumucelli@gmail.com>
References: <cover.1793216183.git.edumucelli@gmail.com>
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

run_cmd() passes its command string to eval using an unquoted $*. The
shell performs field splitting and pathname expansion before eval can
parse the quotes in that string.

For example, an event filter prev_comm == "a  b" is applied as
prev_comm == "a b". A literal "*" surrounded by spaces inside a filter
can also expand to filenames in the current directory. The printed
command still contains the intended string, so --apply changes the
settings even though the preview looks correct.

Quote "$*" when passing it to eval to preserve the command string. This
fixes both per-event filters and histogram actions.

Fixes: 7e66ef0046cc ("tools/bootconfig: Add a script to generate ftrace shell-command from bootconfig")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested this with hand-written configs in a temporary tracefs instance
on my Ubuntu machine, running kernel 7.0.0-38-generic, with recording
disabled. I checked both event filters and histogram action filters.
The original helper collapsed repeated spaces and expanded a literal *
into filenames. With the fix, the strings were preserved. Ordinary
string and numeric filters worked in both versions.

 tools/bootconfig/scripts/bconf2ftrace.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 7745c97e7abd..ea7b17d0d4d7 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -41,7 +41,7 @@ fi
 run_cmd() { # command
 	echo "$*"
 	if [ x"$APPLY" != x ]; then # apply command
-		eval $*
+		eval "$*"
 	fi
 }
 
-- 
2.53.0


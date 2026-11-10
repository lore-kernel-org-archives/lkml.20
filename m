Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268862;
	b=gz9U2X0Xk3aeH5jCHgCfB3YdxGAKS9r6bCcvjA+F/iyiZuf1pHft83IVl/Eq7h2qz15c
	 hQPtUoC3fViYYjzqYDJd5Lt3Dm6cNRxP/kA6p6I7vDyXhscU+q/yCkLbP1OtUfBaA7Via
	 lsX2YvAJClFt1hLJDWoK9cZ8snslozr7JMUJTLhrpEOP/IvzZ8NJGtUCCCdHS10T2WWMg
	 IP3nTUjo2BNM1QppX2BJRMimwEVXM8+4y3nEYYEEyRwBLnwG9YhBUcZT6mdDLqtRAXQER
	 Xv5/fjerzTnrWy4ogiKLgLg6sHqze7f9GfYxQ+do7skt8oUGkb7AkZol0wXUdmEIwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
	b=1+Ib2hglSi3gpd+eWRn381V9e4wxFTxMaSdVGWO+qDomewVq8eQjUl033kBFiDI8Y9gA
	 /iMPLKM3Dtbdw6zioMiNlYTUKRc9sqMI1Wbp/yYPkUJ0+dP5FQL1voSmM7JQXVIJtPsbf
	 zLGoZCDweq0H3iT9kkFBRbOhgAwnERYrH9Dd+T72VxPiETtq7KIbITfRdXP8A+Z+J4E+u
	 Isa34LYiu+4LsLDHCYSZtR4eYt2bYRKuuBhZteNHQ78isW+PP1+fGzCSLkWWTAydynVWT
	 4g+g+Ef8oImWTqYZVsKDSoGOK2EyLnypO4oaZGr3wwjbL3UvIpCeGaHRCfWvI8/f6oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7RC2NVo;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237160A2633
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F237160A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7RC2NVo
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4adba7b3399so594358fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268861; x=1794873661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
        b=R7RC2NVoQixknsIsgRzs7wRfrhDLQAb8E7VOo6/yrbSMzS8cO1LML9sPxR1I3UiO5m
         hvOZqF1AaOk9I0adgJwFRXQkTAKoFTs7tKt7UNiKfpa+lPfJKEQvhXoMXaEZl1xBzd9V
         nPu3mIiinPHJcECzopWWrTRY+0nzF29o05u0IUjgniFLpUIgAczirASUrpCNXYEX0Jda
         99Q8w1qfoBgzhUUoeNDPG5p4S7e8G10q9pukAh6hnLrk44r/QNPneomO8qeTA3gC8re4
         h5Dz4/w7IX5kADfKTYA2EV+F79JPwkya9bHM5MzmipYJbP03Ol+UvBDtmdxEfDtL/Ty4
         /FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268861; x=1794873661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
        b=KnbAw7ugxIrhxU2m2aE8YQisAClbQmF56WHF0ITnt/jaBNlqPbAfEHkq+1PIEQ1BVQ
         VTUBSiQndLkZ/VPAAzgmLXK41rl8WBbBKZS5alOU0ZPoAo4M/I8IDZG6LQUGACKitgQj
         rYju+Uk2Ty7G6aSoT6UAjxHe+sUU/ZSKtyh2qNfBcQGTP6xjL1dVyLrz09Yq9Xp8Bx4n
         B+8PCkIe06UBkMbCVPTbw5wvk+9gCTgVhoeNFM+JQG59KVBNuUuJTKcoB4KNsEuuY1K1
         b4clDaf6pMOcBLVZepHtA4h3QeuQRij3lm59fmo6xfDL0r3GLR02mhYwdJfQ8XhQo3wZ
         BJUw==
X-Forwarded-Encrypted: i=1; AL+hErE7jPL0r8Gt7Ofc211S3qj6EA8t08QtKZZ5FCwXw371/8k/umkfKMbBO+Qgs7nPxJAj8uinRDc5zFAEKig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tTVAxuaFCu2sVG8nW9rKeV33uuUpLvpgrZ1FAu0v5MKheBTv2
	pqwWUFhe5Zgl/WFuZMKhOASTnEGr301LrkhGRYeE5xR9fxZu/KZZLQ2e7/PNwg==
X-Gm-Gg: AYBFou1stab369Apb5pzF+2YT1wsAxvpJNK6lrSlpZNdNGlsV3gsMi8VLeazskK9YYr
	7iwOVx0ghdj0xU4l0uSZhQmcMLgqIveVzopmtHeh4/C6n1pPacnWRvlkbGSFM+i9m2xPKmY+B1A
	Ml5Sajdlw4Du9uACxphL1A1kkyIxDtwXg9QlN021izIqwnt1pqu0GPf9KCMo6hGdMgkOsHW8yUs
	yf6aWPHqRXEUt015ANHPBbPtUJHlJuse5/bJzAa0wRwL3x6CRkoftbSfunLwKq+LAaqOlZdrocb
	VCle0YdssaiJW2iQNYkgnJzbsw7welrNDHgYaflC/zTSuu7AAvwhZSYB6PfIWv+VyM18IdPpf1b
	XkB7yaM5rkHMbpIG9Z9Vk9nZoygY+GLh+QzGSMFjwPzAUieOQyyR3z51tTVelC4AcYWawKMVled
	QrqEVq3o8bc+/AoW3bXICUInni38nLwKe2QxsVzEJiK5miHW3iPtga656vJf7pyY1rSSm/EAb65
	tlWNnZGS5ZCceFcIlVpW9A+XAV0KaA8u3RpaiqlGBp1rUKpaZqL+6LWYY3Jk5W7X28jzaCI7xU8
	mIbWLmKaEi7DW1ctOI5IYEuMaJ8RjihIwSKmbAVFkYA=
X-Received: by 2002:a05:6808:5094:b0:4d6:90f3:74b2 with SMTP id 5614622812f47-5683cb012b7mr963798b6e.50.1794268860737;
        Mon, 09 Nov 2026 16:01:00 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:59 -0800 (PST)
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
Subject: [PATCH v3 3/6] modpost: fix handling of short reads in read_text_file()
Date: Mon,  9 Nov 2026 18:00:00 -0600
Message-Id: <20261110000003.1719966-4-lzsx618@gmail.com>
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

read_text_file() loops until the whole file has been read, but every
read() call writes to the start of the buffer, so after a short read the
data already read is overwritten and the end of the buffer is left
uninitialized. If read() returns 0 before the expected size has been
read, the loop never terminates.

Read into the correct offset of the buffer, and treat an unexpected end
of file as an error.

This was confirmed by limiting read() to 64 bytes per call with an
LD_PRELOAD shim, which makes modpost fail with a parse error on a valid
Module.symvers.

The analysis and fix were prepared with the help of an AI coding
assistant; I reviewed and tested the result.

Fixes: ac5100f54329 ("modpost: add read_text_file() and get_line() helpers")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..1772068dc68e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -143,11 +143,15 @@ char *read_text_file(const char *filename)
 	while (nbytes) {
 		ssize_t bytes_read;
 
-		bytes_read = read(fd, buf, nbytes);
+		bytes_read = read(fd, buf + st.st_size - nbytes, nbytes);
 		if (bytes_read < 0) {
 			perror(filename);
 			exit(1);
 		}
+		if (bytes_read == 0) {
+			fprintf(stderr, "%s: unexpected end of file\n", filename);
+			exit(1);
+		}
 
 		nbytes -= bytes_read;
 	}
-- 
2.34.1


Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01DE3AE185
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477662; cv=none; b=cV0qkOyVTQ4VoASB7NBQYLCiXkJHCg+kdQpEB6cwLliwWKYd1RAdbqpKPBZY8ful45r4EqN48A7FPBRIIskNgQcgVLVGoFPZaMfZHX1mWVoYu30eBW5K6pkscrGVIG/XIa2qiA/PbcimVf2Talwr1sgYT0qSEGhKyQezQNW+xRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477662; c=relaxed/simple;
	bh=oyynTkKGGfztLCMBCVphxnjC+mB7kXtAI1n/IIGHN74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QpGb4yR1TpOVOMevEiv/f0m5TnIpNkb46ZHzV4U98kaEWwJ0InIBvqVi/7/II4V8Jq18iIMAZTj3jZSFBa3jc4bIx95OqGJyN0bwLcphZ4shtfb7enMjnxGZHds+Bzx3+GjfdNeSteRo3jKW5X2ctFjMT8MpkWYBWFlV9LcnCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N95EiCjs; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N95EiCjs"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d7a9e2eb24so3057008eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477656; x=1792082456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVgGWa7vQ+w9ty39UYmv4KKUyLnAT3ReRFp2PoOTaIw=;
        b=N95EiCjs6cq4TPgBY55ERiOXnQJaiQxUaA6VbXhOTK6s6Q2wdEd6grHE4Eo+mW+++I
         zP/weO8UpaD+Bzt3crlEDFlzGP2K79pdUtwnpmZHwVGCEK3UoT5TUXqXME0iQZSaPnPZ
         jFodMa4n5U5xe8V/sIqoUgHyFqDB/3PXXp81Auny+Xs8Eh7a2Rg945hqWqDcsZkxXrey
         HJX+w1tRuVm+GR2SDZ9UIHJCgPsp7hhU4nx8wHiDDLqT6j1SWFCMs25W34ipXQYuth7S
         5Ch/oObFy/AYsucqLF8BQaobnqvTK1EWQiTzANgfTthFLbeilrgm6gAgpe0+iTcZB5hS
         28CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477656; x=1792082456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVgGWa7vQ+w9ty39UYmv4KKUyLnAT3ReRFp2PoOTaIw=;
        b=oY1sY9od/RdRIr/mpNduFCxssDjGCd8ge6daybOwlA8+lx6HS7P9SAn5J89KvN2GIQ
         24UAYrM2q40sxHuqowkZv7+L8SPgW/dw/qEdzaCle4h468IrB2yMGSaAbRrHJxqznC4z
         uZsrN1d2zwp6Sg2mkqvXE2ENSXSFHAd3Gh7yJpv5VmHL17nKK7lAWiBP+yeol0ZZqNsx
         F/I4zWM4HQyIYCNtiTgJ0lpK6IlwKA4O3SKDwsJTONtxn7EubGZvVchciqGYK1Io9jL4
         DCx0EfjJFVKAPGhhwVfnvU970a9HIDUuXzHeThtR042RoJEPFO7GOGHNTeX2uBQ9w/7s
         H2Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw35TtE4fOkru0dRSYBfCEzFkCuo7vqCdOE1Z9hHlrjs7gEfESs0Xg85dqVNhSqcq6mfYPm5qQaFSwmfHc=@vger.kernel.org
X-Gm-Message-State: AFuF++mPRRU4odkZtribE6VSgvCC2N88CWinUR90nIZR2eiXYxNk4a/M
	Z++l2vVhp02iv/bG4mlZxfRLqgTPwEaR7kqtT6BR7Mf3KUEdJuuy4iPewOHrhA==
X-Gm-Gg: AYBFou0E3x7ZFpdOrzdt7P3plFJOmTqPycCgoVyLDRz3humIjfZzhht+73d+tGBsYaK
	IAHCSIFgNyOwLNI2GFqxM4aJUXoSNO5XqlzRc2o0qcA1O8yWdXTk9bK9yu9wBcbAn/ETj90LRRs
	fM110y/FmoR443uh0Riix9o/nAls0Am9oRpiVxVZAkPRXe6u3B2nVt6l1788eyf0sqoWrkuJsnq
	0aNGQKphwGe+bKExvsKksFqIn8IlukMmWXiBzV7njM0lZxfmO6a4EoOUur2cjHIPiVscP7JAisy
	+P5Dwn3urAEWvK+NkzAabrG0XTz+vkrAWQWsnc5SzkbBN/zQD0UYZuLmjDnoXrNkkM2OdluRFet
	WmkZEP7Sxulvr+9zo8krKOEw6HWbBHkvh91mSoCNZwPOLXYMD93r1zbpIdD/+MlI9wRTKy7x4F8
	3nCSE/STJczTog+4PHni6RTUF1pWKJcG6z+7tJaxgJbozHoR3x1tv1LfoK9idgR8DuyR84vRk17
	7qp78g6Q95k
X-Received: by 2002:a05:6820:201c:b0:6e0:39ad:4c75 with SMTP id 006d021491bc7-6e7a65d548dmr5573097eaf.15.1791477656508;
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] modpost: fix handling of short reads in read_text_file()
Date: Thu,  8 Oct 2026 11:40:32 -0500
Message-Id: <20261008164035.3668885-6-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Fixes: ac5100f54329 ("modpost: add read_text_file() and get_line() helpers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-7-lzsx618@gmail.com

 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8..1772068dc6 100644
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


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817482;
	b=G2ivfSDHeZEc7dH+hYWY8APpVHE3Soz5vutN0y1ripKXXo5O5LHw8Q98Ae7VW9GE+XiI
	 04v1/UPVWGXGVvpaWhOT5XKvwxFxGYX3YqVbwNeAwQatYz3A5jx52t+q2s3ktOBrZCckt
	 NrnyVxu5L+tbQPdjPC6bPVgehRep2+WLxYQ5ZgSd3/JSCKoowsc4/7NKLaIbqKAnLo6eS
	 OSlMtg+8ItiQpcg4om1j0SPc/JgsLrnwnx0eqmQuIP4P9ZFEICBsHRG6T3XzKXfyzV75g
	 BqxaI65EP5oMuRRPRjwkAM8ofXt+KwQW5bo846AVBXS/A6/7ay27M7ZRi4rtVeyBQng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=5CJ4YCQzJ9RJKX3QjI84ekC4PN6T/7hvVM512TSC4LE=;
	b=CWSTTfca4kfsLJCfDxzNDnZ7FOE4ixXDeNbs1KoI8fuIxPkh4AC9QYYvWbijYXFfj21D
	 a/USF3jCWlzRw3PXBz0Lh+7h2O29nQe0GS1CGUVzYSyNjCMXT4ppDeKREvDCbk00mK2qW
	 ceOYUVnbhZq+HVIAOruBRRXhXPCpH49FCO6f2qr7fsJ3OpHNPMTm/2CvAoPSb00cl07jo
	 yOKrSEs/+YCw07GEuQ6j7Zt/lBqCoDCjd5jQj3bE9TBPH/SAl7G8+pz9o6ZkfleoHvfCQ
	 xdRx0ZszsqYhv2qx13v4MsZGGSVpFS3N5dV+jjbXB3vfTF8bD6K/IItB/fw01TtDtkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2SDre4z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570A606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1570A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2SDre4z
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so876127a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817481; cv=none;
        d=google.com; s=arc-20260327;
        b=k5VzhsnvFOb1x5YSm2xQvnfr3hlv2ZEh/TVmVB2fEnjM9Puyin9eNfXoKkTcfalQlP
         yBqnciEW+T9I6shhJLcAaW9X41hFUFo935HKHBVqO14KpxS/fVUsQegLhNYdhJqrsYdl
         vSMVFAkgjF/3gqvMGxDth/mYOSrNFxV/fJsTx09cckgvKBzFauBkR88gYmLUhDEc/tER
         VipHrhJNl673mY5CrSEPEQmLMTU/5n0mh9e3wByvMvZJaEqRU0h5lETHZAu4nl8Q0EWD
         qIW5JdLkSMpdMzKkkCPYEs/Eb7K8wbCVBdozs+36+4IEkYBKTVCpcCX626HLWzOMz8e7
         1frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=5CJ4YCQzJ9RJKX3QjI84ekC4PN6T/7hvVM512TSC4LE=;
        fh=NMDmcYV2R//jeezvYCdu/+NJU1Z5k7QilqTXTF2bXNg=;
        b=T0lcOfQf5SRaDyxv2NybxK/weUora58AZa5wipKKK8ja0AKlyyMp1nvu+SKwMaKxhw
         /dl/cT0+HhBHnEE0aZkJxTOf0dJ3iV0KEcJWeOPLYfTbrS7t2GJcWMimLTQtLgqksRjs
         bkpFcWUe3FJYdxLEoHry1Jg+yVmJyRrTZmw7ZxqDxBiP/0uHX9RIZuqiqR5QYhEMqKKz
         f2hRZxdGZVq5m0jle1QpWB8fqlaHrw7mPKBLPCWNcD65NIG0lvuB9U+rRsLPfsnqfY2C
         TSCmplhyZd12Shdfc24HkxW/LJ8/vigE77d16KYfalahBWDUQ3uoPa3kz6EDkrV9KLU+
         QyTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817481; x=1794422281; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CJ4YCQzJ9RJKX3QjI84ekC4PN6T/7hvVM512TSC4LE=;
        b=p2SDre4zCKLU/9FqdVNShdkuXYgmMXvZyeGC+zzNVo9cYVBVDQn0XHoLsqOIO8h+Dh
         neZ2s1Cs+89Nz9CJ70OdBiCsvPJZGZFY0g91bqYLlZr0rvUvQW3pGGYPzvrEgJ7ETjVP
         SARbKrb8ic3sH401c0xQhLsbcacnHBnRy0xkALK3J6B7sp2ibAXdakZNEzEjHtvhVK+s
         5V+MxDfJZKcMrtHsXIdbj33QuO4hK+3H3dqslfsQ4CEoLhA1gfKnIeEwmlY8VWVdyMB8
         i/nvF8lY6lgVapXxLLRAuky4rVP06jofkJSnsSHk+WuwPFGURZvaJVzRCN4iVhrjFycb
         AViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817481; x=1794422281;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5CJ4YCQzJ9RJKX3QjI84ekC4PN6T/7hvVM512TSC4LE=;
        b=pzi+xjCmHNNDbEXXotFMd7Os0VHp98UQFDnHDKp9/vj5zlFBfYIqBq5QI7wlFCwYzh
         6xlb01LptXDJ693ptNxFKVacEPeGWpt5h/cNxboUJ1rmmYehuIBW7VVR3m8ixBqRnTrG
         HsQVJhtQem2LFvh+K/W5c/x+RW6x6RXqT5dnc0WQ0MX8c7rcjzwrowwXLSgYXcB3kksw
         Upm46kkf2jeinC+GIp5ysPqruFlOa1ch+Tlf5N1A2lteIW7H71b0o0mJoF/KAC9dEVda
         hjmPTmyL3G/M6tQdLG8BwknHhOxBmBbr1qupIz2FcecZtwqwqCjXYP/x3bvjdsEuCFO2
         IM6Q==
X-Forwarded-Encrypted: i=1; AKwUvByyFsOY7XuYiPp8j9OQ8r09DvU72T6pVN9wh1kAyEjRnX2vunJm/7Ee8rLF/RrnNXdtc3MlP+M3ereaEpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oJhzpHCPl6EgKblLT5mTSvtd1lOHG/KbcIx0CZ/7xdXfIy+Gr
	gJf5mHYRIFMWvc5G3fsrK3F5GJ9RUv52y16VZb6xnogmSL08UPSSHmri9YkueVTJjBJJG+wNm+C
	OaY5bnCfzz6Nv8Cr2fE7ad0YU4H5U9c8=
X-Gm-Gg: AYBFou3LSHmlOLTvRO4VDhFU19lvrtjaNqAnTjZ1Vxvmkefa/DJO2bnt+BBijhPSAym
	RfSbEJg+p+Ey4+PrNJsdSRFhWfF+c+1/SEcyqtVaJLaNn0uwq54WEHBujawXAQZQK7r1J6ef8SH
	cAJWgJYyop9hJNu3b08DWIx3U2Y1zetvP69vF9lJhzISwGjsX7qzJ9fxXYXPg5kNOHkcnH4DD2p
	rbeULiwRX5R5LLDQYueUWf1eGqjoIavt9vjKf2WLNMbjaFpQNBQeTcIfghdzasA+2JWLxcVlr8O
	TfH3dbCRXMY7WH3Olxwau6swi795KC1chy5ISyeCVl0l2MMrdeZyLnWWKcp5EgunO8Kh3YAFIVx
	uUMm3/J5wEmkCXPcw+xoCT+yGg250QO9c8Ly+0bUkxx3W90Nf6kzVL5rqUv5fGwrEn1JT
X-Received: by 2002:a17:90b:1c10:b0:39e:6a80:b799 with SMTP id
 98e67ed59e1d1-3ae89799522mr15326503a91.41.1793817481541; Wed, 04 Nov 2026
 10:38:01 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 18:38:00 +0000
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 18:38:00 +0000
From: 2-D Godoy <2dgodoy01227@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:38:00 +0000
X-Gm-Features: AclHuK_uUvW349hUDFCVLsr_g6yC4UK8HN-OOATBy6dK-CZmFIzlH2g_59RQy8M
Message-ID: <CAL1HEBDTP=A32fCM-LK_2WKFFJ4inuk7Nt0BPvGTGpgpr0pgxw@mail.gmail.com>
Subject: [PATCH 3/3] tools/mm: keep the allocator scan inside the record
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

get_allocator() looks for the frame above __vmalloc_node_range by walking
back to the second newline before it, without checking where the buffer
starts.  When the vmalloc frame is the first stack entry of the record the
walk leaves the buffer and reads before it:

  ERROR: AddressSanitizer: heap-buffer-overflow
  READ of size 1, 1 byte to the left of a 131072-byte region
      #0 get_allocator tools/mm/page_owner_sort.c:501
      #1 add_list tools/mm/page_owner_sort.c:606

Remember the beginning of the line and stop at the start of the buffer.

Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index e56375f..f978988 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -483,6 +483,18 @@ static int get_arg_type(const char *arg)
 	}
 }

+/*
+ * Return the beginning of the line holding @pos, never going back past the
+ * start of the buffer.
+ */
+static char *line_start(const char *buf, char *pos)
+{
+	while (pos > buf && pos[-1] != '\n')
+		pos--;
+
+	return pos;
+}
+
 static int get_allocator(const char *buf, const char *migrate_info)
 {
 	char *tmp, *first_line, *second_line;
@@ -495,13 +507,10 @@ static int get_allocator(const char *buf, const
char *migrate_info)
 	tmp = strstr(buf, "__vmalloc_node_range");
 	if (tmp) {
 		second_line = tmp;
-		while (*tmp != '\n')
-			tmp--;
-		tmp--;
-		while (*tmp != '\n')
-			tmp--;
-		first_line = ++tmp;
-		tmp = strstr(tmp, "alloc_pages");
+		first_line = line_start(buf, tmp);
+		if (first_line > buf)
+			first_line = line_start(buf, first_line - 1);
+		tmp = strstr(first_line, "alloc_pages");
 		if (tmp && first_line <= tmp && tmp < second_line)
 			allocator |= ALLOCATOR_VMALLOC;
 	}
-- 
2.39.5

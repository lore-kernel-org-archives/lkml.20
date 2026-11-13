Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596230;
	b=V2MJYpxDWTOlicvuy099qZAPYUik71mMfZRmcXI6nZmCJS6W8jpmYi5MWbo4MYmJ5a/q
	 taolri5E/Zdh58CDND18tDttMOoESTIgCdt2CGsIN5uqY2yyo/CzkY1cUyKEbkttX8BiM
	 ZwqDbERghhSkxQIgD1B7iF3k6nbIO4sG+ZAOLFLTiCVNdjCANFvTNbBEcHjhI5CD9eDGa
	 CLaS5C8h0Mf9+oLXL3s5W10h7I/g1gCjDMMNMiP58/3v+p2LSRrMEXnhGgcJV7FEgGf/M
	 5m0snqXCOHsjLb5PWM+e0LTf6OfRYR3l0/S4nU0XT0/8O8tpjM71MogeKyh+sW5uVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
	b=E4dlfh4mGh15Ga1yokbbIkNrnVfol4+lPO2ugluIrrX1ibUbBzJCKREpxoIkMVJVQUje
	 5/8ppwhcOes+vlw5v1Oi91zou0P+Pz1mSDimBXOO3kLgy5H+GMBTXN38hxaP2B0qSEF+L
	 i127dvrre9JFYHnziriMgQMiJi4cV4RYvtpVYQsgwY+KKQtIyYE4r00xQvH6q/qJ3tKo6
	 X9Qoh++2JAzJgITwCqNHnPoupy6TQSUqeO+7tsDFjHpqfhRg7XtK1vUOitCenKkbyy9+5
	 oY7e0sVuIBKYkKsJekABb67P5eoMIl+a3LVLAToip0NTCNf3OHaJfyAn9WkO1dQWtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K7TfaTIp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E75606B600
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E75606B600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K7TfaTIp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so633554f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596229; x=1795201029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
        b=K7TfaTIpXEcfZMq6krUkFKKZVCSyeuKPKKuy/HDqRyrAgejRf+c+wwsF2uvHFBRXOS
         HoiVKB0V+7fIjKZas1EyoTdydykGZNFBxa4pztvxJAJb2chRs+WG5nv4dqaMp7r2qTlr
         ZNfqRfAthL1EgfEIJsxvQtBEiMc9AAXJhtfSaOcTyf9o6kwcheBdnP/m6wX1g0mPvlpT
         v4rEQYW00dqaEECz6BahR0rVKHC79R8K0tYcKco7IsK/1KMVZDG+W7EHBHWas1aRximP
         0pvjtzh9yFyqNHtk1rFF16qrELCYWdFd0+B3SE+lyJkW90zr5l7IVz4hLupsHwGiSNB+
         XTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596229; x=1795201029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
        b=0kSVIfoQVDar+nh34JS+x5jXdUoIpQZwLyMb0ftTh7OtAA+J3Sp4pO9HjaN6q6U7Rk
         0aUyxS+fsxUnKxgM01JhgceeXye4dsj88TQF3teyoOW923fJO3h+6DG1GkuBvEGj901w
         1/kWfMJqvcbeSh4+QeciAHlmaXXwadW6A/4FTp7Ap+GzmZ35pR/UlBbbXy+3qSKwgTha
         04hKJV/Sn0mMs40yNBDVX4y2M5SiA0VkbCsdF7viHqzcNDT+u5FzI2ZCvGKyj+BKDb04
         kQKZ0HKN8pmR/OI+6/A4BO2IS5S+GXfH+IfaSMmIF4vodm5FvNs5a9zxkVV2tu6/Frmy
         8pBg==
X-Forwarded-Encrypted: i=1; AL+hErGWr9VC2Wj67Vzh1ZBPKDoMPiC3QiQx4sHk0ebvjqiOJV0OXYKf+y/Nqf2NgLfcrpq0Oa95Kbk70nADKsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zO4H4GHooiRrXpyuCZqBn7QkAkT5IBRYwmXJOIduqjDPpqbKI
	QoVI0DilfXzNXIVjZzPKdPRqLS0st8Ul4lwlw1v/9B83+dGY4LiocpKkUHeVWu+foSk=
X-Gm-Gg: AYBFou3fAb0XMeMHrKnO1SlmYtu0z+mkWyJwrHjnIiUGjEAg8o/YXV94TI5hh9M04uD
	QdMceGTcwOSB8+nc/Iqlk568vYQ1kMnuyHHSsq4fqBRif6A2u+Slzu58Fxjq/gk6Y0O4vMBs/fV
	0aTEuEFYOllfmQlq39OizXIptHTZfAiSYa77O/l0HNQ8JYu0H7cuzxNu/2b77P1lk2uePYBPdF1
	TGOlrMLPX1EBCh5FlGZq1dOzFkRkY5HT4PhXetC8lvirpp9xGh9teVlYK8H2bkmmhwSdS9mNsrK
	F246onmA6Pa8s1Oi2/evCYDrHGB8NZEKA8pwR6/0dhM1PzSa2xXyh/7w6twpNZtX4+CEbVVNopT
	FZ3TogjLOXFTy8jqcVKsGhpYdcwgeuYYJ/qehy+vLTaJ+gMK0hybQE4ONLYdDQi1p2OD5e5kDdY
	gxOb6kRovt6tAR+5AL/W6tMTgO6BK4TH0vRzKv/OYUqtXKXrSPt9hDAVdyE3MGwobouqqG5oUz/
	UQFgTAwc4TzWlzJfNZZgArMBdrjBtR9LaDuhtFJLsJY/b8lGpmKU/mrW7ps3orbLXa047ZEfF+A
	iz57aMbs7B4Aa9yXdtNgycBshCMrJE3pHOEj7qV5BufxUZI+4/M=
X-Received: by 2002:a05:6000:4712:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-49c73164e84mr7259326f8f.53.1794596228619;
        Fri, 13 Nov 2026 10:57:08 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:08 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 02/10] mm/kmemleak: use stack_depot_fetch_into() for leak reports
Date: Fri, 13 Nov 2026 18:56:54 +0000
Message-ID: <20261113185702.1332171-3-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

kmemleak stores allocation backtraces as persistent stack depot handles.
With compressed frames, stack_depot_fetch() cannot return a pointer
to unsigned long stack-record entries, so leak reports would omit the
saved backtrace.

Use stack_depot_fetch_into() with a MAX_TRACE-sized local array before
formatting the report. MAX_TRACE matches the save-side limit, so every
valid kmemleak trace fits without truncation. Preserve frame order and the
existing report format.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 20c0eb41c873..61ff4a10ce11 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -378,10 +378,10 @@ static void __print_unreferenced(struct seq_file *seq,
 				 bool hex_dump)
 {
 	int i;
-	unsigned long *entries;
+	unsigned long entries[MAX_TRACE];
 	unsigned int nr_entries;
 
-	nr_entries = stack_depot_fetch(object->trace_handle, &entries);
+	nr_entries = stack_depot_fetch_into(object->trace_handle, entries, ARRAY_SIZE(entries));
 	warn_or_seq_printf(seq, "unreferenced object%s 0x%08lx (size %zu):\n",
 			   __object_type_str(object),
 			   object->pointer, object->size);
-- 
2.43.0


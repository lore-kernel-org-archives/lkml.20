Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648443;
	b=wf0BMZ3XDqQ3zWKjkLtmYEkjlKlx3pTAF+dhBZSrmufUQOKOIzQy6TJoNZzt3WIwdDxI
	 am068h9pm/8YjVulgHe7X0j0FYlDbTMElSz0MD177mDTmsf7V422uWe3fpw1v1Tpn5WlB
	 /AW2zrdETTyFZzodbcB/IsXh6UouI+e5f7+lNBifG4Y5Fuf8CKxOxOJ8Npv+vud59s+Zn
	 HSKLxq86/VlnGMGnDFP+OxcukGUu2pp59NMh8OXOyOFZ10HUwX4c149gj95aK28nfSpZD
	 zfdvSfJLAUdRYnsHoH8WTwP8q0RAbe9EGEFgMN1ld9Rv2bBhORhSqV4u+IkN0FNAUTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WmRV8Lulw5LNOQLTu7BD8oJOuHGimi1F0Mal97dYcpo=;
	b=GWjCAa/l3xBYJyGJv04RAfUOFzPofH4YTkCxaApohYsgvugh2aakf/+DqgVR3Sx4gSyX
	 XFHxnWSKVnqsLh1Sw2Tt1oBZv1zpPs5nOyhdG3fuggMIVEekwnZfjimb6H5N+3pbePYLY
	 ZxbqiZVgXcXLq9YVaVUvgrfCgEXXLKsJIWdN3hh7W2/HjKnecCm7Zg5bpvocwaW7pzgGj
	 6X2kScTnQyuW507cvKNb3z87ytnCSA57UAAqSpkVcyQJALiAoId0lVQjl56dSqAX5LGE9
	 31CGjPafnCe8aslj3iD1MCdbuXQdgEaPUkDbYjyKnWYEz+v0oHCC3cQ59SdsxtEmt2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LuJPS2e6;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05C6083629
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C05C6083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LuJPS2e6
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a594d313a3so1967241b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648442; x=1794253242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmRV8Lulw5LNOQLTu7BD8oJOuHGimi1F0Mal97dYcpo=;
        b=LuJPS2e6ts/6+SmF1wNPojWv9WdZV9jUFqxl/rdq2oBi5QiygiWjAJbcZxi960n4SE
         BVK8AYl7b4HwN87iZki9nwvURov7ktUdPlSxcj84tAGMPEDhX0cHgIPfglvXrO1U/vwE
         fl1EoJg90OWAIcqW/9VmSD9w6ZotL0rAi8aYAaMQDXogWm26uOlMPnoeubd4jLHWGPYj
         1FDvIjSDGyeM0u3vTYH2URJxkbn13TyBdtp5jNXR/5u6mLHZinFv0PzU7SImMJrA2+uk
         hSDEK7/smWSZscAQWgtwfi80gRas8XFCHlTOaaVnLboQpdzd4LuHaxRhYnPXw6PYQfUk
         ycGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648442; x=1794253242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WmRV8Lulw5LNOQLTu7BD8oJOuHGimi1F0Mal97dYcpo=;
        b=LhYkJanVb2afYSegwrHdD4GgOjglhTPbmil/cYVwkzMNfB3Fs0+g0JAdb8rpQSaySF
         6gvNMraWX0SzPMQj9PrfSaIZ+f9Lv0/QDT4StjpXgIUAAfMuUWhfy4cArg8LX59wLiy6
         KSTNrrRHer+IyJF4QtXoFYyAtg2QvlRtO1xahXpYqfiTdpWFnmkXRGuq4zs+gwvhgNFA
         19rn4OriBCQjMtLyWbSQYxDuhl8utJOXXxLoZlcq0AF3PswWXgaLXFIkqOrA86+2QF3E
         5PUs91ePedsj/kDpNssmu7gnzX/5BpsmuSUHqXjR0py/PFAslmsJ9xXHEUhfnvuvq0nD
         sDoA==
X-Gm-Message-State: AFq9FYJ49MaNSEIhAiJqK/L7VdcwwCBbOpwhN+C48MPsBCKbe/nh6ihO
	XcMTWsiG/krX0kO0+svcmXUAFFqPzTBg6LuD13vT57w48JSPw+RdhaKxv3fMND1Y
X-Gm-Gg: AYBFou0BQbWBYytS4uaEjhqrTo89WJ94roFD3PyqDKD3oMKH6xyK85hdkRTwyF1Q4U5
	SlDA7ydG/XBFFcNZy+njkGu1L6gqv/rUacI0PK9SUUK7fmZfd7bd/xOSjs3N55/OOGq2jrUy5RZ
	6JcaNpaMaAZVGnBjlEWrVcVwrEXYpgpXB/t2WUHGfC8+Hv+BbYspsrgF61TR7S5n9gysv7tbAe6
	HKFIB0amFjkr7mbulXMMjqIPI+qIVbEb+YMiLGMfEACzix7eNswZt6+UzVKoTyVNXK5UCBoiwJ0
	FHtP/tgAPF+TwNRJPvQakumH7+IPAJHSQiHdSju6Y3fCkdcsEywe6yuUEHYwcC4INcmG5J6iBOA
	HcTdjcxpF4NBl5MZhfDqE+IS1jTOJQ+U7CV2tw5SHCDnH3OPjTCD/JBa+sn2Zbowvn09WdFz+Ao
	WZ0h8oW1GIAlFJdtYtoU3MDrMoKrvvbDDhAtiLIK0xy7B9qJhIkZ0PlXIDAurzSKif6gbeMZL+0
	C4IOPyohQkAFlyG2K2GUpomPQa5ChE9YTDNsAviQOmc67KTRQr90Avs4oGcQyAeKYiT13aQVTHP
	SjBr6qyaH8b9AeZHNZnBm/kp89VPbMiXqhgE82VTza3z7QkpD7gmDHIetjaNYclN53eHBi44s1N
	WYM+EdU1mmTiuyw++LF/nRXON/HG9/66jpDFf72aJq2Kgow==
X-Received: by 2002:a05:6a20:2583:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3e928aa2158mr9992774637.69.1793648442324;
        Mon, 02 Nov 2026 11:40:42 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 19/20] f2fs: count compress cache entries in pages for its memory limit
Date: Mon,  2 Nov 2026 11:39:51 -0800
Message-ID: <20261102193952.3002018-20-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

The compress cache holds one filesystem block per entry, but
f2fs_available_free_memory() compares the number of entries with a
percentage of free memory counted in pages. With subpage blocks, this
limits the compress cache to a fraction (block size / PAGE_SIZE) of
the memory that compress_percent allows. Convert the entry count to
pages before the comparison.

No functional change when the block size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b95bb5c27b0b..66b28ae91756 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -116,10 +116,12 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 
 		/*
 		 * free memory is lower than watermark or cached page count
-		 * exceed threshold, deny caching compress page.
+		 * exceed threshold, deny caching compress page. A cache
+		 * entry holds one block, so convert the entry count to pages.
 		 */
 		res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
-			(COMPRESS_CACHE(sbi)->num_entries <
+			((COMPRESS_CACHE(sbi)->num_entries >>
+			  F2FS_LOG_BLKS_PER_PAGE(sbi)) <
 			 free_ram * sbi->compress_percent / 100);
 #else
 		res = false;
-- 
2.56.0.317.g454f8302e1-goog


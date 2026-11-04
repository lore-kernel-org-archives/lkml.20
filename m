Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817483;
	b=283sNHQtSEEk+hxgntpUkfRH67vVdiV05KmY5iwwR+oXQtRDrlKSZMrb3zIVXAgziCrn
	 nlQT2S/jsFRywqXGoSfSoYfLjkX6b9Z1P7h5ZQciaRHYN3hXK8NlWdyuSnhxuTjvJkUJf
	 MpOKMK6XW1P0Ldm9Vx7uEn30cw/Dc2yQ/XHveC80xPr2dTI8JHwLDohw8w0iHhK+kYFPc
	 WXW/1qWEdmB20PDCIxLPKDLyMUcFpinAXBfiEe/JHUnA7wIE7TCLNhOLXFH0Y+wEK8+T2
	 cParMMwzKQjkPGQ52lMGjFKfF+hd+eQsxJPRDjIsBik00LD6E5eguguGzE5wb44+3BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=Q1wmxsLQSePodY82bbHdJMUI05Q4Tw1S2f4IXJ0gTlo=;
	b=b1Pb7q/D8veF2pLZs0CDATe4moaSNY1WKWtQydo6n9QNTrIgQ06QKPtLoGGsbRBLpZqP
	 f5zTZ7OgklqRr9IMTulWBdiw2uJBM20M/77wweRSdcDTXYTbROQkkcjBBYRBChvvfSUyX
	 gOg0WEGBCnsPEI2oXOm59SO1S9rnl4VeyGRDnHuZlTQYVSa3XpOh6GVW4g0t/XlsRGJvo
	 sleqZeutNy9Ry8OLexSRdHeUjXRnuetnxvP5z/CHcPGYXdrrX0RE/EhD+ycQ2q2UrgKhE
	 43JkZZm2bNnjHAIAxNLOWtOgYt3xkuuvBhHosL5IIVnFfhw0sH/KeZfoj00339ZLr6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH9zqhGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB9606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFB9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH9zqhGR
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06c60065fso684331b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817482; cv=none;
        d=google.com; s=arc-20260327;
        b=lDy4P6e1Ls6v4rtkkIct9aajwBbPEkBWX6qwTvYrVbIzVGtdlPJrELEJB2xlm0C/iA
         ocpkjmbWUt/MOyWTR8gQYyXheiV3Z1B+sOFh9Tm/0PVly+lb7GVxczj+VL+SZFFvkYwJ
         dbcZp+APYg1qFTo3ulyZmRv3Gq1SSRIDgVJIne9EzwKlbVpO2jbg/wD2acp3N55lSyLR
         QiHGn4Vl1kOPQ8TRnPmdplFNLx0EVcsIgzG9oBpsH9hsazphEJ+U6HYagaTs2apvzIWE
         k25HhYXVIrgiYnXnLRjsEFeCLoPG6Akpk2AAE9u7ThKdPPOWvNem5h66CkhCYD3yBH5o
         VfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Q1wmxsLQSePodY82bbHdJMUI05Q4Tw1S2f4IXJ0gTlo=;
        fh=JEr7Yb8TPUBLFgliKiXkYYhRYT1Tj+ialsNdEZhkH9Y=;
        b=e7AsdQPfx0v2SDpzDaWWyHxCVHc+8T+cMhOwEjWK59SW8X7q6ysgekN/WbwgKVU16B
         nr/u43HeXuvsDKGPf0edjm+jm5EnVYrXZizvIh31PK4nFzQoj9W0BwKJVoDuHjEb5ppH
         z5J17Dnv1NwXstkxRBmdQ1TE5SQt2pPmP//uLMWH+DEgc+yss0s/bY33LsZEaHwKCPII
         6X95h6VaSrrlzSMQiWaIAmnDG02R+7bcHsHuNq8zF3HPmWyW4VM5GGCrYbK9eqmCrCDj
         RkZZnlYsdjMpTOHza7qvDdOyIaIQnz29nC6Jr9W3ETwkDQgIY82+qHpCx5JNq19XsvCD
         V1KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817482; x=1794422282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1wmxsLQSePodY82bbHdJMUI05Q4Tw1S2f4IXJ0gTlo=;
        b=yH9zqhGRpVFjZl6MX56+ofVLYXaMi505TjjE3UlRemoGNsJqD+4/ZJCqBsbdiLJhM6
         Zyzth+530lX+swZppcjq2bUwJH/CXDmyx0PbRzJzJVd1Ncvh5ZBwAUvTIokV2eqDyElc
         j29mesO7ZOh9NixT4Q+OlJCaK4sAuWgKkW/xe1Yn0CBevtEtXO+HoPyCBVGTuAxFMTkS
         8qBCegaPSu/uqNJaiCb1WjtFbcHvko+lfAxc7C1MAGb8XEL9TWj+HvTc1NSbpgnAE9w4
         Xid0UX+BW9ruU6njFviahdKgY/WdXCc0xFs7ZgWH1k37ziYKnJLnFzcvP6c2TV+fd4g9
         ZqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817482; x=1794422282;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q1wmxsLQSePodY82bbHdJMUI05Q4Tw1S2f4IXJ0gTlo=;
        b=nDfLDxh41x5zj1o4n7jNkMlrpLZsJzGNIFrAyuKcuPjBmQIdnTJ3UYmKqqVHx+eBLZ
         wFL4TDndFlkeY27y70EZX9a5CRCWnuPxDUqxExQC78szymFBMZ4bKZv71BNblx9WgHIE
         HB4R9SP4lZ9lJDchgXLoi8i9rjmGn649GnTREm1l++ekgV/LiBJI8pcGe6Isoewc5rXG
         Flkuka9ppAgZIvVdhTAQyhY/dc3PBBb5oRKg/BzWgqLj5Z7181C+eUVUgVmbQ2rb9NDK
         LRt5uVv+1G+nIz97yPmVFIpJhji/xfFc9dH0o1NFWmlxJ8mBiwfuX+1diEAO1UHnUvfp
         glEA==
X-Forwarded-Encrypted: i=1; AKwUvByqIFNEIK/rjNcx5+QvO49Wy3MT6TiAjtBA6ySy9X7JoHr6S/0/G8Ov8lyt4Al8w/UVkDhBrX46bldi4Bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z959eg/I/tWkQAaFQKOaBpXmSrIXdFUegfWciYIgMWnFOmOb/9Z
	48JDMQNLKiVm9VD8PPxP2GiUgTSmIwLHC8x/uCUmqE3+IswQujtfrecbm38RMAbinSkmfZMwBBQ
	tu4MkxhgEJscsfy2eeBLHg7CWGkkzSzY=
X-Gm-Gg: AYBFou0wjoaJ37a3NCvrWO5FG1G3H411E8XdTdRdH363ntOf8wy2WV8uSXioKnxob7d
	u71FZOI8Fgq5miWU3+sc7zFWsoaKMahB0Q20K61m4ujpNsrvqAEC2//hIFzJYcNiqSUkBVcQiSc
	wZqw/A4zgVW2RORJroHK0Pr5qsnFYxcjbqGgpmc677wvVpuq7KZZrmn1FM4nb6qO2gZ4VbbEtmC
	r0MkblXtjdOSyf9Fdwido3JiJhkIflSHil4oyKSeKURJJy5bHzm5iyDJJmIYfZWDJwSIimugx2p
	KxS/sovGE4FWcuncGC56bQlw3BvhTSOv3dgIBb4gNbHtkl8bc/b3tkJaRWtyEj9ub0c9Rxf61lr
	Z6KIEGyV95pfZjm1olf52djsrA1XzpunFcYKbripZ25jEHj4EGFPWqU8yb+tm7Jc9v94F
X-Received: by 2002:a05:6a21:7807:b0:3e2:b243:5b9a with SMTP id
 adf61e73a8af0-3e928aac507mr11185730637.3.1793817482005; Wed, 04 Nov 2026
 10:38:02 -0800 (PST)
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
X-Gm-Features: AclHuK_xsWZrwV1QnJwJkdmZ_xJFomNPCSOpg18Qt1PwOwVMPI3VcgIGPeu4N3c
Message-ID: <CAL1HEBAGgM3uu8V1DGDFB5RcFikgqhJtvv3BwLRbAZuQoY9Q8w@mail.gmail.com>
Subject: [PATCH 0/3] tools/mm: fix three out-of-bounds accesses in page_owner_sort
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

page_owner_sort walks the records it copies out of a page_owner dump and, in
three places, reads outside of the buffers it allocated: the copy of the
record is handed to regexec() before it is terminated, the removal of the
timestamp moves overlapping memory with memcpy(), and the allocator
classification walks back before the beginning of the record.

All three are reachable by sorting a regular dump and are reported by
AddressSanitizer.  The tool is a user-space helper, so what is at stake is
the dump file being read and the memory of whoever runs the tool, not the
kernel.

The series fixes one bug per patch.  The behaviour of the tool does not
change: the allocator classification of a dump carrying a
__vmalloc_node_range frame is byte-identical before and after, and the
three patches pass checkpatch.pl --strict with 0 errors, 0 warnings and 0
checks.

Henrique Godoy (3):
  tools/mm: terminate the record buffer before matching the timestamp
  tools/mm: use memmove() to drop the timestamp from a record
  tools/mm: keep the allocator scan inside the record

 tools/mm/page_owner_sort.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.39.5

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832125;
	b=VMzYw07za+ZWu7yg9wmDcgy10BJobpGb5Vc1Jhb1CjP2SkIOzprYAlbVMTiv/dlzRVRN
	 3g2S7CDBLgxnA023ZjK9TXFNBzUZVMDjsw+79sDXyJBVrgwrx3Q0YjgTLSNgmfygmq1wh
	 SGObyALs7t1m8J5kgFHzK5Nqljp3Hfu9xW1syKf6ieUx3JHrMNzM2Kxly0lE7tdzj+5dX
	 o1hLgwu95TZ5oUpf3sZspvxif2wMkw22rR+K3lGEAAY8BT3KDEk+0IJzZwuo0bNHW2ebB
	 9aB5P61nuALTqUEZFy77TiJPNDKq4qOZ4dO0Gu/hiNOMwGZU0ky/8ajzxcpeDD1lPWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:X-Mailer:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=KM2UfG1CDbTrad6C0v+30S5aRLCtGDlg6Z1BK4++Wa0=;
	b=IZNz3U9AxvyZkK6zuHO9EiFFv6N2Of6g6AbI4YB8/UQcn7k5PNI1HF6h0LJmtzVGX5We
	 kBco91ZS2FOlRCMPlOe8aQm+lwHbeywd29sFN5XwLL5KlF5Yd0JaXU8+5mx10ghOuaqcE
	 GmzMk7+IkhZendwtWequYxO217ZZBEASc1Dn3wh0/nAVbsKt3i5lkJjoydjGg6jsa09b4
	 AhS0d7YNYiqzSfr0qN/RNADVfQVKW3NU4MEcyYJ4kmFNgBI2yVSHoNVgn4Jvgij02m6Ay
	 /9lR2R3+wTOHosFXThdyde+PbTrVho2NztpDUB13DsOIS2NJAOUxmK51sp5Q8p05f8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwcC42mg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A6606D806
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0A6606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwcC42mg
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f488ba6e90so487593b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793832124; cv=none;
        d=google.com; s=arc-20260327;
        b=knTNENL7NDkC+0sByKHODLZ4GT6bl7zBfsXFZV313OKul/Y7mZtVhByY61X/gPh8aI
         NLwOoEJYIBEIS3IpwQnxCZ1e6jJcahFqSklwMCDtkQwKFxM9qfemQwzZXZ/4KMIKWOIo
         9tFlHX5TPcXXQep2HoHo2sgKqChjut6wCqGGpwUv3P0+ObxnjSuelhBrHFb8fUrGhBaJ
         IzcWbczviilNqFVgR2e2KCCFJLpSXYUAEl99q/C6dA5X60VvM6XAbJGpELGkf/03NTjc
         ifHmaUD05FQB4P4UiDuyJbiUAU5dvACwp2llP72wH8cb+Q3PiNSKjK/08vOQk7xHMGyR
         eXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KM2UfG1CDbTrad6C0v+30S5aRLCtGDlg6Z1BK4++Wa0=;
        fh=/1uFFqID4ad6c3R1HInLdTEyYzwIy4djQVrv9OAj78Q=;
        b=Fl/2Jz1Yl4Z1TSUXw75qGWjlhbts7fr13VdjA5NzlN1j4nfLjnCbgAypDvFAX6WUGi
         wTj7tlIUzBJnQB5/12dGWsILZyuvipord/v6maJVurtd75dYL7S01XJBetc4RlHBnwuQ
         VXsQjXkdOsqd4FrsXG0f1Fzp2h4/5ta4Z5kUtpvjcw3eAb9OyKNBObzcCXznxuxyqiDz
         vr6Z8aEPo9BOil8pkkFot/H/LpcGboXeIfO645b2NJis+PfkceH/ky+Oiur7z9OJBHkF
         AdPVX7lnNeIGAOtmvct3vmDPZ34Ye9wuoHn2TlF5Z5y+RxoCLV+rD3NT638i3qf5wLAs
         1jxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832124; x=1794436924; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KM2UfG1CDbTrad6C0v+30S5aRLCtGDlg6Z1BK4++Wa0=;
        b=fwcC42mgXei6uYTIgDjSy46/tLw8VSGxmDMR6WqglnrJQ5Hy8QbxVkJ9cRmzSMnJMe
         ADv93wu3BDjZD5wi1nUm6pzQ9zfmyJO79Ma3714Rldi0z3/9BCG3dvVpDJp+z0cv6nie
         T5UakgXoekVREcISWxL/Y1aXGLJlR7U0tOrfq3gBjMG5vzbslzEeGYGnmcC7gpOwZnGd
         17dxJXlCSnNCFkviiZcAtqyoJlD1IwN1GOzwy06W+pJTRxn6vwIFcbJqxIiwIOTBTUWu
         5xItAEXmEVXm326RbVl/s8wxkhbDxJBmVfnQfv7aBXgfZC/3HXTegFogSmXXkez2Wc1F
         EYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832124; x=1794436924;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KM2UfG1CDbTrad6C0v+30S5aRLCtGDlg6Z1BK4++Wa0=;
        b=qJyCuq5Aj6D4wMZDqroWO1A2yl16ZJahMtIcaOJuT+IZviLV/i40+10oAyz6lyVzVH
         rFgos18S/nyx1wX440dtLTIhJVrZgTM76j3AerAMxGnh3oclJn5Zb0Wsgn6lc/Q5abgu
         yRnYUZT9vRAwM3qfNRlepYo9LnJNQoAzUPThvulBgnyLLjHNhvyxy0BarGTv0gM4pBxh
         bjczk5kvEGl7aY7cjRgiY3nonFqGbggyBfGUYhFeLEsrIk2RKEUNasCcXe9m5bJX9mw+
         golhL8tLXOYMHm/cYgYxesFKZgMdWp5UNhKu9fDwtA8TRzZYXJIb3BpQv99RU+rSiOEV
         3xAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfh3L6gIusinpa/73FH00OwadgsloIc9OHNTDrgFv/60CDjzJ7racbFRuccEc70TVJz5opKVK6+WfkyfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EwjL/YFdWWdsDHxKt8rGGJMCvUc5u0+5Z6alLevHvPQBPd59y
	qFWAzTbPwPst6LPUTIlyNS3UvHjAXjnP6DvfBaVD0X7fyg2dL9d+EzUOUSR/SillwJE6iiHj1T8
	99qVBblHsikmGQ7pAFIMNJWKUdUdhdeQ=
X-Gm-Gg: AYBFou3Q2VuThG4p30TE6WcBmq37wCJJuD/SvTXh3k7EYQegaZ2hgFpmWRaK5wpw2iw
	A6pW/e/+iWtcE8f99DtsZiUiDWGvAmCxZ2j8AoK9YCekV/MenUq2RF+ARJ4SKdESPV1u9vUMqaZ
	qVCcjsOkxHzXTV5JFCfd+EqF+sYugxtF+Jf8tSuJENWNA6UZubHeyPAJFYo5dD4JGq4is47+8XQ
	qj6lmxsM6tUa78qqdngjv1cvQ8i7nH47DEvHXOqQVukBeVG18rYGPG13EQFsHNRyQMWHh22WKaV
	CwITstmcbLYRxUrd6kjVMdSoZ5D9AWZd7Y6cwkRwe87b14XTiengD4OfwYilmS7BR4lPXYTqKzi
	0OmylBUGlS93kis/8Ap4Q5Ukd9Q2eTDVpJTOgAenLqarfJOqQcJU6qxIJ1K64jtPeGYJQ0QI=
X-Received: by 2002:a05:6808:1524:b0:4f5:4ce8:7e92 with SMTP id
 5614622812f47-5640ddc0cdcmr13133649b6e.48.1793832124318; Wed, 04 Nov 2026
 14:42:04 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 17:42:03 -0500
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 17:42:03 -0500
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <CADZg-m0e9UcuqQ7gNKn3jdyz3egU64uX15SMDbdrHXXqm2vvhA@mail.gmail.com>
References: <CADZg-m0e9UcuqQ7gNKn3jdyz3egU64uX15SMDbdrHXXqm2vvhA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 17:42:03 -0500
X-Gm-Features: AclHuK8c3FllifJchvsAJtZHSyoSQbjaJVAnkMCzwFSk6lXoBgXJQiVA5jTzstA
Message-ID: <CADZg-m2gT0d7AHogkGwratOkMESe2qbLVnLgwn81rPpTnih=WA@mail.gmail.com>
Subject: [PATCH v2] dm cache: Validate the discard block size before narrowing it
To: agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
	bmarzins@redhat.com
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The discard block size doubles until the origin fits within the discard
bitset limit. too_many_discard_blocks() passes this sector_t size to
sector_div(), whose divisor is only 32 bits. Once the size exceeds that
range, the division uses a truncated divisor, which can become zero.

Use a 64-bit divisor when checking the block count. The selected size is
stored in a u32, so reject sizes that cannot be represented before the
assignment and before calculating the bitset size. This prevents a
truncated zero size from reaching dm_sector_div_up().

An earlier proposal checks whether the mapped length exceeds the origin
device. This fix also covers an origin device whose valid size requires a
discard block size beyond the field's range.

Reported-by: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c8564fc0a96e3ecbe4d4
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v2:
- Resend as plain text after the previous mail client reformatted the diff.

 drivers/md/dm-cache-target.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a50724..7bacd88 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -17,6 +17,7 @@
 #include <linux/jiffies.h>
 #include <linux/init.h>
 #include <linux/kstrtox.h>
+#include <linux/math64.h>
 #include <linux/mempool.h>
 #include <linux/module.h>
 #include <linux/rwsem.h>
@@ -2383,9 +2384,7 @@ static int create_cache_policy(struct cache
*cache, struct cache_args *ca,
 static bool too_many_discard_blocks(sector_t discard_block_size,
 				    sector_t origin_size)
 {
-	(void) sector_div(origin_size, discard_block_size);
-
-	return origin_size > MAX_DISCARD_BLOCKS;
+	return div64_u64(origin_size, discard_block_size) > MAX_DISCARD_BLOCKS;
 }

 static sector_t calculate_discard_block_size(sector_t cache_block_size,
@@ -2422,6 +2421,7 @@ static int cache_create(struct cache_args *ca,
struct cache **result)
 	struct cache *cache;
 	struct dm_target *ti = ca->ti;
 	dm_block_t origin_blocks;
+	sector_t discard_block_size;
 	struct dm_cache_metadata *cmd;
 	bool may_format = ca->features.mode == CM_WRITE;

@@ -2521,9 +2521,15 @@ static int cache_create(struct cache_args *ca,
struct cache **result)
 	}
 	clear_bitset(cache->dirty_bitset, from_cblock(cache->cache_size));

-	cache->discard_block_size =
+	discard_block_size =
 		calculate_discard_block_size(cache->sectors_per_block,
 					     cache->origin_sectors);
+	if (discard_block_size > U32_MAX) {
+		*error = "Discard block size exceeds 32 bits";
+		r = -EOVERFLOW;
+		goto bad;
+	}
+	cache->discard_block_size = discard_block_size;
 	cache->discard_nr_blocks = to_dblock(dm_sector_div_up(cache->origin_sectors,
 							      cache->discard_block_size));
 	cache->discard_bitset = alloc_bitset(from_dblock(cache->discard_nr_blocks));

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

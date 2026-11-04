Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817481;
	b=Nnq8SQInYJhe+ktdVbF2w7NxUe4spnT4i1J4K7vSRVoLFOHfUXKvO9q9J4x1Da5yaJH7
	 diV4uWxV6qfMVJzXjqN4P/zyIIzri5lQ/NIiwC/NyIRnpiS0uv2Ab+myG9S3uL1Hp3+Ja
	 J5zpuN/9tNfF9+S7FGuwTwc5q/O/V9evhSVldyxuYAuZeMszIS3j1WIJyiq7GfGn5d7XF
	 DVgc1C+E8NsJIMyMJ3vUzNXsl49pn0q2O9JCHoAoCoJo8O4UUg4uDAckRork5gvbTFKBt
	 t786ye5I2jPPkAUL3IfRAZC9wR29xTewtbVAqZ6hdQUXCOIoFHDhnQll7bAgRv7OhpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=6Urpo8x211lQPcFBlpfaS0wiedhLBS0U38wxvyjMr8A=;
	b=WbhsCKHEhb12ksz0RobK7pWYoQs1V0S4Y09b44GXgaFq35bYvM2w/lqJXsOVB/TpuHZc
	 XYp1JiN993uxgt60YwYUjyDJIFgAt6SzBHeibjDtRj3d4TIA5KPz3ibRgCK5bDCEwXceF
	 7ZZX5kS32XVts5HuYQ/cTLJ0h1KLwBS+gy9pfb/AgMB6hBPx4Yn0tywNi9WB2wY1tQ7am
	 LUN4a2Ju1aTebwmoINWx6FK0sekaV0Fh/kzQctzE5L+PRxLjPZZlIlOJRi6sydNF/hyls
	 K82ScNTbx3U+k/jDMvcCMxpt6Is8qQ0RHKmH6fW6NQGMfaf8Ak68J8wmud/q6KXnlsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXABDJlk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D8606D811
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307D8606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXABDJlk
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso768782a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817480; cv=none;
        d=google.com; s=arc-20260327;
        b=RIh8K7chVHMppAKxMPQcrUuRJ91Z2IfFMZNJyzXKa7m9Wr8KPAzhf1RVMnq5x2v8n0
         lK6QNoQrP0IJD07T4NIavZIgiS7uCHiuBi0DYW7SRToTCABtM/h0Z46382vqZEmh6IdK
         T0cHcmmYQEX/q1rspfZco/Al7J81K0siinDBDqdKKj6hChFRDy9ETeYq+c0dqYaaTt7j
         7LOAUNmkND/9msJNQb8YbOlmGO/qxe9UFy57aptito55p4vrfj31Y//O+gR3E0T8fJVh
         QktFZzRO6RzuXV0a//MSfNvOMaYt5EZ2Gz31ti++Btx5UJHyx9j5H04XrSwRWzJHmgiT
         2ufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=6Urpo8x211lQPcFBlpfaS0wiedhLBS0U38wxvyjMr8A=;
        fh=J+kGY79y/vYF5XPRz6fKXT7u2D/1Vh4UaEUKOLHKNvI=;
        b=f2QE66eIuTEqqgKM0VmsBRFLK4voQnHPX6iF79SrKlyDCZJAK/zeB2Zva0ahDrpv7e
         ZNjX7rMv56g8p696NzfmbntA8d5sji7pO9h+pXU39sbNovzhKqZFii3hGlWXm8k+gHcC
         toPuylxgjFvdR5Tq7J3ZF9f9awPezsSosZCesL4XaATqYn52+UPEhRM+pBmRPVdVimdE
         NO62/W4G+08lZj6/TprZZvEUmVPIcHYo4T6xcQDuNIF6KiBM17vC2hGR+iyapxo0xGwO
         Tu2H+LtrBX7+2qX4XmNidpSCF+EaZvi3ESJUS5KqjZZ1yJ+YqRSifKwyRnk0OIm3M5ny
         6fFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817480; x=1794422280; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Urpo8x211lQPcFBlpfaS0wiedhLBS0U38wxvyjMr8A=;
        b=QXABDJlkCwyuENUOoO7vE/WROGfvfzgNiyA75x5rcyjr/lVwBbr2W5OGYjXIfBAYEi
         FOY8XMCKVQDBE6bz38AA/HtoeE97k/pjaaDe8blHfqtlohRjolIGeUGihfLZl6Ag4ZEm
         PJJIiVpoXFtxozco2nxIvj0MighDqOsMIRFZuZ573H//nq+Gn4uADVtC7QbWgXMJBD0V
         m2MFXmZWnSEY+aZiJbER94+AATBpeodgToQ+GLFd+7QwZzyuZkjvCTM0EleksAVUmBue
         DAcs+XEmp8m3dlFdk0+Nldr2fBlBJxHpTxn5N/ToIKCTeRp3jNshhByKdl0EePVSb1V6
         VP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817480; x=1794422280;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Urpo8x211lQPcFBlpfaS0wiedhLBS0U38wxvyjMr8A=;
        b=dVvLAj9sdZHLCz3vgw4lNs5ZXMGxDryF8MY/7kHYKI3F7z1C/O/KneyoAqpMtXNqkH
         +fwgTV+YymRI9EGnNrQDevGXeXDa4hM98wwKHZ1VfZeCDyG53u95/RPoDp53tgpC/y47
         fiwRqncpyDUgUjCS5CToVdMeNlLVup1Z7OOzmVluG/qZKMUD5ZvWSiiLAPm3jJhtm9Hg
         g8xojq+HZo5uGwc+QKc8EDQ9JjyrrGt+FEYXBlv2OdjYpY9/PamCdRVqZg4moFbdr/1S
         UST/Neixw7lk02c7G0tM2owQPeXYgOEyJd6H4g7N2OxixdQ2fk4vtOA3T89yvhN/zpP6
         dgnw==
X-Forwarded-Encrypted: i=1; AKwUvBy98D7Z1ICuBvIAtI64BLi6kTfX8Fe6nOQIgJgB51r9fdIa9bnUhCv8bs4sw4A857XirCFF+0xDp83igok=@vger.kernel.org
X-Gm-Message-State: APuU4Z98q0k4q+IbgZjzsEKiVfxNjuxy/XG9dpY7X0ex6nktAM4hiGdO
	wjDUurDJ1zIGKxMAW1Zi2W/dc5Inc43g/uisAClYWBm8WmKiqRvDkGhM8gpGrV4J9xqn5uAcF9K
	gv+Saz/Isj/uXjYAhs0JNpkQLS8gFxko=
X-Gm-Gg: AYBFou2m77rj0ZjqzXJc8jw+9EzSzizhNSjSng+/OP4hHNTSIMSFlDBvxT6s//+69qP
	3EUyaISAl0iSsivWmng/tgXg+6h6q8yVc4lidkhaJ4E/Y7eYNZsrurTtDRE2n+tbmN7qCUIZgqy
	H/U/c9B0qx/eFQNFxFQY2DQQ9R3/Bq2UxxXV8ZVuX1a3aU3x11FJW1yIBgfy85tqjoo5vYsfE9b
	BwVzThhmrMiv5HoS6TFvxjT+zfHn3+Y304BbDQHMM806ZW15uOUx2IZyN1x9iLxil/qPxYWR7/y
	5FqZ9JhwfGW465/n1Scg8BPE/FZPg5MdKbTd2BgdHjc+0rGno/XGPpnxY1cfwDBusjY2xwdEItY
	Z/oepOGW6qQdfLqrAJQ3Ey1ei5/lAAWnnGpR5Q3iCqShdAur7GlF0vyviIo/Gfj1I7GqLzLxMYs
	oO9p3AdoQH30BcRg==
X-Received: by 2002:a05:6a20:2d10:b0:3dd:a197:ede6 with SMTP id
 adf61e73a8af0-3e928dad9acmr15255522637.53.1793817480466; Wed, 04 Nov 2026
 10:38:00 -0800 (PST)
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
X-Gm-Features: AclHuK9foKZNERROdd0nEAjbsS6qJdBe7wzaP1YtkufcB5bE_vW3shs-pG7olUQ
Message-ID: <CAL1HEBD2mF4YygMQx1U9m74uyfBGbffdF3-mJ_WNPwQCnBGpgw@mail.gmail.com>
Subject: [PATCH 1/3] tools/mm: terminate the record buffer before matching the timestamp
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

add_list() copies the record into a heap buffer of len + 1 bytes and then
calls remove_pattern() on that copy, which runs regexec() over it.  The
terminator is only written after the pattern is removed, so regexec()
walks past the end of the allocation whenever the byte just past the copy
is not zero.

Sorting any page_owner dump is enough to hit it:

  =================================================================
  ERROR: AddressSanitizer: heap-buffer-overflow
  READ of size 163 at 0x60f0000002c2 thread T0
      #0 __interceptor_regexec
      #1 remove_pattern tools/mm/page_owner_sort.c:248
      #2 add_list tools/mm/page_owner_sort.c:593

Terminate the copy right after memcpy() and keep the terminator after the
pattern was removed.

Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 6c2ac5d..58d4a54 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -589,6 +589,7 @@ static bool add_list(char *buf, int len, char *ext_buf)
 		return false;
 	}
 	memcpy(list[list_size].txt, buf, len);
+	list[list_size].txt[len] = 0;
 	if (sc.cmps[0] != compare_ts) {
 		len = remove_pattern(&ts_nsec_pattern, list[list_size].txt, len);
 	}
-- 
2.39.5

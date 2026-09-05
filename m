Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD33644C4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788651815; cv=none; b=M+MJ4w/L3jFZLz8BqS5jZmycMgABo2DiQdE0fgAsHiUxFVJ4VhpvUnHlN9aY/IW37Nw/T63qKUVYu6csmo5hYkqcA9sQ8T2ehJHSAJnlw0Mt2E38+YTy4PlayneQOSE6NntJjaI3mqjkCk6DYDpl4pYpsKAus+qMSggb16yCFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788651815; c=relaxed/simple;
	bh=zchHN9arP9ge/dPrqhBbh2MYBfzGH0SN9zBWIUnJFGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmtcvgQQHOkpSYE6ShKKBjt3KhjH9E9Faxo3tSNkppS461/eBqwmqTnBttFZvwj76ESDUywEwpLdiUwjf7mHb4tg8IfwPfmZC2EGevcrOLbKHUSXcfepfBG530Ib0KbSNEIkuIKQ7vAANBz39p6iZ1idr0Nx/ORwfBhKBEqmd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzN/efT/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzN/efT/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso3336639e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788651812; x=1789256612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbNBfLErXJ0W7XLwHtZHjCp30XgpQStS2wuh13GP0sU=;
        b=NzN/efT/7+3T4Wjfvbb9e1Z9J7p+ef5rEBXsR1udqIOJgtuYl044xo9RAHzk4V/EBr
         CyiDkpvdg6QTNaI4EXcKXjnTG1E3gnOzAkKPEo/ai6YcHLT3HzwLWZMOQvJkeBGPe0A8
         Z11zSSFlfxGUWM/aYGKQKYGLXFvWfwcFhXSZxGWb8yVZA6/TBhR6kEuocwuCCdBJJExd
         EX5V5FuO3kM8JcJMDlDmDQ7G1UrGgKzJXX85lgAev69Pri9wpEC4Nt6c0K9aCvuRaTOm
         dUzIsQ2saQlNMfLWgzexLT+HTffvWZv8QXSvi+Pfzwr/3hRU632ODLFr3IXvhIhTNiw1
         eoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788651812; x=1789256612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UbNBfLErXJ0W7XLwHtZHjCp30XgpQStS2wuh13GP0sU=;
        b=kMMsQv9b6LYb5DdF69WOZpZ2x0PdPx3kEZBWNDN4f0sZxZezfsmaNDKF57maPJabgF
         8ilbLk6zZ/BFLcQPU6g7QhiXc3BEH2gWtb8FervcvHXdMcXI4P69zaLOUE7Gc1iivgSx
         3qbWZUFIIca6pQDns4dX53IXSSZbvk0w+Hq5y6z1HbHummxMF3e4vL/3Xdl8drzcL4cx
         RjtMbLYhswlbVIXmmgFSjh+lSK9a/NSTlBTzl2L6avc9GTfi7/JnTWHtM7nwZRljmHvP
         iOQre/dQz49IYYNvodohATbp8xg6SUWbhD5CIjsRdV0VzdqlW3H67+wbkIu+vPW3um4+
         ySsA==
X-Forwarded-Encrypted: i=1; AKwUvByG+LhJ6H+hRz1kDGxZ7lnu6Mj1YKq/UMD55VPAr/NOSmYo+T3GXxSN6jRfxtHpSKQg6Ar08FDqnkpH2/4=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjCAMvxxQ3WlU9IDL9cIDxfG1YQYEr1ztTdMa2y5QUbnnMLfi
	iwsxK7PQPmDflsNTYhgjC5BspURAjNxDdNmU1sypAzpWcVaWHLAODCLq
X-Gm-Gg: AYBFou0mhbTAvwLp2RLhzoZ5TbboeUAYZKH0ZrYYrOWXqN/B1qMSyGHoAasp1NScoAG
	1po+bWjox7PZ0FCXtumvgTNGgoNtvluDN4dBDHdIoftS9UsaE7JWe5zaMD9PfjGS30bujbkAtlZ
	LVVHOTVNuPj6OMP2mRFb/5ztKhAgzi7XIujHbv2SAWrYRBaad7CnkEXPKHOa9Sv3RP8NJ9RVrNi
	uxaL/vfNR9inD1K2gpR/0SOT7AXaFgZ5fkUgwRyPKPJ6M33CrDTBfr2gFk65UVuY9PBuoeqFZiI
	ovz7Wu74dckNw3yjygr3F0mPvMNO054J2kH+e6kGFXRi1gh7uhdRkzGG7tUDGJn6tXWuVBPYydd
	XgEWHwmq7mbAun4nicSyC5y7PXCVm1VJeJzNOxzAFS+5hnqvIyY1hm2saZFnrZqDqmBWhfFGG7C
	SzWl6btlhamr6mW88eWzMZhxZxmiTXL4nDRmtuaslV+ibJRS9tOExX5PRDbzmHWzQzUHmfdnBRO
	KHyZrZv
X-Received: by 2002:a05:6512:2206:b0:5ad:68aa:8a78 with SMTP id 2adb3069b0e04-5b60e6a5360mr3012076e87.5.1788651811350;
        Sat, 05 Sep 2026 16:43:31 -0700 (PDT)
Received: from localhost.localdomain ([80.66.92.203])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616705bedsm1329357e87.67.2026.09.05.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 16:43:30 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: tristan@talencesecurity.com,
	tristmd@gmail.com
Cc: pkshih@realtek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: rtw89: fix OOB read in __rtw89_wow_parse_akm()
Date: Sun,  6 Sep 2026 02:43:03 +0300
Message-ID: <20260905234309.6922-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830143154.1751910-2-tristmd@gmail.com>
References: <20260830143154.1751910-1-tristmd@gmail.com> <20260830143154.1751910-2-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Aug 30, 2026 at 02:31:53PM +0000, Tristan Madani wrote:
> skb->len is the total frame length, not the length of the IE portion.
> The IEs in an association request start at offset 28 (24-byte header +
> 4-byte fixed fields), so the correct IE length is skb->len minus that
> offset.  Passing the full frame length causes cfg80211_find_ie() to walk
> up to 28 bytes past the end of the skb data buffer, triggering a
> slab-out-of-bounds read.

The length passed to cfg80211_find_ie() is indeed wrong and the fix looks
correct to me.  I did try to reproduce the reported slab-out-of-bounds
though, and I don't think it is reachable.  If I'm wrong about this,
I'd be glad to be corrected.

cfg80211_find_ie() walks the elements via for_each_element(), which is
bounded by _data + _datalen and never dereferences past it.  With
ies = skb->data + 28 and len = skb->len, the highest byte the walk can
touch is skb->data + 28 + skb->len - 1, i.e. exactly 28 bytes past
skb_tail_pointer(), as you describe.

What follows skb_tail_pointer(), however, is the skb tailroom and then
struct skb_shared_info, and both live inside the same allocation.
sizeof(struct skb_shared_info) is 320 bytes on x86_64, so even with zero
tailroom the 28-byte overread stays within the object and KASAN has
nothing to report.

Measured on RTL8851BE (rtw89_8851be) with a kprobe on
__rtw89_wow_parse_akm(), on a real association request:

    skb->len   tailroom   overread   slack to end of allocation
    160        1552       28         1872

So the defect is a read of uninitialised memory inside the skb rather
than an out-of-bounds access -- KMSAN territory, not KASAN.  The
practical consequence is that on a network with no RSN IE (an open BSS,
where mac80211 emits no RSN element at all), the walk continues into the
tailroom and may match a bogus element with id 48, after which
rtw_wow->akm is set from garbage.

That is still worth fixing, but it may be worth rewording the commit
message, since the "slab-out-of-bounds" wording is what justifies the
Cc: stable here.  The same reasoning applies to patch 1/2.

One more thing in the same function, which this patch does not address:

	rsn_ie = (struct rtw89_rsn_ie *)rsn;
	rtw_wow->akm = rsn_ie->akm_cipher_suite.type;

struct rtw89_rsn_ie is 20 bytes and akm_cipher_suite.type sits at offset
19, but cfg80211_find_ie() only validates the element header.  A minimal
RSN element with datalen = 2 (version only) makes that read land 15
bytes past the end of the element, and with the length fix applied it can
still reach past the end of the frame when the element sits at the tail.
Checking rsn[1] before the cast would close that too.

Thanks,
Maxim

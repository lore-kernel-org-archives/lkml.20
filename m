Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F13E00B8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456696; cv=pass; b=RXtEd3zXC5dwAhX3d4CfzZleJenfqK1r+6eGD4Exikjejacb4cQ600/XlFgm/04erM18HPu4CLf5mKNc+s6lYjDlguTIKktm2Mry/cQ2/sNqfnX6EOOaubAvBJmrGVWiyc4nvZ4G+9zcCfUcvMTfyzgM/kmecmLo23Go/0BDtnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456696; c=relaxed/simple;
	bh=waEYwU6s0rfg95pT6ZKFiPUyBmp+lu1t0GLS/lCY70Y=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=LUIB+z67KMdBz1VGMzD7+F46dSSl5lUl7nDNLFZRbCq9Mba+IfuqQeb6lrzOoBHaIrfoL1huhEkJ+EJcv3uW/aYoJTqq3tTAkLpmEkN8gD1N8EKUCUX4Pt3R7o9RCez0fEXPRbeLWmPxqrlBzLBvJYTPhDY/idU4K+wIWr5YwxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnMCatrT; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnMCatrT"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4af81963f35so1657336b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791456694; cv=none;
        d=google.com; s=arc-20260327;
        b=rU4Se5g5MaH/etV0J9uzXEvgJV+jn2CuCgkpuX4o3ufAWseBCznCDFHPqpAtGiD91f
         wvIu6V8Zdw2Gpmc0nW3nua8qy0n7AvI5eF7YDVOL34A5xbH91CrSxtOXRDY8YtGapH0c
         mgF0hb3JmuqooMeqHKHEvm5TRDqP+68ERtOmqtwM96BHuK84XjjtUCP0iETozMGwBYOh
         48DY8VYIjMtfpWF/lbQ/Lz5ntHz+FiwTk/0QYFHtnDIZm84sr9kvAQyQSJ50lSupyeqC
         ex9OGmwqKRezFLdeWCRfQ//ZNDFaCpKLrNi0fphAr3USJVt9QJ2aUsgJfa8SrD/c8SZJ
         sl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=waEYwU6s0rfg95pT6ZKFiPUyBmp+lu1t0GLS/lCY70Y=;
        fh=e2hw30cY2Evhogwwrx7+SnmKC5+G3MBeg+70CGHeGmk=;
        b=qiwGTxycakYMFSt+PX2/sGqva0ZUU4kNAXpB+cdqG/ZYYZoGqQVIhAJTzkoRUcrZHQ
         q3hvFiYecjCBUTTAmdTTnAcAaKrWhICMUZpY1Hy48fCoGQmP2A75QjSRDvrrkBC3ULOg
         WYKchh1VWAzxPN67r15yjKtcWXnHxQ7AVw9CrHTByx8Q+aTPIGUKruJ/TE2HQwPZ4MGv
         S8z4tsxr8+hMu+O21x+uHibJ11EkJESw4Dummem6rVxCBoWSbCHvuvG+iNC1zfmPM5Jz
         HeC5Us6gillYjIGHSXy2aL0mFcfa2Zy/1QIb2cWaduGjHOWbjjQmQIc+zgO9lBJM5pyl
         5YKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456694; x=1792061494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waEYwU6s0rfg95pT6ZKFiPUyBmp+lu1t0GLS/lCY70Y=;
        b=DnMCatrT1ZUzgpt5QrJWZhv7izUfRIwbLrYGVwLxyLjb9BR2nBTugN/WSOgjwI+xNt
         6yRfOjqrF1X+97lrTyYf7pkaDF+uE/uE/3CjsmlqWvwhT5RN7S2DnJ6KMPbNGvLvXSWM
         hK14IVU+tCGLwRrurWgX9jOHfKPT4A+oXlez9dQYJlm4QX8/EI96ZLtySBcXV1hAMPIe
         lXtio2pLhYvKPZ7UELgHCFZpMWiGC54bVsPwwxRVNZUjCfEkYfuM3B0clkSY81gzSUKF
         bMYkYp8uKDXFFhuf3I/frI5Svh4ds7K6EReWpWG5cH3JEC2K6Pn5xzjaLDOipZhuFwJz
         wK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456694; x=1792061494;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waEYwU6s0rfg95pT6ZKFiPUyBmp+lu1t0GLS/lCY70Y=;
        b=R+jxDqSLnaHDrZMhirDTPSdEYKFtM+FdNOQeFhNtkSzsHDthvqDOkgdcqg5vQsHvzV
         elydHGg5pU7MFHtwNYzROUzRtxnHR/0b4bEdEgDlADyY2k906pmGSnD4wkapY6w3QvqJ
         2J0DNzhm/fADa5Mo/5mOd9t2sSDm18RBW216H35RLnPameFzva273QsR3EX8V8xO5Flp
         g4D6HeyjCLvvLtM/5HaAwvUzF85IztVaZJQz5FJr7gBkH31f+wKxJvCouGKUP6/kqkzF
         Z/+pkgS0cTKcmdujqCzLlpDjSGzdSUlbZB0LekpeujXWKMZVPqhq3NXO8JS+81vfJHTB
         TglQ==
X-Gm-Message-State: AFuF++m7OwEOYvh3xYpReJu4Za5MWIzNeqXpHzDybfBr71NJ/x6sbZbo
	AfE4VF+G+60KJYZ2clTwGiyGLW9Lg9ZRd0Frbi5kuzYriEzqdAxwKQ10yxpcYfgYqwjF8B2hEGg
	gVEFnIOUDMaoeJTP8J7DeQHy8o1FRBhwXp7bj
X-Gm-Gg: AYBFou3vn/A7ybNJV4IFCZdYW09XuWNEN5a7cxiw5n2P6nqv/Q9pMrEGF9HbblxC1j4
	iZsRRPm8L+LS5wruyNmWCqPC5rEJqBs9CC/Pn1lVyUmWwc3DumXmO2iodF6KKKnAaBpDMWrNj4v
	rWgl4/iC2qaMB9oIjTv98ZIJzBbKe3jR2W5wlugcHYQkWsjOSYEECykKLEuwiaS++pHYTpkiJWJ
	lqHgt7qdduKNPVg02Ke4+itv126M0/k3jZ7fKf73tRwtfKJEl+Fc55TGZTGmNr1eengJ8VF493y
	qla8jNZCFnY9WxJirpiQa1mx59AtRU7bhohyn6A4DkI9VCAw2Q1Lx9IUvtdGLypC+QeR++QqfO6
	vPRffxtE1vveZ2qXNDNkWlRpyfLoJt5+IENuh4S87IgcePh0aiw5sIRBa
X-Received: by 2002:a05:6808:14d6:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-4fc435fc5ddmr4908352b6e.9.1791456694045; Thu, 08 Oct 2026
 03:51:34 -0700 (PDT)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 03:51:32 -0700
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 03:51:32 -0700
From: adrimg3196@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 8 Oct 2026 03:51:32 -0700
X-Gm-Features: AclHuK_P5vf9ra4U09whLUCH-Dc59ntNx3hzUSPQNjtu0g-6sMr6RIovrXySKmA
Message-ID: <CACO1+RSZuymnONwwmmRj=2ji=hNP4MTyOZOPKvR-Rr1OXQtJ0A@mail.gmail.com>
Subject: [PATCH] KEYS: Fix key_reject_and_link() race with keyring restriction
To: linux-kernel@vger.kernel.org
Cc: keyrings@vger.kernel.org, dhowells@redhat.com
Content-Type: text/plain; charset="UTF-8"

The restrict_link check in key_reject_and_link() is done before taking
the keyring semaphore, racing with a concurrent keyring_restrict()
that installs the restriction while holding the semaphore in write
mode.

This is the same pattern that commit dd3ea3fc ("KEYS: Fix add_key()
race with keyring restriction") just fixed in __key_create_or_update()
by moving the restrict_link snapshot to after the semaphore is taken.

Move the check under __key_link_lock() so a restriction installed
concurrently cannot be bypassed when linking a negative key.

Signed-off-by: Adrian Martinez <adrimg3196@gmail.com>
---
 security/keys/key.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

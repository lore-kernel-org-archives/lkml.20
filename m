Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685699;
	b=x/G1/+mhi0IQKVOtu/GgYZauSWSZy/3UgOLCo9ZUqKcNsbSheFYsnVNTMVh8Tt3p31fT
	 DS8nWnFH7BVeJipO/PfZwVWzG9m7C6d0xhMOWFJcQqP6Oh1/PbZug9BRZt+bONKkUP0d5
	 /FGMefbCGuMIEXvIiaWAlvItgaQAm/yy78UB/dmKoVlRjUsQq/IV02Buk+czfTBBQZGED
	 z9pxs3L1X7EMaQMo4rYr4hXg5rVdZJDZKDzOq9kVfIi5R1zISSHCSqW26Fr7ATYsk98LK
	 3sAuURLoFlpwhAdgJ4tXOqWaXcv1JuaDb26kj0v38lARO71XQ4WENhi9swt66j0V+rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=32W/TLORMHvdyxB9kUYfHwQgrTsCdKwMK9mAoglU6Uk=;
	b=pR+Lev7tkBp5JjUn2/8ap207hEXeEfkhZBt+TEdsJNfEtnYh6Ye83mG9ovE2Yp7LnmVh
	 ZCa86qMBsJGjXLnolwZWQMNPXYUmEmIYq2+Ex/vBDPKuaKAPXC+ijkLFJpIxLiFKG72Xa
	 0TQNNpwhPApK2PyiVuzG6eABI/x1mmVGuKlaNXWZchkxLb/q6x4nuYFWHQ6kFJs2XRpzN
	 oPMuHmFBgsscXHJzsv801GfHQrPRcrfojIJ5+mSqVjYRPZdOPJg0USPi/P7ZIgJCQJ9/c
	 qomK2SINWiTiado+cvpTfCgy/P8fpKgUD+M3T52+HF8jD7ew1pb3ptI+hw3UHmEhAZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vnDkWmfF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vnDkWmfF
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7907f01e487so2388137.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685698; cv=none;
        d=google.com; s=arc-20260327;
        b=BjfWsfMTJq0lHvpYibLIC12Lwu31jCsA+TCMCJmV8uughoYa8WfK1r/vHsp1c0qZll
         P1SLWo58E9f4Pjhm/yKR/0mn1lgw0fmJTE4sH/atUEfLmnNt6h11oxTWbN6R5xmERwh9
         AavtqOlLgKmRDkSy/9Boyeyzd0vhTimOa5RN3UADYQeRWMlxMbCl8WTkZIM2i30/fDMp
         r3LJu1Xy3Ok44BwTBJWe8zzIYMGdu5gMENY2rmBQM3uHXBCzdEsMXK1gWtZzLgla4/x6
         Y3gDlqtiVE7WrXeJ44tX7LERpTeZLRwuDb86+PsEBFvHrjNJLjB5gUvDhp2zYrlX3qRN
         T1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=32W/TLORMHvdyxB9kUYfHwQgrTsCdKwMK9mAoglU6Uk=;
        fh=ypS49TxROm4WdOfrK+j/SJOQzWiPbTSHWW2kaeO7INA=;
        b=GJDh9yrtuwtJcuEAT7dj2ZIMnyQFu0LX+TcRv8K8Oq9wHER4KNOv/jtTChlOzobB9E
         fSl9oQNd0pzwFxHIT2aRPVYNwpqDMzgLhZfE0LOZegUJ9WCgnBKHWtXE3ZlAn+/QE7iV
         9bH7TX5zI7XMRn2vM7WG4RwiTpmijmFcb0iLTeLNAaWtMfcyXQTyPdlkf6k14fxy6m6m
         /ycjRkzRIVSex923Q8prL6kt8kuSKxiNyrJ2Go632iG9Nq+ywWhegrd9mypl+dAQpgXT
         sVzMX/FSW89DAkifwWTg7C2Mop10yQ9GX2vxSZ//5+J9Xk9iHQHcZ5Jtd/KRlkBpebSp
         odYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792685698; x=1793290498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32W/TLORMHvdyxB9kUYfHwQgrTsCdKwMK9mAoglU6Uk=;
        b=vnDkWmfFb6Fn24uBjpt1+0C/XeA10AjvK+jXhTgmaZMLL+mc0C1NBKeXmU2rzm9ImV
         8axdRaciQbQBmWi+jScGK4klvtnqsFBRHXe29ZLR7qMgjgKD63yB6Smr285lhIS63bTd
         eRzmEi3C2cLuKErPN4O6PVXZQ0jv6TSSuoQHx+rXn0VsM/Tq2VyH5caoHOaVeyZuiaZO
         QyPzyAljxt2oB7EFNNB8fM/WuSKfKAzp5yL24b0mmikGgPQBaD/CrXG+lYY+y8+w9oVh
         JXD0PxRvN9DC2P/H68jSfM8IeLhQ07n7fKsRQcWNjThVQOXMnXs/sOjKqggJ6L14m3FH
         VpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685698; x=1793290498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=32W/TLORMHvdyxB9kUYfHwQgrTsCdKwMK9mAoglU6Uk=;
        b=DnOJoxekZFmELdS1NTPpg+dTH5LOYrBRf3sw8F7KavjMTFkw3UuHuiQHM8ptffEbYY
         2BSLoZvhYxecxqoUGzOxTGP90qI0Zmn6wOC81hmuWxQ5ThFAL19Hk8tLn6jApeSUFXas
         5o7QnIkpKhov9LgUYf7aTVT/pZCZAmOgBoar25Ht8WJaDhxazE+PqT2vwCOJTmqh5QIY
         0ZtAVrW7flEXq9EYIf1+ZIvCBr2iOe25J4hnVOUYwuUWOJy9Wil6fnBjItMFV4zHWmOV
         zbYJ55lfL92ZvmfcTylWFPeXZCf4fyibPN5Q+ofq/sQWou8xTFcQOhcyzqZaKuA3hGsP
         pvzw==
X-Forwarded-Encrypted: i=1; AKwUvBwWSZMZTXNaLN5KV7LDS6nQrmfiz4viVWD1cMZ5R8KUgJLEYUDJc6nslXHmBE/iJK8KvKdwm4wxpyj3L7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaC9FgggcKdmG3UWMKXf4ZpdL3SgckFOHoU99wEuDLKHdrmbhV
	1LJvBAR2U3yTJDXGU97pfunAWoRKNUsgKEP7QCYwtbILTIk9D5tgQJ6XOHzSyNjtx0Gf5UNYdjZ
	jdCvQBjnagzM3rJpbsg611QOLm+4IyNfXWFH4Ysuh
X-Gm-Gg: AYBFou313V456z+TGH+6000mhn+c1Dw5z5U3/onUVXunYkHVNcVH9w+h1gJmum4TbZo
	7Y50WSHbcuXXVq24nONbng4P7j1VcRVlgzvpqZWO4y+sxMVCI4mK+Hla/TtiVWsuPztu/FMMQZ2
	hvdiMWlmzXLvaJmOnpyc/oczkRqhHWYq+/en/lgl6+1katgeY2IJLzlhRapTxmoocutRHopNygj
	4rp9XAYb/vIaG7fkSx5zHfWizHeERWrA57vWANldJ3RZ+LV4byWt7UMqWhT4dxM4kK5XWj+yYD2
	5gtU5OR5R9n4qzp0hRZ6Tredy/Vo+GsGOlRH0KIjb7Sywa9U8L8v0W/LOuib0olCkGxlUkqh3Kz
	u/IqvUj/Kfltb385Ne0DCQmpQanRIrdekKWaj1IP8tqhiVDHxWJVJ8k4RmiYyE93WlTnhbxxC5k
	m55oHTRcDrY5M=
X-Received: by 2002:a05:6102:8689:20b0:7b4:eb1d:d1e9 with SMTP id
 ada2fe7eead31-7cc93ac38f1mr1449225137.5.1792685697620; Thu, 22 Oct 2026
 09:14:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013205223.2396822-1-arnd@kernel.org> <6c18da11310ced4a7c85ac7862c3f5c67b39891a@intel.com>
 <3486e0b1-d188-47a9-9de6-7ee5c2cfd097@app.fastmail.com> <90fe0000d611f080164a1fd7f228cd533a2e927d@intel.com>
 <CAG_fn=WbwZKeaprUu2q640ffLfxOSsGAjGE3CcC8fm7yeJ77AQ@mail.gmail.com>
In-Reply-To: <CAG_fn=WbwZKeaprUu2q640ffLfxOSsGAjGE3CcC8fm7yeJ77AQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 22 Oct 2026 18:14:19 +0200
X-Gm-Features: AclHuK--rsXJ5Myf1mlhnm3dw8FN3KT0MKGkzp140BmHAIBqC5OkBPIMAzLleOA
Message-ID: <CAG_fn=UnS6wqCfuvjTeSoK5QmzhDc7=5n=U6kY1qFiPenidPKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: reduce update_display_info() stack usage
To: Jani Nikula <jani.nikula@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Chenyu Chen <chen-yu.chen@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> 3. The GCC estimate itself is also fixable (make account_stack_vars()
>    add the redzones it is going to allocate anyway, ~30 lines in
>    cfgexpand.cc). That reduces total KASAN stack usage by ~7% for
>    +0.35% text and fixes this particular case on its own (704 -> 368),
>    so it is probably worth upstreaming. But it is a correctness fix, not a
>    cure: it doesn't change the number of frames above 1024/2048 at all.

For what it's worth, the patch looks like this:

diff --git a/gcc/cfgexpand.cc b/gcc/cfgexpand.cc
index 0261f861b..56e335cb2 100644
--- a/gcc/cfgexpand.cc
+++ b/gcc/cfgexpand.cc
@@ -1653,12 +1653,17 @@ expand_stack_vars (bool (*pred) (unsigned),
class stack_vars_data *data)
   gcc_assert (known_eq (large_alloc, large_size));
 }

-/* Take into account all sizes of partitions and reset DECL_RTLs.  */
+/* Take into account all sizes of partitions and reset DECL_RTLs.
+   When the stack is sanitized by ASan, account for the red zones that
+   expand_stack_vars will later allocate around each protected variable,
+   so that the inliner's stack size estimate is not wildly optimistic.  */
 static poly_uint64
 account_stack_vars (void)
 {
   unsigned si, j, i, n = stack_vars_num;
   poly_uint64 size = 0;
+  bool asan_vars = false;
+  bool asan_p = asan_sanitize_stack_p ();

   for (si = 0; si < n; ++si)
     {
@@ -1668,10 +1673,32 @@ account_stack_vars (void)
       if (stack_vars[i].representative != i)
  continue;

-      size += stack_vars[i].size;
+      poly_uint64 vsize = stack_vars[i].size;
+      unsigned HOST_WIDE_INT csize;
+      if (asan_p
+  && vsize.is_constant (&csize)
+  && stack_vars[i].alignb * BITS_PER_UNIT <= MAX_SUPPORTED_STACK_ALIGNMENT)
+ {
+  bool prot = false;
+  for (j = i; j != EOC; j = stack_vars[j].next)
+    if (asan_protect_stack_decl (stack_vars[j].decl))
+      {
+ prot = true;
+ break;
+      }
+  if (prot)
+    {
+      vsize = asan_var_and_redzone_size (csize);
+      asan_vars = true;
+    }
+ }
+      size += vsize;
       for (j = i; j != EOC; j = stack_vars[j].next)
  set_rtl (stack_vars[j].decl, NULL);
     }
+  /* Leading red zone of the ASan protected frame region.  */
+  if (asan_vars)
+    size += ASAN_RED_ZONE_SIZE;
   return size;
 }

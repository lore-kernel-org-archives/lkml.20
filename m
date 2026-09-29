Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575C52CCD6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689768; cv=none; b=tVSvT/ayOUzLynI7SaVIwDEvus1GB1otAQfcE6apDFi4tW1mgWoT0xhV0UqAy/8hiidiejniUG5ICseSNqX2pkuVC6hxPO6dIB7eQ1x/SBAZcfeyBidobM9fwftvDN6vAzIwQF29zxrX5dD7a8wAj3k66u4/hPT+JB9InQHBxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689768; c=relaxed/simple;
	bh=CPYNM9NBgjRldmL+xWGPXDctL16kcJtv3YrBTuOdqqY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XzPxA2d4z1pp2I7Pi4pKR2WE9+FqubWumBb8xJ1wTkZQ7UaaAyjynmZmC+Hcf+/QfYYNCWDqaCUpwdWquOwzkenQZzJsHKA8JEAzmsDdCBm4pucQxTreYdaT8vsaG7MaoYPnvb1BVdfS/fF0HMBXSkRe+kpRJ0O29SfSOxBjU/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lUqRbK3D; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lUqRbK3D"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso114201a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790689766; x=1791294566; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2Ut+xQsJZ2JMaJY9eEbzMAuyGNqBkHh8FA4keG6ZXk=;
        b=lUqRbK3D0f9xsk2eHlVyJcX5LvngeX3F1L4N4nXfYjWapTWIRRoj+5tewCQO5UsbCK
         5oGQZSqJtk97lBZZApT+H3d2I6durP25T9kFfZq8/pi6TbnnJDgp2rEoY4ciIDk6E+wQ
         e8SXlpBbAI5PboH0wnBpBq3VcsSb2GfM9UZhhYRGqt3br01EKbeVjDgTzCP4I0v5AUk1
         m8ZkY/AuuvFA6hRmvpgKScOf0K/YUJyp4y/aoC9gTNxO6f9LYZGct6ioW/Yd3slRq2VZ
         2SR1QKe7pL3994mjXJKwkMFtUCmkF2vlbrf0nQHdlHpgRKcgyLQdLmjGFNOxlvFyH8sh
         +Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689766; x=1791294566;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2Ut+xQsJZ2JMaJY9eEbzMAuyGNqBkHh8FA4keG6ZXk=;
        b=IzT19pNdV/hCiathLcU7KtAS2WvTQGUxNgNC6fAX3AHvewfLxtBU7OcxTDpdr28vpW
         H08fXTiqo5KGGY2QnFISbgxwXIFrcOEYHvXI2YR6iqw5CKAZv0L+dn4cmVjs6QXJMIMM
         Cn34vYztPXN69a9vuxYJLRU3iPdFcclfNvjgnTidamMtguHicVIprLb33vZyi0oieDpw
         Gb2OhnZCneGTNMU5kBC+NKN9VIDIOpbY42BQq4jEqK37QiUhquIRE4R9dp6JO5LRDvee
         vYToAFSJ3DNiIJjvI8IJ4tOCt4UD4FEoQEUNOB5PuqDEDDyAqQ7jlYxLj7lJv5ADyZu7
         A37Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDllQKCMYM0/2jazmdKrcHy0igooU9EdG2IpL1cGvwH4RLUnmMNcX38ac0UEscOoTQPpNZKJXLFlRdOts=@vger.kernel.org
X-Gm-Message-State: AFq9FYLly0HeTlP4xPn9GqkjmSZ0L0zDWBt0NIEfQcd+4BiJSaj6CqCH
	Vv4Ru2DWtPx8i3157lKGF9QJRcH7TTtJZdcalorG1RsyRt5cIPFZnvLJP9Ov13YubYpxa0+Zb+w
	Wgs3uvA==
X-Received: from plmc23.prod.google.com ([2002:a17:903:e97:b0:2e2:c535:2c17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5101:b0:3a4:acde:1e3b
 with SMTP id 98e67ed59e1d1-3a4acde1efbmr1063687a91.13.1790689765980; Tue, 29
 Sep 2026 06:49:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 06:49:25 -0700
In-Reply-To: <20260507234854.273536-2-hisamshar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507234854.273536-2-hisamshar@gmail.com>
Message-ID: <arvB5QqK68SJkq86@google.com>
Subject: Re: [PATCH] tools/include/linux/bitops.h: undef PAGE_SIZE after
 including limits.h
From: Sean Christopherson <seanjc@google.com>
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: acme@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aqib Faruqui <aqibaf@amazon.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 08, 2026, Hisam Mehboob wrote:
> musl libc defines PAGE_SIZE as a signed int in <limits.h>
> under _GNU_SOURCE, conflicting with kernel headers that
> require an unsigned 64-bit definition:
> 
>   include/x86/processor.h:372:9: warning: 'PAGE_SIZE' redefined
>   /usr/include/x86_64-linux-musl/limits.h:97:9: note: this is the
>   location of the previous definition
> 
> Undefine PAGE_SIZE immediately after the #include <limits.h> to
> prevent musl's definition from leaking into kernel headers. This
> is a no-op on glibc, which does not define PAGE_SIZE in <limits.h>.

Sorry, but I don't like this option either, as it only works if whatever defines
PAGE_SIZE is included after <limits.h>, and obviously doesn't help if something
includes <limits.h> directly without including bitops.h.  Which might not happen
in the current code base, but given that building against musl is obviously not
very common, it's not hard to imagine such an issue "sneaking" in.

What if we explicity force an include+undef in the KVM selftests header that has
the requirement that PAGE_SIZE is a 64-bit unsigned value?  The downside is that
it would hide bugs if something other than musl pre-defines PAGE_SIZE, but that's
unlikely to be fatal, and I don't think would lead to a game of whack-a-mole.

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 7579e692bc2b..ee8186e75552 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -6,6 +6,14 @@
 #ifndef SELFTEST_KVM_PROCESSOR_H
 #define SELFTEST_KVM_PROCESSOR_H
 
+/*
+ * Explicitly include the system's limit.h and undefine PAGE_SIZE to workaround
+ * an incompatibility where musl defines PAGE_SIZE as a signed integer, whereas
+ * KVM selftests expect it to be a 64-bit unsigned value.
+ */
+#include <limits.h>
+#undef PAGE_SIZE
+
 #include <assert.h>
 #include <stdint.h>
 #include <syscall.h>

> Reported-by: Aqib Faruqui <aqibaf@amazon.com>
> Link: https://lore.kernel.org/kvm/aL8e0MMa4U2-nstQ@google.com/
> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
> ---
>  tools/include/linux/bitops.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/include/linux/bitops.h b/tools/include/linux/bitops.h
> index b4e4cd071f8c..62117a77ceb5 100644
> --- a/tools/include/linux/bitops.h
> +++ b/tools/include/linux/bitops.h
> @@ -4,6 +4,7 @@
>  
>  #include <asm/types.h>
>  #include <limits.h>
> +#undef PAGE_SIZE
>  #ifndef __WORDSIZE
>  #define __WORDSIZE (__SIZEOF_LONG__ * 8)
>  #endif
> -- 
> 2.51.0
> 
> 

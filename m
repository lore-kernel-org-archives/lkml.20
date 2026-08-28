Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F13C7689
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896204; cv=pass; b=R9fryxIcX3ImlQQ4cVyCR7g8jxm+aAqc6sQrxPXSkLaFOC2GyCSJ6giH8be4EH90GUZa8IpIM8fBTY9DjnjugG7Ud6/L7pUh1ytuuJhZQW75Bah8vhvZkSBBLmCDv3cTVwEFl2KjLkGB1RBA753lrvTKwIlTnnn0sp5ugLMijl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896204; c=relaxed/simple;
	bh=Jio7sO4pCEGq3rVPHZZ84dICs7hxJu4+ln/FH4TXjhI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ahpvt8K/L5XYVN3JFVacHL3TYJgKMCvx5Ld8kWV2x3w1Yh3WhSrMcTwqeR1OfzlQWTE0YJrX01URPn6yQ9Yx7kJNS18+9adotdE24hikdVcle51LKY0C0VZ9bUXtSzfG5LcDyomSSABi3s2fZL+ZyKFjvEh4bxviYdueUmKjCb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ISwtKVCf; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ISwtKVCf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so888128a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896202; cv=none;
        d=google.com; s=arc-20260327;
        b=eCifwr57CwvFNY5PTrJklHQgVbY2Ou9I5W2ccmQV1CYKurn/pQTier9B0qu+jNB+43
         L+fAdEavgKxBYfUap30DX2ycpatXQHI4I6bwETTt/6gDC/MXn2o2wWbJIJqr6A/FEk9e
         1eCGibYIBHXN/LdqZsvcCzC3YmU8WudV1rklPrWIfaLMtM2MCuOnPDWJ7hy8SqgSBiih
         XQntHk2EEqFV9YtnrdaVD/jeBSmKHYwxlzNYrwF+TAgJGpy/zbsigsX86o1FiVAPHjWu
         8ZVEncErXr8I8PPxMUreAF6AX0TuPlxMQZ0z66rpxVJHcB0idQpf5EZBuekmJb9Wykoa
         hGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        fh=vp9qQdTbfkZp0vOZxr7tCol57fQZjFATLd6c7TLXiAM=;
        b=Y5/2Sjp6grhj50fHKiLne4OEgOOWVH0zG8P2k/QeREPohIOtrT/cWUIAM9ixzGc1j6
         h/8bXPPSQugM0SWvwKbvrNiiWp7kusmLwbR0LYzEOLr8IdT4UB2vJvgiw4wGJtJNVmdh
         hL+kTJXmLM9EXMX5JIL25dDfpyD0FDzJXo4IujxDriYnfHrBvH8+8wZncmVyDpSvtSOk
         +robiWa2O15AeOwr1j5cs9cxT6lUx6snwAa6nY8VnoHKPw1qiKGkF0Lz2fdju3N/ul+g
         p9xa6gdka2vCTtMeYxcnvON7ZIdnqdAex6s7YQnDQUAyDrz3wicUWz3yj0bGwHhvVaWX
         k9gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896202; x=1788501002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        b=ISwtKVCf93Am4tpo4/v6ixMpAT2rHZfdTnV6KL2rH1Tzyqo1mtmd1Ii+VaAqcXsHyK
         I2DxuN4L+s8UvHS/4q8py7ntvLz9Q6YsEQDKHq/opeKVyfJ4uPBKgsYrme2KLbKYSYfE
         youstZ79VUV5WXldc7fcmvp5StzHIZunjpjqvDo5aAkmsSmtQMXl1yUCQ6nld2hjnw4v
         tozGG4w4/eUGP0JVjF+m1+QM6JpY/GYxQ+zag+8iJ56Jaum1vqYwXFUCwICw0OBK3gIT
         qldXTi92l+O0PvBcs66lSK8KgHKR7foVvrsY1Z1ejmtkHHjjv1pDjDo5TYaRXhje92Py
         LlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896202; x=1788501002;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        b=PjWf2VbFU0h1llAC4sJcSBYWV93m+8pRzwf5sXeCfmEXfjAKrx7IhzaJMtJ0Y4DBum
         jK1tS0tjwko1GmMW3u/vW5w15ei/wJ8d563dIpC7gVPq9e/TN8SIVTHHK1Og6PJgFCkV
         t1o62o9T+i+kX26WsWDEPFNG0I6T9JZNo8JWUvKAmJkzePhFHe2cRXJmM4FDe4nU60+f
         ikrwbLBudPnEODMgpBOiqCcALQ7KJmUlNc+IyupgXfLCJ5xpq0OJuyiqfIJzm1Sa83vm
         g9WqSmY9V5GlMpwjIwl+CnHBUG0MyeF/76+PRwtrvWINOYZEpxMGJ4d6lUY5N+ZFTxti
         XN3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0VmTi1w1XEkkhPn02+/vDr17lwFQl65DQ9qoTQwmkaj0bm9VkaS2emYy7odYK76IR+WZHRbJEMX3LehA=@vger.kernel.org
X-Gm-Message-State: AFuF++nwL/IThKbyJtqGH9YpyX/y5QNkYU1UwZcwYr9OmoirY98N/Vos
	pV9VHnp4pT3cJzMDJhXc+Sps55Dwx0cuMfr28nMoJ4P+34OAnc0qEyka/HuR6Ov6oMKax/9Yv6s
	sEBb5kZ7eUbfxlNDI95y2hzlt9epB6sFAye6SwXC6
X-Gm-Gg: AR+sD11SiUbqzZLFF6r4aqlrA9eKbcJsVCgKZM5vHcazz9wnP2Q6GVqlR/ZxHKhwepM
	6WVD2/gfmXCsNJH6h/JjqWHb4SKFWHYAAENNOC2OKerLjRA8TH94Mi5Pop+F6+v9bU2gIL96isk
	g1oeOYx7uroWexqRzlaB3/BVDChrMKsK0XvgD9jivqBWARN1XzXZXhOXAdr61EWSY9kX7xZ6bXa
	kYnJZPDMGREtuiLu9TQsayukFzHj++TmG7WFJ+ZURRNQSLhQ7Mo+eb9FlS4lezyeuJ6OFKwGyQA
	2S6IgWSKI/4c3bjVbuTqeA2n9e8C5TIwq+PsJnOyFivjDU3MUurZccNy+BahHW31M+uLUhQpDTg
	qWlksyPTBAgSh8ixXY4Bo+cHGHiZwcJ1C
X-Received: by 2002:a17:90b:582e:b0:395:4de4:92be with SMTP id
 98e67ed59e1d1-396d0fabb3amr8959710a91.13.1787896200987; Thu, 27 Aug 2026
 22:50:00 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:50:00 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:50:00 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:50:00 +0000
X-Gm-Features: AcwNN1VB4Lu0vx7OeyLBFvG_yf7maW27jBuMibH6lUCi0Q10SkfZv_mKR60M03I
Message-ID: <CA+0ovChyLaYfEN19Fomt6qWx6dYtX47Ptyaej3gfMeNGB1xoFg@mail.gmail.com>
Subject: [BUG] general protection fault in sysfs_do_create_link_sd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/188-general-protection-fault-in-sysfs-do-create-link-sd/

  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
  RIP: 0010:sysfs_do_create_link_sd+0x4b/0x110 fs/sysfs/symlink.c:35
  Call Trace:
   sysfs_do_create_link_sd+0x4b/0x110 fs/sysfs/symlink.c:35
   nfs_sysfs_link_rpc_client+0x3a3/0x590 fs/nfs/sysfs.c:343
   nfs_init_server fs/nfs/client.c:770 [inline]
   nfs_create_server+0x7e8/0x2110 fs/nfs/client.c:1155
   nfs3_create_server+0x1e/0x180 fs/nfs/nfs3client.c:56
   nfs_try_get_tree+0x1fa/0x11a0 fs/nfs/super.c:981
   vfs_get_tree+0x8f/0x290 fs/super.c:1754
   do_new_mount+0x341/0xd80 fs/namespace.c:3834

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,

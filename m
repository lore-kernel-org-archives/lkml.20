Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723104AA58E;
	Thu, 24 Sep 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273869; cv=none; b=XrJN/DTmb2TJPkzz3gePibfDQJ9mdbDVWcupQM7zrVeWSDqvj1S4DmVBSdhW7jtiDARqJ31VZqbmWJ54Z7aM99b2Rbnf7hg+1hTxl5/nW8pC8LGhm1oMFdFaveAH4l+ymF18ClT09NFKv/UHbwr+ZtgyUDAqO1hpsnbO4COI7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273869; c=relaxed/simple;
	bh=Q2fxuKurFXQih0iiPwngj7pvtHiZ6idUejyYBXZJ05g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1rcy9B4eXzr55iPB6a/kRgDFImT9TUsbyZDjg9xAKVfRRjy46NsWWfOSo2v2KhDZqOv4F+KgZZXuOKywkAMYDuqNU+p5ImNQWZg02gOKtG2iO8i0A0a9xR8DK6+NPzpicVaIITyMQwFGs46daevLLAGIvWpYsm+5WkJTSbVRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZLkyqYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZLkyqYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907191F000FF;
	Thu, 24 Sep 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790273866;
	bh=xdeuR2BjInsKEFRWSDa4uTBw+SSZywIiz5uJRWZbRiA=;
	h=Date:From:To:Cc:Subject;
	b=VZLkyqYN9voPDno+JPIaIXxuNlSUEKt4bsP8Fqv5PaCQI56RudBNJjTUiUoL8ip1F
	 odlWlhW9wF2hdTgu1IcJhuwnqw48t1nrYhUcloVc6BWXQZtexlBdgp/9+tBeRx7D2E
	 NWQxoi0JM8xznHuyRsyliKeeLaUeUH2Owtu29vpean4H/L7X4u4xh2sx/l38L0KU1T
	 NuBEvotJMS4hdcl7SbOZwLF1AZkA9raKawJK1VVc/nf6uXlDyaznpAmesVWlvjcKxI
	 fjd/JvgiTgDw8OZSs1H8/Pst8adm0ASiZvSeGRLEBHjev3ER3bGc6KipE8RdfXz+Hw
	 KV+fswPubawmg==
Date: Thu, 24 Sep 2026 19:17:42 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pagemap-headers tree
Message-ID: <arVpRvAzgfZkSHDF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pagemap-headers tree, today's linux-next build
(powerpc ppc4xx_defconfig) failed like this:

In file included from /tmp/next/build/include/linux/preempt.h:11,
                 from /tmp/next/build/include/linux/alloc_tag.h:11,
                 from /tmp/next/build/include/linux/percpu.h:5,
                 from /tmp/next/build/arch/powerpc/include/asm/time.h:14,
                 from /tmp/next/build/arch/powerpc/platforms/44x/sam440ep.c:21:
/tmp/next/build/include/linux/acpi.h: In function '__free_acpi_object_free':
/tmp/next/build/include/linux/cleanup.h:211:92: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
      |                                                                                            ^
/tmp/next/build/include/linux/acpi.h:31:1: note: in expansion of macro 'DEFINE_FREE'
   31 | DEFINE_FREE(acpi_object_free, union acpi_object *, if (_T) ACPI_FREE(_T));
      | ^~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:290: arch/powerpc/platforms/44x/sam440ep.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/preempt.h:11,
                 from /tmp/next/build/include/linux/sched.h:15,
                 from /tmp/next/build/include/linux/ratelimit.h:6,
                 from /tmp/next/build/include/linux/dev_printk.h:16,
                 from /tmp/next/build/include/linux/device.h:15,
                 from /tmp/next/build/include/linux/platform_device.h:13,
                 from /tmp/next/build/arch/powerpc/platforms/44x/warp.c:11:
/tmp/next/build/include/linux/acpi.h: In function '__free_acpi_object_free':
/tmp/next/build/include/linux/cleanup.h:211:92: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
      |                                                                                            ^
/tmp/next/build/include/linux/acpi.h:31:1: note: in expansion of macro 'DEFINE_FREE'
   31 | DEFINE_FREE(acpi_object_free, union acpi_object *, if (_T) ACPI_FREE(_T));
      | ^~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

   f54586fcd661e (ACPI: fan: Use __free() to simplify AML error handling)

(it was also causing lots of warnings in other GCC configurations but
didn't trip -Werror in allmodconfig since it doesn't seem to upset
clang.).  I have reverted that commit for today.

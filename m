Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD2221F24
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382457; cv=none; b=j30GPijvVKOAQmLA9fQnpWsjIFF5QVbp78CG06gafnQNO/d9Z8YZa79wT1YxnHrnOmiJMW4kmMCyb05Rc26jHhzcXwfqo9oyLCqP0m/8uIEeYK8GActsoJ9Mss89lxN++dbWYhrvGb46WCO3A1UM5A/6+cUfYsGtGx+NffSqT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382457; c=relaxed/simple;
	bh=czjGtQCylPKGOxgwRT4H3LIqs4PEQr/yg9uE5mWxNEA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=A7AO1Va0ZQyHolvHFsRt/19500UaQLIv/1hxAN7w64yF1jc3ztWzBaHRDj1O5fR/E5VLYgM1qp/jOOLievbdQzcXMdAR+tt32oQrQM8NN17S7U8CFBWtkWNxWNY00CNaBtI10+lcgAAM8UWTkgW3AT59Op6snyQ1N+7JaCIBWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+7uTkkX; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+7uTkkX"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1139144a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792382455; x=1792987255; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HFoWvp0cIKmjLdrdC+FIWOJcYRrNmj2fb+vTIhO0WMk=;
        b=G+7uTkkXpdtNA2uYFLNGoRqnvRHU5+i70JoCtsHzGFy7THRDJ04W/KXHtzvT0Big6N
         EcGM9pe6TtC4DrQ0PPuOP6wHCKrD4+6kw6xKSn7hgpm7hvux/fg6bsXlvYi6H/iCtr7U
         e0YEOE0SU+1Iu7QEMTWRBUTESjcp8wPADPqHNcU9zxvtLwFB2EFQzFCH8AL3IjSviMni
         Fc+rLwqf2YejZzrk4Eekt3xO725QDgXvuYg6JYXEloJgsAnTuMSGWzLS99nfDNuZ/con
         ajzz2MWmN/Y4P87D7ZU4n8UVNstuouJt5+5Gi3mTKFajAJCkxZC7cMFfb7JRUMFirIAy
         fuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382455; x=1792987255;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFoWvp0cIKmjLdrdC+FIWOJcYRrNmj2fb+vTIhO0WMk=;
        b=XsjR8eSvBLnjeaPOnyBARSdHCIVuRwFOULEnAf+HucohIFZANVXH/FPH9yc38btfuu
         fRMhOVJ625VoAfC9162tb5w6CFL7pegGBFXBK7GzhUZC7wn7tgKvCGvj4aAPOWQgrENC
         /XBhlDht6f/6+5o8aXqPop17I+FrRBCdkUSmiySnZ6zHL/yjRU9ML0Ajis+iSwxu494q
         vm3YlIgMxRXbfYzx0LDzfkQJSfK7aXuzidDrwJYy9PbT051QtZ6djVTNhAziPWaSmUOJ
         AoWwRLoHVc+4rNG5gdgfBjBRlrU9mimwMKPlBuLvzyIuqWeCrWQ+PtXBnj3gYe3gjJC1
         MNJA==
X-Forwarded-Encrypted: i=1; AKwUvBzIbp5b21Ev6ezRlpNj8O4dhALNnjAYGDvOL0T0wZ6OklERxwKAgcRaUJdEs3WuAf6Gq2GeRTE9EXPI8DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLeVEDOsEQObltkHLV2z+fouyN1C5Ok5OLbQwcSGNSUQUz/D/9
	1KMKKhzj0hrjuwe54N08R6XrtqnkB8jFfGYn6FpboFSg3BytXDLtEA3W
X-Gm-Gg: AYBFou14Vne6+5YyTj5YLWgNDZtz6tFU8zzd6ETdKcT5Gqwq4/I4+E3jO9kAYu5L6Py
	k5WvbQwbREN1VHXRUTl9WIrxzl841royBOuei8iWA7xVfPnlf4V9RYb9jtgoXAavhu70fYwuNLG
	yvqUkpz45omeNEe3mMUk1Z5pwWpf8zJ+wsxguE6G9/CdXkS2UyK7laErYP5QEm9mKTqFmbys3LY
	degEdhUQLKklcEMcPYe918+GJKALi/0GSH9Tm5ScFikDcVmqHBBOWXUeW7dWTnWFhZztqdcLyQJ
	q8/r3IqAlH+xiZZtb7lX8yN8CwkkfcHuSKVKC8ksSJl4gIo9IDOcNXNWeqhwi93rI9m9T+svZIq
	YLBZg9goD29XjzA5MT0x30JcRLDOQfX2bxMmYKErfFiN3/CLa0KBC06E7nrr0IPvJ9jxgPuqmuQ
	01aaGtnW590rUVJoJZYVI2KKmaekJ+aW/TUb7QIJMW1h/T5M5ovWoTnusWY3AY6ElT2aXfLmr/t
	8Shxd0Wos7HGFAk
X-Received: by 2002:a17:90b:570d:b0:3ac:397c:574b with SMTP id 98e67ed59e1d1-3acef3cc8bamr6000770a91.54.1792382455469;
        Sun, 18 Oct 2026 21:00:55 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0939725sm7800291a91.3.2026.10.18.21.00.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:00:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [tip:sched/core 35/37] ld.lld: error: relocation refers to a
 symbol in a discarded section: __UNIQUE_ID_addressable_overflowuid_553
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <202610170544.6hPndDUW-lkp@intel.com>
Date: Mon, 19 Oct 2026 12:00:29 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <629C00D8-BEF2-4B35-A056-2D8699F355FD@gmail.com>
References: <202610170544.6hPndDUW-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)


> On Oct 18, 2026, at 3:46=E2=80=AFPM, kernel test robot <lkp@intel.com> =
wrote:
>=20
> <Mail Attachment>

Hi,

I reproduced discarded-section relocation errors on tip's sched/core
branch using the reported configuration, adjusted by olddefconfig:

- fcceb7da9465 ("sched/cache: Avoid publishing partial LLC utilization")
- Its parent, 96a494c9cfd8 ("sched/cputime: Don't account idle time =
twice after dyntick-idle")
- The earlier ancestor 840e23085b03 ("Merge branch 'tip/sched/urgent'")

ALl were tested with Clang/LLD with 23.1.3. It fails similarly.
All tests used separate build directories on macOS, with a host-only
gen_init_cpio compatibility workaround and no kernel source changes.

The generated ELF32 `vmlinux.o` files contain:

  fcceb7da9465: 21,371,209 symbols
  96a494c9cfd8: 21,370,053 symbols
  840e23085b03: 21,370,091 symbols

These exceed the 24-bit symbol-index range of ELF32 relocations. In the
840e23085b03 build, I inspected the relocation for the basic_stm_init
initcall:

  Encoded symbol index:       1,427,711 -> unrelated .L0 label
  Encoded index plus 2^24:    18,204,927 -> basic_stm_init

This demonstrates symbol-index wrap in the local build, explains
the references to unrelated symbols and suggests a toolchain issue=20
requiring a fix in ELF32 relocation handling.=20
The local failure occurs without my scheduler patch.


Thanks,
Jemmy=

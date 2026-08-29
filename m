Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3D39794B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032381; cv=none; b=XkOGrMS2scE+ndbSe3z0zOhnbz43fLFKyqXb4H+UqarWh18M8MG8x8Kcc7r/Lbvrko0J4efm3A2cTPvqVlF0v9BsmxaQBmA3Ty+YX+IoFOD9XcVZX9lsm5qlYXEvMXZa8F12NGsDdAdq2bf13fRjBrrpvAYbpZANzzCuPlBouiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032381; c=relaxed/simple;
	bh=gkO1W3ObxBr6XereedmZqfdrV9UxNONJJ28AxekcxPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoSVRY8HnWVk7SN73qy2oCPyJuv0ajGHGrmhMrtE15FMEZP3juIdWE/1oeEv+pOZEY8EVsoKdJs6HjsfAzL/WQDSsSx2N04Zm46J0PziVAHW+kKw0dotYciQ9byYyHPhXETWp5H39OPH50P9JCwLu17bniKhG0DKFrldG6gjOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juz1vDmN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juz1vDmN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso7805585e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788032377; x=1788637177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UShLfcgJlf7RvYRGLM1vPTMOukbxlvSi4Y6K8vtIScI=;
        b=juz1vDmNRZ/FuXlg+SAfayAh8fNIjTZKoo79cMpuBMQncphksc+mpu31FZGP3sm7j4
         0uJ6OXOmylD0XGLpKh65vpAJINtNxwXIlRHSedIJ55bqzOMQfkGW0F/V1WHAdfe6IxNe
         0nLw6y6xwqdqZZSm7m1zn9FLTXe6GzGs447BAOdpyUbOiSDhVxYSC5I2QR1QMtTeZYJ/
         uSLtEKZ4LOcpGaptnyIPUCO43lgGCd63sbIUwIt0AZVmg1Ij3rGNPIapRHY1KLzIPPqO
         MP+zYnuPXoGI991fj9kYgF1zvYP51iRL3TuwU3wIL8TEHq2UY8GrMBnCRYv0iFoV5BdQ
         yXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032377; x=1788637177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UShLfcgJlf7RvYRGLM1vPTMOukbxlvSi4Y6K8vtIScI=;
        b=YfPjQlDQ7I6Pxt4Q0npO1mPXhwAc4qSyvUNyglmG6eqyh5tmhaEp+bfWvVkrcwCp6T
         hUMXeES1nqEj3eRLEpzwvQmGhQdjo9Qi9cdRlpl8TH25MBy3ueNJOtW0aUE8KdipaSx6
         SGPG+K61Wq4WOvZCrrIFxOdR2fkgQ/EZ8pBeY3RleaMXfywpc4QJmldYkg+SjgkJXZ8a
         yIOddJ0s9S9sBmq9nPs6P/yQYkW01dtTy13OpRPBMgWse88CJCH/VpDhkmpiqIfVzS4e
         sgq2lfcJ1DW/GjxuoDtRTGQbntHY6DCoMnOkNVmCBhDtG4u1CGVBFEiwcT6rynCcXYTY
         Nj5A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3nDbHTBRtMcCH+ZD9XAwBPR7+sxbCvanVTNQ9D6yrljTnM7xunIpPHIOIU9CjoV2fN/7/JorfSmN4trg=@vger.kernel.org
X-Gm-Message-State: AFuF++nc9uPNzx0TubQm5gG/CCjLwUmcfNjvFnMN2tfQRYSRhE2/3PdJ
	Z9JssJbltpy6Flh72L2dorZbzkTVKXLjuWGNRN9+r1q84WMrn/ytuL5M
X-Gm-Gg: AR+sD10LDvdPWy5wEBkC6Czp+PwB6CQKfa4QkwnsCoSpUFLDlg/uYf4f+Zj7THSYVB7
	0syiPhf6YCplVnyXnt0uMIw0apjJPI7vdLdfvMq9EYWEY3TeJ+5Qd/f/LMjBl78SNBtcEIxlDna
	XNwo0Noegj+Xdg7l0M/Uk+cHgbDDzD6bhPZPSckPW/u433oumEX/CXg08rL8PMOy23ZiqgxRXOD
	9QTj7UUTJSrqf/lkUVBehu3F0eCO5QKIiq8o3NM/0Onrt935FYZwE+SHbclU4fGQQA81tX3X+jV
	L8MyQUrgjGEnUyC1dFfGaDr0nlwNzJqHwQwbPOugO9R0ohL2QPzVYVKbTmwHaNjSGGCY4Ed3Phi
	q7zHOcT1aAosN/QGJXnYD5dbFmFxGW25siDXQncsRMcox8oQ8Q53q5NFtIS5k+7f5YN3PVEyAKx
	8lZYWCbY/bYbFc5qcKttGQJkLgYpEpcqoNzOa0nonQVt+63uLGgDbZgaYG3CJ6hfA0npNc05w2H
	LCZxvfGELKGG/AJRuRewNAsyZ2x/l0Fq3vO6WAzvrmGWCnOFPE/IuggtfrgrHTY0qQeuxUqiQQv
	5dh0/YBRJZ3uyIlDrlWt+yEZItbKn7kCkgHs9MrBDGkRhNnjHZKqab/qGvWyug4Fwg==
X-Received: by 2002:a05:600c:6215:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49b91c1bb18mr241886805e9.3.1788032377274;
        Sat, 29 Aug 2026 12:39:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013ce4sm132840095e9.14.2026.08.29.12.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:36 -0700 (PDT)
Date: Sat, 29 Aug 2026 21:39:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: selinux@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] selinux: preserve user SID across nested backing files
Message-ID: <apM0QvxDHBuH1hXd@gmail.com>
References: <20260820175832.44512-1-kmehltretter@gmail.com>
 <5fa5ef078f41cd57d0e52ab2ab023094@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fa5ef078f41cd57d0e52ab2ab023094@paul-moore.com>

On Thu, Aug 27, 2026 at 03:39:10PM +0100, Paul Moore wrote:
> If you could share the distro and some more details on the testing
> methodology that would be helpful.

The original test used a small BusyBox initramfs.

I repeated it on arm64 QEMU with kernel v7.2-rc1-9-gfd6e2388a3ea, using
both BusyBox and Fedora Cloud Base 44 userspace. Both gave the same result
with SELinux enforcing:

  unpatched: mprotect(PROT_READ) failed with EACCES and the expected
             base_t -> mounter_t:fd { use } denial
  patched:   mprotect(PROT_READ) succeeded

The test mounted two nested overlays as mounter_t, changed back to base_t,
mapped the outer file, then called mprotect(). Both guests used the same
purpose-built policy, not the Fedora stock policy.

> Additional comments below, and while this patch is useful in fixing some
> of the problems (thank you!), we obviously need to fix the others as
> well.  Is this something you think you will be able to work on?

I also tested current mainline commit cf72cbb39da84, which contains
f2381b546e7e ("fs: fix user path of nested backing files"). That fixes the
top path and inode, but exposed the remaining intermediate-mounter issue:

direct mmap(PROT_EXEC) was denied against middle_file_t, while
mmap(PROT_NONE) followed by mprotect(PROT_EXEC) succeeded.

I implemented a second patch which preserves and rechecks each intermediate
path, mounter SID, and file-description SID. With both patches, direct mmap
and deferred mprotect are denied against middle_file_t, and the original SID
propagation test still passes.

Together with f2381b546e7e, this covers the remaining issues. I will send v3
as a two-patch series.

Thanks,
Karl

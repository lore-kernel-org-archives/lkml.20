Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED85695;
	Wed,  9 Sep 2026 00:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788915225; cv=none; b=cWdGiBqNUQYx7aiIBZZuaQYLI42UmJOpl7uc+PTyxiv4CiLfiqcsjGAMMIY0S9hrf8Vpy5k6uwgb4BJk00NtxPbT3l9LpOK7AGN2HxJ2tbuWDvTkixA0UNsNCrPCG/Rg6pglwmr95xXHmFDyPvWOJJYIwPixema+yOwXGi6TUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788915225; c=relaxed/simple;
	bh=3st+nicl3DE/jYKiq3JdpDAT8wv9k9rnK4SEdz5KMmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uoBO9h0vGRt7j4VlyxMcmGYHURAz9t8ZVqb6jn3Fp21XVli/w9V3RHYGMszxQJU7NvhQnKQKVhsnOamAQhSgheNz+guULOwJED1m1fxxxJ40u8iLgVkVODEbinmSkrazuWLJjloXZwpv1rhX/eYDN1153e4GMNNbMaVIJR5Kmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwU9LY3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwU9LY3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11AF1F00A3A;
	Wed,  9 Sep 2026 00:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788915223;
	bh=yyzGdytCytiwngYrjIqzDuD85r5Fhsme9WG/AK2AMiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KwU9LY3YVzrCRnmBE8SWiPHV0xsHmANrfLbLkXoWedi9FykalH9ULG51KIjZSQO8s
	 8UO/g+v2Bievcp/+xqFxGqa/5JHAlYjqdjYkl+8nFhwyne6fYJGuK9HN4WSyOrbn7R
	 xXP0DsISZVPwhROfi3XGW4U/mw0uzMOQNMt+t6PZwXCxprm+ENWf8LhVaKBkWF5Ldj
	 wXZp+OYoEu1DOwiwspNTk8iZEB2H/NXsfHrHZOckAebbCQAscUcfU69nvF5fYBgxv3
	 qR+cNtNIboWPjtPZGdHMELiPi/oJFDmSMrU9T7fiKdsgCqcX7XxPYkrFi3X//XTEhn
	 riVWP/uR96Nww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Will Deacon" <will@kernel.org>, "Baoquan
 He" <baoquan.he@linux.dev>, "Jinjie Ruan" <ruanjinjie@huawei.com>, "Mike
 Rapoport" <rppt@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Dave
 Young" <ruirui.yang@linux.dev>, "Pratyush Yadav" <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, =?utf-8?b?b3BlbiBsaXN0OkRPQ1VN?=
 =?utf-8?b?RU5UQVRJT04=?= <linux-doc@vger.kernel.org>, kexec@lists.infradead.org, "Sourabh
 Jain" <sourabhjain@linux.ibm.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "open list" <linux-kernel@vger.kernel.org>
In-Reply-To: <20260909003657.1570544-9-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-9-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:53:42 +0000
Message-Id: <20260909005342.C11AF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Setting `image->dm_crypt_keys_addr =3D 0` during kexec image clean=
up bypasses page table memory protections, leaving sensitive dm-crypt volum=
e logon keys accessible/readable in the primary kernel's memory.

Pre-existing issues:
- [High] Reused dm-crypt keys are permanently lost and silently dropped dur=
ing ARM64 kexec segment placement retries due to premature freeing of `keys=
_header`.
--

commit ccd76380ffc2464293abaa1bf7ed098e55227890
Author: Coiby Xu <coiby.xu@gmail.com>

crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash hotplug sup=
ported

If crash hotplug is supported, dm-crypt keys saved to reserved memory
will be taken care of automatically. Thus it doesn't make sense to use
configfs/crash_dm_crypt_key/reuse. Not reserving
image->dm_crypt_keys_addr makes it implicitly to disallow using this
API. Currently x86_64 and ppc64le have implemented crash hotplug
feature.

Also update the doc accordingly. Note two doc issues are fixed as well.

> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index bc70fbb79e0f6..666c1f0c9e3b4 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c

[ ... ]

> @@ -522,14 +522,18 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  void crash_dm_crypt_cleanup(struct kimage *image)
>  {
>  	/*
> -	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Preve=
nt
> -	 * keys_header from being cleaned up during unloading when
> -	 * is_dm_key_reused=3Dtrue
> +	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole =
kdump
> +	 * image will be reloaded. Prevent keys_header from being cleaned up du=
ring
> +	 * unloading when is_dm_key_reused=3Dtrue
>  	 */
>  	if (!is_dm_key_reused) {

[Severity: High]
This is a pre-existing issue, but can reused dm-crypt keys be permanently
lost during ARM64 kexec segment placement retries due to premature freeing
of keys_header?

On ARM64, if the first kexec segment placement attempt succeeds for dm-crypt
keys but fails on a subsequent segment (like initrd), it triggers a retry
loop. On the first pass, crash_load_dm_crypt_keys() unsets the
is_dm_key_reused flag:

kernel/crash_dump_dm_crypt.c:crash_load_dm_crypt_keys() {
    ...
out:
    is_dm_key_reused =3D false;
    return r;
}

The error path then calls crash_dm_crypt_cleanup(), which unconditionally
frees keys_header since the flag is now false:

arch/arm64/kernel/kexec_image.c:image_load() {
    ...
        image->nr_segments -=3D 1;
        kbuf.buf_min =3D kernel_segment->mem + kernel_segment->memsz;
        kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
        crash_dm_crypt_cleanup(image);
    ...
}

On the next iteration, crash_load_dm_crypt_keys() is called again but exits
early without allocating keys, leaving the crash kernel without decryption
keys.

>  		kfree_sensitive(keys_header);
>  		keys_header =3D NULL;
>  	}
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if (image->hotplug_support)
> +		image->dm_crypt_keys_addr =3D 0;

[Severity: High]
Does setting image->dm_crypt_keys_addr to 0 bypass page table memory
protections, leaving sensitive dm-crypt volume logon keys accessible in the
primary kernel's memory?

When crash_dm_crypt_cleanup() is called during kexec file load, it zeroes
image->dm_crypt_keys_addr. Subsequently, sys_kexec_file_load() applies
memory protections:

kernel/kexec_file.c:sys_kexec_file_load() {
    ...
    kimage_file_post_load_cleanup(image);
exchange:
    image =3D xchg(dest_image, image);
out:
#ifdef CONFIG_CRASH_DUMP
    if ((flags & KEXEC_FILE_ON_CRASH) && kexec_crash_image)
        arch_kexec_protect_crashkres();
    ...
}

Immediately afterward, kexec_mark_dm_crypt_keys() (called by
arch_kexec_protect_crashkres()) checks this address:

arch/x86/kernel/machine_kexec_64.c:kexec_mark_dm_crypt_keys() {
    ...
    if (kexec_crash_image->dm_crypt_keys_addr) {
        start_paddr =3D kexec_crash_image->dm_crypt_keys_addr;
        ...
        set_memory_np(...);
    ...
}

Since the address evaluates to 0, it completely skips applying the
non-present page table protections (set_memory_np()), exposing decryption
keys in system RAM.

> +#endif
>  }
> =20
>  static int __init configfs_dmcrypt_keys_init(void)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D8

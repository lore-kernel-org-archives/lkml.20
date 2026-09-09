Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E08270545
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788915122; cv=none; b=P5FFVCdvZE75S2zoR3akpU1s4dSPq38jHziuROFcrGyiQPDcBJsMCbT6B+4MNhmguDDEmu7MdJwx2lAZ+BAY+LzTYCy0QgdnWuBcsFUPrg1hhrE8yD6SAJIsprI2u1yJSVakiJ7+RJKFiPsl013AKmabzmBofaaXsyGe6+wwK3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788915122; c=relaxed/simple;
	bh=WdLglsUBNW/MK9z+SNqqEsdpvzBEBHVPsy/VIDKvPkw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WDaaXOtnUTnKqsFoha6Do/kZLwuUq4PapXR6pviGwCOo15KL1bxAY2vJvq2A9zvEp+IAoDBtZgumrnM/VwsZwXEVgK++JN9AAmEYa/n8dfYequhO3Emyvydu9L2/x70A7xG7wK5hvVFVH2r4JfFz/p5EFiafEPnHRsEKnB7q50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyaxXpSW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyaxXpSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971151F00A3A;
	Wed,  9 Sep 2026 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788915121;
	bh=QCn4OEnHLNQOKmzJsiaaUSfwxj7ZgT9z0ighC6IauIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LyaxXpSWdzPebNC94mbBljjNsCX8TcPAJefgt17gkPtdzmyisNXO4MIZYDIKFQfHK
	 LN7f1kh/Csse0aWpdxw+T21ZIcxKAAeUAemEC99lC0aBmgLqWC0WwLJW56vh+n2DIn
	 Sb3s5Eiv4osYhigb0WE3zK8teAC84SJerZi5MBT7CG7zk7G+Egulem1xXyHiCANyam
	 dXMxbWO9ujUMgqqRgfPaYLz+XHuLm2CdHsUylQe19cWkj5GtVH93nckoCTyUz5nPt1
	 0JhVu/zrdzeDFn9PXdqNjYHWCG6bsRRvuc/LtyWW0+cIah368ARD+zBdoArYXfOUKm
	 ShAn0xEC6GvPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] crash_dump: Read the number of dm-crypt keys
 from reserved memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: "Sourabh Jain" <sourabhjain@linux.ibm.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, "Baoquan
 He" <baoquan.he@linux.dev>, "Dave Young" <ruirui.yang@linux.dev>, kexec@lists.infradead.org, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, "Mike Rapoport" <rppt@kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Will Deacon" <will@kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
In-Reply-To: <20260909003657.1570544-3-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-3-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:52:00 +0000
Message-Id: <20260909005200.971151F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unconditionally clearing `is_dm_key_reused` defeats the key cachin=
g mechanism, silently breaking hotplug kdump reloads and ARM64 segment retr=
ies.

Pre-existing issues:
- [High] Out-of-bounds read past the 4KB window of `kmap_local_page` when r=
eading dm-crypt keys from reserved memory.
--

commit f9061da466f53a4935cffc1bfaa1ac6f1ef0c0ef
Author: Coiby Xu <coiby.xu@gmail.com>

crash_dump: Read the number of dm-crypt keys from reserved memory

This patch reads the number of dm-crypt keys from reserved memory to handle
cases where users add or delete keys by mistake. This aims to improve safety
over reusing saved keys for CPU/memory hot-plugging.

> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index f638fb4b8554c..3a416933979f8 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -88,21 +88,31 @@ static int get_keys_from_kdump_reserved_memory(void)
>  {
>  	struct keys_header *keys_header_loaded;
>  	size_t keys_header_size;
> -
> -	keys_header_size =3D get_keys_header_size(key_count);
> -	keys_header =3D kzalloc(keys_header_size, GFP_KERNEL);
> -	if (!keys_header)
> -		return -ENOMEM;
> +	int r =3D 0;
> =20
>  	arch_kexec_unprotect_crashkres();
>  	keys_header_loaded =3D kmap_local_page(pfn_to_page(
>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
> =20
> +	if (keys_header_loaded->total_keys <=3D 0 ||
> +	    keys_header_loaded->total_keys > KEY_NUM_MAX) {
> +		pr_warn("keys_header saved to reserved memory may be corrupt\n");
> +		r =3D -EINVAL;
> +		goto kunmap;
> +	}
> +
> +	keys_header_size =3D get_keys_header_size(keys_header_loaded->total_key=
s);
> +	keys_header =3D kzalloc(keys_header_size, GFP_KERNEL);
> +	if (!keys_header) {
> +		r =3D -ENOMEM;
> +		goto kunmap;
> +	}
> +
>  	memcpy(keys_header, keys_header_loaded, keys_header_size);

[Severity: High]
This is a pre-existing issue, but does this memcpy() cause an out-of-bounds
read in get_keys_from_kdump_reserved_memory()?

The pointer keys_header_loaded is set up using kmap_local_page(), which
establishes a virtual mapping strictly limited to a single 4KB page.
However, keys_header_size can reach up to approximately 49.6KB (128 keys
at 388 bytes each).

Could this read past the kmap_local_page window if enough keys are populated
to exceed the 4KB boundary, causing a kernel page fault or copying unrelated
memory into the dm-crypt keys buffer?

> +kunmap:
>  	kunmap_local(keys_header_loaded);
>  	arch_kexec_protect_crashkres();
> -
> -	return 0;
> +	return r;
>  }

[ ... ]

> @@ -432,12 +442,13 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  	};
>  	int r =3D 0;
> =20
> -	if (key_count <=3D 0) {
> -		kexec_dprintk("No dm-crypt keys\n");
> -		return 0;
> -	}
> -
>  	if (!is_dm_key_reused) {
> +		if (key_count <=3D 0) {
> +			kexec_dprintk("No dm-crypt keys\n");
> +			r =3D 0;
> +			goto out;
> +		}
> +

[Severity: High]
Does this goto out path in crash_load_dm_crypt_keys() unintentionally defeat
the key caching mechanism?

By jumping to the out label where is_dm_key_reused is set to false, it
appears the kexec cleanup function (crash_dm_crypt_cleanup) will now
unconditionally free keys_header since the flag is cleared.

On architectures like ARM64, if kexec segment allocation fails and retries,
the dm-crypt keys may be silently omitted from the new kdump image because
the retry loop will skip loading them (returning success but leaving out the
keys segment).

Could this break the intended caching mechanism for CPU and memory hotplug
events, leading to a silent failure to unlock the encrypted dump target
during a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D2

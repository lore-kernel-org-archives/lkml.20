Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB533C465
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914768; cv=none; b=GwCpgVFBHTK6W5cHJWGUA1vxbQMlbiiERwGacbJNG4F3dpAV0fudzdJqyJDNPdUoW3m/2m/DzCHS9qxNlOG7xV8X264/Q4YuCEZoweCLvafN95XOq9g768cr7iZUR6cHQOxLkokuUCwfE6I6rvVmyy5HGE79HxDDV3U37gMzeWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914768; c=relaxed/simple;
	bh=x+HyiAqC4/+ajhOv2kgG2DPZ0lZUFwULkPt6zF0dGPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UeFvuUULbcoF0Lh39vOAK8Zsp6xiysMIMcDjvqtybrg3Fgurfgl5QRJFkWIVIQmT5MKc3hwxRTr0qj29GRAi3KhpUqYQErcaRDzvyralc/k1u95VgZyEwwZuR5YfjLNtv4+JS5rx0vbCTww5XMMjcIniECkQnuZEtlgmif87fUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn39mUeg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn39mUeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4431F00A3D;
	Wed,  9 Sep 2026 00:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788914766;
	bh=3yvjWaatn1OfxVEAyvaVTqH6PPQ6fV1/0gwTlUQlUmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cn39mUegsXYHasgx/t1WBNgFecshY5/5wUabC74kI1RjVdP3yPpbHKM3CZTNdyHOY
	 cb5nu3Cpk433rXSTpLLIbsfk7PEYOmkG9cqndlXQ7XubMeE0sgXkV1UyugtzhBqS3B
	 1oQRq7At43Ldk4rpkv6EiFoEWm5vS/6z17AvrmmlAudu6OlE7cdRg1YbpOnrrAKI5c
	 inbxMZ4J1pd5P1polxIctdR4ovuPsXRhn/3/7lOK71DyHJ+mB/G2W3AVB/eTMbEcSm
	 Ps25Xe8XyeyfL+UkDozsFaEY6fpLicqWfhXsq2kPJ4DK8ys/pYYh2GJ75Q+2lCJGgJ
	 PYAiGXcT7SrHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/9] crash_dump: Free temporary dm-crypt keys_header
 buffer in kdump kernel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: kexec@lists.infradead.org, "Will Deacon" <will@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Sourabh
 Jain" <sourabhjain@linux.ibm.com>, "Jinjie Ruan" <ruanjinjie@huawei.com>, "Dave
 Young" <ruirui.yang@linux.dev>, "Baoquan He" <baoquan.he@linux.dev>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, linux-arm-kernel@lists.infradead.org, "open
 list" <linux-kernel@vger.kernel.org>
In-Reply-To: <20260909003657.1570544-5-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-5-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:46:05 +0000
Message-Id: <20260909004606.2B4431F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Mixing goto-based cleanup labels with __free() scope-based clean=
up in the same function.

Pre-existing issues:
- [High] Out-of-bounds memory read using kmap_local_page() for a multi-page=
 buffer.
--

commit a9106b1595e8efc92f366f113d95f7f3216942f5
Author: Coiby Xu <coiby.xu@gmail.com>

    crash_dump: Free temporary dm-crypt keys_header buffer in kdump kernel
   =20
    Although we expect the system to reboot immediately after vmcore dumping
    is finished, it's still good to free the temporary keys_header buffer.
   =20
    Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kerne=
l")
    Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
    Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
    Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index 580534d43b66e..ff6055a97a4b6 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -118,6 +118,7 @@ static int get_keys_from_kdump_reserved_memory(void)
> =20
>  static int restore_dm_crypt_keys_to_thread_keyring(void)
>  {
> +	struct keys_header *keys_header __free(kfree_sensitive) =3D NULL;

[Severity: Medium]
Does this code mix __free() scope-based cleanup with goto cleanup labels?

The function restore_dm_crypt_keys_to_thread_keyring() newly introduces
a __free() declaration for keys_header, but still contains a goto out block
at the end:

kernel/crash_dump_dm_crypt.c:restore_dm_crypt_keys_to_thread_keyring() {
    ...
out:
	key_ref_put(keyring_ref);
	return ret;
}

Mixing these two cleanup styles creates confusing ownership semantics and
increases the risk of double-frees or resource leaks when the code is
modified in the future.

[Severity: High]
This isn't a bug introduced by this patch, but does the adjacent function
get_keys_from_kdump_reserved_memory() read out-of-bounds?

It uses kmap_local_page() which only maps a single 4KB page, but memcpy()
copies keys_header_size bytes (which can be up to ~49KB) from it:

kernel/crash_dump_dm_crypt.c:get_keys_from_kdump_reserved_memory() {
    ...
	keys_header_loaded =3D kmap_local_page(pfn_to_page(
		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
    ...
	keys_header_size =3D get_keys_header_size(keys_header_loaded->total_keys);
    ...
	memcpy(keys_header, keys_header_loaded, keys_header_size);
    ...
}

On high memory systems (e.g., 32-bit architectures), this will trigger a
kernel page fault or read garbage data if the total size of the keys exceeds
what fits in a single page.

>  	struct dm_crypt_key *key;
>  	size_t keys_header_size;
>  	key_ref_t keyring_ref;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D4

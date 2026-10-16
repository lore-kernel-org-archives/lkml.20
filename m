Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C016377566
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119983; cv=pass; b=WVQw42IrBx79wWrHgSyv8yYlzyrnSyrHBIbWuG2YPGTAuzVjMt31kgwOkCj754IIiOQLmFpXC+NU2+CG2juV+sPUAa/xJDpKNeJTyWqfy5wytcfGBkC+F/vnYpBq87KkS0fLX4asfV8mIGKkO1drGZWXvUg86x1FOjMfhWWdks4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119983; c=relaxed/simple;
	bh=DkWUdIZpNQ1WbOuCWAb9UPk9QMWrcczYalIqDZLDuxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppMfaeDjYH9s03v1zVNkh6BcyIoiEtO2I2NFlYGdu6gjZQ5M/pjOOjNiHZqSFsSz7AEfpXe4DWbkhoB6x+ilyvpc4aaelw8HaxGUMOyotbbCsClKP049NDYROLz163sG50//AqQkniiUYbh6sNJ+xmEQ7VKH4yK1a5317H/sldM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqRH48B0; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqRH48B0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e8c710847so746218566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792119980; cv=none;
        d=google.com; s=arc-20260327;
        b=TUPiGK0jc9Sfdcbdn6lOks998mVIDlAatWcaOZvgEDT351zeYxPz984rVFMyymTI0Y
         mOUXjxLGFyYHyidMyxApozELqK1C1OX8XZLWh7CwXHEYmiaWJ56v79eMeWHOD3Ss3orf
         IYtCKDoFikPZ2i1iHqBFBQNHcEflD1fENznwiBn0XT4wQl8xoBdollorR3SbG4l1Kf1o
         5GJ3+8eWuikQh45e4eNxyTHVfUo8vfxHfuwLAAjCMpnToFF3R+8Q8uYmOag+K8TwY7GD
         KMN6wfZ3oTkEz0b8VEIQAIa9Xt/ZpTYwHDyFrF3NQDCliM2Wa3608Q/cqWIzItES22Es
         oehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ5h2DXsBgi+drliVf0SasZjdtc6E51DgIAS0CDk42Q=;
        fh=1fZo3ccnwC2jSCzxs27F620cm73WSg1gcMjc8b85bvQ=;
        b=F962TFqwd/Bl7k6bY/TkPCtVGxNgJZSsNY7q+dpKaet4NUdYxHxGj6lyG7s74cey0u
         ZzRqZKsq8Bv9stK73raMzBCSi1Eeuc+2KjtpZp3luCLiw1NecrkC7QDGLW5iytiNpVTH
         YBCVj8toKYec2+9aEhLreukduCjcQgrFmiLlER982E4RY+QumCunt339fT0BLz+tRm4z
         95wm0+Nm1EqK03sHAw573msVaHJWYdPB5/fPWlR6cUInDBosuH68SGQir2I6CCoDfkYp
         NLO3WnEkck4L7fJLgsIF/1BzB1Q4Cttglb+Ioug83CUh2Wo63r9bNG8vi8661Jw9coVt
         nR7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119980; x=1792724780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ5h2DXsBgi+drliVf0SasZjdtc6E51DgIAS0CDk42Q=;
        b=VqRH48B0tW+12IPi5bI7zJaP8BTp8YyhqkJyVmN5/KBGg8wB3hDRdsoVsRrzp0sJau
         3qjCg6Dt5j2OXKKZzfRz+nX51XCqZWgFdpLkx+XbWiP+q6dMyYMn/iPlwctb8RiKL9cB
         ntDqcSR3ARTcJ0vK+gvT1SRPtkYalyvvpmUL8/l0jW9/FtJ5P1v8bckaNoaSs8vTsQO+
         CTmLtxzNnKtC7kP4w+6Sc7i/ReOOrdw5MqSzCpf+30HKZUj8Tw4h2SP46V0AcYlHpPij
         4rfQ2kc7ycuxl+FFNUy+9EFtOoy0HH7RGns7+tN/VU7pdcXA/+tF+TbHRAdKVjSwwnxY
         J0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119980; x=1792724780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ5h2DXsBgi+drliVf0SasZjdtc6E51DgIAS0CDk42Q=;
        b=1fPoWqn9jauBo/wiywTdhFSKe0qSrk0Y45oXQm7WTwM5X+PsL/mcsZNG2WggRlCPEk
         XZu+Yl4wvFHAAl7SipbYje/0VKzOOyQkgYfhOJD+i+VtW2dlI+eyTNG/jVn+2V+ZCQFS
         JD8mb50alljgCT0H7n8oFAb1j+furx+9Q3A975MTbFQqnjVblriAVw/vjkrQuNqXUqi/
         154mkUU6fWJe/3TYtGdWoaXzhEbtaocit1DOMlSlbP+eVz1bKdynTnLS3SjjhXpiopHn
         lJ+lMoWNprAoL2lizJQvfwQdgJu3Cx6AllPqHVvJzUgXp4KnkmiWCx4tDzs1a2XqjUvQ
         IaeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwLy0BNAPsXjIZbzfWzJ8dcOYTYxsTJEu5JxhQyMPJQaY15fWTXYr8FlDxEQudYGmmUlKvatLeGEMDg+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU76h4N42RxITX5X30rOzNKnHlixIBL7HljtOZxRCGJViaaTFp
	VhhUXyx4wf1fcjg+OFeiL0sV6W8kR3MPPpxkbhxMKG1yNr+YAuLlXM+zeDD6W/nNSWmEJXdUyS/
	IruXs/F2W4XtNoKPk7XTak24UeR+yrU8=
X-Gm-Gg: AYBFou1D1QsyDWSrogKiH33/uH79f3FPdc5RH/D4FI4mFbdHp/h1jYUP754qqGCzkoU
	N6eyW29a+AgOcRZHajK9lPjgPLM1jnXnSJh8a0scgl1PXdZ7ratI10UgsdJkKQ9r7wTPnTR8DR0
	TJi2igCtPfRBcMOZ1lX/Hf/wng+flJ5WebVu8FLOip02is8M4UiPs0ZAsVsjYfnBlqZe0HcWNM2
	yMbx9uYAlLrQE/Rn26zuZ/+5ATmST1m8TKlew9OXQnu7icVhTHgSn1qZPPBkIWa5E+VCJ6S7kUH
	F0WKB4lSAvbWlv9S1GsAFqPrTb1K4CYE+qS/NS7OOhjOMcTxAExyzeEFRQkbwG8MYxn/EbN7mrd
	+9HAm/9sV66Eq
X-Received: by 2002:a17:907:9801:b0:c29:4fcb:2886 with SMTP id
 a640c23a62f3a-c31a9fd831emr1921004966b.39.1792119980088; Thu, 15 Oct 2026
 20:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261014090821.227366-1-jiayuan.chen@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 Oct 2026 11:05:43 +0800
X-Gm-Features: AclHuK_e-lCNsmM0w1PY2ZD39crP8DWlyZW3Ur3Jggt8rHloT5AJAjERE4NO-1M
Message-ID: <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> On our production hosts we saw swap cache only pages keep growing for day=
s:
> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> swap slots were held by folios that no process mapped any more, charged
> to cgroups whose workloads had long exited. The only way to get them
> back was swapoff, and with other services actively swapping on the
> same host that is not an option.

Hi, thanks for the report.

> Such a slot has swap count 0 and an unmapped folio pinned in the swap
> cache, left there after a process exited or did MADV_DONTNEED. No page
> table holds its swap entry any more, so nothing comes back for the
> slot; LRU reclaim drops it eventually, and the allocator only reclaims
> such slots once swap is half full. The growth stopped exactly there:
> at 50% of the device, where vm_swap_full() becomes true.

Hmm, I think this indicates a much cleaner fix is available.
vm_swap_full is inherited from the old allocator, we can instead just
let the allocator reclaim the slot if the slot have a count of 0 and
ignore vm_swap_full at that point.

Will this work? (Just a minimal implementation for reference, will be
even better if we can avoid the overhead).

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c3288910b3e3..94670fe82f31 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -212,6 +212,9 @@ static int __try_to_reclaim_swap(struct
swap_info_struct *si,
        nr_pages =3D folio_nr_pages(folio);
        ret =3D -nr_pages;

+       if (folio_mapped(folio) && !vm_swap_full())
+               goto out;
+
        /*
         * We hold a folio lock here. We have to use trylock for
         * avoiding deadlock. This is a special case and you should
@@ -903,8 +906,6 @@ static bool cluster_scan_range(struct swap_info_struct =
*si,
                if (swp_tb_is_null(swp_tb))
                        continue;
                if (swp_tb_is_folio(swp_tb) && !__swp_tb_get_count(swp_tb))=
 {
-                       if (!vm_swap_full())
-                               return false;
                        *need_reclaim =3D true;
                        continue;
                }


Or, from the LRU's side, put swap readahead folios at the tail. I'm
actually trying to do that and it's not very easily doable at the
moment but will soon be easy to do.

> Options considered:
>
> 1. Fix it on the readahead side: after the read, check the swap count
>    and free the slot. Covers the lock, not writeback, and the
>    asynchronous read path unlocks in the bio completion where the slot
>    cannot be freed. Two places to patch, neither clean.

In fact, readahead checks the count before starts the read. It should
prevent some of the problems but seems not enough.

And another idea, what if we just add dropbehind flag or rotate the
folio, if folio_try_lock failed in __try_to_reclaim_swap?

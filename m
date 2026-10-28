Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207686;
	b=NcF4e+OX6FZ7WZ2lB/t0SS5AiqM1dPNEthylfU4e6ajnlYYrEz9GY4e3uwAu3VM1O62B
	 kNJEdjp5gx/SXcBe07qjfMI4mWKU6jqqdfav1cwHPPd/o/Oa0Bq7txXLkrOR3Il3obpKf
	 cfQU2tWilkdnhvmWKrcpnPq+9tXCmWVIRtcvQPBv5qx0xgMnViQPlRPrTNlns1wc81WKD
	 eiX0mfY3vjmFGOYj0tLFGIfYhTTsiuNzQ0UYiQOCyP2tIiisPF72SP+chw7Nb9DiXR9qu
	 l0GxTDjcOlXSPzi6QBhGx60ZWX3Luhi3uqZYtRnfSR9tGn9PNz1+ApSkleP5dv2RJzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bpvH8Kp7pKhcNKeWguQojqXnpg5TBg/XvZmMs15zNuc=;
	b=iGfsFY1Bw8Vf//7dmdQB36IqAXFvVeSMrt5Cl/h1aqm6kZFqR0Xlrke8dzkP/rvVCvhd
	 UOKUfgRAmK5MHSrTTNaAiwRZtirxtbu4HEIX7Jat7lb6uLQTLpoFtwB5xiU7zfLEb2HYO
	 tL8pF/X1MKY1Onb60/5ih36Ui5LdfKYF7okxVYzGsGqKfXfssRNiZhmOUu2Nu6W6TodDT
	 sW0BzrbzCGE212ReqDubCT9KJN3xLwxzpGf8MjeuqtLDB7rhGJ2ZOq+fbKBI5pdA63OBE
	 92zMBreCw86otnQDsPBuxdoo/0n7J1D64A/wIv2puMfDQQZ99ioWBTfd+vbIl4jv+uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKONlaE7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B48606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B48606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKONlaE7
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11214095e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207684; cv=none;
        d=google.com; s=arc-20260327;
        b=JbsiZ0cWo+PQ5AE4K8mKInnMuY7cAvDPK31Fk4rHrXC59rrAcnbafTixwIMrLzOiZT
         /c4g8ED00mlqPe0oKE0jaHBZJOKiH5gsNCZtqnM2vKaJrl5vhj4r3lJCEPtYehos+n3F
         1D5SHO3kEZ1LDgDTt5+GMnrvvGrB899nhtHroZ7pZUIrzp5pFSigcHF0UoY7utsKclZg
         2Zi/yy+JzxNBDW5FVBf8hq3wsueMcnCwB5wgsSbOXDCpQ1odDGiPGB3MIDhHcss2LH9I
         9OBoma33Ut9F8XLm+Pe4MLbrWXXWsI3iy+GgqZKekQizJIENGsvr/+w5r2zuC3s0mOED
         ZrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bpvH8Kp7pKhcNKeWguQojqXnpg5TBg/XvZmMs15zNuc=;
        fh=PPb9IIYPx67mwZCFnG+KUVLuRyUm2Akpj812Obj7iNQ=;
        b=qEZ4QV70CwGwUm9b8TVvlEjKV0XiUr+GDVpbmuhz4kZ3UjelDu6NU87qc7MsEiozqf
         Tvcd6qmmRevVOkGvtOhLbbAEazuQOT9C3SnE572ilxxNZRHoZpgpep++73Ri1TZZqdqw
         T12PAAqmiWpqpHndLUvOsIagD49qymv4CsOhuyhR2NhDdzUcTv+TOERtNJZH1fVPCIBx
         sBXhVPTUDPSyxBZJx4nHE788W/VbeMmpJUxblg77x8V3j2pPX1d4md2i9T7am0F5CRgm
         bYJcP9mccTd5cNdTXGmEiRw6aNQgGfppFETLeZUOGLp8iQ1Xijgc0sZQZ4XhVmJgW/Vg
         q5rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207684; x=1793812484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpvH8Kp7pKhcNKeWguQojqXnpg5TBg/XvZmMs15zNuc=;
        b=LKONlaE7wu/J1BUerHw9BiCNiFSpIs9zwdF5AwTU/rsMl5yW4qKHn2tcU9qqyh4RYS
         jzfpU3xM633m40P1YhleWHC0A1PSxmcmQAugbUhUJh0/RCqItljlS6hRMClg3wYH/LeW
         oyn7D7SD9/QlZWffio+hNy/BAu6+I1WKCLfIqM5UowHoMBelZMUQSKMgQ1crNFGo3Kge
         AFUAJ01By1ihkgKfPpFmQ0gTBAyHldBNb6dN+d6jzRH90vyRDmolD5O3BtlxThPpeNQw
         vg22IW1ZcJakoF4yt7ctsEY1bgkTI6NE1/SKUm50QvOHyDcHIN7Gn/zvmGbrLfOxQ8rz
         8w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207684; x=1793812484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpvH8Kp7pKhcNKeWguQojqXnpg5TBg/XvZmMs15zNuc=;
        b=jf7TQN08BbLpHEo2w4vD7i2BfNTAjAqKsqw1lqtgUkJMQfsewS015S/2iesqKG+GGg
         cIryG+fLxUo0ZEHfy8oM8/BObfp6QYAnN4HtGIkfzjFgOa5/sa2rt0vWL83Y2z4E70Wv
         gohIf/hTR2DL0nlXzVXeVlu4Ad0Fmk163R02UpVDc1Rdef8si5LhNjye/7gyWEDHBUJM
         Og8o+eFcf/tFwXQhq4H/2kyEU8mwBeO+zIYLKDxHKixGDEcoWtmHHRqTPiBjNTtIawOH
         y13cwsLhMsiT2LWfsdjDEft9xEGTDdfmN1IwBNw23a6tdDsGZFFVi0A1ZBIqy8NwyaPZ
         dM4Q==
X-Forwarded-Encrypted: i=1; AKwUvByG8QWnh5YjYBrbNPW3+BSU5xs7l0fl52X+qzhz25ej37KnO1vrfBYqYqTZuc2Vlyw1Dck8MwgellQa6DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN88NU8DMaG/Fe4urDPaQLc220pngZ7mk/Z6G+Ws5CX59twQ68
	KzR91x/vCwmL+kaXX8oqC8INq69iv/71MdYxCeMEJs7fpy+qOuUtQcCmWTUmPcXGu/F5SWY8EJj
	0/6alkXjk83T5t2nEsV8J9Z9NjD+cX3M=
X-Gm-Gg: AYBFou0PR6LOhyM1JBz6136jczBt2lX6vmQyROgYbBW7Tn+1ZMqbljM6KwlLPYOHQ68
	BNu7/Abr57wOZ3L9naY1V249A4Le8izIbg/1jkjIIY8sNbzXl/T3HwMgfjvYKrdUvzOUR3yaUXb
	V5luJGIxgFTvuyDFOrdztjSxsUE6kgxfCzXp2gcLE8WJjAzLFpWMa9IoClKScwPsMbeEZgKUpfj
	AlWh/tywyn0h7DuY3ErpZdihvZhIagqb0dYfoxREGv1Lf78CmaTQw4CN37XxAOa3ndShVTW0Jvd
	+TbVoFFEOqPnFR6HqhVSRq4MaXVoXSNXLnKoWJeVPG+ITFVv0EC1R1FyYhXugxjIYEmkx3kkBaG
	HL/IQ9F/D10HdfIm15ecgtpxckWBUPBmg3OqpagYW1J9W+1WVLw+zY0A5fLJyPjuLV7ghLNk/E+
	slYKI1zyq2xDXFmRrSPwz/f3FfV5u5Ap1yp5fyseVM3g/OyKGHKLFikDOOkxFkXRXFZRINdPdcD
	Q==
X-Received: by 2002:a05:6000:1842:b0:48d:f02e:f7cc with SMTP id
 ffacd0b85a97d-48e5d599647mr7878806f8f.24.1793207684168; Wed, 28 Oct 2026
 10:14:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-fixes_shmem-v3-0-4ce3baf2db4b@kernel.org> <20261028-fixes_shmem-v3-13-4ce3baf2db4b@kernel.org>
In-Reply-To: <20261028-fixes_shmem-v3-13-4ce3baf2db4b@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 28 Oct 2026 10:14:32 -0700
X-Gm-Features: AclHuK8uGLMeF-yLDH-Azm2VUTE0jqvp7VNoB49he4XaLFESCOLaEk0KKrGGynE
Message-ID: <CAKEwX=OPADynOVEwpn3cui4U2GsP5T9phZQMaJo5xF==Nq_Tow@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] mm/shmem: fix truncate loop after boundary
 swapin failure
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Gregory Price <gourry@gourry.net>, 
	Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lukas Czerner <lczerner@redhat.com>, Carlos Maiolino <cmaiolino@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Stevens <stevensd@chromium.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	William Kucharski <william.kucharski@oracle.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:57=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> If swapping in a large entry at the new EOF fails, shmem_undo_range()
> leaves the entry in place. Its final scan skips the entry, then restarts
> from the same start index and finds it again. Truncation can loop forever
> while holding i_rwsem.
>
> Advance start past the skipped entry so that a restarted scan can finish,
> as we already do for folios that cannot be split.
>
> Note that this does not fix the missing zeroing when boundary swapin fail=
s,
> it merely prevents the endless loop.
>
> Fixes: 8a1968bd997f ("mm/shmem, swap: fix race of truncate and swap entry=
 split")
> Cc: stable@vger.kernel.org
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

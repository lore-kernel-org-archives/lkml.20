Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7B3AAF65
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263292; cv=none; b=pMdU1d7dkR15GqiPOyQTgLjuA8KsQQ+YF9pk6jbBnAwML66LhVJ788U4XjK85KsYwb/EN6YLszyYRFsd4oRaMDw2xbjF45Sihw8sOcgt8yROseCIKii3ZR9K0loKursaNLVEbVvuT7dvT2iS+h5YEM/oadxLMPiUUPk/CAJ42F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263292; c=relaxed/simple;
	bh=yTyB4K/Tc+GvBYeVbC2i+O20sdNByGUf0bS3H4JlBfo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gP3MEGG2Xqk8wgWlwGVsTxZcvPJeJfVS3a9vXpCeQ6n9CcllZuRy28x9yjwN3C2nuiomf6wTe5wkuwJh8roT4ascBtwPxglItti6Fxui6PxCbxIMuQswbdyle/PpQ+/v71mdykgHITTwzSaIJ8lz3orbFSAQPGKpSgxP6a0BvU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=i4ZUH8H1; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="i4ZUH8H1"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 681BlTXx738106
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 1 Sep 2026 04:47:30 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 681BlTXx738106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788263250;
	bh=z33T78IIxJOz2RlaF5wk+Z5Gxg3obfLwQZ86YgS+fE0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=i4ZUH8H1Z3fq2fZhQgmX3et1I60wtOpovJDQHhMnce6At+xUJxs6k7stqhWF/EcH9
	 MnGJqjFPQtit9eLd1E9LdfC9rHw6q/PwegrUFH9Iq5V3fD8GxRmEWq55q1tjxMR1EA
	 w4A9kfGcsMaibUgV7NjLHbwy11F1qHi+rwsV0uGZs1ftZQvYseqc0bo0uLYGz/XaXu
	 2lb0ixdUX/d1mC5nFHeo8xqWmxgFEhXP9NzKYfxMupzn0qmnvuU0NPY4ABLqP0nMuN
	 EsaN7Cu/INl43qWZB2F7RugJbroTYLFNsK2R6gC19dczhoEXCAMArROZedCSwcQP8N
	 d+qCz+9U7qfvA==
Date: Tue, 01 Sep 2026 04:47:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Federico Parola <fparola@amazon.de>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dan Williams <djbw@kernel.org>, linux-kernel@vger.kernel.org
CC: nh-open-source@amazon.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/header=3A_Use_=5F=5FDECLARE=5FFLE?=
 =?US-ASCII?Q?X=5FARRAY=28=29_for_struct_setup=5Fdata_flex_array?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260901114246.71579-1-fparola@amazon.de>
References: <20260901114246.71579-1-fparola@amazon.de>
Message-ID: <34596353-DB90-4832-AB7C-8E3125844947@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 1, 2026 4:42:39 AM PDT, Federico Parola <fparola@amazon=2Ede> =
wrote:
>After the `data` member of struct setup_data was switched to a flex
>array by commit 94dfc73e7cf4 ("treewide: uapi: Replace zero-length
>arrays with flexible-array members"), the struct can no longer be used
>as a header in a larger struct in C++, with errors like:
> flexible array member =E2=80=98setup_data::data=E2=80=99 not at end of =
=E2=80=98struct =2E=2E=2E=E2=80=99
>This breaks compilation of our userspace code which imports the header
>in a C++ project=2E
>
>Similar to commit 2619da73bb2f ("KVM: x86: Use __DECLARE_FLEX_ARRAY()
>for UAPI structures with VLAs"), declare the member with
>__DECLARE_FLEX_ARRAY(), which uses [0] for C++ compilation=2E
>
>Fixes: 94dfc73e7cf4 ("treewide: uapi: Replace zero-length arrays with fle=
xible-array members")
>Signed-off-by: Federico Parola <fparola@amazon=2Ede>
>---
> arch/x86/include/uapi/asm/setup_data=2Eh | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/include/uapi/asm/setup_data=2Eh b/arch/x86/include/=
uapi/asm/setup_data=2Eh
>index 2671c4e1b3a0b=2E=2Eafe1e3a2a6564 100644
>--- a/arch/x86/include/uapi/asm/setup_data=2Eh
>+++ b/arch/x86/include/uapi/asm/setup_data=2Eh
>@@ -28,7 +28,7 @@ struct setup_data {
> 	__u64 next;
> 	__u32 type;
> 	__u32 len;
>-	__u8 data[];
>+	__DECLARE_FLEX_ARRAY(__u8, data);
> };
>=20
> /* extensible setup indirect data node */

Can we do this in the postprocessing of uapi headers, please?

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905674;
	b=lIe20TreAykEghsmHuFJCUSvPWqFAZa2DoouTH85s0b6Y+m2MaJSrhgMUhQdjqgDDSgB
	 hcYgPUvTBCHcEdYzHhh33AbaAz/L42Ug03yRkyp3svDqgk/hrxXNCPwg3aKlY/XosebeS
	 eo2aCdhIR1YbxEDBQ04FsdBnNGAJMzkubUptZ1347mncHJ1y6V7PVYsJaBwyBqdwQmHpe
	 5Y+pXXSSlk27I0DuaD8g1dMRSJ5fHqWgtBCRsbb2954+cVrRFXc6D2oCa/Cy85olkYKBS
	 D0JXD/uN5ABqUF5Ir0fyHjg8+fOylY2TyKjqghGAe4Zbbr9lS33ePvKV3rEWsvlokzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905674;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EgHPyo8wPLK1o4zNxs+/XCVVqInnrzFjcZ18jP4kP8E=;
	b=uUB4aOP/fnDDmENamGXwV1Z/vvq85K/mYfue2/LjKC4gRO28B5Mfw+IGcXif/2Ih5IUy
	 jU8a7skcHJBm2XjggGFDtBe2v3u2wuS3coUDYL64V91d8MlRKUjgCZbxUq9/gOhWH2azv
	 i6IvoAV/I9GByBXiCiUo81SoGQXsrfD11a3D48qZu+V8uhTY2gh2d34dFCmTZjeFpjWXX
	 2cnyrwQVehJbtswbar9GVqFRxJs0UXpGyL1F63S5vf0FXQCuPjXBg91vyMYeSXKvFvvRW
	 desWiQGMdCX0R3RboHrm8mZeWIZJwLnpHsNQwz243AyyeCl96vN5cXuzdQKORQjDuJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GkgLJM/h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkgLJM/h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243301F000C5;
	Tue, 17 Nov 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905674;
	bh=EgHPyo8wPLK1o4zNxs+/XCVVqInnrzFjcZ18jP4kP8E=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=GkgLJM/hnEN5RZVQNRgzDZQLr0x4Yb9NgcjaYxyDVfo1CdK03B0CA9iL0MzX2n6Ji
	 z1xaBqHfBfVTE2bLzi0Jv1xnh+zUDbdE0iomD4Sxgoh+4ziH6f275MERRS/oDtLrPX
	 ER9anKzIgCynI9HDzo6KGw3O3fsqdpfqu30y0eedzMBd6hL7+/vbAWfQPt7VT6d2Vi
	 R3yV3milttAYQA8YZuGjDWWWLxsIRF6btWFptZ7b2oqvYrq1e0MjX++7F7KWYO64ex
	 D+yR5THrNO5iV23Vwgzr/HKRsHUb6dUeR58jAfm7VeGkueEciHg4BCN3vvm43SiAXS
	 Xv0Z/FS5qhd5w==
Message-ID: <097ac698-f60d-4bd6-9936-a52e483ac656@kernel.org>
Date: Tue, 17 Nov 2026 16:54:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 04/20] f2fs: support subpage blocks in
 directory operations
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-5-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-5-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With subpage blocks, a directory folio holds several dentry blocks.
> Address a dentry block within its folio by its block index, and mark
> only the modified dentry block dirty. When an empty dentry block is
> freed, clear only the state of that block and keep the folio dirty if
> other blocks in it are still dirty. If no dirty block is left, clear the
> gcing flag of the folio too.
> 
> Also read the name length in f2fs_delete_entry() under the folio lock,
> so that the dentry bitmap is not updated with a value read without it.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

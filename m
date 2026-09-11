Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711149E137
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126658; cv=none; b=ndB33KjN2V+wjIP9i5wQZfJIFfXWe4DAGJKY4CzvCIj37P++zwkjBNOEbPpPKMKBPxYRtz8qEksO6JOEyahLsYMJkiGbvxyev9j+MjOKEh+Uf0RIaomBRIa8AmR2Vfy5BV1AvQLE1Yg93wW4jdwhr6SwLt45ppZv4b49xTE4b9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126658; c=relaxed/simple;
	bh=MJ5HeMQTOPvfBPLcSWWcI72ouKskJadGy8TbxmXhVMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDL5hLs2tVVZFVjujI2ehKem7PjM8vU/h5QrOjaEmMrW/tvG/z0FuPkRCLFAy588b0f9AENe6rQQtxkGvX1Ji15fx/u3RE7QaVE3o/bFHPAkQ+eKqbHxdIrJq3ZF5rJYd5qU2xHUR4st4XhHYgX4O02Jmn9oRy3PvmBPzkoq+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRQ0sIya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRQ0sIya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7561F00899;
	Fri, 11 Sep 2026 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789126657;
	bh=3DRHhpyoB1R8bQIC+7BlAFBsbvzgtyAVS++HtAjVYL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dRQ0sIyai34LCeHnUWuiUX1t1aC6QE1YU3xggfrUWoURLhWaDrFxX+AOJGLVqsLJS
	 xq73Ad2cJtyLLy2QW6SK/K8QxTKv4obi/jAZrCSU8WHAQiMGBKrdHf1jGERnxaqhQy
	 NvXKyiGOrrf/beRa6jMxVBKnO+CUav3iH4yG4gj97kwekJhmoKPLMOZsFgvtf0lDjT
	 2Eo6/KvtRL5PR9T6HMNbIAGGeN97AeNEZo6nq2CENA6ITyY+IHW60QQnnwUezgX05W
	 WzcP0QjAQi0f0i65uvfnGk7b+9gUYT9cKhIIj59jITbUEzyOmo4NOTFpr8WRYAxzo4
	 HiiDh1PRKeWVA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6D95B198004A;
	Fri, 11 Sep 2026 07:37:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 11 Sep 2026 07:37:34 -0400
X-ME-Sender: <xms:--ejarEH55EddnsXiqqcRZYvFjt_2oYqQsnxjvwIhTCga9GFzKtbPQ>
    <xme:--ejagFA-fRlKLNJernfVJTFceqhRqrzTJd5MVH6CDrbc2gRtVkW6UhEtJ--1_hHq
    KgjVPxqOF39OvAHLgQ6HA8aLIIedBKW2iFRdOK9SiKuMzPT3-pDbo5J>
X-ME-Received: <xmr:--ejartM___lAp6Hc-SIItsSd0eg__a6HbxBHGMsdjvj0RSqwd300d0Ih-c>
X-ME-Proxy-Cause: dmFkZTE/zAf8Eqs/ndUqLcBqL/f9LIcLkpHSzGya1sJptSh2JASXbVwHmEtK6miNJBR5q7
    vh/t9PwhueUdJg+9DdeHwWFuj4TfSez5bsVhyfghEUgUD7pRvoWwmNsIcr6ziBlTSI4iF2
    g0qkJKh9dwff3aqdXGbIVPM0m5uoKacb5qDThBFo+jf2kGnFzQw9RGXaoJy5KGBKFrbiN4
    AIpXWdxFUwZCt3l5EDA8+AAI9yrcLcIH9Np3Va50mr3n5OKd8GUfE5n2tz+vfEVbC+kZjs
    X9lXTLT6bSxmjga4JVt8544pBpiSA9YahEsFT+FdHzZw/uhe2zkTFeVk81jR5UO5TZ2Hqc
    s4Qb7gk/zAH/lm0QM2Xw9Q4mnBhYbRTSBLY5lGtsi0JjZ/m/78/wc+Kq/IDpUu3N87SVfH
    OitSbfjUIi+P5qO2PXO9hFId/VTzZNKxN6aA0S1zs0zCK4kMXV1LjO9HZ5gabMUSYxMY0J
    ETaYihn5jaqoF2mxMyFnxcPUIWj87jutHJRCe7ukgybgnUD5vp4FOLKfDwRjoZbhomoa8V
    Tg6CFWLVT2vAp2XOyU2bYrUp6FMkh1u14Q8giIMvmAZ1kZWDpvm74z6v9wmEzIPP5A333p
    eeaRutzQ2ihM8ECb2pzveLA+IjcRcZcPOI7vSusnuLJeRojP2X9Q1WLeFttg
X-ME-Proxy: <xmx:--ejajavmj7WCUkdMGkaHhYqiOLxncFt9yqq9HiTdFHUYxEApzSrvQ>
    <xmx:--ejalPJz4YLQU_tqADyw2S33awwp6r93XPGY0g-JbjBRtHP2G73MA>
    <xmx:--ejaotTUOnj2FgoV53VzBFX5n5YM-aG7SvGJvPHhas_JEzTrInviQ>
    <xmx:--ejatKjKz6--kuffZ9VGVE_h1wiVxkqfuRtq1WX011-ge2KuyGv_A>
    <xmx:_OejapkC-hTj6IIE3BBboypLtLMadSQzWcPSg4OtS4fPMoBQLSv4x1bz>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 07:37:31 -0400 (EDT)
Date: Fri, 11 Sep 2026 12:37:30 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, 
	ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: shmem: ignore sysfs configs for shmem forced collapse
Message-ID: <aqPmxRkJokRyVzdU@thinkstation>
References: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>

On Fri, Sep 11, 2026 at 12:04:33PM +0800, Baolin Wang wrote:
> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
> ignore any THP or mTHP interface settings.
> 
> However, after commit 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled()
> into shmem_allowable_huge_orders()"), performing MADV_COLLAPSE on shmem
> will depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
> (although that is the default), which can cause MADV_COLLAPSE to fail
> unexpectedly.
> 
> Fix this by returning the result of shmem_huge_global_enabled() directly
> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
> shmem THP/mTHP settings.
> 
> Fixes: 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled() into shmem_allowable_huge_orders()")

Hm. I don't think it is the right Fixes tag. "No functional changes" in
its commit message seems to be true.

This might be a better fit:

Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")

> Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks!

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>


-- 
  Kiryl Shutsemau / Kirill A. Shutemov

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E158039F;
	Wed,  9 Sep 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963935; cv=none; b=bKlc/QWnHDGKQRmQ2+4rp6GCv0xtYpoDBmlztm/b0hEg52crQsCd+EbKsD4J5g9VHa5aLfVl7B/04NQ6EBzaYDwzMrgZTetFjmUaA9kkuzlnssZI0XkgXKe7gVAoYAzLCRMEh/flHn4gcjcPQdeiuS2k3f29zKBJnQv4NLIM9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963935; c=relaxed/simple;
	bh=rBZt1kcTWqud5G60iKIYthZutkovA2XYZTTu3Ksanq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2WNkQ1ReFSpbI0lbrHUxRQxDi44NT8RHU5D0h1fgFnNX1N0hlHF91kInx7aUha6ww6QX2XDfDIcRTzw67JawGd8iklKhezKpxr87sYTzJ+YLobbq1POr40C1jeYo9s76pcx0c0RT9ri+DWdhjmH7PQUijTvO59te4SNvnxd+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbcrOtTE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbcrOtTE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373781F00A3A;
	Wed,  9 Sep 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963934;
	bh=9BjUIMuOmTXn4FT73d2dfN12CB9siZd6b49LISnNZwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kbcrOtTEfhgfmf4FvameQQUlruCeG9b+WfEVETtI9TCFkH5wQk9lHdZglvqFKQVzM
	 WEzo9shRQUMBi+XTuRoqfZFZ7CZ0/ca42WR0/ukOWoTpjjvma0yejn0dcKE4xH4qpS
	 z1eelBJJ6uWCxbItaCIixAXIlY3gYZwaKdqrlJxyAGIrcE00V90SBPj/ebOFAa1MX6
	 nMcn6VkDcb2phk9aEWisCixx734Loz0XK0dFcay+pvctKq50WI32EZkMGgcxolYIPx
	 emOPJYUy/lF6TxvaiJLgFRTjljuA8kPDnRxg/B+rTUPWe46x8TWWhfX6v6TnbU+5eb
	 RU+05Qe93k+7Q==
From: SJ Park <sj@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
Date: Wed,  9 Sep 2026 07:25:26 -0700
Message-ID: <20260909142527.106469-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909141255.1367539-2-manuelebnerli@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  9 Sep 2026 16:12:54 +0200 Manuel Ebner <manuelebnerli@mailbox.org> wrote:

> Mark key words 'gfp' and 'GFP_KERNEL' for syntax-highlighting.
> 
> Suggested-by: SJ Park <sj@kernel.org>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> Suggestion:
>  https://lore.kernel.org/all/20260430010332.114100-1-sj@kernel.org/
> ---
>  Documentation/process/deprecated.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 22a5e62c9..4d4d29b97 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -404,7 +404,7 @@ become, respectively::
>  	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
>  	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
>  
> -The argument gfp is optional, the default value is GFP_KERNEL.
> +The argument `gfp` is optional, the default value is `GFP_KERNEL`.
>  If `ptr->flex_member` is annotated with __counted_by(), the allocation
>  will automatically fail if `count` is larger than the maximum
>  representable value that can be stored in the counter member associated

I suggested the change to only 'gfp' and 'GFP_KERNEL' because those are what
newly added by your patch.  Because this is a separate patch, what about
scoping for larger area?

I wouldn't request you to update whole inconsistencies in this doc.  Making
only the paragraph more consistent looks making sense to me.  So, how about
doing same to "__counted_by()", too, as it is also in the same paragraph?


Thanks,
SJ

[...]

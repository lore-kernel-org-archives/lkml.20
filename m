Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E863EFFD1;
	Fri,  4 Sep 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557301; cv=none; b=lyfObnTuIfn42tdlKhLA4Hm6h4PEKl2Qovqd+BK6ScINcHZjerqPBkJYtXNK1jQDjJl9XdK990gItgMlQkHtvVi6A5dLZq7ikhK+apBoO3dV1x0aigd5heFDnWL9uYL5QGruHTyHDB3+ldfEfh4dtajPCq6PM/ZfGZgvMe+UJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557301; c=relaxed/simple;
	bh=K0+/29xyFuuZgxU40Y04NHJGU7f69i70oAkTIP6kgl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6WAKqQvyYH00psRD4H7ItqFy/tHxRTyeYUHH0bo51h4gp+OrG4ma5V/cvUNGuWukZbNHJzNPlIko8kQT8isPqh+ZYfVLUdbLePZlkwNiG5Z3KEGIjuX10gFVHR1Fsdon690CJqOVcMKqM6yYGJu+bse5Kvlgs+L8DsRXZu0ZlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NyTgY/EQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NyTgY/EQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4nyjJDxxpUq5zqKkD0kbyT/isDFNvog93IRq3lBx5bk=; b=NyTgY/EQeg6bvufazhnnvcnQJg
	EQ8PqVG9qcNkAxlg3DN90YuhcBS34hsKey1aMEwv6qmuGfI7wF0U/Gd3mTdpqdynBeZoxVhmAuS1o
	8IrKA2yKNy3KMxgbyxiUyiTfxLaeEIoshdXwF4mDYTYecnyHPacphuXcUlnKbsSBAjZAzY1tISOON
	DxHGc2Al5ZKu6IXhelcVrMvYraRkUgVRVbMvuGoqsO+Ay8O2UX8iGu4/MpzBtrPGPIPvY1X0/R7Sr
	1x3pb2woO8Fm5d2BfcFqja5HXjIya5YtJUDafXHkoSbGbChgn5tqkeE7d5AZcBPzERaXXuFXHCz4W
	SSsuKMFQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bSN-00000003KS2-2I7q;
	Fri, 04 Sep 2026 21:28:19 +0000
Message-ID: <682a99b4-a370-448f-85fd-a6dac5a2c558@infradead.org>
Date: Fri, 4 Sep 2026 14:28:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/lib: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
 <20260904113257.13594-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260904113257.13594-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 4:32 AM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  tools/lib/python/kdoc/c_lex.py        | 2 +-
>  tools/lib/python/kdoc/xforms_lists.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
> index cb95f5172448..efbc23c01abd 100644
> --- a/tools/lib/python/kdoc/c_lex.py
> +++ b/tools/lib/python/kdoc/c_lex.py
> @@ -68,7 +68,7 @@ class CToken():
>  
>      MISMATCH = 255  #: an error indicator: should never happen in practice.
>  
> -    # Dict to convert from an enum interger into a string.
> +    # Dict to convert from an enum integer into a string.
>      _name_by_val = {v: k for k, v in dict(vars()).items() if isinstance(v, int)}
>  
>      # Dict to convert from string to an enum-like integer value.
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a53..423e2bab7667 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -53,7 +53,7 @@ class CTransforms:
>          (CMatch("__attribute__"), ""),
>  
>          #
> -        # Macro __struct_group() creates an union with an anonymous
> +        # Macro __struct_group() creates a union with an anonymous
>          # and a non-anonymous struct, depending on the parameters. We only
>          # need one of those at kernel-doc, as we won't be documenting the same
>          # members twice.

-- 
~Randy

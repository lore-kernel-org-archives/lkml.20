Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDD28F5
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060188; cv=none; b=uolVLIzdDHPVExDp6edIri66HQaoXIzC/2j8rw0fu1qKe+bBgUNc7g9NS/RUzg1hyzdTiSQUC0tlNyha455f6FMh52qGo/SZhpLriveMnPORf6Rxxfl8U5PFjWixjK074Zc+jFdAPEFP+hc3uFkxeosTURtauVAHTRm92HAIfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060188; c=relaxed/simple;
	bh=c05H5a7q4I8k1YR5G0d8uVbhdPl3XDGbW5YKFxQZbSI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pe9uvCLVLoeNRIBXlScL7F9OQUXmfFEo19q7ejBnLtBtjAikki1CT2hIL4lskliKYMm8y/AglBsPVDEPP9rsy4eGCVPcs5RL3rknxjm53mtOmH6T7uMylLxP6DFm9+OYENnNXSTjPHW4HUVbYtEsxWwDa3TfYV94E9qzvrcrkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CoPflkv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CoPflkv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3385E1F000E9;
	Sun, 30 Aug 2026 03:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788060187;
	bh=j5zR52O6L9k49BYzViwhGzfEQlU/GjdUI0PR6WWZ7Lc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CoPflkv3gRKSGdHwDhXGtsMQ3AmX25fBVXIa32VVZ3/x2+0tOz7HtOgTsV++SZpzl
	 3FD6FaqonIkRWFbxWeIYmom7SCs8v0Pr92CRCn2HCdL+PkE4M8921we66AmUJWn/bU
	 Xuo/StHqN7YP0OdveaXXDmy+tCEJTT2WQBz7qdUs=
Date: Sat, 29 Aug 2026 20:23:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yuntao Wang <yuntao.wang@linux.dev>
Cc: Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dyndbg: fix incorrect mod_ct value in
 dynamic_debug_init()
Message-Id: <20260829202306.67cf6ff7223b1bc33b57730d@linux-foundation.org>
In-Reply-To: <20260811121831.577848-2-yuntao.wang@linux.dev>
References: <20260811121831.577848-1-yuntao.wang@linux.dev>
	<20260811121831.577848-2-yuntao.wang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Aug 2026 20:18:30 +0800 Yuntao Wang <yuntao.wang@linux.dev> wrote:

> Suppose all `struct _ddebug` instances belong to the same module, mod_ct
> should be 1, but it is currently 0.

Oh.  Why.  Does

		if (strcmp(modname, iter->modname)) {

not evaluate to true in this situation?

ie, more details please.

> Fix it.

What are the userspace-visible runtime effects of this bug?

Thanks.

> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -1456,6 +1456,8 @@ static int __init dynamic_debug_init(void)
>  			iter_mod_start = iter;
>  		}
>  	}
> +
> +	mod_ct++;
>  	di.num_descs = mod_sites;
>  	di.descs = iter_mod_start;
>  	ret = ddebug_add_module(&di, modname);
> -- 
> 2.55.0
> 

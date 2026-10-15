Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042234FC8E9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107513; cv=none; b=YMS4w0eDKJm0h6pGMfmR5RTHmZv1SZoK7W1twOwClgEgAknaXTw44cFF2FkcN0+me8ztACPrBCd3P/wRI3/7UI2Rc6Nt32ttYJKZ2OK7lDcgY+iJrQpV1v5HPHLzhTgbBo42qWludlpUHZc3OJM7uWI2KlMnuocJI4t75asiDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107513; c=relaxed/simple;
	bh=j+CRT9+jdc52gZxTNgAyJYXFIv09EQ6Pe+yp/zQOAV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEovHLfDAiUcCq891KlMF0SCP7X6umVr1haFaU9jUEE51iTY51YXUDgkRnupHZZ2q8X6ZgMj0rc+JFhsj0k62Jyl5yObjawXHkodfkGmZZh3MDRcJilRwYlB4cyRpcMX35I5gxIL6QEW6Z+IV13Bd8or6SSAl3GuVHJXZ/sOLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XsFREMMe; arc=none smtp.client-ip=91.218.175.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XsFREMMe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j+CRT9+jdc52gZxTNgAyJYXFIv09EQ6Pe+yp/zQOAV8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792107509; v=1; x=1792712309;
 b=XsFREMMeCUatyVFoScJDqEbeHATKsHQEvsE4OjXEpiKChtpNCNj/neIZl+Gy8yshtqSmjuEB
 AXavP+FOPu4GPVoJ66N1YI+tVJGDnscqjkU7dB+JFxggGpf59OdkEiT5EUlJ6ZavRM0BZiXZ9YO
 PcNnLhhg+nx/73aPmKldAOm0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5741ca99a2a784f;
	Thu, 15 Oct 2026 23:38:29 +0000
X-Mizu-Trace-ID: b5741ca99a2a784f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 15 Oct 2026 16:38:28 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: allocate inodes outside kernfs_rwsem
Message-ID: <atFhCHyRzxUTnBfn@linux.dev>
References: <20261015221110.3183461-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015221110.3183461-1-shakeel.butt@linux.dev>

On Thu, Oct 15, 2026 at 03:11:10PM -0700, Shakeel Butt wrote:
[...]
>  
> @@ -173,7 +171,7 @@ static struct dentry *kernfs_get_parent_dentry(struct dentry *child)
>  	struct kernfs_root *root = kernfs_root(kn);
>  
>  	guard(rwsem_read)(&root->kernfs_rwsem);
> -	return d_obtain_alias(kernfs_get_inode(child->d_sb, kernfs_parent(kn)));
> +	return d_obtain_alias(kernfs_iget(child->d_sb, kernfs_parent(kn)));

Sashiko is complaining that inode allocation has been moved outside kernfs_rwsem
but d_obtain_alias() may still allocate dentry under this lock. The fix is
simple. Something like the following:

	scoped_guard(rwsem_read, &root->kernfs_rwsem)
		inode = kernfs_iget(child->d_sb, kernfs_parent(kn));
	
	return d_obtain_alias(inode);

I am testing this change and I will wait for human response/review before
sending out the v2 of this patch.

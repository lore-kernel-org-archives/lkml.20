Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3B302146
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536096; cv=none; b=Og3ZLH7NnEdIc/8dz9Od3wGSn5YI95Z1cMjz6HvefdVeD1QuEsr38EN1HDad3vUuv38ZBGTRhfZJ0ClbJtUaVC+Wp+ET517BY7CTfDpD/xGgv21ka8wCrJ3Jz+xQnHLeCGcOGUsT7p4dFIKu2bWDI3PWbYrYiMyB5mvtpknCAkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536096; c=relaxed/simple;
	bh=dxHYj5mtAj9G23/xifSZT8O5npOXri/YHHZUKO6RTF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctCNWOglzZfKkCkOzZtekwL95RleXk6SS/acooQRuka1eh0Yf/eIXWbYcZNswZo6ouUTOcZvFSj4YdLhREw5SonnqYRLTRPGESJ4A/o37ENYZj5Y9gyOcss/gDhKkLHbV/qx+28nK2lBZxpJjHENXxTaCd5FWqOi8nZUd7a2vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r7flXrej; arc=none smtp.client-ip=91.218.175.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r7flXrej"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dxHYj5mtAj9G23/xifSZT8O5npOXri/YHHZUKO6RTF8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788536091; v=1; x=1789140891;
 b=r7flXrejFqUYcBJaUNBDsEVxjKg7dudtGvOwmLmvf3dp//wchRbPTGNOr4wxEJk2mJTTdTHc
 aS6HxiqPjBLuiOiwTkzN2sE0VCIpsLGD6yUpieR+HpxuTCn65KvR7JxuU6g/2GcDFxrkYnwGh6b
 lBkaTbSxcwncz4XYVNYdYpqs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 202d08132f2dd1d3;
	Fri, 04 Sep 2026 15:34:51 +0000
X-Mizu-Trace-ID: 202d08132f2dd1d3
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 08:34:46 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, 
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <aprkl_CCGJsCPvLO@linux.dev>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
 <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
 <aprVEyqOrdmuD-HN@linux.dev>
 <2026090456-unblock-elixir-7d4f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090456-unblock-elixir-7d4f@gregkh>

On Fri, Sep 04, 2026 at 04:44:18PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 04, 2026 at 07:33:45AM -0700, Shakeel Butt wrote:
> > On Fri, Sep 04, 2026 at 10:13:11AM +0200, Christian Brauner wrote:
> > > On Tue, Sep 01, 2026 at 06:40:50PM -0700, Shakeel Butt wrote:
[...]
> > 
> > I assume the kernfs bug fixes [1] will also go to your vfs branch. I will send a
> > v2 of that series with appropriate tags and will try to improve the commit
> > messages as well. I have a followup improvements for kernfs_rwsem which I will
> > base on vfs branch. Just wanted to give a headsup.
> 
> kernfs patches go through the driver-core tree normally, not vfs.

My followup patches depends on patches already in vfs-7.4.kernfs, I will
continue developing on that branch and let you and Christian figure out how
these will go to Linus tree.

Thanks

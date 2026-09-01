Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91491429825;
	Tue,  1 Sep 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260791; cv=none; b=B0bmrInIBL72t/8nGoaRF5AvRBP6OjfSYQz3+09XNA2aIweP0hO9k8ZzIDa9olS1e/eKricuqvC3x6/rU9tBXHFYDqxf+43WfAcfbr02E/XEAroE9CHUv+kEdKcrK0DRPcZpkniDq8zDfTdNmKt/IWhWChnVr19V7MRdbZyvQ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260791; c=relaxed/simple;
	bh=1mA1loi84tUCYW+QWzo5qosDRZU+EM7TBBzfJsGYrdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyZQi7F4eeYZYMamtj4QwR+/6zGfKK6mxzIJsuYg7UuN7Gh9Rok9XPilqymJtLuYqjy+Cc1UP8l9zpaEaCLbcpNTXp1wwbSkMjNZxqogMojcJAHI3bFAKv2kDf3Jw3lNIDBfNpzi3XkXCjFNAZW95I6B82/k0Jqj/TBEoFj4fNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=iLw2b+f2; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="iLw2b+f2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788260423; bh=1mA1loi84tUCYW+QWzo5qosDRZU+EM7TBBzfJsGYrdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLw2b+f2ATdV05AVl2Jd9H61Ah8mDD25pe90bDL3wpy8neegRoFgSNirlS/vzvCsw
	 jJbf6bZUXENUsdg0eEYR4w8GzdEHzKB6f0ALD3hz+s2GZFUZnTLETWFDWJDBXeMMu8
	 E+/HP3R+xEaw3OHchcpjvNKTUEIjATh4OMEZxk9bFyc67uDhavhTj30dhAVT+4nGan
	 OZgUnmgC3E+KXAPEkamx15ne6sdfKJwQ8oiY06pKndUC128aPvhoVVQi14ACQCB7VL
	 Qj/UAY2cgCQgYiNif1fDOv+YYfqJkn4Z23HNyj+7jY5aOwTApqejgYxNpxSMG70D9v
	 cukhi6ilKikzg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id E084F41444; Tue, 01 Sep 2026 12:00:23 +0100 (BST)
Date: Tue, 1 Sep 2026 12:00:23 +0100
From: Sean Young <sean@mess.org>
To: CJ Liu <firefly0158@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] media: rc: redrat3: KASAN use-after-free in rc_dev_uevent
 after probe failure
Message-ID: <apawR3dRUYSGrTqp@extorris.mess.org>
References: <7dbdc4e8.8c60.1a05c579a17.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dbdc4e8.8c60.1a05c579a17.Coremail.firefly0158@163.com>

On Tue, Sep 01, 2026 at 05:40:40PM +0800, CJ Liu wrote:
> 
> 
> Hi,
> 
> I am reporting a KASAN slab-use-after-free triggered by a syzkaller USB
> reproducer on Linux 7.2. The issue is reproducible with HEAD commit
> 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229.
> 
> The reproducer connects a crafted USB device that is bound to the RedRat3
> infrared receiver driver. During probe, the device reports invalid endpoint
> properties and then fails several hardware communication steps. The driver
> eventually fails probe with -EIO.
> 
> After the failed probe, systemd-journal reads the device uevent file. This
> reaches rc_dev_uevent(), then add_uevent_var(), vsnprintf(), and string().
> KASAN reports a slab-use-after-free while string() reads a pointer that was
> allocated and freed in redrat3_dev_probe().
> 
> This looks like a lifetime issue in the RedRat3 probe failure path. The
> driver appears to free an object or string while it can still be referenced
> from the rc/input/device uevent path. A failed probe should make sure that
> no sysfs/uevent-visible field points to memory that has already been freed.

I am fairly sure this issue is fixed by this commit:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/af452b9e01331b5338a1e5141624f17607239207

It was only merged a few hours ago.

Thank you for reporting.

Sean

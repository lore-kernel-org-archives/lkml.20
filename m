Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C243543F0BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712834; cv=none; b=qRUyJdMiwMgVIAKxiCy3eVJ064dO38ROdMob9IRfLzosYX1aH85TYu82/2QrYRXUC4wGaVA69l2FL96TPyzzElN1kw5DPV7pSF1pkzL120qVBxNXg+djmhjd5KE88wRCtUmG1QDvakcQIGcocdNLYcKJ6RLCIegSYDEXLb+J1IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712834; c=relaxed/simple;
	bh=kva/VIdf88G/ICmtfrFB++G0jS23l0SB3WGK5YjnII0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxhcivN+ESSGl/G7Fgai4tZITtcJgQ+vxloWnA3oP2U8XC5z8Gj1gvyT+fM0YVIz/P9b+Xp4KuoPwFmcHtgmMMNYDxGHk1SP9WL0tixsAYc7BPBZC2wUeRLdRr9T/uKCVa2eqfkH8fh3osq3V07bK/01GnT0eldO5RsOFIy4KRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=UlE42Hgz; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="UlE42Hgz"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 0720A80B9C;
	Fri, 18 Sep 2026 08:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=k1; bh=7MfcdwDxh3cDiwKEkSu5YY
	rlzCl9yn4prymPCDTkxrk=; b=UlE42Hgz0pC4UDB7wDoAGjfV9RkSyOE0ExvvcI
	xMwNHHtQIBLKp/qIrZ/MzcX+6dKxBdFNagFKIfNwWWy7jgwn+ZMsXYlIkFWYSTWD
	b207sWe6ovS6Y9DeASkrf/bG2u31cE6f+Ggz4rWm+CITBX4YTQc0qgZ141ovLcqF
	Ve9z/5tld/OfpwGOgFHRMgR15zsu7/1f6QlxbTT0c3EL5bVHmqPc/ylwWsYgyg2z
	7sDZCj3oEYEJKKB2ItDty+5xS8H7VZ0ewA2VtzqWvEGtOknmDMAKT5cLep/Ly9+p
	QtFFBPUfbmNiXmNZuRZppuF9NTaLBXvBOgl4HTyXpzd025Dw==
Message-ID: <05a12842-f121-4ee9-98ff-459a1e1a628e@sysgo.com>
Date: Fri, 18 Sep 2026 09:27:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <aqvzHtWzLZBFY5wk@tlindgre-MOBL1>
Content-Language: en-US, de-DE
From: David Engraf <david.engraf@sysgo.com>
In-Reply-To: <aqvzHtWzLZBFY5wk@tlindgre-MOBL1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.26 17:03 wrote Tony Lindgren:
> On Thu, Sep 17, 2026 at 09:05:51AM +0300, David Engraf wrote:
>> This fixes a regression when a console option includes ':'. Commit
>> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
>> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
>> colon. If the colon is part of an option the name is handled as devname
>> instead of ttyname.
> 
> Just curious, which console did you hit this issue with?

It's a self-developed console driver to access our hypervisor.

> In any case, thanks for updating the comments:
> 
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

Thanks
- David



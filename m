Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8C31715D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971533; cv=none; b=o5EdipOMOeHzrQ0/jM5dRGB5Nw69LnxUJFr/WubEJgTwcRLOey9bRF9hLWr100dxEYx/y+FHKDBopzTWwcpHVAG16Rk/seiGfK/Pc8Zp7lWOIEQp7w+PWpStwEJAin+qtW0sFWnviFOOfNBHRxek9tjBMymwRiFiuWuDHTm3FY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971533; c=relaxed/simple;
	bh=9bHTRxvTxliUMkAVfDtoCAGjw45HT3dQjJzr0e5EuYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrtvL7tM0CB9DpBBa9AsLi+w4swTfT+xmGL7f9wyAQbEZ9O8mq2QDw1rSckUV8UR5/GNR4pGd3Ncv6dkuhZC3I2VNiCpoRxGwMGa5jZOz+HuZ/g2KaQgVqFGbb4Qctsyo/+/YvCGBU7oROYioxS30Ae8V7azewuqga9QHWPQJhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=aIMOPM5Z; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="aIMOPM5Z"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 117F88131F;
	Mon, 21 Sep 2026 08:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=k1; bh=sGPdXSBg0QG5q8LAPQSJIk
	TZzHajgtYQSH8DTrKkyUo=; b=aIMOPM5ZG99cr/Ls2QjCcH3PSpkyZcSsmZ5rnT
	ePWtqjGHLqAbqx+/NjggKCf+NrcX8RCFufEDMbqG2ESB5XFuA3iqeuurUCUj1JSg
	9G1O1uqo2j2qVAJMSgFWmoyzQMXBSRljLL4qdzAESqImp8a5lc9i/49kRpcJc6T6
	2kbl5NJeY042hf3BTOlONQKhBlID9hmU9EnQw6ZrmO0aUsuJ9RIxfegL55sPs5Nk
	mmnvHOIA2voX6+mVi1isHNTlNhUkR3IiP12WJBPFQxl/VIvqLJcwbJplYkSWWgXR
	to2/yyucPB+nvsC+Hfo9VUXqe4Nf2TLGmCfLSAIB4zVLdEFw==
Message-ID: <ab053f49-ceec-4870-a97d-fb2f6b4828f4@sysgo.com>
Date: Mon, 21 Sep 2026 09:18:41 +0300
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
 <05a12842-f121-4ee9-98ff-459a1e1a628e@sysgo.com>
 <arC-AESD17-UYVCM@tlindgre-MOBL1>
Content-Language: en-US, de-DE
From: David Engraf <david.engraf@sysgo.com>
In-Reply-To: <arC-AESD17-UYVCM@tlindgre-MOBL1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.09.26 08:17 wrote Tony Lindgren:
> On Fri, Sep 18, 2026 at 09:27:03AM +0300, David Engraf wrote:
>> On 17.09.26 17:03 wrote Tony Lindgren:
>>> On Thu, Sep 17, 2026 at 09:05:51AM +0300, David Engraf wrote:
>>>> This fixes a regression when a console option includes ':'. Commit
>>>> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
>>>> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
>>>> colon. If the colon is part of an option the name is handled as devname
>>>> instead of ttyname.
>>>
>>> Just curious, which console did you hit this issue with?
>>
>> It's a self-developed console driver to access our hypervisor.
> 
> OK thanks. From a "fix or feature" point of view, I wonder if this issue
> can happen with some of the current Linux console drivers too?

AFAIK there is no restriction using ':' in the console options even if I 
don't know any in-kernel driver using it. That's why I would say it's a 
bug fix.

Best regards
- David



Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3669377EBF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171790; cv=none; b=Nyind4xuTt1wKqvagNPuH7DeLNFHaV5oGNX3EsO1I9ynPU5c20yBDtR+U1O6V2GSTK08p8gFQzAxz6ly4hHdXAM3j7nJeAFRcoc7OSFUiacn9I3t5qWbeEhE/UGuiLP59RJIBY2hbks5hAXvamDuGe06RuTUpZCLYNUPex9EoWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171790; c=relaxed/simple;
	bh=sDjoU8rJM/Of9jet53pz+B1Jc6uO/I7gjVDM/44Dr6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jP2evUmZeSd8u/GslSiCKewZmRQ1s1dgnQ9hkduPOu/VmPCnxn4r58oJAS3txpY32yZnGB9q1HDloYFs3afJRtOfOmEupX5kTI3mKrE5jFxomDyRbGtlftezCWWV067bbUDnX3YnAyNh9C3YI8g/NXCwBQCaQyujQq5vZ2BUzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=Yr1ZMeR7; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="Yr1ZMeR7"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id C9AC781354;
	Wed, 23 Sep 2026 15:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=k1; bh=t3PKFjVC6I3WnNDIwfn8EE
	+A9whZo9GX4GF4cSIjgcA=; b=Yr1ZMeR7TS6ZvxXi31ov/rA7clk1OCoBxOBDPB
	6zCE3DHSx8KozI6jXsQe7Wi9TTUC1AtlTbzVX9PEdXRisYuYXduLJTcrzSXe/xLI
	k4cguxpLrTIpGeHIi5tM6RXU465/tmFV4eYUI6sUWLQQxoj3G2lh4hWSzX9Qj9ei
	MWgt8EX5inALu4ddoTlE+z3gDDIcxs+NRsotkhNK1Fkex0kxSuUvwW5+65K2hdec
	XPzTmz8D0l4VBFd6vo8HNoEpgFGA4dscLHRIJ8RZyVUn3kKUU4VW9yHO5vkpo21p
	TUIM2baKsCjD7FMS/7KpkUOekM1QGuQairWrshIOJ2P93XZQ==
Message-ID: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
Date: Wed, 23 Sep 2026 16:56:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
To: Tony Lindgren <tony.lindgren@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 linux-kernel@vger.kernel.org
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <arOdv1HHPWzXgW7h@pathway.suse.cz> <arOnowDZHimj_86C@tlindgre-MOBL1>
 <arPAwpfKLSv8ZwpY@pathway.suse.cz> <arPCw7eyRYYsveTy@tlindgre-MOBL1>
Content-Language: en-US, de-DE
From: David Engraf <david.engraf@sysgo.com>
In-Reply-To: <arPCw7eyRYYsveTy@tlindgre-MOBL1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.26 15:14 wrote Tony Lindgren:
> On Wed, Sep 23, 2026 at 02:06:26PM +0200, Petr Mladek wrote:
>> On Wed 2026-09-23 13:19:15, Tony Lindgren wrote:
>>> Nice, you could now initialize idx = -1 to start with to leave out the
>>> else for setting devname idx?
>>
>> I would personally prefer to keep the else part because it makes it
>> clear how the "devname" variant is handled. But I could live without
>> it as well.
> 
> OK thanks, that works just fine for me.

Thanks for the review. I'm going to prepare v3 including Petr's changes.

Best regards
- David



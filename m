Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213CF9C0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058257; cv=none; b=tpcztYRju7XTP3eCKw+4jTPQbBi8HdMe7P8NujsZH4+pgknSve+u97G0u+FCFBzhMEUHzAqDRBYPgJLCbINcj8Y5nUzg3esbOG7Th/VZaOL9OaBsx76WcykXh81i34vWdm/xKXgtWBvqDz5sqYuLs86tCPyslfOXQqu0YmIAv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058257; c=relaxed/simple;
	bh=X4nxifD4XUHq1BKvjEXSQCHM0bDL1a7IaCs/n/9tm+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gHR2lXg61Ea/6A8HslUistyh8r9W5H+hLt1LejMhqRPAVG0oA69P4KTPh261LI3ouOClXBtmz+GxDEsPwWFt8EXTz9TkunElxwxypd1uylqhMKecDAS/dO6cd4WyKlrRm1dhKhgs9wZgHlN+zIt+tRGIKoDG1yxTcKbHnZiXjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ugZX28XZ; arc=none smtp.client-ip=91.218.175.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ugZX28XZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X4nxifD4XUHq1BKvjEXSQCHM0bDL1a7IaCs/n/9tm+k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791058252; v=1; x=1791663052;
 b=ugZX28XZdjrD+11DUtJzRmcjR+J+D59CqMlQs7r2zxlS5wVmkPo11t26QHUKhJyrr9ndZ2nY
 nU15ZpRteWBDBMHp10pAZ+gYTFpDuukq8lpirEPTGWuv3vuAylczeGw+3xlchS3p3yOBaBndXeQ
 5Owtz2zT5vgtpt6OcePeM97s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7736264c25658130;
	Sat, 03 Oct 2026 20:10:42 +0000
X-Mizu-Trace-ID: 7736264c25658130
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Alison Schofield <alison.schofield@intel.com>
Cc: sashiko <sashiko@lists.linux.dev>,  LKML <linux-kernel@vger.kernel.org>,
  Chris Mason <mason@kernel.org>,  Kees Cook <kees@kernel.org>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
In-Reply-To: <asA_b1s4iVx2_v-U@aschofie-mobl2.lan> (Alison Schofield's message
	of "Fri, 2 Oct 2026 16:34:07 -0700")
References: <7ia4se37qwvk.fsf@castle.c.googlers.com>
	<asA_b1s4iVx2_v-U@aschofie-mobl2.lan>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 03 Oct 2026 20:10:37 +0000
Message-ID: <7ia4jynyzgsi.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alison Schofield <alison.schofield@intel.com> writes:

> On Thu, Sep 17, 2026 at 11:30:23PM +0000, Roman Gushchin wrote:
>> Hello,
>> 
>> as some of you might notice, a couple of days ago sashiko stopped to
>> report preexisting bugs together with not-yet-introduced new issues.
>> Instead, it started putting them into the database. All M: and R: in the
>> current MAINTAINERS file have full access to corresponding bugs.
>> 
>> There is a new "Bugs" button in the top right corner which is the access
>> to the database. You don't need to create an account, invent a password,
>> etc. It's all stateless.
>
> Hi Roman,
>
> The access is not working for me for my linux-cxl and nvdimm.
> I ask it to send the email link and nothing happens.
>
> Anything else needed here?
>

Hi Alison,

not really. There was a temporary outage with the email delivery,
which I'm about to fix. Please, try again.

Thanks

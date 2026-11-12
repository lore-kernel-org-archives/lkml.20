Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474782;
	b=xjL7UqFrYvicpWyb3Db3TfNujZgYMIdMjvo83x8nN+Uyc3rc2aMoZ/cK120yaKRUn60s
	 dM8yzrSe52QcuFW//+TFmbyrsMuFL7o8CgvQEXuZ1ljhEmdM+J+4QNU5KfuecTYOLZBEt
	 EyQepph+L0jNCW6ypZT9t90loCEaFldn8hQgxQ50m3ggdyiQjiE0UKL4w6ebQmK0zGOeb
	 gyoJgwGqv+UYxKSWFeFoXKHSaIpIK0pjanDZCg03EV8JklaSw7/zk3S0vnYcEVxVqAqt9
	 6aiOy7c24IzG8XrTHIt3Wm2fKjdTRBIWPvIizixa5GZLisT7Rl3b6Y6pISVWz8G68vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474782;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ft2tBQ+0c2FdUlVmrJHX4BXC0U6144CNBjfBz2Vuq04=;
	b=o8LXN+4gfyoXDGuwjUes+29W8mbg6kPcRgDvTYSIeuSKcLuJhggjV+LbgGu/FI/7DN6S
	 SoKv6fbIoCcpEChKUbWL8I+C7qG/fVrgqp7J6HjknRLvAVvCqaZ9+6GawyHGN8kQmL6yW
	 gHsMEnZyjMTM9xK4LtJabiso7ARZAQ8tCpm/Fvo0atHSH5Ibuw1dPhjrp8smeosNqy0os
	 q19LhLLS9h0RQXru8sPqRKqASc+NKcHCvZcaIquttAeWZsvojqwizLEKAawgtPpvxu0WB
	 6mZJffwKpsUolgP8obVcEU/aEtDQmL5sjI70aYS5OvY8cVPexaAyoutAB36CxysvpOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LIOWiixC;
	arc=none smtp.remote-ip=91.218.175.173
Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DAA606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DAA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LIOWiixC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=++shdLX4b8cAwUm0fcKeSGv4KLpX5SD1g9rB8e8HSkg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794474780; v=1; x=1795079580;
 b=LIOWiixCgrZdIUTyS88m4+8HSif2r3pj4jR0HQo/1euwOSbo29uOA3r792wz9wGPhyVpM5un
 neN1APLEauzpMhRGM3OfZcy8DTe4P/X6gGGM+tKsAX2pi5od72K6zh7x/e292E0cJGEkTpYXniZ
 4Nb3hPQvRP8S/lYRbBvNqmdM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 684e379d45c249fa;
	Thu, 12 Nov 2026 09:12:59 +0000
X-Mizu-Trace-ID: 684e379d45c249fa
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 09:12:53 +0000
From: Akhilesh Patil <akhilesh.patil@linux.dev>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, crofts@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	akhileshpatilvnit@gmail.com, akhilesh@ee.iitb.ac.in
Subject: Re: [PATCH v3] MAINTAINERS: Update Akhilesh Patil Email address
Message-ID: <20261112091253.GA3634242@u5ce4748bae3b54.ant.amazon.com>
References: <20261110052942.GA2505113@u5ce4748bae3b54.ant.amazon.com>
 <avLr27SlZWwFnpYY@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avLr27SlZWwFnpYY@ashevche-desk.local>

On Tue, Nov 10, 2026 at 12:03:07PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 05:29:42AM +0000, Akhilesh Patil wrote:
> > Move to my new linux.dev email address akhilesh.patil@linux.dev
> > I plan to use this email for kernel development going forward.
> > Also update email address in few yaml and driver source files.
> > 
> > Signed-off-by: Akhilesh Patil <akhilesh.patil@linux.dev>
> > ---
> 
> > Link to v2: 
> > https://lore.kernel.org/all/20261109104443.GA531570@u5ce4748bae3b54.ant.amazon.com/ 
> 
> And where is changelog?

ok. Added entire changelog v2->v4 in version 4. 

Regards,
Akhilesh

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

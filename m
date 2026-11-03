Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722536;
	b=zYJVWvMv3sVId9VxXy+heEpKoAdcIaWWO71Bm0p+YdEAI62j7dXWw5Fu6kkv8JbPl05p
	 zMxNy03652+Qr04fwboHrhnwInDfxDzrInEWqEknhJsPeahjWFIXnlCOPpoGNCuoWeo3g
	 e2+1pdHqSvYXX/j4J2nwAC0Xayl/lWovb2xZicktVRjcDb3hT6fV/Gubu+9/jk5m0vDMz
	 v2OGYIdtMna4HuMIwn0k6dZkBU3YvNUygPfC4QJl+5PvUkZECG05Gkwhri75nlQc3Q+H2
	 BMYoWWRJpQXzkzEVUrnXiKpgMd9aOn2kb+qcKVNhnDfZuh4syrbAE6CRLFYPDIP//dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722536;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8kozB6iibvd6vhek2BioORT7yyB4oaGs99orgd/IW4M=;
	b=kEmM+77BmzDwG//LYsySZ7e32ilTOoM4nZwb0SlDazA5TQgq7xo9CXvKCi/eeZFoFpHv
	 cD66sZsCnD1TO8kSJzOHyYJ0HYnLru9OOHhBEhYVjuUAr2Uo8w9Kc6ojVRlVm2bOri5qH
	 JRjMiBkzt0yAD8Y7QVkgiakh9pYHuHYVh6jwrW4n9+Y3Kmbc3nFPMU4OjfRK3CHTky7Nh
	 XmSZl9/d9n9VB1M+Ddp1j60yVSaHTUBIb2/n83CwWk9K8OSLUOWYW9rh5nageaJVo5AUy
	 e5g5++e7lvnnvtZ9t6fKd/qb4/bKa0LvyzN5VKAJ+ZPM1VljUiGBDAi6syms/ZXcw7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=e6tKkOS0;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64F606D835
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA64F606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=e6tKkOS0
Date: Tue, 3 Nov 2026 17:15:28 +0100
X-Lima-ML-UUID: 679b76d9-915f-4cd3-99df-b2e53f6cf96b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793722532;
	bh=KQtvUYqOwLZd5uCo5462X/CnoM3Ap3jbUDTXdiBqhgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e6tKkOS0wrr9oqh1VYZAHOoOy3jLOA1E6c0ZRrQQPnacpg7INLttwDBXV6uus2bvA
	 91wel74rCzaZSin6RHp45gXgDpNO9zOl38kmM08d4Md6dJj+SJdfXZhfCPTK5BezW4
	 puH8QXyUookVOwFduNdENebIxpQV/Q3XdHiD4vGfynlXh5cDx4GRS6T6AXvpLwX5i3
	 /cb0Yk5moE8Y26tdqeacZaO217t4bgIFFsxAwThkSiGEXaMGMNMYXLqHg5c86lrG+v
	 HgD8W+xW71IV43SRxhVMTv4oT8HJok3rto8xLK1veFaFeNtuM2ujrFhSVz8ShP5KqP
	 w6FIXnLzwbQOA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ed Schofield <ed@aicharmers.com>, amd-gfx@lists.freedesktop.org, Kenneth
 Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi
 GPUs
Message-ID: <20261103171528.6c6a0edf@kait2en-mbp15-1>
In-Reply-To: <CADnq5_NDJ7V=TQLOJ37msbmhwsVG+70mPKU3ns+xmAu9jxWwcg@mail.gmail.com>
References: <20260916144014.879355-1-ed@aicharmers.com>
	<CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
	<20261030123000.5573e70f@kait2en-mbp15-1>
	<CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
	<20261103162512.2ec834ac@kait2en-mbp15-1>
	<CADnq5_NDJ7V=TQLOJ37msbmhwsVG+70mPKU3ns+xmAu9jxWwcg@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 10:53:56 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> I forgot to remove the pptable check.  Can you try a simplified
> version of the patch?  I think all you need to do is delay the UCLK
> DPM enablement until late_init.  Something like the attached patch.
Alex, as I told you earlier.  I don't own a 16,1. I developed the patch
I submitted. It took me months to figure out while debugging via ssh.
Currently a community of nearly 6000 people are happily using it.
I dont understand your fixation towards a patch that fixes nothing. I
dont understand why you write patches based on obvious slop without even
being able to test. And I dont see why I should help you with it. There
is simply no point in it. 

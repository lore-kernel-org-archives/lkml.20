Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111733;
	b=FwpxGGLNqyFsR1uqT9MNwKaeR52k6ZuG5XtFNydW5ZggegqVXSXgc+Ckgm7n3RaBtOvA
	 eC8rzdt5hJ4Yc6NUSsm9SkEQND4iEQ8yt1vBgt/40QBRR5nXQ/glreH5Wk0TlWeNDT3lD
	 pOUq2XEu+s89qQJhSXQ37ODDKwVjgE3lP85DCD154ABXGc9OyrGyltMIupKaRV+z7JDU9
	 QvshFDIewviRq24F/FIbQhnMF4Lpgj0BhsGrDYVopqbkMWkT+xKPQO5S8c3p0zNPlJrGV
	 gS4MsTVJ/cC3Ar2h4g1qwxSkCvKyzb/bvxdTHAOI/94h+INdS2pgEskq7ChxS+2UMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111733;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Virus-Status:
	 X-Anti-Virus-Server;
	bh=/+EZTN8/RL3FnKUS4CqJCvmXjDAScPkKMIBuJc2FtX4=;
	b=hMJVmKiBztp5zlAzR/2/M81gdnN+qcfV8o7n9QkYLZcUODM3MKgfEWzV7EVHOvDpVglv
	 Bna7BhzgzEJaKBCMCTD0n/3gOwj5GY8299i8S6PAEV3k5LugJFapP9o7biitmytVcxUTl
	 KRA2EiGqetCydTa1UaFDiOhUQmDFS/XRmI8DHCJvz07iZUhjP/tye1rAT6SMLO6TKqpg2
	 eb2/oG8+A/6XlBwzjHt/c16h9oPzQnQNTpIF5bS5jc/cnrpSBDWacYC3UfhZPnk515iRJ
	 DsG6VeMQHNzveV/e7IQMlqdGfG17rDZyvfH2m5Da5ZeVwrmqUZYSq26O4GVLVdH/EgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69REZUvj019762;
	Tue, 27 Oct 2026 23:35:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69REZUoe019759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 27 Oct 2026 23:35:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <732e1fa7-70a0-4abf-8862-3c8913238bf0@I-love.SAKURA.ne.jp>
Date: Tue, 27 Oct 2026 23:35:29 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.2] can: j1939: fix j1939_ecu refcount leak
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Robin van der Gracht <robin@protonic.nl>,
        Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7df4f6c6-b53f-42d6-9725-e60b763d01f6@I-love.SAKURA.ne.jp>
 <3958917c-1484-41e8-8d62-99575edbf980@I-love.SAKURA.ne.jp>
 <20261027033104.76618-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20261027033104.76618-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav212.rs.sakura.ne.jp

On 2026/10/27 12:31, Karl Mehltretter wrote:
> This is based on source review with AI assistance. I have not reproduced
> the unregister hang at runtime.
> 
> Could teardown use a lookup that permits NETREG_UNREGISTERING and a dead
> rx_kref, while retaining the nonzero ecu->kref check? The registration
> and receive-lifetime restrictions are needed when acquiring new users,
> but cleanup must still find the ECU whose reference it owns.
> 
> The ecu->kref check remains necessary because zero-reference entries stay on
> the list until the RCU callback removes them.

Thank you. Sashiko has the same opinion
( https://sashiko.dev/#/patchset/3958917c-1484-41e8-8d62-99575edbf980%40I-love.SAKURA.ne.jp )
and I followed it in the v4 patch.

Sashiko thinks the v4 patch is OK
( https://sashiko.dev/#/patchset/4b2c8d95-d17e-4f36-a340-abf84693d24a%40I-love.SAKURA.ne.jp ).
It is time to check using multiple models via the review bot.

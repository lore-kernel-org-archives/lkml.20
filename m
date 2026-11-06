Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948641;
	b=kSpUJZXWMN/pGkbozEQ41joWO4JVTrdTEPfESkbEA6yzYhdkeEGhm3NGalbDoy+x7OQc
	 Q50zE4iBw0uSRhuyvyN3EyOAhv2wnf6vcce5DWMIlNxMzaAHYJ2Nw0MWGwphZRB/Ixv3E
	 ewOD/Wo5gWZ7Y18Fywh3hbs8Vplo0WQbobq6wxx+VpFymKSQKlblWIyLox1HI6gV6zRc2
	 iSDgxCp9Kl6138K6pxdXNie0zU+Njh7N334wi6adtuiHtgXm9ajzU+2szwMUWrka3fLlY
	 K73xv3pm0vcmqZ7ejSEweNMo+E2eHuCirkggYH5KpzjhlwqPl7rpuiVFz2dSEv0Skrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948641;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xGUu4K6Hch737xk2AjXhVoXP8Oyq8YcHuX/+uNS+IWo=;
	b=UKludR9z10zt+G2Jx5X4fjxYz9aQDub5a0IP4kx3BMdevAhMBfkLQ2qeHYC4I7Hq24+d
	 M/TSOGj4a4NXOfghgI7bzRQTvaYsL+laUobhbQ1oLy51iYEyWh1/bblE7aS3LdMGPS0O4
	 MSHm/K59brKAIIkO7rm6cqYkjG+SWNKEQj4Zl8D6kLU4EzWcwoFdIAmd9rabnNzIaD3F7
	 0r0wLCabg6qPENXfcQqUhk2b9h0RALeqSX9J+cxR+KWSAu50++Cfh8PG1ONjxpUTEPZqu
	 mgT6WIjRqi2tOT3oW1v3nHmtNrwLwhP1fUmUn8+lMSzgPXneYaJZZlIO9lEhA9V5fwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WQEpqa+x;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B0C606D812
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B0C606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WQEpqa+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WQEpqa+x8PBVgdfNxTxarECdINI6l66IdnQ/D3kbeAoZKGAMV1tdU0saC6Rh3FyWNY1eqOf1YXKNa
	 hJdCdzqQLc2M7dty7K6cf2jvGeEpqX0wWHka5sAYzyyTDZYiVQQyV5kAIlOwJgqp31cI4+23C/rWox
	 xbecbow8hfLTfjCI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46aed7bddfe1-4db39;
	Fri, 06 Nov 2026 15:03:57 +0800 (CST)
X-RM-TRANSID:2ee46aed7bddfe1-4db39
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from cmss.chinamobile.com (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86aed7bdbeb1-1606d;
	Fri, 06 Nov 2026 15:03:57 +0800 (CST)
X-RM-TRANSID:2ee86aed7bdbeb1-1606d
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Andrew Stellman <astellman@stellman-greene.com>, Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, Maurizio Lombardi <mlombard@redhat.com>, Mohamed Khalfella <mkhalfella@purestorage.com>, Nitesh Shetty <nj.shetty@samsung.com>, Hannes Reinecke <hare@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Aurelien Aptel <aaptel@nvidia.com>, Nilay Shroff <nilay@linux.ibm.com>, Jesse Taube <jtaubepe@redhat.com>, Rongzheng Wang <testwrzwrz@gmail.com>, Kees Cook <kees@kernel.org>, Rosen Penev <rosenp@gmail.com>, Guixin Liu <kanie@linux.alibaba.com>, Qing Zhang <diasyzhang@tencent.com>, Eric Biggers <ebiggers@kernel.org>, Julian Sun <sunjunchao@bytedance.com>, Yu Zhang <yuz08559@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: clamp the last ANA group index against the real array size
Date: Fri, 06 Nov 2026 15:03:55 +0800
Message-ID: <20261106-nvmet-ana-grpid-followup-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
References: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
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
Content-Transfer-Encoding: 8bit

I missed that this was already reported: Andrew posted the same two-line
change on 2026-09-10

  https://lore.kernel.org/linux-nvme/20260910154849.66095-1-astellman@stellman-greene.com/

and Sagi asked in that thread whether it had been tested.  That patch
reasons the same way, and it also cites the spec wording for a valid ANA
group identifier (non-zero and <= ANAGRPMAX), which mine should have
quoted as well.

What I can add is the evidence that was asked for.  On
7.3.0-next-20261027, with two kernels built from the same tree that
differ only in these two lines and no instrumentation, the nvme-loop
transport shows: a group created as ports/1/ana_groups/128 is
absent from the ANA log page before the patch (ngrps=1) and present
after it (ngrps=2); 128 written to a namespace ana_grpid reads back as 0
before the patch and as 128 after it, with the namespace accounted to
group 128; and removing the group again adds a phantom group 128 (state
inaccessible, 0 namespaces) to the ANA log page only in the unpatched
kernel.  The exact steps are in the --- section of my patch.

Andrew's patch is against a September tree and no longer applies, which
is why I sent a rebased version.  If you would rather take his original,
I have no objection.




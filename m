Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257792;
	b=XKSfgMHgGYTLjflxKpBgywBUAs84ke8vlHg2lx36CHwij36S/gau1v/uls8DvGmQ51fO
	 7dRgvxtU/SdHilkhr16uPNXT37IkiFP/NfqTEYpErWLAZimB66JGwT9gjjuSYLkR2jJ5z
	 0HPSFKnXp5QWuSQBmHcncXOyhrn1dRWPmkVwncHhJgPOSGdxXqn9CJ06AhKzEHXexhMfr
	 D+728ASY6869O0t3bhUACSsv6cYC+kLKfPCYc4ar1/sKTk9AjtQ4LcUJoic0yw7o47FND
	 3W74r2P1GRXio6O6QXJ9uOv+udbe4EaX70yAz03k0YRag33WJNO3IevnZXCPUYJN8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257792;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=OkNNt1DdYJ8oNEZtMuUEt211HeokbzbkjBqm4BwFhvU=;
	b=v9rbuERyEHGDz5TXVNAwxhEjILs0B/B+txRg0NQrbw4bXtu0bz87XKngXMze0LhEJbnH
	 j2zc9hTQzG70/X8j97OdDJy8+ZaiGHifoap8F8fAF856TUOk3SeF0JonB4trzOOiXEzdu
	 IgKAT1Dw5HegHsduFVnmkfrivUgOQoqpItz8s7rBA5uvpWotVZlJcR1sPnFaoLv3uYxGm
	 V9G9jCFTWl5jVPchC+GAD7ivL7Q45aXHtiFCHkwEp+6xcpB9Ozl02lkhpMC8yOTkxz1rB
	 G1/St1xqfdcKHVXrp4yt421uez3Cdskdrq4kW6VghIOVIWlGEVKpDBJ/Ho5JlG2V2SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.72
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85018606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85018606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-7026e2e80f0so2045761eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257791; x=1793862591;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OkNNt1DdYJ8oNEZtMuUEt211HeokbzbkjBqm4BwFhvU=;
        b=SutiKJo2NReRJwLCEhg5jUWbZUJ8kY2adNf5bGH60tVt17i+E1qdEbmzzw+eOubue0
         xlxt/5ehBw614nvxd9wTGaqJJv/NTalqOsfMA+uW73bw1j2hgK2ZNuQL0jTIEqrD6Fkz
         xd+NtktvIcGDdjs3n15PjYrsna7T+QqDchDBcPcG2iksNdlLVOUoLFWI3hnx8WrsKKuW
         lYw0ejwFjzGoBEyqAckUpUCqtPVmHdXpZ/yk+1K8qzm2oxBpMwemyawkhUknJ797WX6N
         8uw8LSBkFSmf6DiORfHWrXZ/l4c+yv/aq3CYCVbMTfceheN3sxOsGjitDHO4439owO2m
         eIEQ==
X-Gm-Message-State: AFq9FYLoV1QpS8mFr1VonerjlJ6qiNAJK29bAPFQUp59sz2cSPi9ao3f
	CmcCKPzpdJbw+x0ars/VIptBCvLZPwcFP22tRAySeH9V0i1IeEiw9I0toO2/jLp+3p0vfc6Gmne
	ERKaTPyzskY8l0Xeijv+ZIgL5CDn+BwfuWSNG2Ev+wbSGjmKzanGX5L00Bmo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8595:10b0:6b7:8415:d790 with SMTP id
 006d021491bc7-713ef240ba4mr1912096eaf.59.1793257791566; Thu, 29 Oct 2026
 00:09:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:09:51 -0700
In-Reply-To: <6ae27ca7.5451848c.f7707.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2f13f.5451848c.f7707.0006.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [mm?] BUG: Bad page state in hugetlb_no_page
From: syzbot <syzbot+d06e9fe6d6a7b537fe49@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [mm?] BUG: Bad page state in hugetlb_no_page
Author: jm5905938@gmail.com

#syz fix: mm/hugetlb: fix use-after-free of a new anon folio

Resending the fix association directly to syzbot, as my previous
reply was sent only to the mailing list.

I verified this fix against the syzbot reproducer: the unpatched
kernel reproduced the issue in 18/20 runs, while the patched kernel
reproduced it in 0/10 runs.

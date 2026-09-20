Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF413D886
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895057; cv=pass; b=JFsGUum8+aQ/E402PXyOp+ZHz8b0yoCeQtaGefWxNAO9Ne8pJmKUuiQo1AwgQDUYvUg+coLjGv0UGoyuZhigbuGmhKNCEnk28DFIrzjyASOWPCoOQwb9TYDwwKBfGDEy0BQHmzZNoo9qNsFl005yTMZl6FJZEIS8921IYkG5RIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895057; c=relaxed/simple;
	bh=7h7iCtawWBW6zeTXUkzWrN3kEodFol+KDSp3ePBJEV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECZwo51pRn0YZvn6zUxOYl3iWVoRENMgy5LFae9ZykUGQoLAFnX0f3wwblm2dpHacb6i4sOuoGKtV4MJKQriJtvJjX2smbLYCciJGHqgEK0tGAS6shYAg1T7ktSsXn4faLEheoW2m26J5Y2YvBfQgTKxKNBBYpnuxDYfF7KW4K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=MibyOmlW; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="MibyOmlW"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso15852551fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789895053; cv=none;
        d=google.com; s=arc-20260327;
        b=p5f8agzhhhurkHTz2ebYK7KqQ4/rQs+LEoJkXp/xgCyS07WrZ4C9DwKut2rutNsVjw
         ZHISjJvMC1UceQQFfHxVyFlKexkFpDNWfWD8jUU/SWSP2t/V/1I5vOBGIwvzzyHbuO+o
         dcZXhGTprikrlDfmaMLeZ0BZ39a7I7z6m6yyW7VmI7vz7VtNSbIAZK1CFES0/SY4UT4K
         nW8DiwvshVewDoNhBlpUWIYVbd7/NbMRD+GjHnXu4Ri2jh6Oq5WmXag6uzXtOwjfoxeH
         1NAIsvLnSWh7iZjyC1YycH1mXYsEFGIpCrZ7TX6mnLizVWPIB/SvCaQV8+5dsUs2ZFE0
         xSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7h7iCtawWBW6zeTXUkzWrN3kEodFol+KDSp3ePBJEV8=;
        fh=G2goWyMwgR9v6gZ+y/niWRDy6fOnzJm8f3p5guAi3yc=;
        b=ozQViGCDfSZTDgwT5u1IIGOQHrbBFfCgeCMqjzs/Mw0+XLt0oAVH2eBKkxO7hGEvn/
         NaGBtd4Oy+f7DwhupDmXSiSoa2GZnojDCmZX6QBD5e+JOM5yPQeGsO1sH5p8qja0qvIm
         j94XREqkP3Yc63rUaDmxpXnXFzRqKSf0L5O9dPbAlHWlPrYHf+V1gpR9O4yUi3Hx/x6v
         KcQNh5+MbMPnr+Tu+yO8xZF4T6CjbBQXQpQNjEVZHLegGtBVju7IwvHaFHqR7+Z32PJx
         b8id08Sx+C4bmgwDt1pu4EbYgeh3gSHNnJvP0y00cVxqH83Q5tcOZQkJPCHUugybHcY5
         hinQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789895053; x=1790499853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h7iCtawWBW6zeTXUkzWrN3kEodFol+KDSp3ePBJEV8=;
        b=MibyOmlWKcMM4R37MV0Pv+wS9ERkOK6+NkFUyiXCE73xLHzEqFJBxC4ui/nDGytElB
         G3LXD9Y7hGXOmV9u2h8j85vqJHRiGhT0vgUGvMWGqUoMTrvRbvWUWYC/6nxb8QTZpEf3
         u+YIsZxZjzMqFgohsv6qbz64V4L0dSKcel9x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895053; x=1790499853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7h7iCtawWBW6zeTXUkzWrN3kEodFol+KDSp3ePBJEV8=;
        b=oENhMNp7+1v69YTHGaGoeRwBlAzgQvfeiM/wV/o0/M7NhCjsErUw6NIxiHNRNcBSnb
         fIoomK9Py5ESKpUkhl462h9xNJQcIapPkA4fCzT1F9mdGptkcmJNZXKr/tf/ZBrUcoKi
         nGo498fnrPERX/mXB98ILjvHfIye2KueNS37RzKYQ/Viky84VHqi6gfok5LmUGko6Kjo
         2Z+YbkyO8M02Wz2pK5zka6aiz3+2t6XJqAkaJp+Bamq1PCbKqnbLkcue8CMUOTH1SN/T
         9x7eIbI89EUfha6vTCXHdahopXx0f0s7hLRNjNcyQLpg6CNFSrsUwHP+PIB2aJtqvjt2
         aiYg==
X-Forwarded-Encrypted: i=1; AKwUvByVQ1JeCVK0y2S8qxvr4mPDM5qlQ1ZKm1XsNtb4Vu8w3bsDl7AcixM29at/dXj58eakSPzTgKTznLxyFoo=@vger.kernel.org
X-Gm-Message-State: AFuF++k4KygmPw9mWuzZ2+Kt7yCqorQ7nsRz2PyAZCzBmFGFmiH9A1MU
	2E0mP4f+2BNhRxCcgSdrjb8eVmpFgeViBZjQ51dF5FnFe7dq1I1dxgJfqhdWgKOtkjzCK9JGSl3
	nNDuN3PG27QSnuFRiPSzXfQcHAVn2JoFVJSQXOLjNSQ==
X-Gm-Gg: AYBFou0OE+urHMEI9FEXuULVAt9TzpbDEZlbYItQl8sqSw3gOdyiAio5kmo2v8w4+hz
	j3WMgg4+jPGzDtVTR1kz0kbI/7sGJL/kerBcgC6htqvxz7YxrWHhxIoKw9ISIbNRnbhKKsXGiPx
	ap3xC47fhb8AyLJWSPSzw62aLaR+9SuJfUUfbBmnEu+YHzvld5W7ZydNPVUgWSiKWXef4loU5s0
	wIdB2q1i4sFyzuTvXWnEC1NqS67XMu5NiWNyOC4YwvTFBecwLKpsl2Br/WokDSiBpTVrX395LBs
	qqqX1vM0D/FWIMv+bRNRYAggPmd9qqWXKoE5xAIUva1Ev1yqWcAX5qczoEZ7V+7M2OJAb7kcyf6
	HxKm+99QQ+XJB5pQ+vTTypchceTSz5pxN3A==
X-Received: by 2002:a2e:a809:0:b0:3a5:da9c:4661 with SMTP id
 38308e7fff4ca-3a5fc0ba103mr16356161fa.26.1789895053440; Sun, 20 Sep 2026
 02:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178911388614.25348.8892025153904636456.macb-resend-1@khu.ac.kr>
 <20260915083839.71546-1-pabeni@redhat.com> <CAH1Bc_yQYJ6cWyYVvfWK0pAgrXW1TMkpzmNxZvAXAKZJdiOqWQ@mail.gmail.com>
In-Reply-To: <CAH1Bc_yQYJ6cWyYVvfWK0pAgrXW1TMkpzmNxZvAXAKZJdiOqWQ@mail.gmail.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Sun, 20 Sep 2026 18:04:01 +0900
X-Gm-Features: AcwNN1VSKLzUoUYJ6GcIBhVxrZfglX6N1QXd5KkfLl4b4ZnArqwwx8LlaDHcB7M
Message-ID: <CAH1Bc_z6PFc7N6XVZ2dQEH=7D9mkXwGkXP2KKMW-Emd4zcf3fA@mail.gmail.com>
Subject: Re: [PATCH net RESEND 1/2] net: macb: Preserve one-step mode on
 rejected timestamp requests
To: netdev@vger.kernel.org, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Paolo Abeni <pabeni@redhat.com>, conor.dooley@microchip.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	richardcochran@gmail.com, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Following up on my September 15 reply. I noticed that the series is
still marked "Changes Requested" in Patchwork.

This series fixes rejected timestamp requests changing the TX mode and
the two PTPv1 RX filters disabling receive timestamping. As explained in
my reply, the additional issues predate this series and are not made
worse by it. I propose keeping those fixes separate so that this series
remains focused on the two reported bugs.

Could you please reconsider the Changes Requested status in light of
that reply and continue reviewing the series as posted?

Thanks,
Wooseok

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861418;
	b=MhoNA/UwhQH2kEaDjAStp9gXFRbIwVlWrv6z6OYCNFbxAT3MNpNNDmPJchueBCdnS5nk
	 ssMkmyfvkZMyCSDanz6WVAj+o/g3Jtwr9SRehiNQpbu3nvzBuWwqveeuApm/FT3MYf5nM
	 kRBxi7tksLsjOYWv6Dsu4gJOYCxHFkwFI/RugnFOc4pGZOWhf4mtAh/nox6jhz5ufX1we
	 eCUxK5mYauln2kiVUEhGUaITBWgjlP+BHYF5fa6spse7/61sIG40yOMVTpNlxVphnYbFk
	 131tQ7BQZMjsItYM0vw7C04wBCk+InEJnfLEv09JBC1U3l7uO3s3FR4rabro7uqCnKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
	b=CtQRU5YswtK9oSZD5uMRGf5g/+C4QN7XhHndZ1RYgYa7d3KZyJMByzHtILSAM8z+Cbiu
	 UFkz0x6/SxCCz0rXz0ZOMcudOHfDqofx+SJLNZDvC2yKiK7hHK2oMs2YABdcOJD2mdL5r
	 ywbEQom/H0E8a9o9vkcQA9057M8aGrGr7xowZZa0CZCJRJJ3XsfHHNd3ySMuz7fKSZ4nG
	 j1CmUM/R7vY91n9LEEocNH6HGQ73HK45dtn+Df6Qs+Me2NRNSSox+o3vMVuhpJkewgS7U
	 mbjqIU7CW2xNU3I2Ye/3TW46S1l0n9L/FnSI/e8RaWGn4V9dpmJ/HRHDwcYtizG/Emw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="n2drT/mh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E914606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E914606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2drT/mh
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49412eb1474so1992271f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861417; cv=none;
        d=google.com; s=arc-20260327;
        b=mew4x9FCprSBKhjqImA6vD1qg+e2LpTSEJscWO1DU5ECbQHgNV/9ia0wh1oSltenk6
         cDGxMyJeBuNoyTcrANbOLi8JGo0Q4FBZl6J27eyix7d2PWt+10igsll5rjHFpfl7DdQe
         +8o7RREYXVCgjiRupUC8eJP6N7yaA3rUymuAE5pcEOFgoaH8qrBnBcddZbGTg/ZfWsRw
         2aJ4WBtAahVVsswhIVqlWXpgYKBh3clf0QCyvAslzbMAjj2xoAMC6wr9cw9h/ZXN4wsf
         lLhu1TiEca+Zdzh1eu3eBPDOZKrjZ6LyD8Y7z8KzdpqLCLFMJ4Chv7HDEWiO0TVb1Fgs
         4xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        fh=bH87Be0vNH25iXDDBsJOewEktyVit66doqDNo0RIiZg=;
        b=PVTcvVhz8PtYCOvaH9zmjrfZvMu7/iLKb4XScS8y4I9twfeUnKjhGhHWcFRpTS/7nJ
         tVdlAXmzDxnmTkBzMNDCIxRauNtgWySmWLcnZW8irSHqysFGME7TZvCMV8h4yIj6ha8j
         qf/FgVySm3mNA7/XPwDCHbavyQwekuqfwcsrJ9qXUjgqAARbNPVbTthAAJQgFnrEjntl
         e6G1bznwgVEPyoFgORRqsoWWdSHARZqC02ijLifltSTvSE4AYGBYQCTMXMjE8LNBFMBg
         fCFRTkBE+IQNpGfFYcgIo8t4g6bp2PwUWoobwtUK5jeQAFTdTxlVCafZEnQfbZvXOBEr
         T8Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861417; x=1795466217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        b=n2drT/mhhgU/2lCos8u7b+woLM0sWZOmBLQoW26YoEAOxN2e6MGx8TJKJ2dpNfQD97
         nn0EKC8O752fhDhPWOjv33kQV3jTaFO4v00NYwv77I8dOM8ikdZDAku2LmHat8yVDZvQ
         7GAj0yi5uAMNfNgtzsW1TV2eTbBxVFidisA4bBp5Q77XzIPYACgn28a1J7ZaAiTpBVvs
         K2jw7BKofCa6HnvmVlTjCOPECeIVrG3D5wwi4RyqeCW8OwtUS2Ktgct8WzTZTsxhXLoS
         aX1Jj3i4aA3HoqoUHJj+ejsV+Q2L6VPly3hHDbUSbHYQJYNH7N42pQmsSiZ5VzYHBpip
         UUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861417; x=1795466217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        b=FZ9YHBhB4PVgKycKuqOCTsE2qKCkQYvNlYWZGw2prPP5p5kg6P9xoqjmEfQGcJYg0Q
         peECtVYV0NmNKBK/naD17CAq57g5yq30HY4zOGY1MMOv3aQZb5Eo4DQsbHncufsonAUb
         nAYvJjKslmYGQUIsCEuzDcZSSpw/4v+PPPMoH7WHCvdUyPPrRq5stuaCc0CEgEpT7tR1
         OPAHeDziOYfNdp2Q8E9FeodqehILk7lfdmGzZZIKceLAPW6yAQjO+VkBW0pKEukLq4+V
         nujuJfc/yP7VJY6lvRApd9tFhBpoLiqVGy4lPSZ2+bBQOUBEYwiopLBJwJHJnGSWMndp
         Sz0Q==
X-Forwarded-Encrypted: i=1; AL+hErElA8bNugTfl2KZ+19/RhaSsOVypBDQgObnOd5PVtktDP9qOQylGS9SuKpdnK7ucb/Og/qRaBbb0//0EM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kK9siirgOHfw0LHf3cq4bI4Et/mmWQiGNG8VyaHgp4kNiS96a
	rHVpUSWgYBo33f7GzvNa1kdPeTlglFwd0u1jqg35bf6ztJ2tSCEVtWcTwmy85QsrPSWAlYpnjBA
	tCulUT09uIbiNOyKGW0RGA1d2OJCipv1QRD67UpY=
X-Gm-Gg: AZFdTZe+k7e+xsSODs2v4BISFFgKLLA47CNzXpnECbPbGz89Nj8bOfQ2x9hf15cRqqf
	8OISLml0kw6pyc3bfGz12CZ1BqJyrctG+Au/nTd3Gvf2O31PtOxhcHoV0n8rPq/qKSKcr2UBJqj
	3vmrx9VXUUmGBzXmt4/qGQMfxpNzdcL9eP4ifdFnSE5HUI5q4NYXgP1MHkLX1fq5VAY39Lv5Vaj
	9LYiSm13eAGQLFXtRDcdvcqZ9/dBUuVwisqJCgciMJ8YZYhGPdF3gm20uJ5O6yQd+kXm/yy8Yb/
	tjTVsQKjVI9iM9wSVN5WLklgtfcz8v7OwFeoDw3LbwV6vmyeuhlpKV2EUM6JQ18vxM+yTFc+p/t
	KJvzvO4NPk59ffFjLbNWiOmyLwOTmMvXNk98Kwr/AeXaYh1MLNxNi05Fx0u3NMteHOaqu5HbtuN
	5K3evNZkATJYqMaA7eY85q0fZr2F1PEFAeP5dkQpTEThjPSUITr09pw0kPNZlC2hI6A+yBn5hTl
	1VCa3QnlkC0nmrTCXYPOPE36sLpNyb7k98YykzPmf81PQ+dMi//sQ==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-49c723fc793mr23702531f8f.26.1794861416243; Mon, 16 Nov 2026
 12:36:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-4-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-4-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:36:43 -0800
X-Gm-Features: Aa3M54rY3899nRZqbPjomLbyfBxKQS4NldLCQkCR8AmmwfZuDgTEli0Ny-YYWrg
Message-ID: <CANDhNCoALeuVrkVozbRdn9f-aOLuAfBhP4pZ8eecH1Qsnd0Jww@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/8] sched/proxy: Stop the chain walk when the
 blocked_on chain is a cycle
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> find_proxy_task() follows the blocked_on chain from the donor to a task
> that can run. It holds the rq lock, with interrupts off. It has no bound
> on the number of steps.
>
> The walk relies on the chain having an end. The ww_mutex die and wound
> paths clear blocked_on for that reason. Their comments say that circular
> blocked_on relationships would not resolve otherwise. But two tasks that
> take two plain mutexes in opposite orders deadlock for good. Once both
> are on one runqueue, the walk goes around the cycle forever.
>
> Without proxy execution, such a deadlock leaves two tasks asleep, and
> the hung task detector can report them. With it, the CPU locks up with
> its rq lock held. Other CPUs would then block on that lock. In a test
> with two CPUs, the guest stopped without a message.
>
> Fix this by detecting the cycle. The walk remembers the task it met at
> its last step that is a power of two. When it meets that task again, it
> stops the donation and deactivates the donor. The donor then sleeps on
> its mutex, as without proxy execution.
>
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_pr=
oxy_task()")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)


So this looks like it duplicates the following two changes in my series:
  https://lore.kernel.org/lkml/20261023220431.1106611-6-jstultz@google.com/
  https://lore.kernel.org/lkml/20261023220431.1106611-7-jstultz@google.com/

And I've recently found there's a few other spots that we need to
bound chain walking (though I believe those additional cases are still
out of tree in the full proxy-exec series).

thanks
-john

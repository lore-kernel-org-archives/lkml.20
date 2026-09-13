Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9114E381E91
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341827; cv=none; b=m0CWk5d1DUzAWqyduHgSyXmi3Si0QiS94C/fhQMsuv3nhKvPS+WOprW7JUNju5MXvY4ebTybCn068QxpiLBWqc4bPAEhByfDmRI3dA6BlPcNcCdJC/RDHe1hqTobDpoVV321x4tBwFIre2hFXhCM8QrYCD+j1+Vw8WdwgEV3+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341827; c=relaxed/simple;
	bh=KDmy2dGCJg8//ksyxvQSffLefxVqsmhjbo7jgWJqHQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euxLeN5A9FcVvzPKH1f4SrUgd+m1EWK/gwvt5Ch55vano8OCvCIypGsqEFf/uT2rjOx9U9tFFqwv6lsG21zY5tXwjDy4op6j/3ZxPhF4C2aoF5dLfTfc42WDzRp2oj0HgrhheQ8pBHE508iX5W+anZZWgz6j0WooaUOnOroIJKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XH8J4nGh; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XH8J4nGh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so1566866a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789341823; x=1789946623; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5c33q0LYzdrtA+GLhWUplu3rdzdnxNlZRC2TPZ/RD4=;
        b=XH8J4nGhHJgK4MBJnnjCUpb57+g1XnYNWoZOsfwXC8hDa95FGvWKR+gTuYikbTcTTT
         l4U0gSYMfKl+5+Kb8YcMQcjsYvlPYnVjiptjQ1q/dYhl036ltXC7ui9tkrkhXsHak4R0
         tibHcK7csQVX3+9aU5Z0q3PdPx8sLs16iR8bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789341823; x=1789946623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5c33q0LYzdrtA+GLhWUplu3rdzdnxNlZRC2TPZ/RD4=;
        b=UOShTuo0DvRGGUT5upo0KxSrjONKYKPnqOEeOR6G8gitBE5WGIWKN2dnaoaYLTiApm
         Ac8NKOzg4pSPr/KOF6wFBAXAeV+UQ19RQFAiSTMjKbbuH7CBLXSyDcTi+MzHBH9eoaJC
         jnyi+ap/K/xF59tsoOumKHBngpOv/mzIqB5tJaS1bifvuehRhOY3bCeQJTQz9tiCthRM
         GTe6W4Uw98ScYSIaMWJ6UdYsa7JFB6drhrwPAFbE3onaY+KKHgjWzmLkg/9p/HwXFzdK
         vIPcOZTDCJ32t0iP3mtJXZ5/6j28hF3t7aQ3FPs4MDmL618NwGM9Y68W2UVXP0Dhor8l
         ioKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIvWioAtOg9VGvmcPJJvd+So4fKzV1/RhJo/giqk5mHbgvD4ek0JnkVtMEuvcKxyFSuLSkiOfAH5jBzJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kRm9bBA2KnyOFMueZ2nzok6X904S1llOTW5IaDohb1GJ+gUYFY
	ijm7B0B9HqZkUa6wAfTlGoTqJzs/SXeHDfFfYs0+oxVsyQxKe8R5KMrA8kay+TGqgwAEncAhDoT
	i7A5z3Ao=
X-Gm-Gg: AYBFou1Mf6F7LSTRjIqMF7RO4rxq9bnukyZVqL0isTL/Lpw5ibYdMlpcPaCMIlVPs0s
	A9vPZGNQhWHB5OB7t98NruuKRrbOx+9hCQxD7rmjDbwIfYiogWmhEQt/Q7s/B/26sk5ZhVY1kQp
	wyZD1ZAqcSnOgPDpXoieIOegChChuvkYKy9luOSjKRAs8MW/58GcQzrL4Hj7hrEkT6yxGibKQkv
	t/N30GApu2lxJRZFnQWd0kNXp7NOxPPHcUxs79uuVteuA6+gdNgKyf7uvNCqqrK6WMLdTPeur4n
	jdseS6b/5Yo4D8pxUbqJ2QpOkx10nsLAdRtdafmOJHy9GaJV0IhwUqTt/tLO9TyOl5TxFV/n6vR
	jFroEMoba4FPB6ls+pXun1SXd9Ns14CXptMRPJ9hdnyoCM/vMXQa9MbfZXaDsG8f6TVu0+AhVge
	R/fNIXrDPR0f6PCcvIiJ9dgFs6Th00ds/1FfqFf0aL3U/1qrNNXPv3g1WCCTzOfP6KDa1ncUzSB
	B12zimnxV6hFOfyYrghSjaJ0hjTwINlLb6v80hBcG+gYSt+
X-Received: by 2002:a05:6402:2b9a:b0:6a9:d0dc:d09f with SMTP id 4fb4d7f45d1cf-6a9f622369emr53787a12.9.1789341822605;
        Sun, 13 Sep 2026 16:23:42 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3321350a12.31.2026.09.13.16.23.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 16:23:42 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so1529460a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:23:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIMaeVphwqSc5Qf7F+WYFFToO8Y3rWRmS9W0vSCjAauAmwbGYyaWPtzZb3vmUBX5yz2nlFPHeyGn9YONc=@vger.kernel.org
X-Received: by 2002:a05:6402:1d51:b0:6a9:a33b:bb8f with SMTP id
 4fb4d7f45d1cf-6a9f63f3aacmr45612a12.41.1789341822086; Sun, 13 Sep 2026
 16:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com> <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 16:23:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiV82JxUZmDVACW6qzUFhFq6YZDxNMO2n2DDBJNaKm8bA@mail.gmail.com>
X-Gm-Features: AcwNN1Whbjw6pWiZGIn0jVKlw60YB0lgO85PQOe0s6VIFpqjER0VIKAzYB0Sbec
Message-ID: <CAHk-=wiV82JxUZmDVACW6qzUFhFq6YZDxNMO2n2DDBJNaKm8bA@mail.gmail.com>
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 16:10, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That explanation rewards horribly badly.

*reads*. Apparently my MUA has started its auto-correct journey again
and I need to turn it off again.

That's my story, and I'm sticking to it. No way am I just incompetent
with a keyboard and can't spel wroth a dman.

            Linus

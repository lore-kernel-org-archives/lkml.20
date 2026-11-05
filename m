Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907760;
	b=jcb9ghBX28ZUvV9kx5GrcO9AiFsAliavXHijwoLXZTgEzhfqxX0NfD0hDNPaUgaRBRkP
	 7VvFmTRJ+pH6W7swzmwYUIAROSxuMZ4ePBurtl+ZLafoMhW0W5QPClYYbzmqjDBE+hCky
	 edyltFCc/rpJQobKGhJEKeKA0PtwB0t+cIcgzlF4MXCPbm+Oqew9moRUgJxWHxesCZswO
	 ccMStbKjHtu/0A8j9e5xQk8QgVjWi/8Slp9+gkQZ9ksYVoV7pquQGjGxr4fV1pzN/tWe7
	 Hi0/+ILP82UtbVWK6g9My7uXypIahPkhcOZB6znYIhigqHOLFZw9YgzCv7PO46WqyPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FUjFF4/lQI2J939Rl5oexJ8HSAevBIiohF20FbQvF74=;
	b=OH1OkI9BLPE/uCj2wkMWscs3lNkWF+eOYz3wCGmVGenug5QReZEmlFeFWV44Q20N6foT
	 RR6kH0JzZPEmJWcEv9bn+DAaQ4mNcaOy0pUGCb12yc62M/LaEJGtN08zxv7djVs8sQZ7f
	 b47RxjvdnQcSidcorH0AHDhIGgSOSawVllZ4tnCmyfIa0AqdTHjmyiO6XVY1O30UN9U6B
	 q0cANz9d2gUA7+2lf7Tlm9mgU+DZiKhRlajrJkbPjkpiCm217f6zPe5EPvJBuIC09URXY
	 UYGbn8FEPd4mh9Gw5c6wWnU/22jkL2/bel3rQS5tXkmSQm7BEVlXd2hUQbiMyQRHn5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XpmRnnhP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D356078559
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D356078559
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XpmRnnhP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21200105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793907758; cv=none;
        d=google.com; s=arc-20260327;
        b=D5wDNpJNA1X83T3IK/oEOzICzqXRw3qDK9QoG6g9GgUhoDrA55rOQNdzCyK3sRxR4d
         ZisRyWT2T5oIfTauIukQtfT5qExFsPh4zrObOKukAzWotbovXGODoiWiJ1/6lK1sAwfZ
         9z3uIQH9fRsx82hFY+Q98fPpdztf5x4v0/lc8jCMX5+oRa8lIUoBiE7rtL3NeDF1DzfN
         nLDka7S4Ai60GjgqdWCtWk99oqkgBWtnOf9gBThN+R4Q8IxxsVFKVEccAnRgsBpZCmIE
         14Nd293QRRmgl4yEAk/O+RphAeI7oAKs25IE1vvpi+9vdt2YHxIVmXyzmbqI2tgiqfT7
         /rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FUjFF4/lQI2J939Rl5oexJ8HSAevBIiohF20FbQvF74=;
        fh=FEg3fxHnPF1H+uHPJR1mJgjc52HvzTgfmrEwSa8xnnU=;
        b=hHE8+9kQBvrXF7PIqGzA3eJP/pLxYdnLAbtLR+01Xf4EOrH9R7189o2T2jZWthJUxr
         KLZHw9TdOHAf/QHzZk4xXXfkFh3wRpHrppvimWu2SZsZ+Cg5UzzhkR2F3/rVEdfSxyEE
         CKY56EtPD8hQuktsQKbOzV6Ko3noGsubaALnS97zS8BmE+TrO/BU60XUjZsxaXm9Sgyt
         cN5JfQa9Hx4s4svKadnYF3lSsRYqsUDD5K9YQ/F9YKtA7CDhaJ9ttY7yJ8dL5g6pf3H7
         srgeW92ZrbnzBi4rjLEax20e5vvilNb31TDdeQSBBAjH7qLw4ezt1Rc3w02/8Z3uULC+
         Lppg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793907758; x=1794512558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUjFF4/lQI2J939Rl5oexJ8HSAevBIiohF20FbQvF74=;
        b=XpmRnnhPkKizQ/zJ4iRRUolBEIrQyWbYKx+dBHoaKpLClFlTAmH77kc8/u9GHvlJ82
         ShJCFB3vdX/zDLZOfugNohxHRqn4KJEFXYK5L+HwtHNbapCB232gzJ4tnR/LloDyqvnL
         dNgUDMnHR7NpEVjNM8kbLDaGD7mSAlt/uarv0wO1XIv8Bx5tAOoscLsWGwLkToBhqO6V
         37Tc/lkRqB5cU4Y8CJrsdwxCcTnKPEA/LGH8fzdmtyG3FJ9c7asKqnORUtL4v1xuP/fj
         Ssf/mxhylyE0YkHfKgFd4gLxSL6SPJtTLc2u0R2ULHcp1THtdSgAWqqDOPJOKdMex00t
         W0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907758; x=1794512558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUjFF4/lQI2J939Rl5oexJ8HSAevBIiohF20FbQvF74=;
        b=bPaArOctB+ps2yz14GKSdCbtflyUpTr/AHQrfUfda81nFgjX5PTwLhfY+mFT+kdNlK
         AEubba/hCfxvLx/4BBlLy+tS2V+OgTdu05l86z8/GhsQws/ZeGybW53+8zU7GX7YHuId
         kPzFVYRe8sx4jd6sVFDWkCPD9CeidnR+H8Y8d7CHi95XTw/6/bDuHJ2bT7EjaT0gW8yy
         e+h9eQKOoR7VbzjB0QtiUbPoqWytIX4itZiv4d+VtXFBzY6oX/MFEhOJKeSNUDKpr/P7
         ZPYigOehzfH/tI91O8y6coBsLG4eeW3Tn1Rpg07XzwLdwTTZpgAydAarNFWUSFgrAmDs
         ICiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeIX6ZakZnXZ0d2SWH8ybvrwJQgnayGodElGZwXZb5VEKTneIgwn/Nt8jnA7JOIcdv12w3XdVwZsNPm7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oyEBICzsDPo45m2gVhAwQb2LNsja4iD9XIV9V/qzcEy85B8rS
	LC3zcyYubAXcymRK0YXMVmTlL/dHTAfrOsZ/2UvOY7NzntRSAfY/b0nyle3bHXlsGyZkJ26zTYp
	MsHHLf9rszvgQtqcTqPPcWjGyB8XhzlwvhFKMwK0=
X-Gm-Gg: AYBFou0fcXtynNf6EudbqPGIMZzWSaw0LYalH9OqILte8xvW0Df6h5EKk5bzwPrKsNG
	2uyjyg2Om6UbdC00JxrZWjDI3xEUSnq/NU1qO0cZWjuOEPHKE3Ngd6wLnLxEuFByoxpSXoGpTTk
	FcjRTZcj+Hz2aKgR9IpsFajS6Br5ZZHgOF/tHilq/7B3aNvInLintgQ1lK+PR29WZVkePivLhEv
	4i4BsMt2/aSa9w9/w17dIZKr7nBsfJYbhchPGoI1dEAfXBSGHd9ynYGgi1mRO6tmiuYropldarg
	uSX7PBSqP5LpSpLhCacj1LVeLrUpUJzHrro5DcXvcsQ1sAvG2Ij7wxHIeigC0zCul2gXliQig95
	N7C1xMi/Gz23uKOGmnckAe4jAVvq9vw9X7uPmR0c3AE0jzZqyjh0aalD4x6z8KUDcZVQRJ3E1Vd
	Qcca0f3oCY6nZU/iK7rRZf3hvxbHGCsR+hffV3n5dAVS0WKgAGzQWdZorC92OMBJRHBL5yvQ4H+
	t1G56djWjq5B2/kKhUhq6gBmcKOi6IJ6p+nJZZK90ypzeaojqYr5g==
X-Received: by 2002:a05:600c:4455:b0:4a1:f720:74cd with SMTP id
 5b1f17b1804b1-4b6de6916b3mr2613335e9.24.1793907758040; Thu, 05 Nov 2026
 11:42:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105135316.2465369-1-mlichvar@redhat.com>
In-Reply-To: <20261105135316.2465369-1-mlichvar@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Nov 2026 11:42:25 -0800
X-Gm-Features: AclHuK8_Cdf5KAWZdw4g1K8Nm6fP2wA8tqVrHe7sfl7XE0jtg8CHifIXYqpUXVg
Message-ID: <CANDhNCoJsgv8wGa7WDrHvtWGgmb264j8BFMnw-vCQT7Jrwui-Q@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Initialize TAI offset to 37 seconds
To: Miroslav Lichvar <mlichvar@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:53=E2=80=AFAM Miroslav Lichvar <mlichvar@redhat.co=
m> wrote:
>
> With Resolution 5 of the 28th CGPM (continuous UTC becoming effective on
> 20 May 2027) [1] and no leap second announced for the last possible
> date at the end of the year 2026 [2], no more leap seconds or other
> leaps in UTC are expected for at least a few hundred years. The TAI-UTC
> offset can be assumed now to be constant (37 seconds).
>
> Set the offset in the timekeeping initialization to the expected value
> to not require it to be set in user space via ADJ_TAI. It can still be
> changed, and leap seconds can still be set, but nothing should be
> expected to do that anymore. Existing applications are expected to
> either set the offset to the same value, or not touch it at all if they
> see it is not zero.

Should we also emit a warning if/when applications try to change it?

thanks
-john

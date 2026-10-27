Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093514;
	b=EMsvlzRC3FHp2xU9LIWTcar8coPJt7YRaKb0biYBoeJbtu95aXp0CIisBDgUEmiJqArV
	 DkSHPWjkKbEDcExrDXTxMgz/nCXRifompwSzWcZ99KVrFhC6OPbL/74mEr8QQCZcMGGjR
	 SiEQQfdG2lYnzj7YaEnDmUaY/rCK1EaRgfL4Bynx37azKgeLHRk2ScEWNucgNovo4fW6I
	 BG6TEmwCTGpC1d5JNfVKAUhP7bWESqRCKpDBnZCgVA3asrNhPcouT5fmWH+kOIE+HZgkU
	 u8eR5qPM7889m/Hi0kyy/N047EWUjSDPJ/N6Rqu+UYd8WMD52E98l9SABmmqZUKXXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2+1G05tir3UWy77V00ugSa4Yu6RgrKePcLu5DwJQIOc=;
	b=izw7lELiH2AZ1EN+E6cqcukPYQ1qCX0kifjwt/93NDRJPlQ+K/tU1eJLt9nNOhcfqED2
	 HETHVQenwuYCjv2nbeyhZDcp8tQCrBofhUcvWsv9UuVkd4zSwvguUiEiZl8Kn++SNSVrh
	 dY4RzJwNZWoonnKNy7XDnJjjT3KXfe2N5KPPyCIh0D8rQTMi85gHkQQWgUkDZiVXxEF5T
	 I2fdHJf/6iaOIUXpG8oL+H67PV9EwJeuBva7LYKK7CJhN4mrdpIIm2tr58dXLkl/i3IwE
	 AlsF7O9h64hrg5RvDJt9RPOqFhsoTWDCvrXlVZs1dOFwFB/H1bkfgivC790J5n1sW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RTWFAw4u;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE531606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE531606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RTWFAw4u
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso1862110a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093513; x=1793698313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+1G05tir3UWy77V00ugSa4Yu6RgrKePcLu5DwJQIOc=;
        b=RTWFAw4uPHIYq68PkMeSNqjjtD+Ja20grGUdOEnAQEQ263EPEDH5A031rOcu/f5vpF
         AX3GStvOhlkrUgkPo3ocE7wb62BFdO98/egehIDoy+5WKss7ks8jU7ohw7QbpTuuOkfY
         jfqoW7qLSkphk+QUcNgwqu+JcAysBTkqm9kgL879ywM3GTyYq+i10Z+POayD4QSUtfTE
         qhJyzVb9hR9Bj6gjdpnZgunERY90fITQ+Xc334BkdJt+szlVQV3j2PtccTsvUxRdKwkq
         usU3oaly0uhpScbS9VntgT3t+dkqQNYcRqQWGXWyXUzo5SbyMb45EZlc67vnlb7Styeq
         IcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093513; x=1793698313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+1G05tir3UWy77V00ugSa4Yu6RgrKePcLu5DwJQIOc=;
        b=JyKOD0BaCFbPj5MX7kcSWEKF8W2amg7Va0Q6vR/2o8gx8vbQQ+s3TRb/pY0Y1L2qmH
         lWA0wkrIvZqCLoGQS8D4BiqW60gZmpCq6uuv3b0xVu0KipzUkYFht8Xd2Pi9HM9SoF1n
         AmAuzRWNf5KhSGArPZ1cwQub89vi/W9e7vp3SUDhXFugrfdHZSb9bykjTtKjXfSI/ha3
         PmiL/AVyQ3iGtXzT3FCJZt/Dc1e9B8RSN1KveOS9DQKKPI4XTLGBK1NYnZIJ5oVn7Shg
         yU46NMAskwqJekkv8exskW6f5OBSohzrRFmG8oigeZwrKtR8BcgT2Q1QuSuZv9/tRaGI
         1oDw==
X-Forwarded-Encrypted: i=1; AKwUvBwXhwMPB2+k+C23UCy+6JRJNsijV+rf39aqk8uF6O0CzJdnqsx5AqeQIdp1di8QYEPQljPZTjVnLR3GAbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEUoZ/ITRVCs/seFnJdnhqrVEEx3TTamCttUgBeBGMb4qUBlsr
	rPK+x3irMkgpQiHOcsf/KRN3pWI7yH+eyG+La6D6pZReZcIhj5yUmx6i
X-Gm-Gg: AYBFou3mQlET9pr3T6PhdNpHdqIBoVqxPXA/Eobzj5m5LrdTclSOlhEGC0oSkpUiKEe
	E5ezNQsnkBXpFb1e57gjXNO6IO6cEr6Tn69FsHlnMvSQo4u9EYrWIcwlW2IlyPVgeUfCJhxJBkH
	3tfatUT0P0QmyyoG/mgielHPzwCjLjqOHaCScco8SnkUUZNHW7vFmRgyz0IaKQ/Y6ahKIIkt0Fy
	MmiCTYIiQO6MOQSv27cjISfNxUxe3ZA/OKWlpKT72f2mRBr26HOFIRx1hxDrR9ADdmoI+AgSk1v
	x6ZCeJ92f0JSq/8OGsWrX96QBAwn2eI5NEk51NtQoZBGYUwxghOrupbXUNM86Iq+jrRiDJaWown
	xja2CM5l+sZ6ZLougBeXKkQK2EjjaGamD96/vRvLbIc5HXoDq6mXNdoUnz9DJWymbSnblTAEf8H
	hrxST0FjTw1g2AEPpXeDVG8hk7P1Psqpnpb9+ST9cZo1mCVGyV6I/T+OpqxGPShjBpntU0z/Y4E
	+Z4qfHnXSCsBCovZBeKawS/0xVnwkIqQWQOonYGf725+GbtcMTAs0VmpOfhBrlerCMqb+I1rzB8
	Y50hO/o=
X-Received: by 2002:a17:90b:164e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ade9b2ee37mr8269658a91.8.1793093512905;
        Tue, 27 Oct 2026 02:31:52 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406153fesm3000707a91.5.2026.10.27.02.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:31:52 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: wangqing7171@gmail.com,
	peterz@infradead.org
Cc: bsegall@google.com,
	chenl311@chinatelecom.cn,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Tue, 27 Oct 2026 17:31:42 +0800
Message-Id: <20261027093142.2337191-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602054619.637201-1-wangqing7171@gmail.com>
References: <20260602054619.637201-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,
Gentle ping on this. I know you're busy, but I'd really appreciate your thoughts.

> I took the most sensitive workload I have for newidle balance (tbench)
> and took it for a spin with these changes. Following are the results:
> 
>     Clients:        tip                  bresenham_accm
>         1      321.65 (0.00 pct)       313.97 (-2.38 pct)
>         2      641.92 (0.00 pct)       638.74 (-0.49 pct)
>         4     1245.65 (0.00 pct)      1237.26 (-0.67 pct)
>         8     2435.80 (0.00 pct)      2442.23 ( 0.26 pct)
>        16     4717.66 (0.00 pct)      4688.19 (-0.62 pct)
>        32     9303.53 (0.00 pct)      9390.71 ( 0.93 pct)
>        64    18002.57 (0.00 pct)     17911.56 (-0.50 pct)
>       128    27729.26 (0.00 pct)     27621.95 (-0.38 pct)
>       256    47134.77 (0.00 pct)     46137.36 (-2.11 pct)
>       512    43179.41 (0.00 pct)     43277.53 ( 0.22 pct)
>      1024    40339.30 (0.00 pct)     40176.49 (-0.40 pct)
> 
> The %diff is in noise range which is a good indication that there
> shouldn't be any surprises. I'll queue a run overnight to see if
> there are other benchmarks that like / dislike these changes.

This benchmarks looks good from Prateek.
Link: https://lore.kernel.org/all/da1896b3-6bec-4b56-bf6d-9ce775b00b8d@amd.com/
Cc: K Prateek Nayak <kprateek.nayak@amd.com>

--
Best regards,
Qing

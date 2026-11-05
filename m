Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898452;
	b=vHjNGQE1jqndDwI0L3wIb7kivj2+OEr8RYrpkKP4djIPh5ZeHDxoE3+opClBWyMPDuuw
	 P3moxxwnryfQjM6VFpwZ9xBaEtVylJKyq5cNgQdLQ6i7wKkTNCL/bM/hV2eslsAzUQzoC
	 KBwhUfpJHJr4gvQPjpxkOqPB5Juq15Vlvj0n7Piozq1ymoPKJ86l3AdwhzWKP1bLfTSEo
	 siEHGQ2+ar5JJo073Qi2vVPcryv7viG+mjphC6qMrvm2FoeyH8ro6h+/yoMGTbpD7u9rp
	 FD7l0stLuSQ3NhZhtk5FPDzYj/GC6r6neyD3H+JSDa6GaBPZXxbmvp52ZvQxYfuJg1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RDOVG3cpKCfgE6B6tnKo2t7K+1619D3zF9SRV6224FU=;
	b=0Tg5NJyfDK4dPS92HRur2yFR7DLmNZsGVMs/CkBV+yqMiWZSqgpMkywzPNuSa5cRA3cV
	 YXteRyrzZs+Jt766g9D0Q6xQaCyhzPOAlQIXbgj4sgg9p4l4rOjieNb27qOqKVJg64MMz
	 JiPuQf6KpOTeAnbpl/WSm9Up3yITNZ9ysRe8W+W0UBIhkNqIX2a52dJhBaKhA++tkbLVl
	 Upe8iCFUtHKIwm6DfP3k39i5bKIe7WRMu01uJEodk2g8l6O89yCURF4hkl9JxpYeupAwY
	 2Puk/zWRJUcbYqw18kcSotzUm7QfInyYfbZcDWSS2KHmDKlAtY6FM1qKCR8KJcXxIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAF1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f259cdc86so204917285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793898445; x=1794503245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDOVG3cpKCfgE6B6tnKo2t7K+1619D3zF9SRV6224FU=;
        b=R0jQ0Mv6Tt2wdQgfQpY4Zah4vKPlzSzNJeN9VLU3IwbWi6Tcfu5CXaOZEoxhGURNKF
         GwBiFgy5HZ0UDyGkFGiV0uExMbWDeQ6kRLLM9opqnAJN/v6+isOSn+Cpz50n7j0Zv79D
         goEZ6DW0JlEZtSH4X5UjsXPlyNvtrpQxqQ6HdqposZjEAumTpcyWQEtjaM2E3HW2I3n9
         ZP7OySFjoFhIZtP4uclXe7kEosPYpdbI/+H+ih/1WXRzFnSZYipuXtPZeV+hC5nHcFYr
         9bdSfIQZrxVwpZXlwWF5iGbVc6cbDQXE7WUQG/TKAuIkgganFCp4/+40SckGG0/fD6at
         3Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898445; x=1794503245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDOVG3cpKCfgE6B6tnKo2t7K+1619D3zF9SRV6224FU=;
        b=MtUMNDw19Ahjz6EH/878M1pI3FXYv0Vwo4Lb7esa5cdFVOKAXsvg9XAqUtukveAMj/
         lqBF6wVapbrhQ8bdfeVc3+lERqAXcrtYjcwzYp6ymwzoAlggskQc3axObtK3GnqHDBJ4
         4IoT72LZrxzRcRBlN4+3E7BP/VntNK7mYI+9XV+jyzsUyyKcwzBGC80SI8otgwpTc9QY
         Rc8/k2CzupnUGG6tTGn56dUb2LNbAKI+ATsaCgHNK+KqQsug2W4oCuqmDUN+tuA2Q3vx
         Xf8Du6gpR8YvQn2T6pKWywBOmGL7GhKWOQrsPrjWYWI8gZ5VOVbHcCskkwXewX+EqCj4
         0Mxg==
X-Forwarded-Encrypted: i=1; AKwUvBwstIjSH4v0hGA/83j2Jh9CI2n42iZlvCTZO4133eRbo7KBXGROuGYPoQE/mQO3M1ZOr+g8hZM4EYsJplo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pQWRnuD6Vt1eWoLT1/J0xcBE5RA1O9e2pQ3Gv5u74e65wGdOX
	fT3h0VZyD8UTk+iYbOVJ7lC6xq3TNjOpsVguc3IpU0NDoh5LgFk6DSpf9XN4suotqkro1SicOks
	0svLJdiwiw6OoBdRXs+NC5ismSOS8p7wPG362
X-Gm-Gg: AYBFou1mLvHfsPDW5EJ0FRknrQ0Q1Ww5wOmLfB7TNYyVQpvEe49k2NQIUrimj+kHhj2
	3OlCXAStEEJF7WnK9ZSbMezmbuwQlu4ttJdG76lFtJY47YSWNd3g02ThQZm4PFvgp1m9JBt/Xyq
	EOBTIsLzvZTIbhnLUdu3F9GYUcOCGVocjJTeYa9vMxUljMQISybNwct+VOwdVuIERt/sqZm3BD4
	oHn5+ebGmWIuth9+HX1Gqv+Gg8+DG71OwEFbZ6fYi2+jCOScSami4ntLFsW7NLR4ucKoOC183Hl
	YGHNwn0GjC2sOJUHxf9d9mxdByEFU0rj6DU8ZHywSN+z5algRY7Ti01xQpWqxWxphtRK+hlt1Xv
	W2wvJpPmRFKHqmgo3F5utYT9EWFImyNjx4hiIG1E=
X-Received: by 2002:a05:620a:2987:b0:93e:623d:99ec with SMTP id af79cd13be357-94421744cc9mr3322483085a.13.1793898444949;
        Thu, 05 Nov 2026 09:07:24 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-945d47853ddsm65531985a.8.2026.11.05.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:07:24 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 41BC634039C;
	Thu,  5 Nov 2026 09:06:53 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: trondmy@kernel.org
Cc: anna@kernel.org,
	cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com
Subject: Re: [PATCH v2 1/2] SUNRPC: add request-scoped disconnects when cancelling tasks
Date: Thu,  5 Nov 2026 17:06:53 +0000
Message-ID: <20261105170653.3200815-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b9ed2a8b5f687d7f581d4867a7867c5c012bb2cc.camel@kernel.org>
References: <b9ed2a8b5f687d7f581d4867a7867c5c012bb2cc.camel@kernel.org>
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

> I'm all for optimising where it makes sense, however this is adding
> another spinlock protected section in xprt_release() for something that
> is clearly a rare corner case.

I agree about avoiding the additional lock acquisition in
xprt_release(). I should rework that part.

> So how about something like the following change instead?

I tested it with the same reproducer, but I still see the reconnect
behavior, without a noticeable improvement.

I think there are two separate issues here. Counting only successful
cancellations avoids triggering another disconnect merely because an
already-cancelled task still matches. Cancelling untransmitted tasks
separately also avoids disconnecting solely because of those tasks.

However, when cancellation of a transmitted task succeeds, we still call
rpc_clnt_disconnect(), which disconnects every connected transport on
that client. That can affect another transport which carried no matching
requests, or a replacement connection generation established since the
cancelled request was transmitted. Neither RPC_WAS_SENT() nor a
successful cancellation status update tells us whether those connections
carried the affected request.

What I'm trying to do is limit that blast radius. For a request with
rq_xprt == X and rq_connect_cookie == C, cancellation should not
disconnect X if its current cookie no longer matches C, nor disconnect
an unrelated transport Y on the same client.

Would retaining the request/connection-generation scope, while removing
the additional unconditional lock acquisition from xprt_release(), be a
reasonable direction?

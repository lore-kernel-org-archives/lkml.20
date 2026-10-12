Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616EB45D903
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832144; cv=none; b=iDwiOa6AmMYGOT+NgHdJ4jcMec1YmjjSuWKsGeJVzeARNVGE2r96106IjZov8988jlB1huGb9A5oR4xJQCj8oVzLwESML4oyvpPu6IqApIwizjpwkU/zCiAGqHEFqYTbSUdrgOFCq6ngsYwoqhj+lqIB78BoP+TwaQNeIm5AjZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832144; c=relaxed/simple;
	bh=QaGsg8YHe+4kQJxQkKk1XH9DeZBJmhX14Rv5dC+iT5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjnI3ch2msiuSnAuYmY5ccwZm0yQgN7aQfwl6lMbYNXMo4oGTgdh0egJAtwHXKo0kT+yp4X3G1ZOaHrUNq3Ltb4TwulT7jHnnNiXG0gxyKlXm3lMkRwOimBPoUmfF+Gda4M4pwsyHyI0NQNZWQ+U0fakE38IqykoAXr5LEXd19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4M3q6Ji; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4M3q6Ji"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so15350185e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832142; x=1792436942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYwwSnERvRQ2SylVNRBxQCfE31X9AnGYXZyWqtwRxqU=;
        b=h4M3q6JiO4JtuKFmCiTTjMvtqNp3GSDNyg7Up35emfeW9vJ8yg1Wgha7qHUXNAmWbs
         Hy/2sqd/IK1dnC/gRaou8rNRIYbmM1lmrRZKFkZDsA3rAy8psVgOaZpolwHTq/0BpqsD
         OqBFB/P3ccJ4pUNmEXKgHHD4xgNVynZA+acJM91cklVvxBlvJ2v6T+A7Sa+jUnI7vk1m
         +W4rmbrBb1zH1wS5/owhUYyMyQPM8wjoRFkmBjTl86Ue6QfpYHG21wNfehLckwY/I0+s
         6tsw42eTuMHj3tXK7a1umozE/kr1h3GtLD/kMbOW6d9WZS4NgzAXi8u11xHqkMGAgHEN
         EhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832142; x=1792436942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYwwSnERvRQ2SylVNRBxQCfE31X9AnGYXZyWqtwRxqU=;
        b=MgdOwxcN5Rp4I0yyAH9Wj9Jpo0lt4xWTO36uhGpGV2FapZ0rG2o5uZA3tE2ZQotvS3
         R3DkBqKXIMcE0MhG68f5gUfrpKI3yXDjKKOgTt1NEE3OaOT9Pk48PNEPeZC+7ZuG2M51
         EqH+lHBuYOxM0uduR1rn69h6nHK7m/UWIXB7pxM701yXcXnv42iY1lIyhz+ht/W8SLpa
         Wt7Z6G2BD0St2BgUaAhFt/qatTo2FYQSoGB2fXabTDCrMQAsJ1u1Wk5C6k6as3v3v5lf
         W2B9jfywg747yC4ZRsuFAZ4zSFcFJwKSpsvgvNjxz17mIp++4ouTaFjKA18cEWS84Wiy
         hgMg==
X-Forwarded-Encrypted: i=1; AKwUvBxStNqtvzxJmgzyA8jCU4ksB15L/oP1nmSvxCup+JVDLaxI3CA/ucrd7IqnN3A5rdQr/vrixN/ESgDOBgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkDdhYIJQdadhvncf7dwp5afu4HfIwPvlvJxzbfQzg7U/Ppp8+
	xkvqgps6XMR1VqGtFIBAq1Kga8GO5PrsCJ6HzBUNUWmdWI/zPOeXNEiv
X-Gm-Gg: AYBFou33qrxbuEp4u2Ex1AQYPqfYhM63dTzKIJ2PCYtREvXyvv+/RVFOoNt73pMkWkJ
	X5OnpDdhxmEIOzazLa2ap2iywIWcAaj7Ik1jOV0NNzX7vmX9Bcmqc7dEWaW4hi6dGoRYqc1tbV8
	PzmGvv9Q6SjW0190cHoHCJH80wJRgcemccj92+rGr/C0tAjyD9bEAPCbAqqUNDHLMY8yDcI9GhK
	YTkjnxgYVu8Bs5Db/J6nd3nsReofFm6CncbSb8hecsSf+EpSdJ0dD/0GHbFRSdvgI4gyJz7vWpd
	pLhjkS+PmC2Ol7YXV14733pGKKDlfOsc1LfwHm4Qd5uEIX43E2uynpZDGhK36tnBCSI0czmPCJK
	yr7XfRkvb0gAj9X8DCJqjW0GroY3kG10ckGbEePtGwXVePdtMb/ZZVog5JKxIvnoZYl0VMK6CAE
	YkIqhCNTADXog3sgmN3r8wPHgS15hxaZt5EpSKoq2bj+D3V63T3bKDsx/9fbSHT1mx8Y18OQvmL
	jMpXM3/NupCE+hPcweMsJXsX9vn8KY6n3tUyw+sajLk435QNKx+svLJkXxF/zotsU5png2LzMpj
	a8qRAAKk/ItExVyUtD97il0iqYCJahAiX0TCGNDtqR7rDvy/vfVrREhEcuGhLemyjyynxmi/
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr188375425e9.10.1791832141574;
        Mon, 12 Oct 2026 12:09:01 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm200105015e9.3.2026.10.12.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:09:00 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:08:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH v6] softirq: Preserve interrupt context during IRQ exit
Message-ID: <as0wCemtoR7p4S7-@gmail.com>
References: <20261011060742.30584-1-kmehltretter@gmail.com>
 <17377421-38AC-4453-B6CE-A4854ED597E6@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17377421-38AC-4453-B6CE-A4854ED597E6@mainlining.org>

Hi Bradley,

On Sun, Oct 11, 2026 at 10:31:04AM +0100, Bradley Morgan wrote:
> >Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
> >Assisted-by: LLM
> 
> Very beneficial change in my opinion, well, nothing looks inherently broken
> 
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> 

Thanks for reviewing this again.

I think the patch is in good shape now, and I've also done a lot of
testing.

Thanks,
Karl

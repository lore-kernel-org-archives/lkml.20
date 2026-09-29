Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB932572F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641229; cv=none; b=bExJEHS/BthMZRdlYMABeAYDEW4EnbSrNWDedm+X/V7kAe0Znd8b4R11ngKRAdFdKns0cu67iVmj1kBHV2BB3DC1D5fPeBGgZ1hLC73Ni7UJZgi2v7dkWnSG1J/hiQPCyz7Gx+uHEOmlvSo7NeDm1erFho859A/IatDT9zWWDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641229; c=relaxed/simple;
	bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wv2uiRJo7UVgUVmSZ/VT5G7onrNzKKguL8M1QmpcSqjzT7PulJzoNp/mO1g7O1pKIyWwWlJ7wywVPbWpD+WIalDCJXIdp33EGOZ+maNfVix/F3k/uNfW3M4c6R8+0fAbcbiVeW+IM4K6qceLjsM2/vmnCnk6ulb780A5aXM8xLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfCcEU/Z; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfCcEU/Z"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso1308969a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790641228; x=1791246028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
        b=qfCcEU/ZJefY2FkYRjt+IYVPC6XR/X8Jq8r6y6Dj525Y3WyI445bSnj+dtQpXzBz4Z
         Toa09reD9HGGxZkZpr0674gXE0ykxhpbTbvVOCc3OlopCciHKhvwHS2UxrXF4M/1EtsC
         cxT209oSgEiIMUm3gqfIcp0Bp3MdMYbWHwruFD3ctr//ypiEzN6mUjNmiAoTA1BBza8y
         6uEhXOr+UOi4mgad8CbeAe22e1yQLMlaVWyKEic8KQu/zd86xMT6+WJ4DLCvutODshK2
         c4L+Wg89atFd4saEmRNM69ugxUss20kdz24gjxG8OgLkjMSeLDcoyB/wPDRPcsriAmHq
         lDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641228; x=1791246028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
        b=N7qe+/yaLv8hESfQpvwznX5SLjhuq/NQhzif9bHY2plyKxkKJy4CdSlh/jgSVwgu1W
         BNoS8FAoGhDNQlZtghfk1NtIZ0LG6hXNbtt+ob5ZfXcO/hramXsBEPY6Ug2tKpnKOuaR
         GlTjJfdaFxEDVAB4dDCxbI33RNWOswQVGr6DKkhF17oyHYLz2l+17z70UnaPiuyeTqSQ
         bW39ePr1BYRPUQy2zT2r38OMVKSn68KRdaEg0JAzkSqtcpKUeLLc36GdUI4RV2Gh1SGq
         3Zb3mk7TqMbcPX13jdVkuaqBQIecbXxariwuTaLOB+rg3uwydT6XsDLMU+0ApETMLqvy
         RhHA==
X-Forwarded-Encrypted: i=1; AKwUvBxvZrBQQk8jStZFOsoUiv5FajZq2xyab7U4RBcDPh/Tg2TvYb91dmCiCvmXU+voCFL66pLCzhVwDSBdQRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsi9iBzSeKzcfWO39CiIRplhFf8SvQNtNGm00V7oSdfLJbBH1p
	/0EhW9Hy2ofNPY47pEgvlYDOlftG2xf2EMxLUBif66TUGxDN0KkhX6Y=
X-Gm-Gg: AYBFou3cye0Vkt0a8P9OIUyEDCYWjJ2inBNo4KotFP8m5/awLIrDmdZMKsPfOSEiL1Q
	6VUQailJA7AB3HHt/HbxLUAZxqI7hwXOiOYNRxEvT35J+tQVjEhRDwaNppJYzvwrFSNcJ+w6mIP
	gEMI7JybvsHJMRTetu7nGyevevirB7rWOX+ojI3QdqXgOMY2WnM8o666hTFae/hj6T6C68KARc5
	Xpz9yyRVGa1g4L2M2jF+Tw5R0Jvo0NtMNNdhvHNdLJh8QwTAujRjGWKZN4tshfzRXwrxuaws1x4
	qgzQP+fkfzYJeQZs9a3bUSALBupHAnzTxhSEjb4eHgSLTcYOMTXIkpLqWR7KDOSkCCC53TbsxCO
	UpjLiyNCeGQlZsAXS95WMG6N7zXknRkFL5XxSHoHGf/NcuGVS2ypMFzaQbYQYPdq7nDh5aTVmNb
	A4IlTZVLiq1U+YZ6x7LWEIC4pUMlnF5widYv+pnaschR/Ij8nQ9IFfuU05+1a+AWtJXtuqMck+D
	5VWT8mX4bj5az6xHNVpry9NNFL+62j6x1JnGQ==
X-Received: by 2002:a17:90b:4d09:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a0c85aeba7mr6091841a91.9.1790641228008;
        Mon, 28 Sep 2026 17:20:28 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:712c:b4ae:f935:9398:3170:36f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497718037sm2047605a91.0.2026.09.28.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:20:27 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v3 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Tue, 29 Sep 2026 09:20:19 +0900
Message-ID: <20260929002019.1847080-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cc123233-5b48-4069-8f84-f95301a83dcf@kernel.org>
References: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com> <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com> <cc123233-5b48-4069-8f84-f95301a83dcf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 11:11:50 +0200, David Hildenbrand (Arm) wrote:
> Why not combine it with the protection?

Will do.

> Why not do that at the very top?

Will do.

> You can set that all already when initializing aboce

Will do.

> BTW, why do we fail the entire test here instead of only this test case?

I did that because the test is about the bit after the move, not the move
itself, so a failing move is closer to a setup failure. I thought it was
better to stop there and let whoever runs it check their environment
before running the rest.

But having gone through the file's history, I see the direction has been
to skip or fail just that one test and keep the rest running. I'll change
it in v4.

Thanks for the review!

Donggeun

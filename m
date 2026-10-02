Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FE23ABB9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947530; cv=none; b=LTd8bs6ev//RGpRmN/JHeJJC+YT2YrcCPoAvV2yt/Mk4bSPb/azWmOHy2nf+Sx5C0Sx3ikNhIugRNhIpcFEpg/8IFL8CG5O+vIR8Kgq2H0xWNL7CRvAxp0HuZFLrRMtyzTwUUZPr5KLeeXJ+Ez12wvH1jz4DWV5qbV8f2GIRe/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947530; c=relaxed/simple;
	bh=K4jTrfgTfJ+9k229kXW4lIhQAyxGYt/ORZ6zdtNbXNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhafDCJgoaTeEFHPZ6si8vaxizqi6ewSvZDxQbys7LECC0Z6n22DCPZS++8Y6CG0d5aQ4DSLiVf0fWZItsX5gE8/zhH3uEQURb9TNY6CsTwd0r/uGCgjpnisyUahhUNd2XNQvfcVOR1GjpsOkf6WY7BbVNSREDgs6RKFnamcBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaUVNaVU; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaUVNaVU"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34e0b5014e8so1335107eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947528; x=1791552328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4jTrfgTfJ+9k229kXW4lIhQAyxGYt/ORZ6zdtNbXNw=;
        b=DaUVNaVU3kKlZ9Cp0zn0u6Swm3YHsMAEMeONg+754vO4y6E4JOQ0MXbd0S6ig0xO81
         WhEvXKAyfDeZzjJ7ndCU+Vx9Eyegw3gn+eHmu+g/3ZQL+ro/pq9nO1rrDylVUZx692VP
         k09CW54BqQZ463T90TD7HZIRrgUQ/nHwdFqnOQpIrw5ogTjn7Jh0uYoQqfF0pi/wObtM
         S75sy7hiWky+3ZQSwkB86lhapQ5nPECccoTxWM/GbgRzzvlr+3IjWFVRh3jtEUXoVO1D
         jzfJVHi+Er64gOot8Lhyz/5P4lcTvIKkKEVX6HofYUb5Gku/zK2Q3N0zZVzgA4pFdTtW
         A5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947528; x=1791552328;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4jTrfgTfJ+9k229kXW4lIhQAyxGYt/ORZ6zdtNbXNw=;
        b=yf4cKcw6a6mOQYDtfBV1jvpHBdEjphCbTO28Gf5P1HZV8o1RzCqx7YmWWz4S0Mh+mm
         sn7sw0dDKESNfsjp5VNjl4/PHKwkH1BIxkqMgBuwO1F7haDcEGuxm+9IMsdAlcLyd6rC
         AIgmSeoF9EOuKoDP9IwS8njkMDr6HZku/lvkrzaAm61lbIYjvxgxwSDSb7uwneq241yP
         fgGF3mvK8hkyfT23hki2K4ZYPX3HWxF4o4yAF9WvE4oqU9W0GxUEti+vszP9K7Lv1z0p
         w9l20tLUY+ZSgUqX3c0ZWqF8qXjlEKQz73i0lI/hRf03HWh1GHLhnktU7bHUHthO7soe
         2fug==
X-Forwarded-Encrypted: i=1; AKwUvBx/05UYV14USiP6KaCDcM7a7rYjUwbuLreTz/aZq9tAsYDqx83WhJcklypzsNzkb3amRxo34pXFez7DdtM=@vger.kernel.org
X-Gm-Message-State: AFuF++mB6XnIju3570R/i1W8SxAqvyJkE1xBhQp2Snec8c1W7yENAdKY
	SdIOqllWKWl7ISqOL0uDGAGR4N9DHqr3F4a8q92atIg5mjRRMChhCLSp
X-Gm-Gg: AYBFou0qO1PkX2H17oGODjGCkNNpLpDFdOEHtmVe7QHFrPRTD+SfsJmRH2UE9d4ax8t
	bRecXFohE8yumy2X5Jk0ZQkgu9ajlZafAXmBdtn0UQ7TwlWzjG8yW4RCth8w5iyM137JxT6VoXn
	Ybq2DoiPHp/AO/fRKMLpgFg9qGzFIFZcGFW5UFkUkyLpoT2XHLebntsBcEq6N3pVW2eE26IYXfE
	7hEXt9fC8ohZSX3S+Yh+PmRQVW27d3FllvSU0ipCeU1B4my4DJhojL9jGqzvz+3GkPnB+eS8cTQ
	UCEs923I1Zosx2OYCkc6D9fcWyaF73t36wgiO8WndCnuNVCgEeMSYJ5+G4LJAoew3Ma7DK/K1qO
	vuzPju/QB2TxwaNa5uBOFruGKDgaNvoRx5H5Fa+FKo4xhNrJV1TiBtih9xkWPHFo9iJKhZRyb02
	gczU2tQR93aH3i0Tj5eWlsrxqtMf7sBbXo+hIrwp+WibowCGC4yyLGkwZkI25uCg==
X-Received: by 2002:a05:7300:de46:b0:34a:bf38:25d6 with SMTP id 5a478bee46e88-34db6bfab2bmr6045475eec.17.1790947527780;
        Fri, 02 Oct 2026 06:25:27 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f8e9c7sm7474982eec.14.2026.10.02.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:25:27 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	martin.lau@kernel.org,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	mason@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/4] bpf: Queue the rewrites of bpf_do_misc_fixups() and apply them at once
Date: Fri,  2 Oct 2026 21:25:16 +0800
Message-ID: <20261002132516.4109511-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4b74d8c73be2889b1c85c0b9819dbb7c83c535c46342b7ed11412763abda70b9@mail.kernel.org>
References: <20261001-bpf-verifier-patch-batch-v1-2-a12df8a09160@gmail.com> <4b74d8c73be2889b1c85c0b9819dbb7c83c535c46342b7ed11412763abda70b9@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Take a backward may_goto whose grown offset is exactly -32768 (S16_MIN).
[...]
> Should the JEQ-or-gotol decision be deferred until the final offsets are
> known?

This is a real regression, and it is wider than one displacement: any
backward may_goto whose offset fits in s16 before the patches between
its target and itself are applied, but not after, now gets a JEQ and
fails at commit. Those patches are already queued when the loop
reaches the may_goto, so v2 will add their growth to the offset before
may_goto_expand() picks the encoding, which gives the old choice, and
add a selftest around the boundary.

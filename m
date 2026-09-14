Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B77440A36
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386526; cv=none; b=PCDkh/o6bvNiuZaoNDunkDbk5g7fVRtCqr2hSL4fTmoXMmLRCxLUF2QWc+WrwYJQY8M2gu8gx5MfGsNXDGeQHA6JqT8IDQA29kauBjSKegp6rNcXpUQsODKvPI4EUp/B8Egkco25cAWUjQN5TaUEOl3hAuYy0CbBMKVNwgBlE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386526; c=relaxed/simple;
	bh=yyQGZwHw5haqEcdliPr3jUJtPGxgDDPJVLcrxxibLKI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rwih364UM3U9SplRQyh3vyHQctKUYiW+LX9BZ8XfqCIBAOTTCif7JYq+LuL27mQ4bnkaJyB7YcEujV9R+5zNBYjw4VLGp0/n4H0Yt1EfssKCLjBpcL1nQTxt/VO/S+KFSolYFe9JWdFtdTiTOGauF/j4SQer9t+TxlbxO00MQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BUmaY14v; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BUmaY14v"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hk3MF2VgTzMlNS;
	Mon, 14 Sep 2026 13:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789386521; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyQGZwHw5haqEcdliPr3jUJtPGxgDDPJVLcrxxibLKI=;
	b=BUmaY14vGqvHklakfOVznqaLLpeDC4S5klzU3amm/Zg5B/Dho9QOD3ny9ZzjdBUuiVzEDw
	Ft8r5P3aNopIZSadl4Sf91DwQw/ISqkgKXtDlQzMciqnscyrU8LymddoL33isnCzcl04Jb
	+a4hxncL/RmppPk3huRSd5DHkjkBRPGN9MwsPQvHVdSFaJiG8ipnuxeYJAr8AlRhiB2TQq
	KBvHuKARHy0MXZnI3ls5sfrUPI7X89+jaF0erLupBuvKZQQaZk40kO24il3JGVu9mRvagk
	8W64/xmILO3pdBPQKGUsdLbE8oOKfEMZ3AputS27zHOU6J+Sx1+ihO+gQoPEng==
Message-ID: <26926372f9d375e1741b16abd2a910f3754a0410.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Increase drm_mock_sched_job_wait_finished
 timeout when CONFIG_HZ=100
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, David Gow
 <david@davidgow.net>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner	 <phasta@kernel.org>, Pierre-Eric Pelloux-Prayer	
 <pierre-eric.pelloux-prayer@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 kunit-dev@googlegroups.com
Date: Mon, 14 Sep 2026 13:48:36 +0200
In-Reply-To: <f570ea7f-164c-4232-85d8-14604baca607@igalia.com>
References: <20260913084155.520015-2-david@davidgow.net>
	 <b4f017cc-3dbf-416c-b456-0c19d2f0647a@igalia.com>
	 <0ce1883f-7de3-4a16-82f0-c8950459163e@davidgow.net>
	 <f570ea7f-164c-4232-85d8-14604baca607@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 0caeec876783032458d
X-MBO-RS-META: cpfqec6bmbydshw5zw9myphmmthryz7d

On Mon, 2026-09-14 at 12:21 +0100, Tvrtko Ursulin wrote:
> It's not a loss really to
> skip the scheduling quality tests on more platforms than strictly=20
> required so I'd say lets go with that.

Does that mean you agree with my idea of having two options for
building the tests, one for sanity and one for performance-ish things?


P.

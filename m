Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F23ACA41
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026703; cv=none; b=IS42II6wmhr008TQ8ZxtnARgohraD9YLuMbyH+stXnsRZ7qL9OnqjVO4ies+ZzhiEQ809hmB3wIfDGuBmHhe9IhfzlyZPLk+qg/mJ4pyZ/6CAOG31beQL7OSdNa8gNOktvgRI+TKsWo94VoGx+mT4kb7AnOJJb3BgDTRDH5hCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026703; c=relaxed/simple;
	bh=9i98Lxl11W4ifVj7h5KR5plC/gMeZWUx0yZ71wgtAUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPie61oSvA7WG8eGJmKxl5TvWjgj6AypiEKnqZGr24NLvVxhFWm9pdlF0VxxUM7BFMhF6J/whmmIrG+QrAHSo8a887vvhSFL0dVV+NGn1JH5CdatFUYhD9aibjqp6nqHcs1YUtRi/TsjYuTv91+D8wv8z9ZKRULPkKc0nHRCr2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzbMx5kC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzbMx5kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD10E1F000FF;
	Mon, 21 Sep 2026 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790026701;
	bh=phMQBWz/wws+nktLj9cdk8w8ykG0qqRmsg82JMw3WBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LzbMx5kCWXvPsn2ae9BnCBk1xDUS2D2f8+LWWNZarL5eVvNeI6IoOZC63H3h5U3gm
	 xlpMp1HFm46WRQMJFRxjtSMfLDnfeXlrxbToGm8yP25f3De+hRpJK3ZyCncEpNIzbw
	 6qVjkFc2UZeDIm9CZ0g8iGVOrBG8SzwQ8KTNGrPrXFYVMOGmf3Byd9FTSaqBjjTPCm
	 grqqV4s4d65sDDrhpVlTWerqZiMDeDteyacEyCtZqI2g/xBj3YpBzObaCGO5gN4NYY
	 gWj4PjTWvbLehPLziRyLMm1/iMXpNaYfxM80Sib16YySUqmIwarqmVif4bVoSNfaX+
	 7LWCkxYjy3A3g==
From: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Anton Vorontsov <anton.vorontsov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Cross <ccross@android.com>,
	John Stultz <john.stultz@linaro.org>,
	Andrea Parri <parri.andrea@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pstore: fix two ramoops error-path bugs
Date: Mon, 21 Sep 2026 14:38:18 -0700
Message-Id: <179002669562.2207525.8648410923521901493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921202317.70595-1-parri.andrea@gmail.com>
References: <20260921202317.70595-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 22:23:14 +0200, Andrea Parri wrote:
> Two bugs in the ramoops error paths, found by review and confirmed with
> test-only reproducers against an unfixed kernel:
> 
>  - ramoops_init_prz() stores persistent_ram_new()'s ERR_PTR in the zone
>    pointer and returns without clearing it; the probe error path then
>    passes it to persistent_ram_free(), which dereferences it and oopses.
> 
> [...]

Applied to for-next/pstore, thanks!

[1/2] pstore: don't leave an ERR_PTR in the ramoops zone pointer
      https://git.kernel.org/kees/c/70fec428c845
[2/2] pstore: reject persistent RAM zones too small for the buffer header
      https://git.kernel.org/kees/c/1b30df8662ac

Take care,

-- 
Kees Cook


Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449544F052F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534652; cv=none; b=PJKXT/hCx2Rrzt4T9t2bMebHa7iH7919Z+x8zfd5PpxThu8aSr0/cwMUPbf97B9cWlk6PcsTpFqspfnpoREvmvC+Q8ydM30iHNthnjKNX/qYuXYYtFh5KvDfPATTwgnQyx4JGHUdGL9UpXOrOMMtBeqdU8mT3y/uDW7c7MjUM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534652; c=relaxed/simple;
	bh=aW/pcE04K/OsY/xbAqubhsPkwKikPAMilPe4AB79HPw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb//2HTjp/4Eafp8KqNvLfTf3ALbR+Y5VLsiDnVM2Rc/5REMdujsybtFKH+7seGS/0Hb7mjnbwDHD9hspKvtOnRN18edPnn/Mgfe3ALEEXWiJacUvVN7fTLlUURV6YiY1bL/E9nfHoe2n6ERj5Ie9r2DrIb4XCPnZAkK/kY+cnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TCU8caFg; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TCU8caFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788534639; x=1788793839;
	bh=aW/pcE04K/OsY/xbAqubhsPkwKikPAMilPe4AB79HPw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TCU8caFgejpZHWY1guKfsU+JAGYqXjOO6OmRjj33lX9q8pcX8ZAaOSW95ssrc0j0o
	 SXr2JSnKFsqWk9UvFXfiKkJxU4MAw77ARraQrOdL7vuPHJUNwvUnrru2VfzB7zLpYs
	 eO1Axx3CUkRGFB3wftEP3htE4BMpg+mYP2FDHdbLxaKEKe1GtOWwuStpyoEbgrXCbg
	 LtcZroBOAuBWfMQO5I07VyE0WMo4kJviYglBLWA2H3Iw9XqO8O88YkckQbv2DST8MJ
	 8EYDvlhVlyhVFgX+bsgOhYnHuTifzcMeC8ZqlJlPXhiK5ys92OwIxQKbP9Jn3tanSw
	 l7fgaU7PTQ7YA==
Date: Fri, 04 Sep 2026 15:10:32 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: bard.liao@intel.com, broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, oder_chiou@realtek.com, perex@perex.cz, shumingf@realtek.com, tiwai@suse.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com, zlzzm2014@outlook.com
Subject: Re: [PATCH v3 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Message-ID: <20260904151020.44426-1-lsa.uz@pm.me>
In-Reply-To: <592f3b8b-03a2-47b9-b275-b691cbd42d79@linux.dev>
References: <20260830151516.44629-1-lsa.uz@pm.me> <20260830151516.44629-3-lsa.uz@pm.me> <10c5c5b4-cfd5-4d69-8312-ccff02a2e05c@linux.dev> <20260904123559.40620-1-lsa.uz@pm.me> <592f3b8b-03a2-47b9-b275-b691cbd42d79@linux.dev>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 1a69bb4f74d225f7645d6ff76f7736c2f3e2c09b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Pierre-Louis,

Point taken on the length, and thank you for the MIPI WG history =E2=80=
=94 that is
the part I had no way to find, and it settles what I was asking. I will
leave NEWLY_ATTACHED and HAS_BEEN_RESET alone.

On bisect: the status register is read before the condition is evaluated,
so no version of that test can change the value =E2=80=94 bisecting the dri=
ver
would read the same thing throughout. What differs is the machine, two
months apart, and I cannot recreate July to walk between them. So it stays
unexplained, and by your account it does not need to be: only
NEEDS_INITIALIZATION matters, and first_hw_init OR the bit is what the
driver now does.

Sergey


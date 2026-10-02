Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04FA347532
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977993; cv=none; b=b0PcRwgmU0daByYSyIdMe53GXnSB4xDq9/xr6OuAdzB2VIPjfNVDuk6OB2wrIpe4EyrQoAgOGPClIlyT34V13fmbwz0Ffg9sP86ChZ6jZa8LC19Or3dKzbpVHyR54aGaG0xCNCD+wPZx9XYwMw9hJ50N5nBAkPE7OE5JnjvOfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977993; c=relaxed/simple;
	bh=tvMgeaa3mLhwDw+Sr6yMKLB4FG0e9FIsh294Gs8VTs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpVPuF/dP0i7+V1mTBdH91r/pcG4NDaVoQJYyaLKbHd/UBO6WavWNRvT5/NxLJC/CccyiM2+Kai04ygpLpkddYBkxeVRtQCqTbITxNbqaGninI2rV9RnqL6+nPE1/oAOtc/pSRlJ5WbmvbqlqILMaRio8reuWJosRbCN5wS0xJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYuKrJHa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYuKrJHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87B11F00898
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977991;
	bh=tvMgeaa3mLhwDw+Sr6yMKLB4FG0e9FIsh294Gs8VTs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aYuKrJHan8/ubzf2K03ZfQXmKjgjEDKn1yJ52gq42iRXsT2wS3Mfv7lgiYIDG/syC
	 mnn1/sd4jINyrrtgedMWELNUr+7xv+fNVZww1NQY3TpV1VzvKQAifN/OKp3ziLyylZ
	 5r2xpmywjkHnZkU5ujV5MT8cgISd+rYJPrwobEhdvQmhtIbD5MKkyrBh91K54Uwg1B
	 ThIzJgJtvJOzD7H6QGvlG6k67btQwg3eH4FW0mLznZhySAhB5lLYEQkdJmWsk6D+8o
	 35fOzPyb4QFoF/sCxhw38X6TIhvJZi28C/csqskWh8FW2JQantIj2u8NB/x7AF4Awf
	 M3d85zs3u5LCg==
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so737744a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByv84DjhWUtr1ArW2qNJbmQTdRXTdpB4Zu7P3H1Sif6crFiZtj9dFZuHbuMgyLoj1VkpSooIpu2aJgpGZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJicXNHlQSfmqS96dwvCM/an4LqmiEHrEVQ8fmEyAi8XLCzxOHU
	NQPWH1qWFN/iMTSC3SD8QMz1z2XwyDJuJONu6II2pGsBX1Z97tas+NnOMrcoHzqsRBXzl3Z2oVu
	eyhEEhA2+FSNYcHMRiJi+vEXf6Sy3KXzCXybXaMy98w==
X-Received: by 2002:a05:6402:321f:b0:6af:9d70:6d5c with SMTP id
 4fb4d7f45d1cf-6af9e2ed876mr2784209a12.23.1790977990724; Fri, 02 Oct 2026
 14:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <aqrHjfHwyEtRIr5S@cmpxchg.org>
 <aquWKJoP5JLP8Ci7@fedora> <20260917131712.GA1344@cmpxchg.org> <7bd2b824-4c91-4378-a817-d5ce475ea84d@kernel.org>
In-Reply-To: <7bd2b824-4c91-4378-a817-d5ce475ea84d@kernel.org>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 2 Oct 2026 11:52:59 -1000
X-Gmail-Original-Message-ID: <CACePvbUS3a+2GRMxF3yZniS_r_N_REp7PNNRt2_HvWH1MP42-w@mail.gmail.com>
X-Gm-Features: AclHuK868gG9XDOLnFOp0JUyU4V8lbtIcL-DPjMKorPF04-UXDX2NmmFoAiPgCE
Message-ID: <CACePvbUS3a+2GRMxF3yZniS_r_N_REp7PNNRt2_HvWH1MP42-w@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 10:22=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/17/26 15:17, Johannes Weiner wrote:
> >> And the limit is only an optional knob. If the admin does not set it,
> >> the device grows to the full address space, so there is no space limit
> >> to hit at all. It already behaves the way you want by default. The kno=
b
> >> is only for admins who want a ceiling, they can use it or not. I hope
> >> this would not be a problem for your use case.
> >
> > No, I've laid this out already as well.
> >
> > This isn't about "my" usecase. It's about designing a coherent
> > interface that works well with a large number of usecases, and other
> > pieces of kernel infrastructure commonly used in conjunction.
>
> Johannes, I read this as a NAK for now to the current approach from the m=
emcg
> side, is that correct?

I will let Johannes comment on his take. Here is the TL;DR: from my
point of view:

Johannes does not want to allocate the vswap/xswap entry charge to memory.s=
wap.
So he made two requests for xswap to move forward:
1) Must not charge to memory.swap
2) Make the xswap initial size large enough

Regarding the first point (the charging problem), Johannes later wrote
up the two different use cases very nicely here:

[1] https://lore.kernel.org/all/araWKyJ5MENBwXCL@cmpxchg.org/

So I am not sure he is still going to NACK on it. I wish he had
outlined a path for usage case 1) in that email.

Zswap currently charges to memory.swap when allocating an entry for
zswap. So I consider it a user-visible behavior change; we should not
silently change the behavior. (Others disagree because current zswap
shares swap entries with disk as well).
I am hoping that we can find some way out for the charging usage case
1) in the emali [1] e.g. have a config option to let the user select
which charging behavior they want.

Otherwise, we will need to find an escalation path to resolve the
different opinion on this.

>
> I've tried to follow the discussion on the other thread, but it just expl=
oded
> and some of the things I read there made me rather upset late on a Friday=
 evening.

If you want to have peace of mind, that's the wrong thread to read
late on a Friday evening :-)

Chris

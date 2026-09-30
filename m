Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D1443C2F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801949; cv=none; b=lMRUHKdIaAm5a4mBqDgpAKJTHPbzWysPIs/sc3Hu+8PtE3E1/gXp5Kfu1DM+NZbTUkd3XnMe9uctFXxwEMEJvvXCpukC64M7mXLkitpXtGg4o0uw1FwBacDDW1KlHq3/UBreL3W/Qw+xcflMVIza0vhUcPOEZrSX8I2arj1k8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801949; c=relaxed/simple;
	bh=ETyIYD8SndBjLIiRXQ2bmUr53dhg26pl6CRuNTCklv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJfUn+V85Rl6UC1ckQEc+/iZwu+PsaE3dl48/SQT9Z47IyImFcH3VXS+qWvdMHAE8LczItkYAp2BTUHgZ43McWZSZvj3dirUNFWCd4qZX83n6FFqKiMQywUNNluBzwiYYsWv6vtunrfKTSfMA0A4oioSS+CF5wLI4w7ORKgxvi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5pTMj8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5pTMj8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9D01F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801948;
	bh=ETyIYD8SndBjLIiRXQ2bmUr53dhg26pl6CRuNTCklv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P5pTMj8dRh1bjZCCsV+KLpb7Ixrbe8gBYrehXGvajrIv7Sj1q/VOWlMOsEecbyCuo
	 QquiDe95zB0X98vqkxQOQ9spOjOjJsBvI30Il6XhK0ZB+rncHQ13ph0ZOUmQRaHhoM
	 yw2q56Q1eUwMuuj+mq34mmPft9Gpy6CEryzdr/HRpK/+xrFrYn34sQ8xn8Rp0zUumW
	 qmvrcQPw4yOFdHnKoQWNqbxxaIj0J6lOYvT3eYThLkSRsxoj0Pl+eFgOjx8fkaYqmT
	 SdHr5E9DYUKlpmH3VqyxKpzIrz7QavkwsBTjf+rGN0f79cy+JgR+5H0xUu+rCCFYSR
	 45ddGkvtE4Ozg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so815981e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCt5H5VOKe502LqiBG/JgJh5nb06MmG5HNSHxJ1t8eEs1Hr8AlPrJkFRTBbirkY4UL+8J/Gwz4LOSUzdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdiGswyponT7vn31ftMqXRzqv3u9tUyH+K9rcFktOiNWDIP5zA
	zN1CqFtFBC3P3CenQk3JWZfm5jBCUnJfVWkBq8R+6rPJsv19kvqHCbyWZQCEW1mbVlEl8pYc/VF
	wXVLpiVZveRJ68ADZspL8tvm3djyHSOg=
X-Received: by 2002:ac2:4307:0:b0:5b6:4ad:77b3 with SMTP id
 2adb3069b0e04-5ba405febaamr906645e87.27.1790801947027; Wed, 30 Sep 2026
 13:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-8-will@kernel.org>
In-Reply-To: <20260918161407.2300-8-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:58:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBksuXRxajC0Lje452i2=xg-Qew1_eWQQ6CM094ErGMQ@mail.gmail.com>
X-Gm-Features: AclHuK-A87jC1Nbt5gmaSaWdd9HGjM0ZwIwCU4mh03yPLkY78y4hcYrE9xtdyio
Message-ID: <CAD++jLkBksuXRxajC0Lje452i2=xg-Qew1_eWQQ6CM094ErGMQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the bpf selftests with the new register allocation.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

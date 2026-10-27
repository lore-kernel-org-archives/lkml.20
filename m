Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107109;
	b=w9pCiJ+zAQVEEE+PWbO2eaRZrtdw5egDT9Y1J2An2WsMtz6mIbrXOj51IsgF0gSuRKoG
	 rAQkRAyrgaVW5vMvlx2lPK/s0kPhfa3XVy/z4A08ntF4E6/NibtfHexULEkT624Ci6225
	 f1bmcM29tCV70wFfGaZcVdwGCjChESCgzPNvKsSFdSrj3wUuSRSra4YBn19/Ns15l2Cu5
	 7szKsrupiqxwKK/YozhpkYPuZp8H4VO+UL9gFTOKaH6YeI4JTTZcwMQbKPmW92ryxYyVk
	 Lh6d/IxwnDXLLpaRpWTNJ6ykzgg8LnrAw7/Ade3RVHR/7yPMQtprt/sWD/jbqZT3RPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107109;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=PWeOBryevCm8q/A7sxlX/iP0oFz7HX9qKQxKArV12Iw=;
	b=OLJAkDMmQIiW8b6cj/IzRog3QFMzR/1ftBhyRzRilVxXVLLthqU73br24KOnfgYexWCT
	 i1SJwEJnG3oN6y20Lb40geX0HaFISLucCiWfjACcnikbR4FsRtPfdXh61wkYvc0EN3PTW
	 ssKT3tu1ANDAxcw7BUvv/jbacQcsvJYX7LwEJR7nhT0oGFuyQ2EJlqc/drv75g+ZvjH9l
	 bzgIJ9kTS0Io8awKfbnkfxKcwvldAGnJSohyhQFNZR9auh9gNFrMv4vMXnOk7SUC7QTrZ
	 ll912ao78MDgp6rOfJLnvJ4EX0htCDO9GrJKnH1edKkLHVoVSdZEvLboWIDs+g3RyWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=iVCr79NK;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12419606A31E;
	Tue, 27 Oct 2026 13:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12419606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=iVCr79NK
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jDWJr2jMBzKpLX;
	Tue, 27 Oct 2026 14:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793107100; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWeOBryevCm8q/A7sxlX/iP0oFz7HX9qKQxKArV12Iw=;
	b=iVCr79NK6XGQ6EgNpNOD2bIXbXL4I31nNsALqsgJRAan4PCZUas/ziri01k+UiVvLsQycr
	jEGy6QljBosVW5Jqu3A3FRH9PvEPpuR1SGd/VF9yKM8tiw3qKMJDMTnIN61hfHzO9OAalg
	+R4lzNj7N3ZHiyQkid3xUbPsvyYN6df7DO+vf2+mhbILym7f7VNh7w6qtP3E8pLywHmgky
	PNA+zG+e/z3TjI0CHMJMq+oEv4xqQ4um8e04VeTmBtozNA74R3z1gtrHt5WAgK+sTPgwlY
	jVLHV3f1canVotp7+7KSY9bxJDhgRLuFMtxsVimGTIwXsp7syZC2oZLllN1x6w==
Message-ID: <fd9cc070b3a4e28316ad2ffce942227e33974016.camel@mailbox.org>
Subject: Re: [PATCH] drm/amdgpu: Harden against potential deadlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Felix
 Kuehling <felix.kuehling@amd.com>, Philipp Stanner <phasta@kernel.org>,
 Alex Deucher	 <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 27 Oct 2026 14:18:16 +0100
In-Reply-To: <1ed5c075-c66a-4144-b23b-a9d80e1fc2c1@amd.com>
References: <20261026141541.469727-2-phasta@kernel.org>
	 <bcd63af3-d2ce-488c-ab96-2b11536cd50c@amd.com>
	 <1ed5c075-c66a-4144-b23b-a9d80e1fc2c1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: buiiipye989ra698z48roho9cbycqgfu
X-MBO-RS-ID: 7b35dd1fa6a48d1be36

On Tue, 2026-10-27 at 12:51 +0100, Christian K=C3=B6nig wrote:
> On 10/26/26 19:31, Felix Kuehling wrote:
> > We don't implement ops->signaled, and we explicitly signal the
> > fence from SW with dma_fence_signal or dma_fence_check_and_signal.
> > So the signaled flag should be the only thing that needs to be
> > checked. The flag is only set while holding the fence lock, and
> > checked while holding the fence lock. So in theory, relying on the
> > check in __dma_fence_enable_signaling should be safe.
>=20
> I actually had a patch to remove that one send out month ago already,
> it was just never merged.
>=20
> The call absolutely doesn't make sense since the ops->signaled
> callback isn't implemented and the bit tested before the enable
> signaling callback called.
>=20
> I can take care and push the removal to amd-staging-drm-next when I
> find time.


OK, but put me on Cc please. I could need that change for my other
dma_fence-ish work. I would post the removal as a v2, too, if I don't
hear from you mid-term

Greetings,
Philipp

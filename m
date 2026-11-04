Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802028;
	b=Hopce10hrArfLsQFczCm7btjANbMnmjeZ+kmR64H8aDbGvq5qvgLg8O2zKdIWehxutl3
	 Wm/23sSZ1IJUk8AEzXMJbeTqXEVEOG8jGETJSnxWvL6HfEXO/8WVLdjlQ6CYetd0ZmjUc
	 Ub3P08sz6HnZ6WMLRzcflSjdbb+VCUj3nhV6fWyLumiu7C5F0IN6N9/ZAzmC70HjbGcA4
	 FvIvEXK/b/sAx/1DT68hZ5woeg9zAzniKipcn4jJDM2UbQbgxUUJx3MqgSejad51WQExd
	 LA18MsIc9ngjYJt0kvJUEuwTm84VevgmyiCQ1CnSLx3aQFnVESa29v4bc/xWt471Gew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802028;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 From:Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:
	 To:X-Mailer;
	bh=m/NZtHpS1SjJGqrEJRDxwvaLB3PXvzyilEksZKPIUz0=;
	b=KQySlABgI1nMBVMg3O5puqVWYYMmpauXH+2Zm3luCrR9H3zu7nxI26dL8ZnKKG6CNq3l
	 ekdBbWZCdZNhAXhKV6M+vWW5ps8iYsHi5J62Jtsz7M08Fnm8Zr/v3By9xpMEJf5YPi5pI
	 UAH19J0cScT2YNYS7xjtQczjqDpADEcwW2VngyfZbt9UcA2rmIJ8tmqEf3P8ZjyMzg5Hy
	 4gDK0ZEVwunSKjfrd0s8vU0fbhzc8XN6R9KQyprxECr+kKip+rUvffjFRzT5Rd5P4bJly
	 xT7kF4vcoeLil6I3cwjNCm1pfZR/LkEHvP4lB3Z8bEaGEiClPBci2Eq+XgTaUrwjzBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jGv9fWpQ;
	arc=none smtp.remote-ip=95.215.58.95
Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3D606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jGv9fWpQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m/NZtHpS1SjJGqrEJRDxwvaLB3PXvzyilEksZKPIUz0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793802025; v=1; x=1794406825;
 b=jGv9fWpQmTdYWYoxQBN7ogkIaGZJPDvSguBCljUwRGytolBnLPSp3IxKlrqeQCk4MkCu+niW
 5B3o+LgPTiPxBk4q/HoZkU6fIvC+9bdK/tLJimgG853R2fenIA9gEnD7wlJoB2IrZF3tyOxY4NW
 qKKSh7G6qnfAatipvVihy7uM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d550583e712d362a;
	Wed, 04 Nov 2026 14:20:23 +0000
X-Mizu-Trace-ID: d550583e712d362a
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
Date: Wed, 4 Nov 2026 19:50:05 +0530
Message-Id: <BA55AB79-324D-4CED-8957-3940BD77C541@linux.dev>
References: <CADnq5_N0RFH=n05T_zKSApGB+3o29Nx5rNMOZt5kWzZWxpgsrA@mail.gmail.com>
Cc: Ed Schofield <ed@charmerstraining.com>,
 atharvatiwarilinuxdev@gmail.com, dev@deq.rocks, alexander.deucher@amd.com,
 kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <CADnq5_N0RFH=n05T_zKSApGB+3o29Nx5rNMOZt5kWzZWxpgsrA@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPad Mail (24B119)



> On 4 Nov 2026, at 7:37=E2=80=AFPM, Alex Deucher <alexdeucher@gmail.com> wr=
ote:
>=20
> =EF=BB=BFOn Wed, Nov 4, 2026 at 7:52=E2=80=AFAM Ed Schofield <ed@charmerst=
raining.com> wrote:
>>=20
>> Hi Alex, hi Atharva, hi all,
>>=20
>> Alex, I'd like to withdraw my September v4 submission. I also don't suppo=
rt
>> applying v5 as posted or the simplified patch you attached later in this
>> thread. Please remove my Co-developed-by and Signed-off-by tags from both=

>> versions. I no longer think deferring UCLK is the right approach for the i=
Macs.
>>=20
>> I also excluded the MacBookPro16,1 (020f) from v4 deliberately because a t=
ester
>> found that with deferred UCLK it still hung after login, as it does witho=
ut the
>> patch [1], which seems to fit Andr=C3=A9's PPTable diagnosis.
>>=20
>> Since then, I've been working with Atharva to get his native-5K iMac supp=
ort
>> upstream. His patch initializes the display before the SMU, which has als=
o
>> prevented the boot failures without deferring UCLK. On my iMac20,1 (0218)=
, 13
>> of 20 warm boots failed with the upstream order; with display first, all 4=
0
>> boots passed [4]. Another tester reported one warm and one cold boot, bot=
h
>> successful, on a 0219 [2]. On an iMac20,2 (021a), changing only the
>> initialization order improved warm boot success from 11 out of 20 to 100 o=
ut of
>> 100 [3]. His patch only applies to the iMac20,1 and iMac20,2, so it doesn=
't fix
>> the 16,1 either.
>>=20
>> I don't think the iMacs and the MacBookPro16,1 have the same problem. The=

>> iMacs fail while amdgpu is loading: the SMU stops responding to
>> EnableAllSmuFeatures (message 6), and the probe fails with -62. With the
>> display initialized first, the same message succeeds with UCLK included,
>> and the iMac boots normally. The 16,1 loads amdgpu without errors and han=
gs
>> later, after login, with or without deferred UCLK [1]. So deferring UCLK
>> seems to help the iMacs only because it moves the enable after display
>> init, and it doesn't help the MacBookPro16,1.
>>=20
>> I have prepared a draft patch with Atharva as author and me as co-develop=
er,
>> incorporating his review feedback. It combines display-first initializati=
on and
>> native 5120x2880 support through two tiled connectors with suspend/resume=
 and
>> display power-management changes. The current draft is here:
>>=20
>> https://github.com/edschofield/linux-t2-patches/blob/7273823e425200e9f371=
e9272e02ebf9abb6f1c2/7003-amdgpu-add-support-for-5K.patch
>>=20
>> This has passed some initial automated testing on my iMac20,1 but I need t=
o do
>> more testing and get Atharva's final review and sign-off.
>=20
> There are already patches on the list to support the 5K Macs:
> https://lists.freedesktop.org/archives/dri-devel/2026-November/610011.html=


Those patches are for older non T2 iMacs. We are discussing iMac20,1 and 20,=
2 which are T2 Macs.
>=20
> Alex
>=20
>>=20
>> Alex, thanks for following up on the boot issue and checking with the Win=
dows
>> team.
>>=20
>> Best regards,
>> Ed
>>=20
>> [1] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5646=
139127
>> [2] https://github.com/t2linux/wiki/issues/743#issuecomment-6083265811
>> [3] https://github.com/t2linux/wiki/issues/743#issuecomment-6131809640
>> [4] https://github.com/t2linux/wiki/issues/743#issuecomment-6163146905

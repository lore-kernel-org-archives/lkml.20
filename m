Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555221;
	b=DosL+nw+OpBxbU93y2ck8WO9JC1IPiI3FwmoOo6di58Bxmeb2pBBsl9JFSbi8bEkLfvp
	 qrYkttK0jYY2gfP14cbskjWaxogEAWsQUEelvxHbYVT1A2mYgPnaCtp2kMK4yHxnr75Kx
	 7Y2cxBZzD5BI6+s+NFK9261d0xXBcnd3h9PFbYfPsfa2hdYZPE6bnanBOdxXGd4dlShFt
	 Pjntaueo8OtJJXBGFQAYhIm/JEAwib9xeanAY7nH1jJKEy4mGkD8UD9VqYbJ73+PyX+LZ
	 iNbngjhSQY35A0fcU6lg6nCNe15IRLiLggMrsp4KadrQxMgO304+e15ti7VxXYH8X5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555221;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=PgehQJukNosBI4Ey8kn16RcxGKLh0w5urajR4XsZi9s=;
	b=K4SK/sStwMQ2PFJWBxmSu1W7l+EEKaHEWSNmMsoKZuq32M63CdzK5Spp72XFFlxLeb7b
	 7ZFHiD3zCC/KNqXST0JK/gLT730hwkowC2IZWoEE9HGHNT6QSs60htdKy6UbOVCq9RiEi
	 ztJNJmi82rUaPu/HaMdHem1ukH5W2xu6MR7nxTCtb464hfIG5mWkYGLTCvxRHHEaVHOCP
	 A4PuNe4vMrKb1AoDC4yfXcruUPJJh63VXeDTLCl5tqtqx6+BrVMnGI6nyBOBrjzXvlphO
	 +Q7FTDiwgQ1RJwyT30Ie7k39P8vYbN1icozkzEGQaC0tE/2hQ0T4bvKg7dHNYuERaaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=V67f8RnV;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304A606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E304A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=V67f8RnV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793555205; x=1794160005; i=efault@gmx.de;
	bh=PgehQJukNosBI4Ey8kn16RcxGKLh0w5urajR4XsZi9s=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V67f8RnV2LOmK+yh6x6egqrGU7ZRHQtvLNCz7FC2yq/Hnc5FxgoNHp4++XdwZC6j
	 rk7Ka9XKkaLZCIVCC/EL4EIY9SDe9fI4M21AflehAssNRmirjeHE32BX3uIUnLLAJ
	 H3RUsPQyPi7Ye1gyvdylFaiLyP+Nw19XaEcG1mFvViDiq3GQ2BUQ3FIOf412pGRII
	 jJ4vsTBPxftJTSI5h3c0dU9GgbzevhJS91isZjn4EFhd7CXpVFWh3HgfNlEViYd7m
	 V4MaiDd9ewpIFcbZFWhaFv6hJBU4DvLvib0csy5fiZlWt3yiWwt/Qv6e+FpLk/PW6
	 IWmLSP70hS1b4H7rYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1wcanW0gXr-010yMr; Sun, 01
 Nov 2026 18:46:45 +0100
Message-ID: <455d642847fdee6e2a8b594597037c5db9791afa.camel@gmx.de>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
From: Mike Galbraith <efault@gmx.de>
To: Chengfeng Lin <lin2530632123@gmail.com>, Vincent Guittot
	 <vincent.guittot@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Date: Sun, 01 Nov 2026 18:46:43 +0100
In-Reply-To: <CANGjgd=DvO72NiB8SC3hNEadmxgzy1niN-mnWyY-LGMJ4H=J0g@mail.gmail.com>
References: 
	<CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
	 <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de>
	 <CANGjgd=DvO72NiB8SC3hNEadmxgzy1niN-mnWyY-LGMJ4H=J0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Provags-ID: V03:K1:MFvIrVsixsVmCbVDXfcFZhlQk7b3d2Hd+o4c31sa5hKp7JBKznv
 63YiYFNlDVxgVDuuChxOdCcKqSkZqHYQgAG27WUIOPdhaPZ4AHB2WcrbxDZgzKkSXvezaZG
 pTa5Tpt2iqg3M9D846febKzvqqjhtBRCzMYJOm/7CVM+whKHxiwGM0dwttyx7J0td0ULXzk
 LoEkC6IsZK3yVHsj8xvUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+HPSjuVTcTI=;XSnEC8CBPOek4c6sb8BCFStalDF
 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
 dCzCxTstdeAAtQejQ4CU=

On Sun, 2026-11-01 at 22:37 +0800, Chengfeng Lin wrote:
>=20
> Is this the path you had in mind, or were you referring to a different
> update? I'd be happy to test another candidate change.

Where I see negative impact of the __dequeue_task() update is when
probe components compete in one cgroup, ie pinned wakelat and 8 pinned
hogs used to measure the delta between smp and concur CPU distribution
modes during cgroup vs cgroup testing, all stuffed into one cgroup.

Do whatever you like there, just keep update_curr() far away from
cfs_rq_of(se) and probe goes silent.  For virgin flat in isolation,
that was the only signal the probe generated.

	-Mike

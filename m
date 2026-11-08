Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=17.132.108.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794178780;
	b=V04POkQxitA5FrlX1Ns3WMlaLCqwSHLjnXdWeRroxih+9WBnWhQ1rze/u1dXdxa5sCHq
	 1ZdLwF9FzJlQV7c25FB8H8gWNDY+gpOYva6g0EN0hIjIkl2j9+EO1GgIPUubdWKiJ2i9v
	 14XH0aPcRlHXJBU+t2N0+WalCGOmnAyjwswQN6gH6JEcTGobwZRIJzodAYkt5STOibQwn
	 05E3JQBVXWEvjaYxExXGKRJjGz33OHG02razN78SqdpbAayVFiGl3W3CS1KliuYaZBFiG
	 Cyq4UgrKSBedEp8qVKus2H6iXvH1EhXoiaZgbKCTTfQSF3vQyJef+8lJXT3JEkPD4ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178780;
	h=DMARC-Filter:Received:X-Proofpoint-Virus-Version:DKIM-Signature:
	 Received:Received:X-Va-AV:X-Va-A:X-Va-T-CD:X-Va-E-CD:X-Va-R-CD:
	 X-Va-ID:X-Va-CD:X-V-A:X-V-T-CD:X-V-E-CD:X-V-R-CD:X-V-ID:X-V-CD:
	 X-Proofpoint-Virus-Version:Received:Content-type:MIME-version:Subject:
	 From:In-reply-to:Date:Cc:Content-transfer-encoding:Message-id:
	 References:To:X-Mailer;
	bh=ICaYkgY+1eD4x82y4nPcqDonZlWa754mDcchYkVVcfQ=;
	b=Jjgi7fn5KJuQAMKJH60WZkVaKFvqcBsndLxuSuIZ4ZdArte0PAR4dKPTB2knkEJ9DIJf
	 WLQZvw/MYiAv0jUkObpL5y0KFSTyyW1cGlnrbNRvgSDKMYfuqeiHBfSqvw0w/rmmkkFL5
	 Z3Q6UeRRcoPGZMRjyp/qeyzTMo/2Jgy9+KracxqFVwxV/U3B4oMcuyLInGvrjlgXC2hie
	 WAAqhw9TXiln6aAfGuD66YJbmh2vyYma/3FnxjMikygMQyblrXTUL3RN5rKlWnGTRb91t
	 /nNThx3/BV1OAuw49/4nHcNt9vpQxJg9yNmM811S6q2v7H9D6sF++gYFuPR+g38XZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=apple.com;
	spf=pass smtp.mailfrom=apple.com;
	dkim=pass header.d=apple.com header.i=@apple.com header.a=rsa-sha256 header.s=20180706 header.b=PEr9VOFj;
	arc=none smtp.remote-ip=17.132.108.1
Received: from rn-mx02.apple.com (rn-mx02.apple.com [17.132.108.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99191606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99191606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=apple.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apple.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=apple.com header.i=@apple.com header.a=rsa-sha256 header.s=20180706 header.b=PEr9VOFj
Received: from st47p01nt-mtap04.apple.com
 (st47p01nt-mtap04.ise.apple.com [10.170.123.87]) by mr55p01nt-mxp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TO71NMKAH78L410@mr55p01nt-mxp02.apple.com> for
 linux-kernel@vger.kernel.org; Sun, 08 Nov 2026 22:59:33 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180706; bh=I
	CaYkgY+1eD4x82y4nPcqDonZlWa754mDcchYkVVcfQ=; b=PEr9VOFjMWgMPp+Ot
	kSqhfobORPjRqsFVf/Jpiabd6dauW+aJ7oK4Ge9otSU++S7x76/XKWAXYFZwB5pt
	F6hVhRrmU71hPHbrVSXKui0/jPzlbAUr+iju6G7Jg3V0GXOfNe5usdf1/v4Br3Wq
	vdLdRyq5eThgjLMqwNcNieI0We1RTEKWDgWS/8sQ9mP8WFvCUid7+1+C84bEt3Ch
	Ad31blxzFxYGUxKnQkRwhbDP2EBS+w+DinP+3YtKmvLDxbT85wBAVdE119iDnu6K
	iVG/PDTZVT1CjjblzdJM/5nsrKYxVtsSWs3sOrPFOO/ne1iMLpZ4c6hnaCmvHvPX	sRXAw==
Received: from st47p01nt-mmpp01.apple.com
 (st47p01nt-mmpp01.ise.apple.com [10.170.123.67]) by st47p01nt-mtap04.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TO718XMNH77H230@st47p01nt-mtap04.apple.com>; Sun,
 08 Nov 2026 22:59:31 +0000 (GMT)
Received: from process_milters-daemon.st47p01nt-mmpp01.apple.com by
 st47p01nt-mmpp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) id <0TO71RD00GLDY100@st47p01nt-mmpp01.apple.com>; Sun,
 08 Nov 2026 22:59:31 +0000 (GMT)
X-Va-AV: na
X-Va-A:
X-Va-T-CD: 321bc536f9eb0ed8cf445cff6de5955d
X-Va-E-CD: d98047d137cd022abeb96a56358e69e4
X-Va-R-CD: a697a89b95da0f3e9d72380ff68fd2a8
X-Va-ID: 4a34ac8b-f7a6-4ab0-a5e6-a3fe31219001
X-Va-CD: 0
X-V-A:
X-V-T-CD: 321bc536f9eb0ed8cf445cff6de5955d
X-V-E-CD: d98047d137cd022abeb96a56358e69e4
X-V-R-CD: a697a89b95da0f3e9d72380ff68fd2a8
X-V-ID: a225a1dd-88ec-4867-8fcc-5e3d9c4cfaad
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
Received: from smtpclient.apple (unknown [17.234.221.205])
 by st47p01nt-mmpp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) with ESMTPSA id <0TO71RL2BH769Q00@st47p01nt-mmpp01.apple.com>; Sun,
 08 Nov 2026 22:59:31 +0000 (GMT)
Content-type: text/plain; charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [ANNOUNCE] 5.15.222-rt104
From: Joseph Salisbury <j_salisbury@apple.com>
In-reply-to: <au8XTBJ-xFngrtZs@redhat.com>
Date: Sun, 08 Nov 2026 17:59:20 -0500
Cc: Joseph Salisbury <jsalisbury@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-rt-users <linux-rt-users@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Carsten Emde <C.Emde@osadl.org>, John Kacur <jkacur@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Daniel Wagner <daniel.wagner@suse.com>, Clark Williams <williams@redhat.com>,
 Pavel Machek <pavel@denx.de>
Content-transfer-encoding: quoted-printable
Message-id: <67C36D1F-EEAB-4381-AF55-BF1B6B4EE473@apple.com>
References: <au8XTBJ-xFngrtZs@redhat.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

Thanks, Luis!

> On Nov 7, 2026, at 7:19=E2=80=AFAM, Luis Claudio R. Goncalves =
<lgoncalv@redhat.com> wrote:
>=20
> Hello RT-list!
>=20
> Joseph, copied here, asked me to perform the v5.15-rt release this =
cicle.
>=20
> I'm pleased to announce the 5.15.222-rt104 stable release.
>=20
> This release is just an update to the new stable 5.15.222 version and
> no RT-specific changes have been made.
>=20
> You can get this release via the git tree at:
>=20
>  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
>=20
>  branch: v5.15-rt
>  Head SHA1: f63f7e53a7d5b10e9074bfb35abe9dff68a5cd22
>=20
> Or to build 5.15.222-rt104 directly, the following patches should be =
applied:
>=20
>  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.15.tar.xz
>=20
>  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.15.222.xz
>=20
>  =
https://www.kernel.org/pub/linux/kernel/projects/rt/5.15/older/patch-5.15.=
222-rt104.patch.xz
>=20
> This release has been tested under KernelCI as:
>=20
>  =
https://dashboard.kernelci.org/tree/stable-rt/v5.15-rt-next/v5.15.222-rt10=
4-rc1
>=20
> Signing key fingerprint:
>=20
>  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26
>=20
> All keys used for the above files and repositories can be found on the
> following git repository:
>=20
>   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git
>=20
> Enjoy!
> Luis
>=20


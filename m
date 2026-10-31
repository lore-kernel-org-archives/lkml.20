Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463616;
	b=n/JNVK8LhMIPPgKu4BsTx5yNW/TshkX2w+KRYdvUBQT9rKoNwjNFLAWZHeP0hTaPO6Kz
	 5PIMZ1psiGfyT8rkkI19xMwWaTT8AV2okC+dYD+YiqHb+1jmhB2jSVdtjtwvb5g6aC1kV
	 nypjGp4nWMgh/RXJKhmYf3JlCi76ZnQCA0RxETap/pf8eh/3BqadUWKjgXLWOzNQhQ2QR
	 9qIis7kX1P3hDyUzpwm3h9t6tMq3ts1ws4qEP+D0VaPhHY3xd/6BOf8fN/7Bn2OZwBdVa
	 644YW8LZEwTMHQXNSicNTS039+F0iNogcdRgBxjIbocCIubhP8OVrTy/JJ40XkBfbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463616;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lmWTmNuesxAJc0uIdXgg1Y/3RQtDi2m58HS/0OcMlyk=;
	b=AESIx+9QyQgjD3Lffx3Up2CGOMMY+FG1UvZ05fB1iEVkGiliappFc4VWm+UvLxj7Cb/3
	 3IvtOhENJdnYyobXXIKx+h93zHRXOAz4PfLl2MfT345DInOzJOP60XQ3M87Cg8KulmsM4
	 2I3/T7jUrHsMrIdZJe4NxDBArma+pkliOel7qG1PMV8q4pF4E9wQjtGKYqiYX9TfXjp0X
	 kMKvyCP+7e1Gh/hyAjsLWJ4UtEnkbdJj7oPr8FjFpsGe46AOpJVPm9bKJ0gKUIFTAXHeC
	 uRNWcY7RKxxolBlRBO5HBn4ei0oS5psHcIQkgmgoSBPZeHAmZw/72JNTCq8EjiGiv9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=zQ8+bq8P;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D541F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=zQ8+bq8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lmWTmNuesxAJc0uIdXgg1Y/3RQtDi2m58HS/0OcMlyk=; t=1793463615; x=1794327615; 
	b=zQ8+bq8PPCypUJUGwYV5ivu+HtGExZJa75cbnVjvraiHyNPhSzFzojXz/CIUc40MPOS19XXDpq5
	z7/NN0c5foCZkHDgv0keU9O6Os4NwEkKVA8BzqycYHd+wcMVJL6aBGx2o8hgEpDS6HnmXSO7mUG1P
	LImxoLd8YwWwkS1dkoZbEDLO7R4Vhnd9rM/oBnrOoh+6KyKTN/Ue568ZxFqOTgb5mPap6IEnfHMdk
	mIrYND05ywPpX8Sp7nu3xEyvOs4aNt4Opmb0JPJBavNtfrPONKEbAqb1+RdbCkhYpv3f5XO/al7rw
	WThA6XOUMqHbZ8ey8DLEHcFQRPpBfFiZ/qfA==;
Received: from mail-dl1-f45.google.com ([74.125.82.45])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBoV-00EgG9-3f
	for linux-kernel@vger.kernel.org;
	Sat, 31 Oct 2026 12:20:15 -0400
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso1457780c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymHiTuo1H1Wsa1bDv7m02+8n01ydGhAWb/MKM2lFlumHSgHsF28SMP+TpNZ7wAsm2KBFypKBbN+3Gd80A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0bMSJN3aN3h3t0FSKRWX9vmFNqHjPHl+9azfQY5H5GpiSFQT+
	LP6pw64m3f1xak3p84enA+xIeqgmoMQ+Xda97EUDQyCdOpIuRWYwhgtKMEhV4KB5nv+hUDRNmJm
	AB6X0YyAv25mHFZLkJ9RsvzP5DgdDjhM=
X-Received: by 2002:a05:701b:4644:b0:1ae:b906:773c with SMTP id
 a92af1059eb24-1aeb90678acmr3333147c88.47.1793463614161; Sat, 31 Oct 2026
 09:20:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016160708.790397-1-nickolai@csail.mit.edu> <auUP2yrVl7lwkNkC@Tao-Chiu's-Mac>
In-Reply-To: <auUP2yrVl7lwkNkC@Tao-Chiu's-Mac>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 31 Oct 2026 12:20:01 -0400
X-Gmail-Original-Message-ID: <CADGQE7EUcOebpYG5_R19d0NhukBjZxPiShEgHeNd3Y2i13SS8A@mail.gmail.com>
X-Gm-Features: AclHuK83lGOlIj8EgJp99GFL2iWJP-4RbsNCMWo5hxhuwya0BJw1cO0otTZXMIA
Message-ID: <CADGQE7EUcOebpYG5_R19d0NhukBjZxPiShEgHeNd3Y2i13SS8A@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: signal: mark the FP state clean before
 restoring it from the frame
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
	Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:45=E2=80=AFPM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
> I would prefer adding this into riscv selftest just to keep future
> developments intact.
> [...]
> With the v2 patch from Guobin [1], consider something like:
>
>         if ((regs->status & SR_FS) !=3D SR_FS_OFF) {
>                 preempt_disable();
>                 __fstate_clean(regs);
>                 preempt_enable();

Thanks -- I just sent a v2 with both changes: preempt_disable() around
__fstate_clean() and a selftest in
tools/testing/selftests/riscv/sigreturn/.

  https://lore.kernel.org/lkml/20261031161826.858908-1-nickolai@csail.mit.e=
du/

Nickolai.

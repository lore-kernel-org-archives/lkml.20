Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627878;
	b=YEBponn2JfkkciK8wtinFUnRSkBzHVFLTkZbJxM5E5VCbCbMlha/hIlbNE8LD+M+TRHj
	 jUn6RCP5qTA/0svor8BrfH00/eD8Y69y2fJwQuYJfDN9HPCAfG3kTMuXG+3VMaLQxQspR
	 bpZ1jNtuQMWPf1CJhUYSuDHEPv8iyFPcUrpKjQmCCba0ycYSh2Jnlc/IRtlm03lxqNUvz
	 VdG2Wp72HaUzF8HW31Giv1EOcHzGYOLVf8qGUnz0IAZQCyV4IG+OHPXlz9MkTsGS0InYN
	 l+innp18aeL1evTrPUjJEaOsgVA2qOFlvWHLQPexECstpaNXjxNaar/2BnwfZ2M0FRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627878;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=CmrgtoxGAaP7jc9wRpc133vbyseqmlcWFNNve+yauqI=;
	b=zp2juRcHqe29qYbKtycTr/1VZNDfXClW7iNQGQaRvSO/WPWg776eBq/fkZvC8N4lVhU8
	 Gt+Wp/AKHoJsniEp5ZiwvAy2g619ovYFXYkSCdoxrZSNlkbc1d9UdeuGj2xybGQ5k9Ry0
	 sJ+I3nyjjYmatNlcGagjBkxkQBzPC0jm0EX1J3dkZhNrmN/5Bc+S/c+2Gji72rDn7x7mm
	 JUM6kjuHmkDXPs+TwXNlmffee23ZqVdyumqxXaFH1sPq3v5zsv1Ubd4H6uwQirvKQZXf1
	 yNkHWalLFM5u+ESRC+jywevGY/0ryeX7D1LjmbmLJvaLFBzbkoatz9RZ7VUz8dJ1KdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6PSG5H8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974E60A382E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6PSG5H8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B001F00A1A;
	Mon,  2 Nov 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627877;
	bh=CmrgtoxGAaP7jc9wRpc133vbyseqmlcWFNNve+yauqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N6PSG5H8k2TyExe4ojxnbtU1l3+B92vzcVgG1TJZ3iqj1ooA1Z1rShwNOw6b8co/D
	 QIEKlpkqmib2nT6FsQRGDtXVAmskIbkCmN07Pj44Rvt/wyhHNAb/kLorvMuugt3hjw
	 SjQAlK1/aOI/4zCRRB2QwlMTlP+/vdJHUHQalKZYYS4uL3hSDUT3R1Wsr0/V2zpYbW
	 9HBSogUWxF76DEdF8b/d/j3l2jSfPmHXOwuv/m+NiyiBa8oTYlT4hF8xK94u6XEqux
	 8Mfj4aN+Cpt0a8wMhicaFkOZT5XK/XjX6kQQGmUDxRpWrKKPKtAhStf6tXKTSftBtc
	 q9BwK5UxDJUEQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Linux Memory Management List
 <linux-mm@kvack.org>,  "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
  Pratyush Yadav <pratyush@kernel.org>,  linux-kernel@vger.kernel.org,
  oe-kbuild-all@lists.linux.de
Subject: Re: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid reference
 to the index variable of the iterator on line 553 (fwd)
In-Reply-To: <a1b79e2b-e960-b6de-9139-fbbd13bfb2b3@inria.fr> (Julia Lawall's
	message of "Mon, 2 Nov 2026 00:20:41 +0100 (CET)")
References: <a1b79e2b-e960-b6de-9139-fbbd13bfb2b3@inria.fr>
Date: Mon, 02 Nov 2026 14:57:54 +0100
Message-ID: <2vxzecd3mj31.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Julia,

On Mon, Nov 02 2026, Julia Lawall wrote:

> luo_file may point to something random if the break in the
> list_for_each_entry is not taken.

This was fixed almost a year ago by b2135d1cb0e36 ("liveupdate:
luo_file: don't use invalid list iterator").

Perhaps check why the bot is looking at old commits?

[...]

-- 
Regards,
Pratyush Yadav

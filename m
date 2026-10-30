Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387889;
	b=2Q9z9f5HuQ2DygrP5hQn95Wy1NNRlVkFQulPcFjXvPMAF5qsAMh8pIeZwlbsbshGJkzk
	 FSQGemZ4TB8vaY4VN9pFkJsuGHo9aGmjMid+/56qS6yqd0gb1XZW4eNEkiHoJWFqwlZQJ
	 tYlyQ3dxPBCas3/xdkWM32DJUasKgde9h9otXJDgMoAkODUjw7oquON1+ltvsifa2TT3x
	 tcecm4719h+9dPJ3RXCClYbX5uL4G6TH2bJfY7ePiSIrDz8MWp04gJbiElZUd+XFdgxkY
	 3D51ytdUn4qL58GNnYf4OAowiIbwBFKMfbhoOT7rPkUS2O7odqvrs9hzFqz0gQpKDPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387889;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=Hnwtda3En570VuasR3roITDcWTvWNxziHoO86mrJNZk=;
	b=1wKE9f4xONVhMOxRYPy0vz505+betPKi4vjhAVQ5mGB6vffDBwyvgkzVU/KvoMHzK/D+
	 z5JFLSBelfNR6C9aSRglS/jZfugwEYpTKGt+ZBhzqUpPKYamNbQTbwh8BrvGlnY26oaJx
	 WKcu9lqkSnXgfnHKfCVFFEnXLEMmIxCGPJee8cxLD/DMkqUOdP0IWAT/oZrv1dXJa4plT
	 nt5Ybbc/b2lS/zSRt66+Q0G7sIsZxoxCV3c81tiecK/meyuwm+GTFMCkaMwtB56RN7bx7
	 z65RMq31SSzWQN5JxvoEQ/f/iDJG0riujHlPV0ohBTlUPiFKDHJ+QrPkS1BbPsIhIRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iDTu/fAc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335B606A31A;
	Fri, 30 Oct 2026 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDTu/fAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6FA1F000C1;
	Fri, 30 Oct 2026 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793387888;
	bh=Hnwtda3En570VuasR3roITDcWTvWNxziHoO86mrJNZk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iDTu/fAcHw5n8fVLwbZmglmsz+gb8Ao35sMFCH2hd4d6kXqUvg7vFR066gj92zXuN
	 1MGlG0kW/qA00fU2ztU9Q0TUBGoPt9gGgYEv+sSS+x8i38RLL78ptYYiBcbrUzbD/D
	 hv/r6tYJTsH4mofkq0IcuzcB+ldoAFhN7TWJU9L/VnupKTmdx868JFdoHnzipFHQpl
	 QrkkygVqklR8Xh4t5W2qY7i4+wF5vXMV6NguHFWQgMZKi7f8w0hbGeax4TDSoLvLmB
	 a2vHGGBIL1pPl24NiAPnDfLOI0kA4lU2mj+oYG1zCmsYkxVWrtRdVoR3osJ6VBJ1L+
	 udTkJhy+MkBhA==
From: Thomas Gleixner <tglx@kernel.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, syzbot
 <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: Re: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
In-Reply-To: <20261029165636.GA5110@yaz-khff2.amd.com>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13> <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local> <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13> <87y0bhy5h8.ffs@fw13>
 <20261029165636.GA5110@yaz-khff2.amd.com>
Date: Fri, 30 Oct 2026 20:18:04 +0100
Message-ID: <87jymzxaj7.ffs@fw13>
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

On Thu, Oct 29 2026 at 12:56, Yazen Ghannam wrote:
> On Wed, Oct 28, 2026 at 08:45:07PM +0100, Thomas Gleixner wrote:
> These were able to hit the new Sashiko findings.
>
> There are two separate ones.
> 1) Another deadlock.
> 2) PREEMPT_RT warning.

Grrr.

> The diff below fixes both. Though I'm not sure the if the msleep() is
> okay.

Not really.

I think I know how to fix it for real now that I understood the nasty
interaction with kernfs, but I won't come around to look into it before
Monday.


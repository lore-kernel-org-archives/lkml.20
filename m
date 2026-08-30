Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C41E1A3D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114626; cv=none; b=Ix2pE/QiVIaEfW+e5IuIalIOeA2UY8RL/JIHA3xbqeB63UMok0W/hZu6A8+hd/E8zJIgWdFlxERsqbXDOy5Gs+vu2QCWta88jrrH5L6uTD+wmd5/zDOtIkEzJe7cM9sKUFV8XLN06WVc1MJ6bbb5cETTtPKstIzuBHTeOEDUlXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114626; c=relaxed/simple;
	bh=9sfeTMitTv5W9KAnMhKLeS2vInz2Xzldffvq82npqDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZSevNIgcgNejwUF2h32bwBsY+FJ49mrBLsFsS/pKfopdylYB/tykc3QDb7LwSaxnhcuK8PV0fAg1Gskpy9LVYA64cfxrJURA7C+p92gEj2gdkOc+EWQVfIYBSJkyOrfhBmRFHMThAbuBVXtai5HKYb87bguaiSKGrXmazQxbuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZwwx0g1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZwwx0g1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136381F000E9;
	Sun, 30 Aug 2026 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788114624;
	bh=9sfeTMitTv5W9KAnMhKLeS2vInz2Xzldffvq82npqDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HZwwx0g1sutU2hc2P5YnIWv4CTBnSa5mjEyecAVpqFADjjIqEA1TRJ5/L6xq2ofNO
	 2P4+Z5psgxn5/5kW21MxIG+ls1E1Zng5UT68lKsm9Vnn1wBMvvbI/1GETlgbc7PwOz
	 eNVshiSiXEB0pHpuAOxZs3WpaJaEeYFXWe5UuGoZbXxwtSPn0M55MPaPhMQ4fq58hL
	 oomvz36EyL13Z18Sc+iXr5IbBa2c3gvHu2pDAY1b9QTsiRylvIvRoTPMzI2hjLdNfu
	 L3xWhve6YW5h/F0GTyg/ny3Lw6UHKlmLOJKB1Xvj1KtGqEbK1rDrrs86nnO70ti6Ig
	 Ke3CVlyUoBn4A==
From: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>, Farhad Alemi <farhad.alemi@berkeley.edu>,
 Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free Read in
 irq_migrate_all_off_this_cpu
In-Reply-To: <31cd7357e666ecc74b7a995641b3de3c0aa1bd0b.camel@rendec.net>
References: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
 <31cd7357e666ecc74b7a995641b3de3c0aa1bd0b.camel@rendec.net>
Date: Sun, 30 Aug 2026 20:30:21 +0200
Message-ID: <87y0dncvgi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29 2026 at 16:34, Radu Rendec wrote:
> On Thu, 2026-08-27 at 22:41 -0700, Farhad Alemi wrote:
>> =C2=A0 BUG: KASAN: slab-out-of-bounds in
>> irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
>
> Thanks for reporting this. For everyone interested, please note that it
> had been also reported by syzbot a few days before:
> https://lore.kernel.org/all/6a8c23a0.dbb3a75c.7844.0001.GAE@google.com/
> Currently there is no follow up to the syzbot report.

The syzbot report is useless. It mumbles about memory allocated in the
networking stack which definitely can't end up in the interrupt
descriptor :)

>> Our reproducer.c is available upon request.

See further down the thread :)


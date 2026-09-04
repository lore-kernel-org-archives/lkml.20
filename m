Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E751A9F91
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533389; cv=none; b=UjyYX+gCpz2oI+q9yJeY/Oy1YMpNHRYWO6tkJ5og8tYB3zbQAUkESHuq3aqJ/yGWGn33uidKVJlhTox6zGGEfBuYLr3rNffkV962JBWyXfnDLgy0aJylwdN5TJg6uwgDeXVKoCieRdEbyIQc0XVGfnc7FZ50352P4Y2uyrnUIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533389; c=relaxed/simple;
	bh=36Plo14KgAefMpDB9Dy8pviz2kZPwv6sETX9rekYKQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z0lzBTGxUFhN2DuC8rVvRILafrkJ9jpY2K025Cv8yx4PZTsj4yLguu9m0s5ZTG5+AhB4q9FBlViEwkHQLoDz+veMFE3ePoakOndNBllT/yw/kaxM9Rlyb2jWPNRcS47HGSYXTeQuPwugmjhhzIDfrbR6wjcjqhzVHLUECygmAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrZrB6+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrZrB6+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8C91F00A3D;
	Fri,  4 Sep 2026 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533388;
	bh=D8QP+kbZpQDntP1Tn0kRj3eRn2VrXYnQZO0ZaU5rhW8=;
	h=From:To:Cc:Subject:Date;
	b=HrZrB6+XKVeTKBRp6ZHAm3pMUVe/b+VHffHbaQ1TFnLcC32ptUS5VE6USRIWadLFN
	 ZT5AJp8VcE65mN4oEiJOcTp8s0+yTarqerV7mKCo4LvvrtlqQaX25R7fQrQMJ8RuWU
	 s3tWmp2vxZeP5tCwWd9IMXICnSpDXeGWmCPUiTjSe2ARmGu1YJ5a6rODeHs0FA13xO
	 IuTf3f5fNCaG/djDUVsLv5Ai6BeUgDpLWQo2s0/ADPf8kXmSdvYwaTytkTnTpszC6x
	 kHaQypMs/4EmSsxJIU2AGQ1DQ/ZpH81vplkqu2n7VE/2RbKdOgagK9SchPns9IwStM
	 bpyGN0Ouoyxig==
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Interrupt chip driver maintainence
Date: Fri, 04 Sep 2026 16:49:44 +0200
Message-ID: <871pb9841j.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Folks!

I'm wading through my inbox full of patches for interrupt chip drivers
and I'm thoroughly annoyed. The way how this works today is not
sustainable.

Patches end up in my and Radu's inbox and all we can do is go through
them mostly on a formal basis, but it's out of our scope to look at the
correctness vs. a particular hardware. In the past I just picked up
patches when I had the gut feeling they are remotely correct, but I'm
tired of this.

I've just marked about 20 patches and patch series obsolete due to zero
feedback from the relevant architecture/SoC people who were on Cc.

And I'm going to do that from now on very consequently. If the
architecture, SoC experts can't be bothered to look after their stuff,
then don't expect me to suck all of this crap up and then deal with the
complaints when it breaks.

I'm still going to pick up obvious and simple bug fixes, but for
anything which requires deep knowledge on the underlying hardware, I'm
going to just mark them obsolete when they molded in my inbox unreviewed
by the people who understand it for six weeks.

Thanks,

        Thomas




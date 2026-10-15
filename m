Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1762254145D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081176; cv=none; b=VDglWyzfLxV1omkzfsdc2OLFRINoPnDzL0FSAFH8rEokgvlME+Ktlx83annoLZvRsnzR1ZmdzIBENCFfNIlFoj+wEJf5mMbeR6pYAOA+u/+rJKnFZcNXdr2R0CPeyaul8287+MzY1/JoP3lhEAvpSo/cXlwumEH8a6rAc5i/KZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081176; c=relaxed/simple;
	bh=xMAM9hV9q3usLGa0cayv5iFXkC8RuZj89hXuc95wOgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSn3PDy96i98L4Lt/6UdXXrD9lk1qlAiGJVi+TMRkvwIH3fdSnCyKM8Hd43Tkq84kCu/UPWgSeMuml4EaKyVDPNqtVCaUw/wS5N4S7ki+jTwSDuY2n3y3hM80XTBdyjC+aq7Uv2U/Tv2sdnqT98scBSKENYaN/gQxRF4C5cc9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtIyLrwC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtIyLrwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A711F000C4;
	Thu, 15 Oct 2026 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081164;
	bh=HYFG290IcaoYwXzOqV8ubmLb8a7PUjjAS/yMSxm5KfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtIyLrwC7o10uo3W+nu328B4YSiNFkoMjs4gUZylrVfl8th8PiYT67NASOGrrNUe3
	 Y/h6vaObnRMZvvDwW6S+VwLrSrPZi9y74Yt++MEYnObU/er6Rw2j8kns8x3iM5iVVi
	 w1lqJBr/4onje4eozJoHNWNLeZfiAdcogoKAaNYYXvQ6QAOtTT/vPxb4amznD5QBjt
	 tX9eRGZJaVGaOSJKr+YR8vaR2mhzPKwRYvZMsiJiINki0vLFnpS1/8WLiA1ptXuVa6
	 PwXvPoYc/JtNZziESoVNV2YOjNuLSkYmK58lfkHUGXIOcNXN8BWZpDXXrte/n5Kjce
	 GD5Yq41nL1LlQ==
Date: Thu, 15 Oct 2026 16:19:22 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao@126.com>
Cc: Nanzhe Zhao <nzzhao.sigma@gmail.com>, Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
Message-ID: <atD9Csw1-lj5_SR_@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com>
 <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>

On 10/15, Nanzhe Zhao wrote:
> 
> Hi Jaeguk:
> 
> >Ok, this comes when applying "f2fs: carry subpage offset and count in write IO".
> >
> 
> So we didn't reproduce this bug with the whole series patched on dev-test?

I hit this after applying the entire patch set. Then, tried to bisect and got an
issue with that patch in the first round.

> 
> Thanks,
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

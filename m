Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80936F916
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438822; cv=none; b=T/b0xQfaVgCrXCDWq/haXvgI6iacoPMcI6GERAsSSPUrYMA8RThZoJPx/UFt0iphidvvng197aGpHOQF40HwMx/E8UIH5m8i5oHjAc7YA6fElpPPcZQu/NSYWmfMTz3ywsa+KkkUs3h/cbnvBmLE8vlJzbNqF5RZAkY9mMFCs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438822; c=relaxed/simple;
	bh=V3WIcEQRTUkplz72Y5jFWoKAoh88vrBG/QJC0D71vfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXGk2zeDzeARjLq5kFx8ROK+sl7P29/zbHsurJjrKRl11dzXVucm4eUXyhWMKKnvy9yj5lKCdXuYwxbT2BUgpcZFP6yt/rcfS1nWZGB4pBuIadx/jbfEBLUq1lyNO39O/vT/y6fRj6YB93tiEZyZy579MiMDekQXlwl68sKZj9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Qh0JGSOd; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Qh0JGSOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KC
	wk0i7RJofeqxwqGOpS1AKnufaHtLGBH9GfdeVSM1Y=; b=Qh0JGSOd58yOfVCSxM
	MpPzgAQO3coGLf7ChSn3dKqu8Fdgy4WrlnhjzpT3etZC8hgOQi45eLKlN0s4O7rc
	k7cITe6V8rws8FWyA1wvZfRfJ8y0i/Yjd/uAlhIrdusOUo8LvCyg3S1zzIh56izP
	OJfrtLGw8e9lMt87Lbi8Nu9wE=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnD8UvLsdq0VaXBA--.54425S2;
	Thu, 08 Oct 2026 13:46:24 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 03/14] f2fs: support regular file buffered writes on large folios
Date: Thu,  8 Oct 2026 13:46:23 +0800
Message-ID: <20261008054623.732668-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_xYg6tDsYARD_7vvBpsQWHG0EtXNG1nHnufPUz0tyZakg@mail.gmail.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-4-zhaonanzhe@xiaomi.com> <CACOAw_xYg6tDsYARD_7vvBpsQWHG0EtXNG1nHnufPUz0tyZakg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnD8UvLsdq0VaXBA--.54425S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw17WryruF43XrykWFyUZFb_yoWxKrbEvr
	1kGa4DCa4UtF9ay3WxCF4UKFZ3Gw12q3W5uay8Zr43ArykAFnY9Fs5Xas3AFySqFW3Gryj
	kFnxXrW0kry7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR4lkPUUUUU==
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsRAk82rHLjDcIgAA37

Hi Daeho,

This reply should have been posted here.

> Hi Daeho,
>
> Thanks for the change.  I would like to integrate it into v3, folding it
> into the "f2fs: support regular file buffered writes on large folios"
> commit.
>
> My patch adjusts the signature of 'prepare_atomic_write_begin()': for large
> folio compatibility, the 'unsigned int len' parameter is replaced by 'pgoff_t index',
> so that the helper can be called in a loop from 'prepare_large_folio_atomic_write_begin()'. 
> I found that len was a dead parameter in the original 'prepare_atomic_write_begin()', 
> so in v3 I will not pass blen to 'prepare_atomic_write_begin()'.
>
> Thanks,
> Nanzhe

Sorry for the wrong threading.

Thanks,
Nanzhe


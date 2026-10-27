Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117808;
	b=HKGZDb9rP3aVh7faw1YgdOYkbGBYSn/9mqcuIzH9vkM0daGXFRhOElKxjahEI+DFugrL
	 ZU8+rXsN0y1u0NvtVj2rTd4U9A3aWbZXuGezmNTi6G/BLHAuo6uJJHPHPou2UjHZ2vtPH
	 keblDlzIfdgwXmAJtC0voU3BArXjiHE7dKtplm1fex+0iwPbM8H9N5D7JutG+7vB/O26q
	 oXN77NLSb2m01tF2MLiQRfa1nreA5qxwzykq6+Znj5JZGr1CCwSAMk/ff8p8kZ7Jd/TZk
	 b4ZbL1d2put0c/g5qf+Ew4bM7YG0TtcTCo2yxJ58ZzFR0RfFUhgN0VMx96pRHRogy0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117808;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=GbocaL4tWDPWFJT66RNMeq5SQE2l2w1Jml0mjxtf0GU=;
	b=A2F04011pbhAe1aRmFA/POrVtzPUP9R+eZhGaqyaytSKJAiTX+LODiRj8obFaIWMdiQR
	 o7E3TOjiREXG6+iGNQqnLFd3zadTf0uivp6/g2wXlzz6ATPTn2O1Cm03rxkU4i6tgohrr
	 x6mCORvY/n3+SceW4jd9X5OA6aXevI2tKXX45HFVVS+zewEtQf0zunlg1PK7mZObRk6AC
	 U7DUAcc6GQqF/Lc0Sb4InGfuI3yv+n1mSYkZES58qGYZAKlfDDLVPfY0ZGgffvU5lQm4S
	 y7Kh+D2dxgAKIN+HshBJuAQ/wG7jUpItltWcuYUBGYNONkytL/tsXVu8qK04Zo0IvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=luuyMayx;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=luuyMayx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YMHm1UdhIogyYftZ2Kw0ekG8w2IuHdMfvUp+gtU8ncQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793117804; v=1; x=1793722604;
 b=luuyMayxzq/xnhIdbhVBQRImZZykPX1AWfvkSzrYCpZcUlX4WoYd9762/5qn9+shtTOHsvlJ
 ncQ5qZkEF8ALAcm51hz/h8oAH/xTcsRDAH5x0rm65/vbHp0x9zOej+r4bTmNcFvH8p7qNqWy3Wo
 UbeaQpFBQFRCP1xgfcolazToJBCtC9j5Vpku5pSpxf7yZn+jWsslEhEExzdhYICNZU9CtY1D6C/
 IfjwukINpjb54hbwtsipYwkQeUPgG3fjnLNgaEjG1BMA/tfkkvBl4rYDa/xhxOBkZ5W70R6VBvC
 Cgdx1HzMjqjlFMY9MYDrM8Dj5wppZa4DO7eGkU7VKMJKA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58fdc84ef17a101f;
	Tue, 27 Oct 2026 16:16:43 +0000
X-Mizu-Trace-ID: 58fdc84ef17a101f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 00:16:20 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 2/9] docs/zh_CN: update admin-guide/README.rst translation
Message-ID: <auDOVHHfyFRWpHSa@wyuan.org>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
 <20261027102552.3801595-3-dzm91@hust.edu.cn>
 <auCM9YrxbpXvdRv9@wyuan.org>
 <59010171-3f94-4574-89e4-b655c1c6dc30@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59010171-3f94-4574-89e4-b655c1c6dc30@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> On 10/27/26 7:37 PM, Weijie Yuan wrote:
> > Dongliang Mu <dzm91@hust.edu.cn> writes:
> > 
> > > update Documentation/admin-guide/README.rst Chinese translation
> > > 
> > > Refresh the kernel installation guidance and correct the defconfig and
> > > LSMOD descriptions. Add a label to the translated applying-patches guide
> > > so the README can link to it.
> > > 
> > > Update the translation through commit 8913632998fc
> > > ("Documentation: Fix typos and grammatical errors")
> > > 
> > > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> > > ---
> > >   .../translations/zh_CN/admin-guide/README.rst | 89 +++++++++++--------
> > >   .../zh_CN/process/applying-patches.rst        |  2 +
> > >   2 files changed, 53 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> > > index ee6dd3782f4a..050f671f8acb 100644
> > > --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> > > +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> > > @@ -1,11 +1,12 @@
> > >   .. include:: ../disclaimer-zh_CN.rst
> > > -:Original: Documentation/admin-guide/README.rst
> > >   :译者:
> > >    吴想成 Wu XiangCheng <bobwxc@email.cn>
> > > +.. _readme_zh:
> > > +
> > Hi Dongliang, good evening ;-)
> > 
> > I remember that Jon emphasized that top-level labels should not be
> > added in this thread:
> > 
> >    https://lore.kernel.org/linux-doc/87tsqytxrn.fsf@trenco.lwn.net/
> > 
> > And I remembered that my patch (apply-patches.rst) was rendered
> > correctly just using a plain path. (so I didn't add that label)
> > But I'll check it again now.
> 
> 
> It seems useless. I will test this removal, if it works I would remove this
> top level in v2 patch.

Checked with sphinx-build 9.1.0, rendered correctly on f857ff5bf007
(docs/translations/pt_BR: admin-guide: add efi-stub.rst, 2026-10-15)

> > Also, v3 of this series is pending, if I remember correctly. In general
> > I think it's not bad. So feel free to take a look when having spare
> > time.
> > 
> > v3: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/
> 
> I will review this patchset today or tomorrmow.

Thanks for your review!




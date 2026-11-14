Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666077;
	b=BBRmNnWpdDFWTzeGwnt03WvvyWlPlnMk+60zaMRsZDLq29YzB1Hhuo6fN/k4ma3QmI/G
	 zHjOOgS2xZ3koCHL8kj4/A9d2dJQzaNePPxsMbFfXMbFT5MeEvzGc/b7EGO4ZHS4ECX8F
	 Km5hdGC2gGI6vMSww3VgqVhhugEzPMW9zxpNXP1S5a5yGu4/pJiHC35ru4fyWAbpF9qzH
	 w9pWJbh3pbHYavNQ86A5wqA0S8WtZ6SmstaJelb/T00TpMnGE0W3SNCDXGpOS2WHgZd0g
	 /oq8YH2NtzcZJP0FfPSOpXE4LX0DmTVn5np6Yfz9fh0/YGTY9wD7z+3i2ggB4yIqN+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666077;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FqnHMYlKaSA8Ft2QevowFaKT6pdWror7xfjpOfngALs=;
	b=MdVigrakPBDnDPViRkPUSQAEwnVM4KdBoWFT3mqZljrTJfHKz1PD5bIqlHIgmuugQDzr
	 4bKoAOiPbRHJjSRrNEfegwHe/f/EHdlWt13LSUZVnj34Iu5wcQVjuoQLmN1uVhQExEf0T
	 tDVytsrVij8tFK7+me+kGlDIho5axPul8Y5f1mRCHOdl+XuKI6LcNCjV5F6kBLb+X6eQt
	 v0GvevlqSINWX1PuQkbptTjECDHXVeAbu0WQNcCDGR6C0/bl53rUTqSHD+ARcDbqi9dwt
	 G+Fcc5pXE5Mr5lI3dIpyBr7SbXJLKdIOtrnjAH3f4lqXdQrCTtRGj3oOczMbNBNqIvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OExVtD2D;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E2606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0E2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OExVtD2D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qUS2XBe2YZ7bGkxDICrEYx9w9WRwXYDG0onMhdWkZeQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794666068; v=1; x=1795270868;
 b=OExVtD2DREEabuKkXYf+UPbQJ2cX5VXVFhgdMx3EwH3YZMqAQzhhO2madi843LxjssRkaALF
 JGdZLh3MKjugnqwLrGArfxYp/9ekcfG4HWL7c3p6c0bJZcTxdoxu5vGAIiRlIREzqvUUqR452P5
 +h6ImIvZkhIotJ7+9zXigHY9YJsPTFNX+DuztsPt8e/Dle3Cw+/zMCT4+rxhPl9KSMrceKCNvN0
 tPyBLgTLRbfFL+boIAC//znoFE4bPQD8czGUA+UOATaphcW2Sr4e4kCZ0F78JDPGlcvjzlBB9yv
 K4a+lqm2q+oIIY1B/OopR6o9E/57rg0Hnn5lSzTIYax7w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba8871558e610b89;
	Sat, 14 Nov 2026 14:21:07 +0000
X-Mizu-Trace-ID: ba8871558e610b89
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 22:21:04 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6Zey6YCb?= <2368492046@qq.com>
Cc: corbet <corbet@lwn.net>, mchehab <mchehab@kernel.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	skhan <skhan@linuxfoundation.org>, rdunlap <rdunlap@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] docs: kernel-doc: fix export selection and error
 handling
Message-ID: <avhuUH2BLm-EQpPw@wyuan.org>
References: <tencent_9BF64A4FFFB7B990DD5E6D6CF26C43565306@qq.com>
 <avgDq_FrLSbuC7bK@wyuan.org>
 <tencent_79B4A967C5ADFFCE3CCF0EA9362419ABE105@qq.com>
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
In-Reply-To: <tencent_79B4A967C5ADFFCE3CCF0EA9362419ABE105@qq.com>

On Sat, Nov 14, 2026 at 05:05:38PM +0800, 闲逛 wrote:
> Hi Weijie,
> 
> Thank you for reviewing my submission, and sorry for the mistakes.
> Although I have been familiar with and using Linux for nearly ten
> years, this is my first time submitting a bug fix to the kernel
> community, and I still have a lot to learn about the process.

Thanks, you're welcome! No need to worry. And sorry if my previous reply
was a bit straightforward. I was a bit out of form this afternoon. :)

Unfortunately, your actual patches of v2 this time were not sent as
replies to the cover letter. Usually, your actual patch, let's say
[2/4], should have a 'In-Reply-To' email header that points to the
Message-ID of your cover letter [0/4]. But now they do not have that
header, therefore not in a thread. See also:

  https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers
  https://docs.kernel.org/translations/zh_CN/process/submitting-patches.html#in-reply-to

If you were using 'git format-patch' and 'git send-email', that should
work well as expected. What did you use to send patches? Is it QQMail
web page? I suspect it would damage the process of sending patches. (But
it seems that your [1/4] can be applied successfully with 'b4 shazam',
so anyway) I had heard before that using QQ email might cause problems,
but I wasn't quite sure either. You may want to take a look at 'git
send-email' or b4.

I'm not familiar with this part, so please wait for others to review.
;-) I suggest that sending out your v3 after receiving some comments,
so you don't need to reroll too often beacause of this format issues.
(But if they want you to tidy it up, that's fine too.)

Yup, the process is not that easy to get familiar with at once. But
please don't be discouraged. If still meet any problems, please feel
free to let me know.

[...]

> Thank you for your time and guidance.
> 
> Best regards,
> yuehua-meng

Thanks. The usual practice is to write it as "Yuehua Meng" in your
From and Signed-off-by. But since I can tell that it's a known identity,
I guess it's fine unless later asked. Or perhaps this is just your
original intention. ;-)

Thanks.

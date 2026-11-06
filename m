Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952126;
	b=UQqtkr1VWrOA4k8Kx9YinqV3NkkusdfE/EgksDiYUUqcbKKb2cXn6xtaCh7q8hnKE2gE
	 4GpHsL9SF+pPYbzH6nZpgQiX1U+6TWMiHprZB+RHA6Ud1F98p8hrpwkMCrwpqxFYqSH6W
	 gK3c6y82ZltTWc/B1Z/8CQpARyid17awwYJwh0CqFyfGpyXvhiDafe3Ycb7n9bkgvrWzm
	 urvvNq5+7cdBGWBl8xjH8IQWpHaf2Oe1JOxGmA+f3x8kZwlhV/u/f9cxDmpEvEOulzpGQ
	 EREekrG1nkRkZuYIbc11jymbsYmL1tNEa1swz8UFF2sMs2p3C/yLBerwLgbj6Y1Dxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=upa7e4x4UrpEceLbmQEOyIgK5o4Ta8XgOf1XRCNdVeE=;
	b=1po6HhuQxRA9UAuL38MqVqs7NCuPhMx0XluuY+gbvmLjaffXHlKbexaQjrrPB4anlKn3
	 FxuHi+jycUG6XOiM2MR8/ia9DFehdRd9Um97U9X8Qi1lN0bbXslkPmfzIP8uzsvLIna4Z
	 gPrjflxuUhP31sdCwqltI9ui2oKAqFiUa1PLGnkotVlgqZOyGD3+8u2YJMiBYVMiv5NXi
	 TIFDVuJBP4Pu+mx24RMcVJI9Q0n9Qys1J54TK/oZm6HFm1+taXHHzzRKf7cRHnEAVUBWQ
	 A8BI9JCleXjHHK3NazkEnj+OWh9JCQookM0YqM6eCjpaA+m4Npv1GNlQptAf0E8xUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OZaIcwHb;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72042606D827
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72042606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OZaIcwHb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EQD6iBRuzY9Hc1wA37z098al2hhKb1UV+0Ibj8J0Ad4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793952123; v=1; x=1794556923;
 b=OZaIcwHb+DDIsVd1foyZgUzl6VTxzGHo4JVrl6m333TRfD3OV9/kxYXAiIuIClM6uQ6nyDqd
 vYPW7SL4InuoXwLVWgRszicy7yciyx8aFxzXdOoG6NJlhenwUknYe4aYQT8mPmWdK6e7XstG96F
 7QhM/sY4GrnUUo2B24sdRy2t+os1tR4Qp6Pcyr7EoboyxezoDIiAPtWTnv3comdBML60RL2zkqp
 rN97WTxhxzQ8Elhf8aZcbaXrz1hNNM/wmeVF+gEX/Z8+a0/vKB2833omQicyfkAA1PIayfKD2Lb
 yqznXYsyMlCGmbi7/ApqngeiXmBvvXCvpYMXtUzIO0nTw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9d4b8561adbe0eab;
	Fri, 06 Nov 2026 08:02:03 +0000
X-Mizu-Trace-ID: 9d4b8561adbe0eab
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 16:01:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese
 translation
Message-ID: <au2Jd6oyloqfeXCo@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
 <85899751-7554-4014-896a-24bb916c572e@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85899751-7554-4014-896a-24bb916c572e@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 8/23/26 3:14 PM, Weijie Yuan wrote:
> > The script says:
> > 
> > $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> > [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> > [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> > [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> > [1787244823.779522] 4 commits needs resolving in total
> > 
> > So I updated this document in chronological order, created four patches
> > based on these four outdated commits to make it easier for you to
> > review. Hence, you can freely squash them when applying them.
> 
> I am not sure if we should use "So I updated XXX" in the cover letter
> message.
> 
> From my understanding, it is fine to describe about what you have done and
> why you do this here.

Fine, will notice this.

> > Tested with make cleandocs && make htmldocs, no warning or error made by
> > these patches. (Hope my eyes work fine this time :))
> 
> Haha, LLM can help here.

Ah yes.

> > [+To: Konstantin, as he is the original author, thanks.]
> 
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Thanks.

[...]

> > Range-diff versus v1:
> 
> I think this versus is too long to read and it has no much information. In
> the future please do not add such thing in your patches.

Yes, indeed. In our literary work, range-diff may be not that useful
compared with actual codes reviews. So it would be better to just look
at the patch content directly, not range-diff.

Will pay attention this and save our time.

Thanks.

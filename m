Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9251CF54
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073009; cv=none; b=BmG7e1N5OIV147XU5PGAL0U8Wxp0ZCo5MrQpMrqR5bFRW3VhGjrP+v226JdXxe9hEgtEbnThDG0ZBjynC0RRbpFAU2HKvoM7YHAY7O+7t3P45kr/TR8+KpwAsse6FX8aQaIj0ibJHycv9Krrn5oSDF0kWDas6Tk482RBxN0YFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073009; c=relaxed/simple;
	bh=kD35mh/XAMFfuSXQzIr95gIjKd15P5wZkU96wBaod5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Bkjt8d05tKRyW8UcCQ7AUEh8d1EYcS28PipmoMHI688ztp9SzRMGDEHN0avaV5DXYKO47pZE7PLFyxL/MnmeTJvs7GpoXRF118GqqgHiqX3LMY6ijsfIkVpaodKCdFapTCDjubpJf4HVA4b9oSm1BGJ4+KyN0RjFhW7NYfeFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=QaFB6tfi; arc=none smtp.client-ip=91.218.175.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="QaFB6tfi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kD35mh/XAMFfuSXQzIr95gIjKd15P5wZkU96wBaod5I=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792073005; v=1; x=1792677805;
 b=QaFB6tfiwSNZZhIWwbp6KOMxA0Wt9Yf4pJcqH8DexJetNSXtvMgGzoOMNWU8B6csqQVW1Tqy
 tpXWNtYwep7luQdwoU+FnXdLZ2vrNePPhBX+KY6iMHjg1yg+O9HxaZwvx/MHH9DT6Wni5XjiXlH
 mmtt4a+tdjaIte/oEPuKQEgeB4NI+F6xk+xgwI1hOrwrTU1C4paNILY4QGNPgBXkjxr7thpVmud
 gebUL7HmioLVkEr6Tw9IdnIpMslIx4nevPbNGex+4dfeb7+/l0uv0eO8tGmNDK+a14ieV3SIEVe
 ij12+cwB2II5jxpS0qWEC68V04Vxl/EAPJqvspSNYy7PA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ddd49aec7f51196c;
	Thu, 15 Oct 2026 14:03:25 +0000
X-Mizu-Trace-ID: ddd49aec7f51196c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 15 Oct 2026 22:03:17 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Pereira <danielmaraboo@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
Message-ID: <atDdJS0HxZZ7O92B@wyuan.org>
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com>
 <atC5u4RPzVkVgTNm@wyuan.org>
 <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
 <atDVxZQUiJfsqEBr@wyuan.org>
 <87o6cvrs27.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6cvrs27.fsf@trenco.lwn.net>

+cc zh_CN maintainers

On 2026-10-15 07:50:40 -0600, Jonathan Corbet <corbet@lwn.net> wrote:

> Weijie Yuan <wy@wyuan.org> writes:
> 
> >> > For the Translator field, zh_TW just did a cleanup to totally remove
> >> > them.
> >> 
> >> Makes sense. I dropped the ":Translator:" line from the example, and the
> >> guide keeps the advice to leave contact information to MAINTAINERS.
> >
> > I personally think this is somehow a hard tradeoff, so my opinion is
> > rather neutral, and I respect your decisions.
> >
> > On the one hand, I think keeping this field is indeed a way to give
> > credit to the contributors, which can motivate more contributions and
> > contributors. On the other hand, over the years, this field has seemed a
> > bit cumbersome and inconsistent in both Chinese translations.
> 
> I personally don't see why translations are different from any other
> contribution in this regard.  The credit lives in the commit logs; we
> don't sprinkle our names throughout the source for every change we make.

Yes, very reasonable.

I haven't found out the reason why we had the "Translator" field at the
very beginning. I guess it might be something like translating a book.
Usually, the translator's name would be written below/near the original
author's name on the title page. (?) However, the difference is that we
have commit logs, so I totally agree.

Then perhaps we could also clean up zh_CN later.

Thanks!

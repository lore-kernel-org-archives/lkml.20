Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511B239085
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071118; cv=none; b=UpaNX8xk7hkrQjsW9Q3B0qwl2I99BK5bd845YIvCQ8ot8mwvQZBuvfb2NCbvEQENgsWYPMJC5dWajiTEmePmvUrPWzpd9WdQw1uNmsRPH2DEzCi/YQZYPexeS/OcYuCK5004c0oVdervcwRiRBnEsvdwXKHRxuruiSiH8K1j528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071118; c=relaxed/simple;
	bh=XgOW8YY03jBOnXTNwqImKEIQJlGTG8Ih0cKxxQZDNck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU5Vu4FytoONvMRwk/lnng/nwTmamW9S2ua7JhkiN2imDxOu+IugfcPkDazCTZh904rinXsPf/HJgn06a2PNycGe35phX0iClAkW4mcfeyk9KJ4uRs5dHaNVnXo5p8tG1v+fg4KrHrFPs3alTKZsT3kHlGZ3BK9uf0Y2V2Jc6OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YJnfxbMz; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YJnfxbMz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XgOW8YY03jBOnXTNwqImKEIQJlGTG8Ih0cKxxQZDNck=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792071114; v=1; x=1792675914;
 b=YJnfxbMz1kZV2d1355PQG9jiSXZQsjv6vKXyZL5EZGiB+R7kfgno+adL34iJjhYvg14FLJuj
 KQhmIquA+pfheQxUy9Xr/vIgzZWV+8i1f5a7K3ynCDudHtR0V9tRHv2ER+pfJztXTp7D1/yFqGD
 OKjg3HX61YNtZhDztlxtSj8hVY4kRbWochRVO36WGtltgELLt5eNli2W9ZP6n7NUcIK7ypcawEr
 V9mGSL9E5vTr3/nHWU5Cd2yR8j3r6dduUfWIAZygH4S63Gw6+647kYuwEjtL/cJ7+LuImAWG9PB
 j4zY7i0HAn5Ua3YVHi631t6Y3CBBufpyhrJyT1mnnpF7w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 76431a34406c91e9;
	Thu, 15 Oct 2026 13:31:53 +0000
X-Mizu-Trace-ID: 76431a34406c91e9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 15 Oct 2026 21:31:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
Message-ID: <atDVxZQUiJfsqEBr@wyuan.org>
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com>
 <atC5u4RPzVkVgTNm@wyuan.org>
 <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>

On 2026-10-15 09:55:58 -0300, Daniel Pereira <danielmaraboo@gmail.com>
wrote:

> Hi Weijie,
> 
> On Thu, Oct 15, 2026 at 19:32 +0800, Weijie Yuan <wy@wyuan.org> wrote:
> > Thanks for doing this.
> 
> Thanks a lot for the review, and for confirming that a guide like this
> was missing.
> 
> > Current practice of the field Original in zh_CN is:
> >
> > :Original: Documentation/xxx/xxx.rst
> 
> Agreed. The example now uses a plain path, and the guide notes that the
> documentation build turns "Documentation/..." paths into links on its
> own.
> 
> > For the Translator field, zh_TW just did a cleanup to totally remove
> > them.
> 
> Makes sense. I dropped the ":Translator:" line from the example, and the
> guide keeps the advice to leave contact information to MAINTAINERS.

I personally think this is somehow a hard tradeoff, so my opinion is
rather neutral, and I respect your decisions.

On the one hand, I think keeping this field is indeed a way to give
credit to the contributors, which can motivate more contributions and
contributors. On the other hand, over the years, this field has seemed a
bit cumbersome and inconsistent in both Chinese translations.

> 
> > Requirement for "Assisted-by" trailer has been changed recently. ;-)
> 
> Right, I missed that. All the Assisted-by references are gone from the
> guide (the AI tools section, the tags example and the checklist); it now
> only says that Signed-off-by can only be added by the human who
> certifies the contribution.
> 
> > Shall we Cc all the maintainers of translations for more comments?
> 
> Yes, good idea. I have prepared a v2 with these changes, rebased on
> docs-next, and I am sending it with all the translation maintainers in
> Cc, so that every team can comment.

Thanks!

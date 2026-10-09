Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C774AA3E9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559274; cv=none; b=HXHyF1R7Q6BAoRqhbNV8yDidjvfERfd0A4YqR78gQPfLxl5qhVGpPjAnsE3DpjZfB5iVnEDVFI4aH0aQvYNVT5W/8KEs+GcqL5xFds5wzPgN+f5vplOndwLH9iijv1SV9Rx1O+Ujg9HPsKiTKGmvhvcC37NajoxI6vogWxSou6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559274; c=relaxed/simple;
	bh=NmnpOP1SxRpFZY2ewOg8mOw6Z6ZjNT5THsFXjfhCZuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S26cxNa0IZDd7SDwflecGFoS/6PyMiwzc213zwSWBa0hHkVZUNOUYOBTgIToVjPapGYisj9QLj+/hv2vdPaCJ4tbZoKPdiizBrIUx0OGvAjjNuZcX/ZjCw9L7PG5WNsGeyu/1JxS2qU4GJD019fR1yHSM3ndU5F8PPIrLBIgbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Jq56kX8W; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Jq56kX8W"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NmnpOP1SxRpFZY2ewOg8mOw6Z6ZjNT5THsFXjfhCZuI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791559267; v=1; x=1792164067;
 b=Jq56kX8WZEVJk3z8Si85OcLhVpuTmga/D/suRTVZCpoZjRACkc4Tm6K3qzuKqUelpPs3cVVo
 2OQ1urU8iLR/BtNgu+ega/OjNCxGNyplA0S9O32E59hyypLn2HRX9oiFjnkRAFYGawc9pf3VmAT
 ubthMMZdiAElzKuajFWrvm0kpw+SKOfw8ZHAWcMchnjELgl9MIurO2Wyo0gI2KzfbEOIyICZjdl
 NzYVQT8G3D/CBDxC9zPurIH8q/CO5pEDMXUCgIlpIJro0QXrwYzo2LvGmhlZis9rwtWS8FCoz78
 ApDftRdufa5s5SI86zIzTTna3ehle9gQJe1eRGWGYSCGA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c97bb5a46cd3416;
	Fri, 09 Oct 2026 15:21:07 +0000
X-Mizu-Trace-ID: 1c97bb5a46cd3416
X-Migadu-Flow: FLOW_OUT
Date: Fri, 9 Oct 2026 23:21:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact
 information
Message-ID: <askGXjrwjiK8MFKd@wyuan.org>
References: <20260929115956.229610-1-chenyou910331@gmail.com>
 <asPWQ2ysbTgW9Uib@wyuan.org>
 <CAKspUh+hw3oqigFkHkwUiB_7ZmRrpECA2OstRS_jNF0f1uC9ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+hw3oqigFkHkwUiB_7ZmRrpECA2OstRS_jNF0f1uC9ng@mail.gmail.com>

On 2026-10-09 01:40:02 +0800, 葉宸佑 <chenyou910331@gmail.com> wrote:

> On Tue, Oct 06, 2026 at 12:54:27AM +0800, Weijie Yuan wrote:
> > So for the whole v2 series:
> >
> > Acked-by: Weijie Yuan <wy@wyuan.org>
> 
> Thanks.
> 
> > Offtopic & micronit: What's the point of rephrasing this paragraph?
> 
> No change in substance. In v1 all seven patches shared those
> paragraphs word for word; when I gave each patch its own message, as
> you suggested, 1/7 kept the shared reasoning because it comes first,
> and I tightened it on the way. Nothing more to it.

Thanks for the explanation!

> 
> > Oh, forget to meantion. Now "Aissisted-by: LLM" is preferred. But if
> > it's not necessary, then that's fine too.
> 
> Thanks, I had missed that change. I will use it from now on.

Oh (again), things have taken on new developments again..

  https://lore.kernel.org/linux-doc/20261009083137.3-1-sashal@kernel.org/

Let's wait and see the final conclusion that follows.

> > OK, you prefer no space between CJK and ascii. ;-)
> 
> Ha -- that is the glossary as it reads today, which still says no
> space, because I still owe you the change we agreed on. I will send
> it, and new text will follow it from then on.

;-) No rush, thanks!

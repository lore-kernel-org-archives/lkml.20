Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E843B894B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942491; cv=none; b=OsjTBk+tSBWBgxgKIwUHRqdRfmflsO/pxcoDdVoLbSAUtFgw0Iy3uo06Co12cdWdLGG5TML3rDuhqBGVb8GXube3PYjdTTgY8B4N4KaIdhyhuYECS1DMuImQkv9+NKEtbNiFpwB+Wpq8HeriuPUOJSXxTVEiVrmk0qd8N6PuoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942491; c=relaxed/simple;
	bh=mSGr9USpoM2kmv42dceiUA6KV4TbhSQvPwYenonpe8g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u5LixJFzpPNX0OOzGchn4ZOIvAZzNvLR02xuzCcW6pSXE7pnhJvVDNrCDplYkcahgvyqlYL8g/OwSI5IvTzEg7l12SWsx3hO2SL8bde+ephXrrwmTMUQebDAjROQub0S6SzZXPXIKId2+3b0s20Hy4soK2QWeY/3pMpMjU4zogY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bAYu4fB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bAYu4fB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2482A1F000E9;
	Fri, 28 Aug 2026 18:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787942490;
	bh=JZhNp9hZHYOOVceBfL/gOW5jcyTZH8S3/g7aNieeBbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bAYu4fB2Vn7jHtuvEIkOFv7rZ2Pnjv0Ywg2pTxO8qQBc3obpDI52eV7FcBLa0yxeW
	 glk+5YOwgRKgcCQQwKyVTDnlSMZepvRAEO5Zhy7R6oXaTKn+E8ATHRAHiOc+U40HaC
	 h4UgAEGYUMyNvCvGaMRYJWhDUPpxfNlloOyLA36c=
Date: Fri, 28 Aug 2026 11:41:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
Message-Id: <20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
In-Reply-To: <3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
	<3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 17:03:25 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
> individual filesystems") forgot to drop the super_fs_objects_eligible(),
> just fix it.

Oh.  Why?  Please can we have a description of what's wrong with the
current code?


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572E379ED7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788640521; cv=none; b=NcH0jQvQ7dLDHe13b23AMxs2oEZZeMCaAGoALxH2A0SpEvD5eZ6puTapexg3q1G7A33hGF0JO0x+lDc5DyyvTJi/hNQ8MeB5aa1WF+q86UC9koRtfFIrLEWhcYFYKYMr3aFTmlYEZYOPYLGv0AkKciR0p2I7sd6DQ5Me3zS0QnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788640521; c=relaxed/simple;
	bh=bvW+rj08aY/yiB7mJ6vl/BdbPkxzXGsSIdrwXa+Vb2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jYencVOFnEunCHCCjR2QE76JFLrZxcP8B2qC67XHgLGd68KD5GZ/WBwgT7NcvuBSTFZhLVDIxBvF6gVsYyvFfUxFQI/lp9NmJJ0QTow1zLSFbsswszqvRvSuDUpa7MA2KjOIUGyB00fdQpphW6vu0C+BbAjePLzf7QTehHCpEek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFt4KAUn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFt4KAUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB121F00A3A;
	Sat,  5 Sep 2026 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788640520;
	bh=bvW+rj08aY/yiB7mJ6vl/BdbPkxzXGsSIdrwXa+Vb2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gFt4KAUnJF4F3XfhLigR6srW+2WrlIGzxbxlKMeaQuAuLKZGcb63Slg2J9OmPa8Jr
	 vdtSTs1dGafNSxEp1vEVNSijRVfTjFEg52XwbLFwpx5YmveEremWeqFCOtRrcf/55s
	 vdJm4DKvCeK9HbOyp/SinIn5PbJsODYFNrJ6flIMAhZ5pZPj0eRO4D1STZ0CTpO9We
	 CBypYSH7WXLz8kKz2rI2aLZj+DbTd/1fEd6QzTxsmFSCTudsKkcg8nJebkt+rQTyCU
	 QPCk5UpxBmMKlk4QlcZ1XJ8MM5lwud8Z6fKkceQV5LBGefpfC5usPb+j3NrBBAOnfG
	 bwq+OOe5fqtbg==
From: Thomas Gleixner <tglx@kernel.org>
To: Liang Hao <haohlliang@gmail.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liang Hao <haohlliang@gmail.com>
Subject: Re: [PATCH] timers: Check timer_pending() before reading bucket index
In-Reply-To: <20260828145347.71644-1-haohlliang@gmail.com>
References: <20260828145347.71644-1-haohlliang@gmail.com>
Date: Sat, 05 Sep 2026 22:35:17 +0200
Message-ID: <875x0j5tdm.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 28 2026 at 22:53, Liang Hao wrote:

> Only read the cached wheel index when the timer is still queued.
> No functional change.

Which problem is actually solved by this?

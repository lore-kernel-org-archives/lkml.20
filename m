Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C1380FEB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429224; cv=none; b=L0ufoAdFXcHKDAAgI9d148gYwCHJ4WLBkVccTZXfhwpzqzqYUICHiZ3g5jDUUZRlX67zY9THIU9/XxOydMG7EFIzDgccIPi9j9FSpjMEZ5HFVKO+T5ZN+LB3mHSVJ3QDUIbQKAAtIqne7oi4gJQMnvuBr0oW5ypuFSahUK7oVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429224; c=relaxed/simple;
	bh=d4y5Hn0EBhF1grLy92/G1W/mcg/unwEoTt2qMQQaKU0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=FqtpopWm8+jOKQCK3+fu5XsID2A8jq50CzTagE+VpAbGFSozXuccdt0SvSq1DbrUH3nYymkeAFnuyksIBspo/F9R+oHBjhAWaXV6nGUcf1MH5cQNZKyyGKW1cGRywXmPDhNcYUyszf+GEqw2hU69KgpFK4co2EpZAEBwwA8LgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl2HdFNv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl2HdFNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDED1F000E9;
	Thu,  3 Sep 2026 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429222;
	bh=d4y5Hn0EBhF1grLy92/G1W/mcg/unwEoTt2qMQQaKU0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Wl2HdFNv9ck/rElbAHmVFE7nflBnSrTW/tfAbnLXNxct+5s8QoGWdWEuLrtkVAgIH
	 aubllsRn5anEp99KO2S53jDaNAV4Sdkxg2EHuyNG10qKEogM0O8B/ZDQ94VRWGkCc9
	 kRPfwxJNU5iNQhCdr3ol7l6l/XBXOMBdfX9gQptSmoTJSBKUnndiJv6MHhOMVnt04h
	 BKBtHga7MjLjXl3WK2L1l9HmTwPY4i9sP7BiZvkt+7TuJrR1bnda03AwXPkX9A+NXN
	 9T6KF4eleru0QB7elLk23qFg4IGxhsf9BJuqqVJV6gJ/yfayZNfGg6BIX5/+aH3/Z4
	 6SAks6FXSpRaQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 11:53:38 +0200
Message-Id: <DL5L8WQLEHTO.145VJ5NIXMCHE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH RESEND] drm/sched: Create faux device for KUnit tests
Cc: <oushixiong1025@163.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Shixiong Ou" <oushixiong@kylinos.cn>
To: "Maxime Ripard" <mripard@kernel.org>
References: <20260903090256.552317-1-oushixiong1025@163.com>
 <apk_YgCd8fbXC7Lx@houat>
In-Reply-To: <apk_YgCd8fbXC7Lx@houat>

On Thu Sep 3, 2026 at 11:36 AM CEST, Maxime Ripard wrote:
> What's wrong with drm_kunit_helper_alloc_device(), or kunit_device_regist=
er()?

That's probably may bad, in a previous patch that tried to support a NULL d=
evice
in the scheduler instead I mistakenly mentioned faux while making the point=
 that
we should use some mock device instead.

Thanks,
Danilo

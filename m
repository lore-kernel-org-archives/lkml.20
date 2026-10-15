Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863D46F4A6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095269; cv=none; b=BOOvPEQ6mrNTty4qq+6YeExNkYUbOZDd1mb4io6NOmMFnyJN413zytT9x4+kKPuIWy1Gk9xGzHDRiJt4SIsUIEa558kvMTFJ6yKsieTLYFHAoT/77fQTBgW01U5fwYoJgNkDmrH5dTr8ocYaFJtqW9kM9vNoJHH0xxG9Wm7SPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095269; c=relaxed/simple;
	bh=54gikot2EebTARWuZt4xtl2olUaey15VTtmwXRgDO8w=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=M829IeIvUl8myGiGz+OdakHzDocePkmuwQD82VhJLH5F0VINqXCO6VhHQMB1yE8aTKVBKLTQ+/2gttDhbz2GK8fjcMudpXbmpUXxGn4zFVz/4SruGpKiblKpIrBXGsDARbEXrucMldAPSylfrW8axJYX4SZxK6IRSM1nMIfhnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fiezQO3K; arc=none smtp.client-ip=91.218.175.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fiezQO3K"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=54gikot2EebTARWuZt4xtl2olUaey15VTtmwXRgDO8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792095265; v=1; x=1792700065;
 b=fiezQO3KIzi08agXDoC/zCVXoetE0V0LcGGFYxNHb7pxhvdM+gVIXAcxpeyE/2KOcZVlgkr5
 2zKVRU1RcZ9i6e/YzfN8CpwslNiVht8ZewlyRhQRO41tth79A+eVAUv9/PQizSZqEwfZSw4Ivx/
 m4k61xUfSfuxrQs5scA8iK+Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bdc65f95dec0f2e0;
	Thu, 15 Oct 2026 20:14:25 +0000
X-Mizu-Trace-ID: bdc65f95dec0f2e0
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 20:14:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <8d62b637dcfbdc6d6ee122118c46425e0383c051@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: "Dan Carpenter" <error27@gmail.com>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 dennylin0707@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <atEu_ZAyNVxyfbMr@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>
 <atEu_ZAyNVxyfbMr@stanley.mountain>

October 15, 2026 at 9:52 PM, "Dan Carpenter" <error27@gmail.com> wrote:


>=20
>=20Ah. In staging, patches are merged on a first come first serve basis
> so you are free to ignore any patches which are sent after you sent you=
r
> deletion patch. Obviously we're not going to merge fixups to a driver
> which has been deleted. If there are patches in the list that were sent
> earlier and haven't been reviewed then reply to those.
>=20
>=20The rule here is that it's a good idea to search lore before sending
> a patch.
> https://lore.kernel.org/all/?q=3Drtw_generate_ie
>=20
>=20regards,
> dan carpenter
>

Is this email intended for me? I don't understand what is it supposed
to say?

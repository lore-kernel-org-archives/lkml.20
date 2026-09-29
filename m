Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBDA38C2D1;
	Tue, 29 Sep 2026 22:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722683; cv=none; b=nNmDGEMIPOjrJp8CCngFQyXxY0gJBNLDdVE7YgCvILKIBjsOI5m+CyzApxi6raPiZLnCJO+Qm7tnnNVqTnAfWB5HFa/a5xyBplXLSVh5ulbbG2T9qDWCeulYwIBd83xMnENfYfEWErcbxHeKwYtdMgwbny8VgiAzFn/uFh3rRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722683; c=relaxed/simple;
	bh=n+2UQiGqs4gBSnSaWwukFGYyqSPSqvPcYesmQtmAkWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LfskINnDXc5oK9UFD5CLwb/YryqmbPJTRCEDnwcCsTGwuDXz8FLvaZWaEvhJ9RuZdvgYPF+XyxAiTY3YkvEe2e/L+Us3YReSMldhn+kbMi0LkayQStnIYS+H40Ikyfk4fH9Qs7xyFOKcbOo8XLZSaLjOa0nXnP3quD/1edbV/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SRKcMwXe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SRKcMwXe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3143B408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790722674; bh=SjtJciAHBMH38qudicO+CP7GNoz+sOXuSteaNkKVwEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SRKcMwXewqFy4iTYxWWWxBUvD0/xnMd8I95Wmg5/P9t/EdFVAmY0z1JY/ECJWXvaq
	 Gj//MdvbY6WsueMQLap+cyxqztFJuGorVEdv5cexD/v66snWna8UkaoI0qzqceEoIH
	 zceXsw9eBzyi6GxMNZd4WxwMlD5gevGjEhkRnwWwekgZNA+ZswPsVRKPihuWvIoseC
	 lgNHTjGUKtp4zkV5t0VE7cuL+koyLZtvdpDOn4+WYToKEDSGshIOzg1/7owLf2aZC4
	 QhtEQx3vYbfeSJ/DE9Fw/3oW1V1EHQVmpGQ8SD/nN16SO4PbeSy6W4hWLgXW1UZVSk
	 SI/J2qVkrej8Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3143B408FF;
	Tue, 29 Sep 2026 22:57:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@gmail.com>,
 clemens@ladisch.de,
 tglx@kernel.org
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, Habil Eren =?utf-8?Q?T?=
 =?utf-8?Q?=C3=BCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH v3 0/2] docs: timers: hpet: Modernize and document API
In-Reply-To: <20260927072425.7892-1-habilerenturker@hotmail.com>
References: <87jyo74rbv.fsf@trenco.lwn.net>
 <20260927072425.7892-1-habilerenturker@hotmail.com>
Date: Tue, 29 Sep 2026 16:57:53 -0600
Message-ID: <87tsn7wtqm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Habil Eren T=C3=BCrker" <habilerenturker@gmail.com> writes:

> This series updates the HPET (High Precision Event Timer) documentation
> by updating outdated file paths and documenting the userspace API, includ=
ing
> the available ioctl commands.

A few notes:

- When you send a new version, send it as a new thread rather than as a
  reply to a previous one.

- The format of the Assisted-by tag is "Assisted-by: LLM"; see
  Documentation/process/coding-assistants.rst in a reasonably recent
  kernel.

- Patch 2 generated complaints about the addition of trailing white
  space; that is something you want to avoid.

I have fixed all of this up and applied the patches; please watch out
for these things next time.

jon

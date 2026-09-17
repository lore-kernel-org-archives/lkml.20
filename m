Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B14FECE8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649235; cv=none; b=GFyqIQR+QUEUrTi2UPUqDQq+aEqCFTgw6646Lr8oEJON9ULjU4sdO/eS/jXJNVtEHbkd8gxJK4Y5m8cn8gjex85j9psYIhkC74eriHsGbxF9WeoYexFFC6jyi9gbrWn+PF+c6Nw7Wxj+DgvXTFKUPVtyOEz4psjRRqIvy/9sqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649235; c=relaxed/simple;
	bh=gILUbaoT7fKQcvTHAlwvSON/RkpV2LxEuI0qJh2Jgms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uhUqhqVcgLkJCQ1GuGOk+GBMOY/rqISpdarsgcva78Ud/rKWBTdgimMIUMphjlq1AKvfdtoXQ12e1ueu49Fmb53eIqmuVU936pRmZTIhLXD1TKyIpNb9wLQFspeK4fb3tbHRlSaDGOBCf1XgfC6iRpP+lcwSe3GnmPrektFycLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x0CBO3Tk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x0CBO3Tk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E4841A092C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:46:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 120E55FAA3;
	Thu, 17 Sep 2026 12:46:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CAF611C7A082;
	Thu, 17 Sep 2026 14:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789649213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gILUbaoT7fKQcvTHAlwvSON/RkpV2LxEuI0qJh2Jgms=;
	b=x0CBO3Tksv36MnOcMm74cMyyRxyUhrNIirc1jJrZ2eU9h6YvfZOhrEsadWTw650LzfXJy/
	OtcX5NRbEq5BHePRfhR9GVgmd3lgif0ROF56YDsTBpCsJ0/Z5DyS6MtLzi5Dvfjg3ctObc
	RVBW8NkY2P+K4HyLrqhJcwAsHbJOHzs0QaSdSoCGynuswRw3ZrAFoyqBl3FsTUHwk51Sr9
	3N4EATdeVmBY/Sj/9QivMNySqRykWsWejGnaIHpkb9CysakKayQqGMjMPQLi7P5tl7j1Kl
	5jawGJ1Vzc3qV4Ic4nhgSniJPskklka3eDfr14zu9xh6r3s8g/k+Ru3pMXb9Fg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at
 256 bytes on an x8 device
In-Reply-To: <20260916162746.308008-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Wed, 16 Sep 2026 16:27:45 +0000")
References: <8733v9mdro.fsf@bootlin.com>
	<20260916162746.308008-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 14:46:52 +0200
Message-ID: <87ecesjb9f.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 16/09/2026 at 16:27:45 GMT, Orgad Shaneh <orgads@gmail.com> wrote:

> Hi Miquel,
>
> Thanks for the review. v3 sent as a reply to v2.
>
>> This sentence does not mean anything, I'm sorry.
>
> Rewritten: the count goes out as a single bus word, CMD() replicates it
> into every device lane, and an x8 part reads it off eight data lines, so
> anything above 255 is truncated there.
>
>> failed? do you have hardware that actually triggered that issue?
>
> Yes - a Cavium Octeon CN6335 board whose NOR is an M29EW strapped to x8.
> The log in the commit message is from it, and the clamp fixes it. v3
> names the board.

Ok, this matters a lot to me today, because we get dozens and dozens of
hardening changes which do not always have an actual reality. If you fix
a real problem you encountered, that's relevant.

>
>> That's incorrect. It indicates until when we need to backport it.
>
> Added. I checked the code is really there: 1da177e4c3f4 already sends
> CMD(words - 1) and already takes the chunk size from MaxBufWriteSize.
>
> Vignesh is on To: for v3.

You should use checkpatch.pl or b4's option --auto-to-cc to create the Cc
list.

Thanks for the v3.

Miqu=C3=A8l

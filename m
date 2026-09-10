Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B648822D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044146; cv=none; b=cOkvc83FNa6l8mFRfREkVZ4WzsUrSY6MivAVk2SFO29BogdZNiy8WTsWOkobv0Bs4MhGQDo5YsE8vt34uju0DKx0Lycuj70KVR5oDPQeS+PUZ1RwTTXQtb1idwv6hxu6CBFZF5pWwyKVaF1KHlTegu1IISNQSmyAq6rwq78FvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044146; c=relaxed/simple;
	bh=emRs8TVGLp7CDj6L8UUWJbEMGYVcjNGljr4x5y1Fbqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=losywqFCRZ6Wk52T7LQ78fiGqTcIbCMn0ckp8nWTmfBKRlVZYFFnEx+LNGcPGzQ3P42J/bwu9tp2pj2i0MuB74wkiJ/qnlDoXuFdxlA2g4dssIy6zybDLMapVIG89AptS+90jbrVQGWUiFRrWQT7zZaJAqJ6/nLlleMuKD5cfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0dmmUG20; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0dmmUG20"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF9681A010B;
	Thu, 10 Sep 2026 12:42:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C21E5FA2F;
	Thu, 10 Sep 2026 12:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C18A611C7942F;
	Thu, 10 Sep 2026 14:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789044140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=emRs8TVGLp7CDj6L8UUWJbEMGYVcjNGljr4x5y1Fbqc=;
	b=0dmmUG203ziZOKhEZV0GqNJbH1k9/jQkyT1pomwJQ8GEBIqfbUHEzuhqzjv3u6j3bNxgjT
	MFPxsxtBFR5vHUKBkE3HJbnlTXnU6vaIuwm/tbNPhuvtl81x9zionvOm7Qy2MlzCruDo8z
	Ou4upUUzzXb6YpUtw/vDJ4CBNT1qYjrwvorE9JNkoqQGCloESLzdTTZDbcVQ1Mo6UMBbR/
	bmzvlrFPvhPNs1eeoE8Z9oeC/2/uIoLYJMkPMwIdvlQYWOSzn8XH4pbRYbgNkNCz6VDx8P
	8UZPpg5zF0j1kfQOSrn6ulI67IYFo49xNwjXN5JDJsf2z43TGpoeq87avrFcbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Zongzhen Feng" <1768315307@qq.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  "Richard
 Weinberger" <richard@nod.at>
Subject: Re: [PATCH v4] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <20260910042619.2A3731F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 10 Sep 2026 04:26:18
	+0000")
References: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
	<tencent_522792EE6F63A5581C238FF17E9862F10A08@qq.com>
	<20260910042619.2A3731F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 14:42:15 +0200
Message-ID: <8733vhs2fs.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Zongzhen,

On 10/09/2026 at 04:26:18 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Critical] Partial page reads with software/host ECC cause silent data =
corruption on subsequent cache hits due to incomplete cache updates.
> - [Critical] Cache hit logic fails to check the Logical Unit Number (LUN)=
, leading to cross-LUN cache aliasing.
> - [High] Missing cache invalidation on OOB/OTP writes causes cached reads=
 to return clobbered data.
> - [High] Error handling leaves cache valid with uncorrected data on
> non-EBADMSG errors.

These still seem valid :-)

Miqu=C3=A8l

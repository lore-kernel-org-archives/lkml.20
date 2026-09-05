Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB505474E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566585; cv=none; b=te0Of/cTJjQVSS3mxhHRHBZD2kQps6mgBCyGWmugs6qma3FuSPRGET2Aubkzac7NSlUArhShR1y3ZMKmo+FcFEI1PkEqYF87IVC9hmNRwqRp2PUGvOw+GFkb3FqP9z70a0Hv+s2Pl/TDtNl8CHgfYJPIgbEknCL6JB9vec/Q66Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566585; c=relaxed/simple;
	bh=jRGHH5+dJasYl6QasqZcBXjDc5Ioc8QJO+SuMvwIw8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZeLUQfcjuHUN6FFjun47hCMT0vyh8Q/0FdaYkXcZ6r7WQ6Az9+pzY8IpXKzPg+Mw1Hj7ANyXeQrW/74kG2HW2m7TCyx3N7Z70zCepRYsAep8je3+uywiFIUu/jkdH4SWoWqRGoHy8DiEIaVVpcHDdCc08nyvoK8zywO9Gfyq/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Mtc76hyz; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Mtc76hyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788566577; x=1788825777;
	bh=kYCP7L+RxrvA8YLVkCaLEUw3ZFxkZz5HDaaTujWhlUQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Mtc76hyzA3Wbr52GD1zOGMKwP/iNRXq+mKtWKZbSPfahKQdBBJyrJBubkICF9JmYZ
	 XkSj/89GFnCIRCQU9C5f7jSzZZmN49ivzOa7xP5wI7qe41TkGno9wNfcdKQ3GZ/dJ6
	 mm9Rmb6b4qK6Er37OUck2YHDp1vqh0Oo9dn4MzL8b30lmmRH0bj6crFUBILlb2e+59
	 DMFcAbgS/XVUKKmcQJoSAZ0BKqXiAxupqXX/ToBjph/X7F+edhMo4VYkCuH6tcl69t
	 klGv6D+ADcxwi44ZuJVZdyeA49QU6NQVgIxkVRV5fYioBaUxiXOkJ/aicfDrxrDYDa
	 Enr7EKBBkRCvg==
Date: Sat, 05 Sep 2026 00:02:52 +0000
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
From: Cole Munz <Munzzyy1@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a completed request
Message-ID: <20260905000240.2267367-1-Munzzyy1@proton.me>
In-Reply-To: <aptTU3JD0xPMPmfL@vbox>
References: <20260904161344.2191362-1-Munzzyy1@proton.me> <2026090406-unrevised-stays-4832@gregkh> <7bef11b63feb88f89b37bbc86323ed3dba794f43.1788541086.git.Munzzyy1@proton.me> <2026090413-hurdle-puzzling-aadd@gregkh> <a0cdcd76b7a6a3c841b7957a2b761ae71ceb46fc.1788549031.git.Munzzyy1@proton.me> <aptTU3JD0xPMPmfL@vbox>
Feedback-ID: 209578162:user:proton
X-Pm-Message-ID: d7868ab47e7d4a561e27fead25e9169f0cf54be5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026, Thinh Nguyen wrote:
> NAK.
>
> This is not a fix. This changes the dequeue() behavior. You're breaking
> the documented behavior of usb_ep_dequeue():

You're right, the return value is documented and I shouldn't change it.

The part that actually hurts is the dev_err. f_fs dequeues ep0req on
every teardown on purpose since ce405d561b02, so every unbind logs

  dwc3 23000000.usb: request 00000000ad92f1c4 was not queued to ep0out

for a request that completed normally, and that noise buries real
errors. Would you take a version that keeps the -EINVAL return and only
lowers the message to dev_dbg when the request is COMPLETED on its own
endpoint? The never-queued and wrong-endpoint cases would keep the
dev_err.

If that's not worth doing either, I'll drop it.

Regards,
Cole


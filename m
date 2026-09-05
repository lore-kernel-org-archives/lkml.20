Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEB4E56D0;
	Sat,  5 Sep 2026 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628321; cv=none; b=hYPH/tnXBeT1MFWltCOlMSZARMYYiNIyC7ira25wYRalLj8lQnoLkNNaOeQ2DC8yiHrEKjL5stGm4ISxbMhEXkgxIOKMBjzmS175nHSs7zMcXaUt4VcjfU1cWCXnENGTLJTxd/TSf1Vca7jJu0WoRc7UEzyx5NOdFhktom+1kVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628321; c=relaxed/simple;
	bh=41a7B2UeanXQzgI8GT9KqtPIGqpxWiEhximAlGEYTy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jx+Oto+N1cGvIdhqpKTQ+zh59UcE5/VWy2jCKYXBTtitew8Hl+JqxpXL109rpV4BCvmpFto+WTZ7PN+g73z9DQzjZrqTc1nIYBG39UpHde41p/XpDX6m2whUA12jNKHQjTUOG6G4oArF2te/ZAk3tmbSBsLJFnlk6IYuaUc5jUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=nKZS4MW+; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="nKZS4MW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1788628306; x=1789233106; i=christian@themurphys.eu;
	bh=41a7B2UeanXQzgI8GT9KqtPIGqpxWiEhximAlGEYTy0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nKZS4MW+fajhDAtufzUhCuIE8y0WigPpS4zz66rPABF9nD3g/5Xv25TsS5oVmqyN
	 EDNaq6oKxr2ofVbkZ0vDsGNWeSL/P4Qrm8YCiOVAVNpDotFYncnqTlsmfNriIkEDA
	 Os25mHZshm+Fc3+cY4LKIdWVJs4IxRLFhYk8VpH2zDsd9Qeyz5WN7FIbWC+0hdclP
	 KSc0qvtLWo187Dr+FjfbB6p5zRgf3/l24+BH2xQU9j8mnz1cOTyQMykFli8LaEcHg
	 e+LxDn3GVQXU2oAZXu8jcpPHcW2cYcPL1DwtG1ZgO6Wiohe81xT7N7gaQHZ/Oq234
	 //2vOAjgxaqkEgt/hw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MNssA-1xDq8Y2iVs-00QUoQ; Sat, 05
 Sep 2026 19:11:46 +0200
From: Christian Murphy <christian@themurphys.eu>
To: hpa@redhat.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	tarang.raval@siliconsignals.io,
	jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com,
	christian@themurphys.eu
Subject: Re: [PATCH v2] media: i2c: imx471: Fix pixel rate and line length
Date: Sat,  5 Sep 2026 18:11:40 +0100
Message-ID: <20260905171140.81619-1-christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAEth8oF0__WNz9_gsSnrycP2SYcs_-G06r6TCPCFK2g1N=jbJA@mail.gmail.com>
References: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu> <CAEth8oF0__WNz9_gsSnrycP2SYcs_-G06r6TCPCFK2g1N=jbJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZmhGJ49EBwq2bh9q609Qj2SOlHWfmUMT8miqOrxX//sveAty2Yq
 dpKWhmXVJRaRMkzEPfPDXPBQgzlu8wlh7suzzIwOlc/zCK0m2knVjX+zkCLFm5PbiEWQPNF
 xGhQ+6r9aLANQHhBfb2ZdwWvOKJfDdcdTi3lqUHjg0W42NMdKZznwG8YyLDqLIE1j9CQCvY
 cheL6F7tG+MqaJekX5XGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s9xgFaqa1wA=;nWXZIl4iHduiTnfkyVCcIAgmckV
 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

Hi Kate,

Thanks for the series.

On Fri, Sep 4, 2026 at 04:59:58PM +0800, Kate Hsuan wrote:
> According to the datasheet, since this sensor runs in PLL dual mode so
> the PLL configurations in the op domain are used to calculate the data
> rate and pixel rate.

The OP PLL clocks the CSI-2 output. PIXEL_RATE is the pixel array rate
(ext-ctrls-image-process.rst), set by the VT PLL. Your 159.36 MHz is
close to the output-derived 160 MHz the driver has.

LINE_LENGTH_PCK reads back 5120 and a frame at FLL 1308 takes
17.296 ms, so 387.2 MHz. At 159.36 MHz it would take 42 ms.

I tried writing 2560 while streaming: at FLL 1308, 6.61 us lines,
115.6 fps, frames intact, no drops or ISYS errors during the test.
With .llp still 2328 and your pixel rate, libcamera would calculate
14.6 us lines and 52 fps. The measured stream carries 2.4 Gbps of
RAW10, above the 1.6 Gbps a 200 MHz link carries on four lanes, so the
200 MHz in the driver and ipu-bridge is understated, a separate fix.

Writing 2328 gives 6.01 us lines, but the IPU gets 474 rows of
black and flags every frame BAD_FRAME_DIM. Stepping down from 2560,
2544 still gives an image, 2536 down does not, and 2416 down arrives
truncated, so 2560 sits just above the working limit here. The
12.05 us bound I gave Sakari was wrong, but 2328 does not work either.

Using 2560 to raise the frame rate makes sense. With your planned
HBLANK write, .llp needs to be 2560 too, with PIXEL_RATE at 387.2 MHz.
My patch uses 5120 because that is what the sensor currently runs at.
Could we combine the pixel-rate correction with your HBLANK change
and use .llp = 2560 consistently? Happy to test.

Kind regards,

Christian

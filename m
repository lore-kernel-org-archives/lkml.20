Received: from ocn-ckd-mts-119c39.ocn.ad.jp (ocn-ckd-mts-119c39.ocn.ad.jp [122.28.130.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8F4E8E15;
	Mon, 19 Oct 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=122.28.130.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415099; cv=none; b=QMGJWw4H7bKC5srucbjFvU51WhuCrbFTTfDcUj/sK+CsT1ex+jjzg7eXYubW3ct/FtbtXFJSsYGHXL+eBgNxQz5w+qqHuO4OUy9ACVvwVb7jQXK/Q+sK6Tkl3OWf65X+aCqPsFg9iaxWwEHvcTzwMjSQBvprv4+MZNFKOlxGn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415099; c=relaxed/simple;
	bh=YT55gpGm8NrjkJARCGxiUjSTkL4aw7n4zEtZ9T9agNM=;
	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:In-Reply-To:
	 References:Message-Id; b=aV/xhyPJn7GdkhF/MlrFaAEaxc5mlvuJZ33QsX5pBAUpb2663u6ZkyflMyIin80/++I37P3ceaNx170XCARF8brJVmJF963Q7QjkINLNXj/3ZZTt2WW1/nfo+brH6h7X9Y1ECBGGJCt/CiH3ndtd9LvdrPSW++ECPeOtas2YUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp; spf=pass smtp.mailfrom=docomonet.jp; dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b=tIBMJsGb; arc=none smtp.client-ip=122.28.130.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b="tIBMJsGb"
Received: from ocn-spm-mts-101c1.ocn.ad.jp (ocn-spm-mts-101c1.ocn.ad.jp [153.128.190.226])
	by ocn-ckd-mts-119c39.ocn.ad.jp (Postfix) with ESMTP id 80D65340032D4;
	Mon, 19 Oct 2026 22:04:53 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1792415093;
	bh=YT55gpGm8NrjkJARCGxiUjSTkL4aw7n4zEtZ9T9agNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIBMJsGbiGZiKZ75I7veh1BI6/gydbuy61XWC2+0onOVYvykJsR2MBz3cOnAgaaHt
	 KQTZAJicCuEf2DXcVfZmQUA6FAlPcYKsrWZBLN/M+xFlr7rGDhO/vjVTFn74qjx8kh
	 +UIm+BDzb1/kaspyTo5b5E+xtMWmqaLDqiV23/x8=
Received: from ocn-vc-mts-108c1.ocn.ad.jp ([153.149.236.202])
 by ocn-spm-mts-101c1 with ngmta
 id 0feac299-18dff007e611286f; Mon, 19 Oct 2026 22:04:53 +0900
Received: from ocn-sdpx-mts-113c1.ocn.ad.jp ([153.128.117.211])
 by ocn-vc-mts-108c1 with ngmta
 id d83a9b4e-18dff0079f7349be; Mon, 19 Oct 2026 22:04:52 +0900
Received: from docomonet.jp (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-113c1.ocn.ad.jp (Postfix) with ESMTPA;
	Mon, 19 Oct 2026 22:04:52 +0900 (JST)
From: "Asai, Shigeaki" <y-asai.0816@docomonet.jp>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC as rtc0
Date: Mon, 19 Oct 2026 22:04:51 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailer: HidemaruMail 7.42 (WinNT,A00)
In-Reply-To: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp> <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Message-Id: <10DD5FCA6DA7B692F3006A@docomonet.jp>

Hi Neil,

On 10/19/26, Neil Armstrong wrote:
> The vrtc was used as rtc0 because it's the defaut wakeup rtc,
> can the rk818 and rk817 wakeup the system when in system suspend ?

Thank you for the review. I did not think about wakeup, sorry. I tried
it on my board:

- s2idle: with Igor's "irqchip/meson-gpio: Allow the GPIO interrupts to
  wake the system" applied, an alarm on the RK818 RTC woke the board
  4/4, and the power key on the RK817 3/3. Without it, neither of them
  woke the board.

- deep: an alarm on the vrtc (rtc1 with this patch) woke up BL30, but
  the system did not come back to Linux, and I had to disconnect the
  battery. An alarm on the RK818 RTC and the power key did not wake it
  up at all. So deep suspend does not seem to work on this board for
  now, which looks like a separate problem.

On the other hand, the vrtc does not keep the time, and the RK817 RTC
drifts, so only the RK818 RTC gives the correct time at boot. Also,
before this patch, the vrtc was not rtc0 on my board even with the
rtc0 alias: the RK817 and RK818 RTCs registered first and took rtc0
and rtc1, and the vrtc became rtc2.

Would it be OK to keep this patch as it is? If you prefer to keep the
vrtc as rtc0 for deep suspend, I can send a v2 with rtc0 = vrtc,
rtc1 = RK818 and rtc2 = RK817 instead.

(This reply was written with the help of Claude.)

Thanks
Asai, Shigeaki

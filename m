Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408767;
	b=wszi8kCceF3A7JuSVhKTLjiwB/2PdE8Hr+UpazPTv5Iyf6ZJEzkm3PzhWziTkXZorRra
	 kp7BzlmoUG8QwdOPf1W4i2VkyD+RUWCGBKb1FMucHFN+cleaX6BpQeW2zXM+J+rZaxcZo
	 uprI7RuvAMgkhwQlHJAE73MRMad3B6hXGpcCAuB6GBCQ9YMwwks45ZDO86kRG76hSvCEs
	 pFdXvKNigeD3Wjyx/OUFI1sIZGvRaty6rB/AhYKOJT6TFG8rCabM2fq0ERmd7EHQMJSJi
	 MBiJd4MmdYr7bqKcCRacecbu/4/8VRAG2y4VHlg19JErGJ1VWwhdYoP7o8LSVbh6Gqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408767;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ElN1opo/jPcOkKar2AWvZTN902enBL4NXpXYrUIyoQ=;
	b=NCfs9BgdHc2kEc/2qcvREmAq2xRnwbgudDZMlHvXWsO2G9k82iXZgRY1Hhj1w12hvSPo
	 eOUehzAp4ZEApsk8hfHxGl/SW3UQUEYeKNsYQ5NM20HqCcT4qE5kmGJGqiQR8Z0WdV5Tr
	 Mbdl1dotFMePcb2Zn6aW38x5QR1x/BXPDgHRnhZmCu6+7OMS4A+tRer0G08pHolww75Dx
	 3cDG00LdIhx8c+ij4hXIY4YFxr81ZmJr3ZYc9U76ZL/JAka2NCxf3loBU8kHrfarhAAij
	 QgYvhualIwXmFCUo1hFBX7WDN2vfU3NmsvJGAUkA+044NU5OlU/712NhPnIAvmp306g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zJHt4Okk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3309606A31A;
	Sat, 31 Oct 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zJHt4Okk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15D31F000C1;
	Sat, 31 Oct 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793408766;
	bh=9ElN1opo/jPcOkKar2AWvZTN902enBL4NXpXYrUIyoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zJHt4OkkLqWb+SfS0yLgqSzpBhrr6IDRZVTnyke0ak1rLervTMEm++f7LxwsfRLfV
	 rhr9ql2mf3cdEA8mO/UE6v99lim908PxZC0LkJzDk+9gVi2t4liBkMo/grOW/RxBd3
	 f/PQRkvp6UnZXeT0HHVGSz60NN9C3FIJTT/wuYAU=
Date: Fri, 30 Oct 2026 18:06:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
 <thomas.weissschuh@linutronix.de>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3 v5] delaytop: add delay max, timestamp and sorting
 for top latency analysis
Message-Id: <20261030180605.c65033cca1dea1dcd814c3a5@linux-foundation.org>
In-Reply-To: <20260923210149015t-X8AvGrXfHE4PDn9gZOM@zte.com.cn>
References: <20260923210149015t-X8AvGrXfHE4PDn9gZOM@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 21:01:49 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> Add delay max, timestamp of delay max and max-delay sorting to delaytop,
> which can help quickly detect potential abnormal delays from a global
> perspective and locate the top-N processes with the highest latency
> spikes.

Thanks, I'll queue this.

Sashiko pointed at one pre-existing thing and noted that you "snuck"
in a couple of bugfixes.  No that this matters a lot ;)

	https://sashiko.dev/#/patchset/20260923210149015t-X8AvGrXfHE4PDn9gZOM@zte.com.cn

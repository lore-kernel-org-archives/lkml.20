Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194450;
	b=Uy+Kn/fO4xf080WwQ+5c7ZWJW3croQPRe9S0z7nm2aCCjKPCGUmq8dDvcpnkPFpHipvH
	 37sC0QgOKpIJ+fX5YZ+/IrpLhAMbuOPkd9YqvwY7YyPUPqEV5Yw8BwkoJxiPaNvCsSjZh
	 V8BVc08IACTEHw033nz0hCDmT5xk2EMUmkxILcsUAZaJB8IfILCJxx14O6v4FVQwmBDQ+
	 wrtqVFnwqPirrQDBBKPoqJk6g406TJq02B5OIXrOoxAHdr7+pI5jaNEB8L2mJzvj2vl9f
	 m22D48YSBprxaCfGISwcupFXwqjbNBiynBMDRfFewsNtf0pScwB03mXIHeteY+qwGlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194450;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3osCUGKIRdfqRxbfCMoBYSTVDqH7GGYQBf+CFlyvQBQ=;
	b=G3IaQMjygeBrqAuXJi/5C9DylzUbliSsrNKE3lxHkHi8FD8YOejqJ+bpY1jlstgtqLMt
	 6/qXkk0J+2+6ejFnZ2t7XtB/hyUS7uZhUPfZmBIbbspDil4biMtwiLWGtFy8EIFiEKw/L
	 542yMwK9dQA6ToL2u/aRuc7K6gcZquqbUvNzXCfGG2M8pyGbo8hAhhQzlWusHLZRT0wwp
	 W/pk9FipW5pwDQfTI53iCnZNDivFHQkJVpsL7zNjUVSSzyBbJuQn37ciNXIDiu8wGfuNK
	 mqkOICOPJcWdh5RqtzVuBbR0x14H/87GAbykcP7ZwxYrFlLtT+6N21BocQf/h6842tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=blds9jFf;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5AB606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=blds9jFf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J3gMqHFmBA5xrH8UutN0iiV25mi7esd0zElN1ijyFSU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794194447; v=1; x=1794799247;
 b=blds9jFfeV9SVeB80lkN552mpjUA3H0ztMBsRhLkFxDH4ACdKfsQ9IpMpRGQtKKSl36SrfkP
 aSH7UDv01C+h5JlyT9k1hjQ+CT+gRRxEFZ0yTNagLT33q8tyEZIQZbNHD5+Ye81Ux+PvG6gFA8H
 sobYH50R4WR33Dg5gJ4x3OqO8uCgOzCz2N+rzSuVnpxtvtHDPfkQpLVgIXI2EWjC9/M9wq1wvVX
 xhzSemiuJYBc9saMorQ743TmUTMvx+PABFbPboEVbTCSARYmiqnredEnaSWfRnvS14ZiV53VD0F
 lKMtzamxxvKBylytQ0291a0QdsC+7GL3bihD0TXf+MMKQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 804fbb3a37150994;
	Mon, 09 Nov 2026 03:20:47 +0000
X-Mizu-Trace-ID: 804fbb3a37150994
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:20:40 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] docs/zh_CN: translate threat-model.rst
Message-ID: <avE8CDLZhiILn8QK@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <704397edfecc39bf93ea6871aaa149c750adbdab.1794153793.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704397edfecc39bf93ea6871aaa149c750adbdab.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Translate the Linux kernel threat model into Chinese, including English
> changes from parallel history merged into docs-next.
> 
> Also includes bea79063a351 and 11f46e30e688, combined in merge
> 2bdcd6cf2ac4.
> 
> Update the translation through commit 60763c2f834d
> ("docs: threat-model: fix /dev/kmsg reference")

Looks good.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../zh_CN/process/threat-model.rst            | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst

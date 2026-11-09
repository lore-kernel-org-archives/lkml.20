Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231178;
	b=5YyQF5+fOTxrA0LiwLX8cp1r836jR3C2h5AsWbbYSpfqd3CItHZQXasgte9ny0kHRs9Z
	 Q0t6I8fD+xOm0OPIAlOEeK3ZaVDLNNtP8ZufjPV0nz07ohsH6nA4HUDwXG6h2ve7bWo5S
	 6mcL5OifZqAQb7bIgW/syTZdQ/424EEcOgwT2G62KeSdpzOSLesZN+89SrI/kdMW2x9U8
	 6lAf/N8V7jLsir85mMcbRhBnFNehLIYqfhvx56N4OlQQ8ReahzYSRr00I3y0NQN+iynge
	 WxJAdl2bDzu3obnpACnu+aVL5UBZ2lU9omKGHQzRntOOjge6Ny3mD6LEyhsCLEWZQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231178;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=40bKMwmS+zqliWyWpfE0ENwj1eMynIlSudH9fVtlnO4=;
	b=v/2YcgtUi/Ip5l1fs0rBOrin7yccaN/7hbvXgHCGvDP3wC51tKCNPLF+gR2JtHQkxIKF
	 /SJrYNyfGKNCYl+7ntsH+IJsa/BSl55iQXVyZAcfP5BCkiVYfewBsPLdJ8MLcqGku7EiF
	 Z4q/QZbX1P6e2ziQxFWHsrRaKHYQnf8tvk3VIu+IHWH73BNeYCuKa9MnNNNJ2ZUwvTrXX
	 vWhdi5deTvM5UI1bPssgu7FVZ0++rI/Q3i1KXIk7gJEhCcpPe4gWSyvion+Rz0//dQN42
	 U6g5JudhUAT1IQD50YyPr2HOGZs437QQw1P/86QKhCbRemdSct+CdjxmT9j1mCtVV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Bbm86PvU;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B35606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B35606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Bbm86PvU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fvo0rU4AAAD5ybmggyHQoZ1nYUH7YGGjSe5YZFFbZuE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794231175; v=1; x=1794835975;
 b=Bbm86PvUjI3zrbGY+81JkYDU5PoHIZDhecLGKWYu2QzvSduoHWC7fC8GVqaJ6gu7+Vdfg/Ph
 thyBZi5PFa1MUb64BUCAw8Gt0Q3c8q4tBqRn/o7Y65RCv9qmp7zZhGLn6Z/TcGTVOCxQqXTWbNx
 1iY0tXMPH/nov4HTuyaYYy2cF4riz9oe+dFlHLdshxjYoIfOFDuxN9SY2pWrAf01xu3RzMCoMPs
 jKv0h+h8ZhV+jPLhlIM7V1+i94VHtvPWLNvQPX1sKzXvs/f6P84rCa6RLSaHZEDoBIo2elc1Kk5
 y/VynyjTbqYdMxfnEKbx/l7UbSRDC26m6M5inVCOhvBYQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3a5308d7d69d732;
	Mon, 09 Nov 2026 13:32:55 +0000
X-Mizu-Trace-ID: d3a5308d7d69d732
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 21:32:45 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] docs/zh_CN: translate AI-related process guides
Message-ID: <avHLfe6N56YjXa-i@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <cover.1794197977.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1794197977.git.dzm91@hust.edu.cn>

On Mon, Nov 09, 2026 at 01:21:36PM +0800, Dongliang Mu wrote:
> Add Chinese translations of the process guides for coding assistants,
> generated content, and the kernel threat model. The final patch updates
> the coding-assistants guide to link to the new translations.
> 
> Changes in v2:
> - Add the missing Signed-off-by tags to all four patches.
> - Spell out "AI 助手" in patch 4/4 to address the terminology nitpick.
> - Format the English commit references in patch 3/4 for checkpatch.
> - Add Weijie Yuan's Reviewed-by tags.
> 
> Dongliang Mu (4):
>   docs/zh_CN: translate coding-assistants.rst
>   docs/zh_CN: translate generated-content.rst
>   docs/zh_CN: translate threat-model.rst
>   docs/zh_CN: link AI guide to translated documents

I happened to take a look at what is Sashiko's review on this serie:

https://sashiko.dev/#/patchset/cover.1794197977.git.dzm91%40hust.edu.cn

Besides the Original: and Translator: thing, Sashiko says that the new
translations below are not added into zh_CN/process/index.rst.

And I checked that the English original version of these are indeed
added in their index.rst, so perhaps we can by the way tidy up our
index.rst in Chinese process dir and add these new articles?

Thanks.

>  .../zh_CN/process/coding-assistants.rst       |  74 ++++++++
>  .../zh_CN/process/generated-content.rst       |  97 ++++++++++
>  .../zh_CN/process/threat-model.rst            | 168 ++++++++++++++++++
>  3 files changed, 339 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst
>  create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst
>  create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194410;
	b=Y9aV4cXfJ7x83yWCJP1ua4dJtEWhfhcAhqyq3W2Z1A7h8UCU7oSxICbxbtBbG1thCcDP
	 t8e9ZwDJ9lGiM4XUOTAO09yWSuZ9yPjSNEjm5DopfQeP4otGGgxk2J1uzQBBoF2l71D9u
	 K3SXasDc1eJgVCcJJQLBA4oZNUF7OmrxWY/4HrhQfKf0umljPncpquec9NGG2wy41KzHj
	 BEhdvCOT8kBOE+uMxHw75JIoWI4hrz5QphgpgAtI9qu5lPBDdO4sBVI9qyKLob0Mk4zaT
	 omiqGvshXMT493dy7/n1ej1kFuh7oC0KjbLqidlRpnUnnYh9Qrg+14sFv4m22T/qmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194410;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wvUjJjxHQlnsKKjyJEA28+aBWiOPBQlFBm/S290B1YY=;
	b=PYv/WG6uhc1cf6hJSycubu9PKBWP+WE1iY0JSWd/VAcrNtg6XTcMtoliXIPrwDQcEfHe
	 JN/zieI7xKLFKqmEo4oSlF1CvL5raKVVEwhLJQho7CtIkT8S6PpmVDmoK25FBW4F40Rbj
	 ioknxwQibReeawmHOdG/nG5+y4ZZkpXLFC5koRXmaRJHlFXadyStbC0Kf8Kn6u+xkudJK
	 YwQ9xe15PXIVvtFp7HN6IUfJFlNnYDo2tdUIsl3WiozfalI/KlFSeSxKkWNm00Nt+6B9d
	 89OPJ/DMk5cPbEaGf1j4xfeQkKeHHCWSoVR63h4+22aiUB//gfpjc19BX3JXuzNmGBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=T2jR5uxc;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E2606D808
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947E2606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=T2jR5uxc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l76p5syP3Ga4xbpI34kM6f3DFplLBrGLF13uwnduHgM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794194407; v=1; x=1794799207;
 b=T2jR5uxcUPRjRZExi5rfGnIUXtsMpdYkLmBERNYJTjybAzUpOmJwfK+OJmdUn+/UBow7pbiX
 Ts7/50KMO/DTyCQqkoXg5bFe2jhZ0qdIu4MpAsmld4NyPXZO5tyTF0iks3ozzoTDU8eSMiXczL1
 wf205eViiL82NafFK5xBADtZPslIIkFc1xsxdE5gQ0ZFfX55tbrGuffg4cxu7V8ayaWQkTjmZmF
 tDzQFj+3D2RFT0GdB1RLFkG4oLdhvaaC1MtXPVK4EaeYcTn/Snhj3vQN+IC/jqjZbhd2reVqpzZ
 z4Sy8jA0K7oEWmMzOzxFMi/dNEV3v5uADUlxp27XQIlGw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3fab9cb4245c610d;
	Mon, 09 Nov 2026 03:20:06 +0000
X-Mizu-Trace-ID: 3fab9cb4245c610d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:19:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] docs/zh_CN: translate generated-content.rst
Message-ID: <avE73_PRQNZ5I72w@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <541a2e0f4958f2261db1397b095a8206675634a1.1794153793.git.dzm91@hust.edu.cn>
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
In-Reply-To: <541a2e0f4958f2261db1397b095a8206675634a1.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Translate the tool-generated content guidelines into Chinese.
> 
> Update the translation through commit d699a5da1039
> ("docs: link AI coding assistants and tool-generated content pages")

Looks good except missing your sign-off ;-)

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../zh_CN/process/generated-content.rst       | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst

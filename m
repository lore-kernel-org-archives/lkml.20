Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185064;
	b=LVsjglRnYVYrXe9wpNFs4FJwbiBU739iRhxjZ6G1ZrVHKARfQYn0Sk2PQqr2S/vl8aFJ
	 UuPofM8o+otwE1FTNtfRkY0Q2T/ywJH7M61qce43HU0TADNLlDOWsjYQ1Zoq/CIgC+Sz0
	 0GaRmFk/ylpOcsPbr9z2UWhVSIL8/K7VaSFp7q+1++I44LNVYl6nwAH9EUnM870s/3MHW
	 qBsRnv0vuWvaW18hXfHdaZP3Ki/qKmBnI5HSo8jD227b++GDKd3qno64Ko1B28B+KE0XY
	 L5YDq6J67aS4fW4N3SF3s6fa680dnl2Vml1grOahSf/sjN94423XkRlJ3wb71npZFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185064;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WVK9754AbhaserE7pDTK8lkgwdfKH+RPdCklp4kneDY=;
	b=1a1NGaP06VOZG8XTFOPI4A7o6z1kRLVFovUz2p1eJ8sKV8u6/sMtRbIZIy70rA0SupwG
	 I/gpGrYo+ZU99IQ1t6tPr2nyIFNu1zLKLQBGHUjHO3jtxptuG40SLndaeSCLVhec1WKa0
	 K/YccFr/H7r/5iAgq5tU7zaKMAnTvM34hYteOl7pU5XcNqAOeRtFg2O3xsBxo7BSYSU2K
	 UH4O7c1y4/bqKmtRegMGmcnVfKEJGqab3ZNqQ+GAQe8+o5t+c//EuuE3m1MNf7F/DdY8n
	 Dp3gQf0/FEjNphVrcQbgyqdcoXAs8rDQdsil7Qm6kd8ok5Hhsz1CmHVIM2BAHtiHXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gJpOUVfi;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA8606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1CA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gJpOUVfi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Iw62ApeDmEE/KzKDeztGmiVXNKB2w6E2fDgNhkDlzUs=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794185053; v=1; x=1794789853;
 b=gJpOUVfi1+tNTZEqSMbwZ76uDzzljwqCqC7KEaKt4nI2ODxj5hxzhS442AzoSloRE1KkflYD
 yMib4AmV3ZdPbJm0qDtwZvKMANQnNZlNFx2TktQ6nwYCiqql/TM5WWvA83qhMyTWsuFc/nLFHPU
 4R7dfByZbDtywUab56VlduFDeOmO7DbNivjbusytyeNchE4OtYDB/BPa/SdT/5oq8QSI3agD5Ap
 M+fW/eaGsL96bhIGQ/FOYbkRApXsgr4m+QwcuQ7tI54//LYsikdk4A947fY8S5YtH1YyfbeUdlL
 HHX3is2F9e5/Ljvs4PHCjKtUukkk/4fjCcmVOwMF8VfYg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15d0d0b0133836ed;
	Mon, 09 Nov 2026 00:44:13 +0000
X-Mizu-Trace-ID: 15d0d0b0133836ed
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 08:44:10 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] docs/zh_CN: translate AI-related process guides
Message-ID: <avEXWkPrGugQSQX-@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
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
In-Reply-To: <cover.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Add Chinese translations of the process guides for coding assistants,
> generated content, and the kernel threat model. The final patch updates
> the coding-assistants guide to link to the new translations.
> 
> Dongliang Mu (4):
>   docs/zh_CN: translate coding-assistants.rst
>   docs/zh_CN: translate generated-content.rst
>   docs/zh_CN: translate threat-model.rst
>   docs/zh_CN: link AI guide to translated documents

The last three patches seem to be missing.

Thanks.

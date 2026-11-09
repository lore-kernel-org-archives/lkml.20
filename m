Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193572;
	b=QbeLhwv1gX7jKHKQC70LNdF/qLl7bThJa6b7KX7q2r+pqMi2U228AQM6NZ8VFdfh90T3
	 67I3keUNEFzAYJ/dYJlvbgdOw4/4efzThRtQ7an57JlLzAnPpVf0RCY9G38F2ga5oSTwl
	 qCb+fR4zHuWVQ0sFpgug8JW+AWWM0Yu4eYE5R3aNF5RRTbf6hbFFqU12ZFCSFw4/xa4bp
	 2vScXNj0for1vgK2gjJqpwym//4CFV4M/9MJw1/iJ1pIIA+/thA8Xsu00kv8wM9lV11tH
	 WbXP4n1ZKLObnO91DsV4Jr5bL/N8fPwKnsIns/wjBX65nY3hR1gvunHGexqloSsr8IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193572;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o9zafs2e9G51V21FfLQ+Dlq9NfXDTdkSswrg/M4DUy0=;
	b=qgcJLsyjnkD8M0VHwTNDp0Y5FK7P8mNWLCpIKgqAb5zfARiCOAEnJiy0IETfc44MUstR
	 3hWprAGh7At5pIqverIL5/AifDx2AtkRhE+RkxPvdgPKi0oNwB6gNbk5kWaAAX1n5n2bS
	 189+GDADCUgomz15Me49KUtJkxR52amRKRt1Aeb+EisOx4m51ZkNJHxM5hHeNA+ej+8n0
	 Lr5gbwZXxE5HjG6DVGHZBvq2nQWJ83bstqhNaLLeF8aSUXovMMQU0QLOM/EfwStBIJsCn
	 MdpwcJErbX3ENr+8updzt0S9zO7Ka+O95TeQ0BxBoqMvApQRR7DHj+PJ3kNjE2G8ipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ShHgbWYX;
	arc=none smtp.remote-ip=91.218.175.77
Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B937606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B937606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ShHgbWYX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+dnZV2wn7xOwxVNqzFzRAdBqR7l4CXZ9Yzsru1gMpnU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193568; v=1; x=1794798368;
 b=ShHgbWYXa7grYKg0K/1tc42N+DgD8hwLhQ+319eeX6sOgF4OeBIMZDENs6YebW3gHXkviHnw
 MhAXXAtXG0utybwR7pYCtiQycvAO9bdZMsbnhyilMFsYzwkNGsACf7jBZDEGT6X7JTKcT6fYuoT
 XRshYnnMVpjQPfqNsyo2tWkBrE+RsAiDw7sVSAb4y/w2ViRQwE0SGge9h3TPXA93ohsYvLmTMb1
 spvlGDWXI7GAHyzgArPMQ5I4DPht3pJn/K21WTIFzictJoVccmEebwAibTrzXnbnjx4UGC9uzHD
 2sTZx5+l++XZ386DOFxT4WWfsujD0Nt44LJ2OV/cei6cQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24f5bc051f22241e;
	Mon, 09 Nov 2026 03:06:08 +0000
X-Mizu-Trace-ID: 24f5bc051f22241e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:06:00 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_CN: translate coding-assistants.rst
Message-ID: <avE4mPgZOx1th2FE@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>
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
In-Reply-To: <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Translate the AI coding assistant guidance into Chinese. Link to the
> existing Chinese license-rules.rst guide while keeping untranslated
> document references on their English paths.
> 
> Update the translation through commit 1e035297ffda
> ("docs: remove Assisted-by references")

Looks very good.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../zh_CN/process/coding-assistants.rst       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst

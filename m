Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957638C43A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987723; cv=none; b=TF2whbJgKx5AXWXE9gzOcG2Uj5UHetXVB8cZYoCZTyyW0uw5/w4axJVYuF7657+N2AFmlYcRgLZt7v1kew/i71VgqgcDMZGJxdLM5ooM4fg6eAcw8B1ikTKT27M3b18m4AMoOLo5htWiqItZGvF+1nxQw9LhAtGwF2AI3KFqHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987723; c=relaxed/simple;
	bh=SWGcWsZvj8fiVLTc4wzzXvO66kZLaBJbnY4FcfB6iKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkxqVGzboTPW3WfwMiqCWeC6QVq7rd2zMXjWSqmqzrntc1yDfRRJa3DpU9F1mB3a/2zYUtPZ0/2pETICEzDv7KGNJeMJeL+QWoIvAnmHFHng+rnETuIxRq1UXiIxxdzTQW5lAQr98QHSHG+j++h2kMV9QxEvvq3Y4qCHTuZ6l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Pn5xW3pZ; arc=none smtp.client-ip=95.215.58.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Pn5xW3pZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SWGcWsZvj8fiVLTc4wzzXvO66kZLaBJbnY4FcfB6iKo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787987718; v=1; x=1788592518;
 b=Pn5xW3pZVzeo4ZjngNjB/qv/DJNpDd98nEVW3nCL6coaRlaTwhM3eDmc9gaGGxTXGZxNPlmO
 Ch8jzuS2soW4HN1NKeZLwATlesV2nd4sb/PHYcv+qBs4XHk1DFFMbjY2KedS5eaxEE9Y7N2/ihG
 SAjwtdFA/FwNCvdcr2o06TRxZDjcKbc0XsK3Y9WbeIezbE/q6i5Pd91Yrx+cY5GFCSa5Xfj4e3i
 rKTQ8mgx5B6gBLhJx0NtQZZwzlKcs5z8y9VUdd0TFLgc9KYLmIhT8CuHzBOpnzeFu0i5Iaxgs4M
 QTLo6N3O9ofgPa62o6L0CZDvZL5GkY0vwAVMS5/kIfcaw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4fc2f53bcf373baa;
	Sat, 29 Aug 2026 07:15:10 +0000
X-Mizu-Trace-ID: 4fc2f53bcf373baa
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 15:15:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
Message-ID: <apKG-g3vNMtgvV6y@wyuan.org>
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>

On Sat, Aug 29, 2026 at 10:23:27AM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.

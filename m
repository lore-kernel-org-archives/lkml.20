Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE142367B94
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752568; cv=none; b=uKS5M6JEmiKgww8EsHN0fv3XHzkX0/hHbPJagP05+F1Q8Vhc+o8mYsFiECHYo7+mXbbSBTiWn3j0fnH6egd4rWJyJq2Ql7pS9bXvEPOL1WZn+RTmUR63ogk4qp4wsgx8n3FXYpEWAjGlSbLclGZZ/jCmRDPd6+TvBS7J+zfTJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752568; c=relaxed/simple;
	bh=REx3a5lF2QwR+InnxWsz0C5TI87vgG5RdoFTXAi0uc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYPYs0yo8WTRGjudtdoJMtx8k+fTSzSEMRZxw58p2Mw/wOBQt4ymzBVxeRRfexiqFKKRn7BpAzcFbKkWWdmw32e0nln7fHTH52AxeR4axmdd7mDAMsiDRPHaG7G0zWjI6K/qBT0iFWE+USj/T2MIZmeiTglYPOlolO1/LoJQFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=RgNJPRJD; arc=none smtp.client-ip=95.215.58.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="RgNJPRJD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=REx3a5lF2QwR+InnxWsz0C5TI87vgG5RdoFTXAi0uc8=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787752562; v=1; x=1788357362;
 b=RgNJPRJDKToan6BaOjdkkj3i1dPpMoqRWFr8kBMAve0Jbn4ralcxOYzpId/nWhR0He6BeoTu
 8pToVd3erPiJdKxFj6esduLgUOXPX8EJWYdiZ5CPbsu09O4fnyOm4Rj0z0qWx1/DaAajSdZdJuJ
 bq33yTuhllmeL35QhjOq6xIJtZ3Z33nwN+ffvjLDjeFzuXylgDg8QwqOQrTGLWLBLODt5XXGtld
 fs/5KfowfL9R1L8IS3xxDzf3xTituFU6PIh3hSPxV5+HSZmV6DIrhv/az6T1EWNOn7XTlfMNiHB
 ejkKxQLCAEugAIW138Dz4CqCfdPjwXfBSzDYn1iRqHnLQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (117.176.242.37)
	by smtp.migadu.com with ESMTPS id 5ae4a2ba5e52065c;
	Wed, 26 Aug 2026 13:55:52 +0000
X-Mizu-Trace-ID: 5ae4a2ba5e52065c
X-Migadu-Flow: FLOW_OUT
Date: Wed, 26 Aug 2026 21:55:43 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: panzhipop <kipp455187@gmail.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: =?utf-8?Q?replace_?=
 =?utf-8?B?5o6l5Y+jIHdpdGgg5LuL6Z2i?= in stable-api-nonsense.rst
Message-ID: <ao7utpvxM3eWpumQ@wyuan.org>
References: <20260603193408.140445-1-kipp455187@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603193408.140445-1-kipp455187@gmail.com>

On Thu, Jun 04, 2026 at 03:34:08AM +0800, panzhipop wrote:
> In Taiwan's standard terminology, as defined by the National Academy
> for Educational Research (NAER) term bank (https://terms.naer.edu.tw/),
> the correct Traditional Chinese translation for "interface" is "介面",
> not "接口" (which is used in Simplified Chinese/Mainland China).
> 
> Update the zh_TW translation of stable-api-nonsense.rst to use
> the proper Taiwanese terminology.
> 
> Signed-off-by: panzhipop <kipp455187@gmail.com>

Although this has been merged, I kind of suspect that "panzhipop" is not
that proper whether as a real name or a known identity. Is it "Zhipop Pan"?

Anyway, just keep this in mind next time.

Thanks.

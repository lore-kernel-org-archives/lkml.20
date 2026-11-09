Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194305;
	b=W7qW2XmG/hnyFkn8JuWsgzh/iY3BlZQACJk7YrfvBBCjR+0rtc/Smf9k+zCJgJfN+UU5
	 Y4T65cDYO92HR+1Qg7TvLjIZAVxNAKYuAzu58TTYHOVy9JGNivohGTTQgH+eQo+zLnA0M
	 3vxeGfQ22VYW419LV/sRrolZTMijtszEDLcjv6i2HU7Hgdnf4hHeTX+ZYfJBYxkgobzra
	 nGwCWu8ykz4bYl35O+EKm7Jp6pEUKOcVgKT89HzOs9DG/8HdKIGhNbb5V/OfOJoN2fNhc
	 uFhYUB3vLOeOHQl0zSUbgHv4ULKAuzfYPw9p2fmV7vhJnTzkH1P3nici5hc8xTlWorg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194305;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ho2n2m0C4upultPSmUZGZo/C4dJ0o7j+fKnGqA7y1jQ=;
	b=J+zoQfUNrDxeBkLLi/buLca+xhonNu4pcDdnlQTQCz3LoZ++6iksb03IoQAdkiVnZHu2
	 MUJlfjysPJIiQdue2i5NWAneKgM7CxSY/srbxQSTdUk1xea8dFa5rHZSjV9mb1KburXIi
	 Earf9qRlSTgcwdgFuw7BEoaSNJwiZ0tvl75GTbU3IS1JJ+8divfMis2rNVlJaMRNnUQH+
	 ZdCzKiUYVt8o3WaTVclA14PeEx/9z621Ws2DTONiYGiKllvG3i3nkSlMr5t+IP1xmIPwd
	 SeiJ9stwaNhOtsbN5A4BirIqdYvvohDBB6AGx1plM6NZelfPoSFLAvU/H/j/ueAPlfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xrjH3sPd;
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xrjH3sPd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ag7n8AaTG3j33PCW+KCpehGT2YXRm9dTVy3ZyIP/LZA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794194302; v=1; x=1794799102;
 b=xrjH3sPdwbI7Qs7TXoayLL67ixtAb+dZynjtORxcs4v13m2XNWZQARJeSzr86Vwbd3pl8z5B
 T2vE1H066eFDiItjLQ5gXW6/0xIZqEig51/UWs7AdV/lDALLSqn57SDwwDEL+8lUajcAFtDGxM4
 6LwxjsTLhX+wCrNE6JriLsekKfTA08QQehVaxwY4hKnT5Ukn3qLzz8ahMjacOnUYA37J2xodORb
 7LRQZBH/lNZIXyKwLhMXkLMTmFfc1uRjaN5ZrQz/mVNZ9ACfvQQf+ay+826LWHHkeBdkcqKJBQh
 Uz/XNYfX0eNSBqeYnEEp2tV5JBoZwttn35sgyo1aZl0tg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6defdb246e5ad1f3;
	Mon, 09 Nov 2026 03:18:21 +0000
X-Mizu-Trace-ID: 6defdb246e5ad1f3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:18:14 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_CN: translate coding-assistants.rst
Message-ID: <avE7dsawxAjrz-Ev@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>
 <avE4mPgZOx1th2FE@wyuan.org>
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
In-Reply-To: <avE4mPgZOx1th2FE@wyuan.org>

Weijie Yuan <wy@wyuan.org> writes:

> Dongliang Mu <dzm91@hust.edu.cn> writes:
> 
> > Translate the AI coding assistant guidance into Chinese. Link to the
> > existing Chinese license-rules.rst guide while keeping untranslated
> > document references on their English paths.
> > 
> > Update the translation through commit 1e035297ffda
> > ("docs: remove Assisted-by references")
> 
> Looks very good.
> 
> Reviewed-by: Weijie Yuan <wy@wyuan.org>

Oops, you may forgot to add your sign-off in this series, and this
single patch:

  https://lore.kernel.org/linux-doc/20261107000338.1243411-1-dzm91@hust.edu.cn/

Thanks.

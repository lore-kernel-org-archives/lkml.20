Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742869;
	b=By/AscP9NNn69Cx94Q0fjpaA25ma0TqiWEl/n1SHiv0GmKRRiK9bgtellv+nHOm7GAjv
	 /yniUbHGeJZoeCRfFI+He4sa4xMM6lskksGc7OmE0SQTHzW9EJCDt8zVBwb0kCZzPMTnD
	 1Q5UnTsM5tSNI33ovJoqJZX0lmipCsR5fQsKKYTNhYa78LXWLuuuPynM+FbzBwY7UNTGD
	 /AB0A0OIpZVTRqLVHR1pgLr9ujgaiZUQd2j+trF4hzDqbNVFKy9z5ruuYo2QB5fyOD9cA
	 ldc5wuAlxv5F3RlPT7k4T2nPrxrzt4fySM60f3XZ+cnVC9FstQkzBe58Ef0/GeU/FNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742869;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vkqZadPllCGKDreYI6GA6t/bzBB5uvi+cURy5w7zs1w=;
	b=1iDGHH3YLisAlgDWE0IrxlNpSW+VW9cgbaqRchHkQNcXKmDjZFI38k2G84tfngUs0aQx
	 cNkbaAmDW3/9pYIE4ogjWM3lZfp2zW+/iYAN9bf2EBmZPnDirQ3VCGJ7NZZDgQ/SCKDSJ
	 hKS69TXBmKzwFIYM6SVRyih+QQw7HTiX/S4750aVxe7bVvzMqL6T3bR8iWaxKAJ6GQJrD
	 0fB5W7zpMQ7AAz0Yg2Nmq6WyN69mKxcjQYxBCx2l39q+zv8STEYcppUh7oOY54eCx9Kdo
	 EvJA71ZaC0pUJccLJZvWHUFPLhOvPlwMYR7Onz45MaGOQVOhAjN32UBio4oKH50CJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=G7jstguW;
	arc=none smtp.remote-ip=91.218.175.189
Received: from mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50495606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50495606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=G7jstguW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DOP+VRYv6oAtcRsEsnGnVwBwmemJYh4b98yAbR6W+ww=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792742865; v=1; x=1793347665;
 b=G7jstguWA9q/YUsid5EQsuXUEt1xDfSEW5mz0oMH9WIHSevOpo3t3/ky0399zhrjueNN0dSu
 PEhD9e3sibgDTPpyL6RQHgekfrFmuE7PkEHHj9WatYl9BZSh+OsG15EoTlD+vO4xAZ4geDr03Ts
 uErGWWv96b373cLMwWt+lpykfS3Vpm9aOL0YD51bgncGvHHESDH6opOVOtAsXh7ulaf6c9hYhbW
 FwNdes2+q96Ai2YFiKTM8DnYfNCQl1fkXCWyLTBxdBJyFrTgevSuy0BVkx4JWs3ROAispriFErq
 ZCxy2YxhSW/f4H6hRFUgpNTh7ysxELToRxbTnPVeEvGjw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2b39aa43c80c513;
	Fri, 23 Oct 2026 08:07:45 +0000
X-Mizu-Trace-ID: d2b39aa43c80c513
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 16:07:41 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <atsVzSRDCKuOhtsp@wyuan.org>
References: <cover.1792569583.git.wy@wyuan.org>
 <d99d7c42d635bc121c82699c9e0a48547f98a972.1792569583.git.wy@wyuan.org>
 <f5df0d7e-94cc-4ccc-931c-8b9af333167d@hust.edu.cn>
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
In-Reply-To: <f5df0d7e-94cc-4ccc-931c-8b9af333167d@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 10/21/26 4:15 PM, Weijie Yuan wrote:
> > The headers related to translators and proofreaders appear multiple
> > times in our directory. Their information is duplicated with that in the
> > commit logs, making it difficult to maintain over an extended period
> > of time, as there have been multiple instances of requests to update the
> > email address.
> > 
> > Remove the translator and proofreader credit fields from the headers.
> 
> Only one issue below.
> 
> After this patch, we can continue to remove the "Original" field.
> 
> Dongliang Mu

Thanks!

> 
> > 
> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> > Maybe Helped-by for Jon is more appropriate, but I did not find that
> > trailer in our docs while Git project has one. :-)

[...]

> > diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
> > index 55d5da974d89..c76b85fc1f07 100644
> > --- a/Documentation/translations/zh_CN/process/coding-style.rst
> > +++ b/Documentation/translations/zh_CN/process/coding-style.rst
> > @@ -4,11 +4,6 @@
> >   .. _cn_codingstyle:
> > -:译者:
> > - - 张乐 Zhang Le <r0bertz@gentoo.org>
> > - - Andy Deng <theandy.deng@gmail.com>
> > - - 吴想成 <bobwxc@email.cn>
> > -
> >   :校译:
> >    - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
> >    - wheelz <kernel.zeng@gmail.com>
> 
> 
> Remove this field too.

Omg, so sorry for my carelessness!

Will reroll soon.

Thanks.

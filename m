Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120774;
	b=1JHNiONGRJjzchE2b3wnHplK0XpseHsGIj9xXSERLTK5Nnq/aOIIj6QLUusQtD2jDtyi
	 WdJx4LZzyQIrvLxntRjhlxLf9WiBiqU00klmNGnHTm+ce58I1ui3JKI7a/Zu5hRsJYNQm
	 JdurdE+0mkHZ09/9vfrBGhU+lKO7wXJ+A1EElDRBZSn7hER+kvxio9RJe3o8VBPVOtNfA
	 hPxgOWLaLVmUS/G2RbsZSiPXvYKqzJNaW2qd+fHtzzR8W0e9V1H+RqUcZb1uL9HJSIMTa
	 LKuAR84qHd1cF0a/XEFwYoPpau1C3gqx3gFj7OMC9wihEi9FI/xpUg1JXmWdfFsBIXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120774;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HP+ot5aEkXG3bge6Mu2HzG0aLbRcC1QumRGPIWw00Dk=;
	b=u6Nv4GY+z+8eoKY25R7+Y2cL/mie26/jKrdSLRSSfEfM/SwJwaKyMtADxdn2WRv6BKZS
	 JHcrZCYFrNhHFSPnGxj391hHrWJvKe1yX0RfunbCswEna99O6gVA1W/C/fj/yXwwtDCyI
	 wTDBv3hpoCtzZALnF9k4zX39rR//5V5KdJuLMOrvfAgQn/U2fc8YNXPq6JwzjJkBe3FF5
	 +u7/GHq1EOMC7Ta9gWYl07R5GubccLEH2MXT0seNieJ89NBKrQHYxpbpX5BZGb4mlk2z/
	 SJLhs7H1NJAZQlOcDQ7cJf+cJkj5ws0CQRU3JTnclKaYqERD/H5PSU/N7zVXbwNWnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiZbrhcs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E1606A31B;
	Tue, 27 Oct 2026 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiZbrhcs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F13F1F01825;
	Tue, 27 Oct 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793120773;
	bh=HP+ot5aEkXG3bge6Mu2HzG0aLbRcC1QumRGPIWw00Dk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LiZbrhcsaUP9XSBdNAqnWgEyLmAvy8P0ce3QSR9/hMN4/33O3X+WKgTSvw3Vzyja+
	 IuI2Uh0TwZWgB0dMBERTQ1h+FZ5XR+fAUUkhj1VSSbggpiZ0HL0HMjHrBqxn2v5SIr
	 3YtNOTUg3iXU9V8MOgU8H2CzDogV+EveKJ+z/cn0OR3MlQSD3WYxZ3f2umByYvlgAg
	 BHfZ9uP8N2922x7HGOYt8YivO0ZGdrD0gZY9e4+eBZMfW4FqspB5GYBUrE9xpqpk5D
	 oiLqr8DTAGtiB4yO+RZu9+MT40+pmVytL6V52NyZvABwMsoYM3QqhEmE7vb5bjr9Ck
	 uM5ji4l8XCFow==
Date: Tue, 27 Oct 2026 18:06:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: Recognize Deepin for dependency hints
Message-ID: <20261027180558.3c975c90@foz.lan>
In-Reply-To: <b3e985f11140daa28718087723957e2fbfa4a538.1793119566.git.dzm91@hust.edu.cn>
References: <cover.1793119566.git.dzm91@hust.edu.cn>
	<b3e985f11140daa28718087723957e2fbfa4a538.1793119566.git.dzm91@hust.edu.cn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 00:56:50 +0800
Dongliang Mu <dzm91@hust.edu.cn> wrote:

> Deepin uses apt, but the checker falls back to generic hints because its
> distribution name is missing from the OS mapping. Route Deepin to the
> Debian hint handler so it suggests apt-get installation commands.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

LGTM, but where is patch 2 of this series if any?

https://lore.kernel.org/linux-doc/cover.1793119566.git.dzm91@hust.edu.cn/

Regards,
Mauro


> ---
>  tools/docs/sphinx-pre-install | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index 965c9b093a41..d1af82e1466d 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -1137,6 +1137,7 @@ class SphinxDependencyChecker(MissingCheckers):
>              re.compile("Devuan"):                     self.give_debian_hints,
>              re.compile("Kali"):                       self.give_debian_hints,
>              re.compile("Mint"):                       self.give_debian_hints,
> +            re.compile("Deepin"):                     self.give_debian_hints,
>  
>              re.compile("openSUSE"):                   self.give_opensuse_hints,
>  



Thanks,
Mauro

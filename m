Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793148167;
	b=LR+2RfrS9UsD6uODS7zlXyaH43+litLx14+T3jI3sBnSFvnw+8kBmLzeZ3pzS7nUlErw
	 oWenMb81tZxuXd/CC2wG8eU5QvoByxcIm8Y3Tfrypksas4PAYUhkeLqVCh99t2l7TJTb1
	 FHWEfiqgYlIhharFKqWae5wVZMKkUvmiwAfj9RSSyihnQ8vSdXcG4IhNQzkQVEppbWhpP
	 1TsFdI2d9ntQ07VkeZqaKwxzZBJT/TQUTzEZSK6/1JkD9Anw44Se6MsZbfG4tr9p1xjNR
	 H3P2XmMyb7pBzbCt348IivZ+DhC28Z9OJ8g1CcDuHYqZfhqMvzARwAqQjOmxcGc2cUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793148167;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=M/naLOEAhz68oq64xj0VJDRS1tQUYsJsZiFXEvoZ8e8=;
	b=czMpYgu12XRNl8xk9JVN7FPtXKoSK/+tBZlBJB0acfhSgm96HGx+Af6CEBTh/z55q8Eo
	 69x7ls1jvVtsqd7xljyDauOV1ShVr7/sqGcB3mudqq+0hJxE+eeSijyUB3Hz9tXtS9307
	 apejHOWc7ic/xAOANdKvfpp3H+YonyhF2/qSuPLZNEQ9BDB6kWiD3jHuOuAUalv8N+0Zo
	 cHEef0OmLepc2x84d+ORMfOKvzUOI9o5i4KwowN9KW30Bzljx/Itt5zQxbHmwBM77N1Da
	 +uDcVzuJMgPD6ZgSLYi/+vwbmdlLlQ5t/QA2s+HZ7moWwoIpEJwyxU8NDIh2vcZ4Uuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ueksnwel;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D2606A31A;
	Wed, 28 Oct 2026 00:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ueksnwel
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D632B1F01825;
	Wed, 28 Oct 2026 00:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793148166;
	bh=M/naLOEAhz68oq64xj0VJDRS1tQUYsJsZiFXEvoZ8e8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ueksnwelwxt8e6cBCTnhhe0q1rEMe0D9oTt8oO/WI55Y0T83rcCBEL92//OGqjXCg
	 GBZQC1VhJjmL4bWAIl24VhYhiVHZzen/XNy/ed/rP+uPF82DhXa0gPHhHZ7jiA2CHS
	 doKZe1MeRu8axMkes2gvlzXtzZYyyrL5Yy2+lptSccbzIeha9Br4E+ll5wGyS5MCj+
	 4F+Uuncv2KXFGVgQTILR/55oplHJ8m5F+6x6lcNqnHg+doC4dFLuIOHHC7fDCgAp6U
	 fT1EnjQO7Vg98Bhn7a8Wsc/41fHBpq3BKNm7VqWi5sQAXZsE9WLH4TUdHVecqnjrno
	 hTJDVgztehvAQ==
Date: Wed, 28 Oct 2026 01:42:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: Recognize Deepin for dependency hints
Message-ID: <20261028014242.20ea4874@foz.lan>
In-Reply-To: <7a3f8c77-9854-441b-846b-5e58463a776d@hust.edu.cn>
References: <cover.1793119566.git.dzm91@hust.edu.cn>
	<b3e985f11140daa28718087723957e2fbfa4a538.1793119566.git.dzm91@hust.edu.cn>
	<20261027180558.3c975c90@foz.lan>
	<7a3f8c77-9854-441b-846b-5e58463a776d@hust.edu.cn>
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

On Wed, 28 Oct 2026 01:10:09 +0800
Dongliang Mu <dzm91@hust.edu.cn> wrote:

> On 10/28/26 1:06 AM, Mauro Carvalho Chehab wrote:
> > On Wed, 28 Oct 2026 00:56:50 +0800
> > Dongliang Mu <dzm91@hust.edu.cn> wrote:
> >  
> >> Deepin uses apt, but the checker falls back to generic hints because its
> >> distribution name is missing from the OS mapping. Route Deepin to the
> >> Debian hint handler so it suggests apt-get installation commands.
> >>
> >> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>  
> > LGTM, but where is patch 2 of this series if any?  
> 
> 
> Thanks. My network connection is not very stable. I resended the PATCH 2/2.
> 
> Dongliang Mu
> 
> 
> > https://lore.kernel.org/linux-doc/cover.1793119566.git.dzm91@hust.edu.cn/

For patch 1:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> >
> > Regards,
> > Mauro
> >
> >  
> >> ---
> >>   tools/docs/sphinx-pre-install | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> >> index 965c9b093a41..d1af82e1466d 100755
> >> --- a/tools/docs/sphinx-pre-install
> >> +++ b/tools/docs/sphinx-pre-install
> >> @@ -1137,6 +1137,7 @@ class SphinxDependencyChecker(MissingCheckers):
> >>               re.compile("Devuan"):                     self.give_debian_hints,
> >>               re.compile("Kali"):                       self.give_debian_hints,
> >>               re.compile("Mint"):                       self.give_debian_hints,
> >> +            re.compile("Deepin"):                     self.give_debian_hints,
> >>   
> >>               re.compile("openSUSE"):                   self.give_opensuse_hints,
> >>     
> >
> >
> > Thanks,
> > Mauro  
> 



Thanks,
Mauro

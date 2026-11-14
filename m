Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682495;
	b=qnq+0HWrKTBuxTPQiv8C+a25I51P/Zi//PHWGzxVShrY7W8OPGJpP7iTpTQnhZm/tQG0
	 rdK56fxxFUxzbr1kIHn6k8wzyl3a/Rx46yGlrEF/HdE3P/p5psL6i91P+WfIPVUT39jBJ
	 Gp6M3S5MXvmV0w/6N0ccbwqBZZtWhvynXmU6G/9e9z76jkthVR4bj8eoel6f2z4y3pzPK
	 JxS7p1Yeheldt4/W8FRf4t1/T6vzrLvux+zhgLoJITctq8O/E6UTnmlycPT1h6XpPjKE4
	 dvJlSoiTnMmUKhMOM8zt0an0zEjqBpBEwrAWSpDegXEkc1h9VLrQWCHJJ/0idoqBEmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682495;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=09Hma9V4IARPkRb3a7jpTHqq+0whdMizS7F304+jas4=;
	b=MQJEUjP3r0kAb5ae7BAoPBGmfpwZ2VqvXW5+xf7UW5oP2O8dCoI4bajOuz9PBLbt4K2j
	 BVf3mawPRSljTXme0n1x2I+6KcaizM/r+rq+YxaYI+lmHVlLAl5zc7jIupEvzuh3DF/eo
	 q+Fe1DE8rDNgaUP3c/0nIdxEy1JBp07TIHdXCqF7wcDMUm6uwljjusJXPlC1MgvlZeo19
	 u+aXC8CiMuWViHbAWLo8nr60FN11dFLeeFlUJKWse1dFOGf842uXRgmsdzspQZOhqwuI8
	 FzxGVnISeS9XTvmyxQ0hwgQteva1Auk1YOuHTFioXG2Uy6jIn2J4gOER7vCbudrsiSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1enGvJk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44F606A327;
	Sat, 14 Nov 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1enGvJk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F7B1F000C4;
	Sat, 14 Nov 2026 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682495;
	bh=09Hma9V4IARPkRb3a7jpTHqq+0whdMizS7F304+jas4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1enGvJkNNZApK5ODBg9ykcGIE5gubTnRhI9ub/a8gKjvjrbnX8Zcf3USTAt+nQdL
	 q9blSES1HmmlWw2OcS5uJ21zulBR2Q6xqqw8ylAgtKyzvJ2vJnD/Fy0lmgh1baSqqQ
	 Z39mbPb0I2HhOavBGvJGOzrC+Z5h55Bv8sBksfh+/02w9h8RikR2hDZPBItBguqbhN
	 SwPXZI4AdqvB+UVD27z6oRVjyUK/8QGQ1USYQzQ0BEjzD8FecIC/yOOdGh5NAkprsF
	 Xg2FE2LLwMrlYW2OdjKXhoUb3hS6osxr+Reh0+S+HI8bTqOeo+V2yOuPJD6XxCTytN
	 1wKctlGWnf4hQ==
Date: Sat, 14 Nov 2026 18:54:49 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-docs: Update book info
Message-ID: <aviuWHgghr8wivll@gremlin>
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
 <37d65eb3-f4b1-4e45-87c5-5378d5355541@kernel.org>
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
In-Reply-To: <37d65eb3-f4b1-4e45-87c5-5378d5355541@kernel.org>

On Sat, Nov 14, 2026 at 07:28:10PM +0100, Vlastimil Babka (SUSE) wrote:
> replace Lorenzo's address with a working one...

Thanks :) yeah ljs@kernel.org is the email I use for the kernel in general now!

>
> On 11/14/26 13:48, Manuel Ebner wrote:
> > Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> > https://nostarch.com/linux-memory-manager
> >
> > CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks for this! LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> > ---
> >  Documentation/process/kernel-docs.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> > index c67ac12cf7..dd5bef154d 100644
> > --- a/Documentation/process/kernel-docs.rst
> > +++ b/Documentation/process/kernel-docs.rst
> > @@ -79,11 +79,11 @@ Published books
> >
> >        :Author: Lorenzo Stoakes
> >        :Publisher: No Starch Press
> > -      :Date: February 2025
> > -      :Pages: 1300
> > +      :Date: Spring 2027
> > +      :Pages: 1350
> >        :ISBN: 978-1718504462
> >        :Notes: Memory management. Full draft available as early access for
> > -              pre-order, full release scheduled for Fall 2025. See
> > +              pre-order, full release scheduled for Spring 2027. See
> >                https://nostarch.com/linux-memory-manager for further info.
> >
> >      * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**
>

--
Cheers, Lorenzo

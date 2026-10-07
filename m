Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36D448B89
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395699; cv=none; b=tZWFLRqOS5NpKhmIYb1qU2nvVfLklSlujg85IC+9yb5zSNaBi3mXdwrKC8Q+YSizlIg9Y6ZwW7+Cu4qpZlWDl1F7WwkknUI+nl0AI/VtL6hgjge8P2XLwg/ZE1xKVxfzUBcUTz+IsC7GKWIgN353I2NUR1wOPhX+i3ncFxo8MGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395699; c=relaxed/simple;
	bh=fa+grPkvbklXpEcDgd3+DFid/LjxxPp0jRbWlZYgCYA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfmF2UUyQB1ECa3UySo9ZVgBdP9eH6Rok4mD4T92FchoDMzTfVjyTZUbyt20y6JAuN9f0fKy+zwr97DFVLBQYBM1pBIIBUDzLPdA6eWCmsZITAH5rbPAHv9Z79NsxWy6rot+Fey/+14TUeZYD0jcvzy8oMmutiWkhwtz+h+lZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3JJlxIK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3JJlxIK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1416931f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791395696; x=1792000496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3y2jkbND3zHWy763NG8pix7Ip6Rw42Knf9ic+w2780=;
        b=O3JJlxIKGtevtT3vDor92RojEbNjBr0CD6DiTQoklG2GFcG4jae4/3xOkOt9QKHxV1
         K2axc9A6HIkQYrL7qyegr4DLvlbSp4TuG7UsjtADVNb41kh1UY4yiEtOrju/3OuQtkRP
         ziWaScA6NBh5hZL8RQq1J64fAaFfcLaJwwooRnw2fVAnC5nnTKYal4a1hbKyVDF++GT3
         6dtaqGBlyo6C3uCCTn0ll8XlUB1IQ8xtIYbu58r69yAY3+Wr8mymeK+V1e+uceBzuAXq
         KuydKY8aeZRvfpCrQB1L4WaxoR3OsJMPs8/TtOPHXPFy+Xbtzfi8hXI+BrQU2BdW/DyR
         kS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395696; x=1792000496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3y2jkbND3zHWy763NG8pix7Ip6Rw42Knf9ic+w2780=;
        b=eLPiBVL8IGuxeUmAjhplAs6H6C4yU6lgJf9aRNVNRkxjSGXSwKvsXpULyhkU/x8IFQ
         1hAhXAFp/jM0rmu2UrBos+w2Kf5TIAxK/L2l3LoUPuia/QLvIxCrjnC9fYfjd4MZ/YKq
         aYQqGFJzEXSc+YolaJD7XyjDv7xvPTqCVcPKB2GJT838+Qztfe52HUaPZdhyjkAPIXbR
         BgpAAMykjqe++Klu+Lu6OjeLUQ0s7JNV+5ytBcI1zSaynPLQghiC5gnMu2JV1GD0xVFO
         bOOusG8CAbggtaUleTYfW+JABOaU53/ZT7qqWz4DIoUZfg8KiTXOsgz68pw/VzUpu/7S
         Km0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVO468zcVyEe/nofZrHlYsGET7xR47FqCYxvOy59ZevgR4URKBIEQEmxL0wf7+ChSwO6D/z8mzUIuog6g=@vger.kernel.org
X-Gm-Message-State: AFuF++leJGt3rzarztRXxal8qs7BBfwOMQdrtq1PGH7QuENfRtJHx9sD
	kB7uxCs6LRU76MQHdQDS7yYacLqW9kuZ0LkSfX/xV7o8O8wQT7+caF8m
X-Gm-Gg: AYBFou1ug/lhuDGF95XuUOHKsUvA72T9RK8cfC2nCDPoyDAXkjGMYVSpRztN1M9ZnEK
	nm/DTn196+F5gSx6VowDlFOzBhkpimu9F0l5Osa94uiYSmGwThHpXkoiwhzrOKqxysptNBgJN1v
	hi839pca0zovitkWvaQc3s8PZSgQlcFy8FbvaeCmKldOqPG6kiE2INQKTHr/8TiwLQcQIwrucOS
	BwHgSC2q8sgVc/U6pwoMUCqAkd8JY0PwNweQKvQsxKFj48y482ORIykZZYZYl/z6JaLH5Uqk8Gv
	fhwlwzlCY4MS9h/VCTL95ClKDuA6QCwdBMxhZO1mfMs1swFnJIQxo4ZQwvc3wdr/cAvzM5elDxf
	7ufLjxIk+/Jp1hq35fo3PJxuF6MDfEP/JxKXkclH7hmMy53k8PCQjDzWGzQ+V8/s2xJsxvINbFc
	TxrNKW1NEaD8/banGfsQzhRQRhhmNojKLWDdpx6foJWWP7iaWeyW4Lp8NEgwNx6ZEhzkMIP+0a3
	fF6fYZIPYSg7RgxJU5RpNNFTdEb3EebGQ2ag8pJfvwlC0qGL/N406dwn2dSwVxBQjcQXRd5kQxK
X-Received: by 2002:a05:600c:e548:10b0:4a1:8399:b74a with SMTP id 5b1f17b1804b1-4a18399b785mr12913505e9.31.1791395696174;
        Wed, 07 Oct 2026 10:54:56 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm6515772f8f.8.2026.10.07.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:54:55 -0700 (PDT)
Message-ID: <6ac6876f.31081df4.3ada42.ff1e@mx.google.com>
X-Google-Original-Message-ID: <asaHbNNiWNhacVWf@Ansuel-XPS.>
Date: Wed, 7 Oct 2026 19:54:52 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
 <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>

On Wed, Oct 07, 2026 at 10:50:30AM -0700, Joe Perches wrote:
> On Wed, 2026-10-07 at 18:52 +0200, Christian Marangi wrote:
> > On Wed, Oct 07, 2026 at 09:49:48AM -0700, Joe Perches wrote:
> > On Wed, 2026-10-07 at 14:28 +0200, Christian Marangi wrote:
> > > > On applying patch, git, depending on the default configuration, might
> > > > complain for any file having blank lines at end of file.
> > > I was not clear enough in my first reply.
> > > 
> > > I meant that the test should be done only once, not
> > > for each line of the input.
> > > 
> > > After the end of the process() loop of
> > > 
> > 	foreach my $rawline (@rawlines) {
> > 		[...]
> > 	}
> > > 
> > > a single test of $rawlines[-1] could be done.
> > 
> > Yes I also was with that idea but then I quickly figure it out that we are
> > not testing if the .patch have blank line at EOF. But if the single file of
> > the patch have blank line at EOF.
> > 
> > That can only be done in the process() while scanning each line as it does
> > progressively check new files in it.
> > 
> > (unless I'm missing something)
> 
> Dunno.  Maybe I'm missing something but maybe something like this:
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f424dafce5bce..d2f99127a9a9a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7850,6 +7850,13 @@ sub process {
>  		exit(0);
>  	}
>  
> +	# check if the last line is a blank line
> +	if (($is_patch && $rawlines[-1] =~ /^\+\s*$/) ||
> +	    (!$is_patch && $rawlines[-1] =~ /^\s*$/)) {
> +		WARN("LINE_SPACING",
> +		     "Blank lines at EOF are not good\n");
> +	}
> +
>  	# In mailback mode only produce a report in the negative, for
>  	# things that appear to be patches.
>  	if ($mailback && ($clean == 1 || !$is_patch)) {

Yes if you think about this, this will read the last line of the .patch,
not the last line of a new file that will be generated by the .patch.

diff --git a/MAINTAINERS b/MAINTAINERS
index 70a11f2ff61d..0b9946c532af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -785,3 +785,9 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
-- 
2.55.0

It's to catch situation like this. Example for entire new file or adding
stuff at the end of a file, where a new line is introduced.

git am will complain about this.

-- 
	Ansuel

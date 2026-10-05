Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980E4DD3B1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231694; cv=none; b=JHvjwn2vpudTd0uFJZmMLrTPaYL+Vc+ZHEe+aqlVd3xs9+yhA24WKgAfdlYeoHqzZ47+tGxEistqHBGxq4Bm9OlJjhhG1GT7Yh6CRSHBy6o3UljCJFlErPhqhdUu7kGkR/2+6/Qy+7guFvIMAYKLkldSZ2H/IcuVnUr+2llAHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231694; c=relaxed/simple;
	bh=PUcIwL3sxWUwjUkEHic7gqrYUOt1jLTq7TaXf5gQV1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptShEAiPcqzvFel0oZ4AEqj03A/2OnNbRlEyWlp94DpICPHAQNee2H7FV/N5w2iDknkrSq3tNqI8qNBxFN3m3EDHohp/GqzUM8bdnS0fANQ1xlF6vXzR3XEOcJSZaj/a35spLWI63oFD1QiN6Yt6tvw3984VVjJ3GjxB+BwZZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1z4OWK3; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1z4OWK3"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so1783828f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231690; x=1791836490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oCVDgOpACssiVJGI1HFqtgCbfd9PUTK46z2UhBdQ0c=;
        b=H1z4OWK3EBJF0tGgoc80OzzvXkSXH7Wjh/+NIdl65GWZHT0B8QPkWl9GnUAW+JqT8U
         LKMDKRUvXG2ytTjDV+m0DxwKYP9fyAneEc8i8atmhZchqTwD5C+jQyHomNkQGDz+MLK9
         a10N/DHxK4f3c48jw7/tjHjZnZfskCqaK9tEX/Gqg9CJihl7POJiyGWcJh0dCX+a/Q2F
         4KlGEouQf5XHN25mTX6zB67uvLwPZyZWeH+RErM5JMl5WkIM2rbSF+jzE4BO/KcZg2bk
         22EtbO41HbWaLJKYW/BGQ8mhkX++hj9vW1yyLawIlrdvegBKIoZTBB4dMUjGtvvDFsrM
         h7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231690; x=1791836490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oCVDgOpACssiVJGI1HFqtgCbfd9PUTK46z2UhBdQ0c=;
        b=OrxRlg3JQiDvACavmuubzVijNJzenbIdFLC25SOXfXAJ4nXnUblsQ2h1sAFx6bchle
         IFgEEvAJUGJxhwN1aysEkdyxQy//vUeqWNKL0XTyCyq0L99aspuwc++8pH6gB1eQY3Rv
         CwcKRjytVNPpNqEz6kMMlcKstQmcs0mzM0Mjr7RexTq1VK+jkXxDALMRbnjebh60X0r6
         kNZHNmnE0yqHNFI6GtzdqtsJeW8IPAcO3kCA3ZURDmD3UDlK9I2+GfrYImWuI1Ej31UW
         P7XnVPGwdIgkEKeLohlIWHmE1sM7FyUggNkj7hRsSTbAq0AOYW5UhBgFe+tDgKW3g1wH
         BXSA==
X-Forwarded-Encrypted: i=1; AKwUvByaExB6+V7LGnNO566NXjmo7FtXane9OAeV1oUs1PbMAOnBWiQ0cNvBxgg26mviPPniAQSJX7dWtoQkKeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUeacm1JSzy0wjr0RIE0sdOMvYbwLx5rB4JWabA99iR1XPZz4c
	IV2C4WjLplJ92GEozQa8sTwVVC+wTj22VgmXbVqRAQBj0Q/xt+vBRAvT
X-Gm-Gg: AYBFou17g3NwLA2suKKwC23Qpkyaa4JTfqBx1hRth/l0Zz4mUvg1c3f2HrKQ5ZieXeF
	ppp/ULVifz7vPRraZEaJTGD/UcpT2L/42aQtyVcNZrs2Btubx3O1TAUHpWnv+yi6NTJSm7x8a1l
	N/Yi0t7pGW3Q6KUCGc5KsSJ+EJbR0s65r3MOBSJ6Fr/5p8yqw2m1Dx7BBUnRfxN511MvIzW8uYh
	Rkg2wkrQhKhbT9jzSGl+2yYgxA9YaWrQT7MsBPs7boeoRtygty3KKGqMJbZsmIxXGxqpt9R13ad
	oEvFG1j4QeEoUeSgtx9O+hJ9+lzcfLhg0WKoRr+PDoKRBxDZ5qYZVFVu382VcMQCuX0eXupB3fk
	BYjufGGd39giBaOCQO0cZ7RIERYms0lzotExX+6+uk6FwbwVqmRpuiaa9C29UUZVhyb6K/3ZGCi
	APcdp9XC0/5kaJXFAZlcCrMXKDh9Lrp+0XJHY400NCzn4iHPcnoFJXn2mNCb+do1XJQk99oF8wB
	cUd85UhaJ8WCLspudPwlEy9hU/+Ow9khnZR73x3VtzMHt4C23hSBsVu+jP2/pKrwz9ROf5P6iXW
	qY1b7Cb5zsaS83qlSsUinAd1RfROxAsgkB1nxzVQGCKeKoaf73QaVHx5FAWWjEHZ4VMhBCsvHSg
	=
X-Received: by 2002:a05:6000:186c:b0:48b:910:3598 with SMTP id ffacd0b85a97d-48b12712e23mr24557006f8f.22.1791231690251;
        Mon, 05 Oct 2026 13:21:30 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c63550d1esm5541308f8f.18.2026.10.05.13.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:21:29 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:21:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asQGIQndPhFVaTNX@gmail.com>
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
 <asMl-yIKQoAbpwzA@gmail.com>
 <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>

On Mon, Oct 05, 2026 at 03:57:42PM +0100, Geert Uytterhoeven wrote:
> > The words before the last one are read with ioread16_rep(), so reading
> > the last word the same way puts its first FIFO byte first in memory on
> > every architecture.
> 
> Hmm, the version in drivers/usb/gadget/udc/r8a66597-udc.h does use
> a single ioread16() or ioread32().
> 

That version takes the low byte of the ioread16() value, which is the
first FIFO byte only when readw() swaps on big endian. On sh it does not
swap without SWAP_IO_SPACE. The boards with an external R8A66597 are all
little endian, so nobody hits that.

ata_sff_data_xfer() also uses ioread16_rep() with a count of 1 for its
trailing byte, and i3c_readl_fifo() uses readsl() that way since
d6ddd9beb1a5 ("i3c: fix big-endian FIFO transfers").

Thanks,
Karl

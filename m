Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651755;
	b=dSyLYq0YKcB64/h7jWJPBOyhhq7VdDedxni/4T4bUE/t2QYY/p/EaQHZp4jEG6zOQDQ8
	 Ssv0xOAuoWzG2oVj2aBx/0UNeNDaSZsxTDYLWrkklzQeYVghadQzp4Zc/0OrLbiEMBN51
	 CN4YCX8MEx+VF/NPM5E7BV6e70ufwiKHHoiJ0C+wb3Qy2T+znND8OrDHSVzm4DAO/sIe9
	 wuDgVqGPOnpGpTrIGTSaa0xnPDSO+NxpJ/r2PF30BVUhEacUp3DCAaJc1f7APaNcA2paO
	 LxE3+wNoudqwu5SZHt9d+iJbrK4eN1g24dEGvC6AwnTFGFqcylg068eN64hBMKm1rdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aOnKxbhQNH1eTmeBnjETvVZlJB22FsVUKhxUnQp3P/Q=;
	b=g81/t9mZAR/IitOEKt5vxafjhFu0SHXmDZqp8+kiDvMnhqRlaGLyY3ezBF59oyX45LkH
	 OQQ0o7w7LDJJwZGJbsoNN6vPAJ09hRQlnOpUQ+OyVGN5LwIrQLOLP5njN8PFUFlKwcQeP
	 5GVDNH0vS5A9cpCpafFz4oVGtucCaWeYGTFAMXyfA9w9ccn38BzA3KCWYA3MqlMQMhS4W
	 IR9VsyliAjqIu0lmYA3A9yIGPiUHlNP7aI30d0DJwS6WHQdygr7Mzeo8OeGdod4Ye3Gni
	 fcbFLAK3A3N75BgjqTihHOQlxJ3qYE2p4yrh18Azkwj0+CKUqLdisicTb2JTmPlL1fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D0MWwbYm;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E791606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E791606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D0MWwbYm
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so4080585ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651755; x=1793256555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOnKxbhQNH1eTmeBnjETvVZlJB22FsVUKhxUnQp3P/Q=;
        b=D0MWwbYmQfuUWSye7rIUiVQ9YWomoQdyoRDN9rrFjnN6XHjz+UIgna9JlH9IBcAYMh
         rUUqjtC3qFMre85uij61NrdbkTAZEKQf5tPylE5P++bkOSlYpCctsQ1G4I00M19inpZF
         e6MPOIDcqmm84ygIFvHV2zMS1l8o1Z5DDrAwdtkjXK9xiIZU3/SJuKUadtlMZCHB8Jdl
         SyZeTze1oZiWYqtjfh2HUdYq0uqwT4nOLh12ZQRrNvp0at+WkR6SuB4Lu7Ml/3cBvd29
         K5tkvBDpSzU40DIKRzfVXDE/iFFCAH5upLK0fBtZPmQrK32W7lq001wJmChnm6OMnDd7
         dzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651755; x=1793256555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aOnKxbhQNH1eTmeBnjETvVZlJB22FsVUKhxUnQp3P/Q=;
        b=YV3+HF7KCMN//3gvT/wH3D14hf1OrWWmUrKDacFNFr0LyTE1k7zL6Gxx2yYmMQzvoX
         VHQSWvDPaf/R0BokjXh5z7rjZHeO80i7ZcchTeD5dQwZLCSyxoUBX1hbKawX0JAPXh9u
         v2a0s1ynBZmizSa91mmcmOR1yt7u8OK1GJf8HYPMe839xqsz1UEYznOIvjsMsLJZWdjF
         m65rj8Egs4/RJCbg2kpL8zF60PsYUW3tSYhRcxBsxfzyeS2JAo+oZCyh6wr20f0+HaZF
         0uf9M8wcPOSMdnxrvLO5ATnAcT4+IDVJle3A8IsgzGE3/fTf1admSC0Y0Mawd88c7031
         B4Lw==
X-Forwarded-Encrypted: i=1; AKwUvBx3NZ1rQ/mwvgY9sZOOyZdSesApR9nqe//Mz4f8fcfCIPdW7nFESkVHaZnovAirD2gzBrVZovsti5kC+5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmvsBN8MLH46tRUJ6LzMSjcrMRSzzhPhIuLLUT6BPMhmmAQL8a
	c3Qxy18Zlltx4P1Cb4oQfIq+gYWI++GQ49zvjoT8WhCE/nfHexe5cTdL
X-Gm-Gg: AYBFou3hPm++Pee5rOrNanXCc7d6Ara9RlGDPXOraSKYxt0d82m2YlpE1x2aE51muRE
	vREiH0SB8ZPZEpbQ6jHJdLiF1XLW87MtvbV45Baq7sq3YNpeNjh5+jBt69o4JykdrHuqJjujoYQ
	Y3HGtqwjbQ5Mtr8t04rZdvnTtSmwc1bu9zxn82xKb5CdvPIejQRQifwHGq8cWsg6WJ7HdS3ThK3
	i3tzFr3TNI0QZ0blQkFhakLMGJGzSLHNUrCuP6kAWKNk+Z4dzEDTPHUZjlC1rwmQ7FmSNf0HsZE
	b6U+mZC7WmBSyOw8y1O2YwqOvsZpXzxFiJyg78eKU2HDzvn1CsambiGFAFjDKB+qFrfwt/asbOP
	2Jkd0vF+FlgCSVUoER951OeJUpsFj8Q4/kFn/ZW3ez68uSFByItl6z+FgfAwpkecq5lVqrdxjtO
	R5twksvDG0ODJ0rexW++9PUgYtvgSJ4g7T/WyOQJYZn0fF5tZeAe8Qge+Tx1spqI6exeJKAgh8A
	SyjugGEzhMCLNz68JwG4PtVwm5rj1aOrQgFQ7Xe7TBAXYzU14NCLUMflEm0Y00qUaszzuARKcIb
	3KLDo2c=
X-Received: by 2002:a17:90a:f944:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3ad86d5238fmr3509934a91.32.1792651754537;
        Wed, 21 Oct 2026 23:49:14 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49314besm2707437a91.11.2026.10.21.23.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:49:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:49:08 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] USB: add usb_make_subpath() for formatted device
 subpaths
Message-ID: <gih6jsfknkjemuk5ahmmpxtzp6ymyynergxckpmxfbbybzpdc4@me7k7j472mdu>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261021123146.17202-2-shlomojune6@gmail.com>
 <2026102104-audition-unbraided-05d1@gregkh>
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
In-Reply-To: <2026102104-audition-unbraided-05d1@gregkh>

On Wed, Oct 21, 2026 at 05:20:31PM +0200, Greg KH wrote:
> On Wed, Oct 21, 2026 at 08:31:41PM +0800, Shihuang Liu wrote:
> > USB drivers often build device paths by calling usb_make_path() :and
> > then appending a subpath. Several callers use the deprecated strlcat()
> > API for this.
> > 
> > In preparation for removing the deprecated strlcat() API[1], add
> > usb_make_subpath() to format the USB device path.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  include/linux/usb.h | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> 
> Did you forget to use get_maintainer.pl for this?
> 

Sorry about that. I'll resend the series with the proper Cc list.

Thanks
Shihuang

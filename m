Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2DC44AB68
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094230; cv=none; b=d645zoaWWWWOAK/Mqx2ZA4lhhW8TSq5qqXSKCxsjDs1JFzL7D6y9GIXL0vdCkK5DdHe1l/oYkrItyDRPVxdELE4FSrwKieodNIxto2ob9Z2IOIDyXCbgLAQa/MpKR2P+/hW9Zn/70OJ6uCq96/joIrbfnRqhd2GunQG0Vem9L1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094230; c=relaxed/simple;
	bh=W+WQcbkuYlf7iZbcxCz0t5n2JDNxk3p3Ac8rA0qdxo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMjChj2VdBCxs7oSMLOUurwc7dLlZ3I6m0QgGl5gqXOkk3VM7Y5HT0Y0wPmCRQIJbiGSDSqU1Hr2fBSVrrEcu77xaKolf7GC4yKw47Hka01NQVMcdog6sgY3OI6xeYA0iXAKAgBbmOO+Tf9etZKDt5v/vnDtj09N8VoZLKzLISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phw4c37w; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phw4c37w"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so684906f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094227; x=1792699027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JdoamN/QCC00RvjhRgyruFfNMjWo34XWF83HIj4FenE=;
        b=phw4c37wlpZzjMOLQkvakf8RFHeyVSF+9qTB7O+dS3+3WT7WWZ1Oc3qYkiESnrbVGM
         BORkxpLXPuaLbAlxzLBHtbQZCUTqgL+041pUksotsUGmwHF4jYbN8wvJXjL9MTihlDNk
         uwL8T/aRwv1Zu8vkhc/W0XYB/RSnNy5jm0EhEc0WLAuOHpsIUK2nVj8itr3tNNHDd0AT
         huH6Bg4f+rywB/POueEFxu98XbPmEG3ToxIlQ1Je5pN7yMpW0UUxHnZ2/VtDVb0XkZOY
         cCjkRRhAPdqTLT8zuBil/ZBq4FMcVY/MDDDlB8Kngs4ohvCcwcLgjpucjEANmvtP42Ga
         YUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094227; x=1792699027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdoamN/QCC00RvjhRgyruFfNMjWo34XWF83HIj4FenE=;
        b=P75Q19WiTr9PTgw0YCyvRYGb8KlfdnjEkVRIJpFnrJD4Ru0MMkbSnqe5nLQopYtZ83
         8HdUBoDzwPds3KNw8rl6vNm+T4XvE0TIwpa2zVoKom4/gLFEzXuaOz6fWMmuhmCyRUMj
         psWlPVQY/HoC/CzxGov2V4EWRFT0+moNak43opIrTfIal7mT4BvdnPeBR2xdXvuruMU9
         aOmK2vNbLpXDei0qhM3qLNavMfjH8kaXvwF8HontHjLxbwcLBxkHYRglQqW9yZ6O1R3B
         Cq48gKVE8Dmj7KDJAY51DGeXkC//11QbTerfxP+ZgmI1wQjcu22+7C3oV1UpJjtSk1tr
         e+0A==
X-Forwarded-Encrypted: i=1; AKwUvBzjkoR4K5ogWWH+nnpQ+A38ZNz4mor2QXhUKnjOcAWfMsbEzkcGcOMq7Jd9ChmyQtgwfEziIlpUWRI6mRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMS3CnTNPlz9xCk7yN8pXwn/BjGpByIWwNl/i1/0/QwRaBKXKy
	WnPpbkG4XFVe4UPVMnOiTdlYLd8LxGI1/KIvwWnxNhclnHHRP3yo39Xp
X-Gm-Gg: AYBFou1R5JC/LhvTtJ1cuvpAuk1fzoVQ8+okv/wvBAghk4gnMU7n8c/AnWDQfTOIbBs
	LMnZUw17PO+LsPcmMl4YvjjI7v6XRJh5+hW2l6ccbnTL6U0pLbsCG1WIEgZ0lUBLczDO7KvrwQf
	UQCL6vEi2d9qfoRzMEDNWqoGja7wc6O/z4Ee8lT4G7ZGOhUXwIVv7ASfM2qFptbMCzoRI86UePZ
	0Z4SIojM5ZC2zwo+01w/MkOMMxPNAWHPAYd87/ADc0R6e5QK1erWE9hFJmgEsd4++utben4cAJy
	M346PKclSwPDGPI5c2dg0WWt7cEo+cvZ7vYM2PtRF6BVIZ3NNvo0LCUBbJms6LUGJ23OtzSn+M9
	ow7CP4gMRJvawkZOQ4yP0qP72rb08oT3NgYoq5c62Co8LGsAdFttebyAi2e0vih/Cw3dWIg7Nm1
	kpaAhf076BQrwOgMy6n7ybelbVqcKOxsjoUl/03bjo0LhHacLyvfrvlUaWQZ5PvNMZ87Y=
X-Received: by 2002:a5d:6402:0:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48dbace9c60mr29174300f8f.45.1792094226897;
        Thu, 15 Oct 2026 12:57:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm200478f8f.37.2026.10.15.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:57:05 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:57:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, pavankumaryalagada@gmail.com,
	johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <atEwDf4RuTWtaSoW@stanley.mountain>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
 <99cd529b-dffd-4315-b9be-9b0029973497@ieee.org>
 <cc868527-c13c-4e9b-aa7a-d2553f93d92@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc868527-c13c-4e9b-aa7a-d2553f93d92@inria.fr>

On Thu, Oct 15, 2026 at 02:10:53PM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 15 Oct 2026, Alex Elder wrote:
> 
> > On 10/15/26 3:22 AM, pavankumaryalagada@gmail.com wrote:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > > Use %pe to print error pointers directly and display their
> > > error names.
> > >
> > > Keep PTR_ERR() calls when the numeric error value is needed
> > > for returning the error code.
> > >
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > In a few places you are *adding* the error value where it was
> > missing (which I think is an improvement).  I assume that the
> > return values in this case are negative errnos.
> >
> > It would have been worth mentioning this other type of change
> > in the patch description too.  But it's not worth doing a new
> > version for that.  I trust you found all the spots, and fixed
> > them this way.  This looks good to me.
> 
> This Coccinelle semantic patch finds over 3000 opportunities for this
> change in the kernel as a whole.  Outside the context of outreachy, I
> wonder if people would be happy to see such changes, since the %pe code
> seems much more informative.
> 

I like %pe but it's not universally popular.  I've seen people NAK
these patches because it looks weird in their subsystem and I'm
wondering how many error messages their code prints?  Surely, any
error message would stand out is weird and undesirable?

regards,
dan carpenter


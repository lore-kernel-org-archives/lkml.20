Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D837205D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436279; cv=none; b=MiTNWl+9xb3+VkclHdZi2IRwW+a6yI69FFpyqrjf7OnnrwRnetlFuJyPHPLEZGbnP0/Oi9HrB/o8X8L11O3SjqHknMZIAgIhe1jtXVMwCsx8CQ63zJ61ll7k4IP3sobC3ZUN+pgLy9t/HEazMtGEx2b3X6aOcOECLeDh6jKFmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436279; c=relaxed/simple;
	bh=C+QWB+KZzeonLvV0qDuesLnMy5eu8R+OizXBY3d888s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTW1HIC1fIO+XIwKjjWG9BaOh9qMQlKI9v33COP3Jv+FXOWpsPKyVZdmMitX/w+rYK6Sbd3Kq9TumRdthnEhqPy9KB2zefw0nmYq8Mn6tOpoP00WYJdguHvIULf3S82hdVk4KHyB17JD9+UlpGpOGWrQ0JIfLpQKf0P6plEaxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuMsJK6I; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuMsJK6I"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485853f8800so142724f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436272; x=1789041072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LiMV9lpRiXnBE6CK4fygOV5eeeeR5AdD/GCs6lVbQQ=;
        b=QuMsJK6IPyQoldLxUmoNS8vlhkN23066FUD8gMtVLSfPwrcA0V8B+oGC+OsBPzuOHr
         YIPb4F0p4CrJSOvCV0YUbQ086PADTWdAsxcinxy4Pm10a6gzblDtcOeMqTe3L5WrYzq2
         LkKA9YNCMkx7Y/W+6pj1HEx5JBSBB6GXoFdOeoccfNTtyxmSsRAXKxVBIcHRkJa6LHdk
         3J8xI6RTRiGT0rTNrLg3l6TpB6GFKWStuO8RCY/CNSvSXcpfmJw2PVfCwX0dxrOGuxoq
         MPUrkweb4VYWWqu+89gf9nHf0oucmQmNnwVC34o9XTdW+iU7kqW+PIn6ob3tfV3mpFDs
         qFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436272; x=1789041072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1LiMV9lpRiXnBE6CK4fygOV5eeeeR5AdD/GCs6lVbQQ=;
        b=pyZebYzhgiCyAuhkcLeT47TE+Di/r644wnGgrE1BzJUXbFM1OrF1jqDw+AZLsj/NsG
         n+xB/Fq8mDlHVB8a7SmPQv1I0d+rjzb7zHNTiO2EmGskUAJF8dDcHnPWrAylCyDEqW2I
         oMy99BdkuNhIG5KT1WbhTR/YFPeUq9es+XkT/pHl41hI6fQcLCWqZQNPGg1O1Ys8hv5R
         V0qMJQU6YdikGwbBVtDrGXMwdIn+TrGtt0t2STKjtiVtX2qkZ6+otcgloDIpiB9lVWLc
         mcMl2jVYbU5VtVOJ4ibZxcIFWAS1sOeNSePbhjMOjwFNfiXlNcP7qtP/IGqEZBgq9ac7
         o6nw==
X-Forwarded-Encrypted: i=1; AKwUvBwnkcQEMc//r+fUhoNX/4aOLhCwOHycns8D8wgqldjsYtvRFKefvSRqD+AoHpdu9N0ILTo/AGf1AMiuq7o=@vger.kernel.org
X-Gm-Message-State: AFuF++lCMgkp3pT1J6YxghsUkr0YlfUYvQzwQGw6uGf00JeuU/pRnOq6
	5ZhWWV5ufUVxlE9LovoFJhilf0cxhGP0Eq+N8Cvxr07ono1X2ou0l6tw
X-Gm-Gg: AYBFou2N+TNGUJB+qLK3Togq8xGr+7OllSXVoRKKmomeUtrqolY97AfqaUjUIw7jUUL
	gkgv8pBUQR8CtFAwJSUh0dguTdAs5LpcP1T014Rc3Td1UcgzjoalA+iAU7+pC9qu1UPKvwrr8V+
	Jn36sdLbcFpawPyFapp4vFVUHhlFSDGF+OkBmQnKzhibAv+ZHsCRLe6MlSuuvvgqj0zrRQ0tmU7
	VSPsKTmoOTZuX16o+fzDIJi/yC7mKAsbq2JoDwdUZA22lFYFwjjDJovciKyIlZjatdxuNyHQvLa
	v4qTBaqehYwxXhPkXHyKz5efWAEse+rUngtpg647P26TbeCQyri/8P5vVg+VN2p1tKLS4rd9wMM
	GIuDHd0wVW2/1vsLc3+2Snst3255cZecCKGp+ijX9yAhohw5MnjP6G7TmqQDx3QVEoO3JN+XWZx
	uybbmsIZanCGfLUukAqWRxDbEyotysxCaV70rc7Oihwct++wGTeoAa1Iz4KE4+M4tSrU9CBloRI
	LyJvpHo0pjgUZn/U4iP434f5aVityq8qMGfM/jYk/hH42w0S7cQFMBTTvBxyPRIyaqSPZI43w==
X-Received: by 2002:a05:6000:542:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-4857e4eb54dmr6750369f8f.7.1788436272260;
        Thu, 03 Sep 2026 04:51:12 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm13185506f8f.2.2026.09.03.04.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:51:11 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:51:10 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] of: property: fw_devlink: Follow GPIO nexus maps
Message-ID: <hxtrtbmfb3jznfw7ooiyx533fzuuagxlhweq6yo4n6j5bne2uh@omibim7aiobk>
References: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com>
 <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
 <CAMRc=MfN73=K1nZrqUbhrMSijjpzhF_z_U9JU4_H163W0vRpqA@mail.gmail.com>
 <qg2nemg4mlxpancg7az2vsnjkfc4anxkieozoxh3mj3zgkyifd@b5b6yiz4uew3>
 <20260902185513.4867bc92@bootlin.com>
 <874ig664ih.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874ig664ih.fsf@bootlin.com>

On Thu, Sep 03, 2026 at 11:57:58AM +0200, Miquel Raynal wrote:
> Hello Ernest,
> 
> On 02/09/2026 at 18:55:13 +02, Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > Hi Ernest, Bartosz,
> >
> > On Wed, 2 Sep 2026 15:22:36 +0200
> > Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:
> >
> >> On Wed, Sep 02, 2026 at 05:30:19AM -0700, Bartosz Golaszewski wrote:
> >> > On Wed, 2 Sep 2026 13:41:39 +0200, Ernest Van Hoecke
> >> > <ernestvanhoecke@gmail.com> said:  
> >> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >> > >
> >> > > GPIO consumers use of_parse_phandle_with_args_map() to resolve specifiers
> >> > > through gpio-map properties. fw_devlink instead parses GPIO properties as  
> >> > 
> >> > Unlike PWM, there's no such thing as "gpio-map" properties.
> 
> Just as an FYI, there is a pending series to extend the nexus
> node concept to clocks, this may also require some fw-devlink magic :-)
> 
> Link: https://lore.kernel.org/linux-clk/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/T/#m16ddef087544db31b5f434fa44be70aad0b5e37e
> 
> Thanks,
> Miquèl

Hi Miquèl,

That's the reason I put you in cc and also the reason I went for new
NEXUS macros in this series. Clock would hopefully be the next consumer
of that :)

I should've mentioned that more explicitly in my cover letter. Your work
on the clock nexus can certainly come in handy for us, thanks for your
input.

Kind regards,
Ernest

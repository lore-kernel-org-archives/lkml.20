Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593C432309
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075008; cv=none; b=LUG8hThUgrvkO8oZEvD0SBZ3bpmPZhovOBNPt5lb++ovIArjLSAedKy1VlUsNwE7vjyLS3E05FmZwuOO6tLumkO+8DS2LK8Lc6E0+srUofmIsjA4IIOQDZJWLcgbcU2GNdQ07g7w0bfBnCCtEQE+EO3jY0U5Qeq7Dg/JxWKWPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075008; c=relaxed/simple;
	bh=v3LtcChmlu6SB+VZ0fqku7Px69SBGP87+uBsZMta9Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC/zdksRxC82mlvSz13WPqxI09zAaYfmv5icfWR8c60KCOpMYY3HEWtBGMCvNxmIPi9XBjzohPThcGjK3ew3QIm/t2+MOKnrvFH+fvcPRL7A3uBdGygvZ4sDzM2rRUJfoT02p+tQ/CMkSHO1qd9q7kSRV0AWuEOdTLKhatipx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEhUI8XO; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEhUI8XO"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0c89e33so205275a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075003; x=1789679803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bIbUN3PnOKMYcTb9Yn8F89rjLLXVVLAIKHLxZoe9RXQ=;
        b=TEhUI8XOglnlQrMTApDbbewyiIfj2EaGZd5jFBqp23MAuVfVpEiTgCzJGosPLnh4k9
         qxnt5b/VwKR27ZxYgmSdfj+E9+cEVhKQp9JWax6Jc4O9hgXZJ2mp7IItvCY9yWTQo1TI
         2EnVcHkS9DQD5TboWBAVHlwrfrFOpAixI2icZYAjF7xJ/6XPfsqB51ORSLWB6jZC6OMI
         CYljAngmS3GAlfYpMYDZqDvOQ5qNDFdFW7ctciThlKcMdLpIaf3iZbrgqRJ1jfhhzprt
         jlpT+KpAF2Uq5hq1+Nt9R516V98Kb20CtGCAqEkVjSS/891L5WdBPzr7meAiD1kwTZ/G
         143Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075003; x=1789679803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIbUN3PnOKMYcTb9Yn8F89rjLLXVVLAIKHLxZoe9RXQ=;
        b=S/7ehtrIz2XTCulKkMf+fLGxJoqqzDZQl5MTklyWwsTmmrtu2BDqns1FnjjJRQ0qdf
         KPutsKtlh8EyMGaJGACpOQMvE1QAtudytt2KwoJ86HUKbwWuzBdbfrI8jOxEUIRFaH5h
         Zp/9l/QKvHaW+NIqGp2tWiw71RAC3vfgsF0OHuCOE/ikJMn4DGICLLplEPU2eylE3Hpx
         BxsurG6NMjvQiajaMjDXSGZ9Xr/BNnr/Ed4PyP4HavLMym5BJ/4V0lKhmtWrWjVU7hdj
         OxaaaSJIAhFTdViGx9zQByni4cyUMqI2Bc3X/SteUn81PP3FxEUooV9r+3CBGDJcRv+9
         FHKw==
X-Forwarded-Encrypted: i=1; AKwUvBwKMUvSkO1ZTya5Dtcz+xQ1PWMNabs0eY0maBr1sc1Kvo1GfXvxRnlH1jzxukIAn3wHiAr/Zw8hZ0tvfaw=@vger.kernel.org
X-Gm-Message-State: AFuF++n00sjieAEI7dVRhhRLm5nm/XViA7VD3xoWI5+9UxiOExtx2ato
	My7QMeIhfGX2SwU4zbG1xl/rDDNMGFi9j+e9Ctea+1akyGNsFC8KP+4H
X-Gm-Gg: AYBFou1OLCUMP1V6XL3JnoqQJ+1zW0cZxQkDegXGX/p/Kp4LGlh0W46C13KL0Y9TXDY
	ReeI/ooSvUcXwsD5Ieel85YDVL1voVAVXRRVJbg5GLEYPTq010N9tyoB92cjtAczPyrEMbaUx8D
	Uvsc9YmmzpX8Fz4xbF6dKTy+u+zee+sMnd5VfFFoGQRTwe99zF8hxLW+L786N05/n0+er1AykvW
	FW0YsUUe5USAJJi5LeO3j8M/SIw+PrPRWapdPynIjhsD8bWyMZLdcxghCa61A6cnPJKmaYpiJ1p
	1KZCGl/J5PM9ez2bUoBxZIl2P0GDkSEZqdV0TW4H68Raz47gWzYJsOawt++Ozz8a2qpoCZi1trl
	IUwpP35TFyLQH49gEyKwQDe5pk/hk79vfvUe9i3iS2FKTsNPilbXCngVQ3fD0nZB0ueK4XZ8OYX
	l6osk39NMr6F2taKTkb2D9d8EzKJ3mwJhfyBzBZNMK+FTUwf3IYnLckLMvq/L/FNVYOXdXqZeA8
	1C12L0wEs2vZBPRmaNM
X-Received: by 2002:a05:6830:82a5:b0:7fa:5c49:5239 with SMTP id 46e09a7af769-804013517bcmr526389a34.18.1789075003468;
        Thu, 10 Sep 2026 14:16:43 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5adf677sm659316a34.4.2026.09.10.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:16:42 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:16:39 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
Message-ID: <aqMeN8/UPhvJWvR5@devvm29614.prn0.facebook.com>
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
 <aqLkhcMb8uSKhQZl@devvm29614.prn0.facebook.com>
 <17c701f4-e0d1-406e-ab4b-7d56d3eb5a09@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c701f4-e0d1-406e-ab4b-7d56d3eb5a09@bootlin.com>

On Thu, Sep 10, 2026 at 11:12:24PM +0200, Maxime Chevallier wrote:
> Hi Bobby,
> 
> On 9/10/26 19:10, Bobby Eshleman wrote:
> > On Wed, Sep 09, 2026 at 09:11:54AM +0200, Maxime Chevallier (Netdev Foundation) wrote:
> >> After the blamed commit, running a out-of-tree build for ynltool fails :
> >>
> >>   # make -C tools/net/ynl/ynltool O=/tmp/o1
> >>   make: Entering directory 'tools/net/ynl/ynltool'
> >>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
> >>
> >> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
> >> object files to generate :
> >>
> >> OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
> >>
> >> but it never actually set $(OUTPUT) before the blamed commit, meaning
> >> that out-of-tree buils of ynltool were always actually in-tree.
> >>
> >> Now, the O= parameter is correctly accounted for, and the %o: %c rule fails.
> >>
> >> Let's update the %o: %c rule to also use $(OUTPUT).
> >>
> >> Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> >> Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
> >> Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
> >> Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
> 
> [...]
> 
> > Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Thanks :)
> 
> Nicolai noted that there's another improvement to be made, as we don't
> account for modifications made to .h files. The diff would be :
> 
> -include $(wildcard *.d)
> +include $(wildcard $(OUTPUT)*.d)
> 
> See [1].
> 
> May I keep your review tag if I add the above diff in v2 ?
> 
> Thanks,
> 
> Maxime

Yes, np, feel free to carry it forward!

Best,
Bobby

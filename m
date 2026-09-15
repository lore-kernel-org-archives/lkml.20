Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF684BA1F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487656; cv=none; b=qxQSILJlcvi5m7KtCOty9XeOramEmj9zFezPD7VnLHbZl9m6pE6XHwotmHjoIrfUJtoD9piHbWBAAuMU+SRaGCBzksHSMuVoEe2ppEU3nRTyiIcXUdgTYmHJ5/r8btobp+1kzvb4b86FY2YzxQPZn+Vz++GOiJRuKpEhBGIawHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487656; c=relaxed/simple;
	bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=osBxwW8+IWKKcjsUbw2GGSLipInS+d955FytLGxQdSyyFD1v2oPIjbcZKmHydxIkfUg70ttI/UKOBuQYGAv3fXczMc7gCcjYG28dehWzL0I5RVBxNWkpERYZkfO5MpuQ/rW3IqVLHuFBQbsCW2xFJhxaGsJtA0NiyeqN4W+f3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP4UWICh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP4UWICh"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso416895a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789487653; x=1790092453; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
        b=LP4UWIChu3Aw58AeZLJcsAWjCJWB5juhvCA7uZeXjAqx8cT5uoHB3LDLrEYohL3pHK
         jOJdkStYie7Vm7U4r38s30BaSAeSqFJEGFwYc+WNrZ4papZ3yge9eyI2U2EdkjTkKKo3
         VmSXPqiVUEnXauA0EkdawUbvNNygFk6m/TLQvdo4xSHdTDfMYTWr/hgBJxYcgnnjRUHW
         JoGnXSqm4SRLXzfaAQBqaWRtGW0OyQAvG26cP6DNKhMrdN15Wn1ZqFvCsgSYLWIC3gG4
         IpOdq5+rvsQQ+R572kzT7guNyYGO9iDmrqOKl64c8JReAoa9DtJEkOXMltClyqirnMUM
         NuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487653; x=1790092453;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
        b=xD/G6YhML4dxPEYYJrFwblOHWTxbUxtz+21gSboAg+L9gbpwO3GIUo8Z028A5+ny6z
         0vBSd6ZJ1OSPFmakPOAJR7MvLqDY3Tp4T0C8Y7WeXmYnl1ApV4pk5eRdx0LwNOdkkeSs
         DuWqc+AhNT6eSEkzadmu/eTr8Qpx3goSZZk4DMSiSmbpPuq0vO3s5xJDKMVSMnq003HK
         RbX7IaBAh/Jd+m1jyxPm8RpeICxy7PxEEkNrR1Dk9L8vBrP6HQjVxrW1v7xQ2Q+GhDn4
         XPGgvxwv6REGXzWdA5KsYUjb8C28YvlzKlBTCqMJUf/FvwqvmYmk4+1EY9hZVxDlKTvR
         gQNg==
X-Forwarded-Encrypted: i=1; AKwUvBzeDvCJsLvPgJ/SPjVF8CNuczOIPwWwPkNvwO+VhhD2ERBjl42wqm8DgE0RhO/zGXKochpSDJXMppAJGeo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMMvUr5+zf+7NF0swIYNOm1aUw/GvNIc59Yk9s38fwUwI99Lwn
	rSSK310CXL/g2+8NG4liVpP2+0hVKBhoCbwOmf4AmSRSNcNdyTKFxyNp
X-Gm-Gg: AYBFou2MaCQtrUUsyZ8RP48ltT+RVrBZH/OEjmT1jZgfmcF8+d7BQwHYdwsBOfuww6g
	Pbkpjw8IiIomKJYo3W1vrOU3CLD0JjcKMyVSIWq+GEWKo/twRrA1kM9TtgTSssKCyIi+/TdpoyS
	6xLPq5sqep3z3pzXQu5uhyJF1HNp7i8sFPdjTq11GYYa2R0mCpktZ8hL8GZZFnM5dAtqj6cXxUi
	pmn6zfgMlVW9p5IId2jRp2CXP5pKUCAjElIhRtcVZgTc5Cd8HeCgG9LJqKSYRvNnlRWRpdMo+CO
	L10xpqNrZSZBLdqRsk39ZmB37vQNv2HSbOcSFXszVUW/6Sia+/trp49DSiyJnns88fPUranilaF
	dTlIxLZ85rKS7St9nJgDtvc9QWWJBBqwW1SXLigCcqaYwXF76/Fbysh89dlGfFgC2/BMHEa+FyK
	bXuWSnaDwWpu6/sJtksdr4vbu+VXg8JURUh8vBpd8pu9a0biU/IOq3saOeUU9H/94JYG56ghlLW
	SaED8Hc3r3qAiw2If0bcTQ9eQ==
X-Received: by 2002:a17:90b:4a8f:b0:39d:f254:4173 with SMTP id 98e67ed59e1d1-39e110dc85cmr2590678a91.21.1789487653470;
        Tue, 15 Sep 2026 08:54:13 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm6012249a91.15.2026.09.15.08.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:54:11 +0000
Message-Id: <DLG0FI0V6C4U.8PPNEKEU8LBU@gmail.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "David Ahern"
 <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Cc: "Simon Horman" <horms@kernel.org>, <netdev@vger.kernel.org>, "Arun Ajith
 S" <aajith@arista.com>, "Roopa Prabhu" <roopa@nvidia.com>, "Jaehee Park"
 <jhpark1013@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexander Aring" <alex.aring@gmail.com>,
 <linux-wpan@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/2] ipv6: update NUD_FAILED neighbors from
 NA messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1789448374.git.lfqlee314@gmail.com>
 <4169629e-74c1-4a21-a187-6c65d70502fa@infradead.org>
In-Reply-To: <4169629e-74c1-4a21-a187-6c65d70502fa@infradead.org>

On Tue Sep 15, 2026 at 5:26 AM UTC, Randy Dunlap wrote:
>
>
> On 9/14/26 10:01 PM, Lawrence Lee wrote:
> > Testing:
> > - x86_64 current-config and allyesconfig builds with W=3D1
>
> What does current-config mean?
>
Accidentally forgot to reply-all when responding to Randy before,=20
copying my original reply here:

That's referring to my local .config build options. It's essentially=20
just the defconfig target but with VETH and Overlay FS enabled. Sorry=20
for the confusion.


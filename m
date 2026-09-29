Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD54C4F62
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718277; cv=none; b=gpUDCGbYiQxtG5yoDuVen27SrzPO74UooMF2CFLluBhrvkzKujJE7YWHeC3lsrwHOd1R883d7d2s3uS2JBUj1eAp874NekPtUFsxEll1jvOSsjAva5yJQNOdv1UAuVAW2g8XSF3nZ+BtRQnlJheTYkm+FqwpECMDeOCWcGAk0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718277; c=relaxed/simple;
	bh=sSS5ujNqwDF2ukOfHcgyrFNo6NxMTwMpa3kXviLIz/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4JltsbUri8YRqtLwMQZUh6AEe+Oljr2PcuFtw9VPvXlGjqVZfs5SyqjlT8TKuaIgvStfVf4BCqYy1PaSsztJ1YutjcjvGzPlzpSoJOk68yBE5FjiPxV9ax4RBBw11j6HGORfLZkwt9YMcTV6D9yl+p5nhspSANra6MKCCQWR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=H+lzIbEH; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="H+lzIbEH"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1654006a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718257; x=1791323057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9q+E3Xh65cY9+ofmYDsNL60Gz/7NdFCbD28qz8ceGUE=;
        b=H+lzIbEH0CsH7v/l30swJkvpVn3XHKoSAo9HoKhEy2SEc7JlGBbqcFXxn7BUe5Ba+G
         p2+UxujFXJCKVImMUOocgIYGEI2VoeEyY24BVzm2RM2xrqacJU1xn1mPyFv1uogeMLKy
         UuItenqrVT3P2Yp8V2pLJvFfIxv9hTBeipU2Px8M11xBDIJzEK/dQCzQpUr1HMvj7sjW
         ZNRYHZPcpMthHDYaIylnS75EspGe7iIK6CCTiN1jyaBOroeAYJNAKJPXarNHF2GudH4f
         06+jJiOfvOP1yaxsEwqx1vUDRlM1cgEwhwzqfVGwRPZjXw814N954rjBAKVLL0F0XMhR
         Gt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718257; x=1791323057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9q+E3Xh65cY9+ofmYDsNL60Gz/7NdFCbD28qz8ceGUE=;
        b=eme2SFdTjqaKD18ejOXUpdB/EK4HJe9qXxf5+pQU+9YTMvdgAGKI8x0cZjZTsX5lxB
         o/CQLpZHhwePUagnaZbwh4g05dwWrlUVs8DFs5KcOULlSfbOG7gNGs7wQH8k5bTXqxLV
         E/BUXM2w7/RLWdwA/26xnqbA0pqtd/cx8S5dnPhBz2VBXMIFmO+fj7T+9bmyZkrflDvI
         9ru5KnNIdinXCkHf8PO+YNnYYat4IIBlbpVfVWRIGq27xKidAjtg/3ydBHeUI9drq7Ai
         t+nJPaARgO7jX87stI5tz32bQp7yzjEvqN4s6gIJliEsFSwn644quGyH/0Tn0QzkFeZ0
         Wdsg==
X-Forwarded-Encrypted: i=1; AKwUvBzE1WRH03X1Ff6eYQ4Z0sjAvhr7OR0JhdNav6ttCLwcZTMbeIdyDEldv3W7az+oztLxjcB+pt7fuKUr6jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfwM+/su8hhMHaKbqNSwjiGH62OoOfuEt7r8FqtixKpK+oUZs3
	5lsvc9UXwd+QizOZGqwQkDZ2JtEZIKLz8LhSLsvn1qlPno0RQVIB6bp9FBpjLW1f2cI=
X-Gm-Gg: AYBFou1aCaQ0nzjDCsKU3m4aGhrm7gYzpg8YlXnhzeL4aNCQhYCeZxbL3JdKTBqH1WP
	uym701xlDcGpKwz5vg1n4Tdj1K4ft824UMGhPqYRs5slm290XcdstolgO+hSx4Srw8KT4Nco+02
	V0UdLuUG8bb2JIXsVhJMVKq/1xCnza7YaWCvDF9AWEjffpZcOtWGOpxbGOoynb3WgeZJI/l6pRX
	cRKey39aUcBbJKJt4ZnKBZ1r4sAlNHiyT5fgtWUzX70O1474RHo98j3H63EeFkTlyrAjqzjFMgA
	VORNfGQGgI0CH8DAHDbtHhtQHNiwCVjT7tF4/37eGv1Cqd0S16ShkGw2usIYP548/Y0hrFl/2GM
	KuxQZeX0sKI1LwH/vS5k7WcQx7QVTUPcL6n3rfHEFifB7YOW9AHwjF+NmX4n5rxc7sHuU2DK1Fl
	L2Vzfaxnmy9dikPfx69QdUmE5GSMFetT7cOfCpMTgR4r7TjodznMb5iAAON6p2kE2asbd2M75Dw
	NDTRNKnry3b1Lt50qw5xksC
X-Received: by 2002:a17:90b:5109:b0:3a4:b8f3:8192 with SMTP id 98e67ed59e1d1-3a4bfeddacemr290081a91.52.1790718257035;
        Tue, 29 Sep 2026 14:44:17 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c6142209sm74299a91.0.2026.09.29.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:44:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:44:14 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] sfc: siena: fix kernel-doc description for
 efx_ptp_timeset
Message-ID: <arwxLnscbs05f84x@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929100625.50380-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929100625.50380-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:36:24PM +0530, Ayush Yaduvanshi wrote:
> Remove excess @valid struct member description from
> 
> efx_ptp_timeset.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/siena/ptp.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Joe Damato <joe@dama.to>

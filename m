Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45236D9EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790928; cv=none; b=C96sZIG6Ms8EtucVh4U49uADPDsEogJXG/WEgQErIgAZ0zxUU2AAKgRArG5XfOwCGcxcAjiaKEp8v8iKCQnp/5A2Ii2z+y62atNmVOaZZqMy8aT4wlvEf6X43W10HJ7cfQiCllJ34d+Z0h3RbmrqWg9v5YR+8IetU0ca/Rd1rJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790928; c=relaxed/simple;
	bh=aPUTgR4ohijSrORKiVXQ1+7d4If0xTogdnYDLbq6R8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4xZI1nbSG9iJleY51Ua9PqCdq8SV0khxLYXVhDO+OfRqyvF/qg5h2VcMbcP483WZc157Ybqu4Zkcmk0GOEWLjdTvbg3PE+rDtduciP1cKRRKHCZyBydPhijlpsRASoUQ1kWOCtZnd8v+tT4P5GiD0dQdoVCS2coFTMS4CngG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKtxzJ/W; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKtxzJ/W"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so8361995ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790923; x=1792395723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3hTlZHdoVna8F947+T+LJ1alplmfTzkxZyD3ZRoSRo=;
        b=MKtxzJ/Wwntj5Jn0CRCMXAiBnmrCmheF4EcvFebI65UKV7WSQG9qOOJL8CuEddDOIY
         3nIHcY/KPt6VcwdwnnN8x/08jlduIvwj/JHm6+nZhemLGdAX1JsLQTVphldl3HH3n0pL
         TdKv4zm1adBV4wIQiFTJB1+d2TScDPLA2CPbciP2GEJ13WKZ7lgRFHvroyki6mAYqaLz
         OiPerHW2tMoCuWTQYU1F9s252oMreALaaIh6wjJQR3h9ShDw37iEo56Lm+p5NU7cPplT
         jNt2PPl4s0b2qXzXvEYIjNoOFF4xfmmX8ONSQR5QG3k6G36S4akf3xSQN+FiWclrbl3n
         dsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790923; x=1792395723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3hTlZHdoVna8F947+T+LJ1alplmfTzkxZyD3ZRoSRo=;
        b=cwVlSw3CRvr3RqBej84/Aj1VB4BQ15ypXjo9+X1fpeN/tZnZ4nKuvDv7SUpVRrgrjf
         /o2C70XnSI8HrkYHrKSx32Fj8QHRpwT5EaXhl9oIfGyeXRAr7Bk0P4PR4m+v5yGpfrZw
         9SbL9u7fuuTb5XKtmdAbZJqB1V2Gvai8EFXLZBzSjn2uR9axps+97/Xd0nSzisyXSx+3
         3j9iUbxSe/Fr87544EDwvdsVTLbEm3X8fxNZH+M+tf9aPAwk2DKdvj16Qb3BbfdlDcqE
         VjN+gCVNR60oCTzx3kuDhS37seXIMtnwOhRdMXzw7/Zc4qT5QeuxBi+UKvL7uffEuqN6
         8UTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk5SysWsB7Z4F2PiwF48BMhlv/sxcjt2QHwo3JBEHzqv7pJvJc1zYUYEcEktWDzhQKGc+dFNza85DigKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKS85O6TcFLxVmX3wpiFLGZMUTAmnaTAJcgi2q122zZQoLyppK
	trK3VGTSk0t3zwu9KibIwyO05sLbMZ4juvlytx/kftqsuvfs3OXcjcBe
X-Gm-Gg: AYBFou1n5CVQc3Rnhv7j8Soi7c2Z1jZz1ZcinAmoeLbIcs7ntBPlyR8aDfEl7bROMXB
	Me0Tr4dq7/yWJG9qxY82JsxN+1yYs6G5v1ZkYq84SZSQy1bGHQJEtN93f/PurWBz6eeMBZ/Vkpr
	CicW0u/Wojv/+abERoUkGYjwEG5YZcAddj5nqG3UuRYIhQ2ldbFFrAyVGsQAxi4BOc8vCfJUvAu
	bPclREQB707jVJp+mAwU1tzSK7yMpf/mdO69aL485OXB3XCMCIkZYuoikf3mL28p+pcYZAhMHpD
	U55gUl3oWTUiJShZcKQ8QG/2OL4JklVIbdVzdF/CRmgRR6kHajbSYbIpST8NXWZlT5jt+XZVHO7
	IwIRJ8J1E1b995PUOfVN6PaobQST1pBnl/UPgOODmx0q6mLXvEhKInJtURU3+SCa47gIxKlRpyG
	7n5pAYCpbiXyuMbezdkPXLJ6ps3J/etJMTeE4tPueqL1Z5S0BUbfm8ua7+R5AcEN4xX9BPkpaHH
	/xf/yhA0Zj5IHH+2vAzbA+x6tyoZqJUD0aVdsmiz50=
X-Received: by 2002:a17:903:22ce:b0:2e5:cf8c:633d with SMTP id d9443c01a7336-2e842bc1a5amr77384385ad.34.1791790922951;
        Mon, 12 Oct 2026 00:42:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:e606:5ed:c4a9:1328])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b160csm40079485ad.37.2026.10.12.00.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:42:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:41:58 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org, tglx@kernel.org, miodrag.dinic@mips.com
Cc: radu@rendec.net, zewenchen@google.com, jamiechen@google.com,
	edwardwchen@google.com, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
Message-ID: <asyPRtp_6AXHhB-_@google.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>

On Tue, Sep 08, 2026 at 09:40:10AM +0000, Kuan-Wei Chiu wrote:
> Convert the m68k virt machine to use the generic goldfish PIC irqchip
> driver instead of maintaining a duplicate, platform-specific interrupt
> controller implementation in arch/m68k/virt/.
> 
> The whole patchset is tested on  qemu-system-m68k -M virt and verified
> that interrupts across multiple goldfish PIC instances fire and
> increment properly in /proc/interrupts.

It seems Miodrag's email bounced, so I guess I'll need to look for
others to help review this patchset.

+Cc Laurent Vivier since he wrote the initial m68k virt machine code.

Regards,
Kuan-Wei

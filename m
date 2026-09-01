Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD125289E13
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230263; cv=none; b=XCaXQzMADjGelOcUBfgJz1znJFvzMtU7OOf/NxChlH+SIPD+6uU7Ahvxz1TbieHf/1fxTzM6EC1FIZgk1jVY0xIi0ZomNCJ6TwpXAAkCpaQMy75Js4itmdJemq+I7S6MFLOrkfhT06UGJXdXrgf7PowS9C94tb/nEXzccOPSIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230263; c=relaxed/simple;
	bh=qM0/Sa/akYpAFTQhfHlvfVOQIqgdK93DDZ+kOkezo0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqLu9tz0oUjwdNrJkQlsVf0y7lZadUlTYnCPJRCKgkXJAVzibegyEjXsH/3/2p0AJhhRgV1UUJcIu0+4h9NI0CLd9v829g2mpFeKb85ZgOsA/2HDw5DWynpvyyLkU0SaDS8LSmCXjHPlbY9suhMc3kYtUk86p3ZddW42ZrcMOkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gwxjez4w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gwxjez4w"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d3b445a84fso33745ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788230258; x=1788835058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TigSYxFnxWq9gKiGhMz2MZvb5kxbBnb0kPL72Ch9E78=;
        b=Gwxjez4wozRmwFvloTmovlsYIytqq9jXkqC+EFyGWiCF1PAZ1L49JqdxePWzmBPuCq
         baUrOP/m5+lUatVrFqWmG8/iRqwpRd8wjR7/YyxCDupUuvdmzOlgHPk90eapuoX6gVkM
         DtK6F2zw2ob7pNklmRoIqGqBWSbg6OGKBLmaVBlCZRkwjgUHzpw/WUviJ3WQldOxaTMt
         zrijCaEzFaN2aNtM1GnbkRPF4sRW2s8rn/Ea4wuWX1oCljRcVdroPpfKFw26LUd9c+UP
         nwKTLNXuPKrX6XVnD5RhotkgVCwWUBllcASVJiRcl/TGzZy+uzwnlrZWq31Rhqx6wKtj
         JlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230258; x=1788835058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TigSYxFnxWq9gKiGhMz2MZvb5kxbBnb0kPL72Ch9E78=;
        b=ltoJtBRhA9Xp9xpvMb6CBJ/Puuuabe/mfDkWtaOI0xwzJLjLgDfWG4+ZpR12Rx7uIe
         kh1sONYsv9Utzwmyj889I2fOsNbmT0KZQuC2i67SDPapCRj2jTwuxkvcX4CjRLfWE+PE
         IjDAuEe0IZgOIL+tn7j8syqdQvk/yKPxd/Q3T598qodGx305PzPX0xi7jdRniUslnu23
         Qw9A1fkzUaHhQY6jaokp1Hv9mE0aNtpHmptokNosrYrUS9FYcYgjspsmqC4BXXM6Gajf
         +dN6SGcsRVObrSksn6n6Kk6fd36PlM8W7Rsfm3Far9Qf7jJf3ylCqKz3dRZEUyluHsKI
         qumA==
X-Forwarded-Encrypted: i=1; AKwUvByEYTCYKH/CpIHfy6fmgu/pa5Gc7Ln3UnNLHNhMu1SNtMqlh72PE2nLxHI1Uzn2iS6STWZCQvvpdzq+xVU=@vger.kernel.org
X-Gm-Message-State: AFuF++mJO8DdAVHb5ari13I/IFgw8WpNGdEo+yktBMXNA5TRzhNjmUR4
	uMZ7WjE6Co6Fijly3J3c327/GQRPz59MiJ/JBPsWxzm4jYITwmJ8d9NPNSM6VJZQGw==
X-Gm-Gg: AYBFou103AfjxCl7tVFWR2jNPGR2h8S+n7wIKl/Y98qtjSjcNABsOjq/zqgsI6JkX+I
	x/3pk/kiEQeGVCCxA5hFnI8gRdxOAh3nn/YolFZCqzgV5QS0aVNt+8HFf8n6fK48kiio4+Gu4lH
	vMfzBMYXoFvSbcuc0FAQVqd9t/qwKeSQu90VUTC3DN9p8f/DZQHnVEU0Zz7t8qv7osOkgPZEkob
	hdVTFYh5fEVriWdjBVoTf5v5fVfR9CskSB0PAKC/BMlsDoayF6/DZgjLAHCyTZRL3NKMmB9eW0I
	OXKM5ZHUCIv8mxBjedLcQDW/VPuSbV6fzQOxEnigwCMf1LQyBC1o5X1Q5zp5DNvRi0Dy2etPZ1+
	LTr3HsxteNT2PvMKrjI0IGImsZeSGgGlk9aSFNQwxWnagdkTz4XFBCoZ025H+oKvyFXSFbXrlIr
	RYK/iFZo+ACdjX82y3ZSiT/+FUo1t3tr26Oxh40BAF5ovJC9B4zF/z1T7a2wi+78QzGLIKTbM3n
	xEGxK0Rzpw7K8DTa4B/VTl7F5uZxN82mPqrNJjDGBS6uh80nLTuKs/5vcNrFYzlzGHIiFqBGyBy
	OKTBQqI2EIipCuZURQ==
X-Received: by 2002:a17:903:19c6:b0:2c6:a078:bfb7 with SMTP id d9443c01a7336-2d959b82c4dmr2821605ad.7.1788230257133;
        Mon, 31 Aug 2026 19:37:37 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f727bsm5288561a12.7.2026.08.31.19.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:37:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 02:37:32 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	"open list:RUST [PIN-INIT]:Keyword:bpin-initb|pin_initb|PinInit" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust_binder: reject mremap()
Message-ID: <apY6bAKxms37Xdt1@google.com>
References: <20260831224145.169403-1-cmllamas@google.com>
 <20260831224145.169403-2-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831224145.169403-2-cmllamas@google.com>

On Mon, Aug 31, 2026 at 10:41:43PM +0000, Carlos Llamas wrote:
> Binder does not support mremap() as it caches the mapping address in
> Inner::vma_addr. Moving the mapping breaks the IPC communication for the
> process and can temporarily leak pages during a shrinker reclaim.
> 
> Fix this by explicitly rejecting the .mremap() operation.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb%40google.com?part=2
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---

Sashiko had a couple of good points that I'll be addressing in v2.
--
Carlos Llamas

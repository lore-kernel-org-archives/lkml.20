Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37073AAF59
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854408; cv=pass; b=Iw8PeqDeQKzMtDA+CyT/PymU4N7G4GuK4XTrjuU45DJ7uKm5d90ZCOmXKofaFm0WoBIPDLO85kqY8HMlMeK8ZkHeduvXzwbZ8uGPvdjcwxsBm4fPTbTKNEVPvzvfWc4jnwY/6dIAbS7A73tJ3cBQ/hhPE61C5gfpv1FHL1xGRN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854408; c=relaxed/simple;
	bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7VTc9X9bPnCd84dq8pwZhfU+XI8WZrQiRf0JiykesZwd070P7GVeIR7MyRxiRxoUE01ec7vUYMSoO2rDGFTG9AU3N0AGu6grucaP7pncIIJkMPrRKw150Lvoz1ZZT0XdMFc16o64a7bpAyHI8iY6Nt8wBapQhGyG8AT9HL25l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPXRQqLO; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPXRQqLO"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-930f618435cso481150685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854406; cv=none;
        d=google.com; s=arc-20260327;
        b=ngFddkMtsZ82yuVAJOoAXGjmUG27CWA/A1jVCneRTZVfZ6lbFnh03ewUkdJH82egKp
         0qwjoZPwBxrUfyl/aAiVPVTcA3dicPsjYYsw0tzhcGlCWx72SFSRX47Jv9mtCcPzvi27
         MmTld2ctnzhO1poyMoh2S156KhP7bR6Vk7iYyBIW1YVUdRIl+q+pRv/iXb69r4ctnAoc
         gf3WoVEo9uvvt7I9IEdBGYhq1lZAhVzOJHctsSLHV5Jtb3pqctg5YAqE6x2uxo+PqvRF
         SQHK5SW69FtYlnmp6xeRqzIOR6EVxwUhRT6vEe9zqB2i69Zs81MDfh9axtf/OgF+dcnk
         J30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        fh=8iCjAFVBsgLNyxJkZ/A51Jlnd+DRT9jXbmgse6TfpW4=;
        b=p87K5BDEImTKFH9qP6542atdHZXebNXOctfYTGW08EUXVS5Md7b5RIbwdTB0pHPzKU
         WQXJ20i8TmKJixIyIzR1UTs66jR01POikrP+AeUyvFtA/hQWQVS2+7fdvG1LUWzDxjoI
         PgSujUyEzt57Fo+WnlHeIBbOYnjV3Y/wmVu7PrvKjXl3K4VJz4nUwriMQ1sRbdKGPexr
         Z2iDjr6aIhq0gKhdJBzNLvE5CvSH8X4qz1wTNcRoPJg83IcxORatXTNXDx+dK5yRlLXx
         3TjT+0xmPiAIjXTakaw9HdVIKnq8g1tn9f3qWYLkVSzA/WkX3obm7rkGkVeZiJt+9yqT
         nzTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854406; x=1789459206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=YPXRQqLOgzjObUYpTDpRCsIqyN6ghIhIdvUvY9/xv+jfKeUqMM5ykpXvRvQJK2Ln35
         DBMbswTAN80uljLXU/XiIj3DCJVdxzTGNSFqOqbgY6+xRUbzwP6r4dJffEX4IdLa0hCY
         duP6KonTb2c9Sh2kgVgs5OA/Qf14uh3oLcGfR4iaQ9nVGp1Y4evGCKiVCcwmeVugYYrV
         uFXiOlZG5L+gnxwwb1RR9iTXtmrgghdUl4AXvwbeKVhemHK+Mw2mSLLT9CPswzVUkHxG
         ClEOlMqmhzwHhE1cjjjjxNP0SxeMPLRA8L6JkffzEat7xdtuFVI46+S6guRtEzxLeCLD
         zbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854406; x=1789459206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=bZNFT8a3Qtsj5wEbi7dEG81fTc8ZKWNiiSdj2PCPR+2RBcIxkKVUQVjZwSDt9vB1Qu
         ztClOrtN0COSGj4NN+XZWrvHnJbhGr9p+Bio0eTLJXGN9iqpBllrceJEe656txeDUCSo
         Sw4/GPIR6AP0ZAAenzrJ08jriof/tPFmqszDfswvK5ZRAwUtrbqccCVc92ZpvDLEkgCj
         V+hlSHgEEsFemSeFSfXh/YCIXOnWqLprZRbKjhcbaMgHF4RRv51QKgHc9KYfnpq3AwPt
         3y9VIs5QYmp7xUZ9s2MuwC5QFzEarCUeOAfAWgPmCcQ07qRLBcQMfkAJsoX4yguvHKLi
         Xv2A==
X-Forwarded-Encrypted: i=1; AKwUvBzjtOyk6oIlZlicKQELQW6KBCKKXMLxXn5nkEBCaTC9VaTKn0m0LXt7uZfO+rHo9dgVivOeDzf30CETdM8=@vger.kernel.org
X-Gm-Message-State: AFuF++lsYh6OmYD8dj/aaRBYQMUqo4XNcjvxbpD6o/runJZuTdWLUaY4
	dQRP8l+QEbM1/J+A8agVM9Tca4NFkvC7G1y2pmQQfwM857WuiuHvDPmOxjSTHZxN6XeQXUjYZjX
	KZ/V6xEIQNRn22/gdEwlZv9ocd++DIZ8=
X-Gm-Gg: AYBFou2zSWVKlEAz3gJqoWYwTLFQf2ynXcbXwLgHddd92Q0qFfW3HbSCssi6WvEnn5D
	+M5lBojfs1J87qFU0TlqiNikBDgQGUt4T5TbI5Bz82PClflRqQ6tBhDjVAJkEPCRfRI9rsjsUcA
	3un3BEp2eYcdrt58ss+cexo27jP35iwxMFOk1+U8Iq2pk0LVYBRFtNlLSwy5z0lWg8S9odCt2Zh
	AYoA8nYbLYDlHIfh2fwU7Z+NhqajR8M9o3d5efg551TSi5fI/+3ikIcMqFN+tDh/2SmvXRT2enI
	Iq+FRoDgi4UjG26y/Yg+CWdfnyCJZ1yMEIpb5lvA+xn6NdH6H5jQCRAq+7+n1c4vQzFCUW4utFd
	ZS7RGSJ5V9HyOvfQUbJa7l8FPcW3kKYm3bMuERfm7
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id
 af79cd13be357-939803712c1mr2713471585a.18.1788854405591; Tue, 08 Sep 2026
 01:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <DL6HKYRXHNFK.1D9HYNEPH4GCR@garyguo.net> <DL6IQKQDXY7P.1F6PSERSJ64PN@kernel.org>
 <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
In-Reply-To: <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Sep 2026 17:59:53 +1000
X-Gm-Features: AcwNN1WfQW84CsExuRlle70Uv_VaeE2kPFpysKqrhKzJ84K5F_EcHs0pQw3o8S4
Message-ID: <CAPM=9ty74336zKWvS0BPVDnsczCPOPg_Lc0VsZnUfe8Yc=F1Yw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > already provides it to us.
>
> Yes, I did look into this. Unfortunately the SM version GSP currently reports is
> different from the SM userspace code generation tools need (I have no idea why,
> there appear to be way too many SM versions).

Here's an example:

https://gitlab.freedesktop.org/airlied/mesa/-/commit/2f0724ef6b739c26ebd8b0828c93c51b137d7a9e

Dave.

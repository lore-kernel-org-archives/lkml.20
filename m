Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C12345ED8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829512; cv=pass; b=QX3iFnWTdSVU7BjAkmR+p4tHAJo8DOaoiaoL/4OKCIFBUgjoFaM6oaV24IBw+pgd5Dx6aGUOcaW7YV0/LoMZfjDNu23lmsMbTpmEZfWLNO6GDjFqv0ANciURvlnDhmZl4Ug/aKOpk2aqKx1nracKCnFsmqQsVR2EKGb1UhkItJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829512; c=relaxed/simple;
	bh=RzZXfiD796BISLE4d54SM7rERI/SYqzCPtyXD48JKMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtGoBPemupmoTIElv+XgnOMF0vGn/HAZu11olShiGhEcaM+AhCcPWTiSIwbfRTizIAJyGg1g2ANYr6cfgxWNPyHB6dX9R0f+KRaDe7E2B+V//RTlYHCP6LReSsBJOEFqD7NeoLEeT29ruBlUshrKfmwrQTpE5UCzPr7E7FzA8rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oxm4Q/aH; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oxm4Q/aH"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso9456518eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790829510; cv=none;
        d=google.com; s=arc-20260327;
        b=RHmuKadcMfI7wNclEOpiOBVqkIS3BjiAmTAnfuDZCTokoqJqr+LQQvsVkLvkhSuUk/
         3/s/qxXQBxdMksfwdv9soG+pboAItP4ufvD419KVYZOXQaXf/U94i74Cfqv4HtgKmhU3
         a41el0Dpd9N3YlScxN0Kh7D+4TmwMsB0HMEzc3/qJkHFo9QlOVMiTQhvNZ/sy22EEBbw
         xwe+YsCgZW7dXBdgwOYL4o5/kTkAxOQcsRYVjzT5YkA0GAgAsvEh9yX/mnUhJS7WDHsZ
         h/+FDm+NcNVbgjO8cFDhANYX8FLEhHBjI3v6786w5ce9vYLiATUnxGdVIXKpT3qTIYU6
         ma+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RzZXfiD796BISLE4d54SM7rERI/SYqzCPtyXD48JKMw=;
        fh=sV0ZK306wTJEYO0hGVLt7oOwh0eQqI/0llMG5ZgOh5E=;
        b=jVfopS8B6+J+1LHmU+Wu10qIJ3FlXvazI50WWbmPWFY5wxQEi3vfWvGXkhEg3n5aDo
         3c29L5Tum/AAOIAHSnznpLvkRanZzlst9oFukc5CK0t33ato8s2uL4iiYn/YvL0r2JDI
         i/a0WqIXJXq+rSPABoMmc3Sp4gP2KroOQ5mvhzAjk0+hG9c2iopJpyvga8g+nHHeMsOl
         AiuBaIyI7J0mchfUGao+I9GQtU0I4mw3JqS5E7po1Wcx4dUKJdfsNkAfYkqv533/n9J8
         0aBWi0GUX8nhBajlNzz8OPcGCNEwVxrP7LEEmXHzPNPeqTvTS9QFGX5vAU+te6mkH40v
         3edA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790829510; x=1791434310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RzZXfiD796BISLE4d54SM7rERI/SYqzCPtyXD48JKMw=;
        b=oxm4Q/aHHtjIckSdR1pLOKeqyLX0OMGyF2aYHj1zgxq1jAcax71VpqLs+cMVqb+zlB
         0xh9jybedlrK5jDsC33dlXfJjsnISRuGwi6Z0Se8ls49+Xj/m0JgcDr964LDMpPTXBQX
         /yDcUbmn9obEkfzCmSF1bFIzzr8/XJxZNiEo/9AA0lsRLMG6UFZXeMOdIhG6GwUOJa7f
         +jcIyYQjzVIvWQOlAKme0sopXTi0zPJ+cyojivzQfKdilJAbLHBkVu4yZIKjhvb7nC0i
         5rBiV5hjbTIHFlCyF/wBe4CoGL7F6ATXg/utTBLWr1S/ph2PGaxQL/HHA9UYse+bwyeC
         QevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829510; x=1791434310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzZXfiD796BISLE4d54SM7rERI/SYqzCPtyXD48JKMw=;
        b=byVyi1+7iq9AQD/meaAoWDwrQPiHajZ4UNIz+E3Yf1IHR4tAAvAqJFI08aQG4/LkL8
         evLFa+1TfKbT90xUKKGij81pOnD2AsP//vwZOFUVNab+r8sr/z1qaFG5CEUEkiRNpqWu
         nkTkx+J1q3uFYT12U3RTRkm7sGCk0fdK7WGQJN14R/RfXGTXzy/Uf9Vsp9dsLf8nImAC
         DimBQWqmA6uQu+OQ4mDfTvQunZfQhmXUMwAa7KxE6/0w+b8Un2+nyFq7VdYehnBdK9e1
         8FAtLoPFXdPSaNVlbTsy2fbBDhDWhufyrq9Bdd6CAoU6BkwKKH1ycOx1nSRIwFTddwjC
         5GOw==
X-Forwarded-Encrypted: i=1; AKwUvBzhIw9IxAnOAIePd6kPWO4cemrex0d6dRmOsk0Vl3dUrhp0xlsfICqxL6dcy2Qrzmzw0jFW1MXsQV9M6yk=@vger.kernel.org
X-Gm-Message-State: AFuF++lfvUfzEEbmpqAjrU00Crg6IGbV3tRrzRh1dsB7zvnSQKQRI8Lg
	+yuI5es41CTRImuld3YgBVZyx5byLy5FzsgkjheX68rhbH3vWEkFBgkmy7DHFFx+QJT2UOrg9Xw
	tnIpL7dmTy/a0mr6O+rZHnEqIq+SjJwnqkz90Hhb2
X-Gm-Gg: AYBFou0RFMYKpYFTCAIdLbLUJByDAqJTuaUaqpdmephqT95u8cIUAkx7HdIuqu8hGb8
	IouPqUwEFe+a31wviwe4zeRqZ/Cuvuyw5qDZAOD36O75nw6kyv9HUBbRKz/AcdhtjzVK/nc2zbg
	S5dw7uYDuz6Fn8yX5PUPSUMzvYENHY0CR3UiXcfm8scdT+JmJdNt7AVeya9wlaGedrkgNOeJjh4
	NxMqxMgZRYZzSk+HmmZwknFKcsBq7hPTjnrsWRm1z3fufwIFOA/c7zMiTWeo6G0Ir0PMBqwlXlF
	kShV67rtUQ28cfgmidkEtUTbGrKXBsx6Htfd30vAensaeyYRv0eq4Qw8WPjlBIJBpmJmltIdCT9
	atQdkkf3oaRtiGfrktanCQs5uJ/bZAAsBnmbId8WPSxRDb83YE417TuJOGwNDCkXhkmk=
X-Received: by 2002:a05:701b:42c1:20b0:143:2984:6517 with SMTP id
 a92af1059eb24-14d33399ab2mr3673486c88.38.1790829509400; Wed, 30 Sep 2026
 21:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com> <20260928-work-unix-passpidfd-v3-7-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-7-532018a91b21@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 30 Sep 2026 21:38:17 -0700
X-Gm-Features: AclHuK9QRXzI8_0z1Op0JTA9GMdarUQ2An_aAKGGaGQjZXyZBTeygagsSXiYtsM
Message-ID: <CAAVpQUCf9+shzzU_sar=GG=E=FGvGpvQaY3ErTgQatmB=kSZsg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] net: add SO_PEERPIDFD_THREAD to get a
 thread-specific pidfd
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:27=E2=80=AFAM Andrew Halaney <andrew@amutable.com=
> wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> SO_PEERPIDFD hands out a pidfd for the thread-group that called
> connect() or socketpair(). Enable workloads such as the coredump server
> or a broker to get a pidfd of the specific thread that connected to the
> socket.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

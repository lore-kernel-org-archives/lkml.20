Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4D3932E8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566610; cv=pass; b=Tsxnj8vCqhTRxDuALxK7i0ZUgv5ZezXhLu9+BUu9YR5kiPbMirA1gFwHkn9iKLY/u4HR+vwK32G3aJaGzzFgRB9MHEIKkqojCjL46dGbXXPFYESb2MyKOsCRkag61MKiXzUaD5tqU9wQsJz2uZfTmcvSYEtCCIWgskJvvbY0qiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566610; c=relaxed/simple;
	bh=Ju7gwhPhe+gDtBXlanX2ZOcJL4sUKBXDC/LuKD7vhrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlMiKpGoBsbzVqNLjaZWHMcDbb9V/Zo8dPp+2pHqr2eTpHqs06Bd4s9z14YK3f4cGA1fapyJbZsXycscFudvki+yOpix1tXY7hvQlK8w+9Sf8U85pO4HFKxOYsbiDUAOBk2MhPITavJEZppJfbG34958A0BMYLDuwjS7ybcZi14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvzCa+VK; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvzCa+VK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso25144f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566607; cv=none;
        d=google.com; s=arc-20260327;
        b=NMBtdjFxEsZFRe46Nxr4YYibFjShXgfDgRmh8gE8B4UQc62eG6B25YcTLNc3b2o8Ll
         KM8qdniQVai5AYObe4HuYRXAg/Vu5wK9+nQ7kzRDgDt56O/ku3Zsj4NT3em3e/Mfc48g
         XiYJyfigggCrx0lq1cQgmhdOXLF7UcjktNZW6L8L4IfPTsaxI2NRmTGhXq99F3cN1QxK
         kwfTHm9ah2HSyhl9HB3gRRUt78XWw1SOS7dht5cdw57D1EeUzJyDl1KTcXyLML3tnh3Z
         +feiTr1DaUDpU6NazpBojH6tQ/Fl74gl535OirP6Rec8uVmmkV4uMiZde+rUTdJqmbIG
         OgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        fh=mFOy7A5DjudG28kflsLZttME0UozZwxufh4YnNwRFPU=;
        b=LIhSegj3anqUd8IY8en8GROu6x4pPdlvOdsMMjnnyAuwCSeaw5foYA4xUVgKd12O+1
         ImqD6InUbIp5wew+q4m1nYIlJyOw8bh6p/t5qJuB49Aotrqg2rbM0vwi/P6W8bsAlh7n
         shRh6J5LfasgLV29ff0w1XVBKoTylfV8idxewlbRh28srk1ghkIbRlwtUsyh6w0BcwkA
         3CWnkxumQUbBb46jg2+g/gEtrKDd7atArtX6kfDBkhVRPIZcou5SXRoOImRbInhlmhGn
         j4UpwL2bQaxtKh9UJEtIbfBYFE5nNnJYsJRwPRVV8SdeoFK0c2GqyxytqQl2OieC7/7H
         ZFoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791566607; x=1792171407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        b=MvzCa+VKiyDnelHUmjUccg00cB9OywmIWuU/UXHneMkBqq1XMLSK6/n/9Xc9DKNwFq
         DGdEKXPBMYnR1JyEnf8cveksXRDGdwZ85EcAjt5d9i+nUW+72rZGzL9iBDfaxB1Qnfid
         m2Un+0IFsd192m1N6/pQGwZDF58jqbOLuUxsiGiw+bMadnTQm2gUP2HGZHQBNJrv6PNc
         v0ZztsoiTIHuLKhv9/+npOX73T2uw4nOecIT3tbqKMjiNGWAQcFzJcQX520JgQdKNCcN
         r4s5GzG2gBNldhH4T04J3iPmZ0JjMeeukHvyC3IcMHY25ZoiQX2bOJXerZ6zteM72FdM
         9sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566607; x=1792171407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        b=dezk0d+j6RRy4Vf1TPmIjPWlhENfkH8ThUfOSckYHxZau29xSg2Q0gknuW9olq2kHD
         hE6z8vIenFkZdU23bPLta+H41CC7RVdNhMo8Fz7bZjSWC8XMz5bmVs9WDHXDxl+kj4lk
         QaEBIP+iHSDFUjFO+0g7qqkiAQStJ/8BphJ1cWBjbOghj35hyilDV/LDp3NYN7rjr+xF
         Rtn3BuVSlLRiXFxCoyhZ9GBHJzxtoMeRQJ8DTMzSciFlnmJPXb7JSe0cB0xrxpVZJpQE
         rukrMUTYy4h3nCVt7fq/E3e8P5cF/R4fqESuxX50o3yidyauYSHe7GevV3AdcsX100qD
         M1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjq84B3wv3BAsjy8k/jpkWmPct+A+0VfL5Wca46sfYr8BfPUWGbfhT9YzNxb3QYJs9R/NOYPBTKZRMifU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLxd0ygXMAlEXGE81B3++AeKsITtVe8yOQUPkqO5X338vpIkWh
	hSF8mmybI/wIvGkn+TF6JtIz8KVrBlHmsMGtJwKZOjVxrMNtieK9edaabLXsovXVh17vdYzSbp0
	E1igcqORIVrPaTSOOvnxqwKJfBhyn/nuWP7Arp0Zl
X-Gm-Gg: AYBFou22rp/Iu5o9n0xyk9hh4TBZpnqDpH3QrEsw3T1CPdgE7RhSKuDsuHGhFBXEEcN
	1CcDojE+R/Uovb4JcQ3VfxjI8mEjZpcYh2dua95d+lelRWoRxTSGwrE0KjvSfsYbqBC7LkA2A1J
	B89+Gua4d1P/4ofeyipmTTdOGqRMerCqdGycd5OhXeOR2dmphEVX0zelVc2vOrxU3N4OrqVMt4+
	1v1UdgDgwXCK3K9E/xy3t3kjiklHvloYJce1Rx6s5CdL1fy8TJYQFVh3AVLGzUFU8HQjBc4iqEV
	8uSV0rBTyH0gnaKpDO+4PmUFeCwy9aEfF+de2dtow73XxD+Qx3oqHNyqia/htUpbn9Wn5QMMvDl
	XlhgrVxZ/W2SswGo14rtB4sribiUsSwVI3kZJ2p36XPoM8UKKMmgHD23X7Osx3ZSWusPD3ix5z2
	Jj1QXExFMDQ+ox26TYug1b+4WzJ3po5WVYEULjD6G2j6U04IfrgAwKkjVS
X-Received: by 2002:a05:600c:628b:b0:4a0:251f:dabd with SMTP id
 5b1f17b1804b1-4a18e48edd5mr43689545e9.16.1791566606839; Fri, 09 Oct 2026
 10:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com> <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
In-Reply-To: <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Oct 2026 10:23:14 -0700
X-Gm-Features: AclHuK-CLR4BQdqBSfFuLWEHCSgtnQKEmsz-7EKl2ZGIqsJwmtfHX25-OeazvEY
Message-ID: <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Tingmao Wang <m@maowtm.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	michael.bommarito@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:49=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> On 26-10-07 14:49:28, Nick Desaulniers wrote:
> > Would you consider this a bug in clang, or an error in how the
> > __counted_by attribute is applied?
> >
> It turns out Amaan Qureshi has already reported exactly this Landlock
> issue and proposed an LLVM fix:
>
>   https://github.com/llvm/llvm-project/pull/228309

In that case, I would _not_ work around the compiler bug like this and
instead wait for that fix to land in clang, then bump the required
version of clang for counted-by.

Kees and Nathan are traveling for LPC, so I don't expect quick
feedback from them, but they should confirm whether they agree with my
proposal.
--=20
Thanks,
~Nick Desaulniers

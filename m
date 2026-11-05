Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793863153;
	b=t5ke4Y4mw3gPOs8JjErz17a4imAeg9z5gyZwVCC6z+r6xTvmr5vuW6V2jvcd97YW8Anj
	 gVQNho6evSTOYxOmWwAfj2eXf08EZgPV2BQ56M/si8PdAeE5HVmDf9Lk6EwZmzYIA7bqV
	 b2bIEY6WAB1w/Q1YrhYb3XCQTk9AaWvKToF7CgiylQjipH+tDApNfHUzYCSHumPv1/l+q
	 kAdk03IGFXJd9aJd27xr2+ZS78LdPJZJrv4RNuKt3HxYI51ibWYZBojbGUtOfmzfjXgf7
	 qfKU3CpvQlgzlhMyGBXkVX6557qu7nd+K71hbovOCFOTJ7uN0JZ1FnL+ex2JkcroIJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
	b=KuAyP43Ri215jbl0TPuYxf4USc2xuu39k1TYorLrvI2t+XkRTUh9Leez8RuZxUbaGC/V
	 qdgj3xOME1muuy+YTTZFqVKn26DcuF6/WzLZjK5B99OQu8fDB4FTUL/BvB5gZtIiK+N13
	 Phgn0hnefMG16In+tlIHULRtrVf/M++YRQeJfDSp1qmlrgw2gq2R/MtV7ve/yUy/4BKxw
	 0v/y8ISc3IBk1IQU+bOUlnZe6jFEalR87hgV6UI4A6bn1XCWnceOZUAWn+a10FGcfnM12
	 2tqcvFmQeMRM2kn9/heyFogkui7/Gjq4gHpneVP/2nGg/4dzvBTSpIpkcWJuB/9o0yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cimb6Gj2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35CB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35CB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cimb6Gj2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35159e0092aso157966eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793863152; cv=none;
        d=google.com; s=arc-20260327;
        b=m+sGAZKwlS2LpYpkW8bF9sQfJ/hOaRh5dTElSO+czOsagPAnaxdXbSquebBI17cG4O
         aeLKytOya0wDVCIxS97GpZAsJnHubDD/klQVltff/uFePqP9ZOoo+pais8rz/h5uh6z8
         yJqfBJwygIh2czaCX7+Pa4inDlr05aqTTr8CCuC18PcCyP19s5fIP+AY8IN0AG/GwCOE
         4Q0aserpxnuckbrgNRLeRsCgHI83oEMQsVerXL1CpOVwDqdvjDVEXcJUP6gqFVT1SLyx
         o8sD2kKXYUAl/LeWiqfrHaoDPpDiUq03F8+f2arSWdU+9uakuXTOsZXweorvU053VfRG
         CCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        fh=hOqY7/y+faBkY3TEySEm0C31JpjBDo04oPh8YBPOkCs=;
        b=fgyiHtGKcHuqZXDiLkr2FiLR0st4/ElQKTeHDoebe8qQmxaO9aJbyT7L62UAPNbh4k
         Mitk7kkq2CMHMwO4w7YVuoDdHZGYD74+2yCFlInqfYivxbsy2r91iPpAW7otTrHHotMY
         7Nv41fyG/+WF5UcB1zbwD481tY/K+a23A5R4qYW9y9oVYX5o805fittwTU/cITxmr06s
         EEIfcBKoPuCmT4B7MrEtqVK6scVjX5FL/4FLKVkA6Ykr3ghJOWlr4ahnTNqlfXq8/hHV
         Mv5VJZykQpC0IrorCllbKmVFA1dinOuwMH3JZARFn+C6cLaeLEZ3KK53dRvtWfGyYktX
         +EqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793863152; x=1794467952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        b=Cimb6Gj2EJi/FqZeNUHr67FC840JAx3NEYrKqqUZU6zv9WZIsd6BBNulSZslm6iLGC
         86aRtsFr0yHkGYTN1gK9IQOaDVAQW4oDnJu2OCmhray06lZnKfvCr8rJsIC57Yk7KdeG
         uRCAojvpOi7qvJJPI1vUiZ67sCYSNyWRf9HBMgKPPO6sQsA8B8UbXoPGTHFWfICmJuVg
         wIGFf/Ah9tUGCsPruwfeiMJpuf7i9POvn9pEK0wPdw5A4+7Q0RlrvJrUmx7QyHOsOZpP
         nX00kvipqA7Oeil0AKZJNpqS+dpFCpPNOUZdtt/j49WFI37ltQjFqtTuGx0bkPUK7Ssb
         usgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793863152; x=1794467952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        b=tF3sRHrXEhKGNE/UTAZ8XZSdVJCufwtqzXjXc417l6wMrjHx+pg9VyqvtcV+1zk9sC
         szp/ePPybi98lf/yUko2nsCY+u16LbiW/50XmsnvqhTtgR64I9ZIwoHQ0uWU1Ms4Okpt
         QVnMhFPuuLoICnw6Fy4mQfQdxuSSslGomJuKpjUye2mpWT7QhcJJ2QR7wtT9i8v5pnl3
         clKlNmG+vwnwWiwxIa/HSgVgp3y3g9uNUYvWpvmXiw6E3wBUrwrB/+ih9DUxvGO8bvAG
         COfQgH5m9AN46hYCNAr3OOhQ7N8iLni6BVkcX0HqQmoj0W0VUMaHOS0wTa96tK+Y5NVG
         qU6Q==
X-Forwarded-Encrypted: i=1; AKwUvBysY4dvpLx5STEtJ5vnPpICVMwEopSrl1L9roPY8B+43V2zb3BqEJSFpa2h2Q6+/VQL/AfaLJZsuo4Pvus=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hOPImdrxZhqyGCX4O8KunE3wHgf1v2a/tbfxjE7ShT5Ni6Vsw
	cyAuqvYY2ng3+s1Temqc7R8HF0Y4ue3tbBizIrJxW1b6jUczKZ2Zs2QmC9nG+MLACVV82P4Gvs7
	90OcH/KFRXp1NZ0s+l7nrP+nV2xfskNw=
X-Gm-Gg: AYBFou34PA57KmuUHYgvRYDyQJxQIlhQ5WUakm1Wb3PV/tqP3XVlrT/JxlkXFa7A2+N
	N9jgnh3lgUHYoHZU2X0kqPC8VMq5S/paXl+rC2UBpuQNn+QPIT1AwkkDsyvp/M1d237+YJretom
	ofzo7eNMrIRKzT+b9560bhUKCi6pacW7voWvjNYyLSX8zmYcqLKQHJ5g+EZp82W+xD+OcZF7Svn
	hENLuYMXEovYTzr86hbIarYKNdFEOixWkTPAqZI1xXjWmFKUZO8eDke5e9+x2wf77iQJUvGI8YZ
	8KZACFVtm2cIoqCTvHTaI8yfLmZUDXkmIlxfy09ZW9m84YEDTxF36X54th1SfjB2qcjVDxTbyx8
	f2gQJbceSTUxwYnJsMvFZnd6Upj/UrPBl41vOACcMDhimy2XRYLYV3wqWCk7VXtewgV5AwZE1MW
	40Y9UN9GJBnSrorgZzKDGnkMq5V7KNBSz0iLe5epE8Wca7b6Opl7/h1ECJ/KKsHkvI7kWsMbJP1
	eFmQF7GfrQUxBo8QC+HSt7XW00VMp1dhF4K
X-Received: by 2002:a05:693c:87c2:10b0:36c:a1bc:6114 with SMTP id
 5a478bee46e88-36ca1bc69bamr11080977eec.0.1793863152067; Wed, 04 Nov 2026
 23:19:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104020009.GA999555@ax162>
In-Reply-To: <20261104020009.GA999555@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 08:18:56 +0100
X-Gm-Features: AclHuK-jaNt67HW6FfiVCm7PXBmxx7rZN9GM4g_TqRjcMsIJVs_M9vm1fKTDwXE
Message-ID: <CANiq72=cB+J6AzxFJXpYgX113Ly1bCU1xbxuG094aP+FeZG_eQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 23.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

Looks like it works for a couple Rust boot tests -- thanks, as usual!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794709737;
	b=lIkJlCNnLn3L1vTOIhKhscMlfDK6sqsICvMhspfqAcZntPqNYKG46BNxo1G/bE1lKwpq
	 tWk7XssLz4vPae57VS3OLun2gIh6mQBXT5+M6q3ElMY9pXQZJ0wEALDTiZVoJZLcj644M
	 O2NekNmnI2bhi2f2w2ByM/thqMSwaGB8IRhWrvazkyy1H6TxYFvgPHhdop7n5jFCcbWsP
	 GJcgKAgnT/3zpiEK/WL6mXr54D8NDbkubn5wmTgQ7pNpy8lu5xzsN1FZnb0YMfJ3pnyJI
	 BAXAK9/yN3KLSHA+kTjahZfnRejnEh1Ae/V9VF7iV2savqWFGaVwpLRL2llvBhcvHsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
	b=1GEaBt84sA6Dtr1nVTqLqtLega/5/SEWwKSxCvtf6UII7WyDwlaiGpNPRjCxdvv10QW4
	 iXv+0mz6Szvwo3hfOXatMI2HQqQsF/UZqxnNSopobdegx0Ne8GEZRQ9bydqvoFL42+Vqf
	 w/yg3HIovZT7tmbMiifNULCCdOg8acZHS9u4sRVJgppF4/fjn0bgrh7Cx3vQTqCOBglAy
	 Es/zuZ3s/JV69SLkwIWVgrKfOmg0FjwhKHv76WeQAnhkCSrr1Bh/LXb97ZWhQ2pLSyjkH
	 dcNBAR8OWNfwHP2v94Ee97k/cVMau9+b4y6sOIqMBgTwMmFWxUWIk2Iqkx4GTtwTINw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbfneGYr;
	arc=fail smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B069606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B069606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbfneGYr
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ad1db7e31so479512eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794709736; cv=none;
        d=google.com; s=arc-20260327;
        b=NW9nZSB4tdG+HoU2WGFHOvFuA6k58oRFE9JA+DUMyBQec2ExUo1OQCQ41o2ZtIV3JP
         RvUM7H9Wi0P/ErctzS8XxPGPnt7GxfReyH9HVVjzF9ZOos5RbAZP7PqzDSXUzwzovw1g
         4ovkUyh/0l8d3V6vXO9jXOfkAANSvo4gEXxheays0ldGHx1mPZIoCij62KEjt3eX8DGt
         1LM20mINcqNBnp9pBCSl+5Rakcz2xOxUTfvM5Cn6pRaq5Dno7EPF+1smpTzxmjCqtWg5
         g5KpiypZjnjR1jsh0vG0oUyykHIEXgmIkpN2mzvO93uu42soCfapnNu3ElhJ1rLm24Ua
         II2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        fh=ACDTArbG5DhZPjO+l/rOITUL/rHwTW4w5q7p72gQGGA=;
        b=fstHbv8GvoMINGJAImvWYVd3+HnOKngbe5NY9W72QeqBmVCfp5Bb+ml90Kmd3B76LA
         uCpu/FeIx84hGAqUfbFSQ7hnPoUOJCj8mjGLyVi4hu4Kc7IijpdDd2tNtWxG6/2wPG8O
         CsA2LgtOV8AyvIAde7zH7PMIWIE8dY8D/9eibGuVLLSifoCeBo355raodqJicjzuIBNx
         LnujVKVZwBECZnDRf7vHeK4SSJbPyOSL3nWa5AkLbKX6zjabjymIM9MF8ELq27EChQf3
         MQoUVKRSlfBUyPc950L+1ky2cp6x+PUji1UNW0dvZ1G8Gc7ATcThHnkjLX1eDnn/njll
         6K/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709736; x=1795314536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        b=nbfneGYreYpMfUAFkHDdlSMQmERdv23sSDuuWJ0gzACuRP9FFyRT1YhoCeaRNHI/jL
         GsNPvJ1lCij/s0E8/JKYBXgeOm98BmOsIqtmYEEd9Q11go5twbrwrZfHYhwsxndejGwb
         coGSqvOT/VjRhCiU0gDbZO9XzTM9tsW8vq8oPHjV11xIHreG57Y+9SAlELikVNansz7w
         DBfUMM01rxIJZvCOdRfWEtFTZUWi91j+FXUH6H2pFwKEpwV1o5EMLC3tREoEQjcKt6Rx
         rQ043/klYKCRt+u1wmVY8lr65wlrxV5NKQbmiv5au+/hyPqPvinslNUx6gAjn09+GaSY
         CHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709736; x=1795314536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        b=LqpRrd4VzDi5bwU+t0SRe+BPHRw5oBzLSD+abpLzepV77U6czzAb9r1LpyKQVqsh3D
         V3WkKSrx2nKVpbYhE0EYRRIZ9R2Yp/ul+VIp2Ee0PWZHUR5Fu+fOV406kh245buSHGlk
         gb/2BMMOj8/55+Zc3XPhoEOwCoIhHCsYCJP6wCQlbFDB0EO0lYKa+PSY4rlbv1pWHSPh
         VVZbR8sMehvA2nUpiZugdxJSrupR0BV2J9Eb7hzUECjRUwL3T0WV6fLckz73ThJ4du9v
         sozw1s6EsICpydZdu3nXHN3q76V2cT6x6P3iunOFUFUdB/iPnyFCbjzMijZ2n+GoA+hs
         E10w==
X-Forwarded-Encrypted: i=1; AL+hErEefHcZXqzFAENGdpMWaZo47wqRCwKsTsg9aauoQCZ1IjpkEtpcaGCtRi8ebN0uh9ZU0+vhuUZOiZ2kfNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yBebEek9hVVbpDJMycEK//5plFnv8SxWtJZiQmmEY4jQxQzrM
	L+VYbL26MrjHD8vA0tGF2aYBIX8iCSrWqoI4rvuH0cYFnMTDybe0sHYrn6oujIvTXCJd3XJJQvA
	yJgOz6lnknHCGgGdTFg5emYFl5tMZuhg=
X-Gm-Gg: AYBFou2B0CvAJZJTT959PSqF83/owQlv7YB5VYfK2ngQt7I3oMtW0OaCOxzLVbmEjKc
	idBkfPIlcH6Gx6Zldf91ZAcs8/HmAZhXVs7UwSfQfx7fN5bvDD7KwTLJ9do/t8v+pQMARazQuDh
	ED9DEyDsQndJbytoszdsjXDvzz8DEJYRqqD+JCGuTznFNgAuTjXs5b2YPNcNcA+Ba77Drn085rZ
	em+SSjRMtkf2BCJhGMDevCdcJLKo7vAv60Pw/Hi+LlD+v5RlJrmlTxIJ9PAQtyXR35hKYcFDKHZ
	ShXxbI5esTAgz0oGpig+MSm/IAp38P7my+3U3UB3MAxphsTnTmNuKbsqOBXyCSnmiYZtu3iLJnC
	DxcTyhHNfr2ZNaLCoMsgMkKTWS0Dr9kOLGWd57UVOeRYqAuEiUJ3m5u1y7U1XkCTv59us2Q6Khl
	dbk6EYf+o/abqMxBb68buI6vQ+KXboxkhbJShcjKPVb5guR3SFtTriAHwpFw==
X-Received: by 2002:a05:6820:8105:b0:6dc:7513:c06d with SMTP id
 006d021491bc7-7197cf12f05mr6314842eaf.50.1794709735598; Sat, 14 Nov 2026
 18:28:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn> <avkT5yu3hJgi-YWb@fedora-laptop>
In-Reply-To: <avkT5yu3hJgi-YWb@fedora-laptop>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sat, 14 Nov 2026 20:28:43 -0600
X-Gm-Features: AclHuK_Ifc5tkbepMLK0d8ZgWsUZJ0Zl-dFfIWODo7gKqOHzWbB2LamABucX8Fs
Message-ID: <CACVXFVN0Kw+jvDuZJB-XaAN3hNDd3WFvLZULJcpKrpz3qiehXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] selftests: ublk: propagate stress worker failures
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:07=E2=80=AFPM Ming Lei <tom.leiming@gmail.com> wr=
ote:
>
> On Wed, Nov 11, 2026 at 10:57:59PM +0800, shao.mingyin@zte.com.cn wrote:
> > From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> > The stress tests update ERR_CODE in background subshells and use a bare
> > wait in the parent. A worker can therefore fail while the parent still
> > prints PASS and exits successfully. Calling _show_result() from a worke=
r
> > also removes backing files shared with other workers.
> >
> > Generalize the recovery PID collector and use it to wait for every stre=
ss
> > worker in the parent. Return errors from the worker helpers, leave resu=
lt
> > reporting and cleanup to the parent, and reset the PID array after each
> > batch. Keep failures ahead of skips when collecting worker exit statuse=
s.
> >
> > Fixes: bb2cabf23568 ("selftests: ublk: run stress tests in parallel")
> > Reported-by: Ming Lei <tom.leiming@gmail.com>
> > Link: https://lore.kernel.org/all/avJ0Vn9G7XhZv-XL@fedora-laptop/
> > Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> > ---
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei

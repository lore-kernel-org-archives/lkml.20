Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800013;
	b=AsQLXhXUDH8otxZVlArbAngAdmLr4/z+MqVfJrkOskrHfj6v4N3gFe2muAgnx60am+Vq
	 gSl80zP8fdTtKKDaXI7p1hVwlwoD0H5MZE7dimDIbxS3ZK08mZgznFYe3KxUKf6dZu0U3
	 oLSe7hPAZRsdD1YfiGGgb6BmeOJMef+XdGLL3+hSxTjK9s8tcQnyG8yrRpA/QRqFZXxaP
	 td6dlo1wbqPELt6mKaySWLpx8z8Wvbw3IlcwAiPrJzvInOoTzfcbrF2WR3/isjhBNFQE1
	 SLetlPA9Nni23apx1nwA5EYKWnEVeNh0RuwTASUQLEZzD1tQ+Cs4LwMqUtdeti28ycQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
	b=YycWtyG4WD2AkqixP5XWfwAAoUtfwwkYx4AZ142XxDepJZgZ0OGO2SB9WNUydzmjK7C2
	 d4AsgJvYZys0T/x+xHwxAD2Ta7hq0TL26Q6mrvW+D69X/wk6lfat+dB0g+UEr5D6ehipX
	 rqb4BHfVQsTjFV6m9dJQK7/5cuNG3TviHWoD9S7eekNceLK1xPQ0Yr/iuVXF0mROk5sOk
	 u6HWp45s1vu31lhVidXiMHmczWUBJa+nDJuPib7abD1e5QZFD/pvkz51ZhGWLmPHdJnhv
	 xLG6Fh5Z5GtrPKZYiLCgIGVIHyGDCCkpjyB12nZ6zjEYPHjzKP2nNViY6MWZWJrWNJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YikxubsO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F188606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F188606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YikxubsO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1249928eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800012; cv=none;
        d=google.com; s=arc-20260327;
        b=VxpUbERuVRKRq+nrB5K8jGDDHT4wzj5AJ3w4nIFNn+nNDqZaQiqteH0YGj9x7iY6O/
         kY9uueaXSETV9y0/3pEftbnM7woTDlMp7hb54IZhFTyamb4CAUC6eyJbwdEPZTP9tmcd
         t666Tmgy0qe8xoOUCCd+TnMopYkxWqmw2Y0x7eCe1TT4GbwN3CaQsJKEzpxaoBw5ZZwY
         1Aq7IfBpTKtnOeyWY3ZdQVsuolOjewfttqZxbZuSdOQh9E8Af6nMdqQFT2R811CD146Q
         8JX7wcCGjcjM2Fl51Q+7S/z0+6BP8YMD7WJrN1hRyZ+INh2ofyROTTmH1BZ+l7yePXPS
         K5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        fh=h0ci3cbV9hMSJpo2HGuo2jmF+2JLoW+bcWUQwvvlCGs=;
        b=KPOK0Zrs4J6BgmI3Wt6xSahcIOi84kE4aq/LVZLm00NeGCZiknRhFry6yr+NdplhNl
         F0PM1BzCCxjSAdT0KtokCoEyo0pY3u1u/Hpk4QWXXo8NZx91frnwz2knlPETBmZKGViF
         12RnZXpahPY6WJVRakJMEgcxN9HK2cg1AVd5kan4hO3AOFwVpp1fT/sRWptdceuSoE1T
         F1L06AKmD2zBQSO7GW2wfXn6oB2A3YBPECynVy2E09dhFaUrsq6LIdq73FSIV5Jp5o3l
         GfSntf/eBue/YK29AG1ZHuZJxOoo/SfI1Ji4jlFY68sMwICqjlxcBbbpm2U2opaAfgEz
         D8Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800012; x=1794404812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        b=YikxubsO8EW9n9tgtdFn4dkvgSt2iwtCQEraYsgw8D71xlFrgPfYSMq1hxz+s/Yjg1
         zqBWBjR3tpfKTJp3ibtGGOsdlGdO0fIg/Fw75u5adVIyd6nT4MrAqrkqBttWuq2QIRUE
         QR0dtqTzhMsrcJDTYQeID3xZ46xXUUzKBbuN4ovMfy3AYPsFwO+kXzFOEOmV9oyNcJjX
         Eb195TYG9btwnRBpGYtGMBQWm0+FVOndqpHbUzqCF42cbCIB3MWYtCGL2WXEEh/Hlgij
         MgvY/5roDMeqGTyW2sjfSHVfdevj4KaI4HdK0CHCLq23WasgWMnFBeuYHVQ+E3fdsfSF
         jGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800012; x=1794404812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        b=Mwg+w1ULkAxC8R1z0/p/gUnV1pNL3At4eblaRC6c2mWqD/6mGqmZsSCNagp4rf+GNN
         pByEbgzdlEWhctKokIWpH7Tc98KTYkawtNfHyB+cdR9O+cSIhqbWTG1Pfn+FTW1Osolw
         2B4LnKdi1Ly5LHJKE9IpcO6iQ1UZpe+rjlvfWsUI5+Jd6rr9pQ//Ae/daZBokeC2w/Ww
         QO1zPIoW9jz66SUiryeAqF90mnfAhDIRo6tOzEhkdcijN8YWPB49qNDnE974Ut9gMoWX
         enFQ1oiqnIPUGqQ8Z/Scx+3YmbM3EWQ98ATFXr7RTdDZnSCbsO1RUDPUVpH9FC69jkBU
         +HAw==
X-Forwarded-Encrypted: i=1; AKwUvBw8gI9vVhnHSwHyHQWHQtk5Vh6Q+BvSwLnrKrDhXPUUWk6hi+FSpfeYbZ6+tPJ36P9NqKzcswEHyfz6qEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UjjNjHMWFRiNvSCfTRWTpsi1Dbh7BDPQHdCRNrezIw1alIZBo
	G7CXCdD/nRL/1laVOZYetl1kv8tP4R47uH5Q6I0MjmXdRKCi6iKeaSvKqbJqIlHboDx94i6A/WL
	250JjDN3n1iLiAJcEynPN5oI4ivWq81M=
X-Gm-Gg: AYBFou3C8RQrXGIRF7B8DxP+SbPz+S9XhMp1jSqzrBcIJ9NUwr4TfTiMQ1A5rmysQ0h
	jhhTmYW2jQjI/B6HXjqobGk/RQ4CqwOpgVLtfl87eZlY0a8SDGrjv/GBoD5Sx74YJdWsl5AulUT
	MfqVQKWtWSaP2MCKEBgtdKbMqXFOQsGNmAUghGz1EPEgVucm027ZDtrKJP+r3+bB5h2b/7GkRwD
	J+Ymx9d6Zu6rtltVrll1nKxFnCcs0CA/ROctDR4g+8z2G7qH7XP0dYRrGYzye57bynsRRIOSyop
	Gjur2Mjhksz6Xa3bsNBUEDuopYJTR+ji0+LwU3S/cu/H/EHEDZDhmozLtd3JCJgOngIwdp2/LSC
	4yBQ4Nmtl1WEOmrABrsOdYlWnNi7BuC+m/wWbmw26XVjeJg7TjyiBVsj+2D5yhMrh8zG8mA5IxK
	sGlOwwL5EeR+aEctBHtqvzlnxWjbiHgkvGKDLQX2ttbLmG0Da11xBcJxU6l0x7N2ahkRZeFc3Dl
	ohctC4=
X-Received: by 2002:a05:693c:835c:20b0:36a:30b:5dc0 with SMTP id
 5a478bee46e88-36a423c338dmr23659532eec.24.1793800012108; Wed, 04 Nov 2026
 05:46:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103165419.687806-1-sashal@kernel.org> <20261103165419.687806-6-sashal@kernel.org>
In-Reply-To: <20261103165419.687806-6-sashal@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 4 Nov 2026 13:46:39 +0000
X-Gm-Features: AclHuK90WkhgmJhmU6xdUm7mCsob0Cru4i_Y_AMzLhb5jcxjClGipAhE9WgIpYg
Message-ID: <CAJwJo6Z9qvw4Mig8Hs=dhMyjnZ5UPS6sRbKvnfFVqkoX1iFXgg@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: tcp_ao: make the netstat column
 pointer const
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:54, Sasha Levin <sashal@kernel.org> wrote:
>
> lookup_get_column() stores the result of strchr() on a const string in
> a plain char pointer. Since glibc 2.43, strchr() returns a const char
> pointer for a const argument when C23 features are enabled, as they
> are with _GNU_SOURCE, so gcc and clang warn:
>
>   lib/proc.c:61:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>
> The pointer is only used to compute the length, so make it const.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks!

> ---
> Found with gcc 16 and clang 21 on glibc 2.43; KernelCI's gcc 15 builds
> show the same warning.
>
>  tools/testing/selftests/net/tcp_ao/lib/proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> index 8b984fa042869..50062b527a393 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> @@ -56,7 +56,7 @@ static struct netstat *lookup_get(struct netstat *ns,
>
>  static struct netstat *lookup_get_column(struct netstat *ns, const char *line)
>  {
> -       char *column;
> +       const char *column;
>
>         column = strchr(line, ':');
>         if (!column)
> --
> 2.53.0
>

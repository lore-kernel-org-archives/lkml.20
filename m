Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693D1B4F0A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440815; cv=pass; b=gXk3EwqNV7Tj55rIzz9Tzr+iX65AfqtIQc3WUNY+kWKAvJVjVG0VAdpCZylLjsBxBxH2BXZggsEzuaRTt3r2H3XhBHC4TT9p0xAC4imq9QaneFAbUO6fGPAaOEEEUO3SMfJ9Ff/iqHAja1YJhTSHGV+hBTitRu2pwFDyMdt8mMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440815; c=relaxed/simple;
	bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3Whl79MniU0iAp6Uil176uiwuW2FGjbVqZrUvJlekuY+r9v5iWENHWiKzsB6V/H5cunVJLdvAipRQ2I2YCmeKTYgp/Dw4MEtUuZOG6DQoRcNo6yxb3l1wzN1W4v7QgtYb3hhuLMDeCDOE1kw5WtGNMr49gkTK8IEijtTFq0gpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCsH55qG; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCsH55qG"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33c2520ad38so6194040eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791440813; cv=none;
        d=google.com; s=arc-20260327;
        b=aEpbeP6jQIkfyi6P90z9pW0529ohnvgqXqZW+eZ6qOahGwBIew+aoD2jNB5nFygvIe
         rk300oYUPuTnkcJf0LdcuPbX6p/awNtRVWAQFzfZr3lRIQKpa9Vmv75usu+KP+moyfCi
         lFkcH/6Pxj9z7q0WKXGFWzQYtbs4FprnEq4XfShH8BpWIxsfdl/xq/p6r1lY3co6+Nv2
         4HvoURDRwtcgkaGN7XgDATt4Qr80JJG7H49w1jgVJauAMERasY+Tg3Bn43vM4mtWRBX9
         lnMjmcdSnLPvxl5GE8w+4N7PsKl9pe/fRnAetKUUe5J/Yi334iUBsvsK1b1C/wCQv3K5
         oaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        fh=ppQcbpzFisZNhwtrtX83Lwy7k6MolR6zRd1B2yCgcIw=;
        b=jlmIHsENr2lBYscDvVwc30XtlZ5FWF+8Hd9BvO7ujQrkfEh6D1nHLzSJFB1mEnNlUE
         ckfkySpMwxhGBF2EHzovOnVZvkVcWJXPKhXiF9Oa4h87jJrLOjqzARyZrCGn4UEHATUB
         5BjMxvbJuVKYLdNatDI7KlgDDeYucclalpry/9s3vSoLTBd1N7/wV67Vy1H99ePsz8DS
         gCmre4hHE0VE/K57w9pv31CoWiT3pxLmKHeBjbMkyUh3/Mc53EAgjfUiMMT+t1VV1Dg9
         VkuvDk57T4WhDi1nlGsEz7lAuNk+sANcbI9OPmzslysM8MDBbjh9VwcgPEg9ViZ0ZN1h
         WZ/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791440813; x=1792045613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        b=YCsH55qG+7e6u3aqcScSLsz6pbqmJnUckEVNfedK6TgfU8Z9f7KUJ0NIQTa8Kpztzb
         nDedMeOSpp6HTXQLIsa/l+IgllCY4xIYv8La1s+bS1tbBnJ3F6NsiWE7DCACX6pnL0jA
         4fu1e/+9gsLRlmK3k+f+KjxvsHgtU37M5o/Yw1XlNoLfaUXMMhGEogOb8Ee2l3rpSIAg
         avzXKSnXLd7yLnKfXFmVLQDX1c7SCBdb246RkqgCZ013IMUtMLkBbRNvUTTCE673nn/8
         c3UIgeAA7qbmgybdsH267DETJ6vT05H1CFODipWU62BdJHwEbMI9DsVZfuhe4ysHXfsF
         +0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440813; x=1792045613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        b=1cJgEcZCeRlORYSpRklw+6m6P3UTeChvyFM0eUh/cDsNcc9Gd2VhVLqsum0mTmWcFJ
         BkTPokNsLXKLinXIvHCmj5o2xdq0bTBmsFEMNKAQ96v/oEot2rZceWfB9bsDfLi9rkR5
         LiLQlQI/NMDbmab7Ihaf+GsfF51L6uS7M3vcM7lK7M0m1pEbdfXP8wza8jqhqQKZKjxK
         C306cc2RCS2/9bqIMvbG1OTS6iKzRH1ZsgNR7TaPPMlqluhC4ErKqwfKKNJmcwiRvnjG
         gKScuBIKEOEZveugzop8HR9O0AXSHmdprJkTvFZ/JkctfgRpsdgiPfKm/bAbxYB8RLyw
         4UxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjpRlaslRI8qiJ1kjntBG6djnr0VG/tuxbg2aM5HVdPwgaqKcscRmJqg0Dxn9kaTfx5PjBdVV8YNAF828=@vger.kernel.org
X-Gm-Message-State: AFuF++m7tRQf2ib/ChszMuMTFJfIOiF0U16wi7zVEf7cfxSnaEuMdyYB
	H3RbxZietn1L742VmMgaJyMUnvxX8VopUDBHzDbPp7ufTBu10F5m4dyAOT6dcrdrAx/HkYy9yaz
	VMe01SUyy5AfSUmKrCHWR/cr9f9GpC+ijXZg5sRUw
X-Gm-Gg: AYBFou30wi3MSh/vfLa5LfdDewxNSgVnDCDkyzCgw/SXV3nRie8WBLqZ684C7U71lV7
	+sKVhSVj1i/ZV8MMl4oFgUMexeUkDSm/nA5j0eEQzyieR1p0fcquvD7TI8UeJ/tRWqoPkUyDMbl
	MQkWTzSo8944bKfo25qYWLbFmAED/kCoI6Z4aqDw5Xn42ct5Vsp6NeMhLqpW4b4Kxue/4GGk3V+
	JMDxLmiiY1cO85JMlxvc24Xe+FKobO6Kbb6bbtg90G9WdLGabqmVCBMofCHLpeJCN5TcaoqFXVW
	Bgd9ssao6Do0kcuSedBJBxhfC0kHKCiT7M3hSS5Z+FIyR1gvT7hfZr+f2vtYSYGPg6/XoCTkgNh
	mOwsO969HQp8eiCsQnd6ATVsYHX4XdgkUv7PKJucL0gLOYMK//5nRXpKWHufLpl6hpEf/9QI5Ho
	3bC+3Qg4RdtxRHxESZNXI6Y8UP
X-Received: by 2002:a05:701b:241a:b0:14b:2ef:9821 with SMTP id
 a92af1059eb24-161fdbee28amr5081076c88.3.1791440812346; Wed, 07 Oct 2026
 23:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008055233.3413445-1-sahaj123.sc@gmail.com>
In-Reply-To: <20261008055233.3413445-1-sahaj123.sc@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 23:26:39 -0700
X-Gm-Features: AclHuK_6KN2ZkAkZI5-CoJRDyPSkt1Y9b6vXV5rGVVGfwb6qixN0dbXfsSvTFvw
Message-ID: <CAAVpQUAFcwCefyELhccLvKutz3ZhNYv8fyh7ezyQRoVDZzWTRA@mail.gmail.com>
Subject: Re: [RFC net-next] selftests: af_unix: test zero-length MSG_PEEK with
 OOB data
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:51=E2=80=AFPM Sahaj Chaudhari <sahaj123.sc@gmail.=
com> wrote:
>
> A zero-length MSG_PEEK on an AF_UNIX stream socket can busy-loop when
> an OOB skb is queued. Add a regression test that sends MSG_OOB and
> checks that recv(..., 0, MSG_PEEK) returns promptly in a child process.

This is covered in msg_oob.c.

---
pw-bot: rejected

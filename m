Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132413;
	b=zhGAktmHiwyROKsERXZ6/w7xHcq9+ycbStIRAiMG+2WLykfbfIG3Psjbj21J3oEPVUT5
	 x1Puw+xB6ha5rh2ejeeGS909zMizTBGripF5mk4os1pJfz1BiAQYr5n+3iNaJPyN13qNe
	 Jd85r9p5Q1pUELZDF7N082cHzsrbjjnngj8xPK8TIh4KXtEeEeCiHHo1ANb8tV3fD2Jji
	 vBkAAf1fXl+xyRDlMWtNb0/MVy6COS91+5OUFacUxYCDuF4m+SnXXF6wMaupxv0bm1Fol
	 riB7VSQP4tjN+yQ8eXjhoW/dAe4jhzQRxtCsJRDsFNwAmuaSNubQqabfTq/EikwZLpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1nq0z98nuOUnFugo129zrVuABKTo7gElCbo+rq4acFQ=;
	b=xFwzCn1DcoNc6peaHWm9LnVlrKfQWM50saLhG78M351y7NwaSgbrdQ3JwRIEK0WdcJsB
	 h8kmZbpcwTYDeb5RyWHW42H7KSJ1akZ8Dvu0rurunOXg3vwN0BAjFtC0tctZU82aVIdec
	 BGaS/t8bB0AMsArKc9+Ug+CpBpEF+SMF0gBkTjfsyUbFnyT13pUiR37tgjhvmBzPJA6Kl
	 Ro7XAeCTwfRPmUv0CvEa7yRdjaS1JFsNcJATKU6o5sahARPcJ9oowFQTUZLd/Od3gQuKD
	 Cia7PW3ezhTBQ59vHBGE6EfifsatdR/CoYjhcFkSvjKSmlCs8jzSjesfUvw2z3nab3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Mqy1N1iz;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E402E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Mqy1N1iz
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4E2E23F98D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793132404;
	bh=1nq0z98nuOUnFugo129zrVuABKTo7gElCbo+rq4acFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Mqy1N1izf2DWs5lfn21OChX+GPdYbd1BNya8ARZfGrJH20PAz/tFEI77bEzkeU1DZ
	 GmUWvdhnwaIvhcfATr0EpnyfwyRCG20b/HeUoPKe3oE8/EQ6tV5I6gDDYiG4Tk0Fn2
	 tAaGXMiTJJIs66KbpQHX6/QZICSCmJJNEUQUxEhgJpCSnHBLe8TceiHyeOj5T6QLii
	 93zGi2vn0FCnBAMMPxOE10ELYjNezNc/E/S63fFUwWu8Gwi6eJCROy6/HSsxmD+dlR
	 HYxTnjilQyhmmdYT2SV4OxL5mxZrImPvMD1sdfs5ZfybYSqd3cTerUR91ntmZhxGVt
	 rmyhUJyi8xljmFfNOjl9dWRbMcqlXirq4NNrCLmHj19kXXmUL8Glel+ZvrVeJIH2Wj
	 4nqnIpMsAZPed+xwCMuN9CZRLbi/XTLi6MQ0MpHeKP6O21QOrCt/xLoBYcMT0SZi8M
	 huzF/RANmPMg+gxk3FJu4EUP9wTfg9hL2YGuRlRaOi93QVgB7WZnTKBwuK8jMKky9l
	 K+UHOJ2vix7hEFgoN4mjY9IkIMzdWUaOlkfywqYBDEsZm86ejPjHG+VVybQVb2wnCI
	 nHWULxqdLR7Elq/wQEyexuR11cEmuomCGVoi9Dpt4rPcWPLU4mwWJzPA93pu0NUmUm
	 Q/7gr/BkLIleVJ8dkPjx4Z/I=
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0da010661so3599067b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132403; x=1793737203;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1nq0z98nuOUnFugo129zrVuABKTo7gElCbo+rq4acFQ=;
        b=ayBhOfHSPdh+nPcGpyYTxgjz8JSL8Owlu+WnhJWZg/ElS+K+DMmt5H1lsRXekYyz+j
         2aCvhN8/VRgfeFUUfa5CFGe8ghOTv6BPW3+FB87XZOsro7zf4V0fbuVUCxsK12U26MOx
         9hmC357uMh6pURV0CTo/wgxiXQLV3qaV2REVcAD7PnR8nEdqbd4slcENxoo455xrOmJ6
         QTG6SxNGUCQdjIl8gqL1k6RRfCW5t68nLu7YQPHYSCHHE8Hnyt4a0tfrAaTOp0oZagEe
         ay/8EUxqwi4XinTJ0YlhCzQdO2BfQXKJlYT4RgKnnFbwjEy+8YJg4BS+AXHqnMSNtHCC
         l08Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1Trq8Xy6fYN5sS47TKJMTZNbnTB5MAXgp3FWD4Ku/By2l2lgs9gdVrcc2NztQgrPuvDKm42O41BrZ0ic=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg0wnd9b0wBX0Bjcutb5AZ7LQxugv0BxYjTBoqxlFQTaEJj6Hm
	hw00DtDMy9Em0rvZi1WUDWiwLWyynl166LGWTchdYL12CbOuRqIQ5j+7WlQmDxfiXMTMyIedN/I
	ml+pGHMG9xb7CcS/ZpfMy/AMOyGgVp/1gEqneyZZ7s6j6jpEROXjZDBh2G3WdPjsCBe/dQp7JJg
	GSWo3Hcw==
X-Gm-Gg: AYBFou3z/6q25GBSiPNHTg4zfV5rxUNVyCeyvPymy7l+R/Zg/7XKEAYNZCOpvIDV0+C
	X/OunJgcorfhqKc73ZttpqozQROQcS0D24IiOcU6yzE+dVYN167GH9Nti+A8Bk3S5nwNdJy41wm
	2vapFf+xSMFNcnH93q1MSEISKtK4XgCr3rJFMWL9W3Qwy2rsoUNRsaddGq6CWnIksr32CSUu/aa
	YdVs5coTAO+BgFqNu4sCe5CBMAamLNDlZEwoTmnMg4jkNFAWrGp9+0K1Jh+yQLlTQFgGaepsBdm
	nfAcrkENHG4sMk/dPa2sT8gVytg7CUU65Wh/yfXneJ/MVP1rvWTO6VS7zG1Oqn9rSyTj5B7VNtY
	ISPmmT3vo5wl68zfAsKki29PvfqLDKfdsXHQJiMMzMHrTKbkIhPAGuMI=
X-Received: by 2002:a05:690c:112:b0:8b0:cd30:ce8f with SMTP id 00721157ae682-8b1b5e6143amr969107b3.49.1793132403110;
        Tue, 27 Oct 2026 13:20:03 -0700 (PDT)
X-Received: by 2002:a05:690c:112:b0:8b0:cd30:ce8f with SMTP id 00721157ae682-8b1b5e6143amr969067b3.49.1793132402719;
        Tue, 27 Oct 2026 13:20:02 -0700 (PDT)
Received: from [172.21.9.52] (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-8b19e56e8fbsm17632417b3.16.2026.10.27.13.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:20:02 -0700 (PDT)
Message-ID: <247a50dd-9fc3-460d-8ad2-1da34c0c5678@canonical.com>
Date: Tue, 27 Oct 2026 13:20:01 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] apparmor: Fix the return value in split_token_from_name()
 kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Georgia Garcia <georgia.garcia@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912000302.34565-1-kmehltretter@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260912000302.34565-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 17:03, Karl Mehltretter wrote:
> split_token_from_name() returns ERR_PTR(-EINVAL) for malformed input,
> but its kernel-doc describes NULL as the failure result. NULL is instead
> a successful result when the name following the token is empty.
> 
> Document all three results: the name, NULL for an empty name, and an
> error pointer for malformed input.
> 
> Fixes: 63e2b423771a ("AppArmor: userspace interfaces")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into the apparmor tree

> ---
>   security/apparmor/procattr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/procattr.c b/security/apparmor/procattr.c
> index c07b6e8fd9c93c73ea82361af83337774e6d1bdf..cfc45db43aa0c7418604fbba0e4c30a90f0f6cbd 100644
> --- a/security/apparmor/procattr.c
> +++ b/security/apparmor/procattr.c
> @@ -74,7 +74,8 @@ int aa_getprocattr(struct aa_label *label, char **string, bool newline)
>    * @args: string to parse  (NOT NULL)
>    * @token: stores returned parsed token value  (NOT NULL)
>    *
> - * Returns: start position of name after token else NULL on failure
> + * Returns: the name following the token, %NULL if the name is empty, or
> + * ERR_PTR(-EINVAL) if the input is malformed.
>    */
>   static char *split_token_from_name(const char *op, char *args, u64 *token)
>   {


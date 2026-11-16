Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855341;
	b=tryf5IoLuDhxVJNHuPaDBfL9cauxRPBtSl+C2d4vlm1a6ZpjO+JH/YL8Ki2rpwQfACDK
	 69JPhSklO2oLuey5j+KdeBwjjiEkzLVzKmKo4ak0j89qjeZs5QtpYimP/E/BEBQ0E/axU
	 k7imRnHvoFvhNK8+UDJtDZdTebCXsfT3y+Eq8PXhJcLQ8dGIy3+7RsnnlFcP5YvieN8wx
	 7SgXEA8sbcITIszpPuWTv33Ts02aqthB7tkR8O6eJ3OnWRCSwDTKcytwTFC1E2+mRTfTl
	 6tmBlF0yOcGRzehU9zY2mWKVOimIVt0YkFb3bsCu5VJYIH8cpDBIedFUdejo8rz+lSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855341;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Subject:Cc:To:From:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
	b=PdZuAXr2q1CDkkjBHHKOstHUa/IC92C5e0WZhJfzSo9TCRpjJNFbEIEMERgF7Gy/ZwFx
	 vquKU9iwlTohdZcbafts7LrHqIZ9a8+kRq3Pm3sLOzKwSsUhHqSVNXtGUcihxfq1c15/M
	 3JCWTbZFjXLlOo1ILTG42qbou9ZHTDhBiAQhumvuhD5LOsR3qJfFzGe8VL7R+AmgmhaRB
	 BfqeRxCmrU0X6Y6yRyQ4buuClm53P5Qf3kfGOx/qJt51zy3GBrEnPgEb3ez7NaUJmm+QQ
	 JlEQTv6Tvqg2yyr3IP9Dwixg8iA/Ve9CsTgDfNBR2lmw1FxaRO1aapEwUXzoLhC6mqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=Hdv+rSQS;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=Hdv+rSQS
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57148b8ec14so1104336b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855339; x=1795460139;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
        b=hFFpEnF9AJmw3WN04kDk5bpB73h2uBb3L4Z5WHnjwQcyRVkPkLT//lgvNpkN8MV71I
         9UMiWeF5mzUtAvDe7i0SnfAqQtdBSp/1Llu6PZj8tPjSRItNwJpnJ8Jgr1b5wAiXB8ij
         rbx/3yVFM7RLmPM7aY27GdvrAGAnnHpv+C1nZqs1KYn2ME89p5Lik0u07ZbRGvoGhnAT
         McFl8VP0YD8swLPTbg7wx56HQMa63VNmQUihxsRKCN+7iqzGI5Si68xt1rcSyjYuNCWN
         JsBizemwn4f/kyb6qBWZ76kdyo42aRQaY0pQQ1TGqR03+neftM332Rif8W39mCewsaTK
         8YEg==
X-Forwarded-Encrypted: i=1; AL+hErEqvFB6r+VKvKe7Qpcj9TBVpgZvHUUCKg/5qz5FTaSd4/B6vfUH1qzY4muCJNyjFuSZIOCcXRmazv+6RaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/QWAtp1pV09uTC3mDKMUv9z7WGeZ8p2bpCbmYSWyIRjv7ol7p
	xk0/201MiBOKHXGkv49DFv3NgOUrdulj89NoQja3NIllrAsHGTg+CWBW
X-Gm-Gg: AYBFou0WFORKta0UneWHzVg5iyKSMymM8gDYW06kjuiOX0/2DOR6rD6XbNgc4BI87qb
	kHmhdZ7YP4SuS7fQ8gd/5EMltxvwMzgSgbdha70v04JyxxATtoUx25UHHOY5Y0Qm6g41JSxPVzF
	uu9/u+OR2rQ4YTEV0X7E++/c7ZdmvirvVI3FmjjNpflgxJ9fXNRFsEIMYerE4hyJG8ZiipfwM7u
	XGoRmbb6xMGMyGBr9mwbh3FiU0FUTh5wjG+APEQEKwDa2yO9NcfFwNaeHJlk9SWCsDV9SHS2u+O
	RFDUE8MSKszfcwfzn36HN15+q4zdPtLTIHQncMeqHXuR4edxF3a8oopm+5Yi9z0ypliXU+ONoWx
	VFFhSNy21PEHq2+QjIRM68GGHI0rctLMqWEUZpxrZ0Dld5GJhGusxCiumdbDR3Pf1ekGsTww/Uh
	X/VRVwYbSnQY0OuhUGy8XJnBhUZ/TWqGNOPs2PT6V4aCTbnp3GFFBbiJ9zDf/tvk6LroqOEhgMv
	pW5ke0LNHwTKvF3uBTjNYG7XwPwIsq5TnrlhUQj84HhL40eRlrmJ/gjFVZUXIwCO6MCYRLznx3T
	dMcRiU55E4NByEOHUZExkxAXUgGfrK/U8N7VdiVeR3eFQbQMWEJelvYfTfU+tCdrSEq8mbLasA1
	Rt+Gwk6FDklrIZI/LToSO1YkXnBegeVNOji3xwAepBOCo8IGpWD1p
X-Received: by 2002:a05:6808:3086:b0:574:82cd:a022 with SMTP id 5614622812f47-57482cda6f3mr3160064b6e.15.1794855338711;
        Mon, 16 Nov 2026 10:55:38 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70650e91sm10359756b6e.10.2026.11.16.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:55:37 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DE26605D4;
	Mon, 16 Nov 2026 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1794855334;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
	b=Hdv+rSQSDPv5yuuTaPLYD3fJbxUOeZFBKK2OysFIBS3B6sULeKrSih7aTWt5amgr+BWKWN
	epcmd9uHu8BA0WpQ7zMVtXYUSUXP9dwjueimkB+fvbUaFikXjFwhYPCoYKvx97cSMEIDii
	B+ZS3Nc2ZRAdvcIw3M4DhETmrnxylBGDohG1/KBG+/bJTiljjJ0mPl5IziP36dRPqJb4OS
	eQopJXQiQacpZRoUAvofRfi8juhfQEN4+tcq2JgHJH/rr661nVZh4EwkkvHEfScVyYJMwy
	Ip3zObxcd2X7e7OlEuZsBOOmr9tV5Rmi9P7AiugdFKIOatj+6HYrkaG218Gqpg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:55:30 -0300
Message-Id: <DMWV43RJBJPY.3OZT23NFSC6YU@marliere.net>
Subject: Re: [PATCH] selftests: quote tr character classes in runner.sh
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, "Shuah Khan"
 <shuah@kernel.org>, "Cristian Marussi" <cristian.marussi@arm.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-17-g7220139118bb
References: <20261116-kselftest-runner-quote-tr-v1-1-e6270326db66@xs4all.nl>
In-Reply-To: <20261116-kselftest-runner-quote-tr-v1-1-e6270326db66@xs4all.nl>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 16, 2026 at 11:27 AM -03, Jori Koolstra (CIQ) wrote:
> The unquoted [:lower:] and [:upper:] arguments are subject to
> pathname expansion, so a single-character file such as 'l' or 'r'
> in the current directory would replace them and break the
> KSELFTEST_<TEST>_ARGS name sanitization. Quote them like the other
> tr invocations.
>
> Fixes: e005ff01bfdb ("selftests/kselftest/runner.sh: Pass optional comman=
d parameters in environment")
>
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>  tools/testing/selftests/kselftest/runner.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/=
selftests/kselftest/runner.sh
> index 311811dc55a0..e81a35e607da 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -77,7 +77,7 @@ run_one()
>  		BASENAME_SANITIZED=3D$(echo "$BASENAME_TEST" | \
>  					$TR_CMD -d "[:blank:][:cntrl:]" | \
>  					$TR_CMD -c "[:alnum:]_" "_" | \
> -					$TR_CMD [:lower:] [:upper:])
> +					$TR_CMD "[:lower:]" "[:upper:]")

Reviewed-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>

>  		kselftest_cmd_args_ref=3D"KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>  	fi
> =20
>
> ---
> base-commit: 4d038dae9e5ba5b3fec87fad5b7bf3dc45523ca1
> change-id: 20261116-kselftest-runner-quote-tr-467bb5fe6dac
>
> Best regards,



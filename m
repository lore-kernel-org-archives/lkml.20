Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE9568FA3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968497; cv=pass; b=vCcHRpeU036dyfEPEZ2SIiWvV7XkF7C4E34jIsaHsGfiXx7KP4jYsT+BVr7BZmu4aPyZglCf5lSDV6Fk3YdOx7r+f2NvTubRZTqBLxLwgLipEfcyudjTi6wIwsWgW1z0OwOFKrqunymCJ/C9Ix4LAV/ANnrA5xZLqTbO/PKi2XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968497; c=relaxed/simple;
	bh=DA26JrnX3E4RsZIWoSih3Ec3dRXpu4nzTbYX02OsN68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhvjXmlV3sH9kHPLhwrpaHiTMUT6wu+n9i6ClLRtdBjtOr8ViOeSjKiJ195xs8Cor02o8dMXi4N2HyWn/zSBLXgyrit+1/x4l1rzT3Tg7DadErcVgVIFOk4aswvcZm7ZOZsG2cPmuXDx/8Hoo7jVYoL03nymu+5LRrVYGH/mZ0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch+N7G8j; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch+N7G8j"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so342550a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788968494; cv=none;
        d=google.com; s=arc-20260327;
        b=cSv2fQFIG5o5/4ocWd1mhKHspyF4envpuz1JV9aq5/ei/cOEPE16gSH5VBNgfpMOVR
         T40CYN7fWh3hzjs+StufVuzVoVZ00LYhNLKqhIDpt9jvPVE7Me9DbpEQBcJpbAnRkyXC
         4c/B6AMamW7bG4S21ws40Ss3Te5bQnLNN8Wa46V8N6wKHhkCW4YNktq8tJkybTZOESah
         LVbU9pvNWBOjBUIOZGlkpGr5kw1ytoKsd/yWZpd/fyImlrOK5MsqzqsfM05w8Eg3exNB
         5UWoQi64sLhrlGWIqxOzxe3SmcWWZ0d/XBk35Ikdg6KDS882gavFjcozSUBE+0R1tjHS
         8eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        fh=T4yeZ4kGc35/U3tZGtsttntwCPA9+UnHDErXXYKkXlA=;
        b=FjENQ7RpQEilvh175T6aMjM4HCsmA6LL26i9QlJsgxRDyvBQfXY63yALidCnE+FbzQ
         DftqJ08fJnVyboWM6S9vg96i9v/ClP3X+SiWxxJCtWMWJVj/vqCgXQUI5mgnZDpBeUmw
         sWfCtqfhtSFkr8PyVkqAwuEymO3hXbLawpbxzJbYYzcDHNM4TgAgNzhvLHnEHEKCekID
         B8Rwc8OGJoryV7PGHys9TeEMiI6zoJH/4PE+pB2G9YkC1U1bnFFXyrYqN5tNdhk3oqMC
         8wKTMBepEp2gNpK2U/UGnbF57b3ulZpAjKIH8p31Y/RjdYtRsxuHCFYrA3cxA+ZQFrkf
         JBeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788968494; x=1789573294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        b=ch+N7G8jzN5Pyok572cOXew8dwRJn/VKCzarLoHV5wvb2ejWx3uJ8G/XcgO9eK6McW
         iL6fwE869SdreUR9A3g8Cw1tCf4xa0uznkH1p0l5J/QqMYJuGoGH2f6HmlAmbY/kVQmV
         L5w6BbcBKWTUTHJ/adXRdEsyz2taxDW3f28lGJN1b3kTRX/412kZAchT1rWK1GKtTh06
         fmZ7UkQYavLfZaSIQ1/OsOYaFktM+vAtq+ilwBPKXq2GmSh3dtD7nD7Ei5/b6OXf0W+U
         GeQ0K1Jf5YVX4M3OlGIDwm6/+b7ymV7cc0OYkzYwEPwISt1U+7jHCv+Gm/iClUei9Gbm
         QKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968494; x=1789573294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        b=Ugv1vJpZHi5Rkrh46PlHpa2Fzhj05NYKNU3305m0nHfjfP3XO1+9bTT1xqm+7H91Xz
         wGEUdQ2gYH3qRbVzz/kfEsA/n2pYm4ijzbaRqZ2EZXAGj3O7Su2efJ9gCkm6u0BDnsCD
         pVSA0dH2CVWQ9B2xAKk+KhTJqJBFDCLnxg9EDo3W0JxEJDZ3K7cx5Aqr87hRVF7Nl7I0
         AGbvrpDPwsH1Kx0193tdBPRwLh1759PSeDwQTeOhAtqJ8HrERKYkdQQ6/TEYAtB24z1v
         1/ugjKvOmLlJz8XaNKni/g4BWyhWhdAmPoIjucshZ60EA79/4pFSbTX6ngsPudgU4GN0
         3n6g==
X-Forwarded-Encrypted: i=1; AKwUvBwvR3R166CfcTxrHi8JYFcjTE+tlYa5pDt8lvT/GS0uByl5r+vgv58dK832rcEg2mm4R1JNlbzXc0CFFmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mTO9pAz+trogHdtxwBAICS3+LqkvTCHPcPKYXV57ftptRvMTlc
	/o/a0kmvVPcI1gd6Smbu1aHjBBc6wZsma7FkPoWQ1P/z9nZGBRIQmAqCCGE/pJLOOpA/ReZFhOO
	fxFu5q+j3FJhcJ6THwJ+TrsG+U4uD7UYRGP35Fi1zyQ==
X-Gm-Gg: AYBFou1CgO8lH3DcyafAsjpZ+9KeCJ090hB/B+WBwyv9MsuNdSyNtJ5ATH/GKiCT44w
	g+VoKY9rIXyhH964p9szTA9dUT//aM+yhShgoNwfBSXdf9ijslIJSe9ZrSwRWzrkjmp3xXl9PjR
	YNrXDMPewH7SrRtnGIhQqQ8e7NmCyfCzuGn5h94YnOJO5E3uE9oJ+qxQL/PBtFlJqY1RYtGKXVq
	avs+jdYcS7lfI//pODKYAl0jv8Xmvjz7TwmOo5jph++LPlFw4PKcdwv1XTCRhxMqrFKgh5gNt+1
	cm6xp8AqhVSk1yNQfk4F+ycj2yb/DfEvOTzsT7xWNTBJFjo9ss9qCNdH8DnIxtSmnS1AAIgxKqI
	dI3QCdI3GUpT6
X-Received: by 2002:a05:6402:20db:b0:6a9:9766:59ad with SMTP id
 4fb4d7f45d1cf-6a997665c9dmr1429015a12.43.1788968494461; Wed, 09 Sep 2026
 08:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-samples-rpmsg-fix-mtu-print-v1-1-f995518f0a46@kernel.org>
In-Reply-To: <20260908-samples-rpmsg-fix-mtu-print-v1-1-f995518f0a46@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 9 Sep 2026 09:41:23 -0600
X-Gm-Features: AcwNN1VbOKjQ5djFohUS65OPwyBM-GC5UpqwPhHbfkhdGunWingdbYpulrxuNtM
Message-ID: <CANLsYkw6BmxHu5r0g=oLJqWCFrrU38vh2y-WVHHX14SwEf7uFw@mail.gmail.com>
Subject: Re: [PATCH] samples: rpmsg: Fix mtu printk specifiers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 16:10, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building rpmsg_client_sample.c for a 32-bit platform, such as
> during arm allmodconfig, there are a few warnings due to using an
> incorrect specifier for mtu:
>
>   samples/rpmsg/rpmsg_client_sample.c:68:59: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
>         |                                                                 ~~~     ^~~
>         |                                                                 %zd
>   ...
>   samples/rpmsg/rpmsg_client_sample.c:72:50: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
>         |                                                 ~~~     ^~~
>         |                                                 %zd
>   ...
>   samples/rpmsg/rpmsg_client_sample.c:79:17: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
>         |                                                                  ~~~
>         |                                                                  %zd
>      79 |                         strlen(MSG), mtu);
>         |                                      ^~~
>
> Use '%zd', the proper specifier for a 'ssize_t' variable, to clear up
> the warning. Additionally, modify the last dev_err() call in
> rpmsg_sample_probe() to reuse msg_len instead of calling strlen(MSG)
> again and use '%zd' throughout the string consistently.
>
> Fixes: 1029c89bafc7 ("samples: rpmsg: Add MTU size info")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  samples/rpmsg/rpmsg_client_sample.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index 4c43436aadb6..8c629065c64c 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -65,18 +65,18 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
>
>         mtu = rpmsg_get_mtu(rpdev->ept);
>         if (mtu < 0) {
> -               dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
> +               dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %zd\n", mtu);
>                 return mtu;
>         }
>
> -       dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
> +       dev_info(&rpdev->dev, "rpmsg MTU size = %zd\n", mtu);
>
>         msg_len = strlen(MSG);
>         /* make sure our message fits in a single rpmsg buffer */
>         if (msg_len > mtu) {
>                 dev_err(&rpdev->dev,
> -                       "message size %zu exceeds rpmsg MTU size %ld\n",
> -                       strlen(MSG), mtu);
> +                       "message size %zd exceeds rpmsg MTU size %zd\n",
> +                       msg_len, mtu);
>                 return -EMSGSIZE;
>         }
>
>
> ---
> base-commit: 70e14d5db3a01a44f6c3217bb3dda2dd5828a507
> change-id: 20260908-samples-rpmsg-fix-mtu-print-1903f03216ef
>
> Best regards,
> --
> Cheers,
> Nathan
>

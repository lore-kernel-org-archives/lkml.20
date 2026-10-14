Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CB3E3169
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013059; cv=pass; b=Z3vtAtkLzsZ4zQCOlZ3nWv8iK4sHOJFKEUqmSkBcNex3zNROXjkNOYF333RWsvIXba/c+T7ppjeQV4D62DqGFLBzY7mqhYCoYpt8WPoYsq4nFMt7KYMPGwC/d8tZyDHddVBaCd26lNGEK5kdTIINnqYBLwpLoONDtykU89ITI4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013059; c=relaxed/simple;
	bh=r63gPEMvPL46RQn5CZ3hAGQZunKTStReh88mSxqbHk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnGv5i/qesHzAQ2YxP1yCoH9BHXN+2ljn2uWlasmGSZyaSNvP0aI4RCoUCoVWtGF5U2isMfBIO2TKbEsbVOwqEYho8akc23pYITnlZ0SrVGRgx8qWeZbbTQis+nchw6RBBTfa8755UdN0pHDfbCIXOOXJEMOGz7g1LvVShFLDiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=OWdpkyxE; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="OWdpkyxE"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67489c8202cso965052d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013056; cv=none;
        d=google.com; s=arc-20260327;
        b=E1qdx7d3SC5A9EZD1lkXEvXXnus+7CxChix9elXDDtHmJdMVZMAFltcDlUKmAreCPS
         RFqzpUmSXo+XR+s5YFcE6CYVEYQ4oXdVVsSQA2VpzyiUp6GL0/Gvea2rG09W5eLgta+d
         7Z8p7+6UN6F35n3BVeXW9s11LZzdJic8WxCW3eO0XF21vpYPzVrvYUipAWYs14LyzhuL
         c0wx+yMzxmFJGW+3e/IeVXnbfpDv8kDO8CoI3FgzJk3mFojXb3Rvq7o6fFZrt5rDMuwK
         INM26DN2ye8UwGfK18bsYLfLhwQfJbNTtqQkQjg1qrXxfzBK9JAhh6rIVt6uNE2Ad4Tg
         lPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        fh=euH0D0Z75TWUMQ6vBw6wi634hSnLEUboF2evMNCexdk=;
        b=anKN5S/I9trKeTdFzFgpLQXVdp8aDWI27ky3/3nPjDrY7eSE3BY50EL0H9IzycaLDK
         0QzMwQ7zbSJb2/4bQw3+dMWrTR7X6awE+hIQM+sG35gGXzwM04J+wJoWgRsMcRPZ8aOl
         z2VQNR7ECMN/2y6OpCiNBRZEqI7h/cCt6etI3ehK79enOi9x5lUmdJjwn7TuHFu2jaWZ
         Zw7dfEfHr/yGm5+fxC0hQXCglsISFsBwrX+l2Y8KYg74YwltnWfiyp1zTQCeVDBu3lUe
         T1ePoVR6SxU86LqbQu407ylKhYiqL/VYoSMQYxNrtK0ODLeiF4a6K/hgMsvAFdd+DmLX
         hNOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792013056; x=1792617856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        b=OWdpkyxEJ5TnzcjENDcaA+a7fHg35oYRafNUrZqSlKGyEEAngECYDjQOTtuf923wJI
         uXITMvx3ZKGLV9MB06KrFKv6lglH9cRt4rd1U/ajJRCL5CCq9VJ399wc7jml892IunRH
         otivvuTloqHrLmKPDITwXC7mnD9NG6kl0RBPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013056; x=1792617856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        b=sDAhFVBEPed7LlKHCnZVV/heP1UtGCos+heO998mipoBNu6PeffIVdhH8Ut6/nOXZh
         hYceLPnqeAjseTGb1Hy/2ceows/zdolRLDLnIIfDHRFErQRv+ErLYACrOeJz4C9+Bg5A
         cNFzcypxZyNklZ4xb7U0sLMncJqRGu7DwI7srKHANvedfrqQ4llnuZx0yEIfOUrfU3Sc
         9ajvT7rif4/OdIj/3ltuRtLQ0hwV9Q8jggMFO0rQkDDIc/JeOb9yEqFYzPnpDIK6OKJz
         BYbM0WhXCCF/3qFsqwW3bknRHSzv1r7LDioJDxaBZyevRJBKGfeXdqOp/uQkDera9KLJ
         QlOg==
X-Forwarded-Encrypted: i=1; AKwUvBzLSRT2Io4SNaoaCULTyPLGHLxu24YdLzddsr4FvVD6kE5dfExSh/F+wvCZE7uTxzeai2WrCwscHOmP5yo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIct0b10rIiJXBR749Bxuva4dcPSSzYvjuFk2/0wxxpYN1viXyW
	gbWaFyCONAiTHZ8iSVfmtthLhwoLXGqZZ+vET0uvfsMHGi79HwfgIDrMKNCNPyG8RnDQci6JMm9
	ZghCk3Nax07lgHGBBFJ184CdCouMCicnAyp8LLtQNBuuyXYsH1XCMAg==
X-Gm-Gg: AYBFou2aZbgsAWdFj6C0RNAFuzJdFJ8XWtWQreEgi1YERtq1+2RkyDqWxeFowSfQ9cs
	r8HC0EPHhW5491z1Q0nrXf3UHj6LnRWryeT3+alD0lAPWPIZstyXiaCYfHgCPzWJkPdnPzArbVh
	tm/fJGfhGJR5B9D8uuX5/TQQyz+oFgW/EkxYvlF75MXJNiHGrYm8ACz6xdWZI2c0nB08i8rQH4U
	4s0Dkyoi/BEOMR5F/Dirq0S9bZ2B6a+Q4UYExiqYn7R6ciqqHitBk4J/gs3sou0QmejuI3TaddP
	dnlaR32s9p1xMyBJH6mPgP/9H6CfIWTvH1v92VQUC6aaUXA1DYk0r5+d2k2aLq2BCmzAjQ==
X-Received: by 2002:a05:690e:d43:b0:675:3f33:b183 with SMTP id
 956f58d0204a3-679362745a0mr6171135d50.24.1792013056258; Wed, 14 Oct 2026
 14:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014121414.2373985-1-ivecera@redhat.com>
In-Reply-To: <20261014121414.2373985-1-ivecera@redhat.com>
From: Victor Nogueira <victor@mojatatu.com>
Date: Wed, 14 Oct 2026 18:24:05 -0300
X-Gm-Features: AclHuK_VTAdZZkQW0BtcsHxlVRXv9pULtYyY-Xyg2W4k_wvNoU0bv1qIgpz4UTg
Message-ID: <CA+NMeC_dh5k-WQ52q8JOqYW46=dzT5EKnwuc=kLs7Mr4g25ZuA@mail.gmail.com>
Subject: Re: [PATCH net] selftests: tc-testing: use $IP in hfsc test 8c39 setup
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	Shuah Khan <shuah@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:14=E2=80=AFAM Ivan Vecera <ivecera@redhat.com> wr=
ote:
>
> Test 8c39 brings up lo with a bare "ip" command. nsPlugin runs it as
> "$IP netns exec <ns> ip ...", and as tdc runs commands with an empty
> environment, "ip netns exec" searches only the default execvp() path
> (/bin:/usr/bin). On systems that install ip only in /sbin, like Fedora,
> the setup fails:
>
>   # ./tdc.py -e 8c39
>   Test 8c39: HFSC classify walk still reaches leaf after lateral drift
>   -----> prepare stage *** Could not execute: "ip link set lo up"
>   -----> prepare stage *** Error message: "exec of "ip" failed: No such f=
ile or directory
>
> Use $IP like all other tdc tests do.
>
> Fixes: 1e24c4f2ee44 ("selftests: tc-testing: add a lateral-drift hfsc cla=
ssify-walk test")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Victor Nogueira <victor@mojatatu.com>

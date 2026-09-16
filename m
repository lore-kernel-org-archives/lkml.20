Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D714EE84A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558833; cv=pass; b=S0BC9Lv9nRAlQVpi2wDa+e/ovA2kPip6kd++fUl/JyFnjcoLiiOdRNCAlZD0SB56LvRfRFsH/F7bJlWJFG4rYA0QdwZcW6Zd/DiSnLa2KJ9ILAhA6fIWz5cb++JRyQO4DmokrW6WaF9hFbVOOPoQZNoNwtrEZoIWGPm3Xh9oPBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558833; c=relaxed/simple;
	bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6MqPce1o4QmHgKGkL7M1SHI/1X8Kdps53neMR+Hrks0ziwRMQmukfkXTJtB04wyQh8CMuxpLtLAhWxrCELA44SnJAVI1wmc0Uan90FQ4NfLPW3hxxs2dFQPbhBsS1hiKmKIF9eMgYK4n+IMJdt5xdoQITRfJfRTrGkcEjht9/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ow5z78uR; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ow5z78uR"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso888574e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789558822; cv=none;
        d=google.com; s=arc-20260327;
        b=TQ8Be5L54oRigtF6wUAPENx6sUlRmgw4KLDbfstPTj7b57J8gTYijvl6h5+YpEnesr
         Hh/bzb0RCXdM7WhKwirZf0Bgve2K1HoDzwD6GbZMVlcTR2PIJSI9CEKdPwStQ1P7BC1e
         LacTbroZLXk8GHGYiMCptdqCSbXP3Lx6TpEhZxLsqCzQi9SRaXrDR8OlK3Xy3UKjSH/g
         YMkLhyQv14DwPvnTjNZrtswLoDa5SSQC05ysMFgccSfB2BxP20TY4gVz5psAOFYZ6wkM
         A+ExwquJxuKIXSoR9aejytL7SW/W4E40NN2acolCfNKI3PZOT9yHYwETHmcovw58Oi4J
         yKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        fh=m0VhJTWNp6C45EP8vzFq/tiuI4OriXYO9tMssl6m7oM=;
        b=XtDViBRPCA4et+3oAt58p3tM+v0xqHJbXYJsZjO2fAKr+M3yFdQxmgGjUARzcBg2qJ
         tVftf1wJwP9Jz6ie7a/7XEfyjArjFoT8fT4yT3i0YPOkHD1Tvd28cahy63c9zWEN5COi
         Re4fq2pAp67vZc73NbKFWcmoWmFnn/OAZUQ6NgikooNp3PN5ahhZIBDMXT606oKYgXEJ
         LusDPowzhnDU2Ba8dBh3lOh7VEej6qnd/ymu2weRGmcWfn2hDGETnloKARJea/j2Abka
         9xY19vKSAdA+3MmTmypOht+2d+eTekS5hj/WCIsjPdvQtFPOTXHYyPjoIBh/dvAGbEuY
         k1XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558822; x=1790163622; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        b=ow5z78uRRsvrCxH5IvYoWD9Zt1t8AOjL71wdPNC5jb7P07zrWHOrFpJL7wRFhSf4P8
         rjqRl+wDUM6C3VqblXQYuNYsc1aPcVSuQNPqAgkl2ruR16V5joH+QMSNRQPOvNYGelaP
         +3s68aUq+uY21ligjRtaSaTDMUhzMo91CravB7nh3gtgIr0F4ATmnboA/I16sxzfsedF
         VTHwY73GPIpUYntoLMv0eVc5SqZnTMcrg/2qzJi9rfn0s1bHasJWZqKlPK6/ImPiyWPW
         lbEKqYK1nqZY9DoN6o0simfbillNyLPmURsSFcdmOwvlA2oWjF2YyXtL/nck1fRfD6ZV
         T85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558822; x=1790163622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        b=Ieikc3gtAoUtZAKFRd8q30O35NmT8RsqLIQkqksF6CuuUCAEE8BWkpwe1M1DBBn1TZ
         uWSLRiFiYmyFGwTBN3eHufBUPCCRgwG2KDWvuBIwGqeYGYJ4hr9WvuhiKT4/CF49kur8
         kkf6SevICTWD0gDt1JQpRSQ6vYSj78Uz2Igyx76ZSG+WoUp0SDCEHZi9IzXl6mUfraCx
         /XbG3lUZM0rp3CO0SWxVU2wayGFBAW5gmtY1jPsZGHsbwT38iYIf/OsJzEbz8rz73yy9
         F6YtEoQ+17OblovNxwlwmogc8Cb/cS+UmBzLxzXiL92/J/V/UwezrM6kTaZ2YO3NQH1H
         tBKA==
X-Forwarded-Encrypted: i=1; AKwUvByp8GujwNOfoYfycD3n3vWv59AxugZKm2eF1zwNIrE6QdZ9AuhlOCaX1zk8rGFgloY7jW357V7KchpxDz8=@vger.kernel.org
X-Gm-Message-State: AFuF++n+Rqb9JElSak1EA9TyAmYNXk3pjgkR1Lt+4lgo1jEgjbKCdrpm
	qYPicG4nA9/Snag4kwbFaemaVJlQuO8T1yf7Qi02w2shD/fYovhtdiAw+DQddrQWQnd8xrTjio4
	QNNqRTSfgXxpdMiU53tr+uzNF/pz2WlU=
X-Gm-Gg: AYBFou1jApby0mhsvS/Jrxfc9v10wdHm+33gB4KeM0970WUbb1kIwrGC0Qm1EeHx8IP
	Yy6Cs4o3KsjG5Tns9bl74t5FAbjJeuKTdu64tFOF6No57M+wHmSGONDLDUFQfxY4qr85MXV8sry
	eWat/E+WWp8LmInLvq+cpR+g9uaSDPIP22Igtyz7uppLxNwZQBR3+ElAeuoTMQU/PRQt+TVtGvd
	6uHfP49b/+OoEQHmwS+Q2PmebMjbZlCigt+DrYeuqXnXb3JkkDEbrt+6jeom5uA3yhGcxrFFzWW
	DvLIX/7k7/4v6WeP/CO9f+SpRNGljOgUcdFbDcZL48Bg65yMY6Twjbp1IdfD+U/W7SONiL8bJMU
	C/77AnBFfNs1FVAjmtZqU821fDdOmuLQIMsGgqcixLM+D
X-Received: by 2002:a2e:be86:0:b0:3a1:aab7:9bdf with SMTP id
 38308e7fff4ca-3a5dc9a7b2bmr4436121fa.5.1789558821474; Wed, 16 Sep 2026
 04:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-5-sigefriedhyy@gmail.com> <178949085358.22033.18209492388519439190@kernel.org>
In-Reply-To: <178949085358.22033.18209492388519439190@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 16 Sep 2026 20:40:12 +0900
X-Gm-Features: AcwNN1VmVXqC79iWucgVPrvrF5zMHqjVFQWTwIUaoH9hzNGmR7oOxMrBe8K1ybU
Message-ID: <CA+7S2vL7qS_0w_1x=vh+=XQKwnBMyN77wmDNmHDFUEf3qhyAUw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can this final assertion actually distinguish a dump of the peer netns from
> a dump of the socket's own netns?

> Should the doc mention that ifa_prefixlen, ifa_flags and ifa_scope must
> be zero for AF_PACKET

I checked all the Sashiko comments on this patchset. The two above are
real, but they look like nits and are not worth a v6 on their own.

I will fix them in v6 if a v6 is needed for other reasons.

Thanks,
Yuyang

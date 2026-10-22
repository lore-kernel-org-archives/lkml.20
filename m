Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667411;
	b=y15VKFHFTIuhbLK1vhs4SemX0Pde3OakHxyWUu/FeIcqJcICgwBN/b6epJx7Bp24J3Xf
	 E0T2ePtnJey2eJIsBQleWgpGEOuMAfPA6RkG5vdSxhQ6x04vnrRApAw83bxs0hlmyqEYt
	 zPVbdZywM+JcDpiiw9XM1W5MN7XRVr4Jadisp9cupreADhoCAm7QS42ZtdfnBUUfDQbpQ
	 cnMJC+uz4uHWwfnETFf81ZUIGfMxb6KjsbzBL+QprrAbphnnxg9OBO73i6Ur9EZeesx6X
	 Z61OVGqocoI2nxAlry9bGw3skSO2aIAmdJn976AUvkkQuCCFlImljG6AIyZqtMD9oPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HttdTsqkUrjCzFyk9ftzHRVp1fUqafY4l0pZnWl50DI=;
	b=b1Bs9SzGft4XYu835IHX6JZYbHQ0lC+Un+PQ+1zd6ZPmJ/hhaAkUgSCjlQkK181jpq1t
	 J4IA3Ootg+S4yAaJSXg/+wKKcUnif+G1wK1wDy4p0IIBJOEFXUSH0IlGoUNL6LfUteePv
	 5cMyRUXGkbAcUhyhIoJKDasdwMu3MPm628fQRO8CP8t1DbLMdfvb0UTNJ6GDEPZq/Ky+s
	 6pKF/wE5obexlzFLW4G8MeOpCq4uryon/h06jqOCXrOXAGe+PX65RXyvR4vCFwt45dNRE
	 Mr2/otnGJELdcROExtkJH1d4jN8N0tHCdvzUOebJZg2VnTNrBZW4ZGyqw3i1RRJUyaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=deLDtou7;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3460D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=deLDtou7
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8b20a899fso9664255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667410; x=1793272210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HttdTsqkUrjCzFyk9ftzHRVp1fUqafY4l0pZnWl50DI=;
        b=deLDtou7pY1wV3tcwrlAPJ6TbOdXdabgH+WwNfMwMIFV1RKlHobLdD/vu3xE1XzvNC
         yEJ4/1O64Eyg0Xp8WXxfTTCpmiMUC3PwLmyK2klWzHcb+kWfGNLeyt6UO2FLN/WA6RKc
         RsIXpdLndMyHHfaU5dtj+1tbed6nj4p8e9d4vtqJB5YFsHx2mYh/eoKBAmF2P3dc4u/O
         WJMxUr98ScSpVvL8jeSLEg0ae7CITRVEOlUFjG9j58X+nSVm4nZ6oubR4fl+cs+EqsdC
         tkaooQ7loDDjP1j5lKly7lac1UZhda5UNQwdDHyLD282+J8FiLpzhPTnYqBt9vzbmoHW
         9JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667410; x=1793272210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HttdTsqkUrjCzFyk9ftzHRVp1fUqafY4l0pZnWl50DI=;
        b=cYZA7xs50sY1P7cTTG73rWLeTc6S+hZFrfTvAzmj4nBv5QJBVHtTok+UtDVFyACpUF
         sGLCPcq+wC4hCkBAzbRUv3euQ2licKSSOdx2kavA/zrHJ6ZlxOjfKo7eCIJE6m/BWAX2
         RQpsLoMyy9MSvlVCOaMY0vPSZzscJ+Zpoq+NxIHQLY2JUfD6yd6bZT8P8TCukx3ZzWsn
         IoVJXcy+MJlmCsly5qjBRCSurdUv40QWQlKjv8XAEl2NX3QBmToC2dFurjY8rEUU4Ygz
         CC7K4o7rmdtcDrbH6o5+/6IhnHfPOePSSlQpGbFLSHickeOHcwnKBtcqEQffwY7UscT0
         45/A==
X-Forwarded-Encrypted: i=1; AKwUvBydmB0iqQSHiqWD85iVvm73CS0InG7EOeSjCX0Y1L7Y+m1y/+1X1SJo8gRUcgyto2syMp2hA41j/MYsDPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrn9L0rsDlD32vR9A9yPWWJn32wpZTBbRLF4hlAguZoNntouAM
	/0L0PnUGAclJSGPT3Np8N+gRb0Rajs3oZUSRMw03lcGashidwMlyRj6Q
X-Gm-Gg: AYBFou1W6RZaFcbTSOWs3XSjxaRTDE/y++ay5Al+6Z+Qpp7Yr4pnZmM+M2awi/fwFiW
	mw/aiddtJdZDKKW8OJH09petnioo/+mSA55I+5KrOqDufdFqb6pv3r+QGe5TfVIKF4WeJzHEfsB
	zh/cYu3RUqwEjcrjqZaLzmFG/5GKw1QS+i4UJ1XUK3FcClOpfnN+ZcTeskB2jqDgT+X6FCroqZ9
	bPpgTtdqiJ80OZ3Be/tiicmxuv78wdhZWQMbhTM2Ont1o1aP97J2096uQ89roNAyy5B8PWMu4N2
	wNVWfbvoS3IBJf46KuFJPqvXEBYXXXzX+HolRBQBpbJMmSsk++GpBvOk4fVL16fQOY1AfGJnITd
	xHr0/EkntVylc6chOeQpmLWYf7cPzwsHP4t/f0yGoRCniTuxGVRKprzy2jS5m2bbPVxGq/pqY/P
	C5WbM/2Sl74OVJdyCyaqv3HkExK5rHMMl5D4f6bZg8gbIu2rNCSenntgtdXnhmKs79X4DkBvLF0
	YzcXE6LwjTgDFjkAeDqbxgwW3aNF+JtHNX1vOYa3ImmiZK/KpEcJOruSlxIi9do3q6/7FgGtbNC
	jt4BZg==
X-Received: by 2002:a17:903:18e:b0:2e9:66c4:1711 with SMTP id d9443c01a7336-2ea43fabc13mr39536125ad.52.1792667410495;
        Thu, 22 Oct 2026 04:10:10 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4addfbsm21720685ad.74.2026.10.22.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:10:09 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jose E. Marchesi" <jose.marchesi@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] unroll: Make unrolled, unrolled_full and unrolled_none function-like
Date: Thu, 22 Oct 2026 19:09:59 +0800
Message-Id: <20261022110959.1173447-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022100140.101ddf52@pumpkin>
References: <20261016025613.2690485-1-shingekinocore@gmail.com> <0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com> <20261022100140.101ddf52@pumpkin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 22, 2026 at 10:01:40AM +0100, David Laight wrote:
> Is it possible to make the syntax:
> 	unrolled_for(....)
>
> Or is that made 'all hard and difficult' because he setting is sticky?

The pragma binds only to the loop that follows it, so it can go inside
the macro:

#define unrolled_full_for(...) \
	__pick_unrolled(clang loop unroll(full), GCC unroll 65534) \
	for (__VA_ARGS__)

	unrolled_full_for (int i = 0, j = 7; i < 8; i++, j--)
		s += a[i] * b[j];

GCC 8 to 16 and Clang 17 to 23 unroll this fully, and the same works
with break and continue in the body, nested loops and a loop inside
another macro. The count form has the same shape:

	unrolled_count_for (4, int i = 0; i < n; i++)
		s += a[i];

As a fourth option, the _for forms would replace the four unrolled*
macros: no clash with identifiers, and the loop reads like
for_each_*(); the cost is a new loop spelling at every user. Olek,
Eric, would you prefer this over options 1 to 3 from my earlier reply?

Thanks,
Tzu-Ching

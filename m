Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705783ECBF5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814379; cv=none; b=ZqaIwMvAQJjaNl+gabBUZZ4QwGXUBTINY8AS96e+5nwgedIHeKHVU6OklQno8KRi5A7WzJZS8kirdTP1TtuS60U17B3aQkJGL1ySROERs0CWTHP74x3N4CKLnfEeNKV9wxAbtRd8XUJ/MlSGcQKWUfJC69pc0EsGov49G2sN3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814379; c=relaxed/simple;
	bh=HSRA27bv0CSjidcVERjNYFlK+wUZ6/j+WxBFA3lQiNg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gndhys4Oe2bhgDu3P8ufFj9Wgbg6DQ/6l21ELnyDh7RpO/wEhARPKKi4ufDQTnu4gmp7pi88lr72DEK3BXtdkQUsbZ+9FZ3sFj6sib0azm8RiSpUmANU+OGOqAfxAAu1AEWIE6/JM8HyAjWG+TTkwDd57sSaKKpSb1RuwqiS8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2JLcaRV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2JLcaRV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so32480335e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814375; x=1789419175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=F2JLcaRV2EWkuVkdYe+bCv+CLh/FzlZDHwNSX1zBKM0AVNH0O61dMx2xZcrsmwJ39e
         9ZwUbtECjkJ167xG41wezAfQCI4++GvVx/mDMSH6YfxTiipdxJAYma4pqqhcrYL5ueeu
         jPJLuzyaJWW7Gn8Ewcom+g99k0UW32n7R9TT4osyXiyicalc6ovWYtvTLmIH7x6A5/+3
         d6NwCUr6rSZ2hEcx9RrCmHRNPWBGYY039JR2BaqzjkGhzd2IlR/cETVq6B0m5twgsxmt
         7qg+2zDJLxtplQyF63sMlAHDHPjXa1jEh+25N7TKEJ/4+Uq7zKZnYQml7SlmiU3GjCkq
         xLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814375; x=1789419175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=UYaLi8tWZnPqYTl47aUts2G/cSKoTvXpa+uwtL0GMhglTCWvw3sWsr3Kbs5f/XRLWd
         0pWRLa8qaX98Je7GHsrRxf5G1aYumHKyWZ2XEm6XzWKi9POszJj36DPTNBvmBfg4r25D
         WXSSZjKyjoah4cxgBPp2HkrBWgBbN6lfbCb/rlcThSgBHLPTb+vrcz/DWHkqySJPsBxE
         agMmdSiNqaZjUx0pm0qJqUZfmngtI6Awu/vT9BRaES1S5d1E957mo7njn76MY/uXleEC
         txrqn/cF1fYHXF/zI6/gz0pi8Ew3HoSN0lNEVnYqXLDZI/uQxXr6REKdBYsEB2n3/j0X
         b0Qg==
X-Forwarded-Encrypted: i=1; AKwUvByPmL5HvU6FZVUDWKpJHYXXfuZFkIG3lD9QhMj3Ut82cKFGK3MdhHkRWuLGl6KqZP22/MOcQknMUfRqNlE=@vger.kernel.org
X-Gm-Message-State: AFuF++lg+gvuZxHEwPe8UMKA/wT2X4TYzrBLJzf1t3tndMtzbzAjaQPx
	hWO/rkPB66EZEbIZqVd/kmxGykuYdbs5B9+mgGhxbboF9bNG1WkolGVX
X-Gm-Gg: AYBFou1i2rleR3FFf4fsGCuSrqY2IaOtvskDymKLOtatXGdzJ8JYEw/kgVfS+UKbLv7
	NjVh1/HJlVFWLIPZdinG7HYlDxjCTI7mNq7YD5Ce/xEIqaYYTPCP9IvrOt30B9E1eS/liJDo6Dm
	PYWpO0edU1cVTr3iPrN+YP9ToVRPCP84ipKma+t+bnTuLb49AP2ORDGMFxRaTe5jiRSoXRpvqfk
	wGMtpFFjSGA2T9IEeuHyQGYZQGXRilXLTkfKCRbrAYsUVWjxLlQxkAO5dMC8o0emNxD+M1Vw+pV
	4Oe6qzbs+GmGCClhHiHWAH2rbzNqv1rT2yerqrWgbWlAcJaTA/uFKiYR39Cp4rhAdpBEZSAdFdx
	n35lDKEi7cWEk0/5gev+C9g+lstEaKE9WaQ9FrVdr+pyFOfQ+ry5zdcRpmDi0eY7t84vrK7g4fU
	B5CfOgF/+dIzo3Aj2LICK/zLetvXEH9XLT5oeA2tO+6MkeWwDQUd+NFwtb0WWz6GmMM/dvL/8oV
	oWg6BInt9kkKrEPaHlkKlEV/nScGXnm/1u8+IycR4Gqh2OBJhRLiXnI
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr202238935e9.18.1788814375238;
        Mon, 07 Sep 2026 13:52:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm462304515e9.1.2026.09.07.13.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:52:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7d625678-18e4-4231-b5ad-d840a37cf029@gmail.com>
Date: Mon, 7 Sep 2026 21:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev
References: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 11:37, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
Reviewed-by: Julian Braha <julianbraha@gmail.com>

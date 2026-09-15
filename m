Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D074A2A60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472615; cv=none; b=Np4CQKwpyKdvIz2zDMoL1Jhf5tSu/PPH8BePzixRvoOQZfpNN5jzMN5vYD5dHIy02QEhNlIIXl4no5/LPLqpgB7G37KyqESWp2Oo4ki0EkwcnhF3enlikr0uiALLk5GGwPwHmf7trVtx6/mb+6rj8aQvaFxhdCQbM8sM4ie2HtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472615; c=relaxed/simple;
	bh=d+l9UVQI3i5rHbtsDNkrGOpDndS/w35Wcb1tA6n8BlY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LUnnlTzxrWShW9eRa9IGHP7Lzwo5EPv6+QnHeHtlnrTN/U1T11wpGbH6EQ34woBYUOsEBSxqmIFfIPp2AaGQMkMx8XdtN4Mv2gHuKqBy1Qb/HVV8XQJbNw8NuglCu7mW5BjSOqaKs8qFPtJ7Q2JskO+DSojd8IVcukXn2udhR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1U8M0uh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1U8M0uh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso212130066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472612; x=1790077412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuI5nT9rHviKP5lpNiMgIdO01jVs2umzh0m7BqRu3zA=;
        b=V1U8M0uhSmD+JGP/OdGGi1q75AoaDQmXcIMeeLhq5sMs5U02Ug1HkgQexKCHBK53V/
         0fMmyY0HP5pvQUQUnU0ZgDuL3h6zgV6m2GWlYnMGhjLROKw6/p7w66FT96uu1Nx12LGy
         8AgBasSoPhb9kOvdBI5EjcMAxJlECr4PA+wtF+y99s6o5jyJER/lEorsJVK03zI3AXnW
         UZa0OSbaNgh4dhlrsZvXxCTc3Y0QO6SRCPGZ9ezHKampagawfD1k5XFTtvyGtnmK9RRQ
         OT/c+fqeFNZjoK/7LSBGYfv3WR+Hbc834iPs7na2PVPh9QS5XCCSRNTL5IozgACjaiNW
         j3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472612; x=1790077412;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuI5nT9rHviKP5lpNiMgIdO01jVs2umzh0m7BqRu3zA=;
        b=Ju18Lj4pBWdmOavdoRnT/n21VqB9D2PjnYfTY63XpRvp7DPoMVEO+JHetpIoXmLM48
         vVh00dSeT4GEOa5HjlRlHXUK9FWqUJQnAp3rwBtdrWdFRkM5DY6ZsIpyMY4glbsXbkUn
         UuGC+6Vlac88uoafTfKhIzT87ij3QorwFhp1Z3L3M1JQOhR3OeLNg+xMx7gquA/xmTt+
         M1eyfbdV2MkdFyZ1qj7yG9cWDfoBTzUHVALrIywP1JG+R2vT5ruDbAKO6TkZOhVrAM9L
         HE7MUJDsgV46YQFFivNLmv1y6J/K8bse+7vpcYNnOnIdQdzqldYCZ4nGhrB6RwR6cRm2
         Fk6g==
X-Forwarded-Encrypted: i=1; AKwUvBzq2CAI0N9htL7Dj2rUGlyAYhSrKI5aoinNVcRHVY0t5PfF1g0RZhqQ8j4Ws1ecRgdQ4jhRYhGiZ+kOWA8=@vger.kernel.org
X-Gm-Message-State: AFuF++lGuKLuBoRtlOmhsGtSgueMjgyWqk0n0FvRo5a1x9uAgPCfXIgn
	vuwVicpgrngvXmGLQTV1A6UIwhNJacS6bmcorZAUwOb07AvPWnTGoiejXMYIZQ==
X-Gm-Gg: AYBFou3Odk+XgLxhEgAPO15lfW38Wg0ZfFEJ+hZf/f/UneCxhlNpGsso2V57NFNUJsi
	1rvGngKe3Fd33Mb5nnuDoDh1njWyWInHZ7fFXJO+t37Xw4+5tNqrgWGVQa2RSnA4r3eaMMRXcpO
	s0juIvkCUVOT1GXtcYwPWdh5uSnBbGwPlGIcZvVPujsCDft6elO+L7X7qOIY+ySmAYH4oyMePb1
	6v01IcC/z5nRZ1RUH+Ol5O8mwLHgrwi9o974u8vzxI/+bj0yTZZc/+QfOlMwZm7G+We4oRmBUxK
	4PfKG67yc1vY9vOnFUiUBfU55MAjdDiB5AkIEYcfvyhW5GmwtcghR8bG8hwdciPdEEdniNCeVZn
	i2ALYEK1X4zXM76H/u2D0AiN0aFMOSHMMi38TT4SwSEbGQcsWiKkBXfZEBEZu14RExiY13RzC/s
	pUhf0Xa6lUE5MmI8B7Myv+myqCrkftatm/DoTW4knZ/gjA7Xq1XPO1SzdSzSbkaAHXoCe+H6fpI
	g29XOiNc454Imk01c89MLglvpYpU5pBYMY/xflpl/wTioqVs6uEFvO++uqy2sAK7fi3DzR0kgNn
	pJo=
X-Received: by 2002:a17:907:3e02:b0:c24:d6f0:aa0 with SMTP id a640c23a62f3a-c29c89d1344mr292904166b.11.1789472611631;
        Tue, 15 Sep 2026 04:43:31 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:4d53:b3b:9260:9351? ([2001:8a0:e962:d100:4d53:b3b:9260:9351])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm599053166b.36.2026.09.15.04.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 04:43:31 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0122859e-028d-4860-b2ea-dcd709e4c505@gmail.com>
Date: Tue, 15 Sep 2026 12:43:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2] checkkconfigsymbols: resolve revisions before
 resetting the tree
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ariel Marcovitch <arielmarcovitch@gmail.com>,
 Valentin Rothberg <valentinrothberg@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260907103739.23212-3-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260907103739.23212-3-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 11:37, Erkan Erdem wrote:
> The commit comparison resets the current branch to commit_a before
> resolving commit_b. If the second revision is HEAD or the current branch
> name, it then resolves to the first revision. For example, --diff
> HEAD^..HEAD compares the parent with itself and silently misses newly
> undefined symbols. The same problem affects --commit with the current
> branch name.
> 
> Resolve and verify both revisions as commits before the first reset.
> This keeps their meaning stable throughout the comparison and rejects
> invalid endpoints before changing the working tree.
> 
> Keep lookup diagnostics separate from the resolved hashes. Use the
> resolved range for --find too, since resetting also updates ORIG_HEAD.
> 
> Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")

While it's good to support this, I don't think the Fixes tag is
appropriate here, because this wasn't really a bug... it was just
unsupported functionality.

> Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/

This commit added a check that will cause the script to exit if
'HEAD...' is passed to --commit. So it seems like this patch should also
remove those lines now.

Note that doing so would also effectively revert that commit, so in v3
it would be good to add:

'This reverts commit ...'

to your commit message.

- Julian Braha

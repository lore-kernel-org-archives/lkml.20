Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540139;
	b=d/SxLA/2Ujpq3qH07JxGICnSDy4q3epZhJ/h3KPWyTfo8mVkFTgenC0ejzH3UMguaNsO
	 7UbdCnztTVCd30tlLhtf122Valdf9p2iI2AFYLCF+IJJRIo9I8vEW2nrVhY8fN0o2Y0yR
	 XIlRX73+WBJqRRYwIkAROj1JQr+oGNyPr53t7oHyyw4NltJGiH35imJJKdZjsN8Dd0W+n
	 ue2RF90vLvAIDw1ls4r7ZR0iHUSZ5Xnijspt40zew/kurFXS+ID02HiROPXI0uxa/Sjcm
	 8rOigQR7SlLsq0DfR8NxrBfU6+aNp/yKTTFBlkwLcnHh7+QMYTaJYq4Tu9IL6/eazoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
	b=Ki3QJwWtEOJbXueXCN+i3rpPK1GHsQ8Nk/dLCfYhkxNjHBS9CjzTerrsHHh5voF7F1SC
	 K9CcUkLrttO0cPGpJJN91TeyNGzHofS6DzmlcRXLAA7RZztsr3uB9oiX7V+vcmdupCU1O
	 rZ1ac5aYim3PTmturfYuaJWRicH8DclqqSpby/NmILncKLbzmqiT54mIINEgvH39k8ZZY
	 4dbWnYcEkpGcft/t1c/LK+A6F6OQfdLaa2/HQ1t/JoYUz8PLZLAlNKpzZaQPOnyDZUheR
	 Z8/k7ccLoGIc8l80BnqVmjBnc/YEgv2lDkekGVRlIRg7eDE4jooebq99aoLRBPp/eIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KNaH0Toc;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE6A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KNaH0Toc
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9f6a16aedso858165ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792540138; x=1793144938; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
        b=KNaH0TocYq6CFw1E6/bOtA+AdP9Zc4pcxBZ4vg5GYkT+4PNQcEb6X+pItbdB1sGWEf
         lP0CBN19bPWe37AvM80o9YvtytTfqT/KruZHzxBNAA/Vdk4tQ0R0BGdJdHv6KMkF+bJu
         Ye7JMuBh5qlgl+wNYkf1YDZEKR/ypBgW7NryA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540138; x=1793144938;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
        b=UK9CYSTndzRo7NbM6vcrKTKPp/Fk2CQ52xLEQ0/UN1XrFv2jLgjDxN0IhwDnrFg0+c
         j5J74wd/5WxkXrrEMZ9oF8T3meQPba4SDvoGTctx65A4tElRlaQ0hLrz5tfZ3dkDtdM9
         YpzyLa5wI5rOEXkpEoeqADEAHlETtstF5NlqpmlroPXsO7TjXZj7rXSoa9kAIi1R7COL
         82YcSr7YH3rD2Trc+ibhW5aAvMF2BT/mwchSxNwK2m7oA4kiWZVUnr/bzPOxHZnrJv7C
         GMenGTfL3A714IBKMXdhix1X64SEDf13Xwd4she7F2DsAWCXHx65JN+gv4KBugN4o+EJ
         bBmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVApb1PTQqAeLcQ0sq8YnmY4wHSBJfMhbYKpOnClx+olxwRq2azFbulh8ViskysjsD5t05xkdVTd36rUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIH579l3HmVa2amIzjiuxSC5mdGeBHqUlBilUm+CUqEZKc3nrz
	BUXMIl3LVK1XeJ3qfwEoqIxhwRyHu93j0gp9bkNjrA4o384HYNqjvT+MMEGmXcqMJg3CfGJUtqn
	U3AfHpD6k
X-Gm-Gg: AYBFou3sPsVi3lXyVr+5kYrfEBacbeEAmpVXXD8goUTWFTf07u1TUHfpqJ6rc1ZM29x
	RkYZvw0cM2KvHunCi30jVU+8XmQ5zfnfkcM1ET9jNLspYlIM89BlRp6NOEwuYhEssrfFKkS3zhf
	rUGFF326M3GSuVv1EhpsThqy5xlevre43vzQQ25070WX3WVcf1bzvuA7geVAXH9N/W5IMcaeryX
	Lr2/wn7mS4MdsVtXyf/B8pJag+GwpPVejXElpymhi1HLWZM4aU0Jm9Ydmc81oSVFZJ7goa7k0ke
	dU1Ser3unKZrBgGhVIVTgsEeaE5s+zt309JxCp3gD5oXn2/iue5rMv3KZ4pH8MhEzFaDqg3xeAJ
	7m1x/Wp6c3nDUWT5VnH92fu5Xf1BhR/oUa7H5dWAnMBkqUcP6Dx18yO3kvPZHNUXN2i5bupzADp
	M4qnhh4m7WOL0+kKrjsBknkO9E8bfDuHfyOheQFW/nyQBqiQDLIaa7DQ7vYxn8xvxSf2aJk6Vab
	du+A6ds5pspSTAfHOJu/8vrgk+3Dwqy1mKc2UoCVMIq1MdmblksTT3gwC7ni1IthSeS3sm7Lgbk
	dRQNu+28XvoYc887GPTqKHKrGEzu4PxQeFiCKE02uA==
X-Received: by 2002:a17:903:182:b0:2e8:21ee:f196 with SMTP id d9443c01a7336-2ea43e259bcmr2861565ad.29.1792540137084;
        Tue, 20 Oct 2026 16:48:57 -0700 (PDT)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b308966sm4121995ad.2.2026.10.20.16.48.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:48:56 -0700 (PDT)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so276964eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxL+i/flsq4yocSoc+uW+n28wlX2iitpHM3vh7/TLjEL6ccCvw+SMMTe2EybwauiYccsyFIGUvgTIK9tW4=@vger.kernel.org
X-Received: by 2002:a05:701b:270b:b0:187:a2b1:7b3a with SMTP id
 a92af1059eb24-190a6adcc50mr423407c88.41.1792540135068; Tue, 20 Oct 2026
 16:48:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
In-Reply-To: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 21 Oct 2026 08:48:40 +0900
X-Gmail-Original-Message-ID: <CANiDSCt=7SorMBAUXTohsSV_-6BZPrHbC9u80-P7=kYO4NiUJw@mail.gmail.com>
X-Gm-Features: AclHuK_NFTuQpEwblXCYU1ELdfOsTXBO_zAq82tRWKGwdXrwLnDaicFsmdlXQkQ
Message-ID: <CANiDSCt=7SorMBAUXTohsSV_-6BZPrHbC9u80-P7=kYO4NiUJw@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: Fallout from moving '-mfentry' check into
 Kconfig stage
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan

Thanks for the series, it fixes the issue for media-ci

Tested-by: Ricardo Ribalda <ribalda@chromium.org>


On Wed, 21 Oct 2026 at 06:52, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> Ricardo reported an issue from moving the compiler test for '-mfentry'
> into Kconfig. In testing that patch, I noticed that the kernel.org GCC
> builds for s390 were not probing correctly for '-mfentry' support.
>
> The first patch moves the check for '-mfentry' back into Kbuild where we
> have the proper information for whether this flag is actually supported.
>
> The second patch documents the reasons for these issues for future
> travelers to hopefully avoid these problems.
>
> I plan to take this via kbuild-fixes after sufficient review/comments.
>
> ---
> Nathan Chancellor (2):
>       kbuild: Move testing of '-mfentry' back to Makefile from Kconfig
>       scripts/Kconfig.toolchain: Highlight cc-option differences between Kconfig and Kbuild
>
>  Makefile                  |  3 ++-
>  scripts/Kconfig.toolchain | 23 +++++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> ---
> base-commit: 997208ce9f43f01febac956cf9aeffe89945e3c1
> change-id: 20261020-kconfig-fix-mfentry-check-50525bc5a6ca
>
> Best regards,
> --
> Cheers,
> Nathan
>


-- 
Ricardo Ribalda

Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C750EBF7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057615; cv=pass; b=n1X9mMNMGNNAQ4RWXLnLmhMZfeNd9DF4ltZcq/J6Elv2XZ7gXOzMgJlLfC+ZDTJLw0zoPLMSs5YMzVnIU0F4Rry4VYJDba+Kpd5TiJ7eu13ILRXyvF1gUZ5gTSnoXX92s2H3mnPl1IhWBcZ5YPqibYBq/xgDTsEIK7oAFBJnXSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057615; c=relaxed/simple;
	bh=ICrTBQhAcFMBle4ZO3IusjWW50Bxu9MMe+LD1licGqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nat5hRqgHB4sxi8VzDIq7vjCsCrvzX/XmjjEE7C3/7Y4KpBjxf8H1msoIFUOVafnUyRiSC6jItxPxSbWaqdp4gAZMLBhFB//XK4KtExWGFHYUnA5Z+FFxd4FvNc7bY9mHcBfMWgrc5bqM+5L4bq1Y2CVZcox++r9G/IDW8Uzs8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P8s3zewn; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P8s3zewn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcf21cfbdaso346442e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057612; cv=none;
        d=google.com; s=arc-20260327;
        b=i/2nfla6C/40PrAmGkYPsH80nbuVs+RQFuD+4yYb49HpdNb5a0a4x6x7WhX9olfpoC
         5QwtHWe9Rspf07Jgc7OJ2cbC3NMP3SLkNkZKoOQMKYFxMYN+u2JNCdo+iSJrvHiH+HKe
         mi6NufEVbeu4uQ9rybAKIlVbG0iKldl2ElH9McQYpS1XyNknSdWwbPzPWPIQOake+b0X
         Ztyv5fW+LzKmBJsihYYI+IGLyheI1kdkBrbS+SZHCb06NyYUsaYYq6fn043gGhBYaeDr
         1WadbiMJHPe+9LpfDFbbMLMpiv1R+oImsuV0yd7M5EVGrDmBtynIBmFvhr1HPAqgFLzs
         qD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        fh=hdchH5N0TMmQaw1ZAUD0SiTCyIfvdf4HdBTCNm/vk2c=;
        b=oRQOz/COsu/AB0SIX9fUoq0DLPQUpXOCPaooW5pfCdfjVd0drIWqqDaHNpPTTIw9jN
         bqYeXPHI83sNMyqkcvriDf8eJamAhTVWzzHSQElem2w+tdz8XQyfZef3IKPwYoqe/mvM
         r03A5LgCrnOaKk3cNU54v/BukhhVAPQNWxJnQhLCPpgU2c3vhxx8rT+yFUpOLtW2fgvf
         zma+LK1Fjm0wB9if/1AONuKnBRhptXr5MuVJP1aoxRq7OPsifmQjE/eWO1GE2jQQYtjB
         qSWrY1r0JgWZf+VN2Xq8lpM1TRSpZJHSHyHu3mx/SwRkIHmKLg076zjQeW0/A15lDzWg
         I5QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792057612; x=1792662412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=P8s3zewnfLUipatq+GqLCGSvx1i+EJ7DV6ToSXJXwViWZ5+6/8kf8sUXAmHYA0WqF5
         dOGILgLTSYULGBXFCZaNARNcqmTUgIZZkHroeS1typd4X1bbk13RmWviU1ePgAhFRBpg
         EdOqKN4VwLFl0wNQbBTtDQbOicOqSBAJ8TWFBAVl6EG5RhHG6RWYWGhEtir9/DYxKXP1
         MGKazALbGicfMHQyJGxpTs4luLDCo0j62vDl87NXtfOUhnO6JNVZZTX3AuEZpV+ejq18
         vcbh4Rm5+MZ/+513KO5SxXN0Su6jVTq8fJCvIckEb6F48Z2/HeS3ATacZI9Dse5YgjvH
         GCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057612; x=1792662412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=VUywnTC4MFA2YdXE4pjXxEvMLPSb16pGGbxPsxYnKzE1k+7lw0al8/sxrxH6HIeIeQ
         kkvjJ/yTWhE2fOadQe2+leZObifr9/dkxRx4zHuCyj7g+mqGBdR5vtJt25zanTBiDB5h
         rNDGLPpTFIiVcegRQ0sSMp47mU9UF73ATxGyQDWtYToEqVDdhGr8gBniiZHMYQil+3xb
         u1IeRFKG1pam9zP4WL8YsHBg8NruTLc7bsMiwgdvuyLEiTn0y8lU9YIy5Y6dn3VsjzNP
         yn/p9kW/0HMDkQV5uKIpcOIfkKQiQyuYi0N9Dxy+kQ1IT0oiqD4Yz8YsDMyH/jt/3W2T
         MGcg==
X-Forwarded-Encrypted: i=1; AKwUvBzUBO5Vrvrg3ROEaJoAUSL09JXje4zBKQAIQUHtAbupGPsXGUVHkd4TCRBQxoCrp20oPK6XJ+udmlzDWjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4otuXD8wmRhvy333qLLeX6baLgVhAM0SI/eqWBngdXVbroIdc
	FnyyG1QVGPc65cP05kectFnqgrIddCvQwFQcUnVIh8y5NIpi8lyBajGX74gmDUpmeHFAg0SDXS/
	CsjXUH4MFNDqW0ykidmdEmJwqKKaw4K6xzbbbGRlx5w==
X-Gm-Gg: AYBFou3RkBWRBWPROlcYflbuCG4221ATFnBYQ+gZZ2isV9Fjd66bB2NhZREL4Dp9bpv
	V/8YZkHkc8PUxg01xM8MitItSz4wRtCHHTFsvxe66opFQmP2ic1KxuZ1FNph/JTUiyGt8wrGl8h
	ekfwILZABST1H313v0guPJeHMtK4RVDRzIG66HOwN4jlTPo3YL5Av/NTN6CtvO9XO5gR32mWdXm
	+ULKS0GMBvXeXs2lgVCkEx1AY+znd2XtxFn3USI4TFySBnOn/EvOKExmqkZBsi1b6wlYAtAOsyR
	Rq6VWWI903wbhCs6OMYbCjaOyp6pKf/SdvPkdnFj7ueH4CVGPPLek51Xmc6LkOke+zadhZIEq/Y
	RD7B4m1tlitGIWnot67yAqY3F
X-Received: by 2002:a05:6512:3b8a:b0:5bc:cbe1:8ac4 with SMTP id
 2adb3069b0e04-5bcde35d84cmr7124226e87.4.1792057611692; Thu, 15 Oct 2026
 02:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 15 Oct 2026 11:46:40 +0200
X-Gm-Features: AclHuK-V4MMe-c4XgIPiZC8N9eZ4vEYkszRRk_SEIQzq_Xg0na_JHo_eBAyU_j8
Message-ID: <CAAofZF4m3Fus+SizDwAdDEMr9V8RSgybveMhNg=nbM3dZj=JNw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Marco Crivellari <marco.crivellari@suse.com>

Thanks!
--=20

Marco Crivellari

SUSE Labs

Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636DC3B9933
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291618; cv=pass; b=ouKKrUwyJFwVPFBjreJz+kfsznClTA5CFaXQ91RNQU65PKid0qEEQ5aR8eY3MM1rKMUxjWsc8dWgohF0Ynlag0YHbrEjcMgKkpJk0uwweP1e5xp5g5HsWqLsqNhJzBqxbu9hk+MTsq4aPY33nvcI823ZBV2ei3G8qovNJigtfGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291618; c=relaxed/simple;
	bh=vPIlT3/0q3DmEJlhpdxnF5yqYyOZkdrfaCmYL1+wp2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGC60uQHVeYUDL3CHcggVrgSk2BoueTHbCcjqqHnQqO4z5MSHUkzrx9g3+OubZl0/VqqHz2WzXgBCgaEHd6Z7z/o9ghUC/PDw9pTWoTBlJaYkilE5MwVhwZtgsxd2dE4L2xiM2yvooSMRqV4wcpXNUW7lcayYPsmC4ELLXoiab8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gx7Q4MFn; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gx7Q4MFn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499add6348fso95e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291614; cv=none;
        d=google.com; s=arc-20260327;
        b=IjaMcvf/iWpHSQb+i0X3ZCZxdI2A4eWUYc7Zkij4p+HmHGNMx5mAISkAuJebAGD9CO
         oJumoPvwOX5hXbc6RM/P0jogXgb+XCbh4KlBJ0UNevoyQVkasEw8VYw+SCVGW7rnQO6c
         ipwfljzwvJwrkiwfA6AaaLsMVg+VT4mUkm3S3h/iGeJFY8yzfte3LDUZiEvDEAj23jRZ
         Vgw8uj9yGcwqBjJjtyJkqbP+XP+f81tNgN0+O2NqiwCZNIvwl4FvMsAdut5mNhOusm4d
         O4185gnBdhSWNA90EKNHoH5dJkiLhsKxeytDtZBAqeFKTxJbHAXu14neVk4odPtWfUfp
         G+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        fh=kn7TGiZwVO1j3F6sb5igeXpwReC9q2EJsWcdVtJnBQ8=;
        b=moN0lsi/1LmSNBsB5yqCTMu7jDNjzNdx9jP2sGr8WilfZCc5TC3MNpyw5BJ9EKRsH4
         nU+NejNfxSg7NqOWE/YirlJIH1xSaBJ6Dpgr8j5qdvwJXF9XQ53gn9MxqJL1bIBaTfc3
         cF5da3+9uxcyzI7834u0DJl4guY1eLELVZXPob8x2M/Vl7a4y6RDT/64rUZeTMJEuXI5
         vQG6Esk2qk7ieDKUtQkJCYTc3P45wN6JpQBSA6l2BgKt2PBmzy5KT3zXInSii+d6vD8x
         29RB1gPqS4lrmQOrB0YsMiC7BmbFdzHGxlpcLK4ltKH8XT3Smi11yqlnaL2+YbaOvAbU
         dVuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291614; x=1788896414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=Gx7Q4MFnwNsfICRyxiXCv9K8TYow9oyE4B4HpblwoG3BvjRlGX42gnaJyPAB8cJIoc
         lcSjFKFCgQVhWYWwQMtUWLqvXlQ56YulkKxRGY+MRymhQaVdPqqg8LJuM0sdTd9qoYw6
         iQJmBhClUpHGAaH8Mkcowe+JZKt5dMUZEWT8IloYdC5ZlAMjnJk17DlK9NNsFXKqIBjJ
         JCWBKDfw75FiAsp/3e1bDgrW17jc6DITZseOB/qfYZd00hpBa4l2mXb8TqLArGkl7XF0
         uKENTgjKcc89pvgz38HjCfINlap9X8yF52J3cGfx9EDDDJq6IDsE8g+Q/IbfhBHqCP+6
         m5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291614; x=1788896414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=LLxbnnYiT0RklkbgqtZwxqUosUTomJxZkANh2hfRJcyXwbUSA2pZe1O6c0mBq5ggAX
         cSQZr/5qIsyyqSjL5n4c1LEmTxAz1JgrBxnPZlBi1jS24K9mTgxMHRAWp4ymLgmTsRr5
         kLXmxQnq3tVPamb9K1kVvGY9OuRjskP8OytNJsxKxWrJsXKSZkg5mKbFUBdH9yjauRP+
         Ug1M+GU8qkQ9jkl5RtFkEhnUbZDE1CjSXQh0PUqQbqbNZxcMpRbOEnP3KVAi8Sq54KTI
         P9SCejY9Hfu7Q1mcqqPO/hka/sAKe3cKrPu/9TAOhWlTwJs9NsrDAEhVbbWLTDSSXKny
         YghA==
X-Forwarded-Encrypted: i=1; AHgh+Rro3mrJIhQYc1qXkG1hmdCjQHP25AJ6QhyTRB/LsvWxA3Ou1Bpiqm19p2k9sWBtQSu2NoKOlhlae42gF/g=@vger.kernel.org
X-Gm-Message-State: AFuF++kYoIUWKle/guFrZx9gzDdcoo2JdoCiM87TzhkCTSLzJHknBAyI
	SZiUpn85Dg8KvhoD/JxSZptebnW7OiRtMh7wDLzXr+NXxjPGDWZHcVKF2y3sgwwHrSedHxbK5P3
	HNJr5BgEmqZuh1ysT9N1wlq6/kM3zQUD0avIdM5zCPZodJWjaFH5w39LM
X-Gm-Gg: AR+sD12P4+TCXQC2HHXXqq9eThag8rKVzwH03rxdrPGOMw9VP6FnB8f9/oy5dqda0zb
	2pDA++xS9V3SSZcTzrEdUmj258iVap/hV476+IM3og41VkEQ/2gQ5HbPAZJmMWPbfLVIA41N5yk
	7jAKryRkvC07gf37/dAcsLRIYDtACpnI+CBjdGBAx2Jjr1A65COtC5GdX3WD3G2j+tr2HJpsLnM
	CXkzmwPiGX/KIKnayGcUTwK52KQxY8QE0dLOW+t8Z6QyN95IQvz84oPhg+KF2XvET+gBmpB5Hu7
	CZWIfkYw/v9B4uumuHJ6JpdrSUelbdoDwc/ZWBrqs/Y9VI4+DtCruEgBpFan/j5qFbKYp6lAyjj
	W
X-Received: by 2002:a05:600c:224b:b0:499:7da3:dd0c with SMTP id
 5b1f17b1804b1-49ce462122emr115145e9.0.1788291614023; Tue, 01 Sep 2026
 12:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827194508.446733-1-linux@yoavmoshe.com> <20260830155100.1020620-1-linux@yoavmoshe.com>
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:39:36 -0700
X-Gm-Features: AcwNN1XK0l8thrBV4rYONxxoAFHyd0qFWNxSTWm7rTcE9pRg3SR1YhO1gQnpQwA
Message-ID: <CABCJKuecSgC2yZ1QHACv3gfOYf+cPXvR5TCEM_t67NX-putr+g@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 8:51=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:
>
> - Add SYM_TYPED_FUNC_START_ALIGNED(), a variant of
>   SYM_TYPED_FUNC_START() that aligns the function entry rather than
>   the type hash preceding it, and use it to declare imx6_suspend():
>   fncpy() requires the entry point of the function it copies to be
>   8-byte aligned. The macro lives in arch/arm/include/asm/linkage.h
>   since the requirement comes from arm's fncpy().
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

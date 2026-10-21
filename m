Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575460;
	b=wxmLpELETCNjvQPRvM6gVX6Bkf1NbuMyVMJ3oPoPtE8YOncn8gDzJ7gb/ueoDhfzD1oL
	 ZWC0Ip8+b+qa8bvNgXwy/Oxriia5GDf4C0GnzNgTn1KpulUiVJ2uLrwRpkbveGvJA6gvN
	 E5VuHKlCTmt5vBVNa3Y7Ac7TrMIXRtIFdXtWIn9uEB7nri/h/mTnQxHlhTr73kndh0apI
	 OJdusCpo4suo7HIiC963YQI3FiJBHDPIReiCq8dJYFM6Fsb6oPB8RewOPowU5KoXd0mEC
	 /RESFVDs2Fuu/76fAcDpd1w31WfySrqClkjavw7pSzD1/uh2jXCBL3znh+ZRX9jf8RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
	b=2YgMcrKTonVCmKBquOJce1Wbu/3KaKB7RFFyoQ9RYbEbpvAaKkCG7tWzRWEJ3go+t3HW
	 UaOSixseJQymFq1Wnx+cN6pIq8O5u5uC5GdXeWIp2qsmhuG5qPya5UK5L5NlbXVSqvVMn
	 qLH62jjkD+XmpLbzFCzxRX0WYkM2nG2F1pl11SHL6Lx3SHRUAgworkUNjq6wsrXGZ85/5
	 x7fzZpBgEm5RmhMmdr0DcLyZzeSC6TdKOelr4mUk/IJvKOT2Rn2v4Af/JIWvFYrTg2CJE
	 sojH99aUmq67j6epEAy6mky7Db/cfrzgKtIV/CsQDz7ob7YnENGgyMeT/N1/EqzEHzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lyO39/h3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC261606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC261606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lyO39/h3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35159e0092aso62866eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575459; cv=none;
        d=google.com; s=arc-20260327;
        b=R0mBnG2K47gBlzwjfPAsk1gcTCSXecXK6J8fKUZZeBsQYpAU8wqveX2Dnq1SLunWRA
         cEfEhi2HH8dShC4XU68Zb6ivLZNJRZYLy2nUHctYejC73/KvI/CdkN55kW01Cc6lMP/y
         Pj3zrdnKGvapeK19JeDmmHVYi9QPVDFKjcaOAvp9SAD7ZYfMw2+lN9rTpCrDyUcGYq0p
         HTBooc4+2y5wCpVVf6RRb9bl/Z2dIGfowjEpV8ZH6fZY4v3nS0G8xRhjUnaUNMN51tnL
         faqHIB8vB5M0i83JLOLDOpae3kL9HAMlXsEGcLcY+g2ahRA0Bxm1Dfalt3zxUxoj8WUR
         rXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        fh=YUKDSHPWOm33Ss+Zg05FxQvmTShcj0DpM/grcAkJVqY=;
        b=eGwH5EmX2MvwUohcJbfiUcmTxcnJd+GHNorjYNE5VXEDeU374Wg9z/GxN14K2wEEO4
         8+0/Xo65pKFyMCG1phlRUYE9tEqBdt+jFgtfzO3RHbiFsc7ScC50bo/E2Nw1rPbC5tmw
         de5lHgDOq+8wq/GR7J1hWaafYD4AD65WcmpQ9LTHze0y/d2NmGN8QDhYoy23viUs3pGt
         S7LlWU/oSAfCUcJxLmR7cwNvs9maNLCgmnyG+ii2aArTqXxw5ZQ8BgezUl313e9xdQVM
         763Zv04QaGfeZ9ryMwqEWZBoMNsuzAKsERXePrdADEyAjBU9AI2JChQBWm0/ps+8U4GT
         TDpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575459; x=1793180259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        b=lyO39/h3vadAbBZSnxYCit8UCqhKByj3p1OZchONWtumyOeThw3cT3lwMfjPxtfgd0
         bG2Usxr8cE22Zo8HfabO4FT/03vXSSydHSuyY2D0WgY0tnmLUI4nbMrqOg5UZ3os/UI0
         4qvQY5u6llpem2dRN8mTxc3StQBPt65iWq22mEbb0ISCu68sXssRk4mxdcCr8927pN2+
         dwS+VIU2B21RGJDDXcs1U7dgFIRyYGh40Ok4aVeExP2uoMUfxRuAtGRDA3zetTDVNKnW
         HmzY0RCR0TGTNUbF0SbTp0fd1/iV4qxp3a4idwO0wQRt7TfZ04pRTcPCLwsJfQa8sVTP
         mwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575459; x=1793180259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        b=Ua7BxfFHuRP8+1T9nqOjZvKbuSGKGrOLN1UFKNAchwxJffOeNT+jjV+mQ/aovEv+0K
         F4s1x85NBRCE/IVNmWXV3vWyJd+fSEVxMtHL26rDmn+CNSp6mYzozjtsz31AzitoBFyq
         PCCBBNCyfVq4lOIYTjmVXR9rbIK8HAYidFwrR21Rm+wgIdm9TxX+/Iwl9cm5J3+pQ2EL
         PYKKhep6ZWniQWGNFvFwCDsze0iDp88quD/BolIX7yOZCv12AZm/T+nZinpgcsLVDUsp
         DiAwjPLQN7ugEllpCLOgOWxdDVlqXRyzkbsS8U0C3kw+BzI++OmoFrhqCTqSdeornT/R
         PAeQ==
X-Forwarded-Encrypted: i=1; AKwUvByBpvOn+KBBuAkj7WECPeBO9e9Pdcm9XRt4H5S0XM8Q9pXHbnoCqHjFE4FwBtvW+3VD6wl6K75meYUVEWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLnU/ic+jLoHCheMSxYrKuoHQNqckwSDu4WhPtXrBJPyZJVajV
	8RHvHxA8VIA3CLpRNLVOmsEGBR2ukbqm2EVDWcxJ9HPaaWIMR79G9Uq8kifBAP0rVeTjOkgiZMp
	6Ybephox/lzcaEVY8AVePHlypInMfvV0=
X-Gm-Gg: AYBFou3VBSAewST/HN7vtpVwCgMnXrpoELA6xGdwfBXLmGWoYuIsgZbKw3ojlqdVfIy
	8+8a0Q4FtPe45KfgxnPxQAgdELqCeTYMWUsMPmvIs78S5MG4oXyB3dA/pGJwHAGS3zfDjXOpdpI
	45ojZcOyawijUmGJHrfXuYtgfZzNEO2JpmKxLQq99Nl3DXP0AJLF8dosBYsHyz4WOv4T3tdffaH
	Y4bbSVynXCuk5cxjTys46kuw39k68JSODshHm0HvZb1Cd1Tcf1V5OXcjAToE2QDO1eFprpvcqZy
	YSc4SYZwn6on6uvDDOrQQVtUJmyeMgaG3G01cUFtwCK6v0CVwGKuVgKje8+O7HrHFT1f+pv6oyM
	BFmcmw4XLoVFF8YmNGmCHAa+9c/eSP6men3Lt2pqh3In9KaehKjAznbdNBHqkpt27z29VxvbiOy
	3eowVqG4dRdUWEt7UbApLplpltG+AfLFDefHM+RLYbC2Lz0/p85Fh1x7NkMRS21+b3YYQkvBznY
	IZ9BaEdMiCRiVPxxn5IGEWg45wOLFy1wIMH
X-Received: by 2002:a05:7301:18a5:b0:35c:492b:e310 with SMTP id
 5a478bee46e88-3674866f609mr4050794eec.0.1792575458743; Wed, 21 Oct 2026
 02:37:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
In-Reply-To: <20261021033257.1359428-1-cmllamas@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 11:37:26 +0200
X-Gm-Features: AclHuK_gezHx8SH1bijhxHoa8Dbdh-lfkQe2cyS2NLO-bLn2HecxYdxDJWtCp4A
Message-ID: <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:33=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> v2: open-code the %p behavior in MaybeHashed: No "0x" prefix.

Thanks! I think we may want to have an easier way to do this non-`0x`
formatting later, centrally, even if not as the default (which I am
ambivalent about -- I didn't hear more opinions on your other patch).

Cheers,
Miguel

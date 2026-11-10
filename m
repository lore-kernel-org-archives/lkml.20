Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322061;
	b=qy9LNEo4QLWyVQwm8WYcnIFiJQ7ZXTVcN640Zn9Gx5jgJ3lXSeeRsfTkBBaJ+qVlFFFG
	 P+O+G93X/gqfVIOCLSqJurhBH9kHRQadL2iHhX/aMH82wjuesp7WxcwJ7b7x8D6S7lBlC
	 8qatVyMcCH6KJWTNyICh81P1XZNm3HQAI4m3rEZy/1P0medvdCtfApsv+AJpTr73m1Vbv
	 lvqXQQa/HRWO+1jjY3RDBNLKoBYkQrBSj4nKCoJaqSi67kPnQr1aPb8I6k2Ml6Sssibpt
	 L6+cWA6XLo3/kJ797WShoynKnBbvHjamM1+Hw27lSYHm/4b2mG7+MXV43roOybMqojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322061;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KyXEQvhhvbYBNTKWxtCEeL0C1VjaH+7m5+BuhzMfTsA=;
	b=XvLRtT+n5piY8hl9vgW8fADM5B0jdTIu31H2FeiByiXeeFb0zrZCbYQ18f3oeMX0MjBd
	 5CsjxWjx/4o0TUDmSqAvax0xKN01fKF/6M3r6gC+8Z+Ht1ekof8YSx1f3VMoLgeHcax88
	 JIBy9ngy3glQ2a0VsvtKDS415oMVcLxe42HKtcQWH/gY+6cq1wY41/VVp39akd6w/IORH
	 A1z1wZGeRJVYCzKQ36XPMpdnzKKaB1qqHfVD9dvvLDubsDR9WQP2ZjA2ieRs656waxrCv
	 bNq+RfDksAZmVkhNAYc3PbAJOYGIJB6M/O2ELD+LmGQTE0T9aSfCNginw81YD/oqRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyoJY1r4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B760A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyoJY1r4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863A71F00904
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322060;
	bh=KyXEQvhhvbYBNTKWxtCEeL0C1VjaH+7m5+BuhzMfTsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hyoJY1r44Hfo4INbPlsaEsvNsouafEabkAWIXoqxv6HldmSF9wgi92NBH9mO/NXqP
	 7ZS4K7tjFi+7pjONpCukTAKCDhaBwUkA8kiRvoF7yHAfX41EIIMigvkiei33wXssX4
	 uzQcPUOQQDArgOnHRU0t5I19+eV/gAVW69lHZO3tXsRtYJiHFAebh44T5BS4Vwb0XR
	 Q/NcabtsfRtTGr8c9BgE7i1Iq0aGQJao3PTPHEQQ1ApkndV6sueCbjGi1Zyuyh+FmF
	 9DhXQUflheQoiGd84kl7TIBUb+cNwy6/tFV7HQXfEIyMoYTdNqW1ZVyHtB/wECog78
	 Kv8e2HrnDUwbA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1695188a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNGXvWfA79s43L77i+QQ9FuHdbgz2UP9BoUbYNI97IxGYgFLJU5ex1gkoFk37pD7gS3qeGSeR6uyT3+SI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d0fX5t6jMpPTiqbDS9ViRvF/CYYBAS3JRRUrOV3iCvlIOw/co
	cCitkzK9/0XtLw44FUUE6FUO8B9v8EdvDvKgBGSyK6Z1ji1RG9p6jUpHxlU9+dsFFFiSifbW2gR
	BI2KA59kaXN0D7l5snz3kYm46aRbR7pQ=
X-Received: by 2002:aa7:d582:0:b0:6b4:16fb:b9ba with SMTP id
 4fb4d7f45d1cf-6b756b05b75mr1604589a12.36.1794322059147; Tue, 10 Nov 2026
 06:47:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
 <20261109194144.22814-1-mike.michalo@gmail.com> <20261109194144.22814-3-mike.michalo@gmail.com>
In-Reply-To: <20261109194144.22814-3-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 23:47:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9FgSFui-RLdywqyciBdxcU8_xZkfxap+qQK=evVqNYqA@mail.gmail.com>
X-Gm-Features: AclHuK88dHBDDOu7sgSeVl2Sdnz_lJKjB9tYyeuwVC2odqDlQh0fO1-02CBID9E
Message-ID: <CAKYAXd9FgSFui-RLdywqyciBdxcU8_xZkfxap+qQK=evVqNYqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: stfrench@microsoft.com, icb@fastmail.org, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, 
	lsahlber@redhat.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, __le16 signing_algorithm,
> +                        char *key, struct kvec *iov, int n_vec, char *sig)
>  {
>         struct aes_cmac_key cmac_key __cleanup(aes_cmac_zeroize_key);
>         struct aes_cmac_ctx cmac_ctx;
>         int i;
>
> +       if (signing_algorithm == SIGNING_ALG_HMAC_SHA256_LE) {
> +               u8 mac[SHA256_DIGEST_SIZE];
We can use SMB2_HMACSHA256_SIZE.

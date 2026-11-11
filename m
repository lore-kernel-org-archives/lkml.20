Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394269;
	b=lC+Tau3VewJZquAQqodzSxJzXs+p1gJnvJQQO6Tq0XQvKwNXmuOaSnbIHXR7e8PLK5Ol
	 MW/hnRDq16GXQRD2SKEbaYNXF1IN11ltylSzDoBEVNf+cFD9LFJKqh/ExA8us6EQNGJD5
	 fa4Oybg3vBZ86eZU7Ockk3JFgyh3sSzeVFRF+jfvBByQTwx3+hH+nWQZHgvi2nvrHIY09
	 teIe98BCOB30VORHCVgHC/Jj6sXtcXINM+KOuxdylnjfFxhXplJUJyeQ9eMJfgkPwQnrc
	 YdGlQu9QFivqxJ22jZOZyZ4XJTgqVzDGpJxO2iUJPyvMksyqgHvL6wCYMkAVpNc8IRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394269;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MX3Hkp1wUfwxWDno7iqBipE9mHVHuE55LijrPmevq/I=;
	b=A8xxZ8AAy/SHnMji1Rh19ODGBZmtQl0EqPNt9MWs+1QrbMgYimgv5lt2dT3rj62Jq180
	 1vTCeX/c75uORud5EAFDBHSZ+hfIKZ/h7uePFVXVrO2QOZywYWo1RL7olx/kVEPZAwXeZ
	 8yS5SzIIKwJR33ZbvEzDJCesZ4mk+sDAKwXtMfTgRr/EybCqVAFzmkmkL/IfLTIwciZ5u
	 2cqWc7RaM/fWCxZyW7+bBKdSUgT7WhcQ3Icc2SXXd8EQWhvQjg63NRyiKJUKAjelL+obX
	 +oKZw2mIf9o7wueUCbBoTzjSAUNaymI41IqKf7Z/vgDCQvLvas2/xFfI89Z4xGN8D5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gEHL7/3j";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7AA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEHL7/3j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C5A1F00A0E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794394268;
	bh=MX3Hkp1wUfwxWDno7iqBipE9mHVHuE55LijrPmevq/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gEHL7/3jsJHrIr/kuiOi8nM4klaiM1gPqBvszlPoD9yW/7ukyQ9ofkhbjAi9pE1Vo
	 iTEKB1je1ZdJuaImyUz6Nq6MWPQu7/NE5JsWpooJgKsB+X8I1Dh4Q/CU1Mu60COBf1
	 GiVMqLhr+F0ClX7/jtqvYaf/SzTjRQK47SFd5tCT4CBwTJUl53OttrpgbWVSqVpw1n
	 58IJByKQjlgH8MkP6CfzLzXip/uB3z0fb/d8kcuQ0/+DmREt/gF8ycrT+raip1dEkQ
	 LmBL1zoohc4DLkKD4eU/NDczRcqCWSI9qAaCKYCKGTRI7iCEUtjtvlD4iKraP8l5vu
	 giFqyAgiNFXgw==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c05273c38so3590014d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:51:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcrtyyM2De4IvuI0pArmiz4J3ScpqiNQtayPTf8RquOoi8bUbtcDmTG77QUPm7PIrmjEkQ8jf2w05nsxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LnWsLCFuX2uUjLYPgA22yHNfZ8F6gpCiOoooTWugz6265wQ6B
	asQecy1OXla141yKk0Hm9eZheH1lfO24crw9SOVgPjhA5nzBaTagEjd7FPx8ht/D31vxZjN4oKs
	uJTrSRe3KLyRHodae7LVBx0UThj6dKRQ=
X-Received: by 2002:a05:690e:128b:b0:67c:2350:fa6 with SMTP id
 956f58d0204a3-67c67efa815mr1683833d50.47.1794394268020; Wed, 11 Nov 2026
 02:51:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110165834.28162-1-mike.michalo@gmail.com> <C5746055-5C40-4335-9A30-5522244EBA55@gmail.com>
In-Reply-To: <C5746055-5C40-4335-9A30-5522244EBA55@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 11 Nov 2026 19:50:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_YaR4yb41mcDPGFeJ1WrNgg_qo1FvRmxdKhFWkKruP7A@mail.gmail.com>
X-Gm-Features: AclHuK_s15BoL_VEpW6nuKVks3HpOM-HKSslMABijrChTqLmnhySRjzGxEr_HWw
Message-ID: <CAKYAXd_YaR4yb41mcDPGFeJ1WrNgg_qo1FvRmxdKhFWkKruP7A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] ksmbd: verify session setup requests before
 signing with their key
To: mixalhs <mike.michalo@gmail.com>
Cc: stfrench@microsoft.com, icb@fastmail.org, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, 
	lsahlber@redhat.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:17=E2=80=AFAM mixalhs <mike.michalo@gmail.com> wr=
ote:
>
> Sashiko=E2=80=99s review has already pointed out some real bugs that will=
 require a V5
>
> I will fix them and send it, will spend extra time verifying everything b=
ut if there
> Is any feedback for this version I would appreciate it.
Okay:) Thanks!

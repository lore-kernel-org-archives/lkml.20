Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320929;
	b=0jj+lX4p9mjmJSlkihYN+WWPEWP5aTEoj6Q3Zuo4onwWLGHRJFWxVx3WIBRdDoJ9uDEx
	 iICiXznl4AS8ApIvFRDQRtFYk9we1ap7w3R3OrbWiyyGWdPLDGoEoBHWUooiIsNO1O/Sc
	 Grey6qGLXInyLQIWrdejrU58v4ohhtIDBGa6SVx8NaodCDKuTM1fR4zv0tXq3F8DQrR6v
	 rO321KO3rFv+y0lpu6zhbHbKIf9jfp7Vti462Q2I4rj+L0K6pmi4C6wWeXSEtmHX3AqLL
	 yuy2mdMwXawC6f7qr6srryri15ha5htP7dQrXg8Y2bkb4QIyaSK34ZmGUcGtg2+li6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320929;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hTplsrgAQ9xqtxIf9pTXzacL7isLuWlgFx6IOikQwU0=;
	b=nB7AZAawt4ENMkpJ8DzC3Dvzj9Swo6iKDevOEyJ5dv4AnEdwfzX4kUIdZpnyBD9Zk0pk
	 dphiI727tglWxWsBSwo22Si3J3msAGM602oaA91pbbk1dPSJXpU+sRjKiooJCicXu2quy
	 j1d9FYelLnusCk8vxf1WcUj2JiiLwfmpAFpVxgZUzvsYvWnbBT7zWhDyx34q5jCqHYPp7
	 vCIqnwCt7Zj8kk7ZJxVtvfOoA2dA6QTRfHF0KJ8EshisGreYqoAWU3zy1P15+LHRGdem0
	 zbptJ44KJNBOG/pNgTK+dtDFDyRKHo5tnUFzfRgz07Xbj+qT9+bmunBzAFXxgVQ2xcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=feMvmicr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=feMvmicr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3041F008BC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320928;
	bh=hTplsrgAQ9xqtxIf9pTXzacL7isLuWlgFx6IOikQwU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=feMvmicr7zLGaL1Pc6AjRarPmItbQ/xVekZhQ/wehNoRzBuhRf6uzH/w0dfgvUxjS
	 8q3xneSal1QDc7X8ki+9MW6/lHBwxCJXACiGJFvc/ZYM00B99kvu9adBarDLlnhjI/
	 fOIpOJXUHxAYR5fPR869O8/V6CgO4wvvSi1PQtKhqFhnhK071ZZuJeAS6Oa8RbnY5h
	 S7JjvkzPGXKpwSnJ6HS6bh1P/MT9Qd2ihfegHMSHe/BK1kKukgSS+HdjUrVLTx+Ugv
	 stOa/pfBs5mse+tjz1rbCJo1Fi/Asv7XCoLX5/m2EQruvyvpkPIBII4CwCWl9M+yaC
	 /7dtTe6ytWVCw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67921b515a7so2253791d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:28:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFg3b2Kh7Bm1lhXA9B3VWUuYdYjG0x7cnZhx5az7TIBc0wz23MZWR0F5hNfUJnpPagmZSQF4yIavtlyz04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kuYNSqcoE73w0MUrP9/yJA7GqUzi5SuPNoS+v+AV3JyDD0rVM
	lajeWsi2JnnrGzj3n4SvxbomM59p6morivUr3ZNaKk9L/tdZIQTDa8G1+NA7wam8MTiSEVPJ1Cb
	dFzRqr9QJdoInYpEBzAZrPgvyM3htUXE=
X-Received: by 2002:a05:690e:134f:b0:67b:fbde:ba7a with SMTP id
 956f58d0204a3-67c568bcbd7mr1639184d50.85.1794320928054; Tue, 10 Nov 2026
 06:28:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109195813.24238-1-mike.michalo@gmail.com>
In-Reply-To: <20261109195813.24238-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 23:28:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-YAkeXs8K_EJyWFqOSFJ8XHWSt4A4D6BtD2uqVp6Bnug@mail.gmail.com>
X-Gm-Features: AclHuK9sFG4Af_a2IuBl1KesEPg4xBLh7HHkfluv2QH0-NYqb7AYPRPkVA2LPBM
Message-ID: <CAKYAXd-YAkeXs8K_EJyWFqOSFJ8XHWSt4A4D6BtD2uqVp6Bnug@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: refuse reauthentication of an expired session as
 another user
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: stfrench@microsoft.com, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:58=E2=80=AFAM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> When a Kerberos session expires, its owner can reauthenticate it. For an
> NTLM reauthentication, ntlm_authenticate() only compares the new user wit=
h
> sess->user when the session is still valid. An expired session is in
> SMB2_SESSION_IN_PROGRESS during the reauthentication, so it takes the
> other branch and simply sets sess->user to the new user:
>
> - the session's open files, tree connects and other state, created under
>   the original user's identity, now belong to whichever user just
>   authenticated, and a later Kerberos reauthentication is compared
>   against that user rather than the original one;
> - the original struct ksmbd_user is overwritten without being freed.
>
> krb5_authenticate() already refuses a different user in this case, and
> the valid-session branch of ntlm_authenticate() does too. Do the same for
> an expired session: compare with the existing user and refuse a different
> one with -EKEYREJECTED, freeing the newly looked-up user either way.
>
> An AI assistant was used to find and fix this and as an independent
> reviewer.
>
> Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets ex=
pire")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!

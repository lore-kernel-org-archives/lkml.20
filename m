Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792717266;
	b=Yy+4IzucC1ruqWpc1RFJ0Z513x5uAEwfakTyyai1Nnj3JM50gKBHXEcksw31ymnYnrm2
	 PTMEuibEZ7a7ZcoQ9hWtwITl762BOORSyFj6SIzgW5yU6hUPTs/yU7HAA5QCjeO1RLmkX
	 Wh5i8BY1Z/SaF4uuw3Hz6rd9YnNKCCzuMSVopcInN6EKBgAa8y93BRTF7HU+JphjZGGrN
	 9nbJxE7Ime75bpWRCHrBDRIZvXshxhIjl/FCa6if4g3vcza7laeCdkZMfjN0egeH3ajNp
	 LnzU6hjAibDqACXDM3gABFbVIJGDISQNFS4kSzQaiEb1r3A52YmjXH1L6gh8OyzZNkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DkhJgpFgb1NzTq+8EZOytBhrmFtUa8WLKSMncnmwEDk=;
	b=hMBXGVOYyOB6XcgRIaDvhdQhAS4SXN1YY5LiRKmEFyG7pmtlbThQnAJAdYmWhn+bvSY2
	 +LOD10WA8Y3K/UaBOPirlERPet9cBdi9PYAROBwnVglKQR6F6tU92dqJQmgiVuCvSApYN
	 c2c1QkPLoBxrh8qI+HDOWANINL6jFTeIrLkpW74kSTsNhTypC5QyD14WfZyI2ghiM521X
	 MI2kif9/zvVov6V7WaB5nM8EYCVEF6k0Kp0wa5BmFacuHK+6E3esi/p/vdDKMZl+AdxwO
	 7aR6fc6ZXo9kQVfUBf5phCOTfz1bbJrbnvkCFVlqGsspdg/dYJLHK3V+PMh2L3+mw0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft4RoOcD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B02606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B02606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft4RoOcD
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso457567a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792717265; cv=none;
        d=google.com; s=arc-20260327;
        b=dU/rfyTJZ4xoZX/PEabkePNjN/23lxV7fRBgvzmB4tMZPvVCKjkIzD/V4IWWJJWo0y
         K9+YKnQQzqjb9Fihw549NsY+mcH/h3150TEHlBtdZPtxl28oTEE3NCB4gYFd0KMPnVA3
         hFXbSCYx6D9ZWzkmE7xxRTnmC8eEQEUpP74Aaw+cxbTI8F/cikIYXxAK3AI3IkBUHTUv
         JNntpi54okCXpCtb7W0t3jccXXDwY6EuAhcgVaJ7tLS0ymvHqwuAZulALK5fMnjo1hLT
         0qCG+u0MzxCoFfGeIUzd3Teaz+sP2N890Tn3Sv0o7/04grgBGqRYN6lMHtT08vzle1fR
         oN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DkhJgpFgb1NzTq+8EZOytBhrmFtUa8WLKSMncnmwEDk=;
        fh=x1dxT2HeRvH++CZZntORftQ7Y6chFatsDM3e42v/KV0=;
        b=kOch1m5XKqkv5fGLEQyeQIRFto9VxNYnjaIWNq7JhEaoV30JyJKMeWONs0WH5tlmCl
         +u/L3fda1siOhp26Ilqe5fhXkL+R3jzg6mi15hnG6hgjE7TkCPqrDsfhgDolVd8UPzch
         QUVPzQk7XNTQEh/3MyCvNWK3CCqMVtsUXdQ86kFvA9i7ik+nPMDOWrmQZmbuFQg3dBWf
         8GSufi9svDOGHT+4JTgZ9L7RAEw+FYJc1GzVlmiKwrctzEGpLIBI8yVIaz7UWvx2hKmt
         04NTONj6uEfbAb1BWsu1EwSQ1JVgo9YB8xkgmTmXcu4Pem0Ijyek82BPNNC6AFKJ1rD7
         RG1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792717265; x=1793322065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DkhJgpFgb1NzTq+8EZOytBhrmFtUa8WLKSMncnmwEDk=;
        b=Ft4RoOcDa25bt7XAZAzTDAU5mkaoltdYe7I1VRitTmY8itcC1NHr4YqKKfX/eO7ti1
         rAHdC5UU30pXDC7/Uv9+9LGW8N4Aey8s4MSGwCTfzdpzO4APTwQmx2YnWdEYubrCjBtv
         WNCkhVdhR7e1mgwx0ijQ15T+uy3AD/0PWBNkrF7BVx0NQr+FwFzcQkIr2TR/PTP9PncI
         gAprkgIf+cTgnC18fFeuxCxd6btoImRv8yidGFWkYWB8N46DKRbFJoRTreCy3quYSxXb
         JyGqIt9b52QMz/p/5nQ3//tglA9CaKjq2jlX4qWx4vwWzE13gWFzAODtdVMYLHVJn0He
         /NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792717265; x=1793322065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkhJgpFgb1NzTq+8EZOytBhrmFtUa8WLKSMncnmwEDk=;
        b=CsfidcnuY8SJEMiTC3Jdt027kVb0MXzDH90jmaryDdBiWd2xgsKG8vQodx28qVLyZ4
         A3wqBNnvPeyDF0kklnYppff97F5p/dQrW+gSsRR9BKgKB85iKbihBxaBSfP81ubNmpI5
         l5MiGL5Men4gp/hKhdXAQFluupASBBQ85zXrKHsRern852k+PjV+V9fb0gpJdQraP2Js
         1e9ZKsCc23Mll4Izd2Cz1l9LU6sRlr8sRXj5fk6Y0MLGzCsJc+QoGh+IgLj2Y0tw2V50
         DYCRZIJ5XMEyKibD7wcZXxxbEXA/kCCWIiSp5Y7koY9KR7sn9cTlierIon1fWlH4hyQo
         v6FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz+achCk5voLeskw1fQxNp9t/MuKSjvSergNbDJXLa6bi4SPzpscKbZMyn3bziucm/weoR+jVtgXtWhdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrSEvksAP6LHtXjxDJ3U+IpXBWot72MlJfDKxtdSEoAoh4LrMI
	BIm5pb3DNYvsuuJfpcrHhfEzvUpqqnboVjLjVpZHTtIZCnlhTiQtFue7TWaNX71113LeNYGNxqx
	4eAmX6F+m/XzaI4yoAnTaF8gWCHn/7Mo=
X-Gm-Gg: AYBFou1wzb5TOuS8EJrEP7CXscZQHfoSn89ziPqY8n7lESs0wE02WoK/DzB0Wd1X6Ng
	9nFFpFNJsXKaeM+hOVaf3Ms46r04riuLMRtio9y9GmXUXnJ0OfqkVlrfcNUVk9i+ZG2R2F/Urb+
	NR7dnAWfQktsoGp6mNxgYANX/QlgV9VcbwZAo0Ig1QkDSyJijJJd6S/P7gWOS8BPkj5930Q2bZe
	QfTVMe8LqCEPWTVQa9JszQWIBrsj0D6AerfGCtsMg7TNOKcT9WayB/obVdBiNFf/WN8XgS+X4Sr
	O+ratO8ut8BL9cVbJND8pc3Mpc/7Q6sW+cmQKJjE7Y5d6sOv90keP8R9Qpe38RkC+VS/EdWQ/OL
	94cDsDPUYkeBA5ZYcQr3T1hMiLK7bRUZ7V0c/QnHZhQMOPMpY0YTK8kJ0XhHFRR7l1Vn6qIEDAl
	IsGlv0db1aN6sXeHBqdUcyiAFF381fkarh4cTh2rLe8+wmPgQIoixSPzN9usxmmSYCLin5Wfgn0
	UQc7gnO2lg5hdL5WkwmFyvBZndnxJZHSXmJyITPh14V8BSGJ0hYSPbjWZ7AhwPIolsaV7o=
X-Received: by 2002:a05:6402:c517:10b0:6b1:d822:7c72 with SMTP id
 4fb4d7f45d1cf-6b432bd331emr1054781a12.24.1792717264670; Thu, 22 Oct 2026
 18:01:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023005313.3946390-1-rosenp@gmail.com> <179271707120.3327.4775409276963055481@kernel.org>
In-Reply-To: <179271707120.3327.4775409276963055481@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 22 Oct 2026 18:00:53 -0700
X-Gm-Features: AclHuK8fvNbAYREOq0l26jknYmFGL_ykkYwN0WqP0BewsTW1yxD6nfVtrvGAJJ8
Message-ID: <CAKxU2N-_Th-ksPst_1KR3W1nYWoZpWR2Sjfo=RWroot5A1RR8w@mail.gmail.com>
Subject: Re: [PATCH net] net: bgmac: fix oversized RX frame check
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:57=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
I added Suggested-by in the commit. LLM only used for the description.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D16455616
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798933; cv=pass; b=cgpwYWazJ9k3DbKdw884KCWqBwk3CDUz6sCrRv9Xu9P3cOGmVvJ8I4QwXrI8l4xoc5lNMp95liyPz+qN5GwJeQv+fx6Z2Z79XS5kQz6PpeAPx5qMP845i8Zl4KlBYE/KhGGDKYv/Ydh6mDv+Gtb0nSV8x7VCZFjjneZT+Gr5KIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798933; c=relaxed/simple;
	bh=bhtUeTWaWQoRsIUq3/0NhMF4yFZyZl+XUqrKwbDuapg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak6pUMprxut5kWXokl+BXMxEWJFX6QE3IEeKL/RVsnhCc6/Be33PDkpnKxg090yhMhiVKgpqJN+iAt6myh82imxmfD4on/Ux5EwyPtOP497hX3qgKStxc4keTtDsRi3de7GUMAwssiarYQcu0JQRt7rsVRgsbgQGw44MOdeQqaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvK3Kal7; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvK3Kal7"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c2c368cb3bso2871723b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790798930; cv=none;
        d=google.com; s=arc-20260327;
        b=nbz26zAEI08+Yq354Fi9RUom3mt3n0K4sPgiowYDLxSCl5bXbiUnI4zDP3safB9rOh
         LlqSuqkMSPvWm8LfqjMV3nytJacYq2SU9PLPr4ZevIZvbg+U2BuD3WEupCrZtzHV3FNu
         xoekIvbvyF5o5AQ3kJZXwQZCWc+LNVKxr3ud+StscFRuuibAnPqTqSh+R8X0tu624R3P
         QgMYEk1D006NT4FwYmm1GFvXgS2P1GNoK9hhmYSQyMB75r6HmpciR4cNrASwXOx6BEUN
         c6yGGTWzPHoYmz8toQX970AQYQ7obYOcL50IYNeQ3bZBl3ESgXSY9TB0qPv3awhhmMpm
         XM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Ik9zrwtFn6RF0L/JldoutXppR184+mdsZlk8WWANp0=;
        fh=biNG2ft0SFtvhLB0nQYIM/Ibv1nuq94hgwSZEcvvaF0=;
        b=MsaV1lmntOJSow5pjbhsN1qjWt13FWFARz2mF6tVk3RzPpq/6On4A5yFJmakhjzaO1
         kz+evWC+aQp8RcmUhfBma7XGTZUKo+HhQLcRJBNWKsNfF1sWQjhDGWnz0XuuDzmpHJkL
         lCm70FPKpJ2+YCLi0/boQubeOlXZqj2hATME0XRMgEDcyvTHHW9yDwmKlPbm8/MwtodO
         p/IFusKeJRDN+5i5vdlH4B/E3PaFS+lLNUmBHd54YTn7eHagw/9KUs+JJRKIQORBUsPz
         DxghLGwo5chnrAPw5BUdR1hnybbuzZrsht4KeKO0+g4lD+AEV+BYb5mJKT2f5PRbu+pM
         XV6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790798930; x=1791403730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Ik9zrwtFn6RF0L/JldoutXppR184+mdsZlk8WWANp0=;
        b=IvK3Kal7LHelIO9CBzwz5UGRF9lFfu5vsZjHENk4M6NNC725xN8yp3+15VlEA4HO4B
         udkd4FvA7EC5ixbZPsfW4UR2sjQpuLtGWSV5kSNvMbrRkVEY1vmnDXrwDR9mB4UtMvCs
         Rj/VlLb7Gah6jEKfS1eg+I6Oz4/T9A7vYxBZYqgdO9RL8lCsYtFZpNgiz4I+hP3Mlrfd
         lPcBGjnQ8PyDLcMl+odSytmi5qHfW4nlirA/VBwB96wHC8ue6vxlUf+uyOmT39EBfV0e
         eg0jEhTCRUMXDBtWxmbAj4O2jyUkrvixJnmG+DvT68OUEGqYwLrD/7uV3uu+NPBrYc9n
         nHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798930; x=1791403730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ik9zrwtFn6RF0L/JldoutXppR184+mdsZlk8WWANp0=;
        b=F6rPsVgV7NERlycmIdcyakKcKTVkkHA/ainno84T/67F5ZnzWZ/B0huHiBRWobxC8u
         8G1Iek9ycGn92Z3cSYV5NlmnSdu9hlzA6LYr5zTVGsISNvL4ys3sHUtxFazPZOCPZ5JP
         6ZH4p6J+dSqqEHCDs6NNz6vFkidBoE+T/a09JBHZjK9JdS+1jnHZp2SNllXJXWI/etil
         7NiJRuXZT9cML+pJMtLQjjfPD7N4BwN24r/osF0zcZlMMENrNV+jtWqjjRyDBgM61hB3
         1tGxIQNif4bdvDXXJLbHu4Nuv0KCxWjqb9UVH+g6fUKB5mPBtCbh04qJvPzcgEsQrZmf
         OuTA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ItAs73lHjJgmknZxkPyS1i+u86pltvYR+1rRcKHgUsh0M1xgwGK/CYUZ9JgWJdj2o4Lrpf4OdaKrwt0=@vger.kernel.org
X-Gm-Message-State: AFuF++ls/UzHHm+uH90jtgvIq1OagrprG0P+txF4ksrbfsxTPtQE3f4o
	bcYNXv223n1bB8A5ulI2oxQNEtqseICLEXXli2bJ9WUN9vlrWxD2jQ+6mTuNfWrvHypAOpo0o05
	uyfWQ+QJpvbMbTB7aSmkdPprkYO8ZTMk=
X-Gm-Gg: AYBFou35NuPgpMOn5Uo/Z2JItXdiVf3e2sSccbgwuW6xvwfkjX8wsBV8UVJzGmoYe+G
	SflxMP8Ljg1kJL3WZwZlgr2IvavdFKFEomZq4/9hw2M7oCR0RvMqK2BuAn8ntKXo5zzeoF2WUBL
	s2ywcbSImiJXvBXi3T3lremsKE123iTafcbw8yor3dkjx50sCX1jSUwiXT3ZE+hTgAxg7zO2qb5
	BxbDxzunE/6B+G3QGtIqvI1H36YfqtsVE6ytI235TKvoLzt2FRmwGxv+XDRo7CR18oNakH7CSfl
	hUKgrL5KAFnndb1yQvi2UqxsIJJ82uDWMNZBuleB6g2TNm9d2as/EE6pIBCp2o1JOu7hBEl4RHC
	7SF/XnZhK3/x5xkVbBWVd/mVKhGX1fNQVL9Fql1i3dmPze9i40uNcjITg
X-Received: by 2002:a05:6808:3a17:b0:4e8:3e98:6f61 with SMTP id
 5614622812f47-4f1b14e6776mr3417147b6e.3.1790798930119; Wed, 30 Sep 2026
 13:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930141151.3973221-1-mmyangfl@gmail.com> <179077766581.31693.7541948300673794721@kernel.org>
In-Reply-To: <179077766581.31693.7541948300673794721@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 1 Oct 2026 04:08:13 +0800
X-Gm-Features: AclHuK-snbmRVDYyPlolIVrtHLv51eNL6dnYZYFPumbUT0rmQ_IO9EolJhzK71A
Message-ID: <CAAXyoMPUhoDNk_CFLXn6oV853Y1wwaJhyigEH9TmaKGnARN-6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Fix register rollback in
 LED setup
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:14=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This is a catchup patch of previous misapplied old series version.

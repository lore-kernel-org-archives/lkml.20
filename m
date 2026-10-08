Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D258371071
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791435972; cv=pass; b=h2D4ByPaAnW0+ZByyCblSs9oXzCo27vAwJo8Q2JxczLukHz30YBy1FaXv4BdVt/KDen+dcUpI75ilDrNqJ6tPim60anFLdNKr3ePMcMRinWWgpr19weIO7r+aYZrgd6aUgidHw83zBokeXfyCUL3ZjEvTCW7zqh6Exiu0Yx8oHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791435972; c=relaxed/simple;
	bh=DhPFUP+norEZwv0KY7wpIyhM3OFW00KpZAcEkkSv3Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJdoiQAgbAH2A+JNBIQKqdtIAY9adZS1xBd9HLQvG/I5KileHz+LjntxPR4LRICpNWho8pt77IrPWHIjmUV5F8X4SLQhTi8fHe+JNhmehYp9Q2omyQz8X5H3o//lNfE09TLB1FJTz48KVBcnDvP5JffvtF/mv420dv5PY1wb4Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j2fWoIcZ; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j2fWoIcZ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so3006069c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791435969; cv=none;
        d=google.com; s=arc-20260327;
        b=gE0/bVCszfb9NWBBLmmh0cfODg41onRtrSZ53EN2ZV54BBtxL37TPoL4ScJl0ss//q
         8n/wg/099Y0J2OtXXtUDE3wJMB3J2YU3+U9O7SbfdmNfRrf1587LX8W0eEHrZrMVGF4Y
         FFJtkhNREJm5WHPZm4H2gX9UHsbLvgK+TFchc+dncYkJTf+a0nzYIDPsZVYNHkrcn5nU
         cwNW2pXm9ZYiuPHJRYuTCm2+FGpyON+ttpIe0gD5ChdZJKt7vTxFwcBgBUJ5iB7Fp2DX
         A0JerB+5Ty5Cc5DbiYuxapdr5hlpapQaJJg2cCzJIHwamEEQkhGwNOs/zcjVZjA7UQaC
         UgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhPFUP+norEZwv0KY7wpIyhM3OFW00KpZAcEkkSv3Ro=;
        fh=KjFKW8+DR65xBSgrWtsz746reCQk7SE5ts8X5BVJHAY=;
        b=j5Ecyc0gAMCUSMYPErtrt5LTvKcgAS7Y0OKIHdsFpjponQWdmDjBUC/DFRkUo5IMdf
         WGcCRKUMvVaomJE7CrJRRFEwlCv2jlZGDtHiPOB677EezD8yezzRji2ULqiVUfwQLRa4
         FicOiZyAWGkRqV1UyL1qWhoncvsWQeiH/PAUdfvZKlIGWz/rsgwe9RkJSlZ/KdjFqdcS
         pT9S6xYkQIEV8uBZtbL8VwbxZ09IPRumQXi8vMbfb6ltmX/mK4UQv7PDHNYqraN+Kp40
         /O1skItGfD89e/JNDgLISzHLvDEAkpsqy2j+5ZliuTHfY6m6eDK77q7TICcmI1hEd9Ac
         sZuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791435969; x=1792040769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhPFUP+norEZwv0KY7wpIyhM3OFW00KpZAcEkkSv3Ro=;
        b=j2fWoIcZS/tDBrGxb0MRjhLY0LdvvVptsmSDXaXMwBeCzA5hDXnCAaYF/lm6r9+xuY
         DTHA0LJChgow5DQ9Lemfb1vFhXjc4Q5v+n7/pyXlbRJe4XPffgvtkfE+vX/ryzh/Gem+
         3h6YAgR4QSyr6aelvtGrmdcWAhCzrSCD8HsboXZ7A0bKSAC0UMOHxsVO12fLYUs5p2lm
         Lds9w1I3labq7J/wU29kPvvOfEk0PiINsOhAl4RpNAjf3FRBnZwsjD3wxLgHIKe/KI0v
         sP0lY3tZ+WZ3t+F18SrZ055ABY+NUHiXIhn4dsVsP5hf+fYYbje6CBbDBIxjfk0M+FIx
         Dt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435969; x=1792040769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhPFUP+norEZwv0KY7wpIyhM3OFW00KpZAcEkkSv3Ro=;
        b=g92N0pfoyhsnrW9G0oUeCPcCgofcyEw+fF4xAjUFm+wAVlTlwdHHShElc+fAmfmnO3
         dtkUAnivQ0h9kpk9CU1qtVNlJEHVjZyXt8GRTKZuWX2fPbbS/WP2SYxnTEuq8libSkMB
         Lo5p8GCEDoIqByPlFhC+swqtuCocJtifTGLs4gY+b8LnpybcanbN8imC41jWgalBEOwh
         ulZZM4PeFUZW+JzWny2sm2nUzshMLcHezNgi/re/yN5NpfNc4nPztxioJ9kJS1vXrQWe
         mVqhCdm8l67eIBCHMxW0jWPXfcoB/PzIEEawXyFGmak5JbmdLL8EjaLv409Tu/5B7fY/
         GunQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiilzBtxW07EMDLzkkUXKW5lEt6PcGtf5PrKikH5mvURgzS1mpoM6kET45cKmq9E9R7jTZb4qRJnpCG88=@vger.kernel.org
X-Gm-Message-State: AFuF++lh7W2vHJCPyCF/pZu/boQpmCpPCiesnzxzdVQM9nlGVrCm5d/U
	IGNXfc4duKDAwJod2Q4AV1GHGAOG3/qyJ37jvSuoqptFbqr2MynTytJWWXIlqtcn4mTqD3/2XYr
	hbE8tdigjWstcxxeNUX0ulFI6hjzKCezhu4vAEo2m
X-Gm-Gg: AYBFou3W0/23BTyokz/Wqf/1G2F7CLqL5TPVVUPc7G+CMd+3xlsDcwab8IHotWMsyxA
	bnoNZCvsMjj2fZ6Jkij4Nel/vhXDtKOIJS5udk27eq9jfpKJ4UaLOWuC8GXroWD0Fdn+PGfPLmZ
	TcFnZ17WjkUzXD199hpKsO3KDhr8a/7F8KkzGl9Gpv05BCtFlO/W6ZTePxF6i/xSB78jhJnf+D6
	BP/mdx8e6uFAM63NORa9ain60fcxKJHlfaVXox4wPXb5tcriqQabffGdH6Cqas1/Xc7Q4K/ecjV
	RIJGgIj12d1+84Uii1xP6xKKlXRT5gZY/zAISt2TEam731TvFnFgRondqhmJUxesvkNRgzObqKo
	xLB1QD+7e3awR5sN+WOGn2CChOnP5+mfZl0HiuGOLc8koWO0Mu3G3azN4PIqHMSR11VCYGMkrVd
	LGc0K9Rg0TcSc0VUW+uVAL8/9/
X-Received: by 2002:a05:7022:7e8d:b0:145:287:ce91 with SMTP id
 a92af1059eb24-162059dc702mr5384569c88.14.1791435968320; Wed, 07 Oct 2026
 22:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com> <20261005-work-unix-passpidfd-v4-8-350183b6e02a@amutable.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-8-350183b6e02a@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 22:05:56 -0700
X-Gm-Features: AclHuK-LcxOkOXzytf3Rr7yhTplfpto8Gsq6TYrBSnMDE5_TeVNBitGO6FALDu0
Message-ID: <CAAVpQUCGbFYwbJ9GjTTFr79Z5-NqQ8_V=_hE=iRRSGf4Vr5w3Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] selftests/net: SO_PEERPIDFD_THREAD
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:10=E2=80=AFAM Andrew Halaney <andrew@amutable.com>=
 wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Add tests for SO_PEERPIDFD_THREAD.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

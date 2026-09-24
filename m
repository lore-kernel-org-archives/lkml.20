Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A674A0906
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262953; cv=pass; b=sQwmgUIxHHNmdEBHlQng2w/yemkAP/nTkMP3DMz2MZPu71wPYzarAMOWL+TV7tJsTUs00QiPQ9Ym0M9hNg1xDl8kOuxYXQuD5cYxef1aX5w1RD/Fdo4LYgGzpaDrmGEuNefJSraqpEj+Qaa0fhWeCUsvisZEZ4otywHCD77Rl0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262953; c=relaxed/simple;
	bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4Kei7h8wZHcQIkL9kpSKpzt1ErSCcuhMpcpf2drkreErL4S6QecS0BQSJIQM+9aMeaqRbbsWutQ5uWxyhMvEAxUQx8jMel6LE0nsmfXL3Mk1bHD+Dyvn9vJtkY2n4V9AGuHXFm7Ec+WlnlTFiurwih7R1RnoYYykQH/ZO6+Buw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PlvLe37Z; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PlvLe37Z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so11771a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262949; cv=none;
        d=google.com; s=arc-20260327;
        b=DDk2CtqAQPEkdI7qB9nZVR4HYMMDOMJT6cdbB7qhrx8JOM3AH44IjJOyH+/e4XPaKi
         W2fu/YA3csJUxgsDXeztLJaiC/37SNgqVV9jtIS1sY9t/c9ZedgCowiby4wtlrYp1nBK
         3XF12LS0HOBFgomDm3ZJ0BWih4Ep1JsLfoDbTtK+ZYsSSHud8p92yYxjizjPBVRIkL1U
         M+xh3e54XTQZglmwFKgSZjgAF5uw1IU+xI7JSTixM0aV7SVb0shprVTlSpZnFrl61M2e
         q/SomxYiOw1Qsv961sAVbbOHUHYssAJhT6Gac0q2FnjaWX3fPpmhsH0Yc0Jdmrt9iMmX
         cF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        fh=U39FxuubNEFXMsW96eqgN2nTXYsoFjolIndhgqjgf9k=;
        b=VUZAxORr6ZVXhS48VJXEBTRfDe0G0PlZoYOk9ArXcqisEXyb/pf2Jl+2RvVFXNKKij
         ThJbaDSke/EOecT5GvcdO0WZ88fvWT4XP1vS014LVdfmZj/foRniZuCl31PPpvpIjcRs
         ybF152qWycUiift8eVyqkVoPhR2tCBJ2E7FiSZ9SToo8ytVyzsmdJXLQiJmp6hPClPlI
         lZhG47KRquVjOKquyAHrWbFKac4Bdjnxcnj2BW5lsBkII7CP8pql4wd7BbXdDkKjjLPb
         QCPqZ/FSwLXGvY1tS2eddMjU0QI7+EJB5t/U6oUflk+L5gzYsLR+y95cWfdOIgRVDgzF
         bGlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262949; x=1790867749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        b=PlvLe37ZJmj7FZABwp/4xMFVlPs7W5a/XCFT2Q3ViZwnJ7mV6NhWJw25KhbfSEafe1
         NqK/Kxfw1nUuLhrhCXkhov6Ek0cm7nsAcrfc34blyv78IkmgEgWjl2fm+AKviwoZ3S6T
         eiWZ6FXvtYCa/8yELRdeHPn7cdPiw8nptTsZKT5P2LdawvoQZBRvUYA10MP4cJeXIVcl
         lIjOCQKN+9GCvxWeoSnD/MYUguRqfr2IVIpLt0yfp5Ok8s/NHwt7sPgWUxNtt9G/VH+s
         EU8dPy/l7wnWdR5nyRThT5UYOV0/xkNISOQ1qpp+PXBauwT4CjwiU6wYxRlIZfk5zBtr
         2urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262949; x=1790867749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        b=cobtax/tgQ3BEJxn3RXNmdr3r/k2lQQtZILJU7i2SdrWZ7Su05KUSYoh6mVH4CAr1x
         Mc20Gx+ya0DA3NFFC1dMVS19YpJQmZR5n6VMbEeoo4s1u0cDzdfVPMq6K3GBYM6n5PqO
         mix6D/9gKgMLiKkIZzXUISyhzbAKAI3RziVRdLrW/KN+1eekGkmuElrCqFN166GUeuVt
         J0RNgKtxwMiFL53a++Rlp1/ITRtQ8Cos7E7tUFTqNn61Jl5wX0LattrSmeR7afoM7yMI
         PKU4oWFV3gXfrvEw3+XwP1yWAgTcT1u8s5nhu38Dy0qx2JruI1l8/fMJ0Ct+utUBgK74
         ZU4g==
X-Forwarded-Encrypted: i=1; AKwUvByWabC+uD9xioH1GZcMQTcty/s1V5kEzSb0Z+Vj/ewsexFSDcq9Tvn/ehB53ztKaXm+DQpU2+fIroxC4+U=@vger.kernel.org
X-Gm-Message-State: AFuF++kwN1/l5MLBYNOC265Ib7thc28dEzYeMsjNDkkI7qBtEpJIfLL6
	+DpBUeqaXEsbwj85MGXK4lXSKKomq+N28ja8EEkWV8sIK/TWqY1zSebjH2sgkC6X/yKDt1UsS8/
	WFFGTt0d8zybbMeaUMAlDX7sSPh6wFZno7chC1xT6YNuiJJ63RHOs4MHRfLw=
X-Gm-Gg: AYBFou0D2RzThjfEUVXgIQYtxqKaam64k7YAE0qslvkLbsp6QV20ZQwBbfjuS4NAcdY
	wvbYE8H9V/fbfSbiHaDkBpXOrTLPUobqNshpqKWYbqln2E8YjPrgnHfRvtJ4DY565x/Q7xelicT
	UoG4c/YwEFhpn5yvYa/dnJ0i6dwebnlaJ4lDlMD33DsfU6Tmww5d/Leaal3CnzjV7nMEKPk1Msn
	2C6XJCi1JojRE+hxc+3QwqQ6VPynXmTTBw9fCPmaczGyM91gYV5sV/hGphudEzw2l8I5lJfxpF/
	SqT9+d2/0kGKzbQjtCd+fLnZaVh9qXptS9tDtTySJ2alSwprVGVMLdzvqQmHZvpe2LqvCcYMSks
	HnhloHA==
X-Received: by 2002:a05:6402:12:b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6aac7cd8cd0mr57363a12.12.1790262948354; Thu, 24 Sep 2026
 08:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-3-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 08:15:36 -0700
X-Gm-Features: AclHuK9mQ7wBmLYlao53PoD9EwGQUdhafzCv_xaq_MELOi3IUAiIHmHh_W2Qu6M
Message-ID: <CAHS8izMA5p0EsAv7zDZPabwLWtSGeELjS=r1wHUu+2YPsjQ-+w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: devmem: use memory provider helpers for net_iovs
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Use public memory-provider helpers for DMA address storage and page-pool
> association instead of open-coding page_pool state and accounting.
>
> Zero the net_iov array because net_mp_niov_set_page_pool() ORs
> PP_SIGNATURE into pp_magic. Reject DMA addresses that cannot be
> represented in net_iov metadata.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

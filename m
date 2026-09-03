Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C04E3ED4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450351; cv=pass; b=RwarHHfOJulC9jG8d40XZAW/h2SB+gl2AzX6NNyhBfJD+zhHWMbFQpWIf7p9oPpShkyOYtGAjpGDg0nzpER+vH/+Y0SNZiVf/PgYdTnu7XN397jdvgW5UEYq2G1M3pTQDp8V9Et4JOEt+QmpUQtc4UZMvK0VyYcrxsE1ec9qazg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450351; c=relaxed/simple;
	bh=7wCwc+ViqGu+2z9VpFO45dperCk/t6W7XlTf11kD6Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rp3L4WuBWo+kj1sYi6DjZGATIi+wjw+oHlNMwSAgLC7uNPApDqxZ5pc5IplUc0Fye/m8XURAJBmzuED3YbBkeLxAPLp7l4iTugeg+/MnLc1ArLhUakmRS3cCIcOYnI3QYOYLWifqy8goVkgZDC6O34sHPe1uz76j+PkWCZ/atmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M1rot8vF; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M1rot8vF"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so461191fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788450348; cv=none;
        d=google.com; s=arc-20260327;
        b=FM5Up73bZbqxFZCokxwuPlH1IYvL4CTd3YFEu/BC07RoO1avbg52+VG/Woyj9IX8eg
         c7+keebij5yqxh0bvq79lZrr/pw/rYygiIvob9VL3fe69K1f2vftwpF8wWWb0zbLkbW3
         DLcxhBjLJw7fw7MeuNSMeCmNpC5Got0Q7yfaUg4+KRf92VDnN0/eOq2aQU5e0h5DIF8e
         +wgzDmGtB/j+Onp7DzGNRovkcVn8PCPLjjEiig3S3n9mxvPFO/P/35s8snmWhWE3DcRe
         wDToXOLnQElP7pahsKXCd4aAeYD1BuITxt3V1F7YvGF5sZIRSfeGlKhgNSMcGx/EqHMy
         Ky2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GO13DSpk1QXVJWoU/8mFYq/o2eKcV5GsiCueWKKc/2s=;
        fh=VqvHWepQ1kQLI7oRNhDKPvGafuYbkt0SNIjFDii2SLY=;
        b=ZXpNASg31ZGamkPr613PgSzw3RIGDcRBXKqlrHQxnBgFsKNBxuHcbKDHsbFe/de+Qk
         i/5Uu6HN7kdtmS/H1YTHD/zTWV704x/YTpVYtrp01ClytHQ6m6D7CdtUumR9GmFEERfS
         lCnK9ev3xJarSHcsnCqwDuMmHflVkq72WdSihfPKTproZkuLV/BN0O5rg6V0VdR5FWms
         1M8zvXqdaYg2c8aL8uWz9evTpbhGSRoCbSiIqWtYfVz3JiXDDX88ftlyRtab3PzS57ly
         TzNWqJ3KQ9MQr64v+320cgikzcd/2rGciSEizev2czwnPL3Gut6UzCLGWDOev9lcQw4s
         FLSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788450348; x=1789055148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GO13DSpk1QXVJWoU/8mFYq/o2eKcV5GsiCueWKKc/2s=;
        b=M1rot8vFZgW2qFoP7wScEtN6B2tDDy/MGvLnD1szwbN7EMm2Og8M9tEyArUf5+KdIL
         14lINxoRnMCHSiOoce7EcJWvDM2dJkaLUG1BQbPScGruyh+kz1Bnby4jdbB7t9wYodbT
         63x6QVkJ99cuCT1133sulAHG7llXO46odbHVJ7zrhehVanghBD+UYrZ3xkVM49yNhMMt
         j4v3Kkxw4oRqoEj5aPPPLe8BSKADRvz+X81Qt+qVXuYFV5hM8EJeZR/9qUok9D7p7OqF
         vw0ZKIOC+56mM+GCdyjNQNFslKitB0fsjOLTJW6AM2zULBSvm0HZbyKp+EZR4e8lPgku
         gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450348; x=1789055148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO13DSpk1QXVJWoU/8mFYq/o2eKcV5GsiCueWKKc/2s=;
        b=AGUWMCA3jOr5J3goqCEqz0VFy3DA92YWFuYj544cwQqaRFM+AY3a+MA+LckX7V2eEJ
         B/FCvAu3WfJGFnqxSvycLNuGHJu/rcHTTrKiFMwEG8rDhOK+4kSXU+31NL4/1X9JgmPJ
         yCZDOCvKyDW2GEQBLwtskO0uZCY3aLMzZJOgIIi5HRaekoRQNICdTCelJaFZAnTtn2sm
         O9hT/7UM0K9t+pRmSrWjST6J0Mau7PY36nuJ45B5MEidUEA49BZWyq14e3lnDcvJo8sl
         Q3MwufO4cJoGeZFOoSka6HyD4oSj9zkw8ShUSDqv+/Ti8B+PrI3T9eYwBGo1q0Zbeold
         P3Mg==
X-Gm-Message-State: AFuF++n9uytvHMHkAn8MzDaqG4rQ/iO6NpRJyb9s4YcCJBA7SKP2pgM+
	FjxstWkh1To2Ki2Jmp3yhd8LYQQR5/649BR28N0bvis1s6lEe6XiL9deAo8c7FG4gs+x2cmngv8
	bCqP7mH3YmpwiyZTfH2J0jFRkjYdNnol7Vm26loZMzk0iBKv9qqqResE=
X-Gm-Gg: AYBFou371Wqt2AZm4yZvq4B0tJm3NuH501SRYwsEPkL+l/Qu3DogL/9wKM+sl02jQP0
	retsQd9EZFJhTY4TduWKru3ZqAwcn1U/UaPt/Tw4aS4JAmKOJguosmGmgiCTicN9N0okqYCAAJ8
	cTCiNnkY6OSAcoqYnHt65H/C6zsCd567TfOQu03T4tvVBGfnSAOqdt1tX1IwP1cPNE8u5JMkr6J
	f4BTy6AAr+8XXkzg1hLG2R1obn6cbi07ZJ8LHbpo+cG34oYs6xED6vhkNW5zs1/MrVp7ecbrAPF
	MEs17ROsH/wfcS65iiU9BZreF/COBLVxeZ60DyYGovIkVWQByFiob5piVWYuW4OFbC+ZoqVoh+p
	p2w==
X-Received: by 2002:a05:651c:305c:b0:3a3:3fa5:babf with SMTP id
 38308e7fff4ca-3a34fc66272mr26904431fa.6.1788450347785; Thu, 03 Sep 2026
 08:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903152204.401638-1-marco.crivellari@suse.com> <20260903152204.401638-2-marco.crivellari@suse.com>
In-Reply-To: <20260903152204.401638-2-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 3 Sep 2026 17:45:37 +0200
X-Gm-Features: AcwNN1XAH4FfduCQbL_H9LayryAhbv1ukSXYwLjAYECXpzk659U4xu5KaAVqYrk
Message-ID: <CAAofZF4n0em47if7sLq5vE1g8CTsVtsnAeTGFbBuCQNqkzc9Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] workqueue: Make alloc_workqueue() unbound by default
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 5:22=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>         if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
> -               WARN_ONCE(1, "workqueue: %s is using neither WQ_PERCPU or=
 WQ_UNBOUND. "
> -                         "Setting WQ_PERCPU.\n", wq->name);
> -               flags |=3D WQ_PERCPU;
> +               pr_warn_once("workqueue: %s is using neither WQ_PERCPU or=
 WQ_UNBOUND. "
> +                         "Setting WQ_UNBOUND.\n", wq->name);
> +               flags |=3D WQ_UNBOUND;
>         } else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND)))=
 {
>                 WARN_ONCE(1, "workqueue: %s uses both WQ_PERCPU and WQ_UN=
BOUND. "
>                           "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq-=
>name);

Please ignore the patch, I will send a v2.
This will cause issues because wq_size is calculated before:

5911     if (flags & WQ_UNBOUND)
5912         wq_size =3D struct_size(wq, node_nr_active, nr_node_ids + 1);
5913     else
5914         wq_size =3D sizeof(*wq);
5915
5916     wq =3D kzalloc_noprof(wq_size, GFP_KERNEL);
5917     if (!wq)
5918         return NULL;

Thanks, and sorry for the noise!

--

Marco Crivellari

SUSE Labs

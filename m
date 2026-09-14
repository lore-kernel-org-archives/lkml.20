Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5237187E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379926; cv=pass; b=IgwfDSBQSYDzxhYnecgV1PVcWwYccoMO94FaSgBBLFr8uQaSyQhh5p3i97HljSkoj/FHrE/wTJ9i16TWE4LvmRXRjBUe8dAnueTIMQWk8w44ZQOGdO6CVD7FCst6JVzVOCyk3HtD1+kPx53e+ohp4gT5GtPsFL+Eq1a6I7tCBvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379926; c=relaxed/simple;
	bh=ekZMqPqix1SfSP0Jg3oOTYIzLY1yHdpuXfG/BQXJszg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhxFMg8X+ly20sNDMOLaOYtrfvJPBoE3VCAZuKl5S8vH2CCboguAllMNa6AprXK30lXCH+f1EchszZVdcTmOHP9sfc0KG+oBs4gSqIWxYAzMTs9ZeT6JUPPAqX2FcWDW32c1EdK8XgmZ4SSu4awF9BjzbkNKIBLKdub2IYdVLT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=fOqlnwcA; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="fOqlnwcA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a3490bso1629557b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789379924; cv=none;
        d=google.com; s=arc-20260327;
        b=AXZvVBZi0UicFl8tCuaP6wUcxEevXxH20bYgy/uI8VFy+Uf2RY64Ypo3rDVeKpTATU
         XzuB++7HbHequoy0IBMfqJuKqh42+oZijTEcA4UteA41b45fyhcUmHps0MpvxSDk/QHK
         nFpCxHLfeKq5EeqHLZNjosC/XKlL3vLkpNh7tcWpYe/d3oq0Tu1H5IGMJdSPiaCIGPRl
         VK9IoRZ1xU87hdxMR7mrPExWT7u1thXFVqjt8298smgY6y31DKhB1x2vYeLTFau0w+uC
         4JcNrNdJ/1T6fcNs7PvYe1lBVqebvR/al4Ajh7dN1eLsK0egMXQLc+rAVa64mt4qOyyG
         Rrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BUfuwTxWoTd9y0Vz5pkLwXMFS5QksVwR4BkTSHrTGWs=;
        fh=WUIRLoBj/Sdvadtsq1gU8iZUnv8yu6FauIlLaF3PiV0=;
        b=VY54IcTLBrrnMqvDSW9vSsntRghmmaZWYDdZyGaQVP7UWv6BDIAqMqQS76f3h4Mig3
         NsXqwsLDpNUp8SSUdc7EaLY6EqmnG6ghnRQR1BSmlpW9/ZaED8InhkSllZJMIwL1UGay
         ftGenSTB5AKQ/ncPiDNqxKIhAaEde4lsyE2miM3Nupgy3FIJLjes3r4IuBPlP2euy7uc
         vR+hs7eW7nUYx5vta7BmNFdm5SvnR4EoLKfSTHS/LQnpx6EUPNfHaIQo6nNB2FUZ0I6a
         qAMZDenROAb3zhDBmD/DhfnFWLLYyXc7mPW5ocX3Yta3G68PRS59urwcXLPR9Q81rxFQ
         oQkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1789379924; x=1789984724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUfuwTxWoTd9y0Vz5pkLwXMFS5QksVwR4BkTSHrTGWs=;
        b=fOqlnwcADDqMlbQQYzNj+1S4I93vphCKDJkd5RG3EstL6/VcFbWd+3b7TGYiYSvKrR
         ag7WcZ6g8IkDs0AEqLjBtQzzoh9tIUgOQczP49+RTeBouQf5+xhDYaNHUCX1/d2/rKrI
         kcaMH9c1oZ1ejOYJ0sWnwpifzVnt/6HiE3aHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379924; x=1789984724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUfuwTxWoTd9y0Vz5pkLwXMFS5QksVwR4BkTSHrTGWs=;
        b=IY4JjCHBtVuwNGCe9USpOSf99YP6m0C6LpdanoSIMI6KMSBGZe5RecXxjnf3BTlpYT
         dUI9PS0n+3C6NszvMO18a8SkaTqHqeBfS69gRvBjKMPrQhMJYd+ZAlb0WsrpaOlc8mbA
         JmArUWC1kfhDKt6CqHg4lQlePQlLJ47o459y3joGLIClyVrg+p/9l9Q8KpXBD9Kthrte
         +ygN5fgMCV7QrEPS5r6yt6htvMhqtqVwdwuXjHrSkdAlpHgwbFA8NjRM54+fUshkG0su
         0NasNVxRA5czQdKmVaLdEt28iOTFY3gMVTOgAXzeRVewGN9hirBDxY/3QfnXnTLoAfMo
         uijA==
X-Forwarded-Encrypted: i=1; AKwUvBzXIl5Ln5ENcD1TESQlc/z7Wll/t1WSRNodW+OzDy4pdnuRFt8/wtRF97YGA1iGAfbYvq7JV5i11uIU9HE=@vger.kernel.org
X-Gm-Message-State: AFuF++kg0dwf6frF9SAwsHthPY4G8sC+djKc9sGY03yL0gHTGUur+U1U
	qBv1rJP7pmPN5bbWwRTmegzWKtAUqVY6XgbVS7MMtHQdCtA1YOLUYn/I5c8b/yLx1+O3rZzqKbU
	eXFJMV6oAabgaeDkuqfIY72BeaWGjf2Cwqtjxqe/R
X-Gm-Gg: AYBFou0bULqy6atjk8NaZqdj82KP48PrguIcyoxvBN+FgmE4IdQ1GNae3h0O4XymLe7
	cSM/RtkZFjpdc6fAvxBUqd5XsI0wY/c9C5Q0bZBdyI/NecEVx89ZPmvfAJuuw5J2vYAaDD97hel
	mn0uIJSM3MOqfkftwdrXkIAht39w2AoAH0fjEMaILrwL8PLvuR+Im+Vgx1kW93xT2e3DRQT6lQj
	uHNom2iXxLz44WjDl5yssUkKg87HjnFSiGbYV18mHA4OEQxmuHl631KcaUlkrSMTh537cJ1s3Pz
	aJS5u0ypYNEBKEfFfSkzFF2kuq0GZJm4rCcyq/pnbGU+qylChaySvBWb3VPs7Esk4DHP+J/Lc/e
	T2k32WmarcXjZEBLzB2t5jU/6oWMrjHI4FA==
X-Received: by 2002:a05:6a00:94d3:b0:857:7337:5db8 with SMTP id
 d2e1a72fcca58-86f85ae8211mr3629691b3a.22.1789379923820; Mon, 14 Sep 2026
 02:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914065123.4109709-2-bestswngs@gmail.com>
In-Reply-To: <20260914065123.4109709-2-bestswngs@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 14 Sep 2026 05:58:32 -0400
X-Gm-Features: AcwNN1U_PEiBsILbnOHs9gCzos_UIObxVxzcwVGwW6bTJBXfjAYney-md8aD38E
Message-ID: <CAM0EoM=7jH_OqmbERPVNrFg7Q079g2f1oWOKiO4nRLA3Zxcm3A@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: reject IDR error pointers when deleting actions
To: Weiming Shi <bestswngs@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vlad Buslov <vladbu@mellanox.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:51=E2=80=AFAM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> tcf_action_delete() drops the reference held by its lookup before calling
> tcf_idr_delete_index() with the saved action index.  An unlocked
> classifier can remove that action and reserve the same IDR slot with
> ERR_PTR(-EBUSY) in between.
>
> tcf_idr_delete_index() only checks the lookup result for NULL.  It
> therefore treats the reservation as a tc_action and dereferences
> tcfa_bindcnt.  A hardware execution breakpoint was used to schedule the
> interleaving without changing the kernel source.  KASAN reported this
> decoded trace:
>
>   BUG: KASAN: null-ptr-deref in tca_action_gd+0x5b9/0x1010
>   Read of size 4 at addr 0000000000000010 by task poc/150
>   Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000002
>   RIP: tca_action_gd+0x5c0/0x1010:
>     arch_atomic_read at arch/x86/include/asm/atomic.h:23
>     raw_atomic_read at include/linux/atomic/atomic-arch-fallback.h:457
>     atomic_read at include/linux/atomic/atomic-instrumented.h:33
>     tcf_idr_delete_index at net/sched/act_api.c:766
>     tcf_action_delete at net/sched/act_api.c:1859
>     tcf_del_notify at net/sched/act_api.c:2014
>     tca_action_gd at net/sched/act_api.c:2064
>   R13: 0000000000000010 R15: fffffffffffffff0
>   Kernel panic - not syncing: Fatal exception
>
> R15 contains ERR_PTR(-EBUSY), and adding the tcfa_bindcnt offset produces
> the address in R13.  With the guard applied, the same reproducer returned
> -ENOENT without a KASAN report or panic.  Treat error pointers as absent
> and return -ENOENT.
>

We test all submissions to tc. Can you provide a tdc test or reproducer (Po=
C)?
Please remember tto do his for any future submissions. If the
information is sensitive, please send it to me privately.

cheer,
jamal


> Fixes: 0190c1d452a9 ("net: sched: atomically check-allocate action")
> Cc: stable@vger.kernel.org
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>  net/sched/act_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/sched/act_api.c b/net/sched/act_api.c
> index 19501dc99..eabe612b7 100644
> --- a/net/sched/act_api.c
> +++ b/net/sched/act_api.c
> @@ -758,7 +758,7 @@ static int tcf_idr_delete_index(struct tcf_idrinfo *i=
drinfo, u32 index)
>
>         mutex_lock(&idrinfo->lock);
>         p =3D idr_find(&idrinfo->action_idr, index);
> -       if (!p) {
> +       if (IS_ERR_OR_NULL(p)) {
>                 mutex_unlock(&idrinfo->lock);
>                 return -ENOENT;
>         }
>
> base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
> --
> 2.55.0
>

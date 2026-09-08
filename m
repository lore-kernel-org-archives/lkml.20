Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D8D5921F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887520; cv=pass; b=V2x3th23ONpiA/hQlPeqa4XgOCo/YLqyh7vc3D54O/xh9ufPKnPtZxfxgqby5K0IyBpAi6fj4AYkmuwY7LycFLV1T9G3eHSQJDU0oc+lmVaQJrPX9LZM10dqCMTwaABfL2wJgZ83J5uc0LB5ByKDohXsGlDEUQOh60OtEP0uECc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887520; c=relaxed/simple;
	bh=Zsk827nev+a0SrWkdXfF+krxDDRI5B8E8B09enubrAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/w/3oUPS1bmelKrDJiMvM+M4Erx5Y/dITE+1pX3MQ+ozSRgKjZyoERjCdIzcVH3P0R54P975nKhV70zuZrmNG+xt7fmZlyXET49pmMSnoK+dX4Xg3jOksLd/nJA9x8k5ORgmM2xtg8YJ+6ZOWAHi7ulDbHg/U++gkIlnbjmGWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hooZ4emn; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hooZ4emn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485843aeab8so5440224f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887516; cv=none;
        d=google.com; s=arc-20260327;
        b=V1E9XVFQ9OwRs9yGUNzJMdV4EWzi9lwzNprF60jwWdTq2aigXBXAQxbsiEGeq1riTf
         tXE60oktV9yCi/MANfHuuge48g9VbcR8pSFhnGeZrrTCYzxRWyw+EI/ulItxlziZqFc1
         LuVPl74B4F4vtVo9/FlN1DPpOqQWFTd9PslRIAzoB8Dqa9DpC/9LEOxCl2xCYoKDzQn8
         Ia4xp0Oj4Qe2uh3s43mwrha1QsXLLYq+Ts4DCMPOGYsewlWKfNc8vvOuL4nBzNQ6LEfG
         zkduqiFN6NXjlnBSoiu6YLsQD4OG0P9LPG7bXeQHH8XjkzdHsrQIcEG+TJSqa2SzsLL3
         ifLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbN3NlSht2VbqNXj9ZeLJWGV/jhiHsfZo6fQ2eO9Ntg=;
        fh=/fLEKS3lrAziI3LJo4npzkNFHDHweBWpe17UC+B8LDw=;
        b=Rl9GVDCtZBviE2DtVmC0Uq/U4uW+peKYbUBFyZ6z4z7V4wrgjeUBiqpUb9w26z3tQW
         OaUd7nKHGUa+NJkm9HNpBw+oNi6NBPauk/f5MHf4HLTTOahzseiOdOzY4n0rUKOhN07h
         Bo5jyYZpi4Lbl/yN5gclZacXigImsCmFozBqihMmBbglUOpgnUIuAvT3k5Dwfaua4CTe
         ZyTAaF/fnyKtiofgpz44Xtvw4yrw7CHeLRBIxm/ofBj5qwYpwg8HlycboZE2aSCxiIv4
         9b0DSbnbSjIPhKh+N/GO//mmNauM3BRfcNZXef8QS89Oge8B47jT+UHEurFv90WflFdy
         /jJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887516; x=1789492316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbN3NlSht2VbqNXj9ZeLJWGV/jhiHsfZo6fQ2eO9Ntg=;
        b=hooZ4emnqQ2sz3IqFITVHOecAp8TGKrzUtuRJLJguKVV3yzjnSRDLM0oshZkV8TCr7
         E+C3yBj+7U688oJzgfCEKgrYH+fqw+66Hdv+sJRMUuwF7BtuIHqoxcr+Oo1trGE2sG/U
         szO47Ko1TF7HVjwgEr0wmFNUYjSPl29RnA8qzQahJ/4Xuhi0JBMoaut8lnHrGcV9jz4G
         T94U/hamYA5NlZccpNmeWDYYO2wWLftohJlWsmUWHeST5ZZIf2Ysdb8VMNTEZ0oifKPF
         Ii8JOGbqiPeB1OjqQ9mrmsELe5dnqy1xgWxOA+O/XrHcBtxQhVGYx7zZxDMKvU9oVhy2
         zx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887516; x=1789492316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbN3NlSht2VbqNXj9ZeLJWGV/jhiHsfZo6fQ2eO9Ntg=;
        b=liMcrpWgjfHy2iYzbWba3HMUzYBsJYtN8NNbnXwNa/tvQ3juW6VojMpSqhyrT1aco+
         fbEbW92gXBInfuqK1MsNYtsLmk7+VBXHKPsMEl4PEgkV9aTssHOhMtj75HA2EZnuejYZ
         v/6Vriu6c8xODiVnDygoDW4SyXxe64Wsot4Xhx/3pJbrjkQZJXtAk/dQOXOKFCvWSEwe
         gTP0SwzYCAAah164LziCCbBSg5kXe/5E9ro16Dia/WkB+Yg795WOMIWw8G0jUIFRK6gz
         TFW4djrCs4kNAO3r9HmDdi7Dw5g3FsZcMSpaIj9Cc+iV3GlzczvDZ6B6NBt6hot6bBVr
         pwIw==
X-Forwarded-Encrypted: i=1; AKwUvBykOB/5VW4MCMIi9EI7uTHEkSBNiYfOvXL3l00+gRKEU1pkI/YQV/Xs7+tsIjIC//piU7jjVaOsfpp7KW4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkNpmmCaUcxZeZ+SA8xKZdblpzOIcdUr4T+Gpv+/XkgGoGuJG9
	QPWBG3Y+Zgb1GVEJB18SXt9pcxBji79OZ/z9yGx+JznBm4P36MMRBjpiZFGoghIh1aDWd5u3XuC
	e3HDkX0H/0ZHxfx4qDW59Enn/guEiyIw=
X-Gm-Gg: AYBFou2TIt/CaiEZ5+lOoA3X5aLn+HGhoJow5gsNR1pFQBwgICmud3oe6nmYVMoePv6
	5TkdzN8iC6HYkvx3XfvQ7hUlcV/lsvMEw0ymZaNxFIZ54/oN07WgeA2hUQP3sosvdbfmxxy0PDG
	ST4G65OEnhdzOC8e+fzevEisSfX6Xhaj535krnmXzz0I77fqQAwuXKDRX+uftdwGVUj84cMYtQp
	TSH4pIuPb1YS6ty7Aj6pglt3AzATiQ3eLRo+nS4xEJAPe8w4fnf9ssR3Uuaq0/pCPNvRmMNucDQ
	Rl4eHqu5IUyyoWthO+UyoII0Dbh+ge1oQyAdUxSmvwGhjs1nmCNtA9VNvItP0Nq26UpZTd98n+m
	a
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fbe with SMTP id
 ffacd0b85a97d-48586bf25b8mr58778399f8f.0.1788887516324; Tue, 08 Sep 2026
 10:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zMhs_DQGah6mRfh2=Q_9WU4tm7SsWWGguUt4h7mXiOFRg@mail.gmail.com>
 <20260908012801.1864430-1-xialonglong2025@163.com>
In-Reply-To: <20260908012801.1864430-1-xialonglong2025@163.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Sep 2026 10:11:44 -0700
X-Gm-Features: AcwNN1VdBkSgBZ-mj0Ebm5R2Qbd2WEyMj2rkIN9KM7C3VNdLM87lpTCQ2fxYk4g
Message-ID: <CAKEwX=M3axD3g2d4bT20hiicz6D57hzV6TGRYFKdd9BonoH_Kw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/zswap: publish the initial pool with list_add_rcu()
To: Longlong Xia <xialonglong2025@163.com>
Cc: yosry@kernel.org, akpm@linux-foundation.org, chengming.zhou@linux.dev, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org, xialonglong@kylinos.cn, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 6:28=E2=80=AFPM Longlong Xia <xialonglong2025@163.co=
m> wrote:
>
> From: Longlong Xia <xialonglong@kylinos.cn>
>
> zswap_setup() publishes the pool on the zswap_pools list with a
> plain list_add(), but the list is walked by concurrent RCU readers
> holding nothing but rcu_read_lock() through zswap_total_pages(), e.g.
> /proc/meminfo and the shrinker count path.
>
>     CPU 0 (writer)                          CPU 1 (reader)
>     --------------                          --------------
>     zswap_pool_create():
>       pool->zs_pool =3D zs_create_pool(); (1)
>     list_add() -> __list_add():
>       WRITE_ONCE(zswap_pools.next,
>           &pool->list);                (2)   zswap_total_pages():
>                                                 pool =3D READ_ONCE(     (=
a)
>                                                     zswap_pools.next);
>                                                 zs_get_total_pages(   (b)
>                                                     pool->zs_pool);
>
> If (2) becomes visible to CPU 1 before (1), CPU 1 finds the pool at
> (a) but dereferences a wild pointer at (b). Publish the node with
> list_add_rcu().

Acked-by: Nhat Pham <nphamcs@gmail.com>

Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194663C1D7A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529457; cv=pass; b=JbNFUblgZquM1D+Fk6hMJ/C6mYWDdk+4n49QNlmYAVGRyF8L5dpAkr0Vv3gZLEsFOqcJiukm9ofPOoGopUmM1pzWFuXB5vELUEBVG4clGAbfluWMFjptEIfxSpEJ7+cAbPjyH79NEbhMaS7GozpchlpojGxrfaovOirV4Axb0+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529457; c=relaxed/simple;
	bh=Kvzcb/uO/lUt85F1J+DlqpO0vT6ehTwyBqMNoP6aUIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3nVibyRfNn+hC/VnPAwxPmkWyThUi1FtPZ08nH5OiaWPbBUjhGZrWUQ8Pog2iXhjOT1MQ4uPVe8uKDKAghtngGUkBcvTuM5bJ3VSib5yCgKEMU4yTehNJ7QSa/YYf9iW54KrcdQ2vn/9sIKZoVl2N+XqUS2ASB8O/txaybiZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4RaGTtI; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4RaGTtI"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1afdf5196so1388239eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529455; cv=none;
        d=google.com; s=arc-20260327;
        b=JNoTt2rzsKOKLcX66kxUjbvkBmFyWhx1BBYSb1GXFQ4ixLHwu3O32924gU/we6Arpf
         jDeOcnrg3HAWErNI/WfLMQXy8p/CSJPVbcYF8UlSV/0uiE0Q5q4jYovYm3G5LKBY9axU
         pgoGXrPlvg2eahvEvz4mmyBd+LYmdH26RdJoa2b3N46q7xIou4LgFMcO/pGcoBJAORKS
         2ZOfGR1icEbFKECk1wHk71SAQbssWAWgajmQ7i75ZCxLlAFYLiKYqjxKnHCHL654O/YG
         /+IxmuhoXvv1bLcqZdhflLwYe0aP/+45pSnJ+HuQuxTKIEW2L6aSdJlHxldn6bJFYqRz
         KrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwBvxaKSezPcmRHXV7EoTDUsrgLVXKX7pSoghw0IZJM=;
        fh=ys1A4Tb/22nkbutvN8Mg7Kd99o1n/WQEH0aNQk44wRM=;
        b=SdWR7aeLPZfh2pbxfINANCM3cW4Tcvv/aFmgPmRFCjEIGSHrEONcY1wnHrqEQ2d2XX
         BSt9bFfPCXcMbopgrF8DMNL49kFoHYo9+LK5JVwCZ8Aaj3XdhgT1+7GjnYkBzBw0+5bI
         AneVIF3YFdJcRGgJW3TFDAQknxkigpdNsg86TZP404OTCggDZzhN+Uh8O5yOoO0as7lw
         u6CB1taQEPIdn/kYzMIuQWElsX0skuzglBFr3ds/H+lcz68Rq/wRjO37GOeDTp1Y8fQL
         Jjyi2NAKLK5JGncUuZytp6TsCrw8pupKymx8nPBek5bbLVnzNVUILifrCFXNjDafW8Z5
         HrJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529455; x=1792134255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwBvxaKSezPcmRHXV7EoTDUsrgLVXKX7pSoghw0IZJM=;
        b=n4RaGTtI334DWwsAC1ibc0bpkwcftTewB8tB/qPcBJZ9h9PXr8i/7oll3NnO/MBPhE
         p6WklmDG9tI5KvlA9sQ3uA4g2StTnU9C3qGCPpnRbd/J00zjfjQWc4lrRy//U/moYwoz
         FcxYfic/rwQ8wepDhOnttUJl3I49/9vQPI0qyLwfm0/bLGsc2MD7osGl4Qu+hjRiwRRk
         EQSu9uyEtYqngm3zhiomRV3TkBcdkIVMBmLMsd8TZjnRJkT7BVIL2Pm4b6x+CKKf2ign
         Uvd3p2EuKGCini/F3VfFhIFjMFqPg32ryBxHYxmak8ODiHre85jLd2rc6MsCUbDdejNY
         gdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529455; x=1792134255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwBvxaKSezPcmRHXV7EoTDUsrgLVXKX7pSoghw0IZJM=;
        b=lGnuZfTLHZ4pkeWEbwTPbmyVuPaR+FU5HD+uk3WIS84UdBU8OushsiD92N8z1utcvS
         dvH1sVJHCTTyeVJSg+cYZWQiZn2Tjsry0Ui3/u4jtdbPYwFU3V9ujQ6xq4V4geisUEFr
         rL5/okpmTf/1VROZBdv1cJ+XAXosjNATZN8pUC8MMWjtnNQ8p6ey0Q8BOLkozFpk0v3I
         Vo1y9FPYbm1zWlRawOZtQ6gmnC881LOIxaaZSvzfS82r4sVDIH6vA/nSvOLE/8L4p+gy
         Q6Nf0w1V0fV98eYpi0SGVtKJHbuX4gFwN5chwkdcRKE04kwrCkcAe0/mG93Ld2GaWy1g
         ryww==
X-Forwarded-Encrypted: i=1; AKwUvBxx/4YYAi1vf82x82CdI27WxJkYlTSQ+MMlzNQyUGy3sEmDht/w2ZRJGwUL+3Bgi2YTQffGdyRL12mPaHM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSryYusfTDQ3enDc3IoMfXrnQWZQWE/k1T37vyZwrPlG1/DuxR
	VYxvGiE7EXSn95W2IG8gvXOHizX1SA2OiT8npLlfekAZmvu27UQMQBCcqt1GB8Ex3eMwKIFiJc1
	Dhax2DmdOpjrYU0djdZAOCt78OOZNb9M=
X-Gm-Gg: AYBFou0ztQmt0lUXN9KnQbHzr+Ok/W3r3a3DJ0ZnPAbUC6TcakmXfFEzbNfwmZuB19r
	1nZw5YSqsk+Um7V95ot7RiLnfQhS8R5a0oJzCIrc7+MjbE3YenpKVM+vKHTAuWg3WLCq+aGgTMq
	zSR8+jTll7+syaGNcozj2fybm1ws4GK/F1rb3A6RxEk/5vEa2WcejcRXmrbJ7mRKzpE3M8B2zSY
	psAy47/uBiAiG2YdotZmMxmR/HHU4e1qP8qExdp0KmjRDysxS+CB5EdPdDbPLzDcsDI3XGBuXOB
	EcFXfQtsHTF1WjdQeVwqfKUPdYe7lyRfanoOATlgMeXQhnUfNnwLLEzU
X-Received: by 2002:a05:6820:618:b0:6e1:817e:e348 with SMTP id
 006d021491bc7-6ef0ead8a70mr755983eaf.36.1791529454847; Fri, 09 Oct 2026
 00:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003093837.545278-1-yaojiale02@163.com>
In-Reply-To: <20261003093837.545278-1-yaojiale02@163.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 9 Oct 2026 15:04:03 +0800
X-Gm-Features: AclHuK89n94QP4eXCNQI20RI3FhQZ5iF1cD68FNJB3GcRZKG4SgaqZ70DtaTsAM
Message-ID: <CAKGbVbsK-mxJskJGYG5b2B7NOcAw3fRyJqAjX6Zf+AdH__1f5g@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Drain fence callbacks before destroying slab
To: Jiale Yao <yaojiale02@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Eric Anholt <eric@anholt.net>, Heiko Stuebner <heiko@sntech.de>, Andreas Baierl <ichgeh@imkreisrum.de>, 
	Simon Shields <simon@lineageos.org>, Erico Nunes <nunes.erico@gmail.com>, 
	dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Sat, Oct 3, 2026 at 5:39=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrote=
:
>
> lima_fence_release() defers freeing fences from lima_fence_slab to an
> RCU callback. The last lima_sched_slab_fini() can destroy the slab and
> clear its pointer while a release callback is still queued. Module remova=
l
> can also free lima_fence_release_rcu() before that callback runs.
>
> Drain outstanding callbacks before destroying the last fence slab.
>
> Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 9a1e6b9ecbe5..9c5ff1929d3e 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -44,6 +44,7 @@ int lima_sched_slab_init(void)
>  void lima_sched_slab_fini(void)
>  {
>         if (!--lima_fence_slab_refcnt) {
> +               rcu_barrier();
>                 kmem_cache_destroy(lima_fence_slab);
>                 lima_fence_slab =3D NULL;
>         }
> --
> 2.34.1
>

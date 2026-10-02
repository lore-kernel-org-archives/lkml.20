Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554E47AF6E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935429; cv=pass; b=B1feuOQgcI8pU8xIk6SZd0X+P48dQ8oNWm6I5c8YZDJRPLEEXQe/RrjFZX01+XHuWIHvTv2gug0WUxY6l1C9mAMvsWCQw9q7yQmIQYuuBTkNXtVao61sa5olGRppL9YD5lQ3kXknWyQsEzxjem5Gz1YTJde+Y0HODb387vZE9Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935429; c=relaxed/simple;
	bh=D91ZmX5/DQfmBGh1QApViU92sc/8wjfGHsUQosYUA9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwqkKaTmgudEsMgdtjtXXq1ccsqGmWSQmXprLXU+u1PvLj1mf2gRnODJ6D4sI94zQ/UUFJGnux5bUI/lyLGMZqIq2NJmfrkBMfFSK+MKASeCj8VDSfgdcFENTojsApJbGA3k5p0Mf1oNd32pH+6jgFzzrrOhPJzLIRU4zYkFbt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iz2oJYfi; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz2oJYfi"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so10302659a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935425; cv=none;
        d=google.com; s=arc-20260327;
        b=Ngk90LpAmJ6Co9kq9DYonuGPzldHaGaY+fnzvqLyvpZKXI1EwePhhXADmBMPS4ZJTl
         WkzxP5A687gx2b2j20sENENJuWcaz5HNmNZYPLIcmRyAaxc0Z6eL10wrDHD2KApOMyyr
         tVLO/ebd/RdK2ywNTWbBL/PAfpLMqT0IO0ZbGy8xv6a13r6bjYpB9d9S/SWr4OkZAi+B
         w+iAojzew5KVRt67a7W8w90hol4BJK4BTIr2gnsik6qA9Jywa9JdJjn48AQeNohn0C/h
         RIgoiEyUVsfO/UbpafbZthXYm7OlUlqcY5Bba7qceZ19EpR1C3TvXHE4WV6M7D/Aj7oI
         j83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        fh=R4edAv5P9cvfOPy0tFkPkT1DwCUX8NF33XZHbhdvIXI=;
        b=KQBnOGFHwevMtz1v+DGYQDXzOgZYDDTsPBy1r8/xaYibWT6OVMwmb+YhrLoyLL6eY9
         qdqdyKUv6y2JDeDkqoecj3ksQjuwUEsgjBTvY1okI8bGGa1X6dXqZMwZxwWO87sAtx+S
         Qga+GKrqSg0yjc/8+wMMTlIJoDFwYFSWaVUNwQUduJvhfh9FopAhxEqIAGl/7tpb082E
         qP0HsHZOCWCa8VthSW6yRQJZQG+8B1knfFzKnyplY57k+h5csOJJkzlVanHX2aizfVWd
         BD3Kl8ClhBAlk/oEEAAly7uC2DvFDhnj+I5o0e7oJ5kir1s49252nEs3SUMJZHF7FvMz
         Fcvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935425; x=1791540225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        b=iz2oJYfi7zbXtkaoi0rBzFo2M1L/79Y/3j+HVGMO+PV/S4z4b0homkqyH1xYair1FC
         pQDuGxd9RYmFU1xXIc0b/UDsvL1icThbOrVD3xl5vEDcywrWUVj/nkQKcql5yXKNgEg6
         L/qpUPxdnEhTyMxOpS85VuAlSNS163sOAUQ3z6P2/op9Rf05G7XDnJ/XuBi7I60NCJlx
         Yyff04VHla271p+ZFBvv4yeo+oquwYio4mZK2MpNusuWYLqTHU7PeZYJAZPSkZVCTQLt
         9PqYmOg7upXRHKM9C/iQbrM9UzU/KseDvD/Z14HkBk4zYeQzMrURBJ4aYAsrdHi01KvT
         7z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935425; x=1791540225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        b=RXJgj2gQyYqEJpVhk6RknAQTNOHVDc+ZbyENCEADV6YrNWdBWt7byXGiY2zBols2c/
         51Zn+TcKXAVRLzy9e9C1hWjwHlB0ZncCL61nNwdw80xyrsCDPaBx4kO7bQVMlTn3IzlR
         uXwR8ILVdragdXsLg8TF5tA/ekkgO+sDohlSCQdtvz3YHUaaeXiabUECMYX5bKlPEN4O
         ZOclst3LwrtLpGDTGte68TLd6rjRGNW/q3S5L3n9lusmezPr9lOGqAXphZCpTiAIv8E1
         0PWPHZl9EmpTz6UaTMTqud2dv2LWVvDa5oh4rL9rLlGu2DvQemV9xGgqaaVf2B+70427
         vlwA==
X-Forwarded-Encrypted: i=1; AKwUvBzQWeC4Ax8TL3KH7losKQkRM2MSBe3caIF1MvjWjrSLIOGlmv3UuoJlS42OqF+8I/2AJjdg3vLLki0ZePQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVcai8W09kia/NMtbJ+DmOMTMMtf+TTx/LNAAq7mKhmDDX58ml
	RiW6dI/6E4CDx90mr5KAB8PFr0ijcjExDCjrocRjwI9fJamlvGrT3of4x1nsG2lQmpSHUpiW0SN
	/N4KObfWbVNzQwJq2CmEc/zmAuyQhX6b2u+oe
X-Gm-Gg: AYBFou2IpMRlgxr57ulRKPsiTOYYjlfUr8dgS3be/kub0Rx4lf7oLZDqYE8CV7gOgns
	BcnAcIgkHN3QIy6Sp7y9XaTv5IPuNHgY0IU6GLDeMhS29FhPIhw1thRMVuanm/syy/9RMSnD8hZ
	bMO74/5iXLfKzjqnwO0eOucQIRxBth5C17HGwRK1Jm4UFP2nFBKIDdkNakwmmKjVlk70/KqByxq
	00SOOA/DdzGdWiBz/SfHhDEiISoHJ+3rPTx4vYGROkuF+cereG2f8rzeu+YFVxxJqpBigqDCAww
	cOEkNtkx+6K1n/hGU9v76Zrwzcb0BZmscdD9Kvxqdu3RqMvw5m+GCxQKairJW6gwb+hMAUIHsNt
	iSbChvKaRSuSYRs7UTclOn5nL4KXT11Xhq0Ojc+8tQA==
X-Received: by 2002:a05:6402:24c6:b0:6ac:b9b5:8e7c with SMTP id
 4fb4d7f45d1cf-6af9e2dfc01mr1113872a12.17.1790935424109; Fri, 02 Oct 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <20261001165018.415526-4-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-4-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 12:03:32 +0200
X-Gm-Features: AclHuK9ZDs6B0m5iPOa25sBkFhPAV9J-38SblIdwRNaVUH1MCKgWXAbykWfmkAM
Message-ID: <CA+=Fv5TdEtG89KhMACnRoYEmvahwkSrf2j_UjVsdxqQRqGq07g@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: default NR_CPUS to 32 for Wildfire
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The AlphaServer GS320 has up to 32 CPUs and the Wildfire code handles
> all eight QBBs, but a Wildfire-only kernel defaults to NR_CPUS=3D4 and
> ignores the rest unless the user raises it by hand.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 0fc61d986a7d..b5b02bb42aca 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -483,8 +483,8 @@ config NR_CPUS
>         int "Maximum number of CPUs (2-32)"
>         range 2 32
>         depends on SMP
> -       default "32" if ALPHA_GENERIC || ALPHA_MARVEL
> -       default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
> +       default "32" if ALPHA_GENERIC || ALPHA_MARVEL || ALPHA_WILDFIRE
> +       default "4"
>         help
>           The kernel supports at most 32 CPUs. Only Marvel and Wildfire
>           systems have more than 4.
> --
> 2.54.0
>

Thanks,

See reply to patch 1/4 for details.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

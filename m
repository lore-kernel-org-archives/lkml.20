Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64184E36E6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892018; cv=pass; b=BGr51R1WANPYyoI6XokCCm0eLLLfKF8aCBLGxpdxbeZxsEmUV3DKPNiFEyaf9X+B4p+hY2WkfYTt3I5uvDsv2V1kLky7sjniVeUBtX0iIU+z8pGlQ1tJSxfbsYUHWsq4UFsytLw6Uj/YS79j3p6T8mg9RjG/hey+MmpX3fg7Clc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892018; c=relaxed/simple;
	bh=nlBiuwlXGcNASPFgGluBl9c19tF+X6ZNB8Yow+p6fGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZHF8+8H1mwsoB7/FQdv8FsGtPavfi0kn19PWqTE3bQtxOx0OC/mW3UWmHMDAO3JIOnzh+t8TlNnUHgvda6eD7dW2BUIUJfp23KPlUeAHo4m5sqPch0Bb59kZFyIUxhSefMv0wsmAniHdOXu/ucEbeIHR5yMnuHhHaO6idBgVnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hstrYLID; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hstrYLID"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so705891cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892015; cv=none;
        d=google.com; s=arc-20260327;
        b=XRR6/ibBlrNga4MdwBGLFj3BaPKbCI8GYzVe7zCKOptlE72VfpcBZwnDZRE/FVaEQh
         y0TYLwiF1nLOIyIJV2Vx8rQH8ozuIWkGiALJm1OqXE9WsWUXyneahEM4DHVqpqp3HcpD
         7Ni+YtDXp4E3Amh86uLumkdoRFPNkvfahzhsI3VqPQ8HTQtinjRir9b6b4UwJ/qLEUgA
         16ppAqsX5D8BDoLFnn/T/4NhlNPJC5HbCJOLaHJpLleZSHo5hrb34fC9iCA8i7S33BIF
         MMuMLckJprnIwrwF2BsUPxsp+Vu4PyMFY3+WNbon1myQwPTexvNhpLG0Xh1f/oYd8jpM
         E+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e50qtwOpKMO/U4AtjtJKqyhM36icTenN92VD9AuVD+g=;
        fh=iA60S5ilY/H7ZULNbLCwnmUuXJ0n4q5pGhqytDVN3Q8=;
        b=NG9dUAIyRGsSYwsoRmfarR1VNLemjsNFfr1niIBhMnZEYrmUXVxp2NNp6R5spUW8dp
         OLg5XIOR0HFRHEZCDYvABiDnZqmwXHQLKT0VBRTfhjnYyeZlg1n49iEUzGS7ON9vXM8/
         VJG4oHGsk3/03/v/PU9sjQU228B4C1tZlgNMvAdZXBciDfrKn+Bfi/lq6yae9k1V6Pxd
         +XqbyhTd+Q/++OOZGtA59vsSG7a21hxO7njKmkI0tb2bL8YGHK82oYzirqI3hn6fM2Yr
         YlXhD/RiAtjYBL/nwM7yZ99PcgTYM4jg4Jr6lnnBToBjcnyAZUtUPJEOqW8LMbdVx8h2
         dsqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791892015; x=1792496815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e50qtwOpKMO/U4AtjtJKqyhM36icTenN92VD9AuVD+g=;
        b=hstrYLID2C9FzsHYlL8O7Ym+iQl0pGZ+8OsUTgKeGXhmjNDcvncwwMJXKAcwvw+fA4
         VCY2kiElDHHx884RvZcInC+kxi9fyBj5MvXfzTXJdnTf8Phe5+AL4g7/3bIHr5bheAL3
         ScO1dHDHRNaDAxibzC6HFLO3M9lPr7cY7zq8PitztZ7VKmR2E6cX2WAM6gS/C+F5vAhb
         ii9epS5CgbclIaQCZ70+pviJTZnUjV9CMVi8arBAs958kEyA//Lu6fSTivqdG+zjG7Bb
         bkyaVG7J9+lMkfCIqVbvwxOJfd7cnAUaoo/kQO64e3jjKv74yJ2kgjkeIFV4ptlQOhaZ
         Sclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892015; x=1792496815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e50qtwOpKMO/U4AtjtJKqyhM36icTenN92VD9AuVD+g=;
        b=AqFpBPBULMZwj/GG7Hf01azdU6DHeV+Rh+eWqCMHFif3/wDo1l5UQDZf8rXv0/Ctv3
         ZXo5aX14kxSFiNfyxOXyODabKaRNSxH7Er4xpRn1bgbk0oW71WK483HxWpebK1563Ipm
         cJlXYBgGjyxUXAUthw0IKhVgU7axKcbT0nE4Mp+mvndJuSyW+CoZisJR8ibeOgFt4MzQ
         Lmk5ZZ8DXoVVBviCG0CLXU0QyhmQcZ0/3VfhwLisUHk6MvAMzesGafZr6fLXVTqOMwsp
         VqoJQHV2046TG0GzzY7aIjtd6x2KNKD6lIKkDQl/vlAFpLvVon1QV93SmiTnDrNOTce/
         JdAg==
X-Forwarded-Encrypted: i=1; AKwUvBwzRUZ/VYhvMGh/LlLU3+C9s6Q12nsI2EJxSQmSNFnHk+PTvp4lOV7hzG7K++BGB0DfObD59rRgzScVTXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/LTekRR7KT2OWkYkdaGfqVzh3D1vd1NtuA5/Es4ZPLhazvQu4
	AnbK/MdC7f3Q5FgeUwtmlHwfMYgokSN0Y4X1QyAZCSzvrn5naW+bKeKz+8WNq6Y2kI5jtDob0NG
	GHirFXiDrPSk7Fjfe5DyrgKAccqrKBXOAiv+rP4X2
X-Gm-Gg: AYBFou1df8IFwgv0KIt3U+2flWiUVN4G1gTtlh26rewCoH46ECQ1+yEMn44sLtF1uA6
	5u/Ei5ZmSoHj7q22souBCnrUl0ycOnSxzVcN22iKCa9m8zPQNN3ZnKYIpC0qt7llQ3SKq2IzivU
	WXDcgVxPIbGKtjIzu4G3PA0zJi0NaGoDlSWTsOQ43uLnQ22Hc8yXjOEo08na2wHPdY2OqtURuHk
	MyzYv33YtnfQwa15VY1oRQQHClE849xg39SvOr0EOEYjGFQzvh83331IGA6FYrL8U3WstN8GzrN
	qP52J7E3ZgO22HovD9Tq8F2TMwPFIgWxnd/yzQoiIC+jMgeRTagLAHCyBZfEBSuszik=
X-Received: by 2002:a05:622a:345:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-535b4f9b8d1mr44577431cf.14.1791892014742; Tue, 13 Oct 2026
 04:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009063619.112313-1-hao.ge@linux.dev> <20261009063619.112313-5-hao.ge@linux.dev>
In-Reply-To: <20261009063619.112313-5-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Oct 2026 15:46:43 +0400
X-Gm-Features: AclHuK-C9Oa0XUvUff-bHIAvSup9whOwQ_UowMIbXZJ1HaUMoBUz_0yhskfwzJI
Message-ID: <CAJuCfpGEgTocqrdpOtkOfks-geU0vVMZudNEG5+XWi3sxQdymQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] mm/percpu: stop unmapping the CPU that failed to map
To: Hao Ge <hao.ge@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:36=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> __pcpu_map_pages() clears the PTEs it installed when it fails, so
> pcpu_map_pages() only has to tear down the CPUs it mapped before
> the failing one.
>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/percpu-vm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
> index 509d8901835c..59d3a336a6bd 100644
> --- a/mm/percpu-vm.c
> +++ b/mm/percpu-vm.c
> @@ -252,10 +252,11 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk,=
 struct page **pages,
>         return 0;
>  err:
>         for_each_possible_cpu(tcpu) {
> -               __pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_star=
t),
> -                                  page_end - page_start);
> +               /* The failing CPU's partial mapping undoes itself */
>                 if (tcpu =3D=3D cpu)
>                         break;
> +               __pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_star=
t),
> +                                  page_end - page_start);
>         }
>         pcpu_post_unmap_tlb_flush(chunk, page_start, page_end);
>         return err;
> --
> 2.25.1
>

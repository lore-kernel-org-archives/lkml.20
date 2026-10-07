Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECEB414429
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409084; cv=pass; b=FcdsOyYsTCxjdFfUnBKcLITVWyjwksdF7deWjVIopJ5x3DnRnV8XTK983RpXe4betI/k44iCVdOnJ3VGkk2epUoOR0Xlnz1cxyzYPl+TN8dJH+QouFSNDzZZWwGz9NeLkyfJzC1wPqe6ZRS5vbZsrVFJ7nTHJHiSBVOLiQif83s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409084; c=relaxed/simple;
	bh=NzcreaI1RFMvfvimJoOgzCzh1pxXnio4qwyB0Dh8ccs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsZCl8WOVSGh74cwqOXRrh1Z9PgUHUkodUX5taTVt7gq5L5l++Cav3GbRkOlMXhyueOzAClqU5q/oOIC8JK22AoCoG8OYPMmicYXJ2lfHKyvNPclDpZVmHS6N1XHdVgAnEBs5rMol8porlWEh36OnPVm5JjR4vkKpRpSqAm3iAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INdkZyL4; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INdkZyL4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso368344266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409081; cv=none;
        d=google.com; s=arc-20260327;
        b=R7X2fRT83AjVHCmPxq55+vW/YZ8hMjwavgUC4nTF779PMtlMZcshSTCW+XEwr+OxT1
         3e+Ua5be767R4q/jd1NEo+1U5SbaRHJy2iy9p7pPjVYacjEit8TNY6soxFST4uYJMs/Z
         doOEPssXBXKectHPgOcNVrez/JkD188MERBPsjnMf4MwiC91l27RBduEPJjL4LO33JyG
         B8kZyUUR8xxko3RAOMcH48yFyFzLHisUPsTGXCXR48h98VYfwYOQllmwwweYaHEGSYY8
         Oy0B3qQ3mHgINUd69rJIgNS4Nxu/aBrNBWvgXGstXIkfHBL05RWI5cQ1lf8Nhpb3aqeb
         ULdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        fh=khM2Q/mULm3YhkYXHSC2Bik4GJ4NXke73DjMUYgtGrk=;
        b=NDfZfe3FSPjtvxXpv/p3xVft6xrJbhj6H88UlkYHHd6I07JxQohP3Gq6jk4tZt2pFr
         P+VIw0ZfKGeeI8K7XVr5gd63OMe4a5I1d7WQZqCrp1oYpYlHlbH2w7CBO2CzfpU+xnHT
         z+vVyk/tTddjlOEJddrgI8i4SpWY5jsFioTsAlp9GeZYZjBj2w7LpuQAVFEjyyk/PP6O
         jstEdQas9vBhqp47V48c2VH3X1/g/BwOGOgExbUdj+tt3BlhOB2mpastiL2/fr0MiASv
         dJcFJ5HG4NX1pnR/byGNriihwfTvH13EyTTDlwYXDZxOalSLqyZz2vGmxZadGRMQFbFg
         Mshw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409081; x=1792013881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        b=INdkZyL4guxAzfAcKevUe8XHzZ6mx2QeicPqSko69ScnZqAy59xB1SeLhJW0QP6PjF
         ydqrs35E3Qsn0QOpWw2fRYNEdFLEVndLRQeLhdyfUR6yyJW04SgzC46ecPsRmU6aqasq
         aHKgb5ekNeLa58Nq/9GobNmHBTkNlBhngSeVcAuUW62hYTAangN2RELtoqQI2DT+bASG
         OOwBFSwBPuXJy+Hn4CYTboLCl+e9z2MQT6y0MiBfpJQVV7RE6Dj1spNXOO+wZuv3oe8C
         9JiuQ8RSaL2Y5q1ILH16CFAhdS8ltneBtHPKRAOgk9MKW4+K8FT4NYX/uDN7cC//rNve
         bP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409081; x=1792013881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        b=1btCprcNOgGWIuoRYv0ILChxhS4hT8h4sUDeZHeEoMCsrz2XG+cxSY8bmrJrHhmDDo
         a4YUxdQf349cNSSAX562KawK8h9GF8zW/gfsG9/oNHv/p8hK+pMnj0nZpjvTG/zHk7cN
         r6oPz37y6kolBwSIeSt/QS9CJ7wVq1u1uZV0awvVQFIZlXHJuPAoGPQm7z2R7xYTHZAf
         x83pR4pPrmEadVRY4FT+oE8MiP12rChKemgqDobuZOlEPI7mpS4HD6W9gPX24nXy+yIn
         YFrolutjtu/E8cKwQo7Bqj3iyRInCrLQnBNWDekKR1OZ1QGdeh0WPEB1jB5oW/vOs9K4
         EQNA==
X-Gm-Message-State: AFq9FYJMXY8gA5pv23DCSfJhumF/F+rZOHv83jFEK1KyHKyI+MairD8W
	QQtfwMrfzAQCRvqhqvcPP3uYB7K81Ec8wpMRdM601H4yfRAVbzyWRPq5TWQo7saragmNJGz8z8o
	z1GISe94NZ0bw4352dcWRofdhz6tjtBE=
X-Gm-Gg: AYBFou2/kBK5pI2JrZWq48DLp6J6jxVZgNqJ3K1+qsz4OhvmqrlJJehas2giPWQUQ2H
	IWKRZB9mIjKZVELLsSS6aufI47Iut0RY5cuvXKbcdqd7N4GaUabm4MUPNU59xBHWQxpZIbPqxio
	8228R6Oh24yQISHCaauJHXgcK1FMpWKiYaf0TjyHZr8HVV+62CfDsrGS+VnTeQnUlow67eWls2I
	ho/e++oSuZUM+LLChe1rePeqDyA5u2DzahV6c8HQu+dz5EDiOqpM4CRosZcsYH3NL4uDwZF8OKA
	ShW6aXWwESWqgWskg6tzTDkGhIFWooQz91zZny/hIoxgTet7C/1z1v3OenSFu+aWx2bVtDvZhgN
	0qwY5eOpP2tupoR0B8FchNQjbu2s7uVx4mVQfTaM90GVKbojIGkYcDV9leswRRoiBk+2qpzJSV7
	+VKsQ=
X-Received: by 2002:a17:907:7fa8:b0:c2d:c534:969c with SMTP id
 a640c23a62f3a-c317bda9b83mr348405866b.21.1791409081382; Wed, 07 Oct 2026
 14:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007212314.969336-1-voytikd@gmail.com>
In-Reply-To: <20261007212314.969336-1-voytikd@gmail.com>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Wed, 7 Oct 2026 23:37:33 +0200
X-Gm-Features: AclHuK8dWWKZmSjpIJHYzCSo6w3ggm4kF9-9AyeDKpnNH8fVKUNw8pXnfrlN-YI
Message-ID: <CAAX90H2mnKHb0ZEpEgqOkjHU0y5maUbevYuo17gV3BtmYNtbdQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: remove a duplicate line in Makefile
To: Matt Turner <mattst88@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Kent Was <waskent6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, forgot to add Magnus Lindholm <linmag7@gmail.com>
Link: https://lore.kernel.org/all/20261007212314.969336-1-voytikd@gmail.com=
/

On Wed, Oct 7, 2026 at 11:23=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com> w=
rote:
>
> Remove redundant duplicate line.
>
> Fixes: 234306038064 ("alpha: Fix bootpfile and bootpzfile make targets")
> Reported-by: Kent Was <waskent6@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222101
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
>  arch/alpha/boot/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
> index d8dba85e606c..1ac823d93801 100644
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@ -99,7 +99,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FOR=
CE
>  $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
>         $(call if_changed,objstrip)
>
> -LDFLAGS_bootloader   :=3D -static -T # -N -relax
>  LDFLAGS_bootloader   :=3D -static -T # -N -relax
>  LDFLAGS_bootpheader  :=3D -static -T # -N -relax
>  LDFLAGS_bootpzheader :=3D -static -T # -N -relax
> --
> 2.55.0
>

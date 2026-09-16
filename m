Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3D4C6536
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572852; cv=pass; b=J/LWh+MtAMFx4f98fZjDF0je5878mHxlre61/miC+8dcj/Ba+mPob3nJe2kGA9hYuZgSYZ/q+gxGdwTtEgJ6CSkFSEIcs0T+od7Zv8LF5TavJe/NpRyOgs3SwWY048OEF9Q/PSXssHrk5N8vMOq6z7u232MPcd4T9UM+jj8bL34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572852; c=relaxed/simple;
	bh=zZktuYM5vkbbaJAwKYlDDzrEkMORd47SKIFSfpXwcLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dx45QSxe/NAruamyKS3VUjAiqK5vJSTltG05bThjTpx+hS3+1UD2oyaoCgMy0/a9xPjPK5osGJ9NzmZOHpNBRMVrevthtpUwG2f5Uh9PG2+VKkjyIaDw7TmgpyJQRGrUtoLZsBZYUXQJtZc7WlNIgaxexsEgfzLDS2CDXpI2Tdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3E77TLb; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3E77TLb"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c2c368cb3bso626221b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789572837; cv=none;
        d=google.com; s=arc-20260327;
        b=nxxAvjKMoPJzXYgYoFbDpBLJHPq1+/4keMkUK32fOIL3VuubWuZT6gsvNYENngACDG
         Jx9NFa3uY5dvBg8WyeyvCkae7hU+WeTDnnTikBvKjaz9CPGWd0wsiYZKjZcgZJbntJfF
         kn5QgOJjbtWslIb+1taiSjV+Sx/ckRNNJyOkoaSfjRInYs2AzgdfG16e7haREt/Gj+bb
         aUedrP8bgfRKByolgY53MEBB74ECUYvoMKmmhoF8iqnK0s4fHGgWlbJEkEDvhAlLzXKp
         JPqcvtpM6Wdm6qR2R4hMl8evh+tl363PRi49RrqQ9pPJrOh+7XXoZk8ZFTNwQMVKOhG0
         anUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nXkNJ0W9DbPmL6Zr/GJxmR4Go8S9Arg4OF8y81et0Q=;
        fh=IMxCN+eJsSlJ24PQTuvzRihVEEHQA2QKzSDgjzbplFU=;
        b=LemuRQ6ZDISB32V9PE6soYYSz0JgPqGR8o0NG1KKr7zKSfDCAdUZGkxlyAOlt/ac3M
         caeEl2AkxQj7pE1RhjdLASa3+Pzm6mKOx8E81gCJMWyR4r41Can5RHK3DMnQpVzPE/dr
         IIbXCb7nPIXVypq21ywyLFYdHhTfY9Hzizpyl7g3ecr/k1tKxCYQlGahJdP7T32Yt71L
         amc1F1eMAd0gAel2h9RxSmR1eJIVQtpO4cGVXa1ImXqqXQNGiI128HiOJ41UXuCd21gp
         JekfdRgg4v2F7Ry4J5RK5U5/gZIlADQ228X2/+QdnTaHDjjKo1PEBLDdmnV0UCb2CjQy
         h6PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572837; x=1790177637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nXkNJ0W9DbPmL6Zr/GJxmR4Go8S9Arg4OF8y81et0Q=;
        b=h3E77TLbuA+xKn9DhvAVsPAK3/GSck3MHKLPyfLuzqhW4DeqnWeH1DIb/16b9FaytU
         aXE+ONNiSIDmVzIIsDgCQvw8IqnZSNFc+tC6x3Q/v9BLz7zOweIANakvGHuN29qXm6ZD
         cv/pqUBZg4OUV6WVlz3FVm1aWVRhth56upbmPatJlTdDKW3ivvJsNaQEevuF4gAzpuZn
         SUfvDqzBkwTOQ3a0nk3mMKxWeaHFeSWKPn/GcQpO9xNyhlSV5FD8cuyYG4qkXYodXG8C
         wW6gOVhbgIqR9/tWs6qPbI1Z26Au8J8RoOZ760gomMpTKN6AQq9GrSR+pCUrLa8JiMor
         Vszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572837; x=1790177637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nXkNJ0W9DbPmL6Zr/GJxmR4Go8S9Arg4OF8y81et0Q=;
        b=VnkGx2tmc/vjaDSzd1mPePCV2dlF6vWAOj6p6pvxNP0U2T8pnQ11VRCt60R5iSJz1s
         trC17QWJKWGoWBVcfZosxP/EYLFa0xZkEi9nES4+nb9HW1XHcnMFMoN0aGVCZDW/6AOC
         7ojQdLqKoLBv22eo37B+84U1bDJpuBTyuQN3ln0tQDeDSqEFCU2hyUXvnjQUCuKe8ImN
         nDvzsqGaTyToTdHMbxh/NvxkboHAsyb8Mv2G4CB6+WCTR64ijKJePQlsXfrzXxQo8fxo
         Np2S83zFZd08Eb4Vi9+MfUqoQaHu9e7DiXKLEp7vUPy+oj7b9O8Yx7LRB8Ve4jqnx72I
         QzrA==
X-Forwarded-Encrypted: i=1; AKwUvBy1Q/uvgYVnN/TKSyr6Hd4YasaipV4kUQjvnVWXLMcT693bxCdtltsx2gueg+aROogMwCemjNiH3onMBlY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxNSBwVHvL0Ux5PHMCShX/02a+0T3yX71YBGKXqMWWUOSvC4we
	yU3EIERyyjH9epyyrN4ajb1UgtfJd6dFReUa4a+FISzO72V+fTiuYE2gBQwdgris1Ac+RdWipLK
	ARJLe5Ska/mwr+wIc1kb917DHBlcUorE=
X-Gm-Gg: AYBFou0vauseQRsfnCqtwY54gyLYiu1+U3zW01N9dtrhkmoFVu5h3z0+70Wv0fzU965
	C68BYDpTmhwXjyyE0n8nbFGCIsnXydo6LDPADD5dZKuQVueOkey8LIzdbVd4KqCMZtUC97EMNNK
	7PcL8EqIpuRpTQr3zD/qyT28YECiZlRF58OPEKcppAS0Yg/EerXdaepML+BKKiFNakL7h2eMMn8
	CoWEDm/8VpFlV9zY2hTiaXmq5f7cAj5XA2o5uwgXMjqGh/jZ0T++GhI3puBQwoqXAxcWy0+ey4g
	FkM0LA6PFW1/6OdONwS+Lw6zMEBzX+541KHIXJTfqwNBMxdRc53rLWEAf/vGIQfQ65QopqZ5BlN
	NsLu3At+swFFf
X-Received: by 2002:a05:6808:192a:b0:4c1:2b62:35a4 with SMTP id
 5614622812f47-4ca4b209c35mr7149752b6e.5.1789572837389; Wed, 16 Sep 2026
 08:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914103009.3007019-1-kyle.switch@motor-comm.com> <20260914103009.3007019-2-kyle.switch@motor-comm.com>
In-Reply-To: <20260914103009.3007019-2-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 16 Sep 2026 23:33:20 +0800
X-Gm-Features: AcwNN1Xf34H8g-kn4gOyiQSOVYNCT8nY_Xc0awS-9DZtNhTPEXcDEx2JStxG6x8
Message-ID: <CAAXyoMN6k4Qx8sJCw_t1W3mMrER-Eo=FO3ZjHr3BbaxJDeW5Ew@mail.gmail.com>
Subject: Re: [PATCH net-next v7 1/6] net: dsa: motorcomm: initialize
 dsa_switch based on chipid
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:30=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
>  static const struct of_device_id yt921x_of_match[] =3D {
> -       { .compatible =3D "motorcomm,yt9215" },
> -       {}
> +       { .compatible =3D "motorcomm,yt9215", },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, yt921x_of_match);

Meaningless.

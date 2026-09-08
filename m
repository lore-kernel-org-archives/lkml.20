Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D72FBE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844049; cv=pass; b=Oq6Z7CI6jT5HK0Xxwo3vTsjkVwkRxasyBsgsIlyw3ncz1grGNfvj4dvSflhgD64eSPp8fhRi7n7yzNxq2TtemKyn2/kCUMRSAuCAZTfmzf+CQf/twOt0/LawKDo2G2KY7ipimE89IoO9UioZBD1GWvuTg4rLd/VXi5rkNPupo/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844049; c=relaxed/simple;
	bh=33JUjIGdXfYbDUsF96RQASpKcEREYVrs3j5EbpGuW9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GERooKkMhOmgjcqF3ibH+pS4+g1eKF9S1tYi8yD4ODOUD2g1po+LkcHYgbyyw3/cUt+hjz2/dJony2kMEf0D/Ef76F2VPdQkwbi53Hqe6OV1AGia18rlb1IA72N67ctnSYNKV52sGzsunJ72wlkFHvw8Rvo4D3ndV9K9XrZ/fbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlcfmNOL; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlcfmNOL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c259e5c22ffso313764866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788844046; cv=none;
        d=google.com; s=arc-20260327;
        b=pWySf+9B0UGiCSmmQAWSH7LHm5g/I5CFrJA9nzoJBd6fJqY88tS3sBHSsvNoMAniQA
         gT2zquqvNci+AfA3TIfB8Cbr9AOTVIddHaeOFdKsA0Xg8bJq5dlCwXrMJwpYJ0woCuKI
         nMfyo2kn4FM5j7YBz0u0KQiXcisPVsmKYxpo+Ff12u/qh8neIvqwftlBXb8RsEOeMJZ/
         KWJvWoyBs5pGdEF3HUTpmazys/Qq9axmXBnm5S9l0pe2FD8wo5/l7eF65jYjyu7ipMJR
         dq28ShSugAIAquxXzSf1MhlEifvGTYqEFH+vaN8T6BKrVfg4ur1taNoxtMIRwqPLJ6WE
         DWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWcBEnY3lcCoe/+fMZWd8DtZju2DWgUR7crGFV5Lj3U=;
        fh=ogCxugFSH/w/2xSfSGofzBVZNN4hx+nXJFiy26HX3rs=;
        b=iZEFaes+O8LfjnhANnYHEMxwfgyGkJx32QsGKeVokUyb9g5/iGz+AzK00AG3y+JOfz
         5QWffURZVzDG941pmNuQcH9Sgc9FnDx5bfr3dZBWjCCmu0Gz1hhlmxJdWE9lBErokGW6
         WY27qnr4SAorYIQr7GbcojTsXrK7VXg4l/I0DOTdtjVr5eKgKnKiSXnKWq1UArssxiBB
         VYi90+AErSq9h5YEiyD2Bvy9tv8lsobSx2G5c4tB40UPS6qv+x5aADXcToyLuFDlHHFw
         8E4PTpJ2vLXs4pqZlGheBURCRsp3yP20E7IIsxThNu36AtrKPu7dEbmynbv4C3KykSq4
         PMgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788844046; x=1789448846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWcBEnY3lcCoe/+fMZWd8DtZju2DWgUR7crGFV5Lj3U=;
        b=jlcfmNOLm2+NM9hWImc+sOG+/mpEl05U7BHKjRqGprLmyN3qjtv1VtEiqe41WGijoW
         Kkz3JyLfEefxC31NKJtSLvG+qHXpKOy7bO64btzfr3ZvjyHObteZyJpo8IOfgs5i6/rs
         fj/AhljVAOpZX5IEbaxSq6eJp9iFdyUwB8hBkSuclUrTHWef/lm06u5JPlEJbD6Q+1xQ
         AjGyFFzArvLGW3+CDPZZ13vJ8M4Nizt5HkIhdj61WzACy/jJjI36d0ZqKliyjl6WIsAY
         pt1Ux54/J7gxfrOSGntjKm6Fvo2E+mHuPdoYo7lawlFObeic5pbPMc655/4QzhFw/om/
         F6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788844046; x=1789448846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWcBEnY3lcCoe/+fMZWd8DtZju2DWgUR7crGFV5Lj3U=;
        b=g5NxGIU+CzOz1tuCVrVSbllZcl4BcO0AHoUZyPXcStkPR9kEXod4rILST0CTYS8Y1Y
         oes0gTWLer+YItfBGqvU/fgSa3bPpw4d9LkY6oE053Dxf+U1I6qI/h+u1IdkwmSJhy2Q
         Bi4jGIgXBnyuINVojAJ18LkJfGjIWJPod00xURkxLRu2Q3+W/SaftMhoNVSh+xBG3YXI
         sYdHCIZ/RfWGv5W5QjukGCD1g4JhvvpNd1C9NPdLPfn3WcK0mtSXfeUGd1A5boyIkSq2
         qkWxi1CUJKdTK20Dgk97Ou3sZJAEG7aveoFk+LLKh2oNZ7Z6ujoRDMb3muy1n3ih1vre
         lWTw==
X-Forwarded-Encrypted: i=1; AKwUvBzpaB6XJvQ5g1bogEI2UfXzxwYNOR5m/jSu5qWeb2SXyMggqYb0Eo5Yj8XyMMls6sSuBWstkx/A8t1bXrM=@vger.kernel.org
X-Gm-Message-State: AFuF++kvia51tHa6wncUVSa/+MPp/uTc9U1Ulfgz737uuTlnC+p6hVrz
	SdEKMRkSCR5i50jVTyHKXxmxCVUvCR/Hf6b8M7K+QEOlnAMo3NYnhbBOBsvnU7HWIiRfkTmHqXU
	hwoDbh8neC5KKnM24qdAaC9aClabyTYI=
X-Gm-Gg: AYBFou0kpTUAIwccM/WTGverD7aZ9LjsDPTSSYPEHWa4e0WYFD5f01MAasXGoUzYrO4
	qfuS9vkh2ytXJi55aDyKVgnCNUpB0Ot11Z0bME2pylUFTgJCSq1SsHdfydl+BfNoOMVOeRRDDQm
	rl4/j/k1qGhfu/PHp5MNNylsEIpyR+dEsTlyU/1TVvTMSE7Qp1C7aMEc5OE4oNjokrW8PiihfNp
	LfrQENG2hcWg3Aq1nyCg4FyLpuX6/bxMdzzfSbX9REpE4VaQYfGKeL4hYme44DAVke61XvH0V+s
	yn3ZsVC2nCQT8/yBVMrJq5Z9Ct/65oRWgWvs2Y1gAE9ExLdlAkdkK0SDY/BCra6cLY0424A+jdf
	zZg==
X-Received: by 2002:a17:907:3f8b:b0:c28:e01d:1d10 with SMTP id
 a640c23a62f3a-c28e01d2ae8mr559389366b.49.1788844045795; Mon, 07 Sep 2026
 22:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 8 Sep 2026 13:06:49 +0800
X-Gm-Features: AcwNN1X3IOriyY0OSA24PdS9488O3mnHRSrmRgX7l0MgKqibRONbqs9nqOKVO6M
Message-ID: <CAMgjq7B4YbKYvRJ8VSi1-gqL=cTGsF=M0GWMdt_tFgBtcWNSgQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Baoquan and me as MGLRU reviewers
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:44=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Baoquan and I have been contributing MGLRU patches and helping review MGL=
RU
> related patches for some time. We will continue to follow MGLRU changes, =
so
> we'd like to be CC'd on MGLRU related patches.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d1ff4c76496..c558d5370dd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17242,6 +17242,8 @@ R:      Barry Song <baohua@kernel.org>
>  R:     Axel Rasmussen <axelrasmussen@google.com>
>  R:     Yuanchu Xie <yuanchu@google.com>
>  R:     Wei Xu <weixugc@google.com>
> +R:     Baoquan He <baoquan.he@linux.dev>
> +R:     Baolin Wang <baolin.wang@linux.alibaba.com>
>  L:     linux-mm@kvack.org
>  S:     Maintained
>  W:     http://www.linux-mm.org
> --
> 2.47.3

Baoquan and Baolin have been very helpful on the development of MGLRU
upstream, it's great to have your help!

Acked-by: Kairui Song <kasong@tencent.com>

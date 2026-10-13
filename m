Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D53515F2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896851; cv=pass; b=gvqnlq037439/gOlrfSSyYwrxZWNkyjvUPodhpTmnef9vFharOo9WfG+5gjIcFV7r7V7Y0eOBBOKPTVCaehGAvQoR0WybKc01YSGxt73orsbGuulPLzhALfDeAgtT1JJVWEF71QbPElhlSJcoX+GPfIgN4UajqDcAdLX/8qJDio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896851; c=relaxed/simple;
	bh=6TiVNxxeDpdSAagBOty9+KDqgyZClTo7hXYVmhdgD4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCeIQYNDrpInemnx6UIwMhdGQ+DerSy4y7Lb0qQ3JT3Loqe2l+3sRiTemij6lm2kD2bOaytIYVBUfE8nYxC/dzRZV/seNzGHoVUUnl0dx3LsgvPfyuE1umAWe40xdJxK4w3qtkp7+NXyWNy98uyfee5O+jXuQ4lDOnfBn/AvEK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChCnLLDN; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChCnLLDN"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6767d92cde6so2538478d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896849; cv=none;
        d=google.com; s=arc-20260327;
        b=PdWjW2iR6cHiieA8aPaRLVbrL8+bFhMy0FYBGU7t0Jqzc7QuEl1ccDEpB0qOWG9qLS
         Pf8aKmfXwKDMpnqaFTeEN7Xe68LOYoBm8gsike0iEMnq+lOaixDzZjaA3/vLj2BLzUnr
         pFiqkXWntz073TZFfoHpp0xCyEaViFqi/vet2KIGQUTRdB3zsANVgQFZXOXbHEtx0zCW
         aH3QlCuoihVVaz5AINQepIxSBofIN5oTZc8jFH/lnQarcR947mq3FDVIteYVkWgCy/dY
         Y4M/UORwY/GcNzKb46A5q3th5ZZNTrjTt8erm33fU4JokEUe8YvfF5I6AFV6ORmajIC8
         U8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        fh=EdVgupDAQvAfxKjhVE7rcrbPgWj5H0mMOFFE9O4ACiM=;
        b=NfiC4ZdeLym0fQbe3+zVCWZZkcVLWvPcwfofP3Jx9ObGdb3YpfBeX2Xg0QSCVasuf7
         nDsH8KxbzltjB2IRt5NGGpqoSTYkXqnMXu76yWDj7f8X8S2udrPnsJ8LZzV89DCb00gi
         4KxCQr312/T2hIp5uocfYQA6CWpCTykpaMkGOtR+l2fRoQpU1OfdgGuDBW6GozM8xcSI
         awVaXx57HhlO+0t4WfLrOiDanpf00m3k8q0lyw3f58jHXFHL+p6/0MlWEDB4KEFWpSli
         0v6+w7JfTQ+t89kD/V7Z+1MX5BVA9bjKR+yBgpZEUu9+J69MbTF5KqC0/hTayNSiUhoM
         bWpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896849; x=1792501649; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        b=ChCnLLDN0HrodCru/tKtCUmKXKNwgnQaCvvNBUByqdBDCIQ3mkdmJCGpAeX3jAxF+P
         R+Oo89B+esq6iTJ3eV/5t9BE3qRS4VEfVQi9pgkqVmt4FF9u0zfVTTj7wNlyRpw5BvvI
         1TEhSMDZDbfk1ZIu5DcPfBqeOQ9+Q5Itab85rR0g7WWrIEfGe/WNZG9HXPiuVwi+skLr
         jFZPFRbq4J1Qi8pJaIgXl//pZnHFTo44Vhfa1DRyF/xMxs0LWZQs6rQYxpDRpQr18P35
         WhU23F57sI9D02Hzcp/l5i0TMBs4CxoJxS6IeQ9yyTueHAm8+WDXoDYChnuDJEmpQVhE
         xF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896849; x=1792501649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ncwg+itbdhvll8NWmaHzhsCbDAbH6eG1xlYXFmq6Oc=;
        b=tK6WaDbQk2FTh1DGFxT2cG/c6+WK9q7UDKOYwRzaFyPSfJ+Z8ALVjEXVmc5BQlCGw0
         ZSHUerCBJ2Tte7xiZSnY2SUlQ6vbgpsHYjAYYcNArRw26sstXhd/4Izjo2jX7NmGnVdQ
         re9iaIERQIYSn7f72kAa2DFW/1o96thkpYwec4WOKUSvsr/bQ397z3+A6SuacYiNB+5t
         +els0KC2Ywe6gsxAmX1rkPdDtq2bBXB/s8lV3bfMSvgky2+2MHZGcdudYsmuW+FMupTZ
         nTTgwe227XWmdUfoDjJIRbRV76NFhLdE/LikE8g9FpBnedhIdUhSAkUzCHAU07sBmMn+
         dF2g==
X-Forwarded-Encrypted: i=1; AKwUvBy9ue/AQ6nuPAJC6VIbEP1fXsJIN7TZsaUfHI1+fUkFA9lux4oBOCTzpfHush8BVxxb1BvHsVrUXntHPvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJixmLqKSoORe7hrD8mU1SfhS+Zmi8HWXiEVKK5GAIOYec9TATh
	F40a/M9Eiwa3srGRIjMaNjLSLWS6xHSBnqrLcWbPOFZuErNNpgLceG417cgpTLdHuTfgCYWz+RG
	gpAQeu1mLVmwEp6F3bkSTgAj8Kof4+/o=
X-Gm-Gg: AYBFou0+TbJjpT4VXcPypUCWnxN6J7bw9Je3KGU+OTS94GnNYSrVuHDFxunBz+ORjNT
	KY9sqeMZ4odagdvzxWPtXX0E9R+oG9J5lJBBlTjvmexhFpPfgC2gZ3J/ctjlkuvS8+4CeyzTwA4
	TOOpxKFosiU4kiVKFT1+DTikJ9rl91QjetQQUZvnkpwG1sBNObXrILxdCUhJLtwztLjCC/k3mpn
	RvY/YuDg1rE7ZOM6oLjaOu//i8Gd5DntAK3brlE2n/2Q+V45tCLlnxchZ+UXWgDpq4EVcw9VMug
	bFF8jtAxA8SXmscsd5nOPCTlLcQSUTtm/20/S3tjvLMg0EpyGrYt951LKz6mhNIjRkX7Be9Xg9o
	35Ir6z0F7
X-Received: by 2002:a53:ac90:0:b0:677:aa92:7596 with SMTP id
 956f58d0204a3-679362b5a2amr4638672d50.67.1791896849528; Tue, 13 Oct 2026
 06:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
 <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
 <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
 <20261009204554.GA778522@ax162> <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
 <CAJJ9bXzLgzZG+836_2+pUVOWzndSFNoOh8Xu8Pw++_i1RMJzOg@mail.gmail.com> <20261011.Veiquevah3oh@digikod.net>
In-Reply-To: <20261011.Veiquevah3oh@digikod.net>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Tue, 13 Oct 2026 09:07:17 -0400
X-Gm-Features: AclHuK-jtD50bA_uKkhScngguvSwky5SkR9YZhcx-GIvRlFpZZ6iWS7kxU1PPVI
Message-ID: <CAJJ9bXwBo2hqcov46pLykJcdWp_fO8r7bXcDEw7JdZjWVkRxaw@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bill Wendling <morbo@google.com>, Tingmao Wang <m@maowtm.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

mic@digikod.net> wrote:
> Thanks everyone!  We also received another minimal patch that I rebased
> and applied.  See the final commit:
> https://git.kernel.org/mic/c/3d8cc52db2f86b624308321c58513019f6b21eec

2x FYI

1. I boot-tested the clang PR in [1] and confirmed it fixes the issue
on rc5 and rc6 before your patch

2. I boot-tested rc7 after the pull on clang 20 and confirmed we're
good on this side too

Thanks!

[1] https://github.com/llvm/llvm-project/pull/228309

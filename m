Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16E31AA87
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604810; cv=pass; b=QhRM0G9CR+pFqgcv2RH9FfnAXwIUbu7KOjvPw90UQAeo52gizfYJ/uGeciA/lOFjYmIfkBbizzu61EO40oNFDrL+UMvcqYu8Px+oR5lDaKH8XlUJsV79XmiBnmTk4++PfTxnESq5haoYLMa1qoP4L7RuSpmSEjN8IKVOsc3LxeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604810; c=relaxed/simple;
	bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgc2OtMIy6/dESJLplwnrdfGKY/7/v3XbZ2Redm4GqEF4qpjejo1isyZWHz/wJ9IBuUxPOniMkJweCMcScuE4RTDA/oNYXFHtqUekLmR31mBmyk0eg5zEzR7lRVTkmJlLJipzsI3h+E+7NLCMgL/XiyChBskXK/xL0e3CCzl/Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7zbMB0u; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7zbMB0u"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1fe83so245608d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789604805; cv=none;
        d=google.com; s=arc-20260327;
        b=g+Z+CpVRaAQgNCsZMW/111/ezw70vMfLSNUFG2Z6LI2ilRUpZMLCAWcsFv9nro8ayC
         0EjJcdiWa3DW+o55EKoTBvBL+At9vKx52GJHPe+wkAuG50QghMqqGxG8Ig8bIj8D6VLQ
         5kPChWTI8HMK9YPwarRFV9YYnVm/NAB5ogo2wkSSODy6nmlRCNm095s8gzhmAXqJaMdD
         I4X1gP70E5LDI8I2Q14zzB41wgj0WH7et+SQiYBRPLT+3lw9ejYkFlLppnyn5xqmr+eW
         Za2CUALgApxoISwzsP/EhRf1KH9M8a//UkEyo5wDqvpRwPrbOfRwiSLtCfKu25Lr5tLR
         5UNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        fh=BgOkDSr9hLqO5wCh4LNrKziIXIUL9jwNgenAh1ccBzA=;
        b=XQQBBN092FVLd2c425vf/a2jYyRtF2gPCGyd4duE0C3XekRvlyEgWYdpfBkssBHhYq
         Ttssk8fJMo9ravSKiZRnSFW6Azg7AAqddQnvLD0AdjBp9WGvTV7IIOq2LDdsx5aM41YK
         srU3eL3EO44n6R7hWBDimwLtVSZoWj/H/PEk80G+BArvx+fMOz5/rCeRjEpvL0gX4wz7
         s4EgQL2fpkeSRi0HLxgS13MBwuMaAv2HKLVU6HKzuJ4jSRD0ODdZuf0fETlOyztXN/QK
         Y58gW+ocAxiy2UESfO90pS6IvBOeUL6eLEEKUdj1QoOAMDLIXGV+tNjP5WGISSGgbzSt
         KMCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604805; x=1790209605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        b=R7zbMB0ukOrSvm+sSvkK6bhpdf3R9H7NBii9uuxLZDvFXffAEMUy2HvZQA5d5aNWfH
         DZKXIUU0zO2MQ8c5WKPJE1XKVF9wbdzgOsEH6QE5asqErD7a5JoENZLx4CnTrgsvuzRr
         vcmZ8bKuexAuAp/fJiidb0W6zHP1eml9tWMRR0rn/rynjPM0qpYEJh5L+9sDtJH7JFSC
         /BLd1QJcfSXsd1xNLLBk3vLEWcxkOCqPxpVCX54SNCF6tEOlJ8VpyEBRyTsTd4G80SH9
         7XL1C5DKgvL9P3dZmz2VpvgEpzoV70a1v6mdIuwwH5zR/2pNu0pHoZfDhRJzJ1Tj89Ch
         0VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604805; x=1790209605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        b=cNKtC5ro2DdmlvTnngw9q0u+M7AZ+YZnDW4/y6H7qbKSb2U4h+FwuqOjTOXuu7uq0a
         mlk/6kujBDzMbQyI16+tDjuqx/AwoIzgafSnqzXF/k5XxspfPgyQhhcQA9/V3vx6xvjf
         Xz1IUabA6SCCbjw/BoWd/g5Eo3fHBd8zfZNrankqAaU9/7hKH7wXx+h7VOPyvq4+dLaF
         WuESeYvM8FSgc+eoFf58tfQRp2dVNzxuv33cn9c1vVn6KO2bAWDTAYKDBHmc5xJAQm4Q
         R4rXLlXy9n5bDik1DyeEu5AFsxMP1150anSanojwN6hpl1G1GmQ1KQtJa5nSQkICCgxO
         XNIw==
X-Forwarded-Encrypted: i=1; AKwUvBw/Zz8Vj90y+lnaIkwSHmDUbIHFSkH1Ktb2SwcFxxhHKqPRXn22xzpxMVad3aS9AVdQxITGGuWbpcBgOPo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltc3jX+NUJGFQ3r3oUfg9s4Zmo0uMRUB4QDOTP7+JhpeZNtmku
	2EraWntiSt8TG3LmYOpQd6SKQbA91at/LnsG2PNm6qXJdXCRbgAQd3B/c0m8p9bD+EjBaJPtI5v
	3nO5emsHxLmJalSNk65rwcyX7gpQ99VI=
X-Gm-Gg: AYBFou324O6Cd5yF4Xq70+fv0T3tvTJgoQPFEYWqecfMU5634zZR/q0H185lljzwRnU
	wVvFIRwK7/3k4CL4zjMnbUM1tSlo4jAU/8+ytLwpyc3keK1BLC+FZMDRTrGz1uKvuGKiMwyvEeb
	2VASRvQJxyc6rtbbK5OQQBLjIyiv0IIsDTnmncz6JJjS9F856Py+57fDOfFb4QdRKcuL7+Q86Gs
	1FQhxGShJlmxLsCLDUfsGe6DPPr5PfFAPbgt3vkX2ofpNbDIsFGwx67SUzxBaPlkIwpEYm34eq8
	GUvGdUPNMKRk1gjmmyu7jfQ17madWubr5zeyEiVUCtu9s1TsdhO/73b4o5HH2f0XZP8=
X-Received: by 2002:a05:690e:1c08:b0:66f:c1be:3160 with SMTP id
 956f58d0204a3-6716329371cmr1669803d50.55.1789604804788; Wed, 16 Sep 2026
 17:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com> <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
In-Reply-To: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 16 Sep 2026 20:26:03 -0400
X-Gm-Features: AcwNN1UJ2iJTwgwlT9180M0OEUFsX3crsB8-LF7eHYBnlBr14UoftWKUxJaOO4E
Message-ID: <CAF=yD-K5AJwgGEzmdAe=kwp0DuVX5pT=aM_hR9-hc-Jsv8L1Fg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:11=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> Test both setting PSP after TLS ULP, and TLS ULP after PSP.
>
> Add CONFIG_TLS=3Dy to the drivers/net/config.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

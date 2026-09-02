Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D9409279
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341718; cv=pass; b=N1ZI+CqW5YU6KAmEED1wj3MUA48eEaPhaau964Oo8F+T0JBugN2xy73aR2NCNaPDwymjjMLyLifFKqa7NzIiX7MeoW/WsPng/5YxkfKjZ0ixZBGHYH+IiXbba+Hr2vOPnJrM9u2GrX2/+2hSAlAQ31BxBz8AvqILnj4WQu4VG4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341718; c=relaxed/simple;
	bh=v5zSRZRbdwZ7opwlCrgpYqe35WmIs4diO7N/mAvW1iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsRe3KyMyyEme5vTi5qV7QY1HB+k6uGVZPPB5QmaN4+qu75/d7+FgHchrz1OBO5fPg+aAJJ4iCJbWX2EXJ9OjK9I477BbZ7L6htCus3H6PsvsxIMdmzUTCSne+wvkbM2TSh77Yzxjbt009SgY2Ot5O1aEA4vsxek14O+1oER6gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tA3jtNX8; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tA3jtNX8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1478785a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341715; cv=none;
        d=google.com; s=arc-20260327;
        b=E+uPK7A1jHWQPdSpUY/6AcTwRK5tZ2Wlbp7B8DZTXM8+fB03wqeSEAoqIXHFIeGVeu
         Cx/4xmymGFMbed0gXKYFCWgjNtIPgdq5wJZUshroGcuI0GidV4GCECIBvTVxl/yxxv/T
         lX4ugseCvAziKDM36jO8rw40ktKYgTcYhc4sl1qgLhJNtSdRzymOoTf70Caz/Ddl0e5R
         POqgv7tZkYEmZAWlRq1YfjRQelmEhAIB2IzJaYNNVbx51D13e/+DdDTlwVoNbzOXEulo
         7KmLjNPfUr8kozDirPDGxWaVKP/P38uM7fznWGXSWz6HkS+vNLLcQwS0zGaJghQoWNqn
         Yo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        fh=dJIMromEH1ON63+vPvIQ6jojlgDV9F/HItN5R8NmqKY=;
        b=Ix72YzewZedOk2+DpngBKQ4G3XIzF6tzPSSOhaZqpkEXPeXGQBVmOnb7cpyZ+LT/29
         7kj8ekbiJpc2R14DHW5MXmQXgW8EwCmibufvmQ6EwWXPBBppN8cjMHdaJcaE7VhXF2us
         ropPf+K44x3q0rjiGPDpAYSnVTbKLcLsi/L2T8ZaGHScu5Vx9Q2uGTt0d3AmCxkz6CNp
         hYc2p8aRehWaGq1v54Hh3P/enV9LAgh7nh+3SsmU0kWc6b7TfH5uCI/IedVDzm0AeQ9a
         DKRl8M9OP3lobdVpr1lwMSo8I/RizQ1lv2tzsSrCoEeyGkcSHcmJHm80EfNDpjOtV0/0
         1jMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341715; x=1788946515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        b=tA3jtNX8gSD7orD5aTrz36YKCEv5dp3euL9HeG2ZTKztScGcLM1vAtEkBwn1oQx1mK
         ITWrhn3rfPT2FGHX6+BzDvrmZE1Yx6lq3/YQmVMFUrgh29AfeIhWYLtUeyCWYCBekyhH
         AM5WZX6kD9UwowYvPLn7cCVu31cCXzVRZ3b7jJg7PJ9kgzXhZLIuBeL0v1ct6B5XeiR0
         F0ndwqRg05BfVyR0TyBXO8O0TsBh6PAsLXMWquiV/yq6Hw0cd9y89zL7BAguSCzoFvUZ
         KN40pa1gZdqxQBcH19JpSVXv97Ywuc2ADNd6NODS5UXMD+Ut3LR9QaJ/feU7KC9SfVbs
         BPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341715; x=1788946515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnX+ks6JV1XrtihYjiUlRtYYBl1wxqA6B4mBRtQH3z4=;
        b=km6m+miP+ioLNhEy5s+p6p7qNt5asl6y0EaeNbLkMl8yOqN8hsyC1QoFDJIC0ASuEd
         uWAzTOI1EjCx7GIgWEPSJBkQpVXQj+3pNL0KEqVsI1+3OVcInd5HP+jrUXondbZdmJ6l
         iLQ19YpL0nggMNp47r9UXI4ihvqKWvlhkLuOJN9wQFXN5slP4HmX3I+hzHYDMBKJouAD
         TFARvtasLixmaj/zKAoV4X0OmeTpBPuxeg2az8FcRyhhkiHjynbt46HmmQpi3egQtRJm
         6WC0eGb/jgCwSqwA4SLI/ArYQ7LQpaI1GXWIpUup/8KGfxlxLdB9GbcJFrgULPx0ayEt
         HJFA==
X-Forwarded-Encrypted: i=1; AKwUvBwePX/5o0SoBxzRaWP7b1i26p8EpjbuopztjJwdWbWu0PCpjFr6efdop7OCp6j/D3nI47AyyKYehszdg58=@vger.kernel.org
X-Gm-Message-State: AFuF++l+oOX1AHQGvwLF4St6PCY1pqCJlunzF0Z0EsXCGqn4OvuFrqvM
	wUbNJW3iHTAdXLcXijCHnff6UmyAbDYVAMHtHpslIuDPAkDTbSDvbOoy0RL8lhK8b04lKv4pIbc
	eDRTtYuJ11gPcWGJdFsMg98cXG8e6YS8=
X-Gm-Gg: AYBFou1tN/qAxFmdWjCmK7oEz8N4dRaM/pCHtxRuEzFaTVn4fjKUceyGMqO1puRNTsa
	VcM/UlETdgagSGJLpAGbN6ZnrH8V4UTvQ+0QkcWt6xhc1Lplz9DgymzY7MA/sSll1zeYzko/ERw
	Yr6tfReTJTQ/q+2B0B/XR8uVz8I2ZqTWDmcrg8kP1rJvLqZiioTAtxAbwp3tsynLkuMdpBSYqol
	4GpCuM8ntQIcs/qefXtyT7cZhrhMOmvvsEeHS7wL4gYX7l43ondy7/UdMYlgjGSxaMXqnja+Rqv
	I8NTZLV5Hhb3DPk5VZX03OycdgOGLJuaDPGX9Oa59plckgn5c8a8sVlPAd1ipdPm/Imt2+X3Ai9
	prJPQFegB1GUWsaQD+aMwiIjsfh1OPRX6tArihrzpQg==
X-Received: by 2002:a05:6402:4493:b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a6827997b6mr2384818a12.14.1788341714731; Wed, 02 Sep 2026
 02:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
In-Reply-To: <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:35:01 +0200
X-Gm-Features: AcwNN1WCrBpqyHs5YZzs-iDskP2UNe4cTrLl_49Ymgyr1yqF1dJ58tr_0kgjpAE
Message-ID: <CA+=Fv5ROhLgZ0DmZekFWnW=H50n++-jeH7W+dgrk7N50hKi_+w@mail.gmail.com>
Subject: Re: [PATCH 12/24] alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha's thread_struct is empty (all per-thread state lives in
> thread_info), so the whitelist is trivially empty. This is more
> explicit than the generic fallback, which computes the full
> thread_struct size as copyable.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an AlphaServer ES40 with
CONFIG_HARDENED_USERCOPY=3Dy.

The task_struct slab reports a zero-sized usercopy region, as expected
for Alpha's empty thread_struct:

  $ cat /sys/kernel/slab/task_struct/usersize
  0

The usercopy KUnit suite also passed all tests:

  # usercopy: pass:4 fail:0 skip:0 total:4
  ok 1 usercopy

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

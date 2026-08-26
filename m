Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519023D955F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748343; cv=pass; b=uw3OiK7NHUOPfRSYa7ltHkqEC6nWQkQrCyK6H++8RLm1+/PGv1o5AmsgkYs6j9X4NpIY/rHMkL8KQoskeTWA+PY0DUgLxLTq8btp6fXyWG0ObduzECJefr+5DOcEpRSYnoP0aFZ2t6BV8kPycLD0Svu6Jbf1Iwdd4f/bCBd0U1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748343; c=relaxed/simple;
	bh=49Pt13BHXZxjM4ALc5trXPIj+j4rJZpiVAjLyV+vEqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCnvf4G0AWvAIel7uV+aFXvN7Fb1+wIOmYlfy6YX8SH/orCaAAt6Q8pa2iS9sTYCM77voOe+jr3D+USxwh54pHjQWAXL4tjLgj41FFQUEtjiwdZr0aaUOG+ys/BdNWFknGCDSoGOUkHtAwPbQy/1AmW62bRr4ZEucwC6PsYQUKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eT5KCDew; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eT5KCDew"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384422b05b5so146696a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787748342; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIBgsVsuKiH8CORDZ2l8w5u4u/koxPzWneXGxDD3hu9iH9dEkVHRbPH2Y09pmZGfJH
         nSfTTw8I/0WUwr+bf3Z/puwi7QmloyUzN91N76eQty2FVHLq1JN51tRx7/8EsKx2Yr50
         i2LWMSp9EjlsXUHm0xyEolXmnD3atfG+8ZfJmtyY41/sMfGhGCDr9YPmL4tovs/fbWJr
         1EqQplkZn2ucOIMOKr9DLj2F3uC90xl8odGaDfIzRJ+k4/cdmrEjKjeoZXNd7Z7GoWw5
         mksC5iOfZ7hZcuXC4V3/fUerStjmbxz3S5tsxfL47ibWrs9daPrAIEwOb7SFLbQYhDPc
         YfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rehlg9L9OKEDKVNBASHXFjO/8t99DdcLutVFyfw9+WY=;
        fh=p3rf9X6H+U0ufLuQpLFHJm/GXUmYJU5f2mxFi0ez0s0=;
        b=gs7zajArfyUR3wc4LMcw1qN+t0ALaFM5PPLYL8/UOGZj3I9Tz2ur18duuxlXy0GJRb
         ZxGI+Y+KUTtUC+uOHLBYo9ggRCETiEJ0PddBRDYzS+O8vP/LSl76oQ4tqogNeV8c7U4d
         hxdaB3Tu/Itzm5aUKBisa/l5J1ISVynwD3gzZuQeeB4fXFyvYqRZHukndBppZgdPUmCs
         GxQfuW3Kvlt2Kocxg83IR4E604EvF61wuuQsqoV8dUcviKF1zmD0cLZoOIiOyWFN75zQ
         ehGKVGCfObvvt5dMLFHi8maFQJtlo2wA8MfaAOkhUXkFbM7eW/CphiLGFTiJu44kJSUy
         VQdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787748342; x=1788353142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rehlg9L9OKEDKVNBASHXFjO/8t99DdcLutVFyfw9+WY=;
        b=eT5KCDewro/qdS/fSJvapt5zof/nvT0m4FSpnYCR3QjV0+RI4WEFhaOepu+oQhd8mm
         0H3npNiaG+0UWzVG7qqKeD5EkZjsXVFKvRs29mrlbATPySLP0YfHyUF/LzkDDuFlGJIr
         aV1tZovBBoQoTSafJmF3tPlaDNzgbqnWHEBIj75PVcMSJ8gpVxYRsVHE45wocaoc2uWn
         D0pn2Ezx5hTzkmQkIt9EsTJZUyHmbnLBanzZlAempgLJBc14MblAYvKxkbcf1LhFQuZ0
         1jxhb8A3X7MksGHgcUU7144VKB6tVXLbAcJs9qeexYhJ80jh+nvHt/ObTERbOXG+IGVr
         sBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748342; x=1788353142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rehlg9L9OKEDKVNBASHXFjO/8t99DdcLutVFyfw9+WY=;
        b=GISAHvMdCCCtiGlvlFD7A+axOzxghWHiDY43EizJr4/jet1LX6+RKmA+46R5rOQz/r
         x7da7VyGgqt+Xmk5RjbUkbCSShI0UZF7tZZt7xuHhcY2AJP3q4ZEdKun6n3X6eYcII58
         S1HU7fOa3LRVX1n2fJKI7mdZIWm9SOndIPqAE7RNN7ClcNoPH80W+LpAaSwuTw2S9qDH
         iDn2inWHxsZjILL9DI4HAT1zFsqi0u1T7dWLhhqwOnej060MDfhdUjfCSitEeiTePDQu
         a9xr8pSbjMLK/BybxpFoXEFYtC/Vl4iUoJJ0I6tm04mPGBCmS72hnLmXfsG5Tq1XU1dF
         Ot6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrrvt04AQSR3NrX2/QyJnHUfqsqb94y5cvR2w88lFvvBpWg9y9kiXhVvvReLow/qyugG3Y3OVkSd30rnxk=@vger.kernel.org
X-Gm-Message-State: AFuF++lVdbzgLOwlkwePk3kRXhjaypzq6lisvnixCY6/2sJqQJeMZf8y
	jW7BgVyuu7PJGUVA5nIWem6UHMeqWAo8BCZBBj+u37MSnATruZ+bnysuEYEhgUKSAkbkCZbbe7M
	Pl0Dsqrl7kdZLH7qmV5ch4OpGDiRY1uI=
X-Gm-Gg: AR+sD10bfiKxHRFjWkvlTo+Awo/Fe+h08a639Wp1gHwMvyjuDBc2DLcyjT0WTgO1rrn
	YmE+HrbpMuGnbF320n6im/JW1rECQm9g00/x2vBePq8Pa7vH2aJJDLO0H5jMT+HxZ5NCX+dU+Le
	HBozOd8laE/v9cOIP4Hyu4SJHG+x4SWdnQhxrh+e7ai7sUdbMn9XiJZ23NvWbBEYqDBkSnS3wJk
	hKmB3Z0lehpuVEOr11U1jiy/pSEot3oz57zZHoFDaKuwUR5IQqy6FU3+gNc5q/Phojt6fCgVUBR
	4lpaRlOkqDC7SMEMHa4Z3hvZlF02W0xL6iWP+o5or07afOL9JQoTSOrXNwGMCIL6aJoJ1ZcNvgj
	tixm2XbbDSCrBUsrnGzqVwTnzfgRuxm7WvZuqiwRLsA==
X-Received: by 2002:a17:90b:288e:b0:38e:6a7c:abbc with SMTP id
 98e67ed59e1d1-3966d45e721mr6855576a91.3.1787748341497; Wed, 26 Aug 2026
 05:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815180033.8958-1-linux@treblig.org> <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh>
In-Reply-To: <2026082644-monetize-tingling-0abd@gregkh>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Aug 2026 08:45:29 -0400
X-Gm-Features: AcwNN1Wi4qRmt7UZywPFb9Mu4Qo0qCm21_O_0_7g9jDgE2jJYcKlwMDKSsD2hGE
Message-ID: <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux@treblig.org, alexander.deucher@amd.com, christian.koenig@amd.com, 
	harry.wentland@amd.com, sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Aug 17, 2026 at 11:27:41AM -0400, Alex Deucher wrote:
> > Applied.  Thanks.
>
> Any hints on where this was applied and if it will get to Linus "soon"?

It will show up in drm-next after the merge window closes. 7.4 material.

Alex

>
> thanks,
>
> greg k-h

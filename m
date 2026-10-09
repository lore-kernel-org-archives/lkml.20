Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795740F736
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535391; cv=pass; b=fzB79hxATleYVEiW47BBT152gyCx758SRfn5+ugFEQhYHp7L1JYWRVr5t0mHVeRmdDV5xlnEIsxoJxwoQWl1l93jKx1+ZznRUwEDGIJUBus8h5QYR+mU57JsfOoLrtLRN6UFJuYx+p57cKKqqI8FbyJ1suUiTgZkBG1cegp4nJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535391; c=relaxed/simple;
	bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DKOr/9S9ms/LERbrtRk40JMUZxDYPFhC7OB4lVmSBFfLGo16cjkH4xom/VqfgtYXBUzBRj/r2L9A7mA7x/ihfKJMP2vmOPFyTNowmDno9HN0LvdfTQEUBc/H4RO1xItilo30JC4VI/wcQweE5Psz0IlUK05WtBQd1vYShUV/dZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Db3nxIrk; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Db3nxIrk"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49e08af5fd4so2762512fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791535387; cv=none;
        d=google.com; s=arc-20260327;
        b=WulOcPj+D9mU10/VbkmyiajBHjvcUbC1n1DyzQCBoZ4DNlcJpcKMZZte+PpauWbHTk
         X5V6+Hh+TZVVyyfEHYcZw5bOxRA7xDsnj7Zz0UTJlZZzhV9NIaiiGDvd977PupeWasGg
         DQYX5q2BDy9Zt684uXULI7TZm8bcTOmv9eEA85v8z1yu1tBCEITtK40/WeCZheCoRCwH
         kM6aX+YVDk8FI3QZQyOjKCdjuhq/lK6vU7fcl5QVBVvRbaTr2kkOvBx2Goj0W3o58yEc
         m1edNYxMagPiNcLyNJ74KkKdYBjmHKpHrEzQ+P93HfKi5hUeXRbM5EUpsVd6uBEHEryu
         wmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        fh=3QQdyLnCLHFhH8fMZtfpDEufc8+YrQzlfCRGpPHLj1E=;
        b=YOkV0zu7NQSwkRcUU+v0ARKWUOpGrtyEDoKjx3JZ+llyju/k4TUTX0j1ga6KycIQ+M
         csppag6e5Jyxan8qnTjXt7JYBzvVm9d31JIfR27U2z2IPkVl5fpuJHmbp/aZBK2i6dsp
         mHmmlxkcFl+l8Y726ESJofVGSs93iCfGCYtzqoNsgRJaBpwq472/DKU1H9PQqMxDJzmj
         /byrMYsbbSYSGPt4p6xC/P/uQ2iuhdoyBGYACY550+8CvL+jWkfbdo9dThjkOVLF5Dqx
         fmodhnNmy11vQQCEPaZMNunpeaZRvUiQT0cKIp3j9HTVydp9sHKqLaAgpPw1fUOKAubi
         Lhyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791535387; x=1792140187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        b=Db3nxIrkXy40IVlqOK7jq8F3qZ8l+ykcDsFu8SbfqLyZ+Ke7Zkv3iKHXPGo8D6eDhA
         yt5HYdeKkD0AXMdarK2lkO0r5rKkjNK2KUw5bFqi7BfqL3uJBmK15ztBVEjlwSEFqAee
         MxiTF+XXWaBD+kuqrJMwP3rSPofv2mMuZxfNY0G64wcobuNhbFl7bLaVF+YbnGzf0CJF
         rrahL9f9O1+l9KYIyQJEvCxRi56CoP4RfHDbz62tGWi7lzGItSfvExmnPjwfBEeLuBwn
         tgtG95kyTDuBRlYOUVVvNqYrXK7/z1a8pv8E0A1gDFBMQpdNsmaLqK6608sagl0pWBC6
         ih2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535387; x=1792140187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        b=H7tkCxHn9UZcELpeShCXyMRqgP8fmzbH/Eh1dLmIJqMUpllbzD+M99Z8wDGSYT23NW
         B83RK+rNwHyPp5JuIMj+Iyl9db2baHovx8zwWIWoWa+Wi5bLJl6GecNrnmdAg0H1wgqi
         esk+x3aJWk3IaRH7mSLEe42guZRsnrT3KAVQgqu6vnebltROMm1Tn/ntCBQlHZ4yRqtM
         /9ZdnG+Sk0c+YJg0JjH883qchlQ+F+87Bwzr1Mya4MEx0aalgilvgQTIoVL7PWEsecPm
         a2VV8Xx4jnkW+LH4M0WuUaYyI/jEX3dNWcYrWkhS5VJMlRJ9z9EGhQvgRVCO2vTi2mcN
         ArXA==
X-Forwarded-Encrypted: i=1; AKwUvBx3nH3zsWH9LbW7BVDLV/SHmsIJyguAmj0LW1pU8FbDdR1jDHrt2r2TOnpl6/1ZhEp/ubdHAjtko0mFMjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq4eQcVwSasPY3Yjxd9fUJbuJUn8W3YZWLL5zliACBAq7Ea0ww
	hTpJUx+dBQTUMuk0vptaRahTO1sQ5dqBG6HO/kKR6TCbEjJSeyQfNw47eL8G8FXHTZUao2dmnsJ
	k133dXms6pICFOgRGs88ostZl2ppzDNw=
X-Gm-Gg: AYBFou2Hhw/uw8djC7htaDDsOy10+vOk4T+54fkzcVgiRVSmkffmnJWS9bV8u1fHU5M
	+LiyuqHUMMQqJAC6L9LGtU4bXw8nCQfLQBObYU6hNMrFD98cFOmjdPHR4yS4JgVD75/Lkry7o60
	CT9mSvSBDE1eZD3posXlJ52lmUd2WcFaxRDxmJpNH9/t8uBeit1h79/2z9uOXCkct1v/6r4UXBK
	tzT/QlFawM1ebLfOEpE7R1sxeMCsE2CYuzd6NCV1lybFdLmGaAIoTxJNi4PLZNGYehUTW0PiVcL
	6Utb1ZDApG3NP1P1p0/ykpa+VHg7GPxyE0XchfFJXWR5n6mdOCrmjRJTXuyIxKIU+hc=
X-Received: by 2002:a05:6871:580a:b0:499:f1a8:3ab9 with SMTP id
 586e51a60fabf-4a2a8ac1d29mr913849fac.48.1791535387330; Fri, 09 Oct 2026
 01:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Fri, 9 Oct 2026 05:43:03 -0300
X-Gm-Features: AclHuK8D7bC1DTyUeb58TSqJecI2U3HsXQZM7EwBwNebsAbq75ZmHussbpT2z-M
Message-ID: <CAFA5sMc+CSN1J=r+fXkD_0=wacVVFwk6xkgv-rMRFoyYv+xWkg@mail.gmail.com>
Subject: Re: [PATCH v5] efivarfs: add nostatfs mount option to skip QueryVariableInfo()
To: Prashant Singh <singhpra@juniper.net>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
	Steve McIntyre <93sam@debian.org>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prashant, Ard, Sebastian,

Thanks for addressing the feedback in v5. The cleanup of the commit log
and the implementation of the single data_race() wrapper for lockless
reconfigure path looks clean, robust, and production-ready.

This addresses the concurrency behavior gracefully without injecting
dead memory barriers, preserving deterministic boundaries for real-time
environments.

Reviewed-by: Jo=C3=A3o Guilherme da Silva Freitas Lima <joaoanandalima@gmai=
l.com>

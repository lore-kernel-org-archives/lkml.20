Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BCF3563F6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743292; cv=none; b=on6yjFI0dMmolx1pt2ftAif/zSw1Uv04rTWjJ2OQdRGpG8jzJKiAqnbx8+yzEuyQbJ1GIRKQhYFh1Dg6v4AfO+wndASzmJt6jB9NEK6sGz+qARlfoY5INoRVqbznMUf1PsMz+h2MPC9UT4TONOyMw3Lsz2ySu78umiHLpAF9pz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743292; c=relaxed/simple;
	bh=h18O+SaySqiJfWXkQgi+2YxSPMgTnZumWzfQX5Msk00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhZFtzVBJsajjh47bOL8prOXjfyxGYh4PRmXI+jH06B1ggNvYoLGQe+675rxU+XQur6Rymk8Qy+u68Z7ltxH3KSSzDiz7W+n9K9Z47gxwIcn5e7FdBAtwn+oZRnuD5y6y3DcF9Vh6ffFJBfU1eIjns9m8sWOizybkXVwglf0bBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IXtU4FBJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IXtU4FBJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso212588566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791743288; x=1792348088; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw1I3RSB33chtG0QKL8JrY9BmumlGZeHra+1KorIFzc=;
        b=IXtU4FBJ6D1AJP21FaafPs0APz74KINo9aZ7r4yJskfuB0w0Xezj5z6p8sAgxliC1H
         PS3r/gSaMW03fOqG8uI5unvG4gzYpVs/hEclFWQOOV1WFOax+jFZd9ZYFAAXOaeJ1F3J
         kPPlM2WiX4J58yMLclkU+s+/8q5fCfOXwROtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791743288; x=1792348088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hw1I3RSB33chtG0QKL8JrY9BmumlGZeHra+1KorIFzc=;
        b=V3ShWk5P4G32geNuVVrAUHk0JOAfhIe0piydYYGAiYnHzO3gR+LjyJA1+/ouP4DI2T
         kZa52zs/ez8T8V/XPgUxMkiEG5L5mqrrvwWw/XXzPAQdE5jaoSFcB1HMxA8He1hlDpZw
         QJbN8kn8nGub/Bxlsi5qyTX5w6VcpUdIcOXUWDibx3u8p0Uxqz2lWMM/gYMEWwjywBMs
         RoRSzTthji3hEQiBs1d1i1dxb2m5phlBYk+JJqyfBEt+8mPXI6iJ1a/Xnn2lOqi23rHu
         0bxIHHrK/ypx0qq/gTpbu630KozytGYY56noRsnIr2CBDy8NQHB5pr79jvVVZK3FaW2s
         FsBw==
X-Forwarded-Encrypted: i=1; AKwUvByuOglog9aTe2KJG+do217LnLiZv8aw6dRMriUu95h3YxIjC+RhryktGD9eWvi1DQfYaIEYv0cMF58mWrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3qs7hgVP0VwaUY9oMO4ZnPzaT0QvCAvcGW+UVWJiV3nXuBcC+
	9cBbP5GzGdJV1XGSglCyCzT49LtlwpKb7mMR+hnPUFSWgc393KPAtruTTLu6o0lqi2pU4D7YSgR
	r9iikn+A=
X-Gm-Gg: AYBFou3t6ElhG3Q4HYMsPQ+BcBK9o5YDN4jR1mX3KFk4htIXD27W9Zu5bXd4ktyIeyl
	C6OHeXNBquHLEaBll2Nj0JwC7V5dmlqKZDZ9YKEtmcumilGHFzre9hLfcfjoSvE3ZB2j+7IL+IE
	yUW/0hQ1gVWDP5X0nOXxmOdsvOfycwFFJOEoWlofVXsanTVeqoqDniLES7m6u0nl+D0z3yXqjaf
	j0BGUsWZOzazwx+OpbZBDS4/XVaViNkBRxGz8wFrJ9c2ljAz1fIA7yqNIraJ9KLzKOf0+CE1yU2
	FBq33NQSs/ByNngB0oIof8UzK9WsC325xJELKphMTqzlWqC6F2HlD+EZfkbITrsampmGH2NfESO
	/EF+uS43iweRECe7Kka9ZnBv0+Gluo5ieC9pwMQTlsz0XMxmt1iTsf+/4z6v5qp8lnEJWQclAQG
	CerEb83q/d5rRItQLucXGFkgFgHKE99LZu9A7P7c7EMDfRUk0Pt6QRxp4hMHR2xh0zXM0f/RMYJ
	V+8s8htGiycjbOqiTINUHkm9Vzat78CtUL+hV3UtX3aeu7DrkuKTYG5F4bW
X-Received: by 2002:a17:907:3ea2:b0:c26:1691:b369 with SMTP id a640c23a62f3a-c31a9f6ba9dmr879871466b.34.1791743288070;
        Sun, 11 Oct 2026 11:28:08 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5953sm383486366b.58.2026.10.11.11.28.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 11:28:07 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso212587666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuNcvNs21Ik99Zpl9BIxANxiZJ/LvIqVxRU93KqaZwMD4srQ9EkstWUdZaHmbXwp2AyY3TzkZ8sx5TQig=@vger.kernel.org
X-Received: by 2002:a17:907:9694:b0:c2a:704c:8c75 with SMTP id
 a640c23a62f3a-c31a9fb5434mr670021766b.39.1791743287346; Sun, 11 Oct 2026
 11:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
 <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com> <asuOoUt8XcOJJmSE@laps>
In-Reply-To: <asuOoUt8XcOJJmSE@laps>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 Oct 2026 11:27:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
X-Gm-Features: AclHuK9ZZkcGzqWxl-RpSc-k50y8MXfbOSwaLPKiS20tm18fuZNCUGaVqXXsdGE
Message-ID: <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Oct 2026 at 06:27, Sasha Levin <sashal@kernel.org> wrote:
>
> I noticed this key change with Mark's linux-next releases, so I looked into it:
> looks like the key was sent in
> https://lore.kernel.org/keys/31c98cd5-bea4-428c-950f-d38a43709245@sirena.org.uk/
> but not updated in the kernel.org repo just yet. It seemed to be a new properly
> signed subkey.

Bah. It's not like I need reminding about how much I dislike pgp, but
this whole "people change their keys without giving a reason or
telling me" is something that *should* change, and doesn't require
fixing that horrible program.

PLEASE, people. Don't just throw your keys out into the wild blue
yonder and then assume that's it. The people who *care* about your
keys should be told about it, and why you suddenly changed your key.

And if the "suddenly changed your key" is due to something truly
idiotic like "I made the expiration be really short", then you should
fix your evil ways. Pgp key expirations are almost entirely pointless,
and they turn from pointless to actively stupid when you then don't
inform people about them and abotu the new keys.

This wouldn't be an issue in a perfect world where pgp key updates
work sanely, but that is not the world we live in.

              Linus

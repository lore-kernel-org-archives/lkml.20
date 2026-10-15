Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52275293E4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072283; cv=pass; b=XOGSiCLkF/y0WSmTKbQ5EiNPKYu6qIAHUrrwl7rGfrZBf+/qjjJtyu5HB3g1ViSgag2O+8h6IWgKIorKAqpSf1jS+8afKwTWat/SAISoutjTNBcog/7c0mX6zpjOnRuPaHv8GXv/U+h2pQzrnM4+NYMmM/yosnQr6tLrYSfJWWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072283; c=relaxed/simple;
	bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwAhOKeQbTmjifFf++YgOpCms3y/Kc9pvYR6HAw8c7VbZf1da0/ycNxHw+JKPR86a2qXlvNNrrZ0mBJAZJWqPG1Rp4cr6TkW8BJhLLU9sSge+Tsng6/bscV4Z+wvBSHCwhY54UtWVuhEPCqM+7QJM56nng+g8ZUuZ4MO4lOsv4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ/dg9pr; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ/dg9pr"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so656643eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072282; cv=none;
        d=google.com; s=arc-20260327;
        b=H/eGKtY/zIwD1CiLChI4oCAFVqLVRRYBucZ9lFSLPiRHCEgv1WNU77YVHgHnjPwhRc
         WwJOU7S1pHFrOw37+B45TjhYtre8A/scrMWRvB/e8FvVAqz3An0M1ihYKiTa8sl3qyU8
         THSf+ud7Y/q0blfEBKiCI4EoF/fh7YJ97GI7p/q7LuwS+atOzTUi24eCw7EO2K/rOEIj
         5DB5EsGt6sUwtavX02w4Dku3em8AHhhcTn8gtCHsFFdlmTBG2qifAVhw0Q5HpXN0qi/6
         fUtkADfucQUI8MVlg6HUTqLThxflyt/kLpETLb/XI+G4bZku/1wlNDA4bVqqHiQuf4iJ
         g8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        fh=HlhZMKrq9dvZ1cFAvDc5zCittkd2gFVURWiwYs4T4zY=;
        b=ImCpaviAjqW/xSH9QRpg6kG26nNzkBq/23FqM43JZ4O4uUmODB5bGxIlkepn5eOxq0
         UegL71beT9A1VZ8rfmrM+LM8dCdmuAqQCUVEl6a1/RQow25SZSWsNbop4k7KHsj6ACmO
         0aiYv/P1B7O3pQX0H4i4ogLfASzfogIEDBAvKfq/2vlV5mD8ncvv4zrcEqO58Qs327tc
         rrxQIkW4KyoYj1un96mknGt6cF16El6hAGZCZAYTuCmMTtHB1OS1vkLKih8ksCbj9Zi9
         UtlnEDinc5QrWLozcCkguKyLncSPAYBITH+Rd+knm5Bsu7ynw9YHfna2UB/hBOfC4SFz
         LdeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072282; x=1792677082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=dZ/dg9prZ0KP2YvTOd18NiLXxQ+1dQTnLq550qLNcPZqjDNTOPrBDuhRZIxTUZ7O2k
         3j4QzXttFStyAfLgpSPUDrDSCxQFPp38Us0Hh2N5AKr6iljz/J/XGqkX8KeDuT0Km6qI
         V9fiEczcKgMvrCjdkkvM8GVPqDOdSHR2gq2K3bPy0BjXCMGh9+Kt/1AQ2Oxu18bd+RvA
         fuVj/ml/SjwMtWdLUklSshYhoChVh2lF+/ixP11CkAeWa3iT+oSoeIq4HG6wa91QZMCG
         t1fHoDV595R/J683rh2NDoAzXCZpty3rWp9AzRQL1qhMx/3T2/jacEC/PoO8YndqgUVK
         gFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072282; x=1792677082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=lbkyZR3LRPY+PrBpPwSusUbQbuOK2uDDM6Sp2t/4yeobL8CHACdyiwQ7v4OSuuK3Nr
         CuxftCD/R3vtfJARnrk49VQCxZzzsPwKUJsgOhYtTQDhHSepxsiudY4GwKw0Zqnoh9Xb
         EDfikNsQNXjLDCPKb82i3ohDLwZ2hqX9o9IrQ9QFYNTdrKCZToS2rUBbZbBLj25qcJpY
         gpaIYi8vGmGIv8b9nOeaTmVbtw/jEIArghiLeNDX4JA5DUmGHIxNhRUKb2N2Ltl94v/H
         FYpne0LTd4tXzPz9rMWU/byLLRvNdL+73ctKC8lOmEjvzXLN9vDRuEQnBSSn3pO81v23
         x5vg==
X-Forwarded-Encrypted: i=1; AKwUvByAC5G29B2gaUmxsor+uf7BQbMSm56QlMH13Fs/HZJEnL5zhGGwc02NrTVw4nppRqSzyYSx/U1P72EiMh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqKQZ0cjBebhlTEhhHnVmLXAZ2dwm30zV8JN9Faa/y7zI+pnu/
	3S91AQ3jNjLIb3/P2TxhPPWwrjDTi4t1JzSvkvXC+9swFAZxGz3W3x9B4JdtY+N2xGIGNPWe04z
	ZsBaqHvWkvQLh/86WwfC77m2p8sAADi4=
X-Gm-Gg: AYBFou3qF7GrZ0NtY4xFaJHtSA7geQK/oXdL3k9WZIXe2B8XjRdlQTtBEbDAWQncH6V
	qEo09E1OJYRlcsUHIibvx9E1abbxxleu+wXzYdsofoXKvcFVz84waHlsYzCyqh2OWeg+rJXOQmq
	QkrZGqjZJGthetPAZ1kSN4k5E6gAH4gBCofuGvvB45wDTXPlFAaqYK5oUSdGcrDBOjcmHBmcj31
	6a7badEDi0ETdfSPD0MK0CHjNtnGbcwTsNA0PCpDatLpjwXeqYJaF1YUGbG1Yc4+L7UIq110cBl
	v9RJRr10HBl37DmHPOJ8jxrQEt4w+ws/ORFTJrYICfhQym0lnyFXDl7kOsvRnLwFermAPYgfff7
	AZWNPU2KRX/Rl9yAfNf8uLUZIjqy6rEdONAu4jmCN015howQ/Q4x264BKVuhzrNRp7pBDWa3oTe
	F1y7X4R83K9EG06XedVHtZHyomdI62fkIGzU1xQhHXv7hNjHHY8PI=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr33438025eec.1.1792072281724; Thu, 15 Oct 2026
 06:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
In-Reply-To: <atDYWe9L0tv90Xjk@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 15:51:08 +0200
X-Gm-Features: AclHuK933tu3BAWh-cwxecRjdQSXXLVeGjwcSrIBo12nakv0bx34xsgXHhrLXdA
Message-ID: <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Sorry, what I meant to say is that the spec seems to require markdown as =
it's
> preferred format. We can experiment with other options, but then the risk=
 is
> that we'll break some tools.

Ah, got it, thanks! Yeah, at the very least the `SKILL.md` main file
should most likely be all Markdown inside (and of course the
filename).

Now, if we go with `agents/` instead of `Documentation/`, then I would
personally prefer Markdown for the other files in the same folder like
the `guide.rst`, but that is just my bias, and it has a small
disadvantage: if we happen to move things between `Doc/` and
`agents/`, then it is a bit painful to reformat.

In fact, if it is all Markdown, perhaps we don't need that file to be
separate? Actually, is it a separate file in the current patch because
of the markup language difference?

Cheers,
Miguel

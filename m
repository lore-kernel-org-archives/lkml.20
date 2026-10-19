Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A83D9DD4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396663; cv=pass; b=iOjINXNKOwJtFSXkrJCI1/ULDBbeXh9tP4Z0RVytvUpQAWCmmnKr18HIQYwLsfmOmfccyxezB2NEJ/mNNH7/qgMWL2FzkgDt7MiSjeH0Fs9+69/IvzptSujnIM2VzaWB2Xnzdx9sQ6v9DfCwok8MkCwa1pslFdbYwcyDaYUidgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396663; c=relaxed/simple;
	bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+0z3faj5KzBSq2Wdx30+N2c6ko3/VLIzLpW2tdZMCW2kMJgY54+s/Tg7b+2hq7hcyc2lABGeG6B9z/J60kBrsMRn7zomCM3mG/wxtxgGUgfvtkqB07V80lIgMjSEgaqGxvvfRRCEOQkTgImsUYtTxigkULS/Sj7ldpC8sAchzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTuflbtj; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTuflbtj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89f85edd210so776272b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396662; cv=none;
        d=google.com; s=arc-20260327;
        b=lPVjJ4s1iUqEEZXxMw9QR9Unbv5LQbwuLfOum1I2AzI0lKN+dN9OTQln/AybqxBpzT
         Nt4l4LXWPr2d7HEH3ub/oiHQ7LJMZwPZxCZB+Zyw/eEkntqVWdqlXz28uEb0grZlfic3
         GCYcpPEtFPnwHvpTpYvvepNyJuPrtcRez64MZZfsp9M/rILxnbIAyFeHQUsfCYaIvNR4
         N/c8tAhEhNsv+cHFbTY0/OZONEK2QoViat+WYY875sK0AuPByR9/SyNOWouR545g6cHc
         ODeFx+jsaD1KN53QUcGzFCX5WlyqkXt/MKKAc6mswpmHQtkOEcV2o+wsB4pAZ+6Kh7jZ
         kV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        fh=6VQVX/rdwIl84RctPeLa6vUZZEX9V2F6EwRWg6LrxGo=;
        b=dImjIHBkr5EnzA9GUNWrb5lxdMtJq/xJLzlQDyn4jGBzR3MHejZkEEzQMIWSutDAKO
         q1jRDU6cHDeJbIxD83Fy027aOc2I4O1QCynjDcCKJnQpOceP8dB8/0baWasxPYM8ZWBn
         r+keT2gfQ0RYkpkJ+axfkMhCys+UKlQMxYMfo31hVgf9IaXJ9+q1Hn+oMDHGzaL9Blso
         VELPm9P1SUSxHW/bG32S/53IbXUhoE1zOoi/nuIrv6n5Mas8Ugb4lnEYHlwTHrZP6h8S
         obKdoQ1mR3R0xAwFMG9v8XgOmNxhp2ffW1kvhtosNPMk6KueNZJy1K5KT+tpAjfOlgAD
         WuBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396662; x=1793001462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        b=JTuflbtjqRg0kNyO3t8Scwuwio0mdIoM/hFSJxzrmOl7mrVni/ryJ1Jpf1H16IaAH7
         EMJ8J1Hr/wyJumDoouhgMsbMBLETo3OdNpvvgwVVbpYYAvW4SidOU6agPx17dlPDPTzU
         ydh6yghiottVbZPC0+mCFnc23HpgJ4wh3xeyUf99hmxvMnDndGsh/vW7DPLmuAa1lyDf
         O71+3GHpcpSJzsFT4nGZzuFH8G3AXcmnwkgChAY89+qziSHkEnLVafHdAVleIc3KL8Rg
         kmYQeKLq+fN+7DcpJKDIemtjp4g7WJ8FerVImtT6nsyMJ0oM+qSTTFjhWgkdlDpv5qEd
         QLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396662; x=1793001462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MPcEmjZPn0U1HR0YqbRJlGEJNlJcmuvq9yIqrqLbn/k=;
        b=TcwNYqkRIUr8Hvqj6DxuGIpmtJpM3KVwDQ1UsC84/4aV5NCHqceIn+rZ7/2jg4oA1b
         7jpPTXsygptoF9gOP5rQhDlBTY5glGiv0wgcUdP8JS5c1oB4SKkoqLtEyZFlZZVSKr+5
         hwrxWU4xVO8DND5GwXfYycVt2jBuxmI4ymY8CxH9SmBuVoqE/qJVQK1CL7Z66VI4IPGR
         avYN768e487F2WGhJsGx+Cnh0IeDiRdb77J22ugIt4F6+le7DuSrTugVgscvPGTGNKdG
         Jn2QTPve5u1O+THV2d4/UgR2uUwwiWfufgAiyI9m2Hb/XGBOOw4zimiNYEQ2G0Aps8tu
         EeXA==
X-Forwarded-Encrypted: i=1; AKwUvBxxRenhxJAYFhBSZGNe9mVFp4d7i339EQ4PfXd6KG60ZYtbK5gz0jDAFLSmYVB3R1v8Duu4xrTQlohcALg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc8PsC80zrcsSnHnFGtEfjhpAldT/A8JdVlZw9ojAZ0kBPLQTu
	gSabiu40TTDuNMRJ5MjT9jE+uJKxt7/EfU3kP3gBedxdsKp49bOXKPlGq9DwPHIesEYL1wKBXAJ
	3JFE+HD0mAHMU24cy5C1VjeEv311WLM4=
X-Gm-Gg: AYBFou16ITZoSXwKuZ5n0t2Z3Xahv+5OLl7HfttCIoGdSHRUcMKEaRW4BUfKHkkQkbD
	AMD23x+unqS01GMlc4PKsCzLMbM8o6VorbyF8lxttAkcdsZ/U11stCL+EoTUqGEPn7YTKH8OMu0
	fm+jPvnVAoGNt6RowC8t3PK90G6R/tGTtXaYtGD9lDox7WiAw4sPYs4Ugj9XlNTZNIqbmHZy5OY
	rwlsU+XEuBgLrv8p9yv/eDYiMbEOQmXXTx6TqYyJ7yyX3JJP3CYFI/+Q8TmdhrsEZBqb9mAkFPa
	VYkbYujF66EhWSvTIxBpLoFKHADaoDYWEGlkN0oyBdJ8Z97Zvn0HtLII0g+QTz24hl17UfhH2YG
	EncyjJ0TKXOVIXVi4zc0aUpk/q2aR26vg4L+JI8ejcjwFGy/aOJejiWNDflj7woIbsrb5ioOavL
	NLPvnHjg==
X-Received: by 2002:a05:6a00:f8c:b0:874:705d:f64e with SMTP id
 d2e1a72fcca58-8a04ba30be6mr5022138b3a.28.1792396661246; Mon, 19 Oct 2026
 00:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017140827.290666-1-lukapanio@gmail.com> <20261017140827.290666-7-lukapanio@gmail.com>
 <atW_DkB9H0oV6U8v@monoceros>
In-Reply-To: <atW_DkB9H0oV6U8v@monoceros>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 09:57:28 +0200
X-Gm-Features: AclHuK-MehupUeh6pNNKQQ7CplFtLMUS6VR_BXN9elAOlhRnJMBhoDSEjrXhQXI
Message-ID: <CACi=Ov77_J3N=5UoY8A9XRuQgcprojpV=KahGQ9e3gZz_yErqA@mail.gmail.com>
Subject: Re: [PATCH 6/7] Input: edt-ft5x06 - add SPI transport and FT8722 support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Uwe, both make sense, will fix in v2.

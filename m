Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE72311946
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636328; cv=pass; b=GCD/LpjR1J1pKKz7ui/gaRqcek/l6rmtrP2SaK2TPPUoXL8QXGqA8tXEM4RJuZS9yUWBZvuVPIVkW7kt9oE14H7uAhTOvPS8Uk2RW/UwANEdXS/2MYeni56A1XXszQ8ATEcJpClnHgsIgm6DOpbtmWxbM2ttB+P4EceepgOvRyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636328; c=relaxed/simple;
	bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZnu7vNQ4YFF3zI5b+jHYlnrNXjY/2Cl+8YJtMQqSGdMmevMYYYJhXieBi4i9k+3QEYB9juwYUjOm4DEe/q7MZQT2DicWUgVkmF66iT4SQstDZ18VOhmIzQElGASNiRo7bDI1715zyUF5n5FrSUNBovP3475M59wSP4taXMrDmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFvh5E+R; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFvh5E+R"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso3506244a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636325; cv=none;
        d=google.com; s=arc-20260327;
        b=lNYgg75K+vX8EaefWegjsK8odTtiW7OVl0nBWy/A2opz1tR2bIAdELcp53EquF1cvf
         4hHhEDU36ABOQf3ijA4As7I9MkXqvqZoQPXjKiCvmd+4J3lsOTdC6bO+5Cl0+RNVTZy1
         ejFon55hZ90gNDzxfr6AFLAjWClRDzHQ1ihjmcbwXUq10VZgvilFPBKFgi2DGn5OQGyt
         e8pLgX00QZ/ZAUEOCGjJTO1eYSCPDgY3OnoxINPjPCa35B9/otX6mkw1Ey8xyjQ5FnnW
         3PXDeds9tN07qztSG3Zo3spO0v+Ong2HwTkS4Gglspt03VJSnaJilpuEm2dzR7/EPr3a
         rD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        fh=jzoJ/pFowCGv3IhOeMnfkBsGbaIT7fzr5tsoktNDkiQ=;
        b=D67/ms0SXJGBSUZLa3Zn7JXaPokcrbuR64TWZezdEmaILCrnZ2unB1pEHOoH6AbpUr
         1mB5lJ8Bjrv7ZDWpSULRo7g6gnBCfKomLeiBeTC4eKwtCelUBP+9slcC3CRNvQ7/E5Aj
         0xpgzf0yFBd08QalFExvB3mA6jJyiMfe3HF/clg4lUUI4dpp1I/teGI4y3OdXvK4fEMx
         gj6F8JvoQCPZcbDL0A+sGEKFm55IJmPJCdxIG4A0Aa8qY4vgV9vExAYe/lmraU0iWLH7
         8q1M6gaTZQ8q3xJpP1ku10ira5qzvRih9llOMuEWy50u/tGZwBxUfB4Jew3FoRDpkC+Y
         LQXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636325; x=1789241125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=mFvh5E+RfS4aNj0vy+YT58yiX5gXrqVTmIyvgCwl7s4+N8bAysfWJFRiBZchZHSZP1
         xDITBb9j3SypuZd5P0/6K4I5UmMSmoMBIQN2nBHdmVxV5V3xiJKCrfjS3oEchRJgz1XF
         w5WxNlnmLWbZGXXH5v4xtjVDWrsQwi8g0uNekvGul/R5js8SYY5tTcZ8NQC5wqgAl09u
         m/RDe731TzJzY24shmP/QfiGau42eQ1cYicgWaEg25xwFkJaD+Y1lOibwCgKY10QRrKk
         DqiY6wsiqdW0c4ykZY4pnjjC8Ad0sEsZKFiVFQb3B6NJglzTDtxQTdobzJbdWTbqxOfR
         6g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636325; x=1789241125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=JNhQCJYkLgMAA9UFmSUKYvSsAX+GEsNs+NiAJlVZr1gJ6rQ9q2xDHFR1BI300781at
         DytjAXq03yQ3XQ8KGE/QWqSgQWJHb7UhThuAAP4wz87MsUFg7ZF8X2u/awkjwQ8cksCy
         vr3zhJ+jfpSpBvX1bYCi4Qwlpik1pP3rslg9OV30m15TaNsbevjK638xOk70dKiRi18K
         Rs2t3i+YyEtha552WibC16ZeHbijuhcb1gnQxSrW8Bc7u2TcO+yUI5F22T1MsSJnr3zX
         HelM3x63TL1EPs4F4loz9CcVrn6ISEsqFl/xphj7iVdcRby7w6aQaCrk1/0MN5uSpLR2
         Mzzg==
X-Forwarded-Encrypted: i=1; AKwUvByWLd+jHZ9Eb8GJrsmfNtI68/XTcNLeRDQxIfc7f/U/yid/FoPJwqJRJI995XbwJxP3QHvQ08fmDynf8xQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lrXzT3xL7Zlpq9QRg2j5naw4b9QnVwn5z+trTS3fwCeAT1tUSv
	ZSlJAuGh7OQoq5hBjZiyucn/e7XUzKcTwEjyTEeR5+3oyhz8l2ZbXtkaW5EWXDsW7MmkQt/8bT7
	NpMW4X8g1ZGzEBwzeAeGjFa85DfNuZsA=
X-Gm-Gg: AYBFou2hfssOBbGEPWu7HuyWTFEJgoNzk9lKUT2QdrqkrlgP5Fb8QXMgGGFPSwjvX4O
	IwA3otw2ffduGH/uqILDgWCr4+mXYu3uw28nrLJ4oLjpGe6qMdfmliMBxFlh/WFgDe7NHAFYWMJ
	VxNp5/O5nvyMETx1F5Lf9ca+jttXQTNNltSWL9MsEpuGlwOMgpbCL6BZOyy3p0Mm54QVit5b2Wf
	wWm9563jGNCYpGTaT78ZsjoPoSIEe6tMVAk5HdMsWPmuLfhtxSAg+ZVqX7OTMdYiNHH7Q5KGPic
	lDrgWAfCdDh4EMxINOgm/7h3c/QejWtUNeXLI5axRx4Vr9QlWeXxoGH30ufh0Z/OR0izl2xA3mI
	OfZu0ESDr7UiUCy2MZfYfLNxX8SZfxoU=
X-Received: by 2002:a05:6402:42c6:b0:6a7:fb24:264e with SMTP id
 4fb4d7f45d1cf-6a7fb2427d6mr1836272a12.34.1788636324671; Sat, 05 Sep 2026
 12:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904123843.375633-1-linmag7@gmail.com> <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
In-Reply-To: <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 21:25:12 +0200
X-Gm-Features: AcwNN1VaRI4G-HQNxdXx9quUjsgkaAUNPekVT3Kj7muTqDDS35k5taSE0YYNcaY
Message-ID: <CA+=Fv5TyOLB-wWap6PCpMw646QnovtDV6xwqyg9ygpaBemXaPA@mail.gmail.com>
Subject: Re: [PATCH] net: tulip: use mod_timer() in t21142_lnk_change()
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francois,

On Sat, Sep 5, 2026 at 4:08=E2=80=AFPM Francois Romieu <romieu@fr.zoreil.co=
m> wrote:

>
> The current code may avoid concurrent run (#1) of t21142_start_nway and
> t21142_media_task. It may also deadlock (#2) as you have noticed.
>
> As far as I understand the code, current users - if any - may experience
> #1 (avoid concurrent run) or #2 (deadlock) alone as well as #1 and #2
>
> Users of modified code won't experience #2 but they may fail more often
> at #1.
>
> It may deserve a minor comment explaining either the choice or why it is
> not an issue.
>

Thanks for catching that, you're right that swapping to mod_timer()
alone loses the pending-timer protection timer_delete_sync() gave for
free. I'll put out a v2 reorders to mod_timer() before
t21142_start_nway(), which
should restore it for the pending case; I don't think anything short
of cancel_work_sync() on media_work covers the already-queued case,
which the old code didn't either.

Magnus

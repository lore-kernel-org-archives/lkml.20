Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16C33939D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412425; cv=pass; b=GUY8ziVt35OviikVjBacHeDo/WN3uzqvxBthScLajQrkonz/pH0cg2lQgqBY96nPNtMeYYi/qt+9fibLqn+R2jATex4flLjZ7WMjnCq+MhmHoqCpKjABLUPuORsCjBpWIOzYVd8MEaBbIKPO7Ad3C9nZZbDkJIGYHJa2IbFPx4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412425; c=relaxed/simple;
	bh=kBVogpsxmo0/RhaZ2vlQiWvq5XjyEG2JT5xhp+l/pqs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JxvtwDrAW+wLGYKvYNkRZUwKsrkSh6CzMCfDnIvqqLXnkMMArTs5750A0hw4WKNlouxsykh77bNQFnj2q1nMde/6B1DkFnAfl5JCb20bI+YQV49D9HSII3/94Rk4C1zlpV47/OK0aOmzpZh5RJay6gZDvcQsNqngh/Cpmt9mQlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU0Lgx/e; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU0Lgx/e"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84eb992a881so1716296b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788412424; cv=none;
        d=google.com; s=arc-20260327;
        b=gc6m58QBETVZlCYxgQM9kp8rz0MopH6RPWgHOiMqYkGozJgWuLNAQWiQtCbVUoEu0X
         OKVpwSVYlETTMRD5JckFu3KXf/TZLQrpwlavGaYmVyQuI62Yq1e0mbnBOJfz/ky10n5s
         u4/muBN6WM816Pv1+oM9QpgU+ub+fsU+1TMV/F948pSiyKpoaoMrKNwk+x7mPsWTtgRI
         QuMaPS3h9iBWULAAiixlmg///UjqyVal+F5QPyVAEJoDHSldT9xnyBk7qk3MeIJKCumD
         KpI4dhP/Apf3t3s2dStLr1QSWimarDr79MsSsE8gQQmUOePhDKhgCwbJ9pAn410iZSeb
         5Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kBVogpsxmo0/RhaZ2vlQiWvq5XjyEG2JT5xhp+l/pqs=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=VsH0dL3I36X7bP7Mg3Mp+FHk5R3LdXdZhnPDv1YcPXJA2ptVj+uo8qIMN9NyJOSMNQ
         UVSgO7CifgpJwuqIgCg048jihsC40HTh+42ftARMCEvGpXFx50mwalY//LU4BSY9Bmmc
         xLaiV5j/FmXm6f2Jmwt0Yve1PgG6IWHfJOuu/1EhQ+ivZlcJaS1dBUDmaqqnXJ5gR1Gh
         nFrWqTKUUhoWKFF93h8d+bIK7/BrhYIY9nWg1S1YzwgC1nqaBWEM1O4QqCaaMhV3Dn6X
         EBItrhFnAbWsz82/7rtV5unNpOCJ+HooA+3PFKklbvno6LXa51QcYv0AxBcCfdCgrtrl
         DV7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412424; x=1789017224; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kBVogpsxmo0/RhaZ2vlQiWvq5XjyEG2JT5xhp+l/pqs=;
        b=MU0Lgx/eDe+9oPkF+sr32O1X7lZQlFx4y6l7P2imyI7AOxCNfshO2lgQHwZUDF29e8
         /VUcTYcKfuUXQVkLMmiAFi3MUyq9Y7dc+EfPswiz6eZHtc9MOxLNCy6AVhlN+LXyc725
         HL+0xj3suOM8O8nLP7PJONAiKKD8/J08g7qvCB4inakXvKe97iQjiRz/30jmNzgY6qxB
         nNhXEqFwOpoanEiVWmj+9LhGNYKTfxW7VLFhJ8jbMoePDfAKPTmiBo77PJj+rhEfhUX/
         r/9QAilsP63HzvnTpxwkVSc8GDyFKTIDk8aTzPWCwwHvPpE+0ubxgs50IYcTmNstHg/p
         5uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412424; x=1789017224;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBVogpsxmo0/RhaZ2vlQiWvq5XjyEG2JT5xhp+l/pqs=;
        b=XLGbw6yQ1QtXIMbzvzoi4CT9JLYKAcYFKz3bDmwvkUBybau+jcGKroCWoTkwQu4Kol
         WL7NCu9h8Q2l1xkcdkrY+BvCt8H6VJHi1nik8KHPUEQZ5nh5+hAUuvzblrlKfH+BjcPI
         OaYh2pWoA2hkSh0QIYsgqh6OuknAF/5jBvcuSnQsV9X7TlsVHbK1ri0A34tBgendPJ9k
         eRORfUioav7l6un5lkzXn0HuAZ4RfTM8eK/roD6UOsIQVBg4plNFqih0uQsxQd6R59BR
         kpGs/FH7+xeHSsl/kIjSu1Q8nHAEMMvErSa3QWIgheoI145RTG6BgtVbOTVv07JF57Jb
         w6yg==
X-Gm-Message-State: AFuF++kc4ZNVZC6D05XuUnq9PxdrOlG4N9LeXIHP9HSYM8oEHwuuZavX
	88Tk2nj0aS9aJykfRSMmYsXPEP2qyITL1342bGN+Y7Hsx90MVPkKgpRVaYNRDYVWChPJwUG0A1g
	tBxtnx7ste883rZL/3z7skLg5OuoBhqmTgK6J+Q0=
X-Gm-Gg: AYBFou1izugsakTh4n9OsKPNdxu1k7KymC9q4Rw2ynh1BEJARrvuoKdBIdPVT2nLs9k
	iwfYaomAI6yZAeOaCn1EqNPJlul8lbrqy+1vY0kb75nCk7mEhxPbUe69tWDpPvPdovO2x6s4E+J
	UYU3dGajiacIIsma7jczMZDzQwfQVKHh9TKul0keqMPukBdSoHAR69aHm+61sqUmwfA7PuLUN7q
	7H6RqcDnoOl21a9w7puPcue7I7Nwa1Y0m72fZc6nDOo/es6ipLWjVbV/sWpe93rlYqcfHEUFS0Q
	vzBAg+TQe77JWy3jyXhPdUIqmHeBYE6v3KUjpXjKiPMW2kvIM8s/3EY=
X-Received: by 2002:a05:6a20:9389:b0:3d3:ae1f:d7f3 with SMTP id
 adf61e73a8af0-3d9afbfe94amr14330900637.19.1788412423963; Wed, 02 Sep 2026
 22:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6ZmI6ZGr?= <isxinchen@gmail.com>
Date: Thu, 3 Sep 2026 13:13:32 +0800
X-Gm-Features: AcwNN1WSWmJ7oOm-VcbX_MRRwcTVzS8GXRpZQJC6-XLM6A4mAm_vshgq8bWjJu0
Message-ID: <CAHoDJCR6pTNtp6zbZ7V3ewsmqH38h7O-thjaHEYTE8hAhKjuQA@mail.gmail.com>
Subject: Question about quantifying Linux kernel functional growth across releases
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am analyzing how the Linux kernel evolves across releases, for
example 4.19, 5.4, 5.10, 5.15, 6.1, and 6.6.

I am looking for a technically meaningful and reproducible way to
quantify changes in the kernel's functional scope over time.

I understand that there is no well-defined concept of a "number of
features" in the Linux kernel. One metric I am considering is the
number of unique Kconfig symbols in each release, since Kconfig
represents a broad range of configurable kernel capabilities,
including subsystems, device drivers, architecture support,
filesystems, networking, security features, and so on.

For example, I am considering collecting statistics such as:

* total number of unique Kconfig symbols in each release;
* number of symbols added and removed between releases;
* changes grouped by major areas such as drivers, networking,
filesystems, security, and architecture.

I would appreciate the community's views on the following questions:

1. Is the number of Kconfig symbols a reasonable proxy for comparing
the functional scope of different kernel releases?

2. What are the main limitations or pitfalls of using Kconfig symbols
for this purpose?

3. Are there other quantitative metrics that kernel developers
consider more meaningful for describing the growth or evolution of
kernel capabilities?

4. Are there existing tools, kernel.org statistics, or
community-maintained datasets that track this kind of evolution across
releases?

My intention is not to claim an exact "feature count" for Linux. I am
trying to identify a metric, or preferably a combination of metrics,
that is technically defensible, reproducible, and suitable for
comparing kernel evolution over time.

Any suggestions, references, or pointers to previous discussions would
be greatly appreciated.

Thanks,
Xin Chen

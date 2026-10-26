Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004245;
	b=ircesAos0AKNOeOwWnl0h3Yh/tbvt+pjcaZVTCk5fMsvzw5k739zlPzFF5A4XpiYJlSu
	 6QIAeFoQGUno/G9UB9Y5RaQWYIUARGvONeNgEpeHFu0bSiYi128rqxhB3Mwk0iF8aomlY
	 jMANRrwkRerYgV0nIATnFYcJRu/8uSulS5Q2/RE9oRVqYmvyasCI3l5hMNuVWOMiWfC15
	 YoBMEz4HzrO75mJUebj1HURX7jvUgTsOAircyeCpB6v5MrLCW61urmw8MmcdftoKbFMnO
	 C5lygt6khU4UU3wBFAMKpsrdpRT3Yxpk1BwEV0jS9LxiiLCQt8cJZAx1OzhDeDmahfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
	b=Ek/+swGeL9B3ID7p89I88r1j1rMLFd0ez7yljpk65vkgS6PJ38z1gxC7e89a5qW+VLep
	 T+qTQ74eseUKa1P/fJF7Gm8d/fYtsfMyXzLVmbJiGjTm/K8MVRULlwxWA/Fbwh+hJq1TG
	 ndExMmCGAL331ve3uKKAvSYP1UEVLExrN4UD/BapxSLdZy96aBbNj044qS1GrLMUTA73W
	 qxHuOLuRR8FHzAeyJgRePZAAoCKEn0mZgmu94TePBoO2fGcd4pLP4/SMgqP25cVw7vcgu
	 /oApOhdVqAqYqTBgpyoIofc9edtknwt0q4XROlt/ufc35p3mensNZtrP710LRImx/hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CC6606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CC6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f036b17easo7457772eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004244; cv=none;
        d=google.com; s=arc-20260327;
        b=NsRKqeBrkr4OO8VpoZ6J5thB1cSOXZpsuwIboO4Jjh/a/SC/6KNU0/Tg7TJTGjAftZ
         48hPJD+9STH+LqJTH8e9GakDRNPkC/vUx/pB219PuYxoMj+PS6Ejec1NLKjipY7+G6Dw
         F/tktpH/xkpIpJr6Rjj7beWJUzigJO2DmFXsQDeYu82QBBebaghZsOebEGx32GnvGER3
         lOtjvX0XKs22JSXdD35ka/lm6wgRgIbQkleTkg5S1jHDOBJdk1MoXB8L7LFevetItLtI
         nB4mwS6tPGzLVb18EACX5pfCNPZ68z0k1DaDXCtd5dmNCvG3XAAHSY1rWdheb1Wt+q3s
         EBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        fh=4BzHyknt7i/Rf2G6lnpdL45CbdLZSuJWYNtoQYVu9/I=;
        b=r2qDKJ1E5CVzJYn43LVzLti32hrRlWMUPg4UrSeKA8oBmNwKj8Jq8ZgpUbvSAOzqey
         cb9f9ZRx/nXXlvqESahoBmU99w4Jlm9zuKSC2WaDJngUN1TsaXAG8j3MB0LidlaEEXYt
         2iEVZ9FmRaOtIllx2tYXE0xg+PK7iYmz6XJTLu6jYLC/a2zdvCOzAZM3lQKzfu4ojssw
         hHot9nsMYddW4Xoy69MuVQfjLXJkUUDCB4JFvrYsz3vcO3iBPjKhqepFq0S+utCaZgce
         iUTuAQluWWYhA9dSj4ZwwVI/4FHPNHSwC8VaGyt+dTt789FWD51KQQMKtwGjzuUtIdlL
         8+YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004244; x=1793609044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=DdEl3zIQt0j6Wl24x/rH/CtH549T/6yz3arfh7UpUrcj6VkIpoMyYOJF0NDjpQo/t8
         KnIkRGw3mQKSuSLcmgmm1QRxFD7nafFegrsx97gfdpMPw9bSIdSMJkgN5ULAzH6PPtJR
         +1211R5Q3Zhp+ThE+b19e6KHxhmdDbYmR0W8ghuKMj2H4lP20As3vXQ213+vhFNpMZcs
         fzuE65p6rZWd3qQGy9q9CvG9GkFrGbtlh5Caj3W9g200O15HUM0hg1BMgN74DerPrTbJ
         oOhZzxb0gPAZQ9lk1EkvIZown3WXZ+qA2Xj8kSrVd1RwXvQviFh0pvX8/AIpiShu5UJ1
         rDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004244; x=1793609044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=qCcnx3E8vEn6Yv/tZ/bSPY6UhTUW3zqY4jK6f5yGvuCJxbGpk788qIWcEBUjpP0ziu
         7amiTNcEdHulW1R7NBxkrwdtYOScENX6YGY2y771/ueTbuAljSCvG6ciZdam3BRgHhSV
         Lbu2Alk/R7VHuw//nq2DOfFzHKpAxmmrO+Gw4P+OI+2y2vCiY3FToQWsRfO/kvurzcY4
         GZH/W+9jWZUzXxyL7TCzdrokDHEBCEnROhDZpBRRWmhiosGjhaSRE2hbbcngvmmKW5OU
         W/SaO5o7yUvAzhqVF8F+OOFm8OvAcoo4ClfS+I1Lwnagcf27Ni/Pnf0ETZibOwauAzaW
         KQwA==
X-Forwarded-Encrypted: i=1; AKwUvByWpXwFMyTM+jrvRoKU2sxnalCH1Le73ZQt5OY6tayb8zavdrY6ZTRTZ+wWIoeIc2UWE7cmd8fkswwc42A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhZreZlm1d6va/d/10cmZE1wcL/UMUSy13J11Lc1FF34bjdmdj
	yRzCjN6h+6/0fnUrUNCQ3UtS6ItNaR5YIh9BWcXfeU3QJ+4Yb+0CgTyHbAaM8brrhrW7qAgc/m5
	3QzCCgWfl7s18TlEhT8qb4ykPlZ00Ca4=
X-Gm-Gg: AYBFou3jFBvglN33F4X6ypcGD478SLtV7a+ECs3bLSBp6q6MarvxgJOdyS4cZhlObRF
	UWgkNULKc7ducXPtZqxda8RqrNi6r1iEhJOlRR3uFwzByK4qReFi5e7GD6nDb2cgSIH6RuyYnqZ
	yimpFYcQIQ/Cww+vsedpc75OCkFNgGXEckAELjn3cWxGyDX8pJYN0Du/LZ8GXY8SMM+SCqYmZ4M
	KDOOGaYSV65qrYxjbmNvCjaDKeaPI9yglWnSyhC7+vh01Lt2O5zUA/jTpYtKyaTAcyaMqwIX2ZE
	8bayfxdRA06zCE2F2fpsuSwqf/7jR8U1UxJ0lxs2Q3h2q/6nUY4koibI9NwcmbCny4yTm62IpIH
	/jE31T4usZPlhpFCmPU1+hcaLWZXVaJx5OePTYeg+elvF/5rtJT81LHgEGmFcd52v/eyMVg==
X-Received: by 2002:a05:693c:250d:b0:366:8efb:bab9 with SMTP id
 5a478bee46e88-369e848362amr9301864eec.11.1793004244117; Mon, 26 Oct 2026
 01:44:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
 <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
In-Reply-To: <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:43:50 +0200
X-Gm-Features: AclHuK9FgW54R73JYrxQZ7QKLMuuRD6TDEnSd96dbrON3jVaOynr209LUb-EVxw
Message-ID: <CAPVz0n32UN5QtoHCCJtHtdcF29BYcP=2pPnhYo3yYy+2pBioDw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Patrick Fischer <admin@tsv-stahl-riesa.de>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:1=
6 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 25, 2026 at 10:45:41AM +0900, Mikko Perttunen wrote:
> > Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on
> Tegra114")
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> Sorry, I replied to v1 earlier by mistake. Carrying the tag over to v2,
> the code is unchanged:
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> Thanks,
> Patrick

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T

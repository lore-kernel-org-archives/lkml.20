Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7143E5EEA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697763; cv=none; b=oNykgAWEujHJMzZwhvlGTsQjND3MrRpW24zQnNMBwWVErPSBz1QkhAzIdAEvOqIqWOCbISl74Db5ZIxZQUO1Q3GNYrA8uBFs5J9dajftzo0N73F7d7ViZDkgV5mP+oIwpA5/JBn2y3QQt6+s4EkRyugY37faXWaQrTLQKyBjams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697763; c=relaxed/simple;
	bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iqW3gQtQEhZws2mq4d8rhZ496B/XaliUNKS1+Hhsq7lNWLkXIfynN8NCPusIjWNGUcfe0SoxqnMs5uwW0ghZLiG3SfnA/E+ExerMYRmxlQ7WeIvEZbpvI/BgVvaqYVv+FUwtwS+R12Ha+57OdNK/8h3QzIKa5n9A4LPJXrFO1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ulLNU6; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ulLNU6"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso1780558eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790697759; x=1791302559; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=p5ulLNU6AUHHQGRv5QVKDaoagWYLpmK+RZcFbDvnTwZb1m5FB5FUqZ2D2KTxaCg4yF
         YO6Na032DcGh6vu0i/NA4ecDP1WAOtpFYgGAbZFnqq7cEGAX1py82BJuy7FOik9uB0f3
         LGSR7LfSLrx6t+sqfhZQznvYZ0BTSgZoYPqG6t/Wb6X8nBI7kl8VXIz/MiazE22uimlX
         dkDkggppTe0iyl+a0YMv8ZPhdx3mF0RKFkVLBivlaeIL9SWXqdVbttlxqwVUNo8RALNz
         KOZXD3TlKGOWes0tal9qKwfbpIu6gheEvi3HF5izUSNCUBWXSF7Q30offSyULglrwKDm
         e3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697759; x=1791302559;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=sWi6S7nHXDdKSxoI0/xbm80MkneczNGr9YuPdEsgYJiBYM/BQLmkQNPu2dIPW95j16
         kWpH2zTiQ3YhkxJ95mFOAi7cit/YeYK46mEdpL4rsTBvY92QBRQ1QNogVT2Iv1XUuajZ
         b4zH5nxl4RatDYk5BS8DjAJj0KEoYM8A58dI3KylAKMwfiMiOt4PZY6irsEI79M1hBQh
         49cuusAUij7quUf0rU43zcso5BX+Yg/4K26iYhihj/5oFlxzTnaT5la4aD8pnK9yQN5f
         dZdj63c218zo9ksMcmxRvMjrEIkmbOYgddt7pHKAXEGSMdD75u/XiLa3E/BtX1vtCa92
         yA4g==
X-Forwarded-Encrypted: i=1; AKwUvBw4NE3w4p4vavoaVoWAoNolP1d5FtbRpYhYaeCpnp0XZIZ33ljBbFR9BTNOKHkQWCa+XXklIug/k+jRUUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrRSdClHfR5ibxmw1X+hc2ryXNU07OoeHPpNCweOS1KFn0sfPg
	ycW2/WcG+lgq37+s/1v9xSxBKfrifvsPxDjYi/8YIK5LSLCPDLJYnb8=
X-Gm-Gg: AYBFou2oSbgbr0Yw7CHbrj3NiPC414wgN/LDlJaWCogsaHEpcBfO8fxi57ugX0m6Bpa
	1sal4iJFr7smEqs6hXlMonNqvritIQc5zYAdXOe2bLdnvisnjOHYsHLLzD7BJRTc0n/A+X+tq8E
	xN8P4jLe/IAiRwsDSiOPsb4rYBXS2GXAEPh5BiKmz+r4Y1Pc3ftB30MRudGIPm2fS9lvyClaVM4
	QCP7upo+jsmmh0mcs3DE2IrOk8cJENw3rnjBQqI4t4TYfCIAPr1Ke0nZIAvaTyb4cU50Gm1Qypq
	Eb7H6BBiL0ubu5gLPitUWGkIZdtvd0jSACWHdJZIAwZ+Yf07udx5xajJKsdCY0AUykdp9NnpzVL
	6ZjX0B7+16Ck1BW9K55SQbLCg+NYh2mq9yXqnTYawUPBQvslYZCXkMZAJuFoqJhn5oguSMAyNB4
	ZtdHN+twTyDVVvL8uN+sogPn4z4cTRyRhx/k/8tkFsUkPbg2jER0L1tqqJpNK+Nr15UXnPIjR8R
	H/jQxeQiF91/Snj93xA7Uu7+FIlHoPtoQ==
X-Received: by 2002:a05:693c:6215:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-34274332a13mr17037361eec.38.1790697743023;
        Tue, 29 Sep 2026 09:02:23 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350c0d0fsm329394eec.4.2026.09.29.09.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 13:02:16 -0300
Message-Id: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>

On Tue Sep 29, 2026 at 11:07 AM -03, Nicol=C3=A1s Antinori wrote:
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
>
> Changelog:
> - RFC patch: [3]
>
> 1. Supporting `#[should_panic]` [2]:

For some reason, GMail is not letting me send the first patch of the
series as it marks it as spam. I'll check what happens and send a PATCH
RESEND of the series or reply this series with thah patch (I already
tried that and failed).

Apologies for the inconvenience.

Regards,
Nicol=C3=A1s=20


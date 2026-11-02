Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793586342;
	b=Mc3pScKM0CMXoo7ysp75cjItXg+u4XAn30R7BgHrYELjf1J9zLMHMxC1ZAPzGVHlLE9E
	 G+Knx3OO7SZu6nvEfsvcmh96VDyHe3kOulpm8VXIVeBhsN6j0ZpoDHtpQNIMh5txNRYHe
	 emXyilAhUC+TOHLI1hTcuBLlvEFGWcXeV9KGcb9G7Whk+tL7G8j5LQKv9ju7YhF9m+ziX
	 Jl9YTTyTd/ese7rj8Hq9OkNASH7iELdo8rY5lls7+8dDXa9BlfUe3qRioWTO0nssrTtMT
	 85li6WibyqdCWoY/0Nbmd9eYd7hPLwCB+ZeEb5qyRLb26z6RRMSi5C/iiArZpe5c3QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0m11DqAQsWViOluQPYNzPkQX9NkHKluVITQUvXZ17kE=;
	b=aLJNkTyTzWSCKASYIOdNMtUKoVbYc382NCj6bpShsXouug2y611H0Z9pEN+xJxugCQ2T
	 8qYEnxgpLN75xsk7sOzgcfR60dbaetVIYHAF+wTSYs+Pujv+BZ2nRZTOEW6Mq3KCOYD/7
	 UJggnbMYPwpbiRlYBHvBN11fETXHM06gybJZjR3nbhJcy1IEYO1t39RxnhcKCsG7CtCwz
	 MNqazuSuWlqUDfvYgCwOG0ojVvPGCtnjjI1Dq/hlGGyDK6zlytobm0qDHJJrH7GC5TIOL
	 i417woSSiXFmJ8UhNKjblR8sY6k21YOE9KCS3fwUpAdIMur0r4OMvt27yXNFs6EOvzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugDCsvDY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B4606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2B4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugDCsvDY
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2264013e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793586340; cv=none;
        d=google.com; s=arc-20260327;
        b=qPof8pw9kMOvHV0X95fKb7yQGEgI9VAn+pvyXD5Z0/SwIEtpuvqkbIY94iWjUBCDKb
         3K5inXkXpKah0n9fjace2yGh5K/iblDaOF1JsP50wF7cqnnEbXI/t8aDa+GbtpkVXwEo
         NkVklFlYgE54jC5Bx6qwzGyFzRDU+NkPNO+YYVJrrVv3PJ3ACrBhrs52UbhWwOzQ3clv
         9kUNPHLjP5e/tjvIIgMU7aoQ4G0WCUO4eUErv//jP9Z2FG+3cg4NyLLyofREPsPyAdyq
         gsQRmz5RXMtf39MCT12tmgrYUKQ0FkaaoL9qd7OJHHGcybefoGizayQ0TDTPROxFmb07
         8NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0m11DqAQsWViOluQPYNzPkQX9NkHKluVITQUvXZ17kE=;
        fh=dUS54Dnqe2fbcd9k/t0ZIHgPKRp9tNh6oCAKVSh6mWc=;
        b=V67daITFAwpVKx9v1jxhGzH3kzRACwQBT/cQ32v1qmyxacc8co3NiyGMNZ9ZI3Vyqh
         AY9GaCgNOn5MVa/X6+RGSwDGDlmz2Hl3jOQX4rm2nMyUkKImMiA/O0qh0mqS2Gk0/d+A
         foozn1S5Ry9DiIP9EfGKTFw74eDnqubaBB8VvCVBtITjdoVuWAlJqcjVmalrj9pJo4/d
         Uul29htjw9myvDdlM/4hAgphPfgB3hmxxbmjCgupUOXEQCEl38Q6RPgihE1PGjB9xlOP
         5hr+I/jUBMyOUOqoqcZQCQSsENQL1zBxbEzpKM7RfJFQptlDmv7GyurtBLHA+IW2kWU5
         7/wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586340; x=1794191140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0m11DqAQsWViOluQPYNzPkQX9NkHKluVITQUvXZ17kE=;
        b=ugDCsvDYCkDc501EStBD45BR0hKilJ3mHh5PLVzf5klKd9eNQ8fs3jIePlTP0KNAPt
         r5EOByLZmYdmqZO0W7i0VzKXiB+0qwLpqz19LfLPF5WJEU+UOWoJfrFEFqWtVTcBcdiO
         Tlwwd/Uf+ihgzH2fBeoSDDPZ3lZjk4bXPpSKc0I5mR1pFeRxHgeLLD5R8ZS1mxu0kOV2
         BwCpFUQHqwcxEKUL9mvZXZJoeUuLNygu5SgxQecFGOYDKPXe+0mVis5idDsh0w8q5nzV
         Qd9k+zsIG5Jm9agqPdNs43nJzKTLXs25BjQN1v2kKT+jyshNQ3Aa8/U+ONAzCvLzWUj/
         GKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586340; x=1794191140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m11DqAQsWViOluQPYNzPkQX9NkHKluVITQUvXZ17kE=;
        b=A9a7of5GA/lNJAjoY3ffbqdv/fc8cUH5x8f8atQ3/QmHk4COWHc+g0bR1PdCmbxE31
         lAquRywx6/NGiwAGqUBIx72Z0BeNAp+7ROVy0B3mw7peRq/f4k5pL9YhIPS1xqxtqSJw
         03N5e+J9Q8Jz2MFsK2Wbr4AOgd7ecKONHEnVpfPaLPvRJaUJD3kb21JFGMJzVrCxM07B
         poYzApbXihJjr1CCeOct51ldgPUEPL4Q/p2EpM/tdOU2TU+E60ypllCcH6J1jGYYjPM/
         FmVyx+xTBzvuDrbCWqEXngjl2zF2Ct5POEa7IKHriUp3byVkWBiSj8Xvf6HMVYa0hD4p
         hokA==
X-Forwarded-Encrypted: i=1; AKwUvByl/v4d9iOal+5r1a78Gc/uMt51aeKdSmJIEnyHsMo0MT8vkDuZkCiF45rYLYfHgErr25VfrZh/lgz97BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WoHkeP13u6LHSIDznFslSJLMX7YUfweQJ6TiFEe/dE9UxdNKh
	NWgCrf3eZxGVjWIMV574sYJlma9T358/LesbrFiBMKLeOoWJZNaQbe8mtPLcw1+5OMETh2sLJ+0
	3ds0yzlBqbscfEY/fy6+WXV5wdBsWQpsyGak61sA=
X-Gm-Gg: AYBFou0mYNhOhxkQaz7Gcei/dLMa4NnQI+3UdI0jUlt9qVg7oeawGTXszbZMsXH+SYm
	seqQFxqMPcTxLHEhT4wxYK4d+mWtYsUkQ2hiYjPwvJ52DhqDEMYsOid4PvhiAeL65+iTqM7pfCX
	3HtF7LZ8KdW/TufmzaY9EHw0X95g+F/izJ1r3qLxnZncJxvvUWA6LMTlrgrlMkPG/jY4obbXmlH
	tIROEtkY2ZYE94gYaSRcGDlcyJsXtlk2/eCzabSYP5ihLto5W01KHeluLql+MUf4BfzCdncL6Mf
	A6Bz20EjC8JtjO4pC9G6d1PLEdg7Z3uKq3lBfBW6m6nOBQd+mIA9NulFSvV4lMb5LBqnNvmNsQy
	1w/5XzVpeDl122h73hFpVRArZvvhRHpYxU3OauKHUXya8LV4z7Tx5yXp2x+aoQ2dFOhHSRIl+BQ
	mQCLaLom/95XlpLns69tGix8eYtOcdx7QXKHaQTo1Et0wAamnumEHIHd38COplpSY8q4Yi0v6+J
	90oKJQqXQs=
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr2907633e87.10.1793586340194; Sun, 01 Nov 2026
 18:25:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031133455.3070233-2-rsalvaterra@gmail.com>
 <CAL+tcoB6vg+-w1JZdND_cTN_zPeh76_+-W_NU34jkunJUFwrrA@mail.gmail.com> <CALjTZvbPacWO+NY62fbFdQEAJemD57zmhdYy+v+BXpxFgntcNw@mail.gmail.com>
In-Reply-To: <CALjTZvbPacWO+NY62fbFdQEAJemD57zmhdYy+v+BXpxFgntcNw@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 2 Nov 2026 10:25:02 +0800
X-Gm-Features: AclHuK-ou4PfE1lO6DM3P8nj553WJIIK4Nvl4HbobZUxI6ExZLuUtqWgm0YgoO0
Message-ID: <CAL+tcoAnw=5vP_s5qTOo8O-8uBntph4MOAxYE3fnw3+K0jhyDQ@mail.gmail.com>
Subject: Re: [PATCH] tg3: make depend on ZONE_DMA
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:41=E2=80=AFAM Rui Salvaterra <rsalvaterra@gmail.co=
m> wrote:
>
> Hi, Jason,
>
>
> On Sun, 1 Nov 2026 at 05:48, Jason Xing <kerneljasonxing@gmail.com> wrote=
:
> >
> [snipped]
> >
> > The blamed patch seems correct, so I think you need to root cause it
> > instead of adding a global dependency here.
>
> I'm sorry, perhaps I misunderstood, but *I* need to root cause it? I
> never claimed to fully understand the implications of the patch I

This is not how things are going here. As long as someone proposes a
patch, they should at least know what they are doing.

> sent, nor the intricacies of the tg3 driver. What I *do* understand is
> that a supposed "fix" from Broadcom has left the Ethernet controller
> on my late 2012 Mac Mini inoperable since the 24th November 2024, when
> absolutely nothing changed in my kconfig. That is, by definition, a
> regression. I'm entirely available for testing any patches people send
> my way, if whoever fully understands the driver and the hardware is
> unable to reproduce the issue. However, asking the user to fix a
> problem created by a patch from the hardware manufacturer is=E2=80=A6 an
> interesting approach, at best.

I see what you meant; I thought you were trying to make your first
contribution to the kernel :)

With that said, maintainers would pick up this and probably send a fix
with your credit (reported-by tag). Thanks for your report :)

Thanks,
Jason

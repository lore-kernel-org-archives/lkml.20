Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082140BCB4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805639; cv=none; b=tnmxikfZPQEpA7FsLwo7Vvji41qCMMvvYMtmcuJJuwDc8kQCV0yg9mBXdlE73t0pSX0EMKdrtIXNCgE7kksT9lnDPkiid2zebbNYy03AkKVWyzssBvnI5nkVEttTzSW30QooHVVK7WPIqsaHptlaZl1VK/Eqd37ciw5aYjRKjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805639; c=relaxed/simple;
	bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sghh5ZY5EfhD/aoqrYjeq4lAixM23jJtyd6dKP6q+uTZTsu7j0iOwoV3sAzceHrV7wihkZEBGGY10DfXaYBFKnY2yMT/XYSaiTe95Fvd3f2V1ScYgSg+9xbm42fGOvrAYKlXKUjDGe4yVId4oGZOTteX0M9OV/yHaSxi3Lw1jB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hd6rVcEt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DwhPinWH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hd6rVcEt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DwhPinWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791805635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
	b=hd6rVcEtaRUmu5RK8CPCAGYginbIJyeuKbzcYz7iaNqy0LoeIbzTKz+06qcYiupGxhB2Fq
	KjQ3Mva3tYPHG8oTwyr9hqIES2ZUZQJXejdEL2uPRnj2UQEnIXMdqyk0V37WoXXoa//pLx
	E91BEK1Y01L4d88v0miPrS9q7KuyRUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-YI50Q9aXOyW_kp81QSufeQ-1; Mon, 12 Oct 2026 11:47:13 +0000
X-MC-Unique: YI50Q9aXOyW_kp81QSufeQ-1
X-Mimecast-MFC-AGG-ID: YI50Q9aXOyW_kp81QSufeQ_1791805632
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b028d93c5so1274123f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791805632; x=1792410432; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
        b=DwhPinWHnjRRDfLT5ckCnhVZT3MPyvPSWXh5sniv2vWCZum9F7r+HebR4oIyqjXbSX
         ll2WI60GCsS8WnlJhzi9j1dT6jmuZP2K24uQd08ajf0Gnjt27psE6Oc6fSLSvFQhcgEu
         ds+BVWhLccTTup362o59/FIQjer7IYcBNZN50dP1OhkNhKdHTG4RJiRmuxdZypftlK1m
         hDYQGOIhQqd0CLtIG53+4CqTFqFZMtlWllHLPdPMqcO+tXq95HP/upXcjW11vto3KsRO
         23LGAOCInT2Du/0rNrYXKlHlIrQ03LX07ovEeYVwhJUdw6zL7iDw3uGNvknuqKKFZlDC
         zONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805632; x=1792410432;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
        b=MtIhbIYKl9dNGsxTi3M2s9DzfG9EBu3AlzTdXXx8b0jxVNrHjrVdG+wQF4+CaNn8hZ
         R+Xm4T8S670ES0UO+gyrcXiaJlGIrREDl/NNNmQWehxUxUfiUlAsXIYR7WUaf5qHxcP7
         5/SUK3nt53+FRt1hpvI0IX8gqgs917mUPhR2Je/5loCLrDJHsANLcBstYG0zg233YhNw
         VJFVgBGq/1ginLhuzfPKL2aQJfxf4pES5ol+7/aymyEGt86AfnSCQmeWIBqHvhsA/MlG
         1vGfcP9XSOZIWVy9fAKqf/fLmETWgylc/+PN0Q4WT3CD4c0tDaIaXIR2k3ttY+z6BQSd
         Qjqg==
X-Forwarded-Encrypted: i=1; AKwUvBwdWxFAOH6JY8VZrobx4NGMuww24zNj443YFHB0A0q26i/Dfd/9WoGBFupZ6ySvnMpdd+EECt1h2dhfN5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCnmrXHERS5L/rQj1KSk/NVr7ITvRbBBpekmQpBoXZ0JlGJ2dd
	FhmMJLESw2CxKj6pjF2dQCP+LXM1EpQZtFNLD33vylSu3/UpA86aHlQfkyOokKfO7UDQKkdfdB4
	2QJbJlnWwxMpRVtdjMrGoetR11xNT/FR/BoYTO31ieU4uFfn3aXmydZi6+ADphWwY4w==
X-Gm-Gg: AYBFou0ZJoHNfdGuw/AcqDFGKdUyBCRULR83Lq83yC3k39mMkevvXZpq/WzpGD0jHDH
	cPD5K2mxSaQyqo54Y+95gz402AW9bo/zRrLQ6vj951Kr7QhXM2ESqB2m+091lXwjGbIMxg2pq5r
	+UrSzjeARqFqO4S9FouzG+od5bMVqA0v1V9MyE+IDsSFvZylinaHLyO2QYxO58VZyjZNrpYl8MJ
	LIgPMYhe69yhyMRwygh9dWTTAVmBUIPOKrK3jpK19tgDCcGqxiZR+o8EtNqfZZOgbXoxZXouZSD
	JVwIPbP6h5zykKQbiqvQE6EmWLqydIb3rWI+ACaLky9YMPenQNHFUUZ9dXty24T9AqqlMYvlEJP
	uPENwhepmMU5JrVCcRBy2vSj59alx
X-Received: by 2002:a05:6000:2f82:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48dba78459bmr21037789f8f.7.1791805632459;
        Mon, 12 Oct 2026 04:47:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2f82:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48dba78459bmr21037732f8f.7.1791805632034;
        Mon, 12 Oct 2026 04:47:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm18489239f8f.37.2026.10.12.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:47:11 -0700 (PDT)
Message-ID: <4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Mon, 12 Oct 2026 13:47:09 +0200
In-Reply-To: <20260911123439.463052-1-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> Hi Steven, Gabriele,
>=20
> I am using the RV system for a downstream project called EVL (aka Xenomai=
4).
> It is a small co-kernel system, small enough that I can model the whole
> co-kernel with RV instead of just a fragment of it.
>=20
> The patches in this series add a per-monitor "stats" file that exposes ho=
w
> often an edge has been visited and the dwell time in the prior state for
> per-cpu monitors.
>=20
> This allows me to not only check if the model is correct but also to see =
if
> all paths are exercised by my stress tooling and to decompose the latency=
 of
> the co-kernel's wakeup path.
>=20
> I think that some of the upstream monitors like e.g. the sts monitor coul=
d
> also profit from this.

Hi Tobias,

there's been a conversation at LPC about completely migrating RV to BPF.
While we aren't sure of its feasibility yet, and it will take time, it's
something to keep in mind for new contributions.

First of all, would dropping RV in-kernel support negatively affect your cu=
rrent
workflow?

About this series, I believe we could implement the same using BPF maps wit=
hout
too much effort, then the rv userspace tool could display them nicely.

What do you think?

Thanks,
Gabriele


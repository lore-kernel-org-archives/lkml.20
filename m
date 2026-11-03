Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739492;
	b=WH5iQOe5jHfNAaBAxWbAm2lM88wrSavXhneU3QMpfYQSvUOvYHpCjYAtJdgEaIRm8aBv
	 BWoqFuEsHHB8tcpPbYUjWRShw+QmDq98lACjYJjuOmKY4J6SuKnxcoEdCtIfeYpa7LmRr
	 GnBx0y8MKruMe20KsqWrtKEmBzJ4N4aHprkoJ1i76akByR+moZbuYJ8GQ5nsIWK/d3LGH
	 lW3MORD5ZUUd43PgnHa4g5cTODWav+YRcM3mG10cmMpgQ2fuHVabQ3vKcU+12N3Ac2g5+
	 FCdzpOsuTfH7/jcA+U6p8xwRi+o4SIaT9J/n6EoXN40JJM84R8svHJMZX56AreMyQfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xlEVARhdYpI51yqwMKIfAYo+e0yxy9kuj0dDIqLQxSg=;
	b=iF+RvQ6yUfmtnGIc1Ujp0YLRXu97Qw2hFIxqO2XhMAhbAjpeqCyexSk4qtfua87iqHr2
	 4B+2AXw2+PCGRUinGTx/qE10sf3QRbCJSmeAgGD+TvVQU0Tz8uWWtVVTYyOdhRi1BUHAe
	 ySngkV4KLrN6fwB61eK6INGkxGLZIn/Zlkl+mGgmfAYT/LDACVvdOfzvIP4nOPMmZq7ys
	 XqKlIhN157QdvgeACW/eC8VrrD4hpyp9OHGgC/hF6Cf4TpOvgjLm+tfMbH0YBBOZBEKuA
	 nMtTHTQeUySDwFpMCS6l+4sSrmLVCQskpB9vEAfKecS08H8H1Y4pdz43o67/65YQAyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=gNjU0kU7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA45606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA45606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=gNjU0kU7
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso36422575ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793739491; cv=none;
        d=google.com; s=arc-20260327;
        b=GOFR/KfglaeMSC1yTuGVuSnowlAMKmyFLnule3KlLZrffWlPjZDZnHWXtDHtVMtg1p
         9EkwlBOb6eteKTKVe3p5IYnUPtNslyltEes2uPyk0gnJ/TgVREK+BxUBeHr4rqd/1efV
         vQ2T5ieJwE4Ob4OVMFUguZVMeigFDjwI655p16DPkGXxMGVQP1Q0Re5eIkKGs4RuVAXH
         /tLdNDPvTZGvb6idGqwSOuMgqqjlbkmOZPYu/j8zDvFkDKTjjE1sen4h4lam9YGah3ma
         q3USPOpj87w2CgcFXSbEhRPFoeMF5pKQ6c//imH9f12nGup3H0zkf8l52ZcCCnDUc9wd
         /TVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlEVARhdYpI51yqwMKIfAYo+e0yxy9kuj0dDIqLQxSg=;
        fh=l6LtTgrTDrUFgXiyJvhg4vNSX1Nimn7qCU806ikKhG8=;
        b=jawTbPU8l10kwlMqh5LuXshMj0R9yDvv7olJA8SPByNkIASYZK3ClZ3LWyec+qB7F8
         DghZDAbEQK+gkE94vjFCW/uONyaSHku0m/np6dvEdsBr8CdWqVfgp13UPtVnjbVbZ3/3
         0uLqAJ4Mz60BO1iR66BHgRl/6jj7ZwltvxQTuqYdyxFWftI8JLT63loQ476RWYi1BV6z
         krlx3z7Ey1Y5OyVKqulUySGK++5iTyChsRJ9KrpB7hxZWY8/G71ojTdBSY37zzUugiCW
         ECd7oLZPYfOTaBrZ5dDUh1qT094G6nWAmfjNBSmye23WPgZUr5YRAf+jdq5m6T/ATY7e
         Ylpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793739491; x=1794344291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlEVARhdYpI51yqwMKIfAYo+e0yxy9kuj0dDIqLQxSg=;
        b=gNjU0kU7sM8uH5XC2H7b99i0TvtIF03FfKAOB0NH5+8azPBEMvKw0LopoHo9aDtdiz
         VDyjVtVrUAN//DSQQ5olLEEOAjJMZhga8ZmFPcbKfD2Ft577yKe7V/QcHq6FX9oHF/yn
         3bCew/1NgBdXPqXDNjd/pB+bgpfklJXpLzQeRdEu1INssd8arH3ktroB3iBaNXq5+ufX
         l8KdXY9cOuOdz7Ack0IyhbVI7+narclszD/zONZH/1ebAaSxDxVSg3gNl50MRCwl0e2m
         B4k3pyP+iT+yfzugI1Wl73+2lNHj1HV2Ub4A50Y+lzMd9mZvMR/+dyBS5pq+lnHK5qZV
         pvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739491; x=1794344291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlEVARhdYpI51yqwMKIfAYo+e0yxy9kuj0dDIqLQxSg=;
        b=BWBMkznjSY/9gyReNMLTZuV8w6RrZwTf7AtDNzWdpqWBQfpsikglqJuZvf/CR3RqzD
         JvvTFZqi53TIgpZvlA2/+8OQxt1IEhg2QNKRt8yGxt30H7o3FLqG3ejlgmxZ8rYGLjjX
         Q9ogLyqoj2ejroFIm5hyVUOApVrkSVQPWoZ0g3Z1jC3UyBAB/Ueya3un4O7rEnb75tsm
         8AVNtTynFPWzH1dLz5Dn2V0UWnLKVYjvJtubwH/BX7Q8tndDLTVK8yAXVc1TkGvYB5lj
         ohaTbbYHwNAGibUhtu5tjRuzTaNlPZ9YUUDrLhvwVjSQDeYGxIabCyKJAbtTJOVKo9vc
         vy5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgkZY8KNslRMZPxpl4aY0oOHaNPgi4OJioDO1rFMowjQ4yAAt2CPa3bY5c1G87NYuXxIe8NDdeIxWNxkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3tVBgY3mNN4gLtuESiq0wBsWKmUuKtvVXc6a6/cCH4IelTi6b
	1OTX/qOO5zS1T4RIqffk93/kAdGywspqNL3ayb70pXYrkbQv0+UjHyexmjkVasWHqD+hutkVI8W
	7Qse0QWrojcitt5HHAw/iz8R0iZIdUScjPbIuh3zo
X-Gm-Gg: AYBFou3LZpcdcTOGrZDGnm/m6YRgaoCZNXhwqss67OQcx33X6f32w8UdQJ8UW43NV2t
	2kNWUjTboJD40GZRqoDG4Z71bxf1R2zgODsiObSTODEetPkFOOAipwnumI3kdH9q2AxjiTdUonm
	jyJaTQck+t5oymP5x6cTNzLJ4lg9mFfplRoNYSWz00PriSNWlsxrkp0ufFxvtJZHE4Vknp24lY5
	In1IrEJkme0amtw/psQMzHmbZX3mUstB4OS7ehhDb+sEmpDAo4Q+LF1XD9S/a/vZW7xtTe667wG
	QijeC0HEvSRo816yEWUMOG3FoU7zu4XrerOF/oM3DjFGm9tiMSfovg7p2AedO0/3hNzvjA9Obav
	Rq0LaidhtLquyhKbDQQ3yFyKnKfVkIhD36gEOAx8xIU4FHnawWiGC4HrHUKNmaVvMqngo
X-Received: by 2002:a17:902:ce81:b0:2e5:cb1f:898c with SMTP id
 d9443c01a7336-2eb364ed0f9mr139787525ad.46.1793739491564; Tue, 03 Nov 2026
 12:58:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019222858.1766-1-drifabdelmalekmohamedsaid@gmail.com> <CA+xk8n--qQfYro+xsGu+z7nuCrAJgwzOOyrc+iXuBeSsPOWjhw@mail.gmail.com>
In-Reply-To: <CA+xk8n--qQfYro+xsGu+z7nuCrAJgwzOOyrc+iXuBeSsPOWjhw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 15:57:59 -0500
X-Gm-Features: AclHuK_j1m1BaQJmY5Z4xSDq4UylbUple31snnL4So3-rHmuEym2QzQD59EuRAE
Message-ID: <CAHC9VhQzeCgCx9mi6pvbQKLH=P8b-o6JuxeUo0QfyebVGPdXGQ@mail.gmail.com>
Subject: Re: [PATCH] lsm: don't call d_path() when current->fs is NULL
To: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Cc: jmorris@namei.org, serge@hallyn.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com, neganhat@gmail.com, 
	audit@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:18=E2=80=AFPM DRIF ABDELMALEK MOHAMED SAID
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> Hello,
> Just following up on this patch to see if anyone has had a chance to
> review it or if any changes are needed since we're at 7.4-rc1.
> Thanks,
> Drif Abdelmalek Mohamed Said

[CC'ing the audit list]

Not yet, but it is in my queue.  Regardless, thank you for the report
and the patch!

--=20
paul-moore.com

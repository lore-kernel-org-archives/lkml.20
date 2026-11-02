Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639703;
	b=XPGauZlwKWKzGreXA2pwAm5NnhG4jlNtT9N4IQFIxiHu76/ZDhfD5EqIrZ5wu/rC5fiB
	 wy6Uo78BufHWCZWqs9yyfAB8gdq8YCf2CJht0ihes0g9IJYmuALuP41lhCrK8SeqDXWNV
	 LcRtFGpZOH6rVhUpOaOrWdIdDBmoIYhH0HQWuvMfVEEIQwz6x6bDKLO8O3GYL/njszh2v
	 j2wRNNSQqj80yjI4Ll0WlJGrULiYoOkpjxxdbKWbu73wYv8vRLZq7tzR7Vn9sYtYnVYmL
	 BCBQutxk84YXtlaLzXgXpfBah4Y/QvpBkYuvc8DL5Mdrn/AwFwf9vdxFOUCbxzhiCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=CyOa6Yxm6Bk3EDjTqUxDBcTk56bz4sW1WrhYk3lu8Rk=;
	b=AarQ1DYw8NAQqY9aKbBFVgmGDCzLEp9jVbdeRucMqglOSMOdOP0DQR6xdLPjXey78/G4
	 550C6zk3YPojEQQvDdDLU+44qhD0FBAFcrom7R6ZXEygRmWPZOn493ZFHIloL+fQ9vLPU
	 01fjBb4fqaRaOONwV+B29kARhEDPaT0mtvCYR2en6GpAdWCY+46xJIMbsFR2pTFZrNk+m
	 PbK+UriKNg/uaCFhdOPpa+AGxuqSSBru897riYK6HomIaDndJUV03CmAYEMg7dB/wH2qZ
	 0cL/w6ojEgfzAmijfM7HqGbPdJOLS7CJgd28BbvMBTzVhHVb2zvs5r8zTe+fp8b+5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lVw2hdJ7;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724306070CB4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724306070CB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lVw2hdJ7
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso3525511a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793639703; x=1794244503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CyOa6Yxm6Bk3EDjTqUxDBcTk56bz4sW1WrhYk3lu8Rk=;
        b=lVw2hdJ7qQLXteU91SozDPhlOzjbMw6EJzgSr+UeMLO4nB5+/ENixgH5FU0NIqLS5F
         CebTtnVgUPR+4vs6BOGMvCrepu5JF6LuKrEm1v4DU1RbL6AiASZxR+SIJh60nFSax3m7
         OyzWvYHbDo3l8HRDBJ1m0bVCdA/EqwaHJ6DimVxJMCEgJmnI/pHbCUQPkCIpPhfzjrBR
         HORjsL1SoSF3Hzs8qJKBfuvbQulr5pHgYCOSoJjlW1dCwP8pv7YBNGUfewZxj5lHbY8T
         VhdROJGjQ6i73RMoFgWMIGbQopRCC+lTmRRqqss9XZasD4UrtdmmSULUUC8J/blDzX86
         jPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639703; x=1794244503;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyOa6Yxm6Bk3EDjTqUxDBcTk56bz4sW1WrhYk3lu8Rk=;
        b=QG8MblcGSvfxxhLx+ICQKXXHoPaqI3tDjmbP139rg1t2jjbJ4Z35pizhFXdK5tEPwF
         Y6HHXQWDjExt7fSU/SZml94/EzebnuS9NyyY7kpdlY5MsT1Nv0J5iKhmsuos/P8Y6Dd2
         +Uwm2U0xHqsB42K4GfRSO5R+wZ/JxwOU5zW5mgBNxU81iOZquQcH2LiyozFgKm3r62fs
         aE5ivgvwZPQdvQAdwjO1+MX7a0aWvYlsNTVrWCxEQPps1epfuwm1GIPtZsaNxLkKLDK1
         v9kmlgxOW2/nA8BFcxVoHFLeFoalAxsyk/nWdyaiqv/wOX6qkDPmgyXWMKOfS/esAzDS
         DG/g==
X-Forwarded-Encrypted: i=1; AKwUvBwpbnw7TfCb2aobuR6RBbLIUSNDSO4BvTVxjmOzf1fPFKi8j+hGCOoLnyucuENYcu9TZsXBpbPePyp+s8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbIzPjgpgw4P4NdY/AZB7nb0vnnrADvvybsec6Wn/3OsDTcWrP
	CDb5YQVoXFYxbnW3O5NFELweboDxe3yKjIDLCQmHK6hjz7cS+kHqRr37TLofM483X4zOhnu7lLU
	i90R5dg==
X-Received: from pgvf6.prod.google.com ([2002:a65:6286:0:b0:cc7:d071:a17f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9145:b0:3e2:1160:6d20
 with SMTP id adf61e73a8af0-3e928a80f31mr10111167637.3.1793639702622; Mon, 02
 Nov 2026 09:15:02 -0800 (PST)
Date: Mon, 2 Nov 2026 09:15:01 -0800
In-Reply-To: <CAJZ5v0hDHcN9RN743sGhhDNESz0zwVDfBOJYvfTDwQv_STq4rA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net> <CAJZ5v0hDHcN9RN743sGhhDNESz0zwVDfBOJYvfTDwQv_STq4rA@mail.gmail.com>
Message-ID: <aujFFczvri8ME1Jy@google.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
From: Sean Christopherson <seanjc@google.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026, Rafael J. Wysocki (Intel) wrote:
> On Mon, Nov 2, 2026 at 3:34=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
> >
> > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> >
> > > So it occurred to me that it might be actually better to stop sending
> > > messages directly to LKML subscribers and only make it available for
> > > download somewhere and as a Lore archive.
> > >
> > > Is there really anyone depending on receiving all of the LKML traffic=
 every day?
> >
> > * raises hand
> >
> > Some of us crazy people really do depend on it, yes.

+1, e.g. it's how I found out about this proposed change.  FWIW, I don't ac=
tually
need (or want) to receive *all* LKML traffic; I probably only truly consume=
 less
than 1% of the mails, via heavy filtering.  But AFAIK, there isn't an alter=
native
way to arbitrarily choose what traffic is important to me.

> Exceptions would be straightforward to make though I suppose.
>=20
> So really my question would be how many people there are who depend on
> receiving all of the LKML traffic every day via SMTP.  And I honestly
> think that not everybody subscribed to it.  Probably not even 10% of
> those people.

There are quite a few subsystems that use linux-kernel@vger.kernel.org as t=
heir
one and only list, including (almost?) all of the subsystems that are route=
d through
the tip tree (x86@ isn't a subscribable mailing list).

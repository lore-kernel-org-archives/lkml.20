Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159543264CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540589; cv=none; b=VmOTCMxt+P7RkG1UhcJPae/YmclgloGBf6LQraU/hlOYIOwF7huM+TPmQJCzsUVQ8T6ir/08I0TcIHsyFKEKRMycZ17Xp4EERLxw986MEzCPzvqJwDzlxrfJNAt/1LwXFUtSzY1+8rfY7mVZyUnCmKSQYWIe/iuUMlF1nZ1eWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540589; c=relaxed/simple;
	bh=DIYzQ1EPfmvk0HXDvk5SB0xtF59iHApk08ybYe83kU0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mv3aAys/ZsUGx8jj0I+necHwRviLsR7lGNjXhjJwX57LTokjsl5IaZLf9aa3nmnbyeqoPEknuBQpVt/dJy7HvEXNx4AAA+XJwJYmsxCsCFyEKjiR3HaQ8JvrSnnpCSYAxHf8HDKkVsQ0Cfxd1ldWfqqvKGOb4fCK04FufSLOGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9NthN4w; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELMYhlyd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9NthN4w";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELMYhlyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791540587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DIYzQ1EPfmvk0HXDvk5SB0xtF59iHApk08ybYe83kU0=;
	b=H9NthN4wmnC9Pcmj0Ri57PImOnmfhPmePnxznpUcmwoZVm2r188H6KkSYx4d2+gdK7BaBV
	yqm9atwifhOTkuYDWecDUqB+rsNmT7jft6DDvhBvQow+2jCNuOv3NE1sos9Z7KfPcu+hXA
	hDuNVPVvhcBfe0M/CHPdj78CER/7L5A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-yQajKS8RPG2LrKE8dH41lw-1; Fri, 9 Oct 2026 10:09:46 +0000
X-MC-Unique: yQajKS8RPG2LrKE8dH41lw-1
X-Mimecast-MFC-AGG-ID: yQajKS8RPG2LrKE8dH41lw_1791540585
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48afe67dfc2so982961f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791540585; x=1792145385; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIYzQ1EPfmvk0HXDvk5SB0xtF59iHApk08ybYe83kU0=;
        b=ELMYhlydqrowpXlHa5VeU5tqgRKQIlXLO8fwveOaUetnzTq5bMPQRPdI4ZJOtCIyqH
         jf38Yls9LsFy0IbGFKt4ZL+b4R5xhC7lx5JMsNkH/62gtQtsQ69Va32poSlVPhWMhmHE
         7rFg0bznlXmU0WSTrGcxFTtFMIHKppxjBSAUmo9zqBnQLKWs3r9IIVPazwnyIpKhg+G5
         sT+zYS81la21lwrkqJ+/a11PeK66C5xUAXtEBNLt+cLDx5871p+kONrx84TrKMjcsIgz
         z38vPu1vXezU7SgOQL+FLDKvUjDiknI3Of4vszyxAMCuYnGK20f5aBVufQKWYu3CqJaI
         vZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540585; x=1792145385;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DIYzQ1EPfmvk0HXDvk5SB0xtF59iHApk08ybYe83kU0=;
        b=JUdPoAvVBicN4Mbwzp96xvSkBM5N6eCBsWvrmcQo7DWj+xV2TshxQK4Eisj96SVRlo
         8l/s6cmbD4O320NCpgXXN3TNQBEf+GRnvxfKHKhrhNEfDfVvsjV7i7o7DlszDlxQlHV3
         2FoGQ+pPIzu0sPihOasEtzilF4V1tGas2MyRaIjDzYzhRhZaX5ZZj2YKdPORWhv5R5AU
         3OvQ/hkJsXD2Z4XqsUl4V3Ofafsv3pjFYmpi01j6gSA8tgRru62Q+rVXJ1aSX57w9Yul
         DsTCPIgaJF/2C+9ooOzL3Ym+RzxFVoKJWdeAxJrxKpU8AKNfrS0WpmWcA0+nkYY/2GNl
         GBGw==
X-Forwarded-Encrypted: i=1; AKwUvBwf/PxXXc4D84FdQZ5nfBDqTuhnlxe9QwK+Gekg4kj5rx2kMtPEjHiu8ybKixwU4fbNUU2vr1rN/otHH5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEbTZ3zy1nhoVKIZH6GU83wF4sbKFFjFnm6sPvyybvi+b8NhHb
	7L4Hfn8yXFvZ9Z9ZOiaHZ3meQsx5/UDpG32xxEjikGMd7PUR36fgZ6094kVgHTwIoyZzdkGyq0q
	tsdMupgkUX3WblmkRDersWK7bfdq//wG22uBvwGsLbIvYd+qfOFNY5+ncVvk4B1TCbg==
X-Gm-Gg: AYBFou2YAGF90UCW4fpfVVMISNZ9Encjwt84h9juMaaFjUSd5KIwXFzQ/Fj87c7ycUg
	sEfnizysCK2xJNpwV9EG/gK797Yhw29jNv+9z0TS2FFBvn4AT+jYEDR7V5pWaYBbKz39H6d5QXY
	Waatw98gZaqSdW1Um5QGcNrggdEalcGNH/eJ5g6h3+YhKkXPxGbKdceTgyG3wIpYvBWTQXYyzBt
	8qz8JbvqrNPe79hNo4zr6aislpM1bkC5Nt9fbkN7qKnZFo7lJO20awgcqVJs+29T9yHev/hGUB4
	XLMUQk9CtuWKNA0YxLnDy1aMeMVDjKWx9LMHkoZBnZo4BohnYaAGhjFV3jneCPDU59siYAxcRR8
	j5g6YykAUI/khHDpzMqZSCBS4n6E=
X-Received: by 2002:a05:6000:4683:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-48dba9e6381mr1934063f8f.4.1791540584885;
        Fri, 09 Oct 2026 03:09:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4683:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-48dba9e6381mr1933990f8f.4.1791540584008;
        Fri, 09 Oct 2026 03:09:44 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ada3edsm3163180f8f.53.2026.10.09.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:09:43 -0700 (PDT)
Message-ID: <76753c2dd66792ec6eb94d00741e61366df426cb.camel@redhat.com>
Subject: Re: [PATCH v2 09/15] tools/rv: Copy stripped bpf_atomic.h from
 libarena
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Wen Yang
	 <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Viktor Malik <vmalik@redhat.com>
Date: Fri, 09 Oct 2026 12:09:42 +0200
In-Reply-To: <87fqygl9we.fsf@yellow.woof>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-10-gmonaco@redhat.com> <87ld89wtrx.fsf@yellow.woof>
	 <4F009BB7-58C2-4AB1-8FEF-61FA4B5281A2@redhat.com>
	 <87fqygl9we.fsf@yellow.woof>
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

On Thu, 2026-10-08 at 13:16 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
> > Mmh, I'm not too familiar with them, but they wouldn't be drop-in
> > replacements as far as I understand. I'd need to use C11 atomic types
> > and that would diverge further from the kernel implementation.
>=20
> I am thinking we should migrate to BPF entirely. Keeping both in-kernel
> and BPF will be a bit painful.

Yeah that's a valid point, though I'm considering it more like a longer ter=
m
goal. I'd rather avoid rushing the migration until we're sure BPF is perfec=
tly
capable to handle absolutely everything and we can cover every usecase.

There's a common belief considering BPF a prototyping playground, where "re=
al"
things should eventually end up in the kernel.
Now, I don't agree with it (look at the many sched_ext policies used in
production), but I'd want to assess if dropping kernel support could drive =
users
away (e.g. industry/automotive which keeps popping out) and understand the
various not purely technical reasons.

Gabriele


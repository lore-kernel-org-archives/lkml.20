Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33C135C6B9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814630; cv=none; b=kjDIi6gsRjLLk4MOvrBPi+akUCNg/N0WeXKDZvsjiOBLYZquf4fe6nG23y6/sVVnOkBFfjqz8jVmUm4TkhDq2sKcLDrYbqlAFRF0rr97nfryQsknpwq3+qWoYLB/IfuoVCoabzmpRCf8wncvdZ5PcH1eNahL0YZlI8rmddMD84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814630; c=relaxed/simple;
	bh=7iffUiWOMouvldK22f34fP4Xy6Jv8lhuLzjfyJFFTEc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oJhTOFfi75LxOij/WXkfpFCL9ChC0xAgkYB0Qr3YK0R/WLpLbKjePkfNtl52PCcpqh/8G5Onk7EIt9tbe8u2tUlalo+Gq3pCu6XyOQ3h+Hq0IIjFJVMtB7AW7TiotQMprGETHhqL5LlJhJ7mxR9dXN3VOWnf6bCuO4Q6rVBYtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UL4FOTD1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDRaA2h7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UL4FOTD1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDRaA2h7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787814627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7iffUiWOMouvldK22f34fP4Xy6Jv8lhuLzjfyJFFTEc=;
	b=UL4FOTD10JGaFlE2eMGfpo/JztGAZO0RiV81+2gCFKn6WU40DtKNKuYIyuGhIaAxdSWslc
	spI/qdwrEeQROv/ed73nMSesqa+n6kVq9WF9tHK5ycUtV+rnG30mF8pwLlQhiTR26s6YCN
	2L471gHuNw8K6cDsY5INtyiuliTrwac=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-5jQAN0DKP0eGClRG0w2hiQ-1; Thu, 27 Aug 2026 03:10:25 -0400
X-MC-Unique: 5jQAN0DKP0eGClRG0w2hiQ-1
X-Mimecast-MFC-AGG-ID: 5jQAN0DKP0eGClRG0w2hiQ_1787814625
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1c232fa136so83634366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787814624; x=1788419424; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iffUiWOMouvldK22f34fP4Xy6Jv8lhuLzjfyJFFTEc=;
        b=QDRaA2h7dCed9OEVPIL50mzAMPYyCYi9kadSu9L97nOtDxkZNyQDWH3zhSvJ4ZGQk3
         c1A0EslJPldCze2FCs6S+uaZv8wmZOYHnEQl1nJM7EctenvyfKu4qEpglB+wF65w0HQM
         /SkLJSEsgWLc0/Vp6vPZnD7hroG1zCIgOuYSOY5dPATvcvQFtVQ5PTatLflCe/8w/d8M
         k7e+17gsxfntpGiYsDKRmIEmdfQWlxddlFhcc4RVysRRcat3I935o48+NwSG0pemi4b+
         V7Ph5dD2ykRv8KGg0IeMqNMnqF5FobmA7K7sBCsEy2pUJOenTSg0zLwZ7MxI6dzjRwvS
         Hb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814624; x=1788419424;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7iffUiWOMouvldK22f34fP4Xy6Jv8lhuLzjfyJFFTEc=;
        b=sS32nzM22zND+g/IW+5zD1U6NORcTrKlY8lJQ2vtTlVaQ2N140m6ZQTHis2VeT71kI
         SuqXNQ6Dcv7qYK+BolB/TPrO0+8Y54ltIkgbcOnOnhk+63dSr/mqwm6xWBk7aoqtQxKA
         pDPKy29d7lfdiy16Jmmgk7mKyWSNoFzUHC/ZHVqxZViNHlw7hOFSrbu/FEhFYVp9AuCk
         q5t4DsQSlWFRgdCcHNhbSFU+qKOym5mspZctMjic0FkQ2zamizODEbftEknnvzSl/dGp
         QHvs8GLliwcPV5oLPgTZEberyqzslPnA9Cvlzma84/ARmxUJKO336Gwb/AI90SvsHE29
         9cFw==
X-Gm-Message-State: AFuF++lj8RoyucFl34GgAOuy+BU8utX3+KGRU7BklhPh/Yg26o0rSxZa
	JEIiygelAloXrsT0kutjV22VGwvh68NnSUEq2vR8SLZLlS7f+M6sLH1bmngaAGll/vz1nTCOXg2
	q2XpbDgAEMtUBwdLHvxR7wrVW6GjMTkvFTOJ2MWUBVhRCPldMFc26ODD6lKk6xfd7Eg==
X-Gm-Gg: AR+sD11k3AEV395XqHjgXVkRTPyElRkeiyHaFb3PqAmuX7dXBUASbZmnKq+diB1cEsa
	HVah0TJKRzX0BKco6IO64GlcDYgVmVriQEltk/E8g5FB+gLKwfWmlGI4opZg450cNOu9u3EnaeQ
	D2yoZja/VWyHq/9R2JfSUpdoeZbyy5F7irywnhqVZNaJeevafxgi2VZ2mnF4IN2q0YlKQv+hXxN
	Wi1xskpKakNW6NPRitrp/FNWrNOljIFScNCYrwFeqdlrGefFdHXtmNNHhjnNWd8G9SBDppZkAOd
	17in/HL/TP1Ogy6AoLqPHHhTJ160BlPRAA5NcKUnngPht5wulOl7rnKxptCAMEuTuOJKFDMkcHg
	BYXVeskOi9CV9g7wYhW2dGIqeetzCnsGusYFk8Mv+c0Xyd7hDRLyukooYlLqSnHr0ZOkjVA==
X-Received: by 2002:a17:906:fe48:b0:c08:580e:899a with SMTP id a640c23a62f3a-c25360eeef6mr352640466b.10.1787814624474;
        Thu, 27 Aug 2026 00:10:24 -0700 (PDT)
X-Received: by 2002:a17:906:fe48:b0:c08:580e:899a with SMTP id a640c23a62f3a-c25360eeef6mr352636466b.10.1787814624076;
        Thu, 27 Aug 2026 00:10:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef92csm715692966b.63.2026.08.27.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:10:23 -0700 (PDT)
Message-ID: <cdb6e6b4f8841e4de6363f50386c14d51606faf9.camel@redhat.com>
Subject: Re: [GIT PULL] rv: Fixes for 7.3
From: Gabriele Monaco <gmonaco@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Kuan-Wei Chiu
 <visitorckw@gmail.com>,  Nam Cao <namcao@linutronix.de>
Date: Thu, 27 Aug 2026 09:10:21 +0200
In-Reply-To: <CAHk-=wj9O9CajaEKFuHJ7q1TgNm+5n0WgOWcspDXjxVaWq3HFg@mail.gmail.com>
References: <20260826144817.7af76334@gandalf.local.home>
	 <CAHk-=wj9O9CajaEKFuHJ7q1TgNm+5n0WgOWcspDXjxVaWq3HFg@mail.gmail.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-08-26 at 14:56 -0700, Linus Torvalds wrote:
> On Wed, 26 Aug 2026 at 11:48, Steven Rostedt <rostedt@goodmis.org> wrote:
> > =C2=A0 The rvgen kunit command generates .bak backup files and these ar=
e
> > =C2=A0 checked in for selftests as "golden" files for make check.
>=20
> What?
>=20
> What broken tool checks in generated files?


The standard usage of rvgen is to process a specification file (e.g. dot) a=
nd
generate code that is then /modified/ to be included in the kernel as worki=
ng C
code. That's what you can see in kernel/trace/rv/monitors/ .

In this case, the golden directory is used only for rvgen's test suite, the
files needed to validate that the generation works, which has helped
tremendously during the past iterations of the tool.
This approach is similar to what is done in scripts/kconfig/tests/ with
*expected* files.

Thanks,
Gabriele


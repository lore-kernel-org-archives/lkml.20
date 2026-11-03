Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673580;
	b=gWs/EG9Hps0Z7okR7186lTXY/Ha51vr1oY2fudYT/n2gk06up5L8mZXvRN3ywENADbNX
	 nD+NgoWHG/qROffeh8oTU+ENa4p/ByJuvJK9sCqT/qrIMX7hRzEeImAZvHPFnX52SdWy3
	 m5HFoIrz5PAk6k8GlAQngOVcVh+pjBimFeb9jGntx3EcCy7dQ7JsRfcdLHEDIruakKTw/
	 xZ3tHcdzVOm4/Iys+8LfjpkTtoF+Zu1Mxb/n1vB7zCndnr/QbkOas2Fi1F7TuP0PW2VhX
	 edWx+ooNQLHsqU+szZcYb6h/t86rAkqjUzaw5xNJGJ3lc4lRBVossr49QPYS5HVgfow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
	b=DPg/LiZbx93Jjf3HsLERKKrg4e17cpMyCcPbqYnaoHFIa1WvLlVXxNvkODfrdUO1zZ/B
	 PFcC/tfd8+4r3ajbq2yhaVm5ed70HkWVroUferBy/KqXpVMeh72BgIduyK73riVe254jO
	 ExuHZ/PtGD1dbeW4ScKPmnIwqlm26iOga5sViCDisbaH4iInsU0Dpdcwf8sBbyKOq0PNB
	 e/l+qeq2uJMmkXkRzoGy/qVCfZIQ+23+N65pLFfbOKRYJm8s+uKpz10ouDAgoq7Oo6P6k
	 UCFdlrZtZVYsulZUGvjQQCxeipNSlfs+od+Q3uE0TuF7z7x0O5Uj86t8wjN7uPaShug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uSaQ4/sX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCA8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSaQ4/sX
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-945ae2daa68so30117985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673579; cv=none;
        d=google.com; s=arc-20260327;
        b=kYyJS8lNkgXVFCZ668vCS3Gc+itm/xbnrFP540kO/tJg6O2FpcEVT86g2HbBblbTCY
         3AXJ0yG62yOiCMNnA7Adm3FTIvn/Y8KVX3+PVxoY6Uinolcn05YOW0EN1Vco2gt3L0Li
         AXIoFeA1w/sRENPeyp4NMMbBpFYsPY4OaV0ddFqCMpUN9X5Qt/PBv1rPAxKR6vcmlsKy
         C0s0uwhNgLDJ9Yg++roLtcURpuQLvY20Psr+fbIvvP/OyRITpGyReNDug6U0i4vdAsk2
         t6jUwJSQ6Iv15DvRjv+NxHSnPmXdcD2pbMZ9CWgMhF+4Iw0yI7UHcrolEqbbu8npdz9F
         PWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        fh=OxvBf19WHwkkg50P1/ByXT8QbX/eckmz9ZoyJ9C4QAk=;
        b=JLYNa0Lt+I5SvPDLuzU3Zz1muu9Jie0sUCcAEP/ZU6+iSpZwv/GnGrsO4afu9zmoeV
         KoPbVweotE7389lnhcILcPDDLTLEiK0ZCFRaUkqfrqUtBbtG6UHwdrLHL47MSYGlGswH
         H1ZmI91rY2UOMdkpqlh0VuHBf7Jm1oPY42s9EQbkf4WeOPbavPuXv3Vg5TwNij82WPfx
         xGcVeVtqrwC0TMScc5eqM8acgZ1cqb6XdUCOupXrpZ33uLY1ubTzKkY0extOGQEogY/L
         mqTfXid5wAkRFjqkC6vS0VpiapwS3OsvIBC6NZOA+nHKhsnQoeHvqymhIyDmMi4gTBt1
         M8Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673579; x=1794278379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        b=uSaQ4/sXbn+eSWHPoNWOtoU3apYu14w71Bk1TNrxutVrmfIhd2P4m688uUt0AD6H3x
         lGEwtpmzl1bIKQsq0KwANdF36Z0mDBSLZc2XrblkfOPugo17d5ilrmSJah2RkSkx5c1D
         jvY3OsRMaQ3onUhivINMDwJZ+YDFk6zvAPN6xhfAiNg5gv6KiMJqvEKUeXffl0WU6/d9
         droHCOYlYiWjvdF3thYbpl/sodn7Ki+TcvrOhBEeu2QXsSLfgqICS/fuRZJiQIDCtSD6
         PDUXlZFt0I5CSDToEfsqwaHrm6aJ4UU1WzVs/mke7qaDsTlNKNMngwcjyxcIuBHj7NZY
         aaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673579; x=1794278379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        b=aioyVNhZlkVNB2YLfFNgcpdL+1GN7yr+8jqCD3v7tkowONtRx27T2IHCPHTaAe+2Pm
         xMY1BuW6RciaBiukczQJjSqmZ7TKPG4lUqvopdMsp4E6Wpi3ryG5iw4avkUKZXszDSJu
         zRGNCTj9LqBNEB4DkY07x2KlW43z/R5jlOcxlC8yjAsQkzauEArHzup+rcF44ZBp+f7D
         f/nZELO4m2ru36PiWQG9xH4K2SnPkxk13Fjpgy0tf+hyLZ4fKpDthpJOWVZ7vY3Dr9tN
         PVxZE2q072K5qQ1Be5rw3iBm6CAtGyc2zT8HKvntOVXS7AS3SDojLzxmMVSY5l1F4g7t
         LndQ==
X-Forwarded-Encrypted: i=1; AKwUvByLExDYd+V2U6hXU+y3a4Je2QpriRPCn8t8ni3WnnPK+lp3oU9aY1eCuLIOtiNISeemyYeB/KAC37zycl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+o4+9ek3R62BKImx2ztM3Lx4DE061d5c6MGWxx+MucxTAA3MS
	e7sefbF2R2j/JMRn4ehhzro2Yi2UxQvrhDlugQfvCfyxWD/0mhnWG4mBBqNTvCUKj/35rvVfSOH
	3N2jaj+9bpzIsuQ/PrU7JxIVpzFTyBYA=
X-Gm-Gg: AYBFou38YYqukRAjz9dRL5NqazcB34HSQpSnjmZ932qok8JvgvfLroR8oeuGhiTTPDS
	JldUOxIaOOTc0knF8q8Z4JraomrwSqTM63/itzmsAZ4fnI93aIs9Xd80cKSkbfDw1ak+uJS3506
	oneD2ObFwoH8o2V+q5b7Px2fK/iQHuARF5yk/7pfxrDVlz9D/O1/8lRYV3rluIs7C7q/JBg678A
	lP1po4pN6SQizoRqds3Z3/ExlcvZVQZ7OxPlkeKVIHlUAs9jntBfNIzlF4JbxiFvs3WYVgy8upX
	LRgV31m1ey0xcOlLoWenjEJnQFvFofcIoqiE1mN8X01v0dODmWWMxTARIUq/BAFkQHJjErJU5Ki
	uNLLOAc+xVLTWRqQuW3BHH67Rp3hVXd4djOFk1BWNzuguaG/0r4IqyuQgjOObLJHuZ1nZfMNQXy
	+WbfDU3Eg4NfbcOsNxtcB83ohixMibstBSe6MW32v5f4aFN42shkEObjqEvFeiVLDXE8RcQfm1c
	qqusBn76rx4nc4O/cR60njSRg==
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id
 af79cd13be357-944133d6c9bmr2309888085a.36.1793673579229; Mon, 02 Nov 2026
 18:39:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028033127.82193-1-kmehltretter@gmail.com> <20261028033127.82193-13-kmehltretter@gmail.com>
In-Reply-To: <20261028033127.82193-13-kmehltretter@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:39:28 -0300
X-Gm-Features: AclHuK_mYIzz4cZ8_ehKRxiRZ03pBcXNepnhJXq3gkymb86kIprbsq-E3-Zh6FE
Message-ID: <CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/13] Documentation: entry: Describe the
 pre-counted hardirq lifecycle
To: kmehltretter@gmail.com
Cc: rostedt@goodmis.org, peterz@infradead.org, tglx@kernel.org, 
	bigeasy@linutronix.de, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2026 12:32 AM, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
Hi Karl,

> Assisted-by: LLM
> ---

Signed-off-by is missing. Is this an oversight? See
Documentation/process/submitting-patches.rst.

Also, "Assisted-by: LLM" was removed from the docs by 1e035297ffda.
Maybe describe the tool use in the changelog instead, see
Documentation/process/generated-content.rst?

Thanks,
Daniel

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900139;
	b=3MEnNpYUzzzq8/P32jlWvXo1j5rcTtYsSoTP5OZpNkbBTT+E650imgS7bXdoUcHdGEU2
	 w9L70N6NCHaWdUNEMJf13RUfGls9bo2ehFwCFzP5r7iV2dzqwIScJRFuuvK3z6EDH2fEm
	 WJsk57ZSXNAj66PE7eIxtk6rZ0IIRsx2/EKzY87VV7ONCIpXLuFMcBUUF9VYkSH4Xxsaj
	 dLB0zl9FHPje8hfXuHaqwnOmxVmT8D0d7DKwnkA/9vLl7LDX+hwA4bCxiyWmYayHeDvff
	 zGOFwB8ez+O1Y9m3pj5VyrJ8fgetrjmBwWudoSlZBZS08aIHFNAe5UGju4qtXvcJJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
	b=1qcBETA2mHOHLAoMjGSVERAG2kMfvhPgWmyk3zy7pFXvy2KgynV2p98hPlNb8dTIalXl
	 vqSEEt4gSIdvPzxQXA22eC4ZRs9+Q2Zq1ckO0+4DwRAIWkgyc6kK3Q0rYITvhE12Fzawp
	 oRXwN6o4jsC1ecxcQtaVP5EETj1fhr6uILvm3i3aXxBfOLoPLkkuSmmJyYURBvHx+cK81
	 vvB0rSCqSX75POziw2kGXzqMbCUyTVci2/ypad3s08iZnAMG/tEqDkD21bA/iarrwluCj
	 cpZdMD+s2hHiuOI3Ul9Lw1Opb9Y2p0Yg5slSdGc/CDpXosRQJOYucHR9vpEsEdQQyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5nnzc4H;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C3606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5nnzc4H
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4923176309dso302247f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900137; x=1794504937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
        b=n5nnzc4HTVp02Yi1ph9LI3YnM5HgC8uVW2GeiUQadCxo9704l1ZItXkY2QP8kGf6zA
         RqFyfyJy1E18YMDvobl4Go0N7g+M584NANE5uRPqDy6ZHSuCIgGVuoWB0KpsRZ653T8n
         a5C5EESnUWETubsdG+44Hlt/6S9KfppEo7u6nYwCk4l9Ji1EjAInZcWrXJ5y0f08zeut
         HzKxEEqdje8USHdD4N69MdSZoZnK4VlcMWlx344bfnaRvsYQ5EGHMr8xXmClNsHYF2ED
         ILAnNX4cyeheq3XoraKYYPoDJ3nNCNfmf9kCZ6X87IXyjdgOoq4dIErCr23Ok/1ngK5Z
         57vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900137; x=1794504937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
        b=lrYPwlDxGVwBtECaqfQo75Ck3Z9p2wNU/w/CFi6xEXG6GhnuTXk47xh3fD7EadF9Ep
         BCkV1C4FEXXT3e52HP28nBJCg4MSLPIT4T8ak66ixPVMcd+Q7iQGghzaTTK5/KhqRZHI
         fIZIvKves7Rb9GW51T8AJuS3RCFI3TWHRiAVi0F10O5oW6CWN0eKjDo8irfCwkYArw6g
         0BbkCtJQhPLYFDCMofwi7ApzsQs6bK2AO4Y4Ap/idutRKB9Z9nxcB7eYxqYqrk3sY6y2
         wyHH9qPCQxdID8V70xaucwEcmAk2MsjyPkgBauBsru3DbFSZbId+E/PpoSOYdBaC9dRv
         Ee9w==
X-Forwarded-Encrypted: i=1; AKwUvByAP0C2i5jVuE5A9BgK05CwTqO6NIYTd2Fth5Xofk/JAteQHfY3IHYC6X8RL0ut26DY2/55paedw/olCKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oIaooGZd6fuX1lziUqvbdaspHpn+08+OPvg5KUZskReEc4cEx
	T8Wxduc10R4o/MEnGvkWYAdh99AYrugGn6QeimzhuNE9iv9Z4UrRX8hV
X-Gm-Gg: AYBFou3JFT1D0LsDFJcI1fzlsFjkxbYCBWtxHhaZtmGOdkLdfpEyWqnAbj8NcboS+PC
	6Jjzbrym8KTLAJxeBuvufJf+BKvlgno0jdjy+DdVk8DctvKrE7yCc0TmkwNc0246QMgXycJscU5
	Yc9sjfEoUMmFMQE6GyjRDpxZHtEvhie+F09+3iPjKsMMvGj1HqM10fwejcd89a8x4EuMdKaLlfu
	mkXlDr4vGEL/FMV5wEHsgyUU06Gzh5Ctxezp17TwKrbB2lmf/bBJWT3eEScz3CElXRJGievEqRu
	E1NKBxeKR+juoTt/n1S8dojB2tA55QWpblY64sh0LRkw7mdHE9IchWlftArKvYebExke5RVzu2t
	QuHttZFQYlcxsn+tXbi/ziUEgF/GjY77CoRh+v/fYKXk1ajUPhNGZ59SiYo+UN//cqlxPoEPOWG
	NGO6nFc9oWA8yyM3We1ZrwK2o7GRRWzo8Eg4SafSQ7tIWQjHy+r7GSq+o+rF0hDvHzkkxI9Rzyc
	VBZeo0/17tMMAeFBaON/pKq4vScNlX0a7O9nDT5lE4oCbZLlRC/aFCCHU5UYozyjzNF30F293ci
	QBACTyPMReKxl2F8iFAZgvb7Qn3C3pANA9w6tFcIuuQpNQ2UXJlgbPILNL10ftRCJQyk5gkVtXJ
	cU7ejVEB3Ee3mOZtbArzpHsUyy5Cu
X-Received: by 2002:a05:6000:2484:b0:491:4ab7:fe9f with SMTP id ffacd0b85a97d-49276f3801cmr659303f8f.57.1793900136939;
        Thu, 05 Nov 2026 09:35:36 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11722895f8f.40.2026.11.05.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:35:36 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 18:35:28 +0100
Message-ID: <20261105173530.39081-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auysN9YTg8Ih8QLZ@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza> <20261105153735.5368-1-parri.andrea@gmail.com> <auysN9YTg8Ih8QLZ@tycho.pizza>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 09:25:17AM -0700, Tycho Andersen wrote:
> Seems like a solution in search of a problem to me.
>
> Is there a sane action a supervisor can take on failure here besides
> killing the thread that made the syscall? If so, perhaps it's
> worthwhile. Or maybe it's worth it "for completeness" and I'm just
> being grumpy :)

There is: seccomp_handle_addfd() puts the notification back in SENT on
failure, so the supervisor can still reply.

For example, if injecting a descriptor for an emulated open() fails with
EMFILE, the supervisor can reply with error = -EMFILE, and the target
sees an ordinary syscall failure.  After an interrupted request, it can
simply retry.

But the issuing thread does that from the ioctl result, without an
additional poll wakeup, so patches 1-3 would only add completeness.

I'll drop them and send v2 with just the RECV fix (patch 4 here), unless
Kees would rather keep them.

Thanks,
  Andrea

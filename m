Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228775;
	b=xfJC6Pp2+0/Dy5Z1NPDWEkyYCQtnHZmbdCcLE/FrqkRRuPhaC02mjHl8wWujEl9pXHDP
	 hrYuwLVtQTYMIXxXVN7mpXvoyt1YTdC+AVEKNt+Hb0u0Qpe/r5xpS6AxHbM8gEWdQLMNp
	 jRnjb/sg0GtCBkp/sEOYw3oKSb0Pg8vY/UxFLWSAvkzIGVeqviazOpZqGzhUMr8JFU5Qy
	 NCwuevLSV6L0+9sizFgs6PWfzOaUn57e1zxU5MzX2evw/AGX/3pdkym4h9AvQyn3SHA3G
	 X6FpY2iWpkdO0FuLvJoMNZIr4ibacV58XeUrmu1fxU4Kbc80dK0Jn6sFsUFDxvdQSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=RRwJGffnxpRMl008HsscyREvqQYCgJotMlfMjD+LKCw=;
	b=23CvoBm+n3nW8RTN/WWSjIHLdGs9+HvE5AXsEKifpalzGWzCzBOsPd7MZ09A18m0em79
	 dOiJ1qONecsmRvCtU8+rKe2fCycD9CA4iebmArAChDg3QY6OimcvgyiZSlBWcUR5eNBLM
	 MJxlVR0U8OlvboUluVnpJWvjGcI46HBCWIVBHGa8Djfarl0U98t7QyF8kgg4JysiEslgI
	 XSFToRlXPRINXlPNx7OYuRLpm3kEnnacqkLRpHBjhlz6+PNzmeBLP2foo7b83qAdpODIa
	 d9KfHqbsucXZGNuN0ELVaYXEYBN6ompYAoJCbl+IMCxTzAc6YfgOoZKfYz6Ef9WMg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="CJ/pzVWB";
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6533A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=CJ/pzVWB
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9906870a9baso361745241.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794228774; x=1794833574; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RRwJGffnxpRMl008HsscyREvqQYCgJotMlfMjD+LKCw=;
        b=CJ/pzVWB9z8B/bInab8HFnI9RRa6yN9XEo+CC/qbpoZjQFSWzspPFl1MCXw8hwYS4p
         Y69li12F2MmbMODpa04fpQR3rDgPVDYJXiEWgEPj1hOY+NsAJcJs830eEhy8kGNd9mYj
         98go15p23l2AA2js86vBen4dIak7GycoTI/F8tZRtKJFLcmRAEx25sQoEx+jdH/dIZyS
         5u9S12VyGuV8hKzp5UN8BExUNNWBgfQx+9LRBt1qRtWi9g5+dzPcUCSAoR9qOtzP4auI
         boye6bENjICXlJTBPd5u4Ui0UOuWjqnfvx3iao3RguFddDObRK6KE9get8tGJi/pL5Li
         xE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228774; x=1794833574;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRwJGffnxpRMl008HsscyREvqQYCgJotMlfMjD+LKCw=;
        b=Q4xvkYqfDc2zdnK2Fwsy/0Ssa5AnHUvlTZbsPtPEpKqDfkWvyDqPaWHxbKUelkou75
         nYve0E7glK0f0M82pwYDxtLkF56j6t5HjZ+Ze00V5YpYTIMOKxvhrre2DEr3hfblI9NE
         snJHZnn/4uZUinkldhyLj8vc/VuW76fQgyVMn9iiHcuYBLMqrrPI/f5P+T+F/hQCUMJS
         xaZi+ZRuchLq4+aiD8R6OwwaMocjUHl2nywkJ8X/8owUWhKY4ie2yKlH4v0LC9t4hLAX
         7YMqDw4VRjucgbs6Q9m/PBf+eoDT+vgPvMwFzNF7QjcX6nAqK08zXAXeBbErMMUfndSL
         KqkA==
X-Forwarded-Encrypted: i=1; AL+hErEEOf4cRdhRzv5IDck8SSWo9Fi2m8UPEoVBIEfiFCHiYNEZJHxxuT+Vx9sl2fEdlR1uRWFWhTku61WQq3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nP0yNb2jGZc5E83N443xOu3OAKygvvV/CYjIq8xgPP8xDFUbm
	M0G/Q2OcDQuRVuuJZgQWvCWuIz9NoqRIX8X5OfJjxKfr8gpPOfiVYFgxM6pNWqezQv+sZEY+OYg
	7xJb6
X-Gm-Gg: AYBFou1QJaH0/2zgFjrKoCNulzuoa01xyjngBPWEdqLOLGOk9RQrdsDi8bV8nw0YwNT
	k2mFQfaZtoYjji4CM76mWFwSyU4IbyB7+7M5A0jsvhHO1q2i/QVDCndJye3YBodcI+ZLrP7vKC8
	oe7O7IsArCzErxaxR3SRx5IZzEzylQMhcsGfAujDPDDqd+VmXP6Dqe4uLfSpnzvxaeW0NL+K6Vh
	Lx0tzu0KSJ7FmWmyqYCLi3wO4SBfDkMPNjglDwRnvNBKa5yMGF5RGd1yNzu9indQpE0r2pYzJ4A
	Pa0AXlduJZuh2XMmmzwluFUer1Kc/uvAbsL7Ff48cBChGnd0+prZhuZG2NjHlUGEwDTWVj9XfPQ
	HAPQ2Xs0jc0vdgmTQanc66eBQtOGCuZKlIX78uOpM/p2KE3Dxhf80hmiwRZb0LiSgeapECQNOvh
	XrYIJjRzWJKvtclap5wtg3PLbEVNA4+e1BXwAO2b+yK7OsjTJnyNxmr2wFKjoawzfxQASt3Umua
	qZo2JxBwwnVpu2MrFlfcp2rImoz2S0JEcgh44XaHPAQ+sLNbYyU79Mizp79iNfPiBoR2Lpcckpb
	sIp9kN+KzKN0DG3P92gQv+xZf5/tVeTrEERCJcrUnu2gsXQJ0mzOdft44VweASlVZ02nSxc0Ukx
	ghwe0DGrWSbcukcwLpICnAwT7yZp4BBI=
X-Received: by 2002:a05:6102:2922:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d2db26479dmr956481137.28.1794228774214;
        Mon, 09 Nov 2026 04:52:54 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c029dc215sm3420373241.5.2026.11.09.04.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:52:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 07:52:53 -0500
Message-Id: <DMQP0NDPOIFU.2OTZQS1GIHIZG@soleen.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Remove myself as a kdump reviewer
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Dave Young" <ruirui.yang@linux.dev>, <akpm@linux-foundation.org>,
 <baoquan.he@linux.dev>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <avFSU0f0aE-amdls@darkstar>
In-Reply-To: <avFSU0f0aE-amdls@darkstar>

On Sun Nov 8, 2026 at 11:55 PM EST, Dave Young wrote:
> I do not have enough time to review kernel patches though I still
> accasinally scanning the patches. Drop myself from the reviwer list.
>
> Signed-off-by: Dave Young <ruirui.yang@linux.dev>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e9fe9c2a39b..7e18fe93d4f9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14145,7 +14145,6 @@ M:	Baoquan He <baoquan.he@linux.dev>
>  M:	Mike Rapoport <rppt@kernel.org>
>  M:	Pasha Tatashin <pasha.tatashin@soleen.com>
>  M:	Pratyush Yadav <pratyush@kernel.org>
> -R:	Dave Young <ruirui.yang@linux.dev>
>  L:	kexec@lists.infradead.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.gi=
t

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>=20

--=20
Pasha


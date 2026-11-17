Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926582;
	b=g9Jr0u3tD7fZs5ufEAgQux+YwwFvRpXo/xqHoLShEpB2bNR3APmhniRg8otL9iXClZ+U
	 ITgNoTJ5n1/JZlaHYgwDibtgr7QQThysdIX3ULASL8977KlyHZERcVP9X+a43U4+NPVvq
	 f+ig+KMgm5kleinCv1GLSRlw4n5V30fdtuXatskKD9ij4sZI+bPWpxEpFtQERmW6HXADz
	 /Xan4/dSVPOeHYLzuxMmkkcUEGSTBpxEtNmhHWvyj9zjB1c7lTbSjeXqjS+/LHKDXwL3d
	 ZVz2QmTTsPLBgDReF4Mt2r+JDvS/bGoJiOFtXkGSrOvjAeYgfZmvyK6eSaciP3CaXLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mFFppih0TKeAmBlozegLc3dJO4TeAO8W9JK0t8QJe+E=;
	b=RUvwaPSbamO6D//XaZ5APFeirO52SQLyaP+WsUuGuBWzGTfg27dFmmn9378vN0kSZrTN
	 CO04A70yM0DCG1EOVgRjAiSv/eWxVJv0kHLONJhEgnodpFhs+U0XE4sLgNn7gN13/+wRb
	 ubNWxcXblvsT5uqm+ZJhIgyKB2J+6kLvQDZ2LUN0Z289HWALksUJjj2XKChtyAZ34Ftym
	 Hjhwa25Yz1GcmI45+4QR6hRHEwwu+244pvtGCM2e74wXC3VEQeLoDEjn3125ioQ9j1iBI
	 DQRX7lYhbyNRcT/b7QOAVgtm7WuE0FH7G4AHQ2hqzC3tdjdvVyNNiCjnAEDqaqE83Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJFyALI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D75606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D75606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJFyALI4
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-705cb6ceebaso4819123eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926581; cv=none;
        d=google.com; s=arc-20260327;
        b=FA17xNkvU8FzQE9+5ldXECw7Q1CKZb+fh5qmooyUWfR+cvTQlJfa7k8BM7G8fP46i9
         dPvsqdkYzu8x1O15x//8NQSbLTnaDNUs2CAQmyAWm8K5TiMlT+nR2wtqiivZEVqi6Lqr
         83yJwbfm4a4SbllcNkzvHo7dQKA8rS2WibLjS4jHRDXA9edAZUxkfTQQvQ8V/zCVEq6/
         W6AN2M9qH8pBL32WkG40Fub2QW3z/Nb0sj19h3QhGZw/TrAbwsqzJOZodAKGlwwPpEdF
         7hkTmEzy2QlQS9LqmaqXHXSJFFIPYhl9WLBZhFIN3Ukn0QY1lpnKizAt8QEkdTuE3xbA
         AxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mFFppih0TKeAmBlozegLc3dJO4TeAO8W9JK0t8QJe+E=;
        fh=Xvxs7voLv1LBwKQucpZKEgRS9xirUV8PKYUlf8sRxOM=;
        b=naTwqtIowNH8BrTZKeipZu8APO646ebFbGHg10Fsbxg6bhFIDzRPMfJzvrc6C+j6C+
         wgylUtsHUyP6CDugj6w8Vx9XZa3VWR6eubetS+aO9B6TQvYxwKgKgzhMipAHl0jYMdKK
         DfpnDSpe3mj+YpfXXszuD+xxUnidiC4I1Ex0IkPxnIMDR75hJkJdeQOJl78C7JWxxKoP
         1kCIhYt3NhbDwMuiHHJqldwFt+3HG8DHNNdMVzjEyEKFteQgyJZ+quUaFMt2sPck8XAG
         uzPlJbwhLh1BVWIlWTJB4xYn7N3+qGBejiZopaRlbeXurswZGqSx/mboXEszex3aISE/
         /Dig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926581; x=1795531381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFFppih0TKeAmBlozegLc3dJO4TeAO8W9JK0t8QJe+E=;
        b=QJFyALI4SWCk0EfYn9jA6YRHA5NvoncsH+avAworJDXoAapfHLDlL4J9vzCj/I7VtT
         6xWlVMaXACxZ3jDKQtnhtPh30LNeXM/rKWUWW15sHM49uiGuqEPRI5oBcTGmw4NXfKLM
         YtG9WAs9T1bEbaRF9A7b4mqhmOshY5Fv5z0rkG7dr/9F9J7SOANgqZugBCTTv0G7FRZB
         9gBm3eQcAwyV7xntlNTIkVE4F93qgQPgqVZNqx+TQ9cdATWANXl4s+wX1dTDRL2dn1Hk
         iA+7WGgIAr7CimKyj4+ga82sfbMzQCrur6zlOPoCWKgnHI2sa7JwMokXyDEPvO4vUoyI
         8rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926581; x=1795531381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFFppih0TKeAmBlozegLc3dJO4TeAO8W9JK0t8QJe+E=;
        b=05iA9UR9/DgvGhU5mtysZwtYunNzM2YRME0tBaEnInZxlvD1Eu7g9OBGmwF2zHxZyU
         mH3jd+T0n3D+8081Fr1tO5yN/h8Sh2Gh4P3prAYIfXPR2XfZFHQzw0Ci7ETiyLMqBjur
         SZIM9o39HUnT5lW1/E10i7fr3pvVLmjwSq9Us2pony1LA5PGUAryYFFc4y3jNBPVza+c
         AXsKcEpl499GQTJG4sm6VpTATFtEeu9lq/ckWbA9PKyhwbQtK1CMuoDQHuoz31PZ5jwl
         a7iP7p98IB+b8Ya6V3wF+VZfXeNqn/NaYc0276gldW6Nj+x69jKnzpoteUGdg4sNvhyX
         fjPg==
X-Forwarded-Encrypted: i=1; AL+hErF4vpGEcWbLiH8RFcz9eaZ7rZ/nrp4bXdtL/s301CwVX+x7lwVoPS4zSjuvqemCjdiWPPlu2Tg15ON16pQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+589xlfpYgJz6PLtc0h6ha90k8A/2eryCYrNjw2hM/TOPP+WuS
	nxXnA3oSNPfqJ8/9a8Y4HnbZVzkAeCa+A0jEShS6ExyeqHXVB+GS4M4U4x33hRgMr4tKgXnRG0M
	10ZDxxI1/nk1BtZv6Ljw5vbHhpYSRscw=
X-Gm-Gg: AYBFou0VZrEPXLDzi0Qi8pIU97wkEg/Gieg1KdRYDKzE/VncqfNqtwYdgFy2DF1qRke
	knWmU8XSsQtHd055gNhvySigWuJ+7i8f1daIxZ7Hks965otZEmmvnsmK+jl7TcXzFYvideH7aIJ
	h42liVf/+rm51ROWMeN1UQSWvxxahCPwsKhQqdX1ymSRHTZ9sv4rE6LrMQQLXFglXDBDGLfxPX3
	DlMXLEkHknxoCpOY1VALThxge4eiWZ71qNax2rNDim2rJup3Y4O67zinuoABbSscWaC/H0XrQUW
	4EcEvXyveVy1Sr7Qeoyx7S33dX9RDcgLZAvhXjTWgLlJGYwZ8u3JaXCO1jg05XLGMVD4+3syRrY
	eu8QP7AogUN5sdcxLWj2IRJqbGRIcSQxG8zFxfUJmNFnc4Yp3XBZyV+w/iv4ugmU8+UIxKBbXCG
	0wupGEOfoAeHrQTC0rDKY8/NotE2EWoa5dAZW/Tlc=
X-Received: by 2002:a05:6808:30a2:b0:568:1099:ce28 with SMTP id
 5614622812f47-56e65002973mr12925992b6e.61.1794926579964; Tue, 17 Nov 2026
 06:42:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110132013.732-1-obabitemitope765@gmail.com>
 <179487776546.3663701.11916478949345242482.b4-ty@b4> <19df2f93-adbf-47d3-84ae-6cca78b34df0@intel.com>
In-Reply-To: <19df2f93-adbf-47d3-84ae-6cca78b34df0@intel.com>
From: Temitope Obabi <obabitemitope765@gmail.com>
Date: Tue, 17 Nov 2026 16:42:48 +0200
X-Gm-Features: AclHuK9knjaTAf6HGBpcCieJdjJkhcXQYJekWka_wZYVkElFkWnL3lmGgX35pQ8
Message-ID: <CALUk5xb+WR2ArV0vDst_H=zjKCAe90saS05MKS8YXdUFMUOsxQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Remove unused sst_ipc_inbox_rdata tracepoint
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the confusion. I sent this as a new thread by mistake
instead of as the next version of the earlier patch. Please ignore
this one; I will continue in the original thread [1] and send v3
there, removing the whole header as suggested.

Mark, since the single-tracepoint patch is already applied, I will
make sure the v3 header removal applies cleanly on top of it, unless
you prefer to drop that patch.

Thanks,
Temitope

[1] https://lore.kernel.org/all/20261111223102.1310-1-obabitemitope765@gmai=
l.com/

On Tue, Nov 17, 2026 at 4:02=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 11/17/2026 2:09 AM, Mark Brown wrote:
> > On Tue, 10 Nov 2026 15:20:07 +0200, Temitope obabi wrote:
> >> ASoC: Intel: Remove unused sst_ipc_inbox_rdata tracepoint
> >
> > Applied to
> >
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git fo=
r-7.5
>
>
> There is a separate thread [1] started by the author that will conflict
> with this very change. Ideally only the "remove whole header" version
> should be applied.
>
> [1]:
> https://lore.kernel.org/all/20261111223102.1310-1-obabitemitope765@gmail.=
com/

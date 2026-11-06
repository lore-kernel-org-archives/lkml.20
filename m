Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999279;
	b=HtS6gJ5+iJcfS1YyBzKnQF0svDml1kdbvvnxIKsJbcrJ162y8lAsPcMH6gvu4bPZnn1+
	 ssNmM23UUuGLn6BF1oc8GgsxD13FqjNa+3QWP2Hc8ov0/9YCFbbksmJ5NFPJjP+u+b+bR
	 GewuGaMZ8dPW+FkR8UMdWA6nRYaMCX44/H42wmzIfFB5dSUk1KgRel1WxByOgl9xWUOPw
	 y9H/JAOC4O/nEme2tOCB4bSvtuROUTZaUXL51Ot7u9R/iemOqkFu/HC9Jap215VfP2Jzp
	 bqt97+hAJoPLy0gUR1F35sMrP4NfvNWvC46UObYl3ns8PBEI5spcQY2IG+OofeZmErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999279;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3iBS3zV8WHqjwbVMxtCLtEp/LBn1asFltapZVO98Z9I=;
	b=SjSA7vrLWS2mAKkyVcu4ADqeOrSPDrwhUhCwXOHs9RQ0WMcUNoI0z6DmUKbg0xor/rky
	 2Oten0+8Um587dbvK1UeURQKH/0AadlVUBPYKqwdvoe0pct7LICyhz3tpFIZusXtzfQL6
	 Wz7lkqwf/6I0ZF2uc+9AA7ThxT1FK4Vj8OPTiMUI9nBWDjh8FQFyFKKbWw5AiL6YYPnjM
	 Cq86/RVg51JNyivSEpL66br4/oylUfTfNLCcIA8i0QqU+IJsmIACLoHSjAOk8CCdGuw4l
	 TQE0h/NtS58P0uQvpQvEKlxaW7dP4ozfL2Lxv7Tu45E+PLuLE73TVHIIYHWPTXuYV8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=EyvWLVY3;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE89606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE89606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=EyvWLVY3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793999275; x=1794258475;
	bh=3iBS3zV8WHqjwbVMxtCLtEp/LBn1asFltapZVO98Z9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EyvWLVY3k6yT5FZGZPx4D4oMGtKAwJP99ROMKN9YJ1VrtIE/D2hAwtqoxHzsFNTjB
	 tMrgxRj0nKFpduI/uB0jPf5SWM+gTfM+p9ECUUrZsliDA+4goxzap4P9clDs7EtE4f
	 7v1Nn5fFv10RjvEcm4taI9VNEaAO/OSR8dfL9Koa7Ur7ByU0ezvyiJguAE+BHqJgDO
	 uopjsqEvT89DLbu99b/5XJHYoob1RaN6mMpIaOnkVs0gKfz2f0LfnZUpbwuEzVN9Bg
	 ziX6cx3mew1oBBUcmwzSI7kb9UdGLeceC6NqF1OZsxHfuYk80BCEUMTCfJJuYbCpBt
	 OgUrHHxoii4ag==
Date: Fri, 06 Nov 2026 21:07:48 +0000
To: Julia Lawall <julia.lawall@inria.fr>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coccinelle: api: add a checker for device nodes in devm_ memory
Message-ID: <20261106210740.3317795-2-ca@modelmiser.com>
In-Reply-To: <5f30dd50-a764-8e8-8b27-5c26ad10a7dd@inria.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com> <5f30dd50-a764-8e8-8b27-5c26ad10a7dd@inria.fr>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 55b28e43f2ee1046bf209bed4a35a021ea0b29c1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Nov 2026, Julia Lawall wrote:
> Have you sent any patches based on the results?  I'm not an expert on the
> problem being addressed, so it would be helpful to know that the semantic
> patch has led to patches that have been accepted.

Not yet. I'll send fixes for a few of the reported drivers first, and
post v2 once some of them have been reviewed, with links to them.

> The problem you have when you work on a subdirectory is that it doesn't
> know where to find the header files.  It should work better with a -I
> option.

I tried that, but the header (ipu6-isys.h) is in the same directory as
the .c file. With --include-headers, -I include, -I include/uapi and
-I arch/x86/include, on drivers/media/pci/intel/ipu6:

  --dir, with or without -I drivers/media/pci/intel/ipu6:  no report
  the directory's .c files named on the command line:     ipu6-isys.c:990

make coccicheck M=3Ddrivers/media/pci/intel/ipu6 loses it too. It seems to
come from --dir rather than the include path: in a copy holding the
headers and ipu6-isys.c, --dir reports line 990, but adding
ipu6-isys-csi2.c, which also includes ipu6-isys.h, loses it. Unless I
am using -I wrongly, is the header matched only for the first file that
includes it?

> Could you rewrite this in a much more concise format?

Yes, I'll do that in v2.

> Since you only support org and report, you don't really need depends on
> org || report everywhere.

Thanks, I'll drop them.

Chad


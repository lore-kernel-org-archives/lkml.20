Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414464;
	b=R+3F97P0WMLjKzE/Zjr1LKBeIWLm/UmReZqJtzgTbySFSuXshh8aPaUIYRrbvor/QCBL
	 oVOtcW6Q1dhu2sV2683cPbEcJ2hn6+2tTneO0RAKKWxFJCWCTaYvsNb4HmMLcvTPJGZO6
	 FQ54DKi/lZ84E7PMo9dYiSciNsXMygHu4BmK2jCZcnR4vPiljr4Nkd/w+PZ6fjp5A435b
	 uBWWDpV6QxjVghY8RizzaGsu9dDOEKnMSdzXnv7jzPan47Du3cq58D7f8vvZn316ha3yC
	 hHUmuIaZC/G+2JAF63Ros6r3zU2cfjWvu+gYh0rN+QQpqxbEt/dSTr19taps5TLiVHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
	b=JhbN3SjWMYMkMPetetWDql3mIJJWWJ6o0F8HlqHfQYhnjGrHvChaoEwb7/S1wQNAnOz3
	 yxKlasEbQaw11TOJlspnSvVcyQutI7T5Ag4fow0/ZAk7ricMkIGRXsLjCSAS8RCk7UolF
	 NTYO7muV6InQJiAM/up59/RyUyHz9hj/K+eEclUTlqbqBu4hS6Fqsr3WSrj/zluouBPew
	 dFOtjG8RaBuP1aPk49e1aQ817Cx6k65UQT7zoNC34oyCuJn8M21TFyV088bKdKfdEISYq
	 Zh3KtFWOZSnpaM23BQASJ+8ffFAp83A5SB8kjV6YTrbJ2eBzaua7ue2Dwms18pPW3kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB79606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB79606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so98547eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414463; cv=none;
        d=google.com; s=arc-20260327;
        b=dbWjm7qX3cHR5p80kvd7qApyxHXVnTZMWAKUU2skfxoS0kCWVUrIpy84lQWdIkIpF3
         +E2tPiSVu9Gl28vas92YRmYUGQOoM1CCkg92iajIN8NZuPtyWGXaWqvmtWGXgb1AkXrp
         krf8rKYXKT1qfUn4kzhWQAiz2EtH5H8Iw30ki5tJD6QY616zj4ccUyMsyrSKYaSOUIGa
         6oPLIlVlFVOfDkHpsWGOxgj2HflC/02fwiR7a5CzdSZ3wFRnkxo4awKIVGG3RCrIyKtD
         /B831a1H8oDkPbQx82Ev64PPkrBfK/CzprFInOh4xGtdX52gfvovC2XRb6Jr/vsBhdv/
         eHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        fh=Bruwc+YMso/MR96lX6QFkracpkhUkpgfIwb7AhRmees=;
        b=VBvysZ5O1BxAz7Rp7eIkVjMohD0F1AlGt3tzfYFq1kYmHt/sMAdRjT/xd+amJgwVOP
         gbFA23pT2ZG0zRjQvD9kUwuFWlkomIZ9V3hhGnx/WtmMh36LYu/xYJmp1HdtxhAqCLW0
         0E8rxK6IYXv347o5J1W3v02xJxOoHigoaRY4igxdUxw8G47RIKPNubFOB73aVGdo4nW1
         r5TF7+dK8QlZYY7KYReA/k58cKhPbyk9ThK8ltKPkcsdLqnGHKjxdZO+0DdJJUtaOQDl
         ZEWyIjSdyV+I8u8/bf/jLfwNKnxyTzXbP5OigtZW6MNHbt2N44b1sAybUN+rCHcfn1Uj
         HSCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414463; x=1795019263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=LVdq0ZL3sZPzYW1pLPrV0cLEj3jwdj2Zg7RoE2RuOl2Hhv3wgcEiaJO901riGgUhRp
         IRmN3MLywL9Pn7R2fVW8nhJVR+LInKI2Qr5BxzQDfDshUwk+yGiqksCMb7nETFstAL0t
         aYyyQGr/YToFkc71VnaALv9merv+obCMqfGTJQeotkpUrl9b0/WwXHs7DrLaktruuqtx
         rS3+69M9Qm3zNCI6D1TF1zXhsnBD2CbJv+rFim55I9GGur6FBs5ZrHlYQ9NKw6Kh71n3
         O+4cIuAANTLZPxlzg4y+yM++fGnOwYdoJRQG8fWa3t99az16xcQ60brbYKgNLRNuKF4R
         momA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414463; x=1795019263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=jnOukk5NrXkPghELDwvretoN2z8pDpPyZC5ELsy4CZlwsmyEqN8WrUOkNDJ2tIPTZ0
         zHj11bXczI3SKbZzgEmachZMTzDLqvcQgoHYt9cW+agXrVT8CwY3BRHY6ovrF9eTAmQx
         CbfDlFf/8GDA+5pEOJfqntgLqxzHOCvYfnv11DwQME/qRRW+PrbbzsHZiHeK6RTOZLb2
         f5oCxulOejYPA8R0f5lQam5vTBqbuELyvYtsomXl7n5SUB9OpaMcMRz9X2QPcd5PALtQ
         YPyNpTkxnaUrNXDUKyTR/1RBUsC92Kk4YnFl7HLojUGx+Orh9TKgQnDnGBRxFftpl7M2
         Dbsw==
X-Forwarded-Encrypted: i=1; AL+hErGejvy3UIA8SSknZGdAXE4dVgkhulK1OSgmTf367gxguvqd035KUTglZVkrwHxLjxqnL9cFC/17x7XUWb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NkBJzcDLWfTtUcFJzi90+OxlLLKlq7Qm8tUqaJxV48HLs+QZp
	HF0CZ+cyTdUIpyyivJR+PF77zqL2xQ8xl8iXJndioo9eAx54a/pOm2BsJojsVAGc869N1i7zqMQ
	rqVVBFNY+hkYr5HK21vJZ5gk8bWBVdYU=
X-Gm-Gg: AYBFou2D8CzspqxIhPgtTHQp95feJl14LP9kahILzP33kXZmGhcr0tXBBFhTi/sbPUs
	HZ/jKj+7qBmfHcUHNqoJ4e8a/bpnMDIqOxi2wUjhnstedYJQJQyGJ19Y1gadXEuirmkNqCrk0+Z
	Ew7BO0VqvW6Y+BLDIGBK0iFjRdP0gNiPBTPC/6JYJSCJHbw0Gmk0nIwvDnBn9r4foTJyV78E0dr
	B64c62DkgBKDEaqeUY+jQyLtPtQMcPuhgQxGuerDThFF7Bf4tM5xTQGDFtYxZ7nxvTOGktRwVBc
	ib5iBczO9DBGCCAkTuEgPVr3HubOZ78sFUW1Z2mLu3szP6mZe+IYHB53LwOAfmqueSukLBAnDY/
	gesw1EtfYX/aY0amFwqE1Pjz0Yuzbns6hwrkH7TMYXbeqoP2a3MNrR+5Gr8q6eeOw50sgDh7q1M
	CCunsTzl8TAwGtInbQnpQC2X4pXchohwkQ86MGUUBDIEb4HV/waoFYCiELFY5NpoLQ3VdYGzhsv
	0dVd3kZiAhE6eepPg27KIRAw8mv1A3hoVA=
X-Received: by 2002:a05:7300:7aa5:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-37685c76d17mr4975850eec.2.1794414463417; Wed, 11 Nov 2026
 08:27:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avSC7GXOwnbuycR8@sirena.org.uk>
In-Reply-To: <avSC7GXOwnbuycR8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 17:27:28 +0100
X-Gm-Features: AclHuK8AgFv2RXK-XtwjJ8NP3w2QWHz_WEO_LIt_zbf7rr4iTP2nvLvmm5WOtgA
Message-ID: <CANiq72nu0CQtZxODepvZOEoD0biE56Jx_2-exBvB8psL_Ynk8g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-fixes tree with the
 kbuild-current tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks fine of course, thanks!

Cheers,
Miguel

Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CF3AB476
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255862; cv=pass; b=c2kBtksceS/uwmIB7woBxa7IgoKD85GIwj8iKTCInbu1BUMKAapWDXYBk1xORSWMB+rkpeAmn6kh0AV9hHRHaJHDW8CBLnRym7V7yWzIXaJxIlZjKpEJ4bGPeiajEnfK+GFcjwV6akHN8nskUoLnaEwBZ9btQ7MGlyl04jHwB6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255862; c=relaxed/simple;
	bh=83M4MyXq/RiRwb7EafWtGjILCKuDrrHlOjHO76QYXVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOSqqjitqCKGrn/+e6sOpL7lyPs8sS/OzuQJLJt1BK5gPwWmuiAuPxlkGsaXiNGP7O/G+hNzu6/D95lcpgCiCOXIJ/H7Ur6gGbMvn1akb4NndsWWP2OSTVE7tP9Puwq75gqrwdEhfpwwv2ptMK1D9NB1dXGInyqowLYzJEtt5P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=Ni+qlc3z; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="Ni+qlc3z"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-539a57a0b1fso343897b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792255859; cv=none;
        d=google.com; s=arc-20260327;
        b=hcz/ZY1TzlaiAHrTgjjNGPjGfltCKHmxzLL1AJffTc7Ny0IYCl3IyD0rmFLdINMfhD
         zZEuALAOrsvHGEHl/8nCHubJOxThPBPdRWvMY0nSF7V6zOSFuYB19OR+kTTfIjGrKtTk
         NWSAjRmwADag4GbQsaxvLYv4b/SN2H6jC1mtcKuT7HkR95wHdvOnPFvNE+UCDS3qA65u
         MG8ynR0+gJYfpnC/vxgubhgIyiDiNcJbOc6cPXZpEtSniH1RVqqeI2wKbFd3cZGbGtLL
         GvFUEJOy9bLKdb7zqxSZkxtWxcZjEuX+sCkNqoSAvixyTB4k/7AsCR7nD71aotFqHdex
         N3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        fh=HCvippN8DULxCbFbqXW3LZIYHbl4GLNL/1wVL8wp8yU=;
        b=YVIf0ve3RWaKtXRtq+HNUkwAo7owGZ7URuib/MqHK9LeOTx1Pmjxng9vAltfOh599e
         KRHsLtssrta7DcyCIH8qAOlO8862Z+WDCu0+uq2y8X2rfChcMlsPugjdAQ9OJbVwzinh
         R+YJk08uSuN7xAoQUOXF1cCKxeDUKD2i35mAJNQw6dQ+trBzTu+gLL08Z5Jhjd9Wv8zL
         8r2yGYbaQiH56RR3aqVsEj8EMeHy+O69es6lmmrfcnTa1hBSB3rwp9AaxUfu4PH83hPa
         c/bUQ5rCCAXV6++emHZQAtJ2DCGc72yj4Lt4BzPni8q3PN3zwphLfH55r+Kn7j9L9zze
         vK1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792255859; x=1792860659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        b=Ni+qlc3zmQDStbjlMHwpJD7SvnHg3sGf3VMWeScpMZ/rr55hSzP5u0icxeyF5Mcuqj
         V/bYMHzwlo7r9jLNb6IohdMocKgeX+NUAu0hvF2RPrZKSNZdB2IFbb9MG+m0FgqC3PeC
         rT3NTF6dciH2DMGLgmtcnaGLRA0D5v8bwYflY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255859; x=1792860659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        b=eOSekH4vDvnGC/dPYUrIX70sPDoIZiv+Kxg12DiHkJaA4+DH2ROEC2Ap79nNJCPY2p
         esdcQIC2Uo5huWBmTxj9aBvJgsP4hjVJyWLVTcV81pJsov1ilqUa4vitlOW9pMl7uM+s
         d0hLYrqbxPs3gIbETX+hfUF1Rm/19D0p7v538ryQ9xeIKOAQ1tUESk7AEcUMegB3m2zd
         IquyWZdljJEaEsz1biVv5w9+DUCPcc4rP0veInqHhDQcuRH99N91j6kO0L7BH29QcWVA
         wYaFCz0jqSJ3i43vD8XTyFK61nn7TxIAjRItEky9tH/rFRBhuK3cfGbYvMZqu7w2Th9Q
         Hr8w==
X-Forwarded-Encrypted: i=1; AKwUvBxji1y9cvjiXFP5Bh5NBdH7kPlmbbYb1zGBDnmdKO8FzW5l0Jj6/OHZ6DvccnVAy1dmNkVicWoJ0KfA8EY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsL1OgTtkypUsa8OKLkaHiqhp3LQqH3mjquXEZIPKL06664FYr
	R+rFngECamr66u7IP+r/M4CE/O/2NMtMud6ZANYwGK+DSun5U5EwAMpHWDXZM90LKNVUhVTqgeP
	DO32PfDXMFcUjDt5QMuUovYpvfMgSVPwMxXHuB6TQQA==
X-Gm-Gg: AYBFou1N/Jp2TJrMtoHtb/gsVzsq0o2b3Ik0KwaGhsWisAL/MdZCqrwOSoYUK5RDIrt
	Svbm6Rl5m383O+TIQ6yWmVDIEF8SebZAH2IY3tWr168j1KaVzYLqZso4QREBCOyT5cuosrXPog5
	0ce5hqrI+fwQD2YvuFXSRYqRJaPQRYZNZtU2kzwqK90/gr+7mszvU7lG4HJ5y/tfqfrXk82LhGd
	4WgPy45Apsj14F4HBdABb6CmOSxgQN7V/OEMOwSwIQhlguf1emXEYwYeWVd865wUNGfFiiNSoK+
	/3PYpVNQIE9ThkWlvEH4y6drTmt0OYGzlOXjkNLa5GYf5uDfvikAZpK3LIbC3HpESZBtIww1/pD
	ye20HzrPx414U9Q==
X-Received: by 2002:a05:6808:1914:b0:4b3:98f4:f057 with SMTP id
 5614622812f47-53cc3e3c6e2mr2326553b6e.3.1792255859634; Sat, 17 Oct 2026
 09:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com> <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
In-Reply-To: <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
From: Chris Taraszka <chris@miget.com>
Date: Sat, 17 Oct 2026 18:50:48 +0200
X-Gm-Features: AclHuK_bS9tpLiMd4Z6l6HJmjTQJsGVwFA9VDFZZuhvba-SDG9oa9QIO2ZPElI8
Message-ID: <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: TuteMthCD <matias.civadda2342001@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, kento@kekto.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026, Ilpo J=C3=A4rvinen wrote:
> I've not seen v2 so far, has there been some progress with this?
>
> (Not having the generalization seems a blocker adding many models.)

Hi Ilpo,

Sorry for the silence. Mingyou's v12 5/6 ("platform/x86:
bitland-mifs-wmi: Add quirks table") now has the {value, profile}
pair table I described, plus the no_set flag for GET-only values and
accept_zero_function for SET replies without a function id. That
covers what my v2 generic patch would have done, so I won't post a
second one. I'll test v12 on the Xiaomi Book Pro 14 and base the
model entry on top of it.

Mingyou, one issue in v12 5/6, in bitland_mifs_wmi_call():

    memcpy(output->data, payload_data, sizeof(*output->data));

data is u8[28], so this copies a single byte. laptop_hwmon_read()
reads res.data[0..7] for the fan speeds, which would then come from
uninitialized stack. sizeof(output->data) is what you want.

Kento, you're right that the match has to be on board_name TM2424.
Since we have the same machine, let's send a single TM2424 entry. If
you rebase your v2 onto Mingyou's table, I'm fine with it being yours
and I'll test it here on BIOS XMAPT4B0P0909 with accept_zero_function
set.

Matias, sorry for the delay. I think your TM2107 v3 can go on top of
Mingyou's 5/6 directly.

Thanks,
Chris

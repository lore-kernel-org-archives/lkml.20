Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792979226;
	b=nO5Yb2L3c6iAby/9zdiml1ojo3/3v52amlfk4yXO6nF73FybXDKhPPBVwLWJn0EF0THI
	 08TyiNs+tcwhR6HqxIM6o/zFQT05vdx3PUN7KL+H0SImSgODZuOA2CdiQG0tHbEz3S+5j
	 ANSVAw5GEg+izZHM91THgooFTws8WxWJniUoT2GaAbognG0tQus8jGve/oTH268DVpc3r
	 gzaMxA+/bivU3NAcnN3N4j/qLcJx/EZcFUrwSbdHmOEAhQoxHn+8c/VKDJ5SYoQ71qifh
	 W4G0mLgbirVMLFEnlbm3Kt813+n4BPd9rfv78cNyn0Ytb3ZSEqfslVgbxHe8BRHs1Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
	b=JUzARpjfsIbOvNeNTM34V1BC+jIMCEWVsUGwF/3IPcFYp2e6oiWmVy8YmmhmeBnnefjX
	 hJJdp7chShM15F8e1WADhJhcDIy6pGLBRhdXJmI+exNPw8bXdEYHufVjgppTj9WDYDDDL
	 TLifWN6GjINzlmLhIZfuSZwcvvWwQlog5sMAg1IrYCmg65iUVi2rdmTA34CrW9hIv7lyo
	 v7Xt+ZUIHNbeByvjGv4suvQ+wpoRtwHQTUkC727oHd3whu9afT2tbJMPkp53yl1O5fPUl
	 OutvFpqaiH/M1xQj6POWX7HMFe9m4eTJV8iKighOPFloHsJF1AQXge2Rz9qV8cPbRcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3688A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-536717a4d83so21571451cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792979225; cv=none;
        d=google.com; s=arc-20260327;
        b=XQHttkdyXc6I3Iv7SbC11gqnCqcE1bELry5zPlYD9Uz34kJPGec2Cpkf+9qZbKBPmC
         K0CbAb0h02GJ9VYFLG0yj0WYOd8EFNw4cfxsqJyrJmvnDwTSngpcnjyMINCG0mBAHMmJ
         KFuOpM01cKTiN/ENM8PlIbbAofvO5NVFuJa4snfKNsxxdmSVg57VXqHhgOsf9fpiNH5p
         BUBmDGVDnCzT0m6gXJfvK8Gouuf8691pza2ZCjRFpkpCzqef2wrRntW7GAWbM2AKrBym
         cs7FDlqJMTBR1qv+deed/QjP32u1iJzQ2L9/t+/seYpuwazH+Xvc/9A8wOtZyYzbe83O
         VFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        fh=LfEyPxocZzX9KEMIV8/zreKy1yZQReZqhzSpPJLPplg=;
        b=qwks/zXjB29EjNwiFxg1+S40fnGu6wGydgV1WPtquERqBUXEOMwl59lFcb4EoC2OOy
         DJDGN6dHg+dG/3pKU8b4LHhfqbMxU6iBL5bXgCyokWh69TAEn94Hcoy/8CXmR0Qa8+nh
         BpEyXM5MI0q5SUXYwMEEx2yMArnq7lR3Yvxz817sTc7IxC17f/0AA220J0Ildxf9PK60
         VahQqtTkZpd9BZ4C896uz+5di7qYXURNLpkykmN7peEYQmdRXbaz1is1uYyhmRi6MUL0
         vRlO9VL+kE0i7rLc+vE9gNbu+v16lQ2UpUYBWK17EByHGtuKnqFunz65WG7AhIg+u0Ck
         uNpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979225; x=1793584025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=k1mpcIkwc1AXi9hb/mRiT22ro6h4FquWA+zMu8daRo1fzf4vKr5xnlakJSPrkylW+W
         BPZQZxoIuCc5J1ChOieBApdEw58hxaJegMTS+iftUo0MadwCUXP2cJ0B0whCpwZ+01Z1
         6IFaEE0VrSDv+WIDEJhZYV3SGEAowbSvdCmVw2p7/G1g4A78LmsmBHbkZqb0mvuv4dFC
         snhoe1grlRyEbSyotA1Q1Juwg3f2IhHshZugchVTm4VdHPkeEDh8eoNcsGy+04ZLaZg4
         bAOcnKmJU4DoOw6K23d2WUiJhP80dgi1VFqxTXSid1Z8+QvzOJfNJ36nkwBbaaX5ci4b
         ea6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979225; x=1793584025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=2P5g2VCvWOGVSIYU9oPnA7j/fKDRejL25JD+rHzcnvtBcX/wS7wlgjcmJnxzm7FktJ
         ghrig/xmb856qmbFf2SI8JddRfb9i4JVTR4sn2ajpeQl93YeKGmyuk6s0Blj+C3oasPW
         KcehLybdV/+elS9KqEToErEBBdBft12CyU+YoXEwa/iihcCEjDe0HCORVMr1XoMxXNvh
         ByHDghgUset9WQK3F01mnRtGVWl5F4rcfhRGxukeYW0iVZni/CDP72le4pv6ons2FWQ0
         7kex6esUt1m5+OFFomPZ1XC/uRhqOCu31jgotSPyLTNhrO1aKNZeJ0Fl+ezy/YjwZuV+
         U+rw==
X-Forwarded-Encrypted: i=1; AKwUvBycxIVMN3HJhtGTfuUs/TceMJodcTYZ1MjtcPzt9V4BjMWrdiV6eMHdvyP5PQAEifjiRi6atTfgT65VmkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHbvgAJlcTCXdxu9Xr46KsvUoZqks4amtlXfIkXw0twht4fHdv
	VG3wfe5cHRfuVD1pSuEij4gtSSWy3QIJFDGz5ACvOQwGBkEy+4Mvd5+15qbJb4K4D829DUSnip3
	zbHtSEnMQ/myw54gR9gvExQimHqk5Ulk=
X-Gm-Gg: AYBFou2oFac9alWBFUfxJHcEqk7A3GbgZLUtcwsX4/NFYJgQ0+OZ/CvqpXdnjnmJ8ZP
	LmbEZEcXUePnYJBPodg8HRAer0R/L42MqBDPCHJA1jO5T1xKj9P9RWAiF3xnfj4N7H0uJ5FY1x2
	lpvF8b1rWv5r3Gos8zCLrRKwLssicmXGIie2d7045sXvvxOrpMcAcgbRHQps/BVZNZSNscu92A3
	2g/+6CsYChd/NFhYtX6UUmQGrQ9w0wfsBW18gcg8Loj37lo1rFbMaiNLtLkL5Ztd8BjSjTUfFGy
	zvuI8S8Ted5CZTAUOqxDWDLJSES8747aFAsS/kv86DEbLOVZuJBeWj6TQFP0Zb0/Ld0oFnYli1r
	mQyWtULVpMp8LcuM+DE8wR3s3yi+YngtTxAJ08WEt7MkvmJSbOZmcEbN0b6XxsbPy9axxvt6aQJ
	tAWkLHLBJ0eoBFAkK4EL/4Ume14yBDzpRcPE7Kk5m5JkYTWoXKQfI=
X-Received: by 2002:a05:622a:410e:b0:536:8ab3:cb01 with SMTP id
 d75a77b69052e-5383b5ebdc7mr72082141cf.26.1792979225119; Sun, 25 Oct 2026
 18:47:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 22:46:53 -0300
X-Gm-Features: AclHuK9JgkkXlRw89V59iiWDYLD2QDEw_R-Zfh6fzK_yYgw4tVW-PfwZ2k_irrQ
Message-ID: <CAMAsx6dhGibUuwBzj6k+A3C4ZGAxPSdLyDbjNfawpKR0Ufj7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
To: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026, Eugenio Zuccarelli wrote:
> An LLM-based coding assistant helped draft these entries; I checked them
> against kunit.py and kunit_parser.py.

Hi Eugenio,

Resending to the list, as my previous reply went only to you.

Thanks for the v2. Moving the tool disclosure to the changelog looks
good to me and matches Documentation/process/generated-content.rst.
The two entries match kunit.py and kunit_parser.py: --summary only
prints the summary line, --failed prints only the failed or crashed
tests plus the summary, and both are ignored with --raw_output.

About the indentation: sorry for the noise in my review of v1. I
checked the raw v2 (the mbox from patchwork) instead of the copy in my
mail client, and the continuation lines of the new items do have two
spaces, aligned with the --json and --junit items. The one-space
indentation I saw was introduced on my side, not by your patch. Applied
to docs-next, "make SPHINXDIRS=dev-tools htmldocs" builds
run_wrapper.rst with no warnings, so please disregard my first point.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel

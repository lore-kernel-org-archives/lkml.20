Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941133;
	b=cbrmlaj8h6ESu/TAao7NIs5ck7tVAD7JFlKw5X2ymMDT8UjlcS8evfXkcGbx08eKUsGY
	 BPjKfXgxRmSJuxdgbUrb8VKARmbMqItOBNVzhM1JVzefMuvXSoUxZLMsMIfTFG4D7oQlF
	 GiOmwpnELpuCyp5MUUprjASUKW18BBoFIr6URJStPCPt7IzBp3ZxexueCLMh8YlEslo9e
	 +VPK4bPS+BsC4DF1qNod7m7Rk8H31gkiOYjns3nZfD/2r9S2HbS76ebGw5tna7sesHlm+
	 wAzEl9kErJwKOI8/dMKD+yJQG4a0D+Bp89NhcpHNDhzSoIkPRFXOiNKBzH64sBAW8uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cJh2067GU+PES519DOE2C1kaNn0WjHsWOWwAe5deiLY=;
	b=VWsGqlawIAJup25re7FjBMai5AkPnvEvQ4rVY5LPYtC1JjRJvZy6Dp5OEkU22kHMlEqh
	 1Vjn0PA/SQWF7RhO7q3DGsDjuOu+6lbkITAoEIGS/tt1NcCfydUb1uwOKPYZHPklrcLhU
	 4ATlEbos6xEMmkmc2YCZwCLTIFddNsserU2dTQkQHZ6A6T/K+dl1Dy0uFEu6UdygcGLWv
	 /DAOe8xKSztTLgKKZQuYC43YiMbQEAkr6BZzEzSLvVSYU6amV58VJbU6a5/dX819E7aZs
	 5MsGiMi1az+kvUhzJHSRpHeXZ9sWlAyVClsC8S887oC1hrWUnf3MtKbTLU0DdtnV4aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MBttXsCO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C853606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C853606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MBttXsCO
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f598d126so27371cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941132; cv=none;
        d=google.com; s=arc-20260327;
        b=IeQJYCRXhrAWppCIfCNdSh6CTMcWESwDsMIXQqn0gJhlNBn8XNp94J/SoRtv+yrqxx
         aGgg5LUY1wRqRCfWRGm8ySz6vHZZniJZ0Z/oY5HsHciQh8I0Wb+vLa5rD6B6neNodm7M
         sfDiRuo1jeYsMO444vrF1O8gwXD2warSXOsTLozmRruCqRKcrSv/uF5uSYIwJ2iTWT7x
         TItMIV/DIDFwIGBcjqRS/s6rBRqJ7heVXYE4uCN5Vz6+tbJINIzt/V+M38afj1ldgDoV
         I8jAUcjfJEn3sI3TYL7lq4lMrFjZwjX331MUznqUgm3UQz17qtXDBIv9/tMwyl10LBAs
         vAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJh2067GU+PES519DOE2C1kaNn0WjHsWOWwAe5deiLY=;
        fh=ycyrqzZUZnHxRgo98q3NqCuG9hCJo6jUaIN1eePe+xA=;
        b=I+u9nKU5MHnUwMS7Pt6tgH97RVwIt5vSAWYBimcYCnvrcWq4Z17Unlho0WBDhLztmd
         6peqB/OXl+1EoD/mM0PNMqkryF6Xthcq0ZWJGCMvEwtpErc2luK0VFRPNYzUlDV0ViT2
         6N6MvzuyUaBpX1nM+wlGs0vwj5tUCW9Sas/ydzeTL9XqaDE19CP0tKzidrMo+pcCr999
         uD/knbrYLqNvW3IXsxSFPGB9idO61x0hO9zl5cveHA6ZDYvdvYxVIXrvmjBSW2WW3xIH
         l1QSMxfhoD6j5jLGmVG/PTdtcEzL0CYOvxKv6c1oSjc2Q4BJIqcjwLZ1SfqLl8kNdTaG
         BqWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941132; x=1794545932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cJh2067GU+PES519DOE2C1kaNn0WjHsWOWwAe5deiLY=;
        b=MBttXsCOEtxisC2qQlbHUffKKbwhpBKuFaboHf/Wlhd0nGRuqg4cYguFdxXuhnZKYn
         NoPET7brfdLbNXY/pfc2WjzTll8kudUhTV1IKGuK6s6w8JY+1EdOZadVRr7O4k0RBZIE
         HXQFr3SBrfIP6EzdQCDkY1r+BgSm4yPz/HZ1ugoQttP4+cBA3MB2QHbA3sh3KQCmy6hV
         lfTsJBE88M5pDIKj3xRc/TfwfT7tNo7/d0DHo7mMKtGFaPqbb3G5Io179wDbD8G0ft26
         Z4AgFv7wG8ECpFE86ks3CxU1HPBXTfGYaZglwW0X/3XuIMXsU2JmOJCDZEsPntkaqVoZ
         dXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941132; x=1794545932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJh2067GU+PES519DOE2C1kaNn0WjHsWOWwAe5deiLY=;
        b=2rebX8F3MyFY5eRIkiaQzKYovC9mtvHes9OPON/pfRAzt+qp2bpoOFSWnrs8CDQLkS
         Ra+oQpGpj3C5x6xPZf+CKxeWpXQq2FJ+U50a55iAdUHww+tVasE61ZvWzf023cyIp/Mk
         DtvSv52N+Gfx64D3Lz7/qD0tTAISck3E3bf1El60ZxemaOeghYF9qwzotZdYGWQRG2IJ
         g0rT4Gz4znPc6MuhhTTpzxOBL4AmzyEkl+gkhU2nFDd70+b/UblenFg7WFYowSRt+qq8
         O1REpoZad+HGcN/ih+ZpUzG3/yG8xPDmMUgECLjdo18qgjms2UH5CR+qUWpfutwT37QU
         zfjw==
X-Forwarded-Encrypted: i=1; AKwUvBwxEWnUx8E6NMqKzw9tKhVPoS5KmILHme+sUe67c4xWGLH4OYONYs22hhIoa9CQyfuTh6Lyvyc4hk7m/cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oyq+Het5pDi34jdycEGWNlCkJBYKhIUw9qRPcZsE2lmKTbfYr
	1uTgYWuchpTXI3Xmur+JOvJMMyGAJJpuBfgMPB0p5GNFbgYg6SI/c1cOEsAxF2U6vkz8Kx5Bd/z
	n2PKgdmdP9UsIYRrgIBw47Pm6NTi2otkM0dj3tYcP
X-Gm-Gg: AYBFou1RcJakZxtkfptgHWEAnxNUOz2/NI3gSB3uBRGgE4EdpDtHxgj0KuhY15HZufN
	RpcTki3xuTqcWka4V+Xy1Gl7Bz0LMaOtNRk+iBbSpO6Tf7gcqnthuF/t8nnTHR4PEhV3ZazaB4m
	aiufpKCqy/h039H6wDeIpp1Xs6L45NGjKOX0DU/5HPbytJrCj/TOOYEBd7/GQT9eyslYSyhWrKn
	scAw/+1IUVM5Uu/KF7Nr3pyv9h2iFWH3GGSU4zhByWKjDShIoJSNHtXIREKqmwcFyv1rWwUHza4
	shl2DZsduEkicP9cABh58TnKvhIvNmbCiyY9j0ekC3tBW9dmrc4KRg78smmzQbHuh2RSECmefbB
	OU6dZqWT4g8xcVq1NwcNKPJZmKfxe8suYiTxBq5Ee5YdCuHE9zh2yXloqzUrRVmEvEt6V4wFXnC
	SILN0A7DMUvfr4iKSOVQrK5y53
X-Received: by 2002:a05:622a:5446:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-54eb70626camr534391cf.14.1793941131278; Thu, 05 Nov 2026
 20:58:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-15-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-15-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 20:58:37 -0800
X-Gm-Features: AclHuK9p3qGntOSkbKq5HU-aqOPybKSHJ98RZnbTvr07pU8gaf6XjJ7z8GWEmgE
Message-ID: <CALMp9eQiZ4A_Dj7K-b-3jK84pDf180t0RrNocJ5UT86xLd7D8w@mail.gmail.com>
Subject: Re: [PATCH v8 14/20] KVM: x86: Move KVM_SUPPORTED_{XCR0,XSS} into kvm_x86_vendor_init()
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:38=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Move KVM_SUPPORTED_{XCR0,XSS} into kvm_x86_vendor_init() as "const u64"
> values so that KVM's initialization code can further manipulate the set
> of supported XCR0/XSS features without ugly #ifdeffery and without
> risking other code treating KVM_SUPPORTED_{XCR0,XSS} as 100%
> authoritative.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/ahmtyMNsj2BCoEEo@google.com
Reviewed-by: Jim Mattson <jmattson@google.com>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792842655;
	b=T/0fwzzsDkUghelapE80EjLQnT4cxH7X81i3yhUULrEvMYovtPdtgq/apVPh1bJtSfPv
	 7pG6qsZFTNcwIQDdLZgVoJR0uGy/VIfSASQWagXvRYA40qvPzwFdJTE7UYbr3Z8dxe1VU
	 m18+mS9a+1N4GgGUn2xuIWlLVvX6UaAbH3TXHIUfvNNYPOpKBsDdsVbTeQRj4vB5qExc4
	 gx/HHlgZUoaIbQl1YDT1woHbzauGQRyPJDQ7tr9IX639rKdU0mQM8RixbJO6f4q7xObKI
	 CqoWoWk9eIh0GHWMnEfkc/uqdpWOG7rmHqSavulrP+yaciPCyJ6z1Uoufo2AcbQzQ1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
	b=himpws2inhAstQ92/1xR+67zb6JFtqHGz8TvMvXmQPdc13ogkmJ3CL738lrNsWaiO/jM
	 Vv2TOKWQPFYvYMKSs9TGQNDs3usPMfFAIFBF4ng9V9BKCrPArBg+22MXutXABVQiQ1Kpc
	 k7VmT6KErd0nqjElo3h5Biaxcl9sBEs20g3lAjQGWq2ypI1P0eH/8S5FI5X3K8ptga2sW
	 CmyT3oy417bn3midoHvhmZTyTG5KEbH8dKi5JHS9gG44M+YXgpzeVV6i638BGWLQslKi1
	 6yeNdFCr34vLLxRhRrfNu2KhFAikomIcC1jv/pDGEqxjI+v+NeWEFVPEgLCY8ZV9uxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C9KU+x7E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EFA606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EFA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C9KU+x7E
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso1171821eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792842654; cv=none;
        d=google.com; s=arc-20260327;
        b=jvMmkUF6BlP5OdZ456YhrToZcME/jscXuqNdDtUo82Mh1ORuUMwE6Tt3gef0R0tsFx
         lBpJkzgbLFTPT/IUn9RoT0FsSFzV9QFDCi6d0aW5jSkKf0FFPLerPF+hu7FPX7Fw9vIM
         CpLxU2z3pxK/7PdH+ZBsZkqyfTtA8viTj02D6uXmMBubhHs53h4mGuJPSrpK1mvZwnQw
         zk6Dk2xpIAdaFs3h8z9DAXnh81h5ZpyGM+rNkzfe8+jHnRdOo2nxJIkswQ9VqFo8dbnm
         K6cqudP76PgJ/uYwCZp3jdt/MNYMCuQcFWbdakt5PiIDjKLfJUnCcxhjOyUK5ns2APTB
         8p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        fh=o+8Owor7ODcfiUg1K8G/QLdvuQRdpT6eSTYxjyEMk5Q=;
        b=OqbIrqJd4C9+kE4bhYKBYIdMsdUPUlK77G1FhVo5bnxgXZR8wrRsnQmOb7QaFLfMwT
         rFHISxFVzJxE7ZwqrWS7MZyo7558nSAWArBhqd5VJK9mnPYixJ3yWbsNX1VMKcrnYmvk
         Kd5UlbrGmF2LgFXVw1kyNm2M2HoXJ9/82KoSWVn+/XXvUa9j2wRAnV/xU3y/DWs8xWbL
         E2Re2FlV6iaDMhkxkKDI1iA9+1JGnXNIU2sGeaaKgDgLWnAG0/tOs5bShvjVC5tcYRcw
         2Et3bmem8HoWD+PTHyDuj6DbCklNLjfcR3PlLMN5dlpXx+ZGuBbj4ARz6ZdjPEpsjElR
         KbUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842654; x=1793447454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        b=C9KU+x7E/r7l4XM0r/IKrahEoW7jsBvONG31JXVMp6hwt9NcuobnMS/wWD3QfWlAxg
         DemGI8DBG4NYVcru5hH2BcgNfjWe2t8DTaUbkDvAKnhsc9SI+Pw+78p9ELpMAPgsXmYw
         FmVCg6AEa7D7K5Jx1XiT29sC/n+ut3/Kn/6Dt2vqmuScceK0xlsLnU2IAvBvfJWDmgTl
         VRdETeFTixNknbM7p0ezihe7a7Kyx94/AC12CYt5Yco0AQrNHATnE9tqiTU7rS2SNrYO
         E1yDgUaLOWgt9WrnT0h7H6mXfjFWjDbbFxH5QyIL8BccfnwcHc9PEPwi+eYGdQCHkMAg
         SdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842654; x=1793447454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        b=iKW8bMaRisIJY0xXNwdSP6sdD1s4cxiYWvdF+Mg8Pxm7OOc8u+PNV8b+2Z5J/Osk57
         J1iNinvTW5UYXSbi2106a6vMOnDR1qeFc54/UyobZAa3uOyi9UU4sGLccv+5a6CB35u4
         vXewahCkxJNlrj+H3UyKaxhrQEOQZ/0psF0xTriCyk/7bDRhh4dV0dRIQ6r3pHQVo6iI
         b2yH6KS/8Pr6veRaS3oQOqIIigM7YJogrhT0wh55wp5vr3l9cmTClMBkR32cMPBG24Dn
         +bmlk1ld4tZ0id9RGlNr5tbX/s62CINehYi3dCM1fh1jKmyC1IZerFsAnWK5nLjQWRc/
         cemg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2W66G+KtQDpfzXNM8RawUy3WDqSVryrJOkixq+RcNHCcpC+DsMJaadIXCxc7WGAMzr91VFSNEcwMKzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLajotxZ2e/cFWylzpFdNgQDXxpFg0ob61rplE5pKjc6wjzhSdY
	DRpUpjIkx5r/XuD6AjBachOfg6VPoz3V4JM87NwjC/S1U7jpCWF+Mn87c8IDGzOrYBcGkZYlqpX
	cryJ2M5ZFWni8vuaCVBT7a4qYkw1n8g4=
X-Gm-Gg: AYBFou1GVLBENS0RFKfJmPvAYqpZeiUlCS0qTUgw0VnGAp18Onw+PAUsNi7m61pSGPU
	klxRUqWS9L+ujOe3LT0c8KYIiO4oqPDuJsMOs6b1SLa2w79aKei+q0Z+rukpJn+bcPsACtsqZQT
	QmJCXtQSeE806yXcw68LVG3B187436G6Z96DfM9ObyiJsmjHivEHNrWPQjRvyOxwRRJBHQ+SlhP
	pgt7epXETYmgv2JS34P/gfN8H+d3lCpKnFzDJ4CJvfmckEIm7SYPWOEAmhnk2jqDqmpZoWcGhtQ
	l/WXPXAWACdDXQ1MqTvGxkxqcYcTFIgFJ84WQm6pIoQpqeeADzpQRkbiwjtDrHAvoX1TELqDJdM
	NfBQbcOmwAU+wPqUrRhFHEKb0w+ktqSwIMP+cE1PUI7lkRIktj0L6pvKRmee6jnwnyZN+4FU=
X-Received: by 2002:a05:6820:7041:b0:6ff:6b2f:a11b with SMTP id
 006d021491bc7-70ba0fb21ebmr627518eaf.67.1792842654085; Sat, 24 Oct 2026
 04:50:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024073549.29531-1-himanshu.bakshi478@gmail.com> <2026102448-tackle-footnote-9ca0@gregkh>
In-Reply-To: <2026102448-tackle-footnote-9ca0@gregkh>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Sat, 24 Oct 2026 17:20:41 +0530
X-Gm-Features: AclHuK9RPNdG4PwTXd2ZHIWGfUPuk3tIjaYeZzEYcbczOXET7r-HnUoxLVjvyWk
Message-ID: <CAGLmz9+J-s98cT_ZFHF5EU7t=beK8m82fjq20+n5dmncdrMSEQ@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: clean up PLL calculation code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I found this while reviewing sm750_calc_pll_value() and looking for a
cleaner way to handle the PLL candidate calculation.

I tested the change as follows:

Built the sm750fb driver successfully using make -j2
M=3Ddrivers/staging/sm750fb W=3D1.

Ran a standalone C differential regression test comparing the original
and modified algorithms across 2,010,084 test cases, including
frequency sweeps, boundary values, and randomized requests.

Compared the return values and resulting PLL fields. All tested cases match=
ed.

The differential test uses standalone copies of the original and
modified algorithms rather than executing the function inside the
kernel, so it verifies that the two implementations behave identically
over the tested inputs. I have not tested this on physical SM750
hardware. If by any chance you would like to see the test c file, let
me know.

Thanks and Regards,
Himanshu Bakshi


On Sat, Oct 24, 2026 at 1:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 24, 2026 at 01:05:49PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > Improve the PLL calculation function's documentation and
> > readability.
> >
> > Simplify candidate selection by skipping candidates that do
> > not improve the frequency error, and defer updating the PLL
> > parameters until the best candidate has been selected.
>
> How was this found and tested?
>
> thanks,
>
> greg k-h

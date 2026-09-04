Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214550AC1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542561; cv=pass; b=Bx/HiByqFO7NF46mAG+OxuW8WI1VQyKyGN7m8egD4ytTzKjum8Tn3tYx3Bpcp/zlTH1xdvmf2eEatxHisFtAohbgS2JyLHzswEqm8+VidSR6juVycjzVFx6LlQHnzt518ZMigvKqcs6AWPHoFZPcmTUA32JnouwGDGLKZtqeJTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542561; c=relaxed/simple;
	bh=FJCnDoW1BsF8zLtfaO8qyAHOBTB/66qfCSUM4FGl+MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hH0Sl6atMefiBgbnrX3OgzoNhqT79adcE2DOyTRc9IROI/KadZgyPvSQLAD04lGWI7m8mzZtEdsJ02XfZL4xqeWBzbH/w4LR6llmfRjRLmASGqELY//KkcaKBNhGk3yACFDu7fgsyavUgH00V1cpffOGF3rwhny//jJ+0woJFMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSJ0ASQ8; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSJ0ASQ8"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f432ac553fso1093663a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542558; cv=none;
        d=google.com; s=arc-20260327;
        b=SXSbyTae9B0541R1ixt38CIRsbNz3MNAYZO0U+0B6FnjoaVASNkVdXOHErsEVKOupn
         hg9goLPbdVeFgOknfwrz1GCcz+OdMYS5wiTYqyJLEi5HcT0+D34P8hkqfbYhuc/pfhU3
         pDvd+PzUlk8X7D6xJYpEmpWsXD6lIZrUAmyPEm8xdh47fmSxfxFUA9ipMyWA1aB0CviE
         qIip/JHylsXkmAStdTlgsKLeAoVthH5oeU/PZmDeT9OpKPH/nuJVLl3gxR2wjQPilN8w
         1U5sjmSPZfmE8k2V7RJi9CrvvvR+HKJB4cStdI4J2huzu1nMK61CQ1rYVgFS2QrSKga5
         TRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5bQTn6eojEI+XPkavz13nbqJS9x7u4UcheihLwSIrXo=;
        fh=BG73i/E69VH25+2a4Kwvh5wsYHVsUUVTZv60uxir8yk=;
        b=Qqj8cZe6yQqM3IAfX0JrATITahyjzhXUOWpqC+EjGdWv74RRSVx1kguEc6K8r6jdE1
         2DTJquBbCs6ANqqRDB6XRWrq9V84I5m5aKU79iEc0HaXpoznIzZiKs7Rfn5mMLoBiR4G
         a+0cdAIK0ky7sHQ2x0yHTMuab6uzPKqf/Z741ho50J/NEgQr/YEybPmSPu+GpLDIIud9
         suvd0cpyL6RZkzoG0SESkr5ktwZajIqzRc4O89PjrQ8zTLi31E6mA3hRSBMrEpZVzRnM
         B20VdLwgJHgEr+7njWtTZwdy3lqp5WC4FWxWryOXzfCKBQSezuCmh9uy8qdhJyFyCNYJ
         qEVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542558; x=1789147358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bQTn6eojEI+XPkavz13nbqJS9x7u4UcheihLwSIrXo=;
        b=ZSJ0ASQ8a2TiRwBPPsXRSyqm1ORDCqe/47NNO8HZKp+CJ7AM2fT+ZBo9yjj+xRLUUh
         3pZ0N2ig3u7sauERjjiHqFcHIN+a7BrmaEKbmMYk04GUiAC2nmZwFaLDomZ4c+lOUive
         6DlSzcLkBpYdwNrRIi71O+bdxZlD3TIVIaUE6vVVd0I78PsIW55XG2Vyi01LMuddvC7B
         oMNHa4QkD75Ozih98qobSIdKJf8oKxAxvtYd35UbWXS3w/EP3N2ViHyOn2GuO4lKWGYY
         1r8tN1Rpkzo6/SUnoLkumskFjbnKopVS32lcxvHujbqA6THsyUxrya8vPyvMvbXBr+6/
         loeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542558; x=1789147358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bQTn6eojEI+XPkavz13nbqJS9x7u4UcheihLwSIrXo=;
        b=plQKoZwcr9l41sWKpe913ct5HqztamJRkDDSFiMb4nw3xT3oxKeINvnAubncHm9KS1
         t0aDhqCj9wodJxYn+dFtP5NU3DmBfWHHQoO8pGOKR5n7I2nl+D3iH/da7xNGjYkbPsIR
         3aX7JFK+0pkjIly0MSSfhVPkRhHLDzjDXP/ovUlqecZY3Rswa3cXspErO3Y9zFTlmKKN
         pV5r+on/NUgoRdpDrwzpbgPuINVxvuY6lkCSdk3RxUQcYy7Ena2euiNPd9qHwiufhgGk
         QDpyI6bz9M24vib/LjkfquTnGw4FpT/uun+AbGR16aydSGhFUWglPR770/Nff9CwH/ih
         l9qA==
X-Forwarded-Encrypted: i=1; AKwUvBzLP3+w5GE6M9rpbiHuMUeDziZxiDhRyIWe4E0gRWWEKTGnfLadg10srjeyimYl8NzRrSuQyHZH/0Qnd1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nv7qrDbRw169afYDuf5DIEGGlhf0s0ChFG5rC4C4JkXoOBwTAz
	KDa0qqRyjRWSrCIMTGYqKEkpO8WMApdXHHbOdnzd+WzT2EeiO4Pa5Lad44gsEonnRTcvXf+JgII
	ecHrCYe/tsnii1TEfeigw20KRv+LjhSI=
X-Gm-Gg: AYBFou2yZ4n0BbpFdc9nTInLY5557tS2OsedbBLBfXZVYy55tOgCTAia6uUGYwc1PeY
	LHQL9YJ4pZdS9+xV+DeI/qykdH9t6IMKp+gz4QSUyM/lWsyW1rP/FshV0mtS3HG1es+oEoyCl3w
	oxUqZXb7KqYVsqgJ/x5uen12UzjmLzi8FPxW1WjWlyA3VWrzFd42HmARAnV4gpCvVAplFWVtltY
	V8fN1fNm/NJ7w1389QyGEo2aXyQ7jPF3ZHBe1Rcm7G9geyFboeLc7i/a7i4o6G4op2UMC7dp/jb
	mPXJjQjC8dKxft00beHgdzEzbGK9Yv3i1onp0z+G84u0C8o5bkiPPBm+11sSevrXgLV6jpQO1xR
	OLQ==
X-Received: by 2002:a05:6820:1c8d:b0:6b1:7141:75f3 with SMTP id
 006d021491bc7-6b6fb6d1f8dmr7009469eaf.13.1788542558254; Fri, 04 Sep 2026
 10:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904095416.1692962-1-kyle.switch@motor-comm.com> <20260904095416.1692962-5-kyle.switch@motor-comm.com>
In-Reply-To: <20260904095416.1692962-5-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 5 Sep 2026 01:22:01 +0800
X-Gm-Features: AcwNN1WnzPi-GinWsR17e2jCghNlMfLLS0mk9JqF4ZQp-UwNmrrvJ4t1A-7W84U
Message-ID: <CAAXyoMO49pCWivneGxwejafDXnosT=v8hnE8q0d9qvyBm915TQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 5/6] net: dsa: tag_922x: add support for
 Motorcomm YT922x tags
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:54=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm.=
com> wrote:
> +       tag[0] =3D htons(ETH_P_YT921X);
> +       if (dp->index !=3D 0) {
> +               /* Port index is not equal 0 in tag[1] */
> +               ctrl =3D YT922X_TAG_PRIO(skb->priority) | YT922X_TAG_FORC=
E_DST |
> +                       YT922X_TAG_PORTS(dsa_xmit_port_mask(skb, netdev))=
;
> +               tag[1] =3D htons(ctrl);
> +               tag[2] =3D 0;
> +       } else {
> +               /* Port 0 in bit15 in tag[2] */
> +               ctrl =3D YT922X_TAG_PRIO(skb->priority) | YT922X_TAG_FORC=
E_DST;
> +               tag[1] =3D htons(ctrl);
> +               ctrl =3D YT922X_TAG_PORTMASK_0;
> +               tag[2] =3D htons(ctrl);
> +       }

This does not seem correct, as dsa_xmit_port_mask() may return a port
combination, including port 0 and non-0 ports.

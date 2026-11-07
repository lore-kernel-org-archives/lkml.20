Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794055376;
	b=R3seRN8btZvHw9uSdML3pNU31+td6HyqlGZpUvSofe+2l1Qik4OPZcvp8Uc29MIF6M0f
	 1a2qvr635T4f3oBJ5j3NL2L5/N4lnNOmeNyETM9X/ThaKxyjvUkD7AsZT4hUk2MWFgJVi
	 YeqYexI6ixsLmnmSPJNtA4uHGhfPShJsBy5HMqLqpaisa2cWzBg0/st5RI0AGemjDhmCB
	 yErWiBZS0Cscefo4nmJWAcqhzghkdmW61w3dZhC23RENcJIx63Kgp+gwHjdWkiiGhVGEG
	 E0a8iOqXq4lDwOd9IkVttfGVA4mDSPJ6n0ozlfjVBv/d4D4z8WdDwW2p0c1qBTnRJYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hoTrsbSrkMdrsQfhD79O++sunyJzicHmjD/fVH7fx2E=;
	b=kRtlb6F2SOWbKoLYn3ZaASefQfdYrpqHrm11UIV4Eww/7Sji3QXYCDA7hGSmyiy5LqbV
	 COvdgjYbV+xpUG0iGxkpyHO20IKgiuDTFRLn1bLldwv+qGMqLLfERq4Emj6kCpt++jaz4
	 Iu9N7M3x53BJz8X0yPxAWmCLlLdFKvikc0TBwfy99w9AO5KgPqYTZZhl0rIUyxbFG3WvC
	 H7OWOZPdyLKj40vcwaY5Ntllxv1NXwdMecViGyuQNtEQfPfqxYOkuQfmEUriPt8cEvQ24
	 A0Px15vdxHKsq47npzeRAQMckfKuJ6d1cVIt7rf9l9CgxQuI32W3ELRV15vXceiaCbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGLL7jjd;
	arc=fail smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EDF606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGLL7jjd
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1027569b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794055375; cv=none;
        d=google.com; s=arc-20260327;
        b=I0NbW5QIbFtMuLiminBIG20QVNhPBmQStZn+w2yzRkLfTovDo95S2weolIS1sjx+3z
         tmrPuE6wkjSC41PdDrHaY5Zx1ig6PqQ3jEej4tYi/VcZgsjN6Z0sIaPGOgQnh6+TzE4Z
         kiZgEtPkhbdSjKlrQtMJCimW1p3vbwU5lUaSkAwSJ8PaIH6PQVexG2FklGmV7LEjljdJ
         XqQrQ1rlLYpRrNsRN9PiMbrnm8bRfbn7VDUqPCv1Y+++oc+fB1UnkkUX8vf+5i4cwO7X
         wm8Enfp5DSH9D6W/ZkdPYhT9TI373jghgGJfbsiMJjTxxAt3uBZAhE7hdmwZQutVrMWr
         Lpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoTrsbSrkMdrsQfhD79O++sunyJzicHmjD/fVH7fx2E=;
        fh=NisW2U6W4Bn9AZgMoIjMR6Cz9KFqTnqDvHCvvzGdANg=;
        b=aMDnJzj5DSHVP6H3ddKLOCk4uNEVV0I2WuCwau2RNLKBjhc+EO6WjqUuGuE/ZkuIyu
         cms2Ef3MzC1bqpqQCM14pQ5GDspOaMykELbw6eRk16gsj950R6vDdtVP4J6EyKHyMzvc
         fHtuzN16q/+x/bev8UF0G3MH/Q6tdduV1IOIANkZEUgYsBUvfc9xhPIvgPwyeSC1qHb4
         SrA6JqAFb9dqy2KYe8jjES9DAxMrJXF+q/EJCAOA6dfW14REG8T1ds9z8vqqHU1iQLr4
         Iz0wKzQygki1IzigYfZQC3aCqOlxso742of5RiU1MEgp6+UbdL37AWIYIFbecinCtfu6
         jg4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794055375; x=1794660175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoTrsbSrkMdrsQfhD79O++sunyJzicHmjD/fVH7fx2E=;
        b=gGLL7jjdeualKbXWs/iTByZ9gFd1Q6UnzgM8t2wJn3VrYGbWc5EPiMOp6UynDB9y5b
         vfVJBdcLPwfCFKbJM8PtTJufbF9fmnpGHxIfT3QIFvB4r4dO6d+Bk/jeQqdusD3PSqX1
         lVTXVuq4b7Jrz8ZKzCnyPWp/jyD5tHbYMib6x+4UnhRvqLtesmqNgQH2fcqKVrE0NRUI
         GLJVDAup7Wtw/SzHLu1GQZ5GbKst0iwH/uNjRLdtx4SuX/IgUdyq/mmL9hailCpmCTDs
         YaI0j1EHjhPlu+EbVq8P+zSqwkAF92D+vt/mltbaBJItrKog+ZimNkwGBatQUGwTK818
         YPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794055375; x=1794660175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoTrsbSrkMdrsQfhD79O++sunyJzicHmjD/fVH7fx2E=;
        b=kOJqT5mwO9ZNV92OcDTUptKgGMA52fxkyy2vhpO67AXiz+QPGu2r1btnCspAzJfEN3
         D8jLb5jK4eNq5xWE6Ez2quDd2HeZymeEiKz+cD159PmCFFySaLqlJSVxwIL1RkJxJujO
         G5KYrPhCa7MHPFYDMbSyc3yNABhUq/Zx3sx1GVuD8dr03LfJmWXn1s9bAdHVF8aOOE33
         ZsD5IBvV5LZfxep0ZxU5H99KjBpDPY/RbrulfYfXV2wuOdVdUFpqQf2mXfJfXS7pqoGQ
         hRo/px12LQSuUqj9jyrn03ki2NyI5UEFNbudreBrYurN6R+gA1sLg5iw7UmXKyoraXkO
         Nq/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKpr7krRy2hrbmLLs5LfW8ELChdkRgGTxAU2Thx2zF9YXFrqY+s9i2snZCZDhmSc4pVFP6HShYKVcDcBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+swEMW7yheEynGpc2yxbJdcA3/CUcd04r7ku+/NjyS4la8lCGY
	ShTu8oFK3fTT9X+bwddM1I7DLQvDNkwt7dzsSqLyp6Ho0lZ/yJqvzFgwsI1uZz8iTphvp//edJ0
	osdMtSBQbjtzfu8IfK9ceAJ1OUqGnugM=
X-Gm-Gg: AYBFou3QIfITN70tRZ6OlUDBEkkFdjyHs2mTrLI6bQeB74lCwPkBH3Uci7CcP8dChFK
	hyIK6dgn70HC5KjOPurAll56Tqw/+Q+I69Z0sxwARBblsky5OgZrzbL+3ORfWuIPwJrYR1USjgF
	E1zpNsgtq+61jd4B/zEXiJFL6mv/k9Sn0lSwUrkt3M2YOTS7uiG4Fpz/jUv0W3cHa/0pjD9bIxD
	YJQpiroSbbwaLWJljw4aOg0QWQomYWF/tnBOO4C+MLmkpXoee9b+vItXQLcc1sMsceKMZKVcxft
	SwPU9m4lUg0gpl+yxL7HogLn8taojlGWJABNQSKYhQnFnopCHBpZTCb9nT2E2N//V9gKwmXO3gW
	ZSpJOKtjexKlAAuyIqzHPOSbDnHYQkgriCK9ZCy8EzcuL/O5yAePl6i6w/oU7umPZX20ux1I=
X-Received: by 2002:a05:6808:2218:b0:4e8:f740:f03a with SMTP id
 5614622812f47-567e14d9018mr3699053b6e.27.1794055374970; Sat, 07 Nov 2026
 04:42:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107121631.1040612-1-mmyangfl@gmail.com> <179405408165.488859.13345893308369940626@kernel.org>
In-Reply-To: <179405408165.488859.13345893308369940626@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 7 Nov 2026 20:42:16 +0800
X-Gm-Features: AclHuK8F-482r_fvHFZmTramCzRQroOldrNA_IqtW_BYdZJBshwRBmNvD02UYRI
Message-ID: <CAAXyoMPBbqAOtTpaoT2Ae6nbgU2aDjYyqmtgm2-aCvjFo44ZEQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/8] net: dsa: motorcomm: Add BR_FLOOD and
 BR_MCAST_FLOOD support
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 8:21=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

not a fix

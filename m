Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC0199947
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261096; cv=pass; b=BeJm+D05QE8xqQREMPc9tZzH+C6T1/WxkLPlVhahDTHsSDwWLL70qE+JpRWO7zkCKcLPyxdXQF1kw7lUXvhMhMkTmSDvTF0zKCjFQLeMRZsoC9tF5oI9B4kPDS6N+zukpG6ACsmiQ7hsoULp/+lZ4+PC4s24v5EfSbmTDCTj6b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261096; c=relaxed/simple;
	bh=wxVRc83oCscpI1WYvPdLrZ7Jll6Ct/5vejKU7uOwMS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeEXDx2zoBdVfYaQ+ez67oRiqOgtezkQEle9musEgWlG/vrcQxtckk3Jb0ky+miUuIxToKJykCRhw/j02EMvfwZ8aO5KwLN/MgOV3MIeJkofEsWvtHv9965CjZG1WbVE9DOTJKGTVJl1sIhhclpFGRbfgERTuO246ucNT44Pnfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7UbHCSR; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7UbHCSR"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5d9d503f859so1776570e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261094; cv=none;
        d=google.com; s=arc-20260327;
        b=r6bMWQXYmrgFM6JBH0maY39PA0DuvI1N4IgVbHRXv9v+eMZ+YT5LJS7LNvEE7k0DC3
         Hm0TlmPb0SIFBPpJD6d40DndUWP29E5nVZGt3RRGwZ72TBrY5MVoGuRNtWu67UYZ1uaE
         jgXtNT6uiRd3Wz72Sekso1Itu3/1MN9r9FenXcMeboB8dqJPm/bILTyVwz/r2gShxuC+
         oA79CKhiFpEl+7L91S5+F9UBG1IL8g+c8kl9smXvGX+9EinAYZuYuyk2bm/FF8LbXeiF
         vZ+8y/R6dB3eClHTkYd7XCv0gbbjl8enUaGCThPVmJ2FO5kVOfxERbxWQA2aGhdPwMDp
         Otlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        fh=ozxy9++HdpWBxC7dNRV8TwIC7sLu/x4iPcrI5yEKGN0=;
        b=SjPywHBTLh6ak6g0PCeZojEL8kxlOAkecpo8xZ1jnJP6yJysUvm2UiFZZ6WiKDYKn8
         T4OJLEN9pWWPJtr4xe5xNrVmTJgixrrPEGm+xSpU8QLATCE3kXyMxesnG/gzExjtvjT1
         cNWKbZJa/P6QdE5Ff5Pda5kDxCB7JXsfCUHxc+Y52PVKW8vTLbexxHDjaRO+okeiazvB
         5QQgLTFnNBjpC5yMNp12s3Lh7VDi5rXVQHiiQTKBZpjA72MQ6ciSz5Z9gGA95C7YfQKl
         6X65lU8A43D2M2IBaMQwMVqWCBLY6wexxuIWKc1HzfRuxLKW/Pu+Kps0MqC5CGufTuAl
         Yhaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261094; x=1791865894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        b=G7UbHCSRV61lU4qdxPezgYoy9ybIJUmmYwTrEzCPbQRp7HA+lkTau1i17I5zSEuNhM
         Z68S/SRSxAj7vWINXYK0bj8WPBoVfikwQpFHfPoMSKyRodk2SELR0gUJNwqP0kRnZQYB
         AXGzk3WVlA+8y6QKAbi1HMRcVTqgO8dO7oTQQkCLrQ3VmuCLDRADAKHh43Xnh6zpwU3a
         qIXpRIZMzM/uosNMGdx3NHmA1ePCtR/J3X/VjqTmEFL+RMWV40TaDmH75C5Vd/ch5z3Z
         6wvHx5b9QUWsYNuqsNV95bUwuBeCq5thUvVBWh1csKSTwuR8iiHZSUHM5Zb+ULk1H9kn
         Lofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261094; x=1791865894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        b=z1kKssddgl3yNOaGyKVY0k0IqaKswvkvTHkpnzx0o0n5eZGzf8zGQzPupn+NCjm0OM
         XfVHhy930aXPQlCAW6ebvDFILM1NWjlh/ON1cQfMlWZa4a0VkDtxTsewexOX4uEPMrpB
         WrTQt+SuYLnolrtMIHxu9ZIvfgUsv4/X7W07GJ4nwEBYEa/vvaHjAcleNDSevZyjMawR
         atLGEfLbftDXqU6j0UcnfCpFFPCkZI9ycx+vJd1kS+N5PeWODQCff0pCA4sHxrTK9bZv
         E7rRxWQ1vNYbRkNIK1YNOHlsWQsnPhT5xgMaYt6HG69VTvAlbvOGPxRNE3pVJKTQYLij
         hNNg==
X-Forwarded-Encrypted: i=1; AKwUvBz5VKMjH0E+0k5BLxEFA/ju37ioQTzh2/lERg5RzOacSuRqS3qMQJyh7+iDTGOCgkUNQ6fOtFzpiKW9GXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIddDhDO5tH0AoBetsnmsARgCMwvPLrtw3DqJOH5g/GrDu5iroW
	bqQBH5d/Td+moQdxY0zqzbq4xBwBO0d6QosAdhKctHmrGdXcho7BHYnEg4WWI8zo3T4KOZ72M4r
	gCsrHA8jnGl3wi1Z/lFBYDeo/qdfrbLxnTbpE
X-Gm-Gg: AYBFou2I+4kUbuqxe+QFbJR93pIJp9sANxBaSlZNAk1fMmWffF+7pNoTV5XkFnYvU/+
	dnjC3uYCdqUSU5PKQDY3ZT8d4e8NyNTTMvlghhF3IT59Po1f3S2la2UKwmlu1JeiwrVwDCQDLRg
	451eup4u8RNfmiOETeb3M5+3a7sIGFmI5sQfCEKgRCQH/yELtcgutrOycRHgNGV8ww3YVtZdPKa
	rJFC5MNT+LP8Jvfc4+X3juBH//X8PcPSyitObGoAbhCRo05MI2z6u8ZKYOBJQG7gzHp4BdrSXEU
	yfeoSt7kRmQsKx2Sd8YguLYtiZflo8d5KLIhCCcdhoOOqzLt4z/ZcEPwx8MXRNisMWwMReIVsiz
	BVfXc8wix5V7ZvRIhqQQXSjuaxrYg44zAi/Nu7DnVAkfkg8D3G0E9DSnpKD4wqO3JD8/ymG1jUs
	z7dYX1VMW3BeoPVRzKoNNpaH8e1mNH3AXGICxgHjoAfQqz
X-Received: by 2002:a05:6102:5125:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7c87c2d1810mr25241137.19.1791261093704; Mon, 05 Oct 2026
 21:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com> <179082977927.31693.14994198839172125816@kernel.org>
In-Reply-To: <179082977927.31693.14994198839172125816@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:31:22 -0600
X-Gm-Features: AclHuK8pEKgTOuOpuPx6MWvpOl0xgJlv86gE-NJ5IR08oT4zG1HmfFicCuHsjnU
Message-ID: <CADvTj4oPo5oBxB0jx7E_T9mKHCbzx7E1TVQZ62F0HAP59BAvjw@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:43=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found by source review while working on the larger stmmac MTU/resume
recovery series, then split out as an independently useful fix.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The live AF_XDP pool corruption scenario was identified by inspection,
not reproduced on hardware.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The fast path was tested on Allwinner H616 hardware with sun8i EMAC1
and an AC300 PHY.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

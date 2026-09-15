Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504246D550
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471888; cv=pass; b=ACLTnOCauTOV+7B2YGOg/8SArvVzQgfERcBKODDci0Fb8mjcLzJQbCb7QrDLV8QmrIkOWa9QgvJbtEXnwu2COI6o1R9aQYLXbQ/AG6oXw22bvW8FLvyXjuJ5a9fTNHX1SaOOQ74cq7UJ6R2P96JAslUPPnGi0y2+AdLtEDVL1s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471888; c=relaxed/simple;
	bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9Pqv6MMEjdWRe8XfJmqoASCE/cT5DlOmPXznnqv+hVJpZ15fnwDOVO6J/u33tPm8WTw0oTv8UdmJfdtH1SCAjkKMq25paFjZqVF0MkEACHR/rVjdzMJcngc6xBRdhSM4F/Qws4gUSirjhAlO2xxzAxmVcDHIrrSHTl6rzvRQgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBx6Z6q7; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBx6Z6q7"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb7119b3eso441806d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471886; cv=none;
        d=google.com; s=arc-20260327;
        b=sAVR/gJ212aIBS6VccyNxBicFzzjsFpkRUw/eB+7TBbTYXum/7SokUaUn13pspPDgx
         T6VUAQqOQrtePKf5t3fV+yVayfWJdoes3hH/Xx4mgo764Y3UXLqcXZaZrMLSLECj18WW
         JAaUnOUR04y3gUwfrhuaDe34puNatqpxniQ31LJSX1Zc94p0M/xtaYBSnNxIsydrtfZ7
         +9yBNFOFQtyB74vjD5P7wmRnA+ES0aubeLqnqOwWWKrMUPQKIp7Mz+axxHQmpuqb2gyi
         el/SZwWoL9WcnrAR2bv/zR7Fu+VeDLeBtsPbV2cBqHmRF0T3PGmjnnHu+3lydcj2SBBl
         4lVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        fh=0CA90ZLsDfafBLUdYVGmfQWM+WEkfetEMvuIMji5H98=;
        b=AHCF5pHktYN7iGNa3wSiM2YX7FBktYnqV8nMDW6owq2b3j3mALnpzyFEYLx+Z5Rcfo
         aCQt3QC5f4IJ6rCPNyiV+VgMEFsmwmXFDV1RfN6wVnBPFzOrZZcm4aLwZhdbuP31ngRX
         /360aeXoUcRZin08cPrKNVlvMnSUVnU/4feJAwJKDCtbSLoJ3jz96syfcObZolYTgRkb
         PjvSz6Z485jwcr583+TJdrYJaQtmT6y7ZK5x0psoZurfprQByfHWCxkdMyAzSqa9ZmPy
         DHSRczzF2CnyDEWedxwZEiwO4jfPNijEfGvEcDpXY+koJ54E0Im5EePRRKgvLKUwaWLa
         yADA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471886; x=1790076686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        b=JBx6Z6q7RP0CMjoh32+72mOMJHsz1qnJbC7Ne1mdaJ/7vZ5r1ZeEFFM4TjejCU1D5N
         577pZjM6OtMlfVQPeUjpx9KSvkF9Eaany2N52+PmyqfTyC35JACCu9N16ngKTEOP/m9T
         PDl4zc5WAXEtD89EFNrClu3ntDOVvH1XWsF7eKsU8rOEAaiWI6BJ5NsP4i+teGxV8HK+
         P7PXqnsmEJzEGZWRcU4nEE/ehpNrc3aOj1s6gvHc4YLm/gM4Eqg8gzkxNUDjoSxEsbMU
         /3R5LQzCCG1wl5nvKkjJsgdBbG4BoXGQxAd9rMEE/BwIQPoncU+L5TEcXookQz8LvUv7
         hWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471886; x=1790076686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        b=GLlghZ6fh1sS2EUCcTStL5yosCXrehrurFy6CiGhjxrREwwZCXTIMnF6Twbxr03h3i
         Pyv0HDe7gtBK3ZgkH4VgXdLTp7aEWywWMU/B6gq0wCFwB8F44WF4ucI0cWVQLas7sC7l
         pxUY1RJRsxW0oL0qFpRs5F+HNRhpIsXMGwBg3Dj8pzg3F4MkeLduqO79aca43P5UmqfA
         EzzVqFHkFxVvrPSxA4evEL51RUXYHO8Y5DqLSTj2uYW0iFUdWwp6bbIQhnkVDnXC6JyZ
         XKyOKK1NwZTk5SDlrWnzOCSSDZtlONRnD2+Gp7doi3bC5fpPoVGGIGDAeJV1h6yoYquR
         k4Sg==
X-Forwarded-Encrypted: i=1; AKwUvByW7UKsfRC8GdSFKrFWMSnINbEHXX2Xy02BleVq+ug/lMU7GtDlcy9Oogj54yeWRoTNAKHxoreTSkKRWk4=@vger.kernel.org
X-Gm-Message-State: AFuF++kKbwkZzjE0kHlrpInJYrG2N5YPjEzdoKHeeNVJmBq13mnheRd+
	3+cAA8hbFj5XiAqTKfd6fNxr5M8l3vBKeZqzz8k5r/82YLte+kJ3iHBD+FhJyVk6yeIQu5mI8Cc
	sv9Q6dH4zBDkhsi+YRfBe0mZ8dldVSQ0=
X-Gm-Gg: AYBFou0MsfalgBBJ4o6h1t70tuxZOcE7Gqo146bUdBfL9WlZDzd7Rw0wCupCl+SCqhA
	bPQn3LjFo+Sy5N4NN5u0XXcVLG8i0iMD9QUGpgnm9KAoCZVnvFl/WpUOd0Bec1XNe43DEXkkgNL
	qH09h5QxkA/UGmtcBNJmDK61CcmZMgaA2iGdtum+sYx4gOZjJ9hfGdjvlERJxqLIQa6+26zHrbM
	79sCYIsEn2+W/EYEIyTBqTsqX9jum22XJ40lzppZARIF9rDHmrUv0hZyMxP1ODGhhRjqi1I6le+
	6M+lCw8KM3lWlvQKv043zsTTs/AVANB/f4/Jllqpnkt0tjHgw14LrRqC
X-Received: by 2002:a05:690e:2023:b0:671:2f8d:eaf3 with SMTP id
 956f58d0204a3-6714e30e48fmr1925549d50.4.1789471885894; Tue, 15 Sep 2026
 04:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com> <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
In-Reply-To: <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 14:31:14 +0300
X-Gm-Features: AcwNN1VkI9JiuP8HxEnMvUjQqUWGl_VDINTaR90A9g2N3vrw1FbIOy7K0eHiNm4
Message-ID: <CAFpOueQMUXkHRF8zL5USo1TVhrS1AY8j4Ff0dtF57PZy2GU7Bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
To: Michael Walle <mwalle@kernel.org>
Cc: pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com, richard@nod.at, 
	miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:33=E2=80=AFAM Michael Walle <mwalle@kernel.org> =
wrote:

> Why are these two different patches? This should be folded into the
> former one.

Understood, and both are addressed in v3: a single patch, a much
shorter commit message, and an Assisted-by: tag. I will not reply to
the bot again.

Thanks,
Itai

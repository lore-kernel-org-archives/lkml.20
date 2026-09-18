Received: from mail-yx2-f17.google.com (mail-yx2-f17.google.com [74.125.224.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC4502763
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.145
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745359; cv=pass; b=BfeflHedI2ugUa8PE0aY6r8mrgOFhxFOgplHuBk3hoZuaETtZh4R/C+WxPUFnVigJTUwtJviYvfBOnzTLfoG4++dzaVKqxUpqXU53caevXc4X+p7K5Vi995n3uFuq7FvKVhi0v+jU1Tek2qDBZH6YzKrsLtLasrAKCJficZO2lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745359; c=relaxed/simple;
	bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJzVb4GQJHp5hZO6+fPWhK7gGVAfguJcTnPDtRauEiy8hA/am3I/Kb/b5w3arqv2umoBNZlkL/HEiYCvxZk/wlxv4RXwAudv/aJ6rsVLrMBOdBs4jJf5YDcgpBB7cheUJOnUm3cObhwnmb88hGphhBa3DwXfBhxtX25wERiZ+3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGyfsTX7; arc=pass smtp.client-ip=74.125.224.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGyfsTX7"
Received: by mail-yx2-f17.google.com with SMTP id 956f58d0204a3-66fb7488033so144354d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745357; cv=none;
        d=google.com; s=arc-20260327;
        b=OVJQ1GQE6dVj4DuxRtCZ0YtZbFz2/V21LB5FTcr6cU2H8EMNoLN6LZXsyNlbJ+ou/D
         DaekAjGhuvZ7P9u0BR31mYwLdh4qTpqmU9oNHRUginn+IbcuySK5SN2RRLS4pw28U0kT
         J4DvTHB2+iV/jKQVaAwWcmIfvnloWYDPXe7N3BAxu8HDZiHJ0eaamNx8jxaDyO/Wfq14
         Lz3zRRdFLknDAgMCvPKTeHscVJlO2G44bvYRQ/u2BjdDNAErtWVB2S4ZXUH9HT8LvEgG
         ObZlsT5505rtAupsvbHGCweUAY1114H+i7XMG5i7kODApqLZ7FB+ETASn8ou1dG5UX65
         M9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        fh=wTdFQH48VLPxNwkT+re6e2QVx6ZMxD4FBxbrEXwIdqg=;
        b=UolcGHYiv7ep7IntQqjy8YxAOwGqBF2Hnm0zP40fEIh+c6A5h3jd7bIyAUNm4h8Yz6
         lO4Gq8bdA3j66T5wVpw5kuZ8XbB/ii1RllG+JwcWmakvVrF1fYNASg5dO4CHQw1snfdf
         iVC8HKBnYvJgn+ilpaZRpeisCxxRGXL0RHOOGftiGxoNsAX5/6UwfiyL1PqYksnO1hrO
         FVgJSddYbt3ExIqY9Ek8rSq8q5wQQB1RAtWpd7VjB4CjJi5vyeMfCnollTRdSjvnwFFX
         HfB8OD7Xp+jrfXQNnT1+UpSRzIwDF8uf1UkgZXY900BkYhzsfebFutuzsNpZz3LHtelW
         v/1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789745357; x=1790350157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=EGyfsTX7yaqXV2wlkd4EWUDVlAnlAbZ+W1lWCCDFOye1Zjgn4bsNMhM/stIhBghb/z
         dz9Qn5OsR2sfE5h7gkZJg2T24BSdmsJBB8MWt7OqcfxvSfIRaS9FasDy+C/nWRRW1wfq
         4JFYGmLnJRMDTnwe1Rj7tNULQGy3HS83S0hicPRDc6t5KgyRBkNzDiVGtoBFB/ixuyUo
         Y9vb+oScvafZpqipqszjKEKjQhXAQol8F18cWZZFEGEui6akLP5ygN+DX+UCTP+ReUwq
         7I1M92GZio4TaCNMNUvCfOvBvsqGX0RiMXPl3JE72HoYO18UYLGtZ+bTGiRW/kX543Kl
         +CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745357; x=1790350157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=VRWBLR1WPBY1gSRLviE74izwdYaPOLWcR+Exeo+oW8yWaZwCrL6qfgrFalghzV/ZiB
         V5EejPQ/OeWq0xQ4LJVAnWH0vOUbZkJg7RsNcMnL4zmrgTCZdO25B++ZxeM8c89nAei+
         VEHEMdWIJPTUaNyYj9gBxGO3812JS+AiA/tOE4EfQLLkicojYIAJHDYvIYXYL46j9rjR
         slfDhG3PAYkWtE4p8eFNVtlvPB5HGAEFdT1XIPArBQyL5EhHQ5NDM47rZ/4uloA+aN82
         02bNQNGt95M4VkkQLl3xivbQ6M4aqyVIslMSICaFZ4BxgRAdu8JyzjnKA2623r0qchg6
         WiWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxtGsXNJBwJXS4Jxgn2VKgmgfUeNJk/7tOgf3EV6DHAxFluEZTMfWoslfTDwPuwcdH/Sw09gebLoHk8cA=@vger.kernel.org
X-Gm-Message-State: AFuF++l9yGPugU564W7KpEAASVteM9EuveITAPbOSz5GDAE69jYSOtNh
	5PZYVLimyue+ZqxqHgWPI6cL/DVQo3uywiySSaws1Fs8hxlyvdZ6DA/0h13DTQErZTbZut72k6F
	vf2RMF7Bwy8C3NtButVulQqRvnXtqKMbmXUhddZE=
X-Gm-Gg: AYBFou3WIJKO5aSfApDcEL8DplKSLuQhmhhSaB/xG0c1RQEEDzwCBj7aXTF/+eritZ1
	6y4fEs06Nv7ywUt13RPXrVNpHScwYos/9FkQYmdvoe+Cwy5+aKFXBIGS3o8ZmGr8FT3eh2CrH0U
	+OGsvyvKeQoeP4PhSBAW9BFOn4beGu7OEu85r26cmyw1PmZclgmriWRSeFQCKW1sCrDhqOO46du
	7O6VQWHIgUNbXTZHKmenVhoXKmNTmYPTsbU4+xesCEc4bd3JVpg28/4CkSfeAncLK8KeutOfCdH
	oGDz0I0rZO00pqnIHVplCw96mWN+NP83Sw1c1zUUtgSsru722f1ORc2Lck6UkBPTcA==
X-Received: by 2002:a53:b10b:0:b0:668:9402:9938 with SMTP id
 956f58d0204a3-6717fe09e2bmr1135076d50.4.1789745356692; Fri, 18 Sep 2026
 08:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915113811.2429311-1-itai.handler@gmail.com>
 <20260915115206.CCEE41F000FF@smtp.kernel.org> <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
In-Reply-To: <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Fri, 18 Sep 2026 18:29:04 +0300
X-Gm-Features: AcwNN1XbHeUXrVqj5J_uyPI-friMh8cd1XJAXk3bkpBhx8iPzqwr-5cZFOaN8P4
Message-ID: <CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: take the flash lock around spi_nor_restore()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, 
	miquel.raynal@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:34=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>
> On Tue Sep 15, 2026 at 1:52 PM CEST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] mtd: spi-nor: skipped flash restore on fatal signal breaks boo=
t
> > - [High] mtd: spi-nor: shutdown hang due to ongoing erase operation
>
> Does Sashiko have some valid points here?

Here is my perspective on the two points raised by Sashiko:

Signal Interruption during Lock Acquisition (Issue 1):
Sashiko's point is valid, though this scenario only applies to RWW chips
where spi_nor_prep_and_lock() uses wait_event_killable(). The window
for this to occur is quite narrow (e.g., sending SIGKILL to rmmod while
an operation is in progress).
If lock acquisition is interrupted, calling spi_nor_restore() without
the lock as a fallback risks having the command silently ignored by
a busy flash. However, it may still be worth attempting as a
best-effort fallback alongside a kernel warning log to notify the user.

Erase Duration during Shutdown (Issue 2):
Waiting for active operations to complete before restoring 3-byte
mode is intentional. Interrupting an ongoing erase or write cycle
risks corrupting the flash or leaving the chip in an undefined state.
Allowing active operations to finish before teardown is standard
behavior to guarantee data integrity.

If this rationale makes sense, I can send a v4 that adds a best-effort
spi_nor_restore() call and a kernel warning on lock acquisition failure.

Itai

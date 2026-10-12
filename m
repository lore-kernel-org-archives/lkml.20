Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298C3C1991
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914040; cv=none; b=CUrwgZyp1LQpiIyLYTNmMFFOX/YDUmCrxgj3Vev4oBoRL49zRrIdDpw0zHp43p/i6HzLNxoNBtVDQ1eq1xVdgH0FlHCgutC1jyzTUVk/O/mCPG3V9gNGtWncEWPnUo2WQt35Dak9+qOOIMMCVfZ19l39l9d3Skc2Q+D73YM5m2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914040; c=relaxed/simple;
	bh=7db3oz64b7yxs9ESxCYn1Dz/OmFBsvZAtNt7LTOql5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k0gljRoBEcpFUAjFmTUv4cnISe1aCsm6vCv6Gg7j9eSRi666A1/L5+8oYxxs/mp94Lr/vxyJHoYdnA6OtlbTsVlYqlc35JebSJgLggvm/fpjNPcAcnEoJKc7vplO3bIEDE1qzcoHpujtv7FkapjwirrzGKAJEqQSarIJHQIFTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=egWSUTHv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="egWSUTHv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F22991A1215
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6B8860362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:57 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 58EA211D717F3; Tue, 13 Oct 2026 19:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p8FY1M3Tv1hRQvQP6OVRnYrzYJdfnF28OpzD0RZsP+Y=;
	b=egWSUTHvm0Xt2ww9jSmj6rYVBIy6xY5n5EOrcs5A3OILu4en/knsWHxZOZEwWdwFqe2wbI
	Wu92SJL3RHo2AHVkm+HRJjWFo1mzQ4XWm2TjBOqDN6yUAPmKHjd0jBTrP3CTjKFIWC6BTC
	EOa72MDH4AdCsNOXj6vySle7Bva8ad8PqNxMg7VRJRYzVYefPqJZEgDTE0iMyw0e306u3w
	MvttzCOKnCjYbTK8r39Hf8a3WMGNdyrpm74o+wc9ziB+r8UXZXxlug0OaAmHt6gR1wjT3+
	Fm4dmFlAk1ICgAz0SwrnL4LSoU3x97Kk7ml5PUcKiIMT9ADdY9t82t3WHTdY9Q==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an
 x16 part strapped to x8
In-Reply-To: <20261006052435.319751-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Tue, 6 Oct 2026 05:24:35 +0000")
References: <20260916162731.307959-1-orgads@gmail.com>
	<20261006052435.319751-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:28:29 +0200
Message-ID: <87ld82zsc2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VCcmtab5EvA5
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 58EA211D717F3
X-Spamd-Result: default: False [-0.10 / 30.00];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	BCC(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid];
	RCPT_COUNT_FIVE(0.00)[5]

Hi Orgad,

On 06/10/2026 at 05:24:35 GMT, Orgad Shaneh <orgads@gmail.com> wrote:

> Commit cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk
> at 256 bytes on an x8 device") limits a Write to Buffer to 256 bytes
> when cfi->device_type is CFI_DEVICETYPE_X8, because do_write_buffer()
> sends the word count as a single bus word and an 8-bit data lane
> truncates it.
>
> The M29EW that commit was written for is an x16 part strapped to x8.
> The probe reports it as
>
>   phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank.
>   Manufacturer ID 0x000089 Chip ID 0x00007e
>
> so its device_type is CFI_DEVICETYPE_X16, the clamp does not apply, and
> every full 512-byte chunk still times out:
>
>   MTD do_write_buffer_wait(): software timeout, address:0x002203ff.
>
> What limits the count is the width of each device's data lane, not the
> part's type. Test that instead: map_bankwidth(map) / cfi_interleave(cfi)
> is 1 for an x8 part, for x8 parts interleaved on a wider bus, and for an
> x16 part in an 8-bit bank.
>
> On the board (Octeon CN6335, the same M29EW) writes of 1, 2, 32, 64 and
> 256 bytes to an erased partition read back correctly and 512, 1024,
> 2048 and 4096 failed with the timeout above; with this patch every size
> up to 64 KiB reads back correctly and the u-boot environment can be
> saved from Linux again.
>

It no longer applies, can you please rebase and resend?

Thanks,
Miqu=C3=A8l

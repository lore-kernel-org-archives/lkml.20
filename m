Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C904F30D9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545336; cv=none; b=CYpEqMkx403WdrAlG2iwYoAT4DatSBA5N7cBbpo7LIe19dU+NEBFqljtFbCFnwQOfUVbA5YV/VOMF9ZDh5LQ/EzQbfIX1pHJJMxNve2DeW4MRONsmhpuTSytpfITtxQzNj8qRTyvhsZrDH6yYZse/j/o6CQ6mbEH5foxkTuELVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545336; c=relaxed/simple;
	bh=QsEfIHgBlNnnedC7ry+/tNsiiGYDQBQYaZTAZ+Z4bb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LNZNzZ79cI5g446K13oourcnXTQzehOK8XXo10M2cM27ujApqoUT6NT9y6UEUo8bhVkeXX3c5vXnefdk/WYauL9PeUusbkKFEeAW91ihiqzPBzjKc8nV3X8h2/Bcp+hfuwplYI1MIqkEX4+d5WxPAr2hQnaJheBH4inQiknWGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VPGCrFwh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VPGCrFwh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3FD11A19BD;
	Fri,  4 Sep 2026 18:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B88136057F;
	Fri,  4 Sep 2026 18:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56ACE11C78767;
	Fri,  4 Sep 2026 20:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWuI5clJsFoY8b2SjzUR4FdsBGhCzDs3OZOhmva406I=;
	b=VPGCrFwhbj3czKymibnU/7EjDzwyWPB/eKuJxg646eOtzC82sduCsgr9hQp12mTj/Z6Vx9
	5ciudHVY8XmceGUuTGNVW47O0phQh7loFPghqmM1UDw7h1w1pTfxtzwJLKnoqw9ojKua7v
	Pg/iBN7juPxrU9rMZxvn8ENLCP+qA8/K50UnzrsV/7J0N+PjeHoApjKVyVzuZ9N5iDNLkS
	KAz9AeY6ES3iVHQNwXGllTf5/gqRRR0lhh24QBR3a9/yAHTlqKNb9tbDx4yP69Jxx7HKQ9
	apgpovFBD2mPvvBlL7W3poUGNXF0FrnnEO+LXhCK2EgHaJvVdiFqKoU0kDdABw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: sunxi: harden protected OOB handling
Message-Id: <178854532418.1533016.648068114712048583.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 11 Aug 2026 00:01:58 -0600, James Hilliard wrote:
> The H6/H616 variable protected-OOB implementation has three related
> failure cases around its per-step user-data lengths.
> 
> First, propagate failures while allocating the per-step length array.
> Then reserve an encodable four-byte first section for the bad block
> marker and reject layouts which cannot provide it. Finally, replace the
> per-write heap allocation used for BBM compensation with the
> controller's bounded 32-byte stack buffer.
> 
> [...]

Applied to nand/next, thanks!

[1/3] mtd: rawnand: sunxi: propagate user-data allocation errors
      commit: 8696502b0aa96bcbb1f1e78ae117726378823ae8
[2/3] mtd: rawnand: sunxi: reserve a full user-data word for BBM
      commit: bde8fd880d84627072c224729c818306c4b30d58
[3/3] mtd: rawnand: sunxi: use a stack buffer for BBM randomization
      commit: a8596bb7148136b9e83980900d508d0ef86507ef

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


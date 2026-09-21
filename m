Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B589738F92D;
	Mon, 21 Sep 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983509; cv=none; b=UrBIubo9Ef/Ar7vAbG+9nQR7WWADSKVWjeM1Eg54wz4pPzmF3dEWt4tZJJ58hMHthSOgnUl8rUgR46bONUQvgfK8syKXT83m/Lmek0Yool2HaiQwkDEW09JpNTJYB7ixjVzTVE0NwsmmGKOhkv7m1OfdcVf1ZBmvLSe9nR9A0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983509; c=relaxed/simple;
	bh=fP2VNOaikT2WQQ+GrAPtMDyQuvqJJ7rh7L5daqwqTac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwdG8oJTxaN/kO1zo3V7JwcV2XdnupxlYbugZBSPdyg74twpXtQeL2Ku0i1vQaSRsZXSwZdRzuGaZGaf8dHYEhzTXQHkNYtVMVKxkumav1TsRCDMr6QeOKn3j4NgPLWugl4EgVTlb0EQKfdWDJ9ELdBKCN9FkHUgcxiQlKnM9AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gKLMcWnq; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gKLMcWnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789983492; x=1790242692;
	bh=Ejm7KBErHIYXohYdZpBqi5g12aD24E8OnRciBSfFTPs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gKLMcWnqbOpSoko6wFbVDu/xcCFw1Enth3VYVFgj5RZ0h/z35IY8ITgr/pe1iD1v4
	 RsWKIMiR9t0PUXn4M1ppXmvwaDRPxv3edz8171DWCn36MnJoh9lEFko9SVO4XEzAwJ
	 S0nHik7GvBCWVZ7vU+8s2nb3u4g6KrSPBIVlLpPeuvv1+TaSUiI3BbHfxBo6Q6daiY
	 lFjC0aYptcR1V1WqIjkPHJr8Vv+ASYh5gUICldX6EXUy2KNyBh+6d7LCMEa2zjxOif
	 rLxDawsiyqjwFqhkiiz5ndMuoqf8Kz1Tkd1NGZ+nTo3DPIlXi8B07nAcdJWpyMIrZK
	 f78eZ20tdwRwQ==
Date: Mon, 21 Sep 2026 09:38:08 +0000
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260921093800.83484-1-lsa.uz@pm.me>
In-Reply-To: <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
References: <20260921082609.30830-1-lsa.uz@pm.me> <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: fd3a9fa56c0e5ad1be31d73f99823eedb7647f92
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kieran,

You are right on all four. The bits are fine; the message was not.

1. The numbers are not an angle - nothing there is partly flipped.
   They are how the bits were found: every bit of 0x3820 through
   0x3823 written one at a time and ranked by correlation against a
   flipped reference, there being no public datasheet. "0.2" is a
   spread of 0.2 counts on a mean level of 70, from the same exercise.
   I included the working in case anyone later wanted more than the
   result; a commit message was the wrong place for it. v2 gives the
   result, and the method is yours for the asking.

2. I did check it myself, by eye, and that never reached the message.
   The four states are one contact sheet, which I have sent you
   directly rather than here because it is a 101 KB attachment:

     <EViHAe8VXLnuCLNW2WvrH9wZvJzSwWcAsaS16-dxkYEdCDlpHnQyQpkcfcEGYIIQ1jRO0=
ChI_aIXf-HNYdroAOlCbEg-BXux6yw76GGfA94=3D@pm.me>

   Unflipped is upside down, which is what userspace gets today;
   hflip+vflip is the one the right way up. Say the word and it goes to
   anyone else here.

3. The mirror bit is active low, and ov13b10 does the same:
   ov13b10_set_ctrl_hflip() clears BIT(3) of 0x3820 and
   ov13b10_set_ctrl_vflip() sets BIT(4) | BIT(5) of it. v2 says so at
   that line, rather than only in the defines at the top of the file.

Which makes this, in my own message, untrue:

> ov13b10 has the same two controls, but it is a different part and its
> bit assignments do not carry over.

They carry over exactly. BIT(5) differs only in where the mode tables
leave it - 0x88 and 0x8b there, 0xa8/0xab/0xac here - leaving this part
only BIT(4) to move. The real difference is the other way round:
ov13b10 shifts H_WIN_OFFSET and V_WIN_OFFSET on each flip to reverse
the Bayer order, and this one does neither. v2 says why, from the
picture rather than a statistic.

Thanks for the fast read.

Sergey


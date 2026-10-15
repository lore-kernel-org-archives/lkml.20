Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D252759B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072080; cv=pass; b=VnOG1z0AtswAXKnF8nf9Hxfe+Kjudoy787h+/d6Gykec2UP98gqMVwGVVkFrdk/0jOtprI1qr3rGmsd82Obssdj+SgR0sthuhXBB6TWrwxsj8TzgCSAuGVemOrzFmfDPHZ2hld7XpmO8a10eSmjvQcmai8GuUHFyMqb9AWGb8VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072080; c=relaxed/simple;
	bh=aL+AafHZvOsGulzkqz3m9w2wFzipIqROE5U/Y/fmCXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIK1WSFYynxSCrRHGh/VxJmyzHY4cUoD2BOa4xEo8oEDVS6w+TpbekxhHkLBZQUccMdwwDPaOwthRyavhY4LP6GwgNmPpPu/q/dwLCk1MLGBl3wDFbZP73YRo27U6tI2wFQEPDLBrQK6zT2XOrzLLFrvsuGoWf3hvzrEAHztVws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K86JKnVc; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K86JKnVc"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0c5a64de8so15950427b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072078; cv=none;
        d=google.com; s=arc-20260327;
        b=VfMbz8esZzjJ7NDrZ5cEWCtbMWRjNO/v+eNpxNTTl+pO1l1EYomJUOuU39BrKaSRId
         AIGnObw5TkvSId2xq1J/zy+2V1E0XCTxpg6HnnXnMBnrZ055dgWsDcaIQszrkR2MPoFG
         L++OKN33dZ/miwjHpdBPwUJwlUkA//cP/4IrHZouxyYqYlxQxB21Xg1FD3eXgrB26nP9
         OnNpEApZU5SMFd1kis5rajQXSGXaWKxzGMHC/BTu4d1OEIshz9NVdb40ZjhScVacrhqE
         pzLFiyWurERfwrwTizNgZU9gT2SYdaq2EvCYF+P8jzZUXbuOjx4qtSmRRHm1OTLVAqM9
         +erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        fh=NoQw8PhP+kqxzW35lN4vJ9b3pFGO4ywagtJ4GXpgqEk=;
        b=O6P12KmjsrpII8arOaw5R7rpjQGhac9DeDTIKiwnd1TG69bh7hSDCWIfdH/a/JtmUx
         PUR3SZRD1FBa65WsUU6nCM1PQwa/EDAFR6DnW76Re3ecR0zb0UulBs/1BjN0Hp7Wlnys
         aeX3IoQi67g7hNtU/pzWafFg11gDDRbtGlyWD7wGm0dXr8vcikNKzlaF8kHBGBAl+ljN
         ORkGQUa7NuMb9HpTEQX21xrjKeFoIo1YgHfwyAbKa3xlzOJ5KSnoC8+mhGlGsOvmLKl/
         UbYIr9OXIuFC0WdmBbhBVrvfvjwGN6LmqFOzLMbFOnXFcM9/E0oc3QD9KxaQIS9i10Hj
         v3Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072078; x=1792676878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        b=K86JKnVcKkvc0AUD+XGRgVBywteXrq+WYmAOxLAfDYXBdMW8wQCq7NKByeOHbyA59O
         +vm083tQFTT5+FYahRArW0TeWshzd7+9WRjhH93yjJY4YtorPu4KOOczTywWSZZk8xe9
         OdMOjR5/GucqTZSDi/I9sWNb6Kh67NPxWDu4qTyl3Life3n1PhpuYS0Ke9wWfBBXIvv7
         /P8NWQMsGlUliMrD8cVBpz5SVlvXaMS4wgRcSgogkdoG5byrDGV+TgNRQYvxCiSngIgF
         glp9oAxM0dGT2JjtRoq9Z/XjTQtuUejosiW7wI6sodPmzCLmf+Bh1kUZvS7S0/PTBWfd
         R5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072078; x=1792676878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        b=igek8CzQCYRKyfU8Bqehxn9M1Px9z9JcxglOTlu61Ty5RAsIBoram4M0eDezRshztB
         mXH5CL/8w6YzZikCM0YF4q3KLDMjkjNBEneG8aAf8aNMivO5fX2BCA2x47I5xPZgF9vd
         v1rIZhgmGn1QDgjZXsjkXvXP7zYrBp1v0d2hDxFuIppujpUTuGqIKfgqXZOapCJMDmeC
         o8FjkTaCsDnw4P/L7yKhTUbfz/sKfvc1iX9jOlUOxDc69WmtVCO9D17NfmlrqAeKU3Qe
         xN2qOulYs0hT+Hm1a7Elf/6cDO8SCP7do1kM3/KGmIhWXjjN9HdzCpH4qHKcyirkTZXB
         cfdg==
X-Forwarded-Encrypted: i=1; AKwUvBxcfpdD/FOmiGi5/bwYB5cHngl5Sz/a9L3vALuZr1Zz8xURrff0Gx+r4ykQ/qC+xWTwEBdToEugsE9TNyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz44EQjvD4iaoWzekIxaD44EH9/aqOTkFwj1jtyN1AVXd67HNT
	GX5p1sPRUqdD8cWpNx1ou4s+/rzoE+5aJrexwMO9mNio6R2a/lRUyaX5MD7tiEv3hZotO0Dq+bb
	mOwWaXToLYNK1TQHgnWDWID3hlJXWqgU=
X-Gm-Gg: AYBFou24+LglNJntiedoCxLjC7wn6SBOhAuePWzMs5DxuAc0X+dstCdkO0iEWaU28B1
	f0BcANOf005DPhHdz7/7RRiDAqrN/qiESBqF10mxzknz+w1l3kxF4DKY+VSwG2DyIuWa6xj868S
	FwC9RCK19Bd3xeZ7NgAEPX9opUmnRrUbHf27vyRZDNbT0dAl8fT3NL+if3lO2+MhP3LEzzsXYaB
	IoDzwwea5vp4cncWNbstUWbtSUGbv9sqsi+vsHHFYG+VETteqY21pe6UyDoFrURzow7XhN6cahY
	GmHxBIJmBzzXcNdhuA81W4tbRqqk4eHq4v52ngGW9PkuBFPFxNJczBq9jJ5c3sVRvm7+jta2MKu
	iOl+6cSs+HP2xnPP6CHLB9EknzwsLLCumsfQDIKU=
X-Received: by 2002:a05:690c:e694:10b0:8ae:b617:712d with SMTP id
 00721157ae682-8b0e2c154cemr221067b3.13.1792072077811; Thu, 15 Oct 2026
 06:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015081450.1241194-1-chris.lu@mediatek.com>
In-Reply-To: <20261015081450.1241194-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 15 Oct 2026 09:47:44 -0400
X-Gm-Features: AclHuK-9IwK4gtIgFJ0IOoJ2ujxMQ8YcnWXIl-i3b10cUaiVlWQ4WrWnE6daL6c
Message-ID: <CABBYNZKaRo1SLa33mWwxE0Vp+3Wd=tJpvTFru-q8uraysdw4Qw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Bluetooth: btmtk: fix ISO data reception
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Hao Qin <hao.qin@mediatek.com>, Wenlong Tian <ot_wenlong.tian@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Thu, Oct 15, 2026 at 4:15=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Three fixes for ISO data handling in btmtk, found while debugging LE Audi=
o
> on MT7925. The code is shared by every MediaTek USB controller that
> supports ISO data, so none of this is specific to that part.
>
> Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
> to each transfer instead of parsing it as ISO packets. The driver turns
> that padding into handle 0 packets with a Data_Total_Length of zero and
> hands them to the stack, which is what fills the HCI log with malformed
> ISO frames, and a valid SDU is lost whenever handle 0 belongs to a live
> CIS/BIS.
>
> Patch 2 bounds Data_Total_Length by hdev->iso_mtu. The existing
> skb_tailroom() test enforces no protocol limit, because the skb head
> allocation is rounded up to a kmalloc bucket and skb_tailroom() reports
> the bucket size rather than what was requested.
>
> Patch 3 updates the mt79xx ISO data transmission setting.
>
> The three hunks do not overlap, so any prefix of the series applies on it=
s
> own.
>
> Changes in v2:
> - Patch 2 reworked and retitled. v1 only enlarged the receive skb, which
>   turned out to be a no-op, and added no bound at all. v2 bounds
>   Data_Total_Length by hdev->iso_mtu and sizes the skb from the same
>   value.
> - Patch 3 added.
> - Patch 1 unchanged.
>
> Based on bluetooth-next.
>
> Chris Lu (3):
>   Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
>   Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
>   Bluetooth: btmtk: derive the firmware ISO setting from
>     MTK_ISO_THRESHOLD
>
>  drivers/bluetooth/btmtk.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> --
> 2.45.2
>

In case you haven't seen it sashiko flagged a problem with this set:

https://sashiko.dev/#/patchset/20261015081450.1241194-1-chris.lu%40mediatek=
.com

Unsuccessful packets shall still be delivered to the host, this is
used, for example, to implement Packet Loss Concealment (PLC) logic.

--=20
Luiz Augusto von Dentz

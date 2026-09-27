Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB841BA7A;
	Sun, 27 Sep 2026 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529148; cv=none; b=mbXZuHE8TxUlkVn4jjVBN1CFflMs/6BO+bZoJ+pEdsAJ4+4qOhClsfHpJVsecqNeoAI60HPa5wEh4Q7Uzi9rec7CvwxJzUFoP61oNsm6TdvUDvazbKYi74Zd0HYojPIBR9CbFZ3CNJDChq1VMVLRrsWW/3CHrodm4N5VH71QsRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529148; c=relaxed/simple;
	bh=1AdgW6WoIIrOm0XpP64YgX1zRuJ5XECl6s0ufFjNMY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0tXxyQ3MT2t8CBZ5EF454Ot7Y+vFYM+My9OYdZ/BZmgaDg4I9S0P16kuN3boCrBir/8SQLGTknJamP6ckY+LyDvB93dDCLKP5pIju27YuInSIquZBX3p7UQrjQg0O/TIuh5rbnjYcWqtijklkCYm3vse9DlsSS0LCCrZQQifkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=jBIEqOni; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="jBIEqOni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1790529132; x=1791133932; i=arc@gmx.li;
	bh=1AdgW6WoIIrOm0XpP64YgX1zRuJ5XECl6s0ufFjNMY4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jBIEqOniPaoBwtULTFr5hGSGBQzHx8LGaL7Y/UyjnEujRty9hw67zU7T2zdaRJwA
	 LdbCXpRlbVxB3yNLAGLLtDD1JLBD+K1hft15n319EdGoRQrLpyZUaUSiY2ia2+PeQ
	 jsyDVtmNLwcH1G98eLSgnQnvB0q/FSLlc+ZJbfpfruexe7g/PhGfl46PTB82hj6iY
	 KrAJHysBS+rwm7r+PgMUgfcx05Lzh4keWv4ykbmRL+meFFb3f1Y5YCStZC9eA9StE
	 o/UGFeaG/cRcwMywBz9hXmFJihHVRmywzXOivP4N4UiZ9qiD1oyQNNQp55sdycK52
	 CHoSBQ+Z2jNcGGKUiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1wkJ931IVV-017vcc; Sun, 27
 Sep 2026 19:12:12 +0200
Date: Sun, 27 Sep 2026 19:12:11 +0200
From: Christian Ruppert <arc@gmx.li>
To: Faaris Ansari <faaris.ansari@gmail.com>
Cc: drabik.p@gmail.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, mrwillporter@gmail.com,
	neil@androos.io, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
Message-ID: <arlOa9a0obceb9Sm@khmer.arcnet>
References: <20260919151840.24371-1-arc@gmx.li>
 <92b1eece-9dc7-4b33-9ec5-fc94300038f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92b1eece-9dc7-4b33-9ec5-fc94300038f1@gmail.com>
X-Provags-ID: V03:K1:MgH66XBqGRTfb4AbyeISAc6LRkxXk+2ZroGtq4Op0Q2J2qJFV8J
 GhhdLAa9FMslyBpenglMsC3RPlz9pZFxtBiBaxiikk86moH8Bnq3FuckfHapkhlbfNw9rqs
 +8/tpDgAemmfXIcSheNwzwESkuhBfMWcTNsdZWJlA6uGAKUWkqyoErTiUHV14qSWaD7fgsn
 T+Tlr794JJyWj6LNL6tKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vE8uEJp8iyw=;iArQ1lm+lx9ZK/9x0eL9Uhj4yj4
 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
 10j2ox5NMfbtMv2ADNJ/e+
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:18:33AM +0100, Faaris Ansari wrote:
> Thanks for your work on this - there is currently a regression on the la=
test
> kernel versions (7.2 onwards, as well as LTS kernels 6.12 and 6.18). Try=
ing
> to set the volume in software like wpctl, or pwvucontrol causes the soft=
ware
> volume to be pulled down with it - I think it's something to do with "st=
icky
> mixers", not completely sure.
>=20
> I worked through troubleshooting it here as I originally thought it was =
a
> wireplumber issue:
> https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022
>=20
> This patch should hopefully solve that,

I'm afraid this is not going to be the case. The patch set doesn't change
anything with the pre-existing controls except for renaming the 'EVO4 '
master volume mixer to 'Master'. As a matter of fact, I made a similar
observation to yours when testing the patch set on the 'sound' kernel tree
and the (very sporadic) issue did not disappear after applying the
patches.

Unluckily, I didn't have time to investigate and as it seemed independent
from this patch set and was never observed on my (vanilla) 6.18.x
day-to-day setup, even with very recent kernels, I forgot about it. I
suspect this might be a regression in the sound-USB core modules or
possibly the the alsa core.

> and avoid the usage of external
> kernel modules like https://github.com/vanzaho/audient-evo-py (which you=
've
> based your work from)

This one should be solved with the patch set.

> I'm not exactly sure how the process with kernel stuff works, but
> considering a regression on current mainline as well as LTS branches for
> this device - is there some chance of fast tracking the merge of these
> patches?

The best way of supporting this (even if it only solves half of your
concerns) is probably to test it and reply with a Tested-by: tag to the
patches.

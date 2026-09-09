Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0737F33E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975990; cv=pass; b=Zb88YjvQJ20L2+PaHgJPWbZeKpqBXJWO01z46XhitwTAxk0QtZaM8SEdgFcbTir0FZbJRk02tT6SETp8uDGA32JQ02KYGcvaXMC2kOw54F7jxdsZqzCZJm6RhSEICVrsc4pH2YIaRr8tAz2p9/b+OUtPyvROcprcf0+rUbOzqtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975990; c=relaxed/simple;
	bh=UJGGMp/OrSs3NS/+SU1nVzly047peJCMppV7Ba9pMto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTGH15na22BJSh87RANVvgQO41dJ9jSXfnQOHROdPZIIRLTbqZc9zU3hm5qf6ExOJYcSnfk06TH8GQKTm1cK0TG/DQmZniSWk4mtRrcQQr5ICJ2F0PX84iHW3lvFXRpBdvWo6mou/kiNjflH1A9FRH0HyJRCGMdc3wJwVMKNbz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i39X5eDX; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i39X5eDX"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2a99so390508fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788975987; cv=none;
        d=google.com; s=arc-20260327;
        b=r7oD/48Vr5QgZ66uG+fV4Ktn1gs9+7fGvDbh5yvSae3hFEqWrtQBmjC5OqOHLMVwk7
         TjdTWQl7R3ImNTQMOKu8Z05cI2WJLGHYGNdIczYNjIc9kuCuSYYFb1cdQ9ueHKJrc3l5
         Yk3/xWhj6Rgd9+7CIgqjn+88WQmJJ935PWTzr/5TbRlXqDRAP3yY5FN0eyYraSC5nJw+
         2jtYOEhua8zmOZ8JfjK8o3DMJhsexIm4UQNrvdFfJoxU/HeTkxw3D7nN+F/KAhDsIX2r
         7TlCpm9F8r7GG+R3at3i3x7xDdpL1yJPlOxXqL8u3eH2zSwo6aUYjTO4903C7k9PceMq
         Vkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGxBHlYMfw2i6Wn1XBE9lhliUOi4k7OBEah5+qrJswM=;
        fh=ig/zrvmqYPmcPHcTEs85lbtBu2nZKUe6B3o7cxChpK0=;
        b=hKHX2Sc3Gv/jDLOlCsJu1BlOhY6OPYzEkLJWlkhMw4DEC4GyFh/5H3GXoNLuivnI4X
         tYDS5AMrEdq2Bp9gJJPHESY/ftRb31Xwsy50YjrpuCdkedb5tnnzkJzrwamkqkgISAW9
         POV+F1yZLlNA1cZFQylW6+kQmK9/lkNtkYdggmUYiZYLndAji5+O8GAIqAud+4/uQYRg
         7T/n//9Vx6HeSOg1rkq+natuC/ROTwJtDxg3w6udp+zj0QkhytKkeqINw8aucoO68pSx
         ZN+tMQZ7RZqFecZkFoG8/bfQMLALNXV7zesh7v3Bp0hWeu5OyBCxwRjN3Xo36SHzbM7l
         xZtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975987; x=1789580787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGxBHlYMfw2i6Wn1XBE9lhliUOi4k7OBEah5+qrJswM=;
        b=i39X5eDXhRG1m8uT6tyKmbK1sd+c0Kn13TfNibYGDnkiMrBSzvUVeixnA4aqFBZaYK
         gIAd23vwkxgnQgve9jDa5aEa21RMQDTFy/XCAkPOaUw+2sE8/CF5krw45HtsHtbLqFoE
         iUiqi7fPV0YBbBBjPgjdwxOsNkUdhSclNU0vaI1xNhtDNFqaq4o+LbzGBo5Ze4ZviXnk
         6yr6cIzUYSf3mCTNhGcSEre8Vaz/UVU1Ibsvnn0n4dnF/fLzwH61YC4UfVF3szdtPHbe
         1nTLfLPl6pXMOaG+C0ZLuMFkLg40Gv6aNoGbG8LZAf4UeptOLzzwXJKIVu0JaOqruBD1
         8Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975987; x=1789580787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGxBHlYMfw2i6Wn1XBE9lhliUOi4k7OBEah5+qrJswM=;
        b=qX2AR01FQ+ZRREBC/utwFI9F7v2GQyLSRBxQ2eGBUJdFu5F5kDEGNCqAnGIHF9WH/O
         wMBTAjqtcGFlUavhKwkc6h63Y6BCP84oplyMR7flAfml51JVSC17QlmIQrgCMwSQ5Awd
         Pf3QFpuFFxJe1+bdSVtslcTSKhVNXN+mUGWM5TwM+DtST5f9h2e5OR2dcODeO3jedV2F
         R72CS679lc52ILsjin8oaxFReYpnqLA0mD97cxVPb4wiZWAhYRw3wzoHT9dyvj+tD/ro
         /RZu9cDf0LxJQsjW/PFy5BZv3O9PyWYf68IkybWvN/Urf3J9LsE3reN9VTBAIzBfJY4g
         yjgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzHDXnKC1c3W0Vi7TMljEHGMD5Q7tR8tMVuFJhz+iGpVvsKc54aTAXo5VY0ZmaeyGTU4KE75iKOMEsKwo=@vger.kernel.org
X-Gm-Message-State: AFuF++lirgVtUbd8oxxcjv44uOq3iGsk6ZaFGenmUBBuWgO2/4XVVbrl
	qtl7oymWkrrIW2apBmW+VBebVpVqV1GLTiZXq9qsTEhv0SahqPAW0TLcjlAP5ULfyfD8izUMJBA
	oxC2268hXnYqNPCgmv5dAhHmZr4Pg0ak=
X-Gm-Gg: AYBFou2sd8Y/Z6kAShKNcIObbCHUp0gn9ViK6thaddGxF21pgGmgpMM89MxMEcDrUkI
	k35ahTnh3MOMRsCtRbfjs4N0hT4ZfJMak5X8aqxQ+ezjIsVOa2ncT6W7ThpoxUbqVXorjmPedoz
	VJi3LUPp42vyaJgZgERo4fB7EmpoIj/X/IOJnPpA+QPIkzT2z33DX138XVpPAb4W5r6OJ1+aM1u
	UrvHHmylKTK7ahodYEnwC120VIU6AnElTaGmmBuIuyfW0qAajqXbk6agChv4Wd/UqkvBxc6jexG
	XWh/b97UzXmwN/ioEnKdaMibFszeCnywgTBFvPKKz7PsxSl+jeXYB0Lq5mYgg+k8ujMoAttfeff
	rV3bF7azqitov
X-Received: by 2002:a05:6820:2912:b0:6b3:b9d1:f629 with SMTP id
 006d021491bc7-6bee5e98160mr2823187eaf.31.1788975987613; Wed, 09 Sep 2026
 10:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906131414.2683362-6-mmyangfl@gmail.com> <178896697703.219967.8447526738608779891@kernel.org>
In-Reply-To: <178896697703.219967.8447526738608779891@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 10 Sep 2026 01:45:49 +0800
X-Gm-Features: AcwNN1VxSFEObAOlS0oWuqxHPTQpRA1FtSHwEXKSDmt_D-rjyBcp-cftfMoT6sc
Message-ID: <CAAXyoMM_uqu8z0jzTbNGGbOBW5UX3PGzJ-Tz3OZmyQxeYxTs0Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/6] net: dsa: motorcomm: Fix MIB synchronization
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:16=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Medium]
> Should this carry a Fixes: tag?  The unsynchronized 64-bit MIB accessors
> and .get_stats64() came in with 186623f4aa724c ("net: dsa: yt921x: Add
> support for Motorcomm YT921x"), so this is a fix to already-merged driver
> code.
>
> Related to that, the fix does not look self-contained: the counter type
> conversion lives in the preceding patch "net: dsa: motorcomm: Use
> u64_stats_t for MIB stats", whose changelog says "u64_stats_sync will be
> equipped in the next commit", and this commit also builds on "Rename MIB
> stuffs", "Split MIB buffers" and "Split MIB module".
>
> Since neither commit alone closes the tearing window, how would a stable
> backport of this fix be done without pulling in the whole refactor series=
?

This is a low-risk issue and does not affect control paths. Also it
would be quite impossible to backport it since the whole series is to
fix this and it would require major refactor on the struct.

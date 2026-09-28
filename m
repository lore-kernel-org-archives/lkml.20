Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B82472AA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598726; cv=pass; b=DgCxFdTMKef0AEgSW2e0OD2JtolssN1Bh311ZDZFrhgUAqMvaSLAO92uI1IBgpoNT+7LUiGWfV9vZSacbSZEYWsCgrhDEaENsRpEI7fYbDua5BE+PLFbiuBM8gSmhg0aUSRly75jA/bPbWx3t6HqgbjU175K7ixUMMc9OLTKmbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598726; c=relaxed/simple;
	bh=LvGdn2hkiIeEdQO/+4P0N6T1Y/jNQdIt2aZQDR7H4Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYjiW0Y05js+GPbaoqSd57J3hZg7/GPka9bu5QcR0/1tTszUch98mNDfDZRSx1uVDxq+SPs+wcOnQwJKA5Za+75HqKgaz0K75Z04yAIk/K1Bw6kukkTvMFv6lNnIl80f3btYtEKGeU/kcHpPN61Yd06kuM4ctev1modoUtt5nR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsoA/ObH; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsoA/ObH"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so40303557b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598724; cv=none;
        d=google.com; s=arc-20260327;
        b=n5+REzbMn/+FkvyhAds8F79nmhrNekRAxOUJ0QOsZXhxoWpnMEpa0Tg2tyq/ZzKkbO
         M08woT2hWL9JwK+ZiZCFjkSpw5DPFCM54LpUpuls7mYlvJyOBaG3IXkNsjwn+SBcIvNj
         N1st/+f1eRFby+6a/UWgLnXuQ0ki889PGqgyWuajpmeW/0bdKyXLMqnozK5d10anJy9B
         ASkQkviZ4J4Kxc+RTJGPvxyKKuKJ9Y5TDGppYSSj15KWQYDYAk5zbZVamYlpCT+t2l4b
         qkoaBGFQVlwQt4jsqB+oKM6UFev5E446N+4BkU4/N1xz0bDd+l8ArhRoWnDfD4Ub6sr0
         W+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvGdn2hkiIeEdQO/+4P0N6T1Y/jNQdIt2aZQDR7H4Vo=;
        fh=qsHgB8AHLMsEn0YlaU7wWvDwrELtiYeoD5whwdX23dM=;
        b=lQXoN9GYScJ4f9COAn4iV66WsRZQtXIBe3VSFDLZ8fJ2B3KnCI3tNaFviGEueiTS+S
         fdFe99g/3KpW9yKNSe3W1MG8BTha1Un0G3X2/VUx/RRMRWSzKG1C6SFYiBu5bP8KStOg
         sUZLGyhr1tmnwLUfrsfKnXCr/A0FGaBmtmdQUWWvK9dTH5ONJmRLOppDE55dU1Ku253+
         sO8S5U+g6FW8cH6k7FbvbAmhfJphrSzjhORwBbla9gx4b58mMQpRvvzk7NvDaJjyXrvo
         GoCl2KsXI5U3e2NldgOfyWPxOH0Ft1d6x8UvLDj6M2OaE6lJcPPIuovSPeotcsf3IlyG
         UtMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598724; x=1791203524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvGdn2hkiIeEdQO/+4P0N6T1Y/jNQdIt2aZQDR7H4Vo=;
        b=VsoA/ObHaVQQX+rJUBqac4OF7VxPSy/ydlo2HtzqPni1a/loImcDn1e6hmtfth0NwE
         NgyaP0KUfC0ymfqqMorkSLhvOq8/fXlnz5Hc1y/RR8uFchWOsE9gbkpUFDPnbM15873K
         fYlg7DOcxgBJU5e+1rGWr07Kl3VBbMkbt2W0bnoRLowoQWH7sIjuvGxyIuulxwqLt8LS
         5zk8m9q44s0IDIT1kTDu5cj4vDqptBMDQm5m/1w3CTvbWIvSNF9Ea6Wm3NIzy3+2yCRu
         qYn4dtcyGq+WdL+Fg43HwLAQjso1ENrQgDEdRhpEWb3Xf5Xl26TLCwqPIBjfOM6cntnG
         XMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598724; x=1791203524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvGdn2hkiIeEdQO/+4P0N6T1Y/jNQdIt2aZQDR7H4Vo=;
        b=lCRmEUuXpu6DC5NTXGXt5FPxMLxivUF5R6dwun1tgX/HTkuZxJJyqWrJCosWk2IFG1
         +FpY+g2u4A4fO3PL9VX0mWdX7/gaKjvvXp3jICYbKouF3Jmmtlp5e9kqYV6KqjsC1qN1
         JqJZ1OfI71SXf2ilXA+1elFX+5UABSJVdpNIX5e+BrJToc2ecGExC6GeT7VxcaQCqKb/
         5c98CESs1rDNtUOxO3nBP9Jmoi5/+Qfu7bzjORKS0r//fx+1DXCAVDzie3C/546hCOFJ
         prCygZ5EB56O3RNCXmPhXD92Pstqz/m8IJbNFGkTzr+1KnWVd5LgqPAcXFToH6am8grm
         oEIg==
X-Forwarded-Encrypted: i=1; AKwUvBxxXW1svfVHKYna2xfTIhZXROHT+RjZ8hkUpsj5q67E7v+/jf1Pj6xLknvu/fRHSdU7/t/hQu/Qi29c6R4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDypYFkxWgKpLX+ZxVQ/U3SPQKDXSgsu+2OOnpymXsp9l1izpl
	RZlHPXY1/3q7/pLZWTjPQ1nCK0zhh872cLw/SgdgFOrc4ozgMbpbKtUPf6kJJgNP3hqzZGuMOlh
	ZPld4TKGtP9cfDmuPI9p1RBMJDkLK/1A=
X-Gm-Gg: AYBFou03lsXLpbFaoogHW9J5bl2HIm3X7FOWcW3SQ1h5f5CDTf+XHcHjnmIZLVEHVyb
	/F8Jz/gtYubNvkFXhTcX3gFkTV0rdRwcbaq1NC1ptYDmR2DFInIjoPStrdahzLQMMhiiDOp54s9
	4EOhKikf5dNjM9WU+ed2c6fHtN1zb+lq5PErLzA8UONRc/UkScXIuXWmmD20JwA2HC1b3C4vbmm
	dZAb2k/GGCBpJpF/aeox/js5EF+HK/LP4JNMKItfo/Hp48zTWQ1+q6RfZW7EM7RKWgzFDyn5GQV
	1P9tXIw99qyM8YsG5eQ1OE2TL24gYj3UDRWaQK7DzRIMe2gHf6eOutUGNqpCdwBKYVUM68xYIQM
	TZqB70XYWDCs/SMfIvPMykWxXPE1oYL+BTi787BPI3nn/Bb5mb7vfPpwi
X-Received: by 2002:a05:690e:43d7:b0:672:a098:bfa4 with SMTP id
 956f58d0204a3-6740bad5163mr2491644d50.90.1790598723665; Mon, 28 Sep 2026
 05:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADhLXY7008e4JA35T2wE8TnJnR_r82RCpfSd=aLBmDh5xAQ02A@mail.gmail.com>
 <20260923205518.GA1941939@bhelgaas> <20260923225059.5c8cf0d7@pumpkin>
In-Reply-To: <20260923225059.5c8cf0d7@pumpkin>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 18:01:51 +0530
X-Gm-Features: AclHuK8NUjREgQIAohkxNSm-52_ycxHjkhDYIqnt9K1ygKIEBhfIimWuLdHG6jE
Message-ID: <CADhLXY65fwGS=87oOtyAi9V4oXjbr8jgJNcSc0wXkVV9OOsREw@mail.gmail.com>
Subject: Re: [PATCH] PCI: sysfs: Reject unaligned resource I/O port accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:21=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 23 Sep 2026 15:55:18 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > What do you think of the sashiko comments:
> > https://lore.kernel.org/all/20260809051652.36BA31F000E9@smtp.kernel.org=
?
> >
>
> You could just add 'if (port & 1) return -EINVAL;' to the 'case 2:' branc=
h,
> and a similar '& 3' to the 'case 4:' one.
>
> Did it miss that loff_t is (probably) 64bit on 32bit?
> Or do large offsets get detected earlier?
>
> David

Thanks David for the suggestion. I have send patch v2

Thanks

Deepanshu

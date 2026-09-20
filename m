Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19151357CF3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923623; cv=pass; b=a5XmpnMTGnuCL31wSDCzgoslooJP4lMoryRO1VdmDQA0GRfIyjXUYHuRq2t9D5ogKGOU8ifMttgYDD9ZMIv++jmFfxnEjTEs3lVsfCOa41lW6x/AJEAgZ8UPDCBg33mkxqF7OY0o0JwUMKwzoaHeU23kDPdv1k7hdrdolbMV9cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923623; c=relaxed/simple;
	bh=FOYRk6VydLS9eMfMxZB7qHkZwQsdY1XIXbZky0pHTu4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YNa5ZyVA3QDjV8c9civoj5Dtfv1zy4/YdoBjxC6u/KTxvvby3mdQEi23Waujov3brO48HGQJnkWeW1A+FWbQZgs4FgJUddgoTwV428FPbDfD5aDnkrFcdMPziKrPbNKkQxhjGEk55J9xxuEuLqXojaOKJokhUxVxXb44dv45Zv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtBs1ge8; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtBs1ge8"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso25650675ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789923621; cv=none;
        d=google.com; s=arc-20260327;
        b=LnAtmvLs7W88gnzbvhe23zuFn86kiwYTSTn4Nmyj2wO8hYn7QUCICV4wzouWxJx4X3
         Dzf+lwcofPFLH215VeYApzcMub90zybNqs0tQ9EzahJoc8q33a8Dz1+6aHXH8YMZzN15
         eFbkFSqpnuRlCq+qcsvsFGBKmUv0Q7A8zsGs/xWzdqwJj3BXrIrH4TEx1ZTdvWVnqFKv
         TVNg0nBcE5JZuSSCQqfPcXvhIG7vv3vMQzD583S6p0aLgnO1zgwZAvMceXrLuTCBpNzn
         thB8h4OyNtEw/z7It0d5jnwHqjeozPsVgoRy0nE6fCoS3ROZa4qiP/I9TDo36F0sKQg9
         SfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        fh=W4NUTKXLquJjCuNnfIt38FIC+rcNU7e9bv3MyqORyYc=;
        b=YvIw7lHLwQl1Xadg/pmV7wn/NLJncgl3Z2xnVy+nPLjSKahdimUDdwhGM8LttkE5Ep
         D4btCbIZ3yLriKnWwM9vRDm1px1VyCgNXDzyPJCJU3OJxt2Sm82wj2BrGi1siF54uMTJ
         43++rYo5pSk+Bf7CXvdgJ8zHR7BewtslEfhfGLAEqfIlTgT3KwR3W/G8lpWg5nX0cCSv
         AkxkJEMo5UC8N3EfOANfl4NgYXz8bfjGMefCXPfMAdbBvy35c6EhMO9kg2xCADKvlU4C
         uHBJ8j1U9gRyn1wgqKI8bWtpD1I6h52YBw2MGbK7LXesSgyDPlyXoGhou31jMn8tSGfn
         QOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923621; x=1790528421; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=CtBs1ge8N8802K2qiSwPviTbPLjS0zS/KdYhOtjlXc88KDZXemc8xY1fN8360RQUy/
         pI9pscfZgZECIQOasRCtOKPTCMoqfgyJRR0lqRKQehh8M+QPCDyb3uPJrRljlPaiRFlf
         1nGQzkXlePz0QNbxzuK3aaXOl2Wv02bmcsAd4opP5+P5sUiHmzxjFjvQlnnSYwC6ctlr
         geWtfr26HZM+OWTUo34ll9VnsVDYw2DMLgy6EQk8t9A35eRZbsrYKto8UUZqvDFi1U35
         7Io/sSo3/ldm0Wz38E0mf/9qpn4chmgbR6bAPvcQodyg2VFU79P4qcA0Yldxg2Ia48oo
         E1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923621; x=1790528421;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=uOGoxL3eNiNrD9/SlTgktuO3IgVLEk0KI3+LZ5G2e4p8PYtsIn9SnjsH0RuSZiQ8di
         YrwUYRJEdY236aZrBzjz+RC16mgc34jMsBonVzGzUnSqwPPc6PgANblDR6OBv1afvLp5
         2nXYBheSappRx1hu9qO5LZqzQcRsB8YljV7zumYzTals49I0lndbAqVLPPJLadyieIlc
         KKiDHz2tqrkoojGG+jzQhFDePIJCAW47JBvoz3QjMgRthoCbD8/CTkjO2mw64EJzTEjM
         ZQ68v43Nkq2GUBU8kmarGm7z9ybJoR5+5dOQW5SMY8dIdSy4+TvDusNJI6EGkyJLyOqC
         vsDw==
X-Forwarded-Encrypted: i=1; AKwUvBxBEiTpzE7W5Qn2y4WNiKIRaLZZ86jmxGwGVJjPiQoLewjy8qcdia5Ea2W6PPLvHT8z2pWyoemjn7sC+Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++nna+gahxTf2r/WgaOxF0M08BL2eeeZ2NzQVpChX0O/XhReVooN
	cigASDUZeo+EtiAeFTnzaLTQSZxjT0V7NRviK3+DUgFtx0pqpz9o0xXrkj0MM+qq3XE420Zt24k
	XsTofia36Bu8NWpQ9bWlUQs0pFD3wVDCsQOsw85OLxA==
X-Gm-Gg: AYBFou2P5wK7H5AKieQ3wxJaiAtJdNPWVRw51q5osJEXByLg6fAZINdGsTN7Lz+aRtX
	lDSIR2za1pE2vOfj+RyEqUoNBU+7+77+gQfIor2/m60wgsibB1kHNj+KKuzXwU6qWjSG8NwSqko
	UDJjX559C2yoM+KK5YkJzJNmu91AltkGdfywMuvTvOuPkfe/OXD4nLQtRma3zy6lNWdOTtKWwQe
	Tmi4yU3cEh87NOo3+jYrSVuDVcvg5iTFft27XfDwBMAGT8iLjbI5HulnzNo9HCk40U/izIv18NT
	3fOSP6i9mYONP0vko/A65tO3sMrMvy6vGW6jDn3xponLYAklytmh
X-Received: by 2002:a17:902:f545:b0:2df:3f0f:d65 with SMTP id
 d9443c01a7336-2df3f0f0e1bmr26183525ad.22.1789923621367; Sun, 20 Sep 2026
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Olzhas <marat.olzhasss@gmail.com>
Date: Sun, 20 Sep 2026 22:00:07 +0500
X-Gm-Features: AcwNN1XtjfcG1A3vuRXuZwWNFiaCVgATiKsMbPLyoi8g9WObhx_BLl_2Vjqsho8
Message-ID: <CANzgjV0YWUX6=ZGTbn4KEKqQmVhsZTsDPeRf0Nfq=YFT1eoPzA@mail.gmail.com>
Subject: [REGRESSION] pinctrl-amd: Don't clear S4 wake bits at probe causes
 power off to reboot AMD Ryzen laptop
To: "mario.limonciello@amd.com" <mario.limonciello@amd.com>, linusw@kernel.org
Cc: linux-gpio@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

I am experiencing a regression on my laptop where attempting to power
off the machine results in an immediate reboot instead of a shutdown.

The last known good kernel is v7.1.7, while v7.1.8 is the first known
bad release.

I bisected the regression across 9 kernel builds and identified the
following commit as the first bad commit:

a7c855969b1a ("pinctrl-amd: Don't clear S4 wake bits at probe")

With this commit present, running:

    systemctl poweroff

causes the laptop to power off and then immediately power back on.

I reverted this specific commit on top of v7.3.0-rc3 and the issue is
completely resolved. The laptop now powers off correctly and remains
off.

Hardware:
- Laptop: Chuwi CoreBook Plus 16
- DMI board vendor: Default string
- DMI board name: Default string
- DMI BIOS version: AB8139_S_2C_V00.01_007
- DMI BIOS date: 2025-08-05
- CPU reported by the system: AMD Ryzen 5 7430U with Radeon Graphics
- The CPU/hardware appears to correspond to Ryzen 5 5500U / Lucienne
  silicon, although I am not certain whether this is relevant.

Software:
- Distribution: Arch Linux
- Last known good: v7.1.7
- First known bad: v7.1.8
- Current test kernel: v7.3.0-rc3 with a7c855969b1a reverted

I have verified the fix by booting the reverted kernel and testing
poweroff successfully.

Since the DMI board strings are generic ("Default string"), I would be
happy to provide an ACPI dump, dmesg output, kernel configuration,
bisect log, or perform additional testing if needed.

I suspect this may be related to an S4 wake source left enabled by the
firmware, but I have not identified the exact wake source yet.

Best regards,
Olzhas Marat

#regzbot introduced: a7c855969b1a

Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4D30B529
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853763; cv=pass; b=ILKGEidQAiW4uTM9GWHCIsBMe9LHV7t6YRiJq8WaNBkimj36+eCQvNTK+XSk8Gp+LEvSIwygqoSFLwoIg4uTYiJ5nVc/oDvXwfinxXXcszLaVKrK8VLz0INlzQ23Ye8cda32nd/7dd5tijGGw9VwleZoTUDFGq+geGGM/ocS8Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853763; c=relaxed/simple;
	bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZvm2Z1CUom9XRGm36jrqljxD5rV9qibD3XoTChzqn8Mo5h3KOLf3nLA8W2Qtvov/QzdTXMOCsddwklLlK7pOopvTiP8jhN7FiFK0MeIYbskDVRxypZ/X4P/hcPfDgv23w/brUG0h8zIsj5qt/cuJfXbRzwCMm+BkGgKoZumxKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2eTbU+c; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2eTbU+c"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a20f56876eso1065751fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787853759; cv=none;
        d=google.com; s=arc-20260327;
        b=JH+q8AcNpaiKEZxhY2zTleJLrJmvKxoGGtKy51ivcN6CpHjbWQvbJURiqlPXfo0qN6
         mTn5aEA5DJigcO7AAN5FQaYgR54VfILbJH9v3C4TO41QbknV/fR8dBEmNiDrtbdnO3DV
         7dKmDJRdgCciz0z639LPdo7dTwpR92ywMLZKos9t8Uk6hFqHVe4gP5GtZPsOy7gD/WkF
         BSpclnUGP8vDfiije6XQ0zMI/aGxuQw8fOqWLCWIFEKdPdu/qvUst5jwQNDIS40J1Cc6
         rHnI7icHB2wMUfxGJRUSHNCZUvMilzqgJlNSQyCIHsiuxU/vuOCqd4Y/cWY7RYo7uOnQ
         vjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        fh=A6+ITNdpfzuLAZeltqxOuKOnQAG/1JgC7mBKASQ7oQE=;
        b=EsjvnfArCYXr1v1I3lsLViJ1hZouqcv2YDqa8RfnEzkg6MlZlVxQ/NZe5uuxtIV+TS
         6Sp+R87tN9RZDhAIQdzrKbVazNSCga/f28joOSmGT6iYILU9eSLcGcyZqaHfqo67k0YC
         gv+Hg8BGkTgS5bHKTH3QWWwrqx94+uvLYXbNApqhqZv/xOUpqgc/WGMNxtfsUCtdpe4t
         hYH1W0dBiD07pVw8F0B2hHTMkhRY2niDX3JX951IirCsWWO1aOlJmmSnGZ7v99UWlehY
         WKYeKPsdRBegECXamDU68mpD7OBlXcgYfyQGrbfwzZbF45fMoFfgo2Ub7SoAIst6KPOt
         O7qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853759; x=1788458559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=n2eTbU+cbSbMUPkABPoMoo/sPQBVCvk2x42AjW51PvgBG2QdJkfraFvAANsPASidPf
         hgKh55SR4U04ozjiNmctMMYi6DdS84DpFDoN2Dda88qInvjcUzOuiq8AaHJ1LjNrqYXd
         BAhTk8QE74rczrC8g2Jh+81993ycn/H9sglMjaRAEGLj3kDriJsfUGVhQPTBVWlfrmnM
         zQ9Wp/bpAoBBunLQ0c8S2qR+05WXHrFYD+5DAGN29/41yzzqdH/t6mpiJ4Kq+Ua+S6s2
         Miiilzi23ZCYmU1UCM3d56SBR7xCR6syP3wZvuI3HC5AgIaTtILZRsvwzhUPpXXaXyxW
         S6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853759; x=1788458559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=DOsV14k5PHIy0imZmVi9xfHjb0cYzrMQcZgIzRRyhqKc9yTYTWLyhyutmEI4tB5QfO
         X2yZyaG8gO3R9keI/vSl0vqnMzHq8FtWdr+49SFmPAgcZojYKZSY0pq2or7e+CPKSBAt
         r+FtkvFsyB0vkjIE10/u68LJrGA2Nkbx82caYzsmsd5UG8al8Nct6kSTHwatyfx9ApHT
         64rcyBgBo0MQqMKLbaogA2VhSBthjoeQYT5a1OGl4uoFo5/3KZuZMmzVD7xUbIRECDAN
         FMIA5ufjQMRARm2aTB08MXG//czL1G4UGvFNii6Dwbncvhs4D67OFsGfITFMiFcwwW4D
         nhGg==
X-Forwarded-Encrypted: i=1; AHgh+RoXJObtenLOpqV6ZzrJEhh6YB2BqiZ2lfIQmQp9HGyW8l29qnTh4sSSXIPTmi46W9kHbISqK9frGJRobdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nf82lPIEyOZ8DsMPcW2BWXRW/FegUo905HJhCPTKVanG/m4PeO
	KgkJwYGY9L43fm+viG35Fr0nsGyYkdGMUw6UDyi9FihsYKi/vbjyDHs4zNwPRnEE8laCjNUjoto
	njulCIgqFQqCDXf7YFGv3zI5g/NuN+pU=
X-Gm-Gg: AR+sD12AHFI5+11RRWDmefA0vv9CVkgvM3EUQ/AxyiJegc4SMqAfdEFx1+LiYhIEmTx
	afLkLrf8cxVNwKG6BEq7tgejEMAKeepmcWos14faBBML6/Idt3U+PTaw2hcPzWLDLWwrdDwPtLr
	l16WewCr+tSMhgzf7N4OqGt0HuXQrIXX/Bl5oifXSedYaZtZXSzHcnA/rxaoiR8qVYUAfS4gdf5
	Hh6ZAJXlmKvQPINJE5N1bRkvNlI4/Gnym5Mqc8tNzyfe9mkS4xTRRIcaGDNTsT1PKpIl4veGTIj
	aEsDoDOnyRKR0wQGJWa3WKOPPq7xkV+x3S65n3+7X5pw4LZBUq2gwWgpN7inAfkwxHu3V/LZvrx
	W4trm+IkNvH5YgHfLLt11jmtepw==
X-Received: by 2002:a05:651c:a11b:10b0:39c:9241:af65 with SMTP id
 38308e7fff4ca-3a301ac1f3amr415741fa.11.1787853758715; Thu, 27 Aug 2026
 11:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
In-Reply-To: <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:02:27 +0300
X-Gm-Features: AcwNN1WhcJL-nGDx-lqXbkS4JNH0Ob2Z7Us1EwrenTLfU7VSU-Ti3TpW8tZnfmw
Message-ID: <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >from the mwifiex ROM, which conflicts with the platform regulatory
> >configuration on units sold outside the US market. For example:
> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> >When the system boots, it detects a conflict between the user selected
> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >preventing phy0 from starting on any DFS channel. phy2 works.
> >
> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >hint from ROM conflicts with the platform and should be ignored, so the
> >platform regulatory domain can be used. This does not allow the user to
> >change the regulatory config of any radio. It only allows phy0 to start
> >and operate according to its certified configuration. All radios in
> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >they are certified.
> >
> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >
> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >patch for these routers has to be sent to OpenWrt.
> >
> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >[2] https://github.com/openwrt/openwrt/issues/9956
> >
> >Cc: stable@vger.kernel.org
>
> This whole series is not material for stable. Please drop thia tag from all the patches.

Dropped CC: stable from all patches, and sent v9:
https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t

Thank you!
Georgi Valkov

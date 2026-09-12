Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2B3B3BE9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240344; cv=pass; b=HO4kLlv+ihgbcVCddN/fu6xGrngtMNLOXuF6uNEjiuTOmyf0Eb+ZflYsjWdfcNiE65ciqWeoh5EBEYvIhhQ3dIptPu2EnHXLrY7lFVVwiYmv92obNFPmfzNfLJptzkjpHICVNDMJ/Q8gYAFiKui279Q5r/ZW3ijMMS9n5yxoVV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240344; c=relaxed/simple;
	bh=u+xWrGD8mImT1Cc4PS08HKI81seYVirb45TJpAtTjAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o45V6e2QV9b/e0AX57FJuNl0odUKknA1PUc4UKCz8v3TtBjTNubMOFcv1xtAr4G7/Lv4yaC+Mhd5SRJcX+OdrqfPFGX6AjMDZ3DzsBSDLA2/V3Yhc9gbbbP0yvlIpn/7IQZqcoxkxqHNlfJmmcxiWiGfvkrXppLXvucKFAqXlfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBBDpAbm; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBBDpAbm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2046806a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240343; cv=none;
        d=google.com; s=arc-20260327;
        b=QKaBjker0K8vpJndrgXMeO8+boSecOOpxON1Uxpj11PYbV3AeZ9o47TeDsvjRcN37E
         7eqb6nw+2OiUu0WEs/Ru4xKDIN9d+xsPg1mQIJam1IouU2A+2JQqSKRXtqVQSnJXUBw5
         9m6uMm7m/DOQYLXhaG8mjBPpvY9ij8hyByppTjaYmD2u1GWJyWLs4HOH5uzsXryHrR6J
         iPr0g4BCClClaMtsaxfqM9DOHWTiKTwdieNQOeBUJSYUXCoX/sDDWAhTIAxexQK41NUA
         RL7AJ5EV54huSG8EynLjr/E/dycaO6d5Ihskmx1lEObteWekxCGMaJMHAsHrOnWSzPAE
         8nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        fh=nbgsQNqT33dtNDvMUgpKnZuV3jJ7g3P//Zk8b2aMgoM=;
        b=bhYnDmByPyjl6kQrxIzu+Oan3tLnk4iKw7D/r/JvXUGn+9nsrz7GgIysYpF21tLnw+
         11wVYqKJaH4eo7B0GADzaj7VQPf6WoqqWZtrr4p8yfL5aqm0udlsS26FmX7lcs7bfbx1
         NS2CIuiv1yzyxXGdRFNOuK0Ff0JN3RLr9HXz+CBOKlvyFFmKswgnvS93BWtqD3eKwqmV
         CWQKX6Gi/N/FaCbNiUyQSk89JmSg/5ejtM7LLBT1KDHYk7WFf2m6aVJiwu1KcU+hHQwP
         c595I1f8lT2Y9EG6I9nV9nmUP5ggZykffnHQTOT0ynerbMdXnaPFYbZptYShTeHIrntT
         O9DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240343; x=1789845143; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        b=lBBDpAbm4Ot3Zs/rwU1IxXpesS7eLJ15kjCfFvgzE+m/8pJNEofW7wTPnuviUyzLuo
         7gp+F1Xub8iPk3/lC1HYPZV+PoPkLsEeanmcrpt+Hl+PV2U8j9eRZztFHi3FnbnYFVKG
         ih/SqA9B6p4N3b8+hVmLHSOcHj1jtVBWwMQWdohQMpUGD/h2KAWtdKEue1G9HFUJxm1Q
         X1TuXjlDa7rHIvrV/pgD9Z8xdHM+CCIqvIuzsb/dwNEVIMepy1B8UhBgAW1XA5lsUIHg
         DKUZRAqIi1KABjW3xxEj+TEl8owBW1VfDxyclR3hKth14VoH+myNeOYSPreivErGe6jw
         iIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240343; x=1789845143;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        b=foocKTxa3FfLbwpwTHZUQM3PCQVrOwFi29TVSmGc/UXCHlCYI/A75TsdiLqUy/84u2
         u6g2WEqJbUZC/deg5FhMUE+KpTXjHY+TLhOnmAhfgVdauJO7sqZZZbFVuQ3zwIM/HU/X
         Dpez+PmjDtr6PLjZ4nNkTTVyKKpxd+kr1KlB4UpLnunSOPAzpMC070wf1S8+CREK6GTc
         hxlVRfvo8U2hChXyEahuCH4YVi3O9x9dzsYiUOn49RD+xrWTEACNpnGr9pPq60wgO16N
         Smh+0nB0TaP53+nSIho+iwbrTY5lst6CVw3B3heO/ADTqgoq/vxq8ZJikayi7ytG3GRZ
         r/2A==
X-Forwarded-Encrypted: i=1; AKwUvByOywCp3SOzSZyNujuKGnqZRe/n4WJ9iB3kRVV78/OzCd2Fro9EHOuUhxZ/+hUiuuvHiJhW2AEDbAOfQfY=@vger.kernel.org
X-Gm-Message-State: AFuF++kwN1BaxLzXYomvtHU7HADL8F5q0gb2OskNWTmZ42iiTKO9H5DA
	LvA62+R64tJdsyejljmorIHfwsYHbx/wbM/GJTiwqR1t3AAYNePJ9/b9JKVj0t4YVwOZN5yCuWd
	eNfEy0qfw5/JkCkLZ3FPWr6mij0Qc2VQ=
X-Gm-Gg: AYBFou0R8tYawcLyrAUNjNfAMAh0NcOLijvIK/JatTTeoa66dJJ4BTCe9jRgvw7QGNo
	y9kkjMQD3s995h1UjjLiWBy5S6KETShKc92QOJyGAR8wGkxbKivWLf6XbHp4AeWA3/bSUGcgpft
	dyL0qb+wFUPM9oZBfEjOVWYb30UPHQXsL5u3BZmosyGX63VF/TSfVKj3+wYxtoch0ERAfzu3m6c
	4x4p1Sk9OOcv32gJT+q/Cm+V1gR7aN0ng58BMLiLJxEDy8kx/jVt0S6jV43rj+z+Lg/ZqmvcULm
	XgWsnfnDAkFQkeZwSeWvwgzgXbVK6i8fmTMSg76t+R6NJFMs8Q4RaKPwb8rzQHbAFaZbVX5y9Go
	mKmhtZ7kYmF6p01SRQAtb8XA=
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id
 98e67ed59e1d1-39d9c3944aamr16279860a91.25.1789240342643; Sat, 12 Sep 2026
 12:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com> <aqVSfA_Ns_plwCpK@stanley.mountain>
In-Reply-To: <aqVSfA_Ns_plwCpK@stanley.mountain>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sun, 13 Sep 2026 00:12:11 +0500
X-Gm-Features: AcwNN1VUFJ5oW7vzR94ZpY5ACDu7fbIXWq2PXETpg099etoVmWp67h8nKH2Oho4
Message-ID: <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 13, 2026 at 12:09:00PM +0000, Dan Carpenter wrote:
> Imagine one thread is calling get_top_mbo() which reads:
> list_first_entry(&mdev->pending_mbos, struct mbo, list);
> but the other thread is calling:
> list_del(&mbo->list);
> It's a race condition.

Right, that's the exact interleaving the mutex prevents  with
read_lock held for the whole of comp_vdev_read(), a second thread
can never be inside get_top_mbo() while a first is inside
list_del(), since both calls happen inside the same
mutex-protected function body.
I'll write it up and send it as a patch.

regards,
Muhammad Israr

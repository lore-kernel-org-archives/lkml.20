Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797654D0CE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642783; cv=none; b=DNNzYt/E78UJtnXgm1t4JAKqC19lr0OWIE8cYzUEVif1rfHiL7iXJHg+Yo688EgU0NAo8ZQ3BfUs5jVo4F+9chhKTF7HEpX+EOrvM3oJR4QzxYpQVkhRlXQFVubwJ7iRs49M6HxQ1+j7poyqyWq/AHitT7XP2arr6xxsn0Rzfjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642783; c=relaxed/simple;
	bh=8e8Ah+7WlZHbhtXBLLlQRSAvSloayfN47Xg8BoeWzkI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tjWH5aMsevNVdUWIyPIWJoHfzxghbLTk5q4eok6anrk7mV9w05By9YuAQ28s0hvEzkbTTUCrxUA9WIbeLQ+nKU9Y7UMjLrt3+lQo+Setey0/adLzCkxrA1I3TTxSOfI0RJ6Bl8Im5gFMrKH7KbRmD8iHexJSePHwXNY0nSNRKG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/6iZZCo; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/6iZZCo"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49e78a58e17so2761535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789642772; x=1790247572; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h0M7opCWPOuxBFEuwAzPAI3fMW+G/LVbMC9tyOg7hDc=;
        b=d/6iZZCoppIIVZl9QpIgklFXZXZoKkLRQJryB2oLdVbShfOhnrYe7qEzJKAGHg9Fhs
         9HaGUP3r3/vT4HfOI0wARNf9i3EP9pCxoUekepUKAPKHN4ZUo/fDlMBbPZFk4NuMEtpZ
         jEscfmibdxyykCl82IEkOU5qwoCXV9jQaErqKObXxE6udizhFIcWIRq+bO7BgB++Pixf
         //EcCX2xtTEmJksO8NE9/8ozoG8X1ZxHLDh+UTwkgVZLA+06A1Rrmdab6x9Shl7mnLuD
         bEdRFB7oiOeClRwahH7eXIsFmpiJL+daucAfypDOcx7MdGLbpe6CdPnEBNCwYZ47Nzxk
         jqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642772; x=1790247572;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0M7opCWPOuxBFEuwAzPAI3fMW+G/LVbMC9tyOg7hDc=;
        b=CfO9rj21Ae/90/zTSYb+IaL6RiOjN5ZQNBwzAS6i/1zHHHfkVKdDHUmAkHrtyWysOb
         kfKYYWlLHJajAhnTC8idnq80A1tJudLXlMXIvV/IzKbaRNk1Smk82yDIpwmIByF6KETn
         KI2HgbWi/+gyiB6/euOYsJaSbETtTw3AIT6ncPJ831a3qtQuXmLY+XGr2cz6PsCBdxqf
         lfZeI+xQy4VtICvWFYnVDh+8n5pHn/5op9wfOEkjbwajC62QWGQq8EORzUe1cD+Bcr8t
         1LD8kh5exTbsZOMQ776h2cr0kXuSPMRLkz5ip7OnXZFoXRMJficFvlDCjl0nxisBeAjA
         vL2w==
X-Gm-Message-State: AFuF++kRgO7xe1TNXJGZbQ0zA4eU4Yi66bOjWk+m7Lzc7ak2X1PqtdVI
	BDBhAdfWBER7tcBD89A1S2SM7ZZjMfQ2CXjLpWbagGo4xTgzgk2Z9mCZ
X-Gm-Gg: AYBFou0a0eRA4TEBTAwMj/050f2sncjg97sTtOQqTe77wpHpLNZZg00ku/V12K4WM9c
	cck7jWMng24YO9Lfajf6nyfJg171BRWR31keT1mPq6b8UYOKlsqzZy22xWbfxFqNx7IVA5GHevw
	8gashU4sh+ffhP5gZyCiTTCzVIBxbRNplHGLdWwftZYKunwvLeU+fTAqVB/KAn296KhF3+UFdwg
	0YdcdK4gsDqOMV2hvZOnMF/QKWCIuMYJL83iX7zJ4O07EubWC3vJJNrrzfGQMi6BRtmijs8DaBw
	scHrIKHtw0S0UpDIqycSFsH5a8W9lYRUNdoBHDsJPjVZSUk4JQbLALM/bEe5ecIkqnOK/ec9Rz9
	NXwIvDXD5aL5+VhlCLa8farVxbpqW9r0BauaLZzS1FwnersmUh9H0t8minI/kbkvrppByJMFPvj
	xRnD1568ikLpPmD4pP2SDpi8Ga/Koe3ZM938HpfCieWBfMw6REesqEdqTvTC21Kr1l7lR8vZvji
	zP9bOVW3ALlasGl1GSjaTuBWTActHqOvAB2kaR9wsEgvfvLyt/P1PkiZ7XRhwsamdiNm0BnIOow
	siFRtMkbsDfGIHWbCuKEekKKZvjcnrNDX6v3yNI=
X-Received: by 2002:a05:600c:4e0a:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49eb73088c2mr72472075e9.14.1789642771777;
        Thu, 17 Sep 2026 03:59:31 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm14454462f8f.9.2026.09.17.03.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 12:59:30 +0200
Message-Id: <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>, "Networking"
 <netdev@vger.kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the bpf tree
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
In-Reply-To: <aqvBPVcN__UX8P85@sirena.org.uk>

+To Eduard

On Thu Sep 17, 2026 at 12:30 PM CEST, Mark Brown wrote:
> Commits
>
>   4499609f99fd5 ("selftests/bpf: Test global subprog callback contexts")
>   3506b9a2f1085 ("bpf: Verify global subprogs in each sleepability contex=
t")
>
> are missing a Signed-off-by from their committers


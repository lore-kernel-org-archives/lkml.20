Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E9529403
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688145; cv=pass; b=sW10Y6zWtRMs4O1htRVDrjx/sSEUteRBWQzeF7Eh9YB+ZHZr9vRkYqPFju+nk/p3cyFA6+zZt0nKlQIU84VIpefaWw0rn5ihIz3D1FSpzOHTbsT+rbOMMkplEeemp8b7lXHbKX/NdZNvVMW99rsOdisYxPRlEliWMbHkoasPTwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688145; c=relaxed/simple;
	bh=9kGGIoKUXsVY33zGMSg04jYAL3JPXU1LBRMzAUAEyQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk47+5YHlyzpNuyvY/2EgU31NwwN51VU7kKpw50zzhjzLCgzfeNMR/e8OvdXHCNRofsOQtEbPuEwlFOPWkonquGmyZ/qxb1D38GlCJOi3orY5nQ5ryiWZm3z9nbAuglfwNxOutcGaeQqeIqtPQ5MDN02h9KVeM2QlLhnLsf0Jv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj/yrugm; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj/yrugm"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso707450eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688143; cv=none;
        d=google.com; s=arc-20260327;
        b=MmzwLW4lQtjJ/5n3ICLx/ItF+qmpjnAiC6Df/97zrZSwe5wrqr0V/GL4eEaCKbnjL9
         lMmd+tkTjZwEL59bCsTUek+NRP8kXwo1m8n8uEAuc/YloKBafbT9pzyPw2VQVTklNahr
         uIBcGOoN8vqykgFkQU9WjCbFGzOhI39XR1Wf5dEe+EVH6yDAkLmtGBzP6vj3F/B9QtUu
         0N8qoraLJzrm6XyGIrC4iavxP5Jv04bSVQwYtAr2mp3L4K1XItBqI/tAjz+1R+tRgtMD
         LjKguJTgxVXVwLTMUTxB/bcn1gX7xHGjSi99yuIwJzOU9ju48oiphbnEXWZEyv/WV/cR
         zUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        fh=VSQlZFC4SvW4EW5l34b7cw7/ndX98+NYPIc5sfHfKTw=;
        b=VC6kO7Rz55Leswqxu3dfmE5W5cE3MgWuIF9L/lLdRMqDRlKdOVbhKfPbAD0Ls924P2
         AnrNe8i3xkB9Dbc9QpMRb1EoQN/tg37nL9bYDMNet7WD2wbkQ6/F9GDPedrCMqeD1lRS
         upddtYJBojImoTgf8sKUQjfYJHF6Hose2u93j+ZpP8a9LHLH9TS20PyiqBf8KZY2QC7C
         9Lv35G7accbjCY/79lXw6qQQGWNbDG+nExpDANe6Yay+hTHxz4dTQcMMV0Mg28+FQSzo
         CXQ1awzccYxl/DMZ0TqxEiJ2Qlx0samdG+GgBkviQnTBhSHsuj8dC5vU/K/LhgmfEocm
         +jHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688143; x=1791292943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=Dj/yrugmmvlu8SkXqgAplzDBIbFAq/IOFm2owZOH5h9s13/b1Of4HJu7VVKDuIZsOz
         Bw+Nwm6Vm3N3f7jhBSndb/5VcFuVdwD/c79+DTlrlMQiK+N8okc7MAUU1erAswQDezFs
         V2MM06VvsMqgFBQHK3FcNBlerYu6PCiJqbUbTYCQS0rrDIoGXPthtYt/k3+JeoE8Q1ii
         g68D2lwSxQTzatjo6khz7cK740umARlZeftyTEPwzCwR3eS1Q6VkPcP7RmcFZDNXqyAh
         U3M+Z0ZbegjVsFyRuInHLjrNBcOP6w+lg8blcNspz3bLSsD7Fc+P5K6dKNuPBVPYjC+b
         5F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688143; x=1791292943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=r4gOrVPHooMplHlS0R/4fgfSKunezqgTJPNWUSSA7uvx+ChVoKYZlJabP7LiMmVJTl
         tgUCURhhCxEoOdb/W/ug9pM9tAUYKbj3bfJdvbwKpg2lxjcPwjY4LfNgGQNUeBD2MvvP
         F3NgUYHTBNJOot5Vb7Smfk2rZ8QPgrw455wzTmDuRz80GpSPwtj8ZbNUeVTcRVXIDofL
         v2hyO3Lx/+GGDYGp4uzEnM58BEN+PZgCqWHO+F0k9r0CBhB7QxWiFPcF/maZEI7UshHp
         ljpQGo/9m7qBQsE/ywOw0wa2yYJzndAQwA0G1LRAlAGFfhr9MXrUfcYqeEtkIlqZL5fF
         JNWw==
X-Forwarded-Encrypted: i=1; AKwUvByJ+LJ/VBKgDX+lMBJaH/+66tQtYA8KQQqe82eKZ9oiNluZuowzkzAqlw1XctVSDcFoe8JSyURicPpnMY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOvMWeoxZm2JfkvNTh4vKNgqG7eQ9r+3lqvcxxZj1mP1X56WP0
	7/T04CF1cHpRu8iwzlqDX3ZB2A/LLqfzDZ0pgdA2OmtQpOQYBWKiNfnuFsx5Z82vefL07o0NqMc
	XByhWjMc0moCNC/TxpijrkGKYP5weRzU=
X-Gm-Gg: AYBFou10zldmbPl55MN6iH9xyTbZGUt+3c74lrss7b6kd+x4JQ+yVXFDyOadQ0lcs1h
	KtwfEBRPxwXxPiEiQCdBBLg5ScFiY6IIOEGZ0sSdMgvc1JpFpnQijct86bHO6Xb0afUwF65epaj
	WtllzYRsCOZx8nEqGOm3o/MTEtIxRLDUd2OgL2T4GbZ6sCrxMXyZc7zwFdn+OenCWJ1SFIH8dBS
	umvY3jJK2axbYWxNg62rmZNDG6HMxC04Cw+3Ux9Zo/z4TLQE+yyqwe1PJhAQgRbqlAj2vDGQI3i
	46xVUEVN3PYTtqDB5czVmJMPb6z/moIxQXbPW4h2XWmq7ZuBQZbIzqlpjixLn6hm7ofJOf8tRl6
	srZ5XugTbCMUooERg9jGYiEHDzcmLjgoZ1ede6r3xOKxhSvHpHut6BnuvOUnJUxSjF95wqiA2r/
	Sm7TBE5fakCWWw1GMM79ISlorwwLO4RpFsLXTLOCyIzO1rggVKRDo=
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id
 5a478bee46e88-343fdea2578mr10273152eec.28.1790688142453; Tue, 29 Sep 2026
 06:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
 <20260925-apple-m3-nvme-v1-2-5e832e2f4aa9@jannau.net> <20260929-debonair-busy-hamster-be2fda@quoll>
In-Reply-To: <20260929-debonair-busy-hamster-be2fda@quoll>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 29 Sep 2026 15:22:09 +0200
X-Gm-Features: AclHuK_jJoonbrdcWTM4pJ6-SA0D9nOYSb3Qq4ribSs7qfnRaIDq9x1ahszR1jY
Message-ID: <CADo9pHg2JyGyOA=_6orXdhDwj7NaKRBciyQMG2w7fQcPm0MNwg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: mailbox: Add Apple M3 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Keith Busch <kbusch@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, 
	linux-nvme@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

https://youtu.be/TPwe53kCJuM

Den tis 29 sep. 2026 kl 10:21 skrev Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 25, 2026 at 10:22:49AM +0200, Janne Grunau wrote:
> > The ASC mailbox on Apple M3, M3 Pro and M3 Max/Ultra is compatible to
> > the mailbox on M1 ("apple,asc-mailbox-v4"). Add their per-SoC
> > compatibles "apple,t8122-asc-mailbox", "apple,t6030-asc-mailbox" and
> > "apple,t6031-asc-mailbox" to its dt-bindings.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>

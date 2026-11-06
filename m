Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948187;
	b=XQbrEV+WSFBZXlv1r+yMxvgFTJU59VV6WBG/oSLboiOnbvUv7QzDEp0g+F149xw0uYlo
	 XTOp7eTvQgaOIS6VlPaLmzZhTqGo4AgHJXIU61U5Kp02VxaTPkCjGLZqPQm5iDMzQ9NXA
	 hvqL5D9wLaTjfRaWWznJNjKU/UI+j11gsomr9LcuKPKnm4S71Y/Knozr7yYq4E0ouqvtn
	 9rwxZ9x9yR8jGkl6yTgh5zQ6G9PPH64TpH7/3Ktwsr21gGd4lyyQw3r7h8DJf+fbKv267
	 gEeoznMfS4MKcTA9CrI9FYk8pVlQ9VpIzCrjHu6IPrzj+bFRucwnx9BW7RRcJiqMTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/RbMC/zbd8a4NB8aOmz0dErr/x+blirSIsIsAf7UL6U=;
	b=UTqbUKcCuaumRxQ9deK1JpY/Al3h4f0BKXzuelXOav67z32dOTjG7uPL3OyyO/IHtgW5
	 mGzFTM6vKS7jxvCX9qCVvzfp21m+0OCwyB2SEPOESnw0EnPKsRu8DABOaKCt7mIuqPhwC
	 iu85D4HfkTRDQ/Y4cYxVG52pTDytk4TyecDy4xoDs+9AdVAslRIFA9FdxaZLc5HMOedRi
	 o/WXOmVexkv5TYIPZnmyMOYqs+ELmsXWkOYLaWYBfE7Vw7ujjsDgN8ghFa14pszqEqUFk
	 lr1hKDP2hhvsWafGk/5AyvpVtuhgn0RWa8MArSv1JyoPXAnJmdn7pVA/AcSIQW7DkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZCJyYuy;
	arc=none smtp.remote-ip=209.85.214.194
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEBE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZCJyYuy
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2e9ae391a05so2047725ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793948187; x=1794552987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/RbMC/zbd8a4NB8aOmz0dErr/x+blirSIsIsAf7UL6U=;
        b=IZCJyYuy0zkv7PU3oOnTFueCF7jtKKjd8XuSGWI6NuPApPzbm3KQ+pWuWd4pt3QU/M
         mC/ve/a73EHjs2xFUgnI/rXBFfVUhvTyfZlp8ijHBmWamPQr50cO7geY67pwklfGxryk
         ts+YLNpTutUGC3aEECdUkX6LsicpMVLeSQYbvQRMN0h0+Js3+RDblz6PyfZ25Vc4Anp7
         sjADYFWLu8wOWa2otSKd/HBH5j3I08eB8lvcL9p1a8mTpXL5OW2oc4xIeBZeakEMiaAd
         FTGuN17FqOwlS9EBFujAwjj7IUvKd4XPvYboS4ucjrH3jvAs2xV5vbCUEbcvhmAg2sDi
         2Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948187; x=1794552987;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbMC/zbd8a4NB8aOmz0dErr/x+blirSIsIsAf7UL6U=;
        b=sL0f8BZDYbEFbfmJESWUK/OS6L49qN62wYUAWU37VD69uyl/5HUpPeVDnCNPlJEySJ
         v5K2pVJRLLH27CmpmNjAt4x4AIUpGtMnc4wncZQb2NpvvkQ/miczGharBX9EmyYIuWgz
         8IkzpKOGXJcKzq9VBM76a8KBZgzisnperCCti0WOozG92nXRTY7n4jsYavkpm37q+e0m
         bBuBmNW1CIhKwqrqoTyBRDXJ08W53N4apgm++xsTbrYhnNlbhVSqvD4wj3rSKg/7hfjb
         GAB3Uq+NinZgFMUHO3Zl8ycBE7ixVA5n69/CKS9gdXNazOpokKpjCFIJNQkMFTXQ9JR0
         Pv4Q==
X-Forwarded-Encrypted: i=1; AL+hErGWQFvFdVDn4O2guPFFmRG/2Hm+iO8jbL36BC22lC7IJo1DuTi6te0bSq/sVSoOu5PZUcnmKfucYN4ecsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E4W0USA1FhBH/OORULEjnIJEc3HrQV6FK+1h1rMgX7bz9mzkZ
	Cazn5NHk5hGCyLc7sukR2Yf5CBZaiYldqSuBmYY+2FuBnXPMae+5WW0z
X-Gm-Gg: AYBFou3QlmOU3QKjFls5oamP8gK8tgBqewzMmCQMlhXmqPUYtnhRlScYDIyhdMsbL46
	h7BdJkJ4Od7JbMuZdr9nBWAAORX7w1iLFJ9ZPTRQBNyxNcGVO6jhpzD0jbcpnbetzddYNXScgUX
	d6p8xvAHCKgpSyESrxA4dRJ7Nww7TcO3VY0gWI/H4ke8xG3gSvXRRcZDZAMufw9X00YpqvA0B5K
	X+OsTemGWwYbL4ZyZ3r/yhlsINsWuZMc02yaDSB/3iIA0UmdQRDguurDDrCdfGSOGNQi/4ncHig
	viiql3NFL7txV+HPGdI6Tk5ovCtNcyhJTQ2b4TBQnkEGAnqMJSwCu9VSVdH90dOhLcwnxDmO5l9
	PQlNSvSau8mmpaKqedVyj4m4tXaBwUFLXTDOUcyTF7ueJZbCLm1mOloW3bHBAQnhCz5sRmnWzrH
	5QzUrlBcdCPnTXVkbKEMqQcbFQcuk+2u5x+jN01RfhM3pCKRZboVpjRzVUo3Nva673EBeG8Ek4z
	6h564TpxXPlqdH3MGElvIG/BcbWUIexXj7HbeIDO3PimBUQi05GacQTsmz8LCTaMzQPMb8ubUq0
	A+9MR2a5zJEBY9a74/pqAtwXeB4ITOI1/XrShpYZDJmTgUIdfw==
X-Received: by 2002:a17:903:3888:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2ed244dd595mr38676575ad.30.1793948186681;
        Thu, 05 Nov 2026 22:56:26 -0800 (PST)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.143.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528760sm2338635ad.8.2026.11.05.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:56:24 -0800 (PST)
From: Boyan Liu <yymhvert@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Hangbin Liu <liuhangbin@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+98d7de09cd94fec5@bugs.sh,
	co+cdeaa2edb6897680@bugs.sh
Subject: Re: [PATCH net v3] seg6: Fix unset mac header in SRv6 End.DT VRF decapsulation
Date: Fri,  6 Nov 2026 14:56:07 +0800
Message-ID: <20261106065607.3372-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024015811.a995b7cab417cac2f41689de@uniroma2.it>
References: <20261021024738.17266-1-yymhvert@gmail.com> <20261024015811.a995b7cab417cac2f41689de@uniroma2.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrea,

It has been about two weeks since you mentioned that you were
looking into the NFQUEUE case.

My understanding is that NFQUEUE is the remaining open question
for v3. Did you get a chance to check it? Should I prepare a v4
to address that case, or is the current approach acceptable?

Thanks,
Boyan

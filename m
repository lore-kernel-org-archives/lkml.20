Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0482931EE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032997; cv=none; b=X5/vxgzsrhM3pvFguTGry0jlGLkO3oRx6xXOtUOWCzXAR+KOO/oB/JjW/LkVd6zLaHw3K/a8jRZT5/CyBmWgyhbsKxsuUIShXWnJgdgWhDe2pWVmrTS4qkjgQtG6n9oDZmPFkcujJ5pB8VVeTYHbGOEiZX34NaHqBvh/Zz5qayI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032997; c=relaxed/simple;
	bh=Ptf6A1n3o14kQDPc7izKJkBkbCPXmLPjKGEOV3e56Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V14xWAvjTEIQOs65aqEDNEZcx9l9LJqbv7qy3ufbOUkt6Q7L27YUnf22VOkGGihkOjZur+deTRB9IR2EbjZdAVkIdd+W0xwwrpKNgXsXD4kTggoXI4v8ZVK+2myWD1wUH3cubnWQ1FpSZ5xbiu5QOOTkbsDbraJGbmhSzZukBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLVbwuQ1; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLVbwuQ1"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b14db40daso105871eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791032993; x=1791637793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/KkCnT8DcfgAjdsj7WLPc/noK/t0kZqJiLQcWJITrQ=;
        b=jLVbwuQ1Sr0udwM4VC/k3Lbun+nz2kNekqxtH3XP9n19oIezzCNb3l/ZPhKPAPFWuB
         uKtfr1qvj1mN3p2OEeIyPja0drFT+bxwcmQ1HhtFYXHf9z0UfmMyET9i3nHqkiiWrP8r
         7mnnIKRiX7MOSv6HAQFxkNemMhpDjXbKxPQGX4jLGVRXRDkU/D3Z/Y0ekk4VfGgWK1db
         FztfSZvs/4GN+95ClaawAP0cBV7bT+1rkBHa/HHtSj94dBwlurc1Ahlz/XLwYt5FKdRO
         T4NI1cZD0yT+JNURG4ddhrLYVVcF+dEzN6mrTXcvfAljE7XJAvy/2rV7QfwIZ3jnY7qn
         bx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791032993; x=1791637793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/KkCnT8DcfgAjdsj7WLPc/noK/t0kZqJiLQcWJITrQ=;
        b=Jlj3Z7R9VSW9y5NiONmotgKUm8GBRMW5FWBpDDIa3sXwK2CGb1C0sIbAP44DvG6P7u
         PXYcdSvcWwE/WvTR7s1wSqN2WQFON+gxYgn6pMr6xueungzG9u/nHW54jrhzizz9dopa
         ku8nE/t5FDLliZjlumjXaMNiLL1ft3w7olQUx4AQArV6CQJvqllBYeN/rIPumSqcc6OG
         RKrv8Mri8+GHShKOcdavPwX8pEU9Z/0SLx9RmnO+DGRVhY2vZrcrwddy4jEzzFRXjJRK
         D7EFlpxOuT5Hod6EQGisRA7/doBMUk81niaqiuxFLutFhXbogUdQAmz57NFtWVtMDVHh
         XK7A==
X-Gm-Message-State: AFuF++mkUcH02vvBaWBKI+pPOac1XRjQ45dFZdhGcGtIXgPKNKLYEdV3
	Z41RSdPMuxZOd0i9bT7Y46PHpRnu2g2fCmvDTM/tRE5oJLH9uoCNixmf
X-Gm-Gg: AYBFou1y3x7re01GbUrdUXL/w+edT852Pp1i8/EF/pN5mQjuGoPLgZoOsce0l1u5q1V
	R0blGRP2AFAM3oLXg0uIdTzXjdc+oBkVEl/nnms8K21I6L/cX69YYdVJmywtbhGZF9ohO1FtfBZ
	bCYwvo2fgnilgpSGdFWecJAcSlDquv1pX8sENdp8De+b3NQOEJpdULiWszcItM5gK2ui86iB84C
	x8mZNDmQJr/xjoB/rWhTf0ddWkkTfFzuLqgucG76o/PmMuPXnH5iU59qPbOD7aDQUxtKzmPeLsg
	vj9Id8n5z+lkmfuh+OmTi1zyRjmI+goT4QkRPcL39FxhWBYD8B4/eIzwdeUmsdjCZoTpS6ourF4
	tcDtHFjm6PSUjUmt7d2Tcu/xFrQWhBvYG/aq8bwL2v3Sm7CKEwv4KNwVLiueNrnXrG444r9CDl0
	FkRM+GVBZ7WswizEuYVZ4cE9SQFzlDSbg2byXp4qgQEPGpN4L/PQXIm30MrrqJokn8GuVPAjUom
	IFn5SS8heRreSN1FLk=
X-Received: by 2002:a05:7022:1203:b0:14e:4317:597b with SMTP id a92af1059eb24-14f5bef5549mr6059964c88.18.1791032993088;
        Sat, 03 Oct 2026 06:09:53 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm5769868c88.3.2026.10.03.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 06:09:52 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@suse.de
Subject: Re: [PATCH] nvme: auth: validate DHCHAP secret before stopping authentication
Date: Sat,  3 Oct 2026 13:09:12 +0000
Message-ID: <20261003130912.2410-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
References: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hannes,

Yes, I agree that stopping the currently running authentication when the admin requests a new one is intentional.

The issue I was pointing out is slightly different: if the new key is invalid, we never actually get to the point where the new authentication can be started again. "nvme_auth_stop()" has already stopped the existing authentication, and the parser returns an error before the restart path is reached.

So the question is whether writing an invalid replacement key should leave the previous authentication stopped, or whether the key should first be parsed/validated and only then replace the existing authentication state.

If the intended semantics are that an invalid key write should not disturb an already running authentication, then moving the validation before "nvme_auth_stop()" would make the operation effectively transactional:

validate new key
    -> error: leave existing authentication unchanged
    -> success: stop old authentication and start with new key

If, however, the intended semantics are that any attempted replacement stops the existing authentication even when the replacement is invalid, then I agree that the current behaviour is intentional and the patch doesn't fix a bug.

My concern was specifically the former behaviour, rather than "nvme_auth_stop()" itself.

Cheers,
Sreeraj

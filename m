Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514528;
	b=lhFeilViCLdyBpbRs3qex9hM26SKifniYu/VhhlvXnQadmATLScg/QE/S5K0BAqxw5Zv
	 M4cIZyYGsmHiL8CKTkTaTJI2G/e42xlhmtgf7vxs5mzkaGhYG+QbeBczzOiCZ7a3YBnrW
	 JdojBE2ptTM/G/c6BIp5KK0Wg53/gK2vlf7rbs2GY48XqNXxj7MmjGnbMjBtWCDGN3w+M
	 trvOmH+0yyPGfO1Dm9lW9Hmf6etsB6xsn64mxvLtRSzxDbanyjMjh2X6eEJaROzYkb4Gx
	 sah64fDPMTRwrAdwm465B7HhYHPwbWlm+MKOhItd3pCrA9nAlBrH+bDAn6KlPwtifhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cryEu9tHgT27PfW4SdIWtKNvZjOxn3pb1ryVgxYgaKE=;
	b=SFWuoc2JDR922hR4S7G6o0OMn4+cS6zI7HsZx4Nrdzv/4G96+RKXxGAmdR/9fF9y87ob
	 eTrYFYK43LBiPzIVYsLKUdGrKdgJxIqBejcDJ26507tu7wEYoDqp2og6KX9P7hdJI73u4
	 VMZDFUm7THU7BXSZwiN3gTEqVx42d7NozfQGHDZunmmdqpBrI9QpQcSqxj3xVfWMIdxRn
	 wu/OMqlRKp3v5gUWILU6HiVDNFrK6xnIiEa5jcILHybpu8OxtbssQdmSn/NrNT6TJzaWl
	 1CynC4d7aFXBdzcg8G+9i48AicdBlRy7TGqE1QX+7banD8A5PaK6GmMNlP77K9z1GAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0lwaixZ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0lwaixZ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a1947498bso359248eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793514527; x=1794119327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cryEu9tHgT27PfW4SdIWtKNvZjOxn3pb1ryVgxYgaKE=;
        b=L0lwaixZiwm0CDnMcBAYO+o0aukysflgoVSzeVmDuozuKypw72PdUZKRKdFe1f0I8t
         CGD5zF0o6Xqju+zKLAerHCfnNxqBgFzFbbVl7neBfDc8RFXcz2xPH/8mbUw2LnNjbN2q
         Z752voQkvJF3SLcua+YJKnJkIy4AXguJ9vhKeTTBtZsAiqQVmUv9MOSzigGlvfpQmpt/
         ZmYd14IoazLSrpRfjnxUILGLYs83Y1jX+lFzEz0j//S0qz+zeQfP84aWl/W+7IgXOD/1
         dKsm9vyCmHTXdP7VObXzNx4WYQUJ6jww/b/7TQLBuoMwfBu6RIBZa4dGfVKc12V7O8xL
         bqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514527; x=1794119327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cryEu9tHgT27PfW4SdIWtKNvZjOxn3pb1ryVgxYgaKE=;
        b=DENRlfai+hG3Z9cMpAAwMH8G3p8wi2o6m4VrY/gaXqz+rRRmIjcii86r5FH+zj+RLx
         fHXG531/43xA5brCk74au5ZRqm+Mgj6A+JtSih+IC2IHn4ao3f07dk8PEJfJTslkPqaD
         ATw0p+q5dybdLmmseYmKKdoCcu+Hv86nvsgE7aJv3CBgZIeffsnY4IPwha4sdd7nEDaw
         B5CZKToeqPEi8Q/+NA2w7gt4t9xFVhvcaOo9Pzbq4Y44za9ThyYWRCQg32gWijZEdlDC
         15Cuo37bHnNCp0rPlXbypLxaidDJIi4NQC84nPCtXRUpgX/TvWaL3A4wRTrsZ21Xh1W2
         RiRg==
X-Forwarded-Encrypted: i=1; AKwUvBwwu5tNAFG7Sk6tNo1hjAIjeAewxgOutwnqB+wFKDVrtoaSOMY/01ykcQZVWWTBY8KA9Oktg9RprVUUVgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MsCw8gYt60HRs00SshlCfYspRGaDTH63iAP2nUy7MJQly0Dci
	BpKKRhdf8xM/oBXa2rqp5g5YhP6BRPhwcXNa8fZ+CkCJXFA7HPvB6obL
X-Gm-Gg: AYBFou0yvbifxsHtWNhU1VGhjmEDLOxZkiNDu6hbTINLidwgz5tfeRLCJZyVfqdphaI
	kWNUyndFHNv/ZuLsOvHEYBezHxl04Y6OgNBfh22t20VjxD4n/uIrf2Rwgr57e5vH61hpMALwMii
	SHj/YipFwRItFnSkJrU/46n7bEbt60PyE3HLfj0MP4IJRK4uh4nEuAv9GOZiaIEWeX4VSxR7lt9
	feIWuu8/0+KIP/0NljNzTBfGOpFfIi+5erMRJj4ItFUpLIVJ7emhWOrJxOYKceaAGPz+CsFDkiw
	er73BewKQYaj5Amlhbz6qKWqeH3C0BFUofh6v0X8M96W2qVJN1UTGTfZM1lr5/mQvlE0m4acsbS
	5q4DyO0TbLPREufqxmwnh40Uo2+2HZ2YwPvlAoofexPo8sDYL1wpawdqjKwlwQLoayxrcocI2Ku
	vi6VSeUCFoce9/cf3aGUSExIiwb1KDZl3Blw+2WzJHyUyN7cNYI5o1cFC+fptgZfB2M58jeAGRb
	RiSIjxV9JEq5raF7g0bx4rJlVENLRjPY3QDq6w0KMwQ12zcARmpJKEGZnR02ePDszIh8ewT68Ro
	o/fiZVGy7+Pbt3JXgRbZF94XN509ziCDH8tkylwO8gfIIIU0nndeBbjl4ocjMMr37ruI
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr7272857eec.2.1793514526725;
        Sat, 31 Oct 2026 23:28:46 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm25828235eec.20.2026.10.31.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:28:45 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: reject refs=0 subvolume without DEAD in SUBVOL_SYNC_WAIT
Date: Sat, 31 Oct 2026 23:28:39 -0700
Message-Id: <20261101062839.1747239-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dd97efe9-91ec-495b-b698-acff1447421c@gmx.com>
References: <20261025180258.349175-1-teel4res@gmail.com> <dd97efe9-91ec-495b-b698-acff1447421c@gmx.com>
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

Hi Qu,

Thanks for pointing out the failed-delete path. v2 is here:
https://lore.kernel.org/linux-btrfs/20261101062539.1744605-1-teel4res@gmail.com/

Before waiting for a deleted subvolume, it now returns -EROFS if the
filesystem is read-only. The check runs on every iteration, so it also
covers a filesystem that becomes read-only during the wait. On a
writable filesystem, a zero-reference root without DEAD returns
-EUCLEAN, with unlikely(). Subvolumes that were not deleted or do not
exist still return -EEXIST and -ENOENT.

Thanks,
Cheng Yongkang

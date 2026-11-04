Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758873;
	b=IFL6VTzn5li0yWXwJJXoRVLcanOi/KggdqdfbrYnSsVzu+nZiW7lpNf4OhZKe+J6bpjK
	 UpFuV2BKqKoCKaewvnZNcLSRv6jnHp03e4/pWMQ4lhzy2HUGKlWZd8KndCCdKjdRr99MV
	 JuaatDHhscaeX6tnbwKSvprPUdmpSDzOb9NCCM/n0qYeVeoRs2SlgnBS9bW6FD/GnZzX0
	 paaM3sLQzTljszF2hnDT/UyY8S0/S/Z9rSjarBQkVwQp2Wa+FVwGmfVOe2bO7d6nBPUJY
	 6A66Ro/9I8fr0bmOrR50CYntUsHy3/Lm4WC9W22Zxt0t80RCUf7QJ+LzeaDLbnRPBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zZTUjENcLwaNaxc7QvvATziTGbi5drNO90koPPjECGM=;
	b=OSOyq79y/9TUoIE/r8QpJTv8v/rPk8qpAjFmDQ3BdyaaoyoQiniDoTM1E4uoQQcAS+6U
	 es2ZEi8k7I1HlglPFcouQKKWwVFuAf1oMvZYYDb/pTcn3SublBk7RyFiOC5dGVJrNV8/w
	 Wct7dAbqlHWztByEh0aoMUPdCGeyFSKGH3hUW1FQ/Y4/2fIhW7dmNbmnhmLxTUV5V8t9T
	 vE0iruAtio9qIo4pGzI7DQLQdZPQ0bonSSA/xuq1LPHIPDouikCajybVRJsQA2kY6ReAW
	 BCWSJKA8cGJVEcS6LYCttOxf1cxc9Ma5KVXnMO8z1NL/qCD5+r1EGfZgqUZy4qYg/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJEZanc6;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F9606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJEZanc6
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso370029c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758872; x=1794363672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZTUjENcLwaNaxc7QvvATziTGbi5drNO90koPPjECGM=;
        b=DJEZanc6zshUJbakA4ha6enlqCMX2HUKDZDDkOzb7dNOQo4du6cgyboLh3+DMEQiYH
         Tt9z25oCaBB1vTfcVHxeopv/W5MMVwzY58sMZRl3rYBNFe1wucQSBWsPxzAIX6IBC+w7
         FbwyiekbZUxayUaKyPPlXDEK2XecjysJhxzu3k/6S2KZD13RcSFSwE50qnQf9WMLVbaS
         0UXW7MVxlOUPy9uNY0q15iwYYY+13tMoFFLAay9dl/r7S/DPBM+FFsbm3cpSAzsUMlSH
         4zFcpYXLQqsK/DfbmDgGEUATDj4iZGNe5qlVYvoAJzS3EQ7B5YdA4FZrPg5yHKjkS+kI
         VVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758872; x=1794363672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZTUjENcLwaNaxc7QvvATziTGbi5drNO90koPPjECGM=;
        b=gltAWg8FIr1PzDC2P6AzTdp8iSD04jq5uY91WaywZtOGI0D2qHMU6tMvNvOQCLfLeo
         YJWq+NBJLx7abwyG7J+d/1wR1UP+P4j9bt7stFAsXpxlC4Q9M+wAygkK1ElxoY4NhOie
         2lHsZiMqym5d7d9flOPsOtJ7M8nJsPizRhpsn+wIFWTtQvTkXWI6aa2wE6WRCeepjGXk
         gN+NftCmmP99Wmilr2dSZX9mvdeCyOYyevEu2vIdQGJSp1sjbBX9qnaHfRLuvGVIfqXF
         45p0TOxZTo87X8J9VxLTYKHc84vOGE1q8cNxQhhA+yUKpwI1aLRII6ryxACbIAiGv550
         9PkA==
X-Forwarded-Encrypted: i=1; AKwUvBylAN9og4J7ZG5jefth/oZSJzB9nyOb1qiYxSfMKalwhuIVVlyCWY/Qpl6gxd9Sr/MMGfgC72jIe+71xi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M99t4eDBH3q6urSz1um0tOtLOBoln5l7TuGQdRH/GeSkFpSgB
	R5M74n9nmewss3XlL5hYjF34BY4VhP0rr8u4msEpoDF+3pHkfBsyLrUt
X-Gm-Gg: AYBFou2qp+NTNepPCNAZT5bomZ8V81IVOS+2gXBTLjlsQ2PWNz9f3d/U6LA7OplE05Z
	5A//RlBCaQe9QJK3BUY4Km7S2qhpms+ZkbY48GtPyDg/c1nN36h+/8nxn4NlNYR5zYxVDc7eINM
	95stwENiTINUGek4s7jUAI5G187km9tZaQkknBuwBRB+qtNhffhoFeuezEYtQxNeSrA1R/aTtYh
	Ok1afuOp1yfSf9AJ5PyCbcyYmkZOodCrJeviGx/Zz5XxqXgPWdO290ntQCn4CFzBeWHtAjLxXp4
	iNw2y0hH5mUmqhXnheonJRx8AfjcMKFJFT84hauspvbdYayRpr6qJ2CW+4v5soCQ7ZlSBv1x2Cl
	p6wtNAFh707dBfFV3d8FIexG5RZMoV2DJOaonboaRQwYK7vjSE2kKZkpo8RqdNgIc0c7cTN9mgU
	euPcXUTrXyraXQgW4x7KTpI6HQWQwfngFcFT1/+mW2j4VgZNrY5fts1ujkcromQzPxtMoVBeiiG
	grM1nZojWagTCY5Jx68S/3Z/iwNFKKHsWjoNuoQb77X2QFkt7FyTcJonaWM7wLVI5V+Qp+Q4KAl
	11bHVnOwh7UznWTBcoVWKmU1DMsT1UUht4pPU1x6shBlx8wwRtpxezckCxdPcwC78Q==
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr21183680c88.41.1793758872002;
        Tue, 03 Nov 2026 18:21:12 -0800 (PST)
Received: from localhost.localdomain ([61.255.248.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2723575eec.4.2026.11.03.18.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:21:11 -0800 (PST)
From: Song jeonghak <thdwjdgkr123@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>,
	Shardul Bankar <shardul.b@mpiricsoftware.com>,
	Edward Adam Davis <eadavis@qq.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] hfsplus: free failed b-tree nodes in hfs_bnode_put()
Date: Wed,  4 Nov 2026 11:18:42 +0900
Message-ID: <20261104021842.18650-1-thdwjdgkr123@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c05f958a83de97e38c2e54bb67ba3478ffd471e1.camel@dubeyko.com>
References: <c05f958a83de97e38c2e54bb67ba3478ffd471e1.camel@dubeyko.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

> I've accepted this patchset [1] recently with some modifications on my
> side. I assume that it has fixed the issue already. Am I wrong?

You are right, it fixes the issue. I missed that patchset: it was not
sent to syzbot, so it is not listed on the syzbot page, and that was
where I looked for earlier fixes. Sorry for the noise.

To be sure, I applied ed8b389cf5e1 ("hfsplus: fix B-tree node leak on
hfs_btree_open() error path") from your for-next branch on top of
next-20261023 and ran the syzbot C reproducer in QEMU (x86_64, kmemleak):

  next-20261023:               leak reported in 1 of 1 runs
  next-20261023 + ed8b389cf5e1: no leak in 3 of 3 runs, two of which
                               ran with slub_debug=FZPU

Please drop my patch.

That commit has no Reported-by or Closes tag, so syzbot will keep this
report open. If you can still amend it, could you add these?

  Reported-by: syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
  Closes: https://syzkaller.appspot.com/bug?extid=98547b0428b6a6a3467c

Otherwise I can send a "#syz fix:" command once the commit is in
linux-next.

Tested-by: Song jeonghak <thdwjdgkr123@gmail.com>

Regards,
Song jeonghak

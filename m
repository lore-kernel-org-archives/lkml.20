Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874348;
	b=3Y3OoAIIYvvnveeenHj1FbvSPIHlQefHH/kSPFhK4f1ATXtCDv+GAOJ4RQPN8ycx6oia
	 FNvg86HI2NPwc2kUcb6A+3q6pbDs0ix6i9TGsYsxFcp1a71+t//iM7IeOnJpumVVRE0xH
	 mooEUZCK2phx3pN4WVR1kdaBx6sLDMDoRdZP96CIMav5cnb01EaClORd7F12dlUqeB9Ap
	 I4zfh5NvzEueM0z4mBqYYqNf9dr4dHkpX+wExuZpeph6S6h8GQeTH1tUkvPWrqlCSc2ip
	 VnxyedX1FRh0CJl+DVXWEQqSJDr2yL2cndkHr3tdAZi+n8Hi72JntF2C5vD4+zbVz6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=;
	b=dTHwXXMaZiryodrXtcd81J8veyl+vRfzsOxMVkaSAbg1UXwIktXghtPKxiok3qrHDxSt
	 3F7wxhZ6kimavBIgDNDLuceol1V8V2tVQ2UGOLLGiAAXoOF6mgHEuCfDnYc30R9gk08p6
	 i1djmlA11LBKpD2SC9bhQAzwDbcu61h5X7f6cuDJH8ZIu3yihtrunrxyns9ed9Lpz00MU
	 Ox6V0nlL1Sftz/Jp7B4VJds6kf7CPJW+SfMZzqDsKaP0g665kvMuuopuc1VojPqPXsX5/
	 P4uWafyhT5FpP4WDTVgagziRTZJm3StFQcIQaNvHUAazOR/xCwF+BQDdRis04Ytt6bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Gg25pHSS;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF08606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Gg25pHSS
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed2b4348fcso1596625ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793874347; x=1794479147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=;
        b=Gg25pHSSDudyY139JVOUsD69eHT7HHezYXjUrUY32x3lKhC8vM78K5hc5RX/Ag6rcL
         Re+BKi+m8a/yoeNc9zo1St5mobFD7sWIi5/iAlD/h5ZaW+fZX+KRMf1Ma7wjQFb0zWyi
         pedUerNElELODu5cAE3jmk/1bg7vr/1GINuFSx6v4DwVBOB/L4IHa3gVxS/I3wrhWzTk
         VoETcKad+y0WNDzTLgy4iJihXafFnnyX4Rz4XXfpSe/qzIcoQJJM4NZZk0LU9qevkiNW
         BAX/78ieS42amsLSPCXVHshWFdvNYX/feNL/E+HOVLOV1DzrPZ/nOEGH9Yvw0vbAOiO5
         QRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874347; x=1794479147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=;
        b=NIk9Kac+cnBLC353DBSL+IDozoI2+T7fEfs6xt3rjy+BaeLa91g6Iwpc9Ryb08sUxj
         rRkfIHZgNCEI/czsKb6vAx0espQ56RoeNzwhBAKj4jCRSJnnJXioe8UXfGsCgzG9Cv01
         t+7tg4/f0kgbsD341F+jY8DVXGgt62z98fAUaezD/Mmcj37Bwk0OCjixCZBZTEvPe0wX
         TVwTnfj55KJF0Sb0AbOvvItPTIWTCL9jysSp48CocDrUOUM7x+a68o3sLTFGzR4ozXUm
         PeQ70rkVYZBwwUWHTMeJY66TK6XLbdHZxb+pz5/P6YvmzwNCgejA4nUDsM50+5nQmgIK
         EmKA==
X-Forwarded-Encrypted: i=1; AKwUvByggoi3KtAoxzJq3aHW7xK39kwg8XcKnujMmbjHs4Et9zCJk4KoG6DVef/8Uu8UbQKjpg9xjDUyGtvPvSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pp9pUddOz7LVJ6+o/ckRWb2I8Dh8aIL20l9CJ7Bvy3wsZMoPS
	eNX5aIJObiKfcZpGURIB7BGf5U9uB3S13CupINBsh9LOL+V/XFy7xg6j+EfjZD+FMQ==
X-Gm-Gg: AYBFou01U1V2QM/vmWo7dh3LgSNP0gKhoZnVno+re7ZI+wUUCPhCgQw11xCJZxRfAjC
	fORk9jq8Kgxmn9kVvg5S64AGNFzBlbMngrm4awIIdoDsJwNnnh3YM39h1kDIvcuegId4S4ZXULe
	14etMx5qUp4dLPe3VeESqcpu9IAm0zRiOiyOs+96/h5/NPPLCnPJ1cxmj6J/v0iE49MQs826bVv
	W8VtTzMtdV0A8u91vBGIcj6oh6wWRHVGCp3rh4QnfnFxRALXK2InK8bqYOIMCIwI3m+xkucPwIM
	a7Yl69Q11peoNsvh/SBXRr3yk3iFEF2wcL9jL46kLmIpMyBLpnlprrO1EdgTDhaL/nmCTYalMoI
	5A9pj+roPggySXLwWYhr/Cj0vs5tqWAmkv9aROU5aahxioCgs2GgMeEVJaV9u/j1GZyRi64fcLQ
	lIAPCVnSNlQbe37OW0yPaibqE2byJ8tDhetAzxTgIBpSFV+riKCn/16Q6feyJULdEsMb3N4ZzLo
	oPJvCSvB7ttYhDjijaVg9rYLR4cS+UmoHRmEHwDDt866djyVUyhwUOG25lJ6MnM2GpaZ2OTZLyT
	K5lQqAwscDOlKRo+z5va1g8zIV7uxvRClp2YAi8iiYJG40V8I/U4BJyws8D4gnSoK1RXA6J0CLX
	gn1EOz10/8fL5SXlxMIk=
X-Received: by 2002:a17:902:dace:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eb364835bdmr184698585ad.53.1793874346953;
        Thu, 05 Nov 2026 02:25:46 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127cbfsm16133795ad.50.2026.11.05.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:25:46 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Thu,  5 Nov 2026 17:25:40 +0700
Message-ID: <20261105102540.2273912-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179387332308.488856.2315265262072517836@kernel.org>
References: <20261104052504.1886335-1-jjc@jclark.com> <179387332308.488856.2315265262072517836@kernel.org>
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

On Thu, 05 Nov 2026 10:08:43 +0000, netdev-bot+sashiko@kernel.org wrote:
> The commit message says:
>
>     Only the PTP_EXTTS_REQUEST ioctl still works.
>
> That suggests v1 behaviour is unchanged. Could the commit message
> describe the v1 change explicitly, since the patch is tagged for stable?

Sashiko made the same point on the equivalent am65-cpts fix, which was
applied unchanged as e3aaeebbef56. My reply there applies here too:

https://lore.kernel.org/all/20261022035226.1388675-1-jjc@jclark.com/

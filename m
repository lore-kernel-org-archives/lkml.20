Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853245;
	b=fIYVEwUnXg9nY45IBI8UukcX1usa2OxkxyRnZVEp8h2V1qLInN9dm+CNwXHnYSd8AyWS
	 /Owx3CSlCEJKSMm6DGOa9S8ESpk9tQs4JU7Q9Vk57WxRFMg1xmSdqWAzDfbYSsAZFAjBO
	 1/50sFRxYPkyN/1/U5soGinnN0WYIwM1aNgLghMc28N1Ne3+ruJpngKFrS03DMW0sj9fs
	 E6hOeHw5wpak9MTRA2RGNiXqFvj0TnTk9kSjVy7ZRYmkwSonGZMQvxmHKnfSOJjLPgOiC
	 5DR6yDSDRiB8msI2EvaK6DyxeTVKN9ENbDPavRO4a5bMD596au59nOJD6n9PbKTZQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
	b=41zXBwLNnVIzmP5Wr2MNLoUiK6xwodrxAwFPI9vuEI9senPxVTQLnlzHhkbs02VvIIzX
	 0JS+UiOfRJG7ngckhJfbVAuHnWJH7uuj7H8Inpjc4V7S3+tXM9H77blBI82XiUndYx35W
	 nkAzBAzLVjvh2+kDurpFYQ7ZJ8zsDNS35A3J6XoTZ6C+ZLgNzVkcBCxpxbISzV4c5bBfT
	 OrP9qEIwF42ist5htOer9O7EffvTzvnSbF9z0eJibU6uQ1LfgqzSfezBXAV2uhO1FUkc1
	 llcZOcMp2hF+tPI5Fo+FFu/xfbDE5/Qi/wvlqOpyx8qiRG4q49tHwHsWSuBL6LTgQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbE+QY5R;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40844606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40844606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbE+QY5R
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1496389b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853244; x=1795458044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=PbE+QY5R3gAv+sYo3vO4FqrcWA9jOXrUvOcbmg9EYAQynHF4FO7hCLYUhuIvMqadF8
         n2g8wQW9PGrmSRIqRKSlWRCwU9OoiZ1WFo++fTlqbVNUvLJwEwx1K6Ec3T58rSnd6LhS
         TWG9QtNKzuv2Rd9E/lbY/BxvhPvaYEWA9eFYiNTguVtNeSVYuG8I7Rn0ZNYJWGjKvpWN
         ksZEDD+cE+0kEK8U9PIS7UMsN1O/fQUvVA3MfWAUsOwn0eX87opkU3vbGgpOjuo9Gs8b
         DxH8zh84SZrnFgeon4dUM4JOVmi/xnOFfYLml5SK/qrSvStAG6rqhgK+X4bc3rHdK+7A
         jFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853244; x=1795458044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=XOThkxrDEsP0yWHjILWZrRVeq7hq8ujS83dPNdSNhIAyS6t/uE/i9waHzA7iMsRouZ
         M6cl/0tf/0XivPRymjbTq1xshGhfIBEnVoZYPAmpTWgHsRKNzGOgy8JvelRqsv/MrZfq
         pVk74febLpe88jNfnln1rAo+tIpQh11hbd4PnIT/UgRzjiCgh1ctSHWD8JqIBg0dyJqF
         P7to9vx2fj3hcrc8uMaLnZQKiNYeSWCoxN7y7Ev0+RLTBZS2OCoejRRQxu+ImPLRlrmY
         cIb0b+AopX0QSSz+ZD2bJk0hoYmWzaL2CpZqfZCRlNRcV41SrWjWJItWG+lgUrOFyxmk
         hH+g==
X-Forwarded-Encrypted: i=1; AL+hErGQ4uKgzkpkAUzZb3pgU1EKRkA7JSERhwmuFOZWM5vFzazzTat9ME8+PPMoiNiblUwLpnlBpBF3tvE3IXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C64E5f9m6tJzwhkNZITbGHHFVSZBCtgHiXhq9EB3o98NxKc84
	tXkaIaICA7OEDGmaCCQZNXx2/LLlCoNb1Lv0npmyF9f3cSL6Vd5xjh3V
X-Gm-Gg: AZFdTZfhRn4VWgpwBbv/6wKqITBXJpa0HZmEHlsEuDYrBNhekvy2sMzquwijaqfoD3n
	6u7fpFSFxCT+3n6CNrjvPsjjF3nUQuRBvEHIWzSGWimfYRqkNL0BADE4k6DmNNPre0WTHmiZsOe
	5xW6OgVrCdzmUwy2rsRHyTxOlmadI+Ile7Jlw0wcJ3xQPR8WNHznVUBME+kKkMuN2t0mUbxUz6n
	JatQDcK8nE5cE6OGlic1pt6pNy4Ml1BDsh4YSSqEwXF2pNVcoSAXQmlaFjBtsRARjLmUMryUqGk
	dVnSUISPO6CCFBkfowWbzNlr0V7REbSlmXTKgc0DQyJJDLoRjWrM1fhK88M44g5qpn/HCCZUU9U
	QKgizKGQV1r9WSpRTNGJPs5gLXbohf1Ioft2kkbZKJ/lkwNhFD36sibb+HH6NkMN4sMKgte4ukm
	GzQVYtGMYlsWGBewCyhLuNrwVbRvheHqqIK9q4zxfijGz8uRBSUW3c8FdptRAi+PwH/Q+rD/a3L
	4lj2zFmdL9AIJMEsPQucPGMbYshxj6hoTcWgFTj7gTYOUXjqfEM4g6fiOK1EkznClqo+OF83oL+
	tvRragme1zzARTt2+M7UPiILow+p3HE9mLpzaL/IOoPmLnldAkcsRvhj+IPVo9E1HLtA56r8Oz7
	xTKHWRxLT/VAQT+Wu0J7a/45lAw6fCV+4lyP/
X-Received: by 2002:a17:903:4b0e:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2ee0d65e7a6mr107391405ad.1.1794853244283;
        Mon, 16 Nov 2026 10:20:44 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db8acsm3076325ad.11.2026.11.16.10.20.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:41 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:38 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681740.3136.17781028072212776292@kernel.org>
References: <20261112163333.12523-3-ahmadexp@gmail.com> <179484681740.3136.17781028072212776292@kernel.org>
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

Agreed. A RAM buffer is not a portable MMIO mapping. The proposed v3
enables the RAM-backed test only on X86_64 with neither UML nor
INDIRECT_IOMEM. The XIIC driver itself gains no architecture restriction.
All four cases passed in an x86-64 QEMU guest. With XIIC and
KUNIT_ALL_TESTS enabled, explicitly requesting the test on arm64, s390,
SPARC64 and 64-bit UML with indirect I/O left it disabled.

pw-bot: cr

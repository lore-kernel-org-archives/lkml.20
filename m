Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223686;
	b=i6LEY8nOHpNEyfJOp6a0P0161IsKiQCI+qvrH+ZCFqsXIgdB0j5NlMVsEP8q56DxWzqi
	 w6s0DayV0E9CJlJeSvnBS5W+G/idngKyYQf9WRQBdk3lxtWMLJZjZu1Wv6qVud8XLV75H
	 r+4WMl02HjvExQOsQ7c7TlayGt2OIN3QFM3n/kWztcxNxZDlsP5exlYtDfUPIJ8W9a9hM
	 ILamtxTaIwVUyqXQJrNr3gWR/AYTZNk9xrnje42cuHBWUaBtHyLPe04oeGD29m7j/fk9k
	 vLkj27rdagtH25bUamqK57QOu7TGvdEIHZTxQgnmKX1ZV5gnYzq84n/XIBqDPPEJDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
	b=fTWeDuTwzWi9bns47ysIrFK6bIh0jE30QhHVYaK9tUF/TcWd/kNfgYpasLhiA3eS00Fz
	 smVLKGSlLjKTbzxvYHHGmN1cfoK3ivZxAkR7lp6AqIzpY6ENE5GmeSs+h7e1Buoe85nVV
	 J/fXgkeg+Mes103whLEQeEHuqrfhvAMfSeqv7W4CdckYUMRIHFxQRUg26+sNS06U5xCdQ
	 aql8NZxIKkzO47Sc3h0mC+kvTM9cZSiHALVNvdmineABrPveRf8Y1oK3d7qucC362AYHK
	 SrBW+ImqdiKKu040a+6p/xJ4Q36o0grBccYtcmIVrJ8ZXJKG4IQAho0EUL5/aZQrMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc6BB5CR;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237F606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D237F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc6BB5CR
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso328183a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223685; x=1794828485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=vc6BB5CRIrMO/AZVgRPJBeu5l77MBy3l8CZmAjtmis4DyBj9tbUsRSyWOAScOK7oSv
         gtvAhlGPbsPwaVdqwE1h6gg4r5MMCwBRhxaSiwwseEnNN8dSNWUdQcDUflsamjhvAVdX
         cnbuA6gDEvmdMEodxRErhxFr4imlufV0pRnkhFRI/haVciw5u22bXXG6qXfCjetVsnxa
         9UkRY6e60R+kKgE1aVsg0eDBtHpcT8iCyZYNzvC8Nv1WhEEyiXhdSg1kqopCwUHO5sjE
         TeEZDIJmYUTuYO96mLXakj81kLRmTCVT8wJ6bbj5+P04VygEQeN3Vft/WU4b2BF/BWW8
         +AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223685; x=1794828485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=ssODYBr+3m0AAwTTVZOi3+D8u8AJXlVwcZxA3KiRWDl3I04OcQ5N8NsxBQnq1JKQ4z
         afe8oY803Ll42ABwMCs+q/h1SjaF27ogx7J6pEmSwQCu3PNLQ38nGMinea8dFbua7yDx
         qOgykKKyG3pZJIGN+UeZYnwZ96FoxDunQeQkPyufLjLpXlHhEY0or4j1rcMMGxL4xi3b
         UOL1NlR8NzwrHVqS2z72fetjmHZrwAqsw65mqvOrWGXbqmhhAGPst1jrIJYYXWm0Hk/g
         dvQ8C0zE+M5Wlr+z5ZoLDUHsHSmfrWG73ZDT3QZIzZBhqdXVerLAgzvUEbocWyvKnLDb
         O8Dw==
X-Forwarded-Encrypted: i=1; AL+hErEtSTDoP5kzN28qgP0TJ/PGQIVjZ7hCrDYDb1kEOqo1iDeYCMry/2mPtgVDjsBOmN9fLLfbqPNHx2ikkfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LuMgtr22MFMdSeCcFK6iuMf+v8zdEDZRn7WmTDkNWbtzzrjzp
	E+kzPZZGNmb+wfL7sd5aFhVnNRxBoFT41DcGUmppubYiNdVwJbeE+HLDV21U7A==
X-Gm-Gg: AYBFou3YsLIMmstGZj9t6sWvb9sBtfkNDGxbDaSJQAuiyMWa40UuByWm3uTrGaIxdTv
	MpBp8QEeTNS+5lPHl6FTH2g04h4PEKyG5RPWtfUw8wYZ3AjrW+IKVlELGP5eeJmNk1Yy3OJc/t8
	SfEdlMe7vbGbtY2xOLsDQ+a4kpVDwTQJL6dJIl/E9eTi4hYp843dMRqe4mXyqFMK8c/r6QqEFMR
	iwSSBYX0MpeVLHIyKVSD9j3EBKLiVbpaDNfIMXpMJPhtBK84LJJ+TiXzMpY2GqSjKB4/q4U2wNp
	Udgi/DinxlCou6Yur9DkUmMCmmyDLgrQIMKR7wd7XCE+TgV3kDZlWK8IWq+f7yaKNd128pu3b1E
	yR7i7blHr9yEfWMOcvQuvnTKbjYAj9bzGQhEw2QFPgSVAzB0DUH78MTWXZMUbTrsVD5afXY8cL7
	QR0zRjkudZRpFxMnpde9Luw3LLfeTThA4A1syL+tPCxmIX2BL1kLmBtb52pVTseEc+XzsjttnAy
	LJeCCkKyFZ6eAmO2+oeNfxqWikXLVSHHGusxtdTGJ5irtLJJXvzZ4YkIsHORCEw9fbrlKxfpJ55
	XGkuZ90ZU+HL6Y/e8puTNuEiBWxvpFEF7A==
X-Received: by 2002:a17:90b:4d10:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3b12d570debmr3765652a91.63.1794223685119;
        Mon, 09 Nov 2026 03:28:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10766340a91.2.2026.11.09.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:28:04 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Mon,  9 Nov 2026 19:27:37 +0800
Message-Id: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com> <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
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

Tested-by: Ping Li <leeonion.muyu@gmail.com>

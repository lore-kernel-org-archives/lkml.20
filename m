Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845520;
	b=MawtjZ4/dRM31wilhiJ9j/DMJFwL0AXkglc/NaYKTo5emhWOU+Kk6L0XtiJNv8IDG/BH
	 YNkYWNadcXFUPyzD6GjY5cE+FwD2i5ALKZ9djNPdrlmvjxBqj+vQzEBnDixhNPO6wnG/G
	 f6cNTPfJ08NsbYGlr3w6VkP8BvmehmgM9+QPav/ZGtOwG5B6kULcS7SPbN1vCh07oNEaO
	 10eoRbWvK7EQLo1JH0vs1Yyq+xfhnMzoUrn4cAp3pcKkLz7cSRUlSGe+kdtujYeK0Y/8d
	 QWb+uVeh35m/hkzlXYTqaupiU3+E7IoYmi40NXgnQQkSYsnV6h+Of+pz3Ue4VnAevYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=5c74wF47C1p1VerBrZHCjQC2Xwi7zzQDTTx0gcIPn3Pxs/8lL4BC4QtSyq1c+gHpZFxD
	 zf5ZLaDrLIxZIudrp/nNLhX+Da7M06aTeAPFxMgfajRw8VZxVdAugslmeSHUy3vuM0g5+
	 Wcgg5RGlvo78eNh4gzyiOXIHvtymeIHmRPgRCqdKc/Ub8qbnVQ77lLdYv/Y/lAMZoI0jz
	 q6vhAliqaFImrfpqzV3ipBAFsqL1Z0CfdC6zxN1JAz/bk1e1SO9MZuWEcDDVswc8I7D/W
	 /T+GE4PmWep29RaR5/jLYd5TQqhNTW5T8FOSQDCuOay5R2uARjURViVPdS+Zer/QNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dySW2KYG;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34588606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34588606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dySW2KYG
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso5105248c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845519; x=1795450319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=dySW2KYG+hS1QGRSEydxIltDVelqK5nTjLKHUnZNvmgoCIo7ks5eq1E/58XYGrkeC5
         HN53PJbTo4BZWu8cFL1Mgrcdus7ORpV6BivQ9orvU0gU4RAr53n6EcS7tLtudiGqBi4P
         4+yDQtC2Bl67fG11enEAMMMhF0eiw25DdaxrhM1NduNKPK7ZPzcp02iWdwqgVs+rrhJC
         mEQcy2F9NKNdzMO6+bk3z7SYJqiOgMRm/z6giOsi9Z8clGGbk8/enStjEsaXIl1uWv+z
         UJ4OTbrtMNj8FdfKapm61YmM/UbxYNQMUbjl5e8j8ca20LPGl3PSAXLYyQAgvg+DJ8is
         D+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845519; x=1795450319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=K+g6Z+ow1NX/UD6qpGvGkapEoZgILNwYPTNlv0oxg5GVQajYWob4zvf9x01lmEW4Q/
         0WegnLJnFvi9Xk/xiAGqsTDozTY38lNC+ExypfdicZudTu2QdFBmnzClPBf5H2iZpLDM
         1pkXfeJexAqOSQHM5ihPB/ppvRsu0RKzUkLY4D1ANy5a8AqtqWVea2Hpr4lvwVzW5jnf
         4bEI8J1tKPNIn2gz7/pkvIl+prrbmi8YDDVqA6I6VidO0w9K1POzpz9yil5aTyhb7lMf
         YVM5JjtNbjEImUcetkxN/ykGQB2AsVbQUD/nXCLmQt/AXEAiBFXdPv5KmF4zXh8XKBjS
         4ukA==
X-Forwarded-Encrypted: i=1; AL+hErGLu7uJ42G1l6mD7A2DBr33IRuVb48T2SAaILgfMunLx8Vq5/YxTBksbL7LzjpCFa2zJCTpB/H4CdyT7zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TO20ntlitxv8T5uJf9af+tRieaY4tLIoxdriaiQkuhADBoRI5
	B/D8zGLbrYHvdE8XABRGek4s2ediu/0f0J6whinOHndm86X+Guo7UIsP
X-Gm-Gg: AYBFou3ns9jRyJNlkk52+xt7mx0wyLnrzm+PZ7BnmPk1oxXLMENUC8rWGGFy3s39q56
	AryZv4heCOmxLbb7MyvyCZfSopnM4RurwsRf+11jsWmnXtIh0Cs9zNArUM51LQ+J3D5qcHLw9mG
	bZ5ppgQhypR34LmzIDQpTicCuL0kJ/QAGJ5i2qn4aHo8DhU35UJh0mJc1gFNPJkYFfAZjbvaT1F
	L3+6s0AB7X8fa+HsMrySKjY0gdCFuIjgkbCsFWu2dKrUGCT6JkG3/NDeBZ0SirFV6hY7p+wgONR
	VXPHBIyfJ4VbAfLt3+lKDKJiKL1NzIPaRdPxyf8LO1fUTV2gKvgB5eWPSqzdWnNc48V2bGOvQx6
	+J3MDYT02aUHNgYr8GKoahR96LyF1khZYSdu1jneWoY6LNYkpS8dTBjzaAKMLRa84uq5nHsUWss
	zps/nNCLZK9UbYTm+1O4cB/e08oCErbRMwzE5c29eOM3zMu2uxZoGimylVr3UmWhcmBAe8pR/nx
	i/hZgG+IoMJrclV4fMeQvMvVrUmVvZ157utOOngmwVAAUeX47KCpE+ZljyFSCfZUvcE4IF/PT4p
	zu3NJWWxjhTv3yOLMRRobW6HJ4IuprvGCkuv67IxQB3ifDyvpHM=
X-Received: by 2002:a05:7022:2529:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b5031759b2mr15999570c88.20.1794845519181;
        Mon, 16 Nov 2026 08:11:59 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm46421688c88.9.2026.11.16.08.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:11:58 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kbusch@kernel.org
Cc: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] nvmet: clean up DH group state on initialization failure
Date: Mon, 16 Nov 2026 16:11:35 +0000
Message-ID: <20261116161135.2690-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179484220897.249619.16009819575182400523.b4-ty@kernel.org>
References: <179484220897.249619.16009819575182400523.b4-ty@kernel.org>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

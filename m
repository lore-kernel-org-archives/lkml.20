Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020845;
	b=XLfR5S/Dci9WCvTVoaduOSMt/lJNTiaL0pIVQNlab22dvKi1acv1N6rG/BATj22Sj8sp
	 /eECctbczWKFl7y6s0RRes9/l/UJJMrpsFHyUoG8gEdvyFG+kMBi557USSnmgTXKMdfqQ
	 Q/y9absDAgqM35VYwVHnqww7Hc2IR1cnq7vJ5uznmt68W1j2gyWbNZBR4E1rv8weMJJg8
	 E0bNdzGN0+qLoNvbtBYYljoqjIGEvpJQAEoQto9xTrRZaCRrv9dRt9uaOlb/6nwLmS4NX
	 SE4gIsaRlzyiPhy3AXZGYUzKxQ+nXhOpPAqgZ+iei4zUHkax80WnDJpRrvcxxS05l8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=36Im90ioU3O9hje9yGSnH247TVmpjFjISAtFFzKhqlUsYhEQMczR2WPnEkSOVYDb86GP
	 kZBVRb/6iJuP2fZ9eIKBfoxhyC3yRqISmtbR0JB4kv7xWisuqxfHPtIed8ZMu7XehUqxJ
	 ClRoYpIyGPKQxDlLn0QXtv1SALmBF/tLNkCVrmm0RfyMVO07KGh4Xnhl9lo+Tv5pTUpNh
	 hY5LtLhFSWrcm3dqq+2yp4dsHY2goS2nd9EjNKh4uH5GcsK1uL1y+VGUZp9lmM8h2ff5P
	 wet9yA1NAj/x+VmGpeFBg40IUPwYTN6KWriBHArLiINGkc6hQPFdbnJ8DrAB/rxk+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WauRMrpx;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F39C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F39C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WauRMrpx
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c445c95d553so382778466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020843; x=1793625643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=WauRMrpxESCrEvvxANq9HsD33ULRAd9/RpQfcJRj3x+Nq5C/hrEbrLJXSu77G4h2mj
         gdWCfopcCB4YzOAbR4M8SyB16m/KJS5fhGfhvNBsL05YiUDfev2CwTlA7CqzRBoL9FPc
         UzI/fP9f9w/UftmhT/L5EiW1Y3roXMO734yuTu4G2n5uz5I5utEuhkZ0kAU3r3DlyxkS
         KXmjUry0VhVebAoeTIFohEMIuRpo+fKDtVD7wjfCwNX18WeXSriGe2a/uy0mms5m6n5w
         Mzv7ROGeQcpuNbbam/j/yM53lNZMR83DKDwLEBpUmYRHD7BdvDSoTGKyXs0HBMPDSd3F
         NTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020843; x=1793625643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=UckWrkNUKNp9WIwjN2y9h/hadeHc5ITqY6uDZAkpMDwS+jjCbXyZ7gZXLkvZ23vcRZ
         ASlJLulEhOXF9NF/KLUsyyK8irjDWD9+DnDBYZHVU5eUvO5QbUvfJJ8Qhh7Kb9Sr4hDd
         9ZSnGPZlktpUAJBJFEMEHdlKUP3KDpaEfdc72YE1ruEjPB2qZb1/83jphdY/ouCPNq5P
         ldlmk9aC5/cAFrFX/A1L8WoWqveDiAC0DbIAi9dPQFoRElogBdBwVgQffvEejSVGIiIC
         HE2Ks4xokxBQZl73Q6XZ6VS5zwg/WdBIaTqbwRJb4zZZvH43zU94WG7Stdui1fJG4gTY
         qwpQ==
X-Forwarded-Encrypted: i=1; AKwUvByq/gPeCAgBYPFoWCe//XByyUJtGd7nPSeTURiMzQVYFF61dkZz0P2ZiNm6rCzmSDvrixhbk9EgaD+DC+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4I1rONLSWQijqQITRWuT1ZqE/RD77D6QjP5xvk71PNZlSoh7P
	38+X6NHIVn5erXm8vILaeVG71pQtBcKHJldRqWYpu5d86hFZQ4bqeHlS
X-Gm-Gg: AYBFou02oYDmf7XMU8JGJ1FlTW+DDVBRLyr0HSVZGxpqoGEUjg74WdAgM0Q3qq46SY5
	CpPuNcmqZY/KZdF4SCJsmkC2en8tOFs6hLHGJPRJnyhPBp/EMCJPe2xvm3ZYJb+N4MybJS0hsnc
	h03Vl0aHCWnH3Rm5hp5kSmllyWH9lk2JVDKJofVmlj9fJY7nouJacXIQSjFQN5SFn1go8+pRdsu
	Q7QbDQah/5FSva9Veo7d+BjxLKdyk8E88mWqkMbnMRecTJ+ekht42H4/vzjOXaAH+5ZlyJEB27I
	UTeYsHxXIDPLiGEo3jBH0Gu3n+GTgFWs8LTiSn79/lEmKWTIOWysaasA3Aqvg0/TCXB/wNdHq1k
	sG4F6jmIRGM+TDN7b+u8Iohbvw0Og5tKxgANHg04v96Grrw/T8QIo2jWpGET0p6ZH8AHKu+05rl
	MscVKZQUz1YD8+UoDcDGHEzTTaOWjTFvQ9rBh5C7Qjmo2FYpGuzwtfNsUtUA/RfRIjTs57IMIKt
	LWUd/pwNUWR+a+Dyvp8fR+Ag5iguhoAtyoAy5UuTYga6HMP
X-Received: by 2002:a17:907:2da5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c46bde088d3mr773260366b.28.1793020843337;
        Mon, 26 Oct 2026 06:20:43 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm314324466b.4.2026.10.26.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:20:42 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Wang Haoran <haoranwangsec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Mon, 26 Oct 2026 10:20:21 -0300
Message-ID: <20261026132021.220391-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023073131.637062-1-lixicaicai@gmail.com>
References: <20261023073131.637062-1-lixicaicai@gmail.com>
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

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560803;
	b=sv0V24PBKbGj0Aik/CuES0aNRLmrhn1ZYE9M6bZa7HrnOXUrJS12545QnXa7mT/54/Eg
	 ppvKMr/sRH7UDkQzMrYbtP289pASlNCZfDfGI0Em5xGj+AIV4GQyTupZM7PYr9O1FQNO2
	 qEZ38tlPedaGO1q5Ce3sfy1R8vYgjLo08turlq82vVpdhw0Qq3hU/QNYZOj65VY6Xp6KP
	 iPPIEE/qxAyP7ahZqzCNKht9FLuH+NTtJHV0IamkP+sTKqxi2NCe0K3z7hm/hOv4d9NuX
	 GLIUqEKEz8qO02FgVRk1rMzqNWTR/Zg3vIP0i5wbSySeR9BwlvIpn+K879XV00NxQuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
	b=45Dz9bu6BmqDz0XDxCr8yYfLZOwr5l0v01+s/JT2YTaZ5kC8Niv9NTRFBJWJwXkzYtf0
	 6qaPN4cxPccSb24fDuGP9vMDr8VOxMs2gA/vBktQ7gytJsa7d5l8eSmYsjQvtujtCxsf5
	 AQ8ni9mfdW0aZHOWGCH9+VFWePBY9Vn7sl4sviigYzjCGphgVoSUoPKpLiAxfWDk7uOlY
	 osjWShUBVMK9y8ixLtlX1cb5gNwR8N0j7az5V/JOPTqG1EVMGU4yW2MyCXQgsYvBWAzzk
	 G4bTCd7tyiMMaZFryBBLh9XYTt/Xg0n6wOMJ3yvIH2/2+PyKawwEp+IOv7nCxxGlsyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LD/kQkxN";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LD/kQkxN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso685599c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560802; x=1795165602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
        b=LD/kQkxNUSUYz5GtHET+4tkjmJ1aM+dLc5LFSvVRdL8gI36pz2MfxpgTVXcDGovrcF
         RK7AybNnjXY0CJGK1faKowrPJRWVEd+LVcjmJBJZ+OLci9TxbtvwWeh1B1MIbHpICHsC
         SKI7SsGmQEmIw9KaNxhIcqp9r2Bu1yWyoyGpgRXnr5lJjJeg+nTBy9JBMrtVVRy8Qd3C
         5bleGrQzw2C0eEoD3g8YkOaxKTF3xlqz3JtprY78XKLptrhanOPH219EZwk/KaG06J6Q
         rEQ9bRyMvkuvu+SH2eUcqYv0tF4HLWFsjnV9z0UgSoO+0VqRzf6qpMCnF+L/f9vxPsLp
         /2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560802; x=1795165602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
        b=wWE1XKusrVH3/S8Q7Cr9x/pPHyuw5vO44uuD1BU703CAMvketZggBveDNtwyPZpCN5
         zDk3kYmKiBh8cMkeSMZ727pJv91Voh2LGwz3GwL9/0LK6MwLtjwCmyR8+wRFG6do4yIq
         9IxwCU/vqtEzIbVCsQESn0JJa2ZieGj1as8sBsDP2BBsgNeeS17tKRvFhhMFzcLg/j9A
         YD/DwTm7lHQDdIP1tqyAQ3UVccIk8qhcQkT6m43MqaRZwhfbrpJro+8gFjeFQSQR1ccG
         fn3Ri5vHEZXVqoAJrvecnEPyWm8vsyHLfJHC7BkeqLhCKdxgYOGu4Aq2azYDHMH1lbbX
         8kIA==
X-Gm-Message-State: APuU4Z8yn4j2C3CmlOt9lc+WuQOEXq+t3cuC1DXHGPtjOFYzNtQe+/ha
	S54mxIFQh/JPfDnBOsAS9AGCQmDsFsV1JjwKKIZ/0QCZOELVQm9zkvYu
X-Gm-Gg: AYBFou2ROJMUMq233LFFo0Iwh4wt5eiDv/HCKInNpyjpeVdpVJycfrpdB/Z5UEU/238
	m1QrGbLam65iSDkOPkL/BmKydAFsLVEsKtlJp+BcVCmLkkB/wT6uox4nKDS/0IvyVlVyDmpYcrg
	HnRdeTpmF1LMqBX7ho3+7qcP6Cdi8sWDthopHU0uTljGgDezf1IisK6rypQhO2pEwQd0GmKODhn
	bQLQDtCpJUuFOt2OaAs41XJLszmnTZg2nn1579zLFPmV7g/8nt+2V40L4va5zsEy5NFjhJa3Km5
	lW/8j+JDilT6yIA7eU2k/hEFcL9SV7lm8QLSUHe1jpfzxrSZ7uA5UKNcypt1pnpJKoSKHJxfxEx
	8VYgfLhirTbggYC33aF7A2+AJxymQkbG78DkwYHCnCeLaQr563ptrh6Qa1lxDYFks+BhSeNN7r9
	23/n7BQXxsLvYT+n8BqVg4LM6FKsXXLRwoxZmJyluPPD2c1M616Rv/S4RH8lKEa7iwhBNd+mbP3
	L/Gjpf+l8FgZnGerWU5jePRuFHyDPMJltvsJEy+b9synmPIq2jj83J4HThaptywDKAicgcniNfa
	cVRuENGiBp+b5BQlzkQ0/WTroSv154nki6wxbCup3wnPGTdDb6hQ
X-Received: by 2002:a05:701b:205b:20b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b50313ab0emr1801317c88.38.1794560801726;
        Fri, 13 Nov 2026 01:06:41 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm5522272c88.6.2026.11.13.01.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:06:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: Gentle Reminder: Pending Patch Review
Date: Fri, 13 Nov 2026 09:06:19 +0000
Message-ID: <20261113090619.2873-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87bj7tqi8q.wl-tiwai@suse.de>
References: <87bj7tqi8q.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the update. Understood.

I'll wait until the procfs refactoring is complete and follow up on the patch afterward.

Thanks for your time!

Best regards,
Sreeraj

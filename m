Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071879;
	b=ZGE7bVXc4pE45A+aQtaoJT8aD3EL6JRycpE+Zg5BHR7zc2dvl+m/uuNobCXEuhOvdOsM
	 DkVPsiFWxHyzFPGoJ9PLcEQBChrrMjVWnFVQeGaLzItdtawQiyevmQfaAbm7/rOySwgLq
	 LSvdmmrJ//F+LPwG9matdlDSpxISu6fDVnSKeHshyq4Foaf5T/iiXEgpbla9Tt6rntmAU
	 Rs9GySEt3vC/QOnp3DLhTLKLBZYhHq0jRjryFPhAQzrtKfP0ZNA9EnKuOSluWEvDqKeRL
	 ZapCBIWoPEeE5/3cgAoHtef0sK1Ax3Ct8dHmxzj30IQv/es+sSaSqDFWszVjC+9RXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FumZNvLAP3ED/34qodGOcbiLmIISEGhi+wd5f3+khLk=;
	b=EQUpyrW9Iakmw7KRiwQek6Z7yMIbUwUAnnnrq+bJWqciAFGaVkVv7PftJxDku92vLY/W
	 OXzPXIkZVNdCAaenZNCat6XPrYz73RIQtx4z2XK6wCcUT4ULJsQlUrERc+WCY26uYU+Dk
	 dbOuLAe1ZQ0ltJrmq75563alPpKhcdntireIJqxP3DPsYMP9MzBmjJKdojhTeM0lX5idl
	 RP58FRyeql2KgW2v+Mw14+jWcwd94ucO6e4L2VLVopPcBnrlHigg8U73A+RyQHh1uh/qu
	 lQzGUuGEhPrGhCCyz27G7epvYMAlmT/ARdE/FkQNyzhtIzKsok5uhyfXxFAAOFcekJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4meJjGM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A77606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4meJjGM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so353510f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071878; x=1793676678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FumZNvLAP3ED/34qodGOcbiLmIISEGhi+wd5f3+khLk=;
        b=f4meJjGM1sNti28R+ChWYEByNP8Avx7P91CW7Tu61rkSyrhC/zF4ct509PawNUmfGT
         x3Eug8V/hhBmBTeWrSu4fIyJ9biTRHlLncm+JY0UAHhwLkqBR8p1C1hNj5FcKifSkm4V
         OEHVioSNYyz2rPjwTXnEgToDcCMI4EOlqcoeDRbHYRrV/k+4o08yEaVIJ41rTaZO30da
         7DkOhIHDJwV1qOdZ5L4RfnyCdfmItVmdJ4QLNrzQ61D4l1BvWgEHNnpeXRGHGfL2RqIl
         djYf0e+vGndi4N3zqm5+iSRxm2H1bwZagm1EO9Zc2WjWm20ht9rneQI4G7D3JY4WEQBF
         2lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071878; x=1793676678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FumZNvLAP3ED/34qodGOcbiLmIISEGhi+wd5f3+khLk=;
        b=27ogZvaVaFAN6UofpEx3cYT1EcIgf9GnFjP01ino06cP+hmdKXV2o4BZbFzcnoFVWm
         iuGuxpCXJU0P+6OHp6IfNXtuzbTgmuq2I/JzvNswCUOP4YBTEqS3WtS5HjLH2wUAP9A7
         g7V2gjY11VA/oydBsAmt2dFyqBJtADJDyZh1ftzKNzsQFXuLk7R95f8BYKMsNKxHmH+N
         +AYHNAlimke5Fsd4KrPqv+ZphUQ1R/uW55FfKbNMvBfRsKtMSuDhr1BI2NZ88ai/SYu5
         iVbqE5W7B7va5IY9cZ8+PrMp7sGtFNdik9/sc6cTJkfQrHsLvexOIVXoxHAAMPOBvLpa
         GLQg==
X-Forwarded-Encrypted: i=1; AKwUvByuzBzXuo/yJ1YdKkhWoYaO+yd5LGD0XmpHFDcufWkou8Rwc8/lwBLoGH5Z1CVgEFTVy/yf9G4l/n71I0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd8EjinYrguaZn8ckVz8DTvBtfBG1h/iBB12oyKRfA57I/I/V/
	SEko6olz3Xe2DNAq/qMSJ+RvcRNYoTGD7vfQfv3CIeRSG0lVcUYuZB3P
X-Gm-Gg: AYBFou30D+nfJFjmMEeHmHvDCphVnhuBZtsrKULHkhdiRvi61B4QbrKa3bYvpgu00Bm
	OGTcrX/Pa9GWPNHZMPvMrGrF8Ga8RGPCsmI1XRxnv7z2s2vGrbbSzUcc4XSVHwhPI2UU2O9c/7x
	IWXfKVEs7HAyTGgl5eCl8lAKlWJK5rYZvolA/UNBg4UxvDO0GURB5JHaRuy3e6new7tSVBG54uU
	3Y9sHg8xCntga8Pqz81a0f97qwGZ0xkakleFu/M6FFEHp3Z8nZXWmdwB119X6lc3hz3ag3h1edv
	EZ8mLYfpnnXKTDTJQMjRGydHr5YhE8clQneVRy4pIwATV8mUsHkAFFW+oQEMjRSVQHk+P/xYajw
	XawTaUeydtPq5rdpMPdAmFjS5Ph4kpJmFieVE9dIzfRod0x6hoiNhjolkMqa05mQbxWeKMpwORH
	HGWjqFo8ZB4LWtLvazZp+REA7+e2u69haov48GaDHu4FhDE2BqYRaqrGBd0/0ZbOfcM1c6GavIB
	rD0g1JxbbrbYqcldVVyClgsk+LcHiUP4JoaiYlMhJ0VprZLVkZbnHgiOzK+ALVQue5z1BNlBUV8
	EXZTzQQhpj8MQHPAgJl+9e5GaNmwCtLgjBvNB38wSnc+DDvJkE5aFx2F85lAra3zG/j+K5TkLCE
	1i+OUllQzfOSyCRVx1ISQaHWogKXsOfWqYiG6EwpYHw1V4cummB32MoKKbLn4QkuKgJwlfpx//G
	UHq3GEUEHvbbKmIFnmq5IHoqPb
X-Received: by 2002:adf:fe48:0:b0:48e:1aa5:fd77 with SMTP id ffacd0b85a97d-48e55a15f74mr2006076f8f.15.1793071877451;
        Mon, 26 Oct 2026 20:31:17 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm25685718f8f.49.2026.10.26.20.31.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 20:31:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3.2] can: j1939: fix j1939_ecu refcount leak
Date: Tue, 27 Oct 2026 04:31:04 +0100
Message-Id: <20261027033104.76618-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <3958917c-1484-41e8-8d62-99575edbf980@I-love.SAKURA.ne.jp>
References: <7df4f6c6-b53f-42d6-9725-e60b763d01f6@I-love.SAKURA.ne.jp> <3958917c-1484-41e8-8d62-99575edbf980@I-love.SAKURA.ne.jp>
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

> 	list_for_each_entry(ecu, &priv->ecus, list) {
> -		if (ecu->name == name)
> +		if (ecu->name == name && j1939_ecu_valid(ecu))
> 			return ecu;

This also hides a live, named ECU from j1939_local_ecu_put() during
unregister. The netdev core sets reg_state to NETREG_UNREGISTERING before
issuing NETDEV_UNREGISTER, so j1939_ecu_valid() is false when a bound
socket reaches this cleanup path:

    j1939_netdev_notifier()
      j1939_sk_netdev_event_unregister()
        j1939_local_ecu_put()
          j1939_ecu_find_by_name_locked()


The lookup then returns NULL. j1939_local_ecu_put() warns and returns
without dropping the socket's ECU reference. That keeps the ECU's netdev
and j1939_priv references alive, preventing netdev_wait_allrefs_any()
from completing.

This is based on source review with AI assistance. I have not reproduced
the unregister hang at runtime.

Could teardown use a lookup that permits NETREG_UNREGISTERING and a dead
rx_kref, while retaining the nonzero ecu->kref check? The registration
and receive-lifetime restrictions are needed when acquiring new users,
but cleanup must still find the ECU whose reference it owns.

The ecu->kref check remains necessary because zero-reference entries stay on
the list until the RCU callback removes them.

Thanks,
Karl

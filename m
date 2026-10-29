Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271130;
	b=cT7s1ewojRFjdmfjh1ViUf23YBmTrnX29v9/1cgofGKtjaIJ8UjgLRHa47d//qH/CA9o
	 YwDLlAAFIc98ic/MyNfMy9EfgYZwZu/DDO/+3Q1TdoN6Xj8Ljl3MlKtz+HhErSP8o8YQ/
	 0ntI8WBa2Z0BaMO1QARkGpQ14bPz2k6Xqms12lVWtbrUCQXCGnblNpK5Icog5iMBIxii8
	 /0vFBgVNCsolcXxmpuII1r2Jn603/fTcJHfkKlkYuRDldaXi3/N8GjachYrCPkLGs2ziK
	 f6Mv/vSSoGC+UGqU/FSkRuDF8jBwjHVaYKWPvlQPXWC4CHXzzTX3x/WZoRyfviwQDrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
	b=JGCAxnOtJpXcDZA05vS7fDZfqRWTTc8qZG/eUeMpdUSLI3Ymv40XwzQUymT0ov6sbmHT
	 A8A4jF+RnPMjE9o7e/0kIhdD/c6wjiCa3Q1rdjBdYSJ6cOTCRGkdX+q5M/rlh8s7D5dH/
	 PEo+ZOdTBXJx80hjoE6EW9MO0cTawxFTJMJ9QGxLcI8wfXQfVKcpN3KfrUuUDttwn+7c0
	 hXIy3trIVyexH4YqX4tKhEaElEW+LOzOuXKpfkECe1wzIyjXSvspg9aDGlIXLtAd3CfAK
	 DG6cWG9cErQnJHfI4K3izfXXtc+lQQqjGFFzN4SghhDy8ctcLGNLICa9KibzTxHlBPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW1nzIQi;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C2606A334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW1nzIQi
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14fc585291cso1762909c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271129; x=1793875929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=XW1nzIQi4H3OuoU9THImPRKoMX39uKEa2/UmpkhhWUjm7EAeJ3Adb5D6ulc47NdL9y
         PBfxdvqQykobWATR78jKBnTxW2BoqtbN2mlkcu/98Eym8KoX9Hz9i+9GPgdgUdvRx7nh
         Df8q5C3sHVHkDmxTFfIgn/QjWjPSfh098Ib56d6Jt5QRw/nxfTdRBiuaG7Z56rNy7qdV
         /K5qnV+0RaS2HCFdHzNMmxg52y3rkcTCndb9slcH/OoGh/hfK6G/ishCVpFATqOTLX6Z
         T1Bwrs38pdoI/4HR185QyfFDn2AdJQjx8WjZd4396IhKTqfMY05x07rkO2m8F/jHBF/U
         6n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271129; x=1793875929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=PkfauPD/0vczgKUDXCa9PdLaWKIxKWEVa6CtN9ZY8wMm51Htn8rWecKNeOVxDhKgrQ
         bQn/N+itQHXzPeVnDjZUATAt/13wN6+Yink9WKskLzUbRi5R4B/vRj48T13TckgZtfey
         PO7ln1DErCH0I6gHu5QaVriyRQVdPuQN165o2XUV6gUMQnWLP2bYa13h3tRrivvWQjGO
         HeO0sir2y/LVcGChjFphQnMGs1hTPrXJ8FdVWgycJlH+cWE3Dtv4SzMxoSCRC1mrBqs2
         7zk0OZVhDw8MKntzmyTDiBETT2hElHX53ZNxlecijH1/wAMvarkVWllqKxwXohbxZMMN
         B/gg==
X-Forwarded-Encrypted: i=1; AKwUvByNISr7fVyi9wDPW4w5MdKnBH3wzPrsCEb5Tj3+YG8Pg1FGaUWEtwTGwF2BlQ994ESvupXYgCsnpZDqFb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmZzqG6VJBLSmPGQGEtaeQjTr6MarMYj10uOIDFHy0+7l3dbGX
	8jD2IPeqJ6ZC3NusdZ7ljjD6/dvmH8X16vnpcXeJS4WrfHoT1wLxljXQ
X-Gm-Gg: AYBFou16eZMWYgLyWY33ZOBYCgZiv4JvzluFx4IyjTuzCJnpk7norXwDEJleFrxly56
	eqCKH/LHoCcguGDK3tQykOudOb14zwdeRaFtFaJpNRcMFwgI2tgIzJyBG2uSwhRWYuI8QXmAEaU
	xhCOCZJKSnJS6DDNkD3iQT4y1oQngqjZdUtBsFIDUUJm6g8zntpvsBdyQFVV4pgtHlzYfs3v2gm
	SLCksWbCVVnwoeqo3JGmIGiiZyK4v2pa7+UFFovHsQvFFYcaz1qkv8nipMPP0eDnIDDTnpgAY7W
	jqFJdBxwfWP4j1Md4cHI05/AGDqFOkuYuOGpxTyh8y72XKbxcfAC0z/3CTnh5Sqbkz4SNgi2vWg
	1HdaWR+UtFgWZnJaiFzwgRQk6grm5s9tLEf7He68u2mOUoOO6SzYl37yTA9oYUJmEFSSzxc8xQe
	b2lYZ3RwqETex/cXVuuWf0crjS8+NgfT2IeUtgEWCqljCPHC/2e38uJqcbqOmJ3katdoCLh6uxG
	yrtHYPXvSUIgid24LodvbMVua0sGsGjnU1YOC98p2KbEK2PAu1ZpPiC68aeltcfA8GuAQ4L7Api
	W9XS7xGNO7Yw0DUw8yXT/OeAx8luUWh0reryQWyIaEfjyMTBwe6UmPiI6Vabs+2Qzw==
X-Received: by 2002:a05:7022:622:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1a6cd3a116cmr8983973c88.12.1793271129261;
        Thu, 29 Oct 2026 03:52:09 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm14304398c88.19.2026.10.29.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:08 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:52:04 +0900
Message-ID: <20261029105204.2577-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179303637610.3134.6464335759134048296@kernel.org>
References: <20261022163116.1042-1-26rote@gmail.com> <179303637610.3134.6464335759134048296@kernel.org>
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

On Mon, 26 Oct 2026 17:39:36 +0000, Sashiko AI review wrote:
> - [Medium] In net/qrtr/af_qrtr.c, qrtr_hello_work() replays the HELLO
>   once and never retries, so a failed replay is lost for good.

Agreed. In v3 qrtr_hello_work() reschedules itself when the allocation
or qrtr_local_enqueue() fails. Once hello_sent is set it skips our HELLO
and only retries the replay.

> - [Low] In net/qrtr/af_qrtr.c, the new HELLO replay in qrtr_hello_work()
>   is not serialized against qrtr_endpoint_unregister(), so the replayed…

Agreed. v3 queues the replay under ep_lock and only while node->ep is
set. qrtr_endpoint_unregister() clears node->ep under ep_lock before it
queues the BYE, so the replay either comes before the BYE or is not
sent.

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

pw-bot: cr

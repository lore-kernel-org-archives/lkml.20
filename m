Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889796;
	b=o5Lzpi0rjaWUCtqOJn0MLsq9qypYp6XwngmoUOoC09C61KXPtBIaJHewqzTXu9SMTPUO
	 zwgOISfBfyNfpbMp2h6GYEzqDBVkXBveSsxkwIDDsHQEDKnbNsZKMzELIQD6HRIuZqmLh
	 2oWPMVcvza6mjjMBGle8DEX9Y/FqDp6kgS910rJaaueZPIBc1+7jpOr6eTlWOuhx+uYkQ
	 TXUhG0nwqSka7K7Ue+zYK73jPH6NOL1GzHqp3DMzoCp4zYO/zpiPNlSI1MK1aYdLSDAM5
	 fRK77TOIiOxBsgbcrlzj36IrWbpVD+t37y4GLPQf8h9xsaAOLP2i6Goz9APEypb9XMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
	b=WYbA2Jnf/g3MF16GCGSMmSmp2y2mBUSFhtTEX1kUxN4U7Pp/Ao+VnE6S68mFPMWAmupa
	 rEt3sVc8MqY2+Z0fAj/gzzZiDSh/kCldrp8BLbzgPd2ReR50vTLIL4y3v/4dF1fQ2RmT+
	 ceGpBN8Ar53xp7kAJ+fQuz5+qqf7iKv5SKhLtp363wxV5zEHdCD+5VnVcYq8QOzJPMPOT
	 3wTpq8GCE/Y6n1bKsajWgURlYf82Nq5t0HySM+5G9LK58G9vmkJBKL7I+raAebeHUBbIN
	 faZLIltEpo4zpvpdHBF+0o4XXiVUWditDx8DNhu/HvMz3pZgNjBZ9WWu6vW3pFJNO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9rOLmAK;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7CE606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7CE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9rOLmAK
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so4374119c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793889796; x=1794494596; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
        b=Y9rOLmAKjBVdrCp02W76hV9kicaJEHdhvzHUIzJyOlft0uebcy41X9U7JkYqpM3u8q
         VL8urorwkYTTjsajE8Q6hWl4PKlKi/MwLuZMh2e93cdqV9O5Dui0f8lpZCWuGV3JtFU+
         OXO3WQxJrY287dJdKczTEy56tpb6KictYEZk6C4AJoTrrtLGm/9OrLX9uh0J12MP8vD6
         JPkOq6r5Kzb0gH2oU3QWpT/ZzUrQNc6jk+Ip3V75fCGmdeFuMvhM30+erX7Hg/Ma/R+a
         w3JnHwr7WopHxD0f39mTIe3FivrSHbA8Jem3SBEYdWC6CP3qi6A+aN7FqrC1A7ZjfCSV
         EZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889796; x=1794494596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
        b=ClWkmomx3D17u0DS6uYWXlCsiED/SWj9U3FccWrFBXPY8KPhxNjJ5JpLm94oq+vNtD
         MD71r3FYaoKVJZOnfgLfV5DPBg8O/KTzIzP59Bz0uapqJDZl4xXobAfvCwals+mn26Il
         kZn5JrRgjOd6jzGrKKWJxW6U1iJQAB2Q+Fp9vPj7RGqqla5rZZXBEdtPIuWjJ4LMrc3j
         TVdvFSIPwPkoxgyj4wEArt6F/wqaFGsS4hciVaOo/QnuH1AJMSGZRW6lsznwJZy5+zi5
         1WjW6XnNt3KRCN/PVIzWLO39ij6+arMgjzdUxo9NDJgRRdSjaZz0IgK63FXNUABfuVwq
         Te6Q==
X-Forwarded-Encrypted: i=1; AKwUvByCxaAtZ1pTu+Uq1K5pejnDAKvRGMGPcX5dmV0Ygj9PysCAnGLveJBeqB6EiXbDOOZwm49JH9JC6WdtkS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VFN/qvg0NEqo+V+wF+2Lxz9AweXEVCvRpq0y1JNX6Iv5RuE5S
	n/Y5Etpkxxo8HxM4+P0EirC6667ylkrzgZu1s8FwJmcqMUEO4SsHehBvGju+wvv3p2YNHeFgTX9
	L6ZGxPLiVtBqCWiHqOqag9g==
X-Received: from dldz11-n1.prod.google.com ([2002:a05:701b:418b:10b0:1a1:3ce6:560b])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b047:20b0:1a3:bfb6:44ad with SMTP id a92af1059eb24-1ac5da797d4mr31199827c88.32.1793889795206;
 Thu, 05 Nov 2026 06:43:15 -0800 (PST)
Date: Thu,  5 Nov 2026 22:43:13 +0800
In-Reply-To: <sashiko-outbox-198693@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105071518.1458428-1-stanleyjhu@google.com>
 <20261105071518.1458428-3-stanleyjhu@google.com> <sashiko-outbox-198693@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105144313.2627198-1-stanleyjhu@google.com>
Subject: Re: [PATCH 2/2] scsi: ufs: core: Wake consumer queues on suspended
 W-LUN recovery
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Brian Norris <briannorris@chromium.org>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	John Garry <john.garry@linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 05, 2026 at 07:43:05AM +0000, sashiko-bot@kernel.org wrote:
> Can leaving ufs_device_wlun in RPM_SUSPENDED here cause hba->dev to
> prematurely runtime-suspend before the asynchronous consumer resume work runs?

Agreed. This will be fixed in v2.

> Wouldn't that leave resume_sdev_queues false and
> leave the consumer queue stuck in __bio_queue_enter()?

Agreed. This will also be fixed in v2.

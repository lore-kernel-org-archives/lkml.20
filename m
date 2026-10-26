Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048750;
	b=ZPpVIwLW8nU/RRWw+cw/RMbg3pv7gB1MxIDgWvHU/iuBI+dv5F7DagX+5Cb6cZQQDL14
	 ME10E822Lc51h6Lsnl1eysZEMPhU5UEDzJUxFtmW6kBSKbXgXJtPL13PFpgg4Q7PMNfgo
	 1pfYQRASH1FrLyuew/ATfXGep0ZSL3wdXP2X71pSn6FLdtoBOKIvKHNs7k/gZo7MfnjjM
	 o2zDLH5QmKKYvhtbG03QTG9vJbrqMUSsIvd7oblSfsOk2fYGp7R4oSzE8io2Csmdr6tRA
	 aoDlOXPjUBhkQci3y4ZHQpO48r3ltwiC5LtPLgVrlogmHL8P6wDbe4Uviho8rVF3rVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
	b=JLA6WV2zfgs0Md9zVmqzp66FQqo7xxrggl77qswljGQ6r+Xcob3Xu3BDB6/utbIZFqL0
	 UfOlLuPdxgtNuyVJ9ECC4VVIEZx9teo8S2MKrTj5IPXm0doXMabnuQP4P08g1q8EQAjvS
	 kF+lKo9tKt2F5oswCuFpaZdD5Y/AYLuK19LR1as47loarxphS47t1SwjmHNVf8MWjsVVb
	 VJuUYcK7KfmCGKwfVz93Cfp0EXtzySxt0FkKHUvCllnc5up7WBiL9R11Mi9iAI08TE7q9
	 ozOU7fSrLMO7QRxUucxZH1+aR1RfzIxVY9jthiEoPXrLaTwdNxzWO6fkSf7uKnnx2FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352E1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17050135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793048743; x=1793653543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
        b=x/O1osm5M7zxTA9jZpysosF+ofFJypdYJ1I154osDWAjKnFrYbUbVVNIvJGGGKAcC2
         In0OXi44NjS3dGcRnDU0whIn+6EZR/bQz0DDCiPpWnkBnrmwKu+yLlf2i765eSxk7t2+
         IvNVOfNN/tpz7PoFpKap5Zk/YOyaSnEp2YjoSxsu5guic+vpAou1T5ajAGW2TqWBUW+5
         OVp2DSxhu9xgSSBJB7r2mxQrM62IXSAf9i/dahZ0qh8bZ18Sj9L5FnA0JGltkWcSfEnj
         Tl1/BvDhhVig8/XdIUgu3ceScuqAvT1KSRZtHBUSlq5/JzFG3p5V9adFW46sMwtBhNdY
         bEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048743; x=1793653543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
        b=MkTQvCE4TaPY7+JgUXep2t+nSnIYGXeHdJuxDhMeQIVvYaKtcQO4aoOGd9QeOf0KjG
         zLamokB7EqWaEao2ri3DgNHHtqXAydZaLRldzda4fbZ/xPH7R/83f1hILXPNvrDyDmmv
         D1vE+pEQQBDHm+jx0/3MYCUfzEoHwQ9A03voc0YcSQBj+GiVxdrwf8OZeMbW9wkE6pWV
         OhpHpZOCSZDDnrHjvH+rEyZXJf+0HzGfMQMAemCulmkh9ZbXi4JXorAUnHVuICZYmhd/
         ZRVPrkPqr6Vmc5m/5ISvgYQCefVrYhOkpefvIocUVWrZtD7ix70AqrAGKuL+Y9UhJ8xx
         NV/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbpA52Ro7k7jdOcvd8Zsv10QCY6G8MG+SFjZAE2ADeXAKgZWqcBaPbFYOBKp7HxYcu7oFCAJl8MQB1+9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjznN/EVVnr760/fz7+/PpRC53H73QCIRuUPrLPmZ/dEuov1S5
	E9sW/qoz6lJ60PhuOB4z4xrOJcvuubHsYVR/T1Bb4ZNTlTfWkudbyZfZCSAexcdRuZSW+/kXE0X
	20BSmUkw=
X-Gm-Gg: AYBFou1D0Lwb9HWJHHz7OpWSz48jm2tuWwWiO+ecnfIaC5FEhgGiJQrhsrm5PIU0sEA
	jFo8Ss4x22umUOdejvawkq2BpsqYbFZPLbBFL8iC98UcChzsUbo8J75casyWLuMUY6LNXtLzsGd
	XabkwiphyZvo6Coc/X0+RDxHq/t2MtzO+v3xed0HHS0QssFCKkualPjC/IdyzsKk1aNEGQ1u8Xt
	q2HzVaL0Cq3q1JR/Kuo6fHp0JOob6z5OiqNRn4n3Be+gr1rgTx84GmEcJ+5vn7Hvvds2mfCfCCk
	QdGW7b02Y15Kg0YHlfIKGucqff0hUKSWhk32+RMkDLMrMCAvozp0RdDSkS2sFAe3dGmwfCGylhn
	gSRYuNRY6U5u7TFapf/BTrHoyfdgJODbO39/WYcaMCcxi5ymTIRU0Vm4pNkmXpn9r733dsFweO1
	yBT3hMhviVwjFGZ6OdnDYrqVlYZzHFFL4uEc7qZw0cZd7F9uYW6sQbX0HEv4I3sG/ARtO90HmUf
	RTBWYz6ZxkP7KxLW1msyUcLqXypPuvzJziIl3AmDPCMqq1cmqVrLUhjZrGR8dFVyFRH1xgzqJ/S
	LNESnptirSFA
X-Received: by 2002:a05:600c:3114:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a35acc7716mr138556935e9.20.1793048743445;
        Mon, 26 Oct 2026 14:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:258e:715a:5648:ed59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm258646975e9.1.2026.10.26.14.05.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 14:05:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Matt Fleming <matt@console-pimps.org>,
	stable@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: jz4740: Remove the host before resetting the controller
Date: Mon, 26 Oct 2026 22:04:27 +0100
Message-ID: <20261026210427.14728-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <48976ce134e26877200e8e1ef8d3f5c66f4fdcf6.camel@crapouillou.net>
References: <20261026083323.12301-1-olivier@mgcrea.io> <48976ce134e26877200e8e1ef8d3f5c66f4fdcf6.camel@crapouillou.net>
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

Hi Paul,

Right, my miss, adding stable now.

Ulf, could you add

Cc: stable@vger.kernel.org

when applying? Or I can send a v2 with it after -rc1 if you prefer,

Thanks,
Olivier

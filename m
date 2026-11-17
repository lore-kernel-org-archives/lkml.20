Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931339;
	b=vUa3NhbosJZsSCzvK+f2YcKPvHAxNqD4oUDUkApaz7UtNM7wctzrba0pFnC+t2oSFAiK
	 nHUmAC05sxiztLO38WiuOKHBTyVXKqG0hh4YFLg2u3t27KskBvn+P6TwbZSEhDDfZxpNE
	 oh4O/e3brxB9qSfzKH+hsEbal3OFiLjQV0jZ/ZIg96NIjafU8U+lUHR/j2X/F2J65bSWZ
	 LnY0MQXlRQU9UsLjG/mLIICeSEJojzSoEJvlS1uw0kl7EpYzR28JApAF1rSl6bIoqPwzj
	 RUIxjXBuz9xAV+HeRv7wJoWO9/hvj4eOZGfV4uZicjRRNnljCNP5SvI4rUSx30KAE+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
	b=ibAOBkBddxQI448adUqDHizjt3+Typ7j6LpWzzOMo7s9FroVkah/TTaZPnjyMRiyJ/Jm
	 XKMRniB2pEViBhmbU/mRTYYU6Y0pdqphq3YY2CgzGQ5rB4PYZonLrLfw7Mv71zQ8rtbYH
	 SzKqA0PLpl6HUtOVpoW27naQOitO2k2X0DL2D4BDqqBkT1ygmeHj3Fm3WAG1U+QLyGyem
	 g4WssdnczU3iFIZCogvbD31bHrwa9U29rRCx9MpL2ty8gRmumD3AXlNza59Ot5/uYx7tL
	 DMo2QiwqeR0ItKzP3Y2rGALJTFjUnGkPRqoUSvZqEqfcXQIrLEEes9l5mTfLt3sSdOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+qz8ZXE;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44897606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44897606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+qz8ZXE
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so7093103c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931338; x=1795536138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
        b=W+qz8ZXEWvqJWZvwzsHqa4QTgmwJcYChmAwrpxXaE6VI7ZwPjsV0HSiEN3HRry4Ox8
         hDV7fG8SvYTY6lnJvCXFFLN9taD+sYrVjHFxvyBxR5BAoMfKHuDJsIR1pYslG02f64/p
         FUO27/X0phz3jd/frZYrJUErOAeKsUfDRkb8ZmrzB5S+1WE9sd4VJzSYzERG24Ftp04d
         BKipFJ/afKe6eeSg09hpNgxMoKLEzt8VlzvZHDj0H2fUBNisRfgzmNm7jFrl+h434rTb
         a5SHuRkJkn+2Eb0m2Y31Uxpbf0h5d1Kg5OXcc1+e1ENctqe7vTcsaglUdP/nQDpodNqF
         mtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931338; x=1795536138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
        b=RPmNAbGwDAJJiw6rykiDrKqByxcOT0vQtHSr7sD8zaFEhGn256uNIlL+NmpQKmWFHi
         yZinlq4L1QjBDqRfch48FFAn2iWI5859H89d2i2hGPbLOhMi/MwzDfFpJ+I16YXTtQjP
         7kPt3QtV67g0brjC52KbOs+B6tAlv0QZhADeylow7TKqwSdjT1VsdTV/tZ+pSgOlZOY0
         yr12s27VErd285uC1yk6S+08vwYIh68JEV99vKuC42TsN5hP9epBGc5KXpaIlOlCM4b1
         OTuqzhidfC3Ejzo/zBzOAksnU2vG3kwcgFsvGBdl0vdu/BiSVkZYGRllCNRVN5gmjgUq
         yvFA==
X-Gm-Message-State: APuU4Z/qZTMXfahd1oh7hDKQDNWseD49LJsToDR8K0OxdaeyTuyUzMzz
	X6Db1rPOiqGxucQbcfPWhAwMhpVq2zBLZSG0XxRw8vLgZgkhxwFM+4kJ
X-Gm-Gg: AZFdTZcPrXMVFbMKlAUe7/kqj54dYecSG2+9vy+0NrbkW9P5xjFEGUEMU+0SFwnqvvM
	beMbJRv+J7NQ7s9i9+fSYASi7L/OeJErbXJ/F8jW1JP+LbY6N3sklPpeGqfz90n7AhH5Nmfegy0
	UA9n36cFGlyHjn2S6hNERE0Kw9CzBhyu1NyCWF1Hj/t5dMWaFEv7sP4ThiW6cuZ/LooPH4JeDLb
	fzMhbfqoJ0/yLhk0FaybO6Zo6PlJbJ2+6Jtkq8nL+AyU+K+mmctHACxP2fFfUBssYlnzXBHdvnC
	sklMjq0duObidJgabJdjxxgISl3qDVyrNTk0vCE0Jlj2N/f0erAotjm2bOGkBX2vc5eUhY6qVmJ
	F0qussw3BjH4xb1DDzoanAQgSsT85M0tu4p3o2l++AUNc5M+4dM6h9A2NOIKjnWKMiLUm7goQ7V
	/6EEHFgjhsPlen9BbUzwSok7F8Q65M2ouv7b4wqu0Tl1Cb4j5uajFR36IcOyiKb54qdTyw0/y3b
	r++quhxQgytO1bYXKlzo+Gs5ZRIMPufIEQFtxqUnL+yNtYa+cY61a9Dv5F1XrCkXovVnB0Mbbg4
	SC+VNfQEGXS3PXOk8eOG4UdBom4xadkC5wzFEqk2xS7lxQITo2Lm
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr17121353eec.27.1794931338166;
        Tue, 17 Nov 2026 08:02:18 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3826fc797a3sm71414eec.22.2026.11.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:02:17 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Tue, 17 Nov 2026 16:01:51 +0000
Message-ID: <20261117160151.2624-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzgjxzh7.wl-tiwai@suse.de>
References: <87qzgjxzh7.wl-tiwai@suse.de>
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

Thanks for reviewing.

Regarding dma_buf_put(), get_dma_buf() takes an extra reference 
for each DMA-BUF. This reference is intended to be transferred 
to the file descriptor through fd_install(). If copy_to_user() 
fails before fd_install(), these extra references must be 
released separately.

snd_compr_task_free_one() releases the task's original DMA-BUF 
references through snd_compr_task_free(). So both the explicit 
dma_buf_put() calls and snd_compr_task_free_one() are needed.

Regarding the file descriptor ordering, I moved fd_install() 
after copy_to_user() so that the file descriptors are installed 
only after the task information is successfully copied to userspace.

There is a small time gap between copying the descriptor numbers and 
installing the file descriptors. Userspace should use these descriptors 
only after the ioctl completes.

Please let me know if you have any further concerns.

Best regards,
Sreeraj

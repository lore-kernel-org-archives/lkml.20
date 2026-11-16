Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845824;
	b=b/KcYMECwGhv9KlW6pfNJXkBvN2h7LEz/GaeoAI1A0QHGB1XurwJCvgrbzIVL1wa7Rt/
	 Z3t2Gxiy1eqOOdwBcGTkUG+2KKYrK5oT2KCiDjjSJq+Pm5qu43ebje7jRL/IgyR/wjCRZ
	 7UGIgYEOWNMDS7dGoDQsW0PbkIJqu+Bgt/W6DZa7Jk5vUShmJ1ALmu8dJ28AD2DyM+iyO
	 cJdzJehMM1ACGZiS9xy92l96k0YbaMY5Zl254A+GA84nsJm8HsCduMEf8l2PSRmC3S66X
	 1AfjRdR/8sHZMWVGQLjmVc8iJakt6aNJtQFLPrQhhuNbY9GFJshT1fqmfYP7D86cNjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=liPqz8epCyjljLpT1QBmlrbFmvH7FRXxKHhh4XJQc6PFhe7W/GDJODRzvZ41x+A9+qut
	 Erkh6wTnVi1yO7qHkkMrdnOQlnOCiV27ISFzwj8sL7Gss1pg7ijKfFj/ysOVL1auVUaX6
	 yX1GxOXLi+R0Bd9WbpGPTXYfLGPXpl7q2icS6J/v0CYT0xBlKfMkiBHTTKuE7AGyyEqFW
	 +MsmiAQdfzxYCsJT7zgo/n9xKgczuN8xRo6niuZsqBGhfiT/LqhcYl4aOMrvKSQpfe2SJ
	 gsCIGEgRbGW7iHspGnJKvNo+w+rZdvVbqM8xhIQonTokrgIRTZHnq4y4k0LW4Vk7dlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3IWROSe;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C090606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C090606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3IWROSe
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so10211482eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845824; x=1795450624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=R3IWROSevYYlJCVMW7CgW/laiJYHvyfGOiL80q/i6KSOwTTyUAaziXf8UjGJ1oRz6w
         lHE6qnwLOByU1FqRGwzCngmLKdqC1vb59Ra1UuqQWdmOs14DdhZhTVH/d27jameyaD30
         suNwVuJXliRFP4QPgtxigHexgOWEHeR1In2/b4O9agsFPUoihs6yKj3vRifLW12lo+Bd
         wKObZKU2K1Zl6qTQ3Xeb7armaGNwhaMnRPIko/8nXYYFBES9eVG0bvhDRm3vSYzatG+2
         QtDTAVnC+EVgGvywlTxovlqv/jBfC5XabKpYcnUCoPkve8WznmL2wE5X+cxdAAvuMAI7
         NhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845824; x=1795450624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=VohSH8mZ8RyJcv2dw+pzYq85D+DwuSFHLcnFVcoLQ/BBMgiUTedoqHqCl9s2Qepwn6
         PIdZL3x+w0Ewq57wyDgJGMIVA1lwGOJ9+6rwJOBzUJq3X2E8qbZevEeo7miIlM13HNTk
         ZAeVl2sgi/M+jf5uompwVYKCM9xr/PiXP+SVZFI4ybu/8IfO5CxDopKKcLONQQHwynAN
         LXwv2Ya4UqFv7QA8KK64fbLncqYdUU+atLlqPLU6svSwD/Iub5Iq2LuDIrceQEwQotJg
         49ZLeXqJd4aYIsLehVs95an0ASDsTmHiB2HKK3M32zQHV5P6UqLNEqrYoxyTBTK9PJpM
         t2Eg==
X-Gm-Message-State: APuU4Z+Zpbhyojq74Y0xOxJPEwJiZ/xSZLcCOX2z22kazKgE53zjfIZS
	0vVd7GDRcIBH7vaWfEKH1HHO6fAl0SjV6Vdw3aZ5GQvFA5LUvdGfSXEcM7OZ63Iu
X-Gm-Gg: AZFdTZeELJtH+L5piD34ywp0rR8pepENdqkFd470zh7xl25raJrenfoqAzgtZq6jYfg
	bVAGiE/qQtJ0Yx9wAecrkPGxYDKL66F+Yh8sBAf7QREK0PHsr2u/V4GP31iYXTbEsqduI/BZvHT
	0840eTIAo0iFwuA6PQoUzWOufToHB5i9ZtB/j0Y8nbEFx47rqK/zFN/AVkXP7tZnKrs4nwG8wUn
	BlKabOz+lVhSILMR2GGKdZiJ0mLueAYooNfsiQZEAZ4xzGtBrA9jDoHZk07fucY8crhbDVV4c0U
	F3VUPmQz2TqJAJ9xp/9WaFXAaFajGc/P5jrdU6jI0ozSXZz0aa4LTBIpuc6KjeoUsraA4R2Dm7g
	FAVwv3/J4C8VzHtOCmRsD7RiC8Y3jfmg9fEHcRrYwaML4XApwFr6pNzfDIwBmVsf7L0Z6oszC/E
	TS62VrQm8E7Og5J5O1t/FTuzVpNCzfCYdPGZho+vfQUze+URm+jDwRvA7qpAsnk5Hx/od4kwnyD
	h07qAwGp2nmVn0LPHWUDKgTjSW/7iQnvvfHAOGxrjSp1mUy6pEfGV/pDsBBwG1ToC4qEQQ7fQ/A
	rWy6zDqjoW614viBsHJVG5kK9ATA1JTr8bLyFKCuBk6R5kydFLw=
X-Received: by 2002:a05:7301:fd09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37963953f0amr10933645eec.2.1794845823588;
        Mon, 16 Nov 2026 08:17:03 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69867140eec.20.2026.11.16.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:17:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: jack: Fix jack control cleanup on error paths
Date: Mon, 16 Nov 2026 16:16:34 +0000
Message-ID: <20261116161634.2821-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733t0ye2u.wl-tiwai@suse.de>
References: <8733t0ye2u.wl-tiwai@suse.de>
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

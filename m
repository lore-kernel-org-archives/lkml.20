Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657128;
	b=Dzh2TJzrlRatJAQyqS7LpFQMSKSU3yG7VvbYRicmZMte71SaEVorRAaNfcC0gg53sX2Q
	 WTIZsMff0arZtNpLEGEoKLj+BkerAupgHxh1sDjLYvGd87s0fHki3mISl0rjQn0egKEDQ
	 jsxlf4d4vXWKZjbYqYW7Fsl0k/zD8grM00+g/Zb7Xw5Rhwv8uPUR8sogyIoR8nUiKvHja
	 rMve07Fb4myUuCI+8lqInOq8ucOH2wZab0wf0g2m9fS2TkL+jRcV3vip9DhrWBK9GRiLp
	 4AwJBRe9bQEMjBwu3B8y6uqFQWWnqqcZwBWRK1W3S/QIE9U62EjRDZOnE8ZdIzob1EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
	b=eXTMdFFJDFo/E2lUOZgldYs/Xs7DaYS73y1XMU0rqfVljsHEMvcxwprnmETmy7xl+vJv
	 EZ34my9nJuySqz90TWbVLazSvQ5MktdF8boKSClh1rKrsgcfcyyEN7c86VBJbUqaCAHsT
	 ez5xvLOzUM8pnhJZzHCCCGibpOsDqeAAMMsckQnV6+OtFJmumref0JvfC9yM0/nD7KrjJ
	 ANPHLq0bQxvZ7uEPv2DnjcNA5B7y8e32dFqm6JBkHcckzod8QIIV7rS0C5LMX4eIK07i0
	 Zz0CXCmbQcQ9GFjp/1ipKmmzxJ1+q9SHgctiAwKLK/PPcGKT2L307fwBadx2/ceBoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF1606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AF1606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a18fc7a38so6476032eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657127; x=1794261927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=O99SkEkGgX+yDaEspfPEBwygqQ8yh0ngcnnm/iplfx2/07xIvSVgCWc2jc1qSkcnwO
         jwtCw1qWTsbouhE1lPeROQ3bJgD/8puj6J3ZcZehM7KiNfcNo5a15Ea1Tn+iKWQN0xcC
         SVz0yHWR9XOgcrbepl4xvqGN0g4RpL1+2S5tarjVZ127Q6+qaBy9dPX3zPa8fFvAvtMm
         klf9k68dSi0CUQizgOk+OWsodAUtoJTSo47meAdeX/9NRKcji9hdhBcZyU3a7b35XVVY
         DH9AisRVVfLhfy/udG35z2389KxygGWgIF/3F/JYdd2ks6xjup4RnAYhSiRQqnJHS7/G
         9PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657127; x=1794261927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=ShzZDZCZMbTZ5IxumOhn8nFLuLg4ZnbfXD+3y3KaauP5iz6dCoydkCpjdRlxe/UaK4
         aPYTiA3Z51gDrVTZrhZQOjSkmI/5Uk7ZvwoXQRQ3qjWJOPdDqCiFtVR2bSnA/ZpzTxYU
         tB87rN8G9BHiS0XkUfvAiY++TPkzaGEW0HZGTeV2Bj+KYD9AR8b9ZcKDL6vECSkYRRxH
         jFSzsHnC6f/KpmK+oxfWi1sTlwVif6nnLVCssUfRCe8+nhGTrk0ZERV89JTrh5cL8Pm/
         Y2+knAZpsfvSzloYiNXNjhMZMfLeVqxrDk01Kfs9iBtD4KPdfg1P3lrZv2I2Mj8z9aFd
         SVOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb1rMQLo94rf5ytPRstsiZ9M0HPEAyFOrK58HMKsROkyxaisA9X1UiTwZllU1mIOpjP6VZDBbC2Z4TIgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z++V+zQ9V6R9TZRvJj13AlVP+s5jC+pkAIgW6VMhQwYV9nNs0cV
	V+z9qoNOkmxN8xUzM0FBCwJuzQutnEG86wNX1ObRzLs1EL2T2XbRgE8X
X-Gm-Gg: AYBFou1MLgf3zscHd1ePVZTvqEbhLWYnbIGY+AfUrlC6LuRYAO+eiRLPFAbtd1f5Ogn
	VqSJuacqdy3iBfBYPox/8je1G13pqNjHeth7wXIzTcn+CAF7HST7zJeX1NzPE9AfaEdVGImtEvu
	+PtNS4TYyIPZ8n+6aVKA3MDfPtK0dDnZNAHAoyDlhffiac9aJ03dK6nPAV2KU3gVxQI6wOkuwnP
	zUvo/AU2I4DcIlH/0zU4ZH+x+5AjFx+TFiRjXq2TKtYK8UmaWPG9k0kHPhykif0gre9UGbGO7Dy
	VEx+4Cdrx29OvLPwWbHuPOAE7lNlsE/r5OdTmDiDR6V+QWotYJD2ZOTx7HnivBncPM1dZVQr6jR
	RWkuxUhj1xuge+EmmY7aN3Y/Iwm+jJd8Zo//jrkixcGA2qsHY+MdaE2EK7N33jugNqFD+LmHx7Y
	vhFHM65CrbHP/PGYWN8Kz87PpWRA4dWB+2X9euC7uyN2Pkwc30M8HBRgrmtYbhFR2dJfe9hVv04
	OOJ7BnO8ut37NFgcqbq/8Wqj83Y/GoDcrXUcF5FW9cGNky6eD1Z+6g49iCWrbKFkUiqoxLdZeeI
	OuQL9BKV+FRHvIc0JgatiK3xDQURg9xmYsByYhT8mwWb
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr20683512eec.27.1793657127005;
        Mon, 02 Nov 2026 14:05:27 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38470009eec.19.2026.11.02.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:26 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion during power-off
Date: Tue,  3 Nov 2026 07:05:26 +0900
Message-ID: <20261102220526.1755-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com> <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
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

Hi Vishnu,

Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
(TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
right after a decode session. rmmod waited in __synchronize_irq(),
and the iris IRQ thread in iris_hfi_isr_handler() waited for
core->lock. A loop of decode, rmmod and modprobe reproduced it in
round 4 of 20.

With both patches on v7.3 and out-of-tree Kaanapali support, the same
loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
HEVC and VP9 decodes still matched software decoding.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali

One question. While core->lock is dropped around disable_irq(), some
callers take core->lock directly rather than through
iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
iris_set_clocks() and iris_set_interconnects(). These are not held off
by irq_disabling. Also, in iris_core_deinit() the firmware is already
unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
that window meant to be safe?

Thanks,
Joonhoe Kim

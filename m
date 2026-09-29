Received: from mail-yx2-f32.google.com (mail-yx2-f32.google.com [74.125.224.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566224E66AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690069; cv=none; b=UieGcuj4VkHaeMJ/aA6lpSW5dqnGHP6n1XAnbWmYLLPORs10TKY1csVxh46zuLcXVKMZlqohdj534lZGuk8Rd21DjS/cjXBLEiEuerjReoLK8bnWWxDWcxtw0V0KZNFD1pVeEvrgjYRBfhl5J3ekTVug+o/pquLoMcyqPbrYB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690069; c=relaxed/simple;
	bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG0ZCss1JKK1FbsNMmHeENp5WHASIILFIy9SjU3fTRVsP5m2H4Tb2zVEyIi2RgryIU8QWFTZhltIpLc7U9iV3cxDGY1H9JwwNpw5ewGCqcogh84PTBpi8h/MPgiz+4ZY46hQGzHv01scQYE7wseaqYA5Z+75uK8glAeKNePR/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYIZoH28; arc=none smtp.client-ip=74.125.224.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYIZoH28"
Received: by mail-yx2-f32.google.com with SMTP id 00721157ae682-8aa75b33a26so22589097b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690067; x=1791294867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
        b=AYIZoH28nnVLCnlmaqQ3RUUJmKTYGvAHfvkjQCA+naE0ULLZjAnFu88Eba6BPmAUmg
         9abJZqb3xwsJ/zhc7qFMD+Dlvyjg7mnX8AEIm1om2MGxbQXxpgNCJB/gf5X8xVek+eZH
         s9lUtoGSjZJlAl4s9HNW0DBj9oQGx7DFKlqr2iG024jzEXtAN+dkJuqoOFgYK1CDYsLi
         UTYjZo4XBpd/U2uCMBWy7SYusUlwN7na95FljdvGi4TuMfTH3RTn8GUGVgiFHGmKIo/t
         jonFUfpOuCTmw8ldWCIqzxCCeCzCdirb9/K2rqBWkcKGr8dTtS4qEIhfM+F/XYU7l0JF
         ZGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690067; x=1791294867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW9yN3YZmbe25hp94V4rxhoU6iFYnKzB87Z5cCPMl8g=;
        b=Xb3ArhOnAjfJ8Ni7gkkSiwNcN1wKoQX3IviyP4OD7jVw7GB3wgMoipNvbqgRECVGy8
         YDvTNJtaij2Z4LvUJexpTK0e+TYCPqJluYSgEI/1+5WHVFSOkh1IQvVZD6x+gc5KP5P4
         3RHlZiIHloiZKKsjbNBEq8oXsqdY5dOXAyTCAn96k3hJVTlD4XwePGHnfo4VNU1fRNQU
         hiz7agXf7JSPugEZbMC+pIxywuBbbHGBbzjDf3kOhyiA7Z8AtZPxxDP+K5ymzm2ZW56Z
         +o/aNAN8Is8kqqL6YEfCS394x79QdKjTMFemj0AtBEnVp6jCBJXW4XZyjlyvHjAMBjEH
         w3ww==
X-Forwarded-Encrypted: i=1; AKwUvBzhosjh9b8qo/PwJfJeAFVaEGsOs9yABAkkL1Kg+KwwLWaYEjjZFP0xzv5k+YnDwDH/EtR5ZMGrv+cASE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKBawF+cB6tdY3IWMxpDe5Pav2wO8GU2QFA9k2j3uMuc3+sChG
	Gex4UJR8vVVHPpIaCKhC6Hv4pWcjH3fFE8RyUQsK0Kte+NpbgiDpPiKE
X-Gm-Gg: AYBFou3jnv4lC4fp8kfy36yoQUrGuv7s3QvYV8jAWU2MHmjc3nXi8Cdp9ojfTb4xzHS
	b2Zi64AzBJCzo73v0AinZps9KnPSkfqOPD321zToA4XWysxTE1v/c1uTwBauK0fxmWPYqZQpPmq
	ZpupU6VA2DCjPn8GZoII68oufwoz8T8yhU8jBKZ/5J1r/objiU1wNqufWXBYRbozbeJPZr97gGN
	d3Qgd334nrOV2RfW3e4olruIPCWBnWbe1pbl89u60q7qF3SVXVLidMgumY8nK71uLPIbv3oMot2
	7cT/4S2DNBWv7qsb0wBc1qPeyWQFkKADPU40GGrQBXf4s4RRLncchNM8/8rUiRwruglMJndTihv
	tDH8c+e5GLBvQaKyweTrFH/HaWmbBDjgt9CmbUytL/Vf4EFQv0RfHCJ6O6Aj5vtU9ul5XNEzMFU
	8MGqV7asfdq6124/F3Zny7yRgS1xi0jqsrYvKpVAYnept3ahyjfnhC3zESLBeIckQbZzDr8amH1
	n2jHeBQ3H281l5w38sD5TMDgq6aNQITuZdmuPyZphf82TRdUbicIg==
X-Received: by 2002:a05:690e:1c0b:b0:674:1d59:a129 with SMTP id 956f58d0204a3-6741d59b018mr4502993d50.93.1790690066952;
        Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ef31df6sm5943091d50.13.2026.09.29.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue, 29 Sep 2026 09:54:25 -0400
Message-ID: <20260929135425.976157-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929123422.GA349401@killaraus.ideasonboard.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com> <20260928215021.819064-2-jordan.mymail@gmail.com> <20260929123422.GA349401@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

You're right. The driver already sends the writes regardless of
EXECUTE_ON_WRITE. I'll correct the commit message and add the blank
line.

I also missed the restriction on write-triggered CH_VALUE events.
Reporting VOLATILE needs corresponding changes to the event handling.
I'll check the write-notification paths, including asynchronous
completion, and test those changes before sending v5.

Thanks,
Michael

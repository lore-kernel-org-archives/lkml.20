Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6070456E10
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291836; cv=none; b=g+GM413DoXEYrIau1EQ9gYf09fxH3bzPRMwc/RYlvGoh4R4b6lMIzBiD01ChSASDMM0dFUg2+mcA06ZudN50Trj7Nj708cyLvi4poADqxNC3xHl2B+GVUhnvLJsUaDESa0TcGQ35My+EQDGuznPAtsQsPf1ypR91NLKLdTLcCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291836; c=relaxed/simple;
	bh=gokoKorDgBeOWVaY3qpe9kh4x3B9TYxRvkSF94d5Ktw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SzDoRSwjWygR9h5xRHl61HaZyd11Xg8MSuF6ufUtctHb/jidZKopin+LDO1ssYfXl92WgT8Nqhp09n2yzeFCwyvXgPoRpCndnGQh/UcJ6xCyOQrShCoJC+fNy4RtNWs0PyfN9hSDRCdwbhGZP9+9vsnHG3FdAEmGiDArkIJCKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXa89ILh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXa89ILh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so26802855e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791291833; x=1791896633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=En7FMXeIRkCSXxTKcjg0cmpRWFNyaHOnmO3Q3nvCUIY=;
        b=DXa89ILh4CutGYWSvYJJsnnVruLR1l1G4ROmf7nHU6X5SHkWECVVsV1VA76xFJAHfk
         YuHD3hb+2kBNwZxOxE1A0ZfApoBdGPQGSFsTx/tvaDIwZ5j7Fd6JHjkbCPCykpvlN73f
         me6YJMUtucYDZTFEdjKJZYyEHTNF0sx06ULWab1EYKlY7G8LW1SVJcV4W6vjPDAyR9XX
         30sYTohHWYUuz++wIyh7LfDzx3OyjGs4bH+fVAhwx8Qan6YKFBEPDF/cFI+rwz0CQIzR
         3vXU7IwMxPk895Okv7zgcvjxMPfJmPjyY9O4HMDnQt8uwEW3l6geuUfFeLKWEcEOY5Lx
         LtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291833; x=1791896633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=En7FMXeIRkCSXxTKcjg0cmpRWFNyaHOnmO3Q3nvCUIY=;
        b=ZGxlk4RCCfDgeUoUHbpCE8oUknhDqTNol3kOPGRn89QdYnJepBLYN5keVLhzTTEP22
         l4FtsQRTSqyRyK32uiHnZmqIp7h2EwfN/JuZBRJYGpdynxBKnaD5LA0KxRVe6oRH3HNO
         a8HUfK58+xrzr/ESxiiTA31QVHY5obumZbtLO9Pj6g7eoOBAsDgbh+gB5cY9WrXWYdX+
         EBZ0TteCmSvpYv63c+L0llXr2batBlwni1xe52j1sqPRmfFz97xtWTy08RzqA7DXgq66
         Zo8XzHqgUM9m1Z4r6DMFWGcmAKV12fAcprpBcTMZlYxAwbEVnL3JFdD4KU02CcivGjIw
         uTFw==
X-Forwarded-Encrypted: i=1; AKwUvBzumIxowCwYyGs5tLmUMykPfCAIVBtWHoqDj97QDolGxOTW9OFpbjaeICd2yj50PlA7HJUU3WHR0lx5ViI=@vger.kernel.org
X-Gm-Message-State: AFuF++nCyDGAI74vM4IfCnRr0p+kgz8l4FjdAcJR0D27k8hb5s0AFYVO
	MFA3/eKz5ByFLFwsMMPnE5KV19j1ksyH4jESypnkLmMJEOE3y29qx5g/OpENM+L2/tg=
X-Gm-Gg: AYBFou2eQXu3JAjf9LiDiwnQjED+Elysczs6EcsdqXVAPFiH4zpxe02DcFWnkfJUEhS
	kZC74kUrJHCU8WmdJW3IRsfHMm+5YZeVj9bekTHVR+ClCi08l9Z76XZosKqWDcYHqfhCiJaiSgP
	R6bYHHJf3Jfv1IB8nbN+pD2BJSkUI8RQ5rsD/bB7byAGf07MAMd+cMwTCWqdwhdq5AV1mm8XD1x
	WRaU/U3WPO6XHIYC5e4wjH+IVhmJsmGFGNNIQVAvaTA0+NYmKA2j7VQfH0pnrYhEit1u/1VrtAN
	xtb3WcOLkBnLNa/691MCJOOxvvWE2iTycQkIU8GZVrENeFcseFqdwiEZ5I5kkizjvA0fXUGRFBs
	bAZv4R/miOFQoxvqenNWXcZDexOR+4k0QNiu7SWw6L4EEdWRROV0+51cR1zQ3wCmfy2po95LaBd
	pcgKHExlKuSyqgbmTqhdrIC/IyNbKkeuTIumbf2HH/qCnxCn4zNDwryPwETOPDNozfC/2dwDCxw
	A==
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr187005905e9.2.1791291832797;
        Tue, 06 Oct 2026 06:03:52 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm78638295e9.9.2026.10.06.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:03:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf timechart/treport: Fix mypy errors
Date: Tue, 06 Oct 2026 14:03:30 +0100
Message-Id: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPxxGoC/yWMQQrCQBAEvxLm7MAmgUD8iniIa69OYOMys4oh5
 O+Oeiy6qzYyqMDo2GykeInJY3FoDw3F+7TcwHJ1pi50QxvCwPOUYVygiatk+Ekr57WsDJ/Hfux
 jQCL3iyLJ+9c+nf9sz8uMWL9B2vcPgbzSxH0AAAA=
X-Change-ID: 20261006-james-perf-timechart-mypy-e0069393c0ef
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alice Rogers <alice.mei.rogers@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Two small adjustments to silence Mypy static checks.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf timechart: Fix task row type narrowing in goto_task()
      perf treport: Fix profile builder type narrowing in progress callback

 tools/perf/python/treport.py    | 5 +++--
 tools/perf/python/ttimechart.py | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
change-id: 20261006-james-perf-timechart-mypy-e0069393c0ef

Best regards,
--  
James Clark <james.clark@linaro.org>


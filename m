Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364730;
	b=5QgziRmy+NF/vIj4fuMOyaohdEVThdMQHT05WaI22+KO1pM5H8KFvlvK4wXmjQjhCrDQ
	 pbN1IvhNu+F7UIKm0rfruxRrxhojxGXzFGjeQUMr0YBuz3wP5sl3ropFwYlmYiTvPJ1jR
	 ABlgbJevjKoNZKFitIlh4UPUW7lbplHYKamkcRdV+blYcRuKMx53b4463Qj3ZdJhETChC
	 35e4W9NSFHpFexOhEJGqE0v0qd6eU1l4sT0lRmJ97qgZmlo3YpKm7lqKNZXs6y/WJFF+Z
	 RPPVGcD5PoKeYOVxuRkFHa6Ki2zWVmKAo9twSRmRbAlzY02ysQSV9LrB7yPGqnqNwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=73NnDYgtRRq+RR5ApFnv+ewgHDtuK4aFIM31WIpoV/0=;
	b=nDV3MKiCg8uY7QlAsrrDRBbxg/kwFS/iqSS/kMzTnB4pgryg2pqLj3x4NyZlo7exi5Gl
	 c09yJfQMEJ0qVLDhDBBojFtVj3LLRkCMGBYUrLb1LyEqBoXJsHJIbpIhO/UzZiXvMbkNu
	 3HUHt3dt4yDm1XdUeKNZeTtBMwO3wGQeRds6Vfikl1gRAe4ZrYSNK1T6mkSfkL5GOn7e7
	 C9JCthrJdU4CatMxT5GI0o2VTxInf9t304PSzIH53JGnOzibqFuTbrn9TW4hqj8A3/LkB
	 c+2rUzkBq5EMWyo98ag2AjzICXLykiHQMvAHSBMirFxxO9U07uGgyff65QAbZz3d83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6GBc0nF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 012B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6GBc0nF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so567931f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364728; x=1793969528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73NnDYgtRRq+RR5ApFnv+ewgHDtuK4aFIM31WIpoV/0=;
        b=w6GBc0nFTcH1bU9gFpNJz4jKHzL2LRKnugmQjv4u+E2EwJCeko9qkHrdOWIcl6H2xc
         aRdfXuCNVh3dNTF5f20ryGz/vi8a8ZHMHHf0zd8KiVjCaJlHeYqvFv0AprRX7KFLtStv
         yhyycR9X/RwtJIPcf3f4AStCSZ+IUnxMgmVd5G20SRnsSJJ0YdNQYl4SdKttPXreOk5I
         EAHLiUPCp7R536SddUo7wSXkXDyGObo/ptlqbr0AbOek5+CWuNdSOlCTv6/5q44AqE+V
         o/3Yrd8lzZQLQFzRvzt1Kt3oOhYw36JS39XMPhw8ay5J5BLUAUMLuBrfZmVZtlZVR/Z8
         T6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364728; x=1793969528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73NnDYgtRRq+RR5ApFnv+ewgHDtuK4aFIM31WIpoV/0=;
        b=1+ijU5qu/Xe4eGAiPzdcB9GGabOpRvc8ZXHeLoyhR4ULY/+pZXn7WZ7UZAEalhkjct
         K4x85yW1pszVE+RS3Akydfml617SYCOCiMmlFCJwg2Gpad3WXRGE+wIRDq34lwwbNNwg
         xjUvGYhgHVEK2tmP1/13kjOoPbZs/vS0XRd5yQLowjD2chMveIEac257QEuWI+q1Td9F
         IEkMfmaderYgl7CYGdEsIUBieWguwjpbg8z0YsSs7c74nf9szWgkjZMklkIVPGDvjOBT
         rOQ5G8fXPnnPhvjPabqHZNekDsIxVTut/Sq+VJMXHFL9YiggsYzCTRDXOgrYlKO4kgIc
         MiSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8Zh7EvHgKXWh3Pr9zcpiUXRIRN6hCQGIk9DBmIO+QkUi+trbiYsEiGvGZsBHLAFRdO9HKDsNps7+RKvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9QLVv553Zyum24apeCbUKRQiT49/8FvqQJZQW6ifPj3pFMdof
	0IKID2OZLafQ6CuYeSDybvvvvAvi1glQZZb7qowweNZAMLmZzsNCyZ2Z
X-Gm-Gg: AYBFou3hBGKqMMA+9cY8X8zjznoOv3ZGySCpzufXavWh+5NTlWCDUupplYtPwN6/9/2
	V8oJ0/btpJIGcV14zjDGwxR721S/8aAYgNeqE+pzPxVsM3f7q1cxw4tLXWQZXGRJZ1XditKc2U9
	e/AMPZgA1bMkE9ZAETjYBq1hGRCOfMwvVlNaS8kfKrPlKryMYmu1bYRkm4TdUwt4JY+HOhSV9v4
	nJEVekTVvv2iwxHydjQf5mI8bhbkTdZRNkTyXADyRowlWiCdDjfWU7f7ijYtRjDE48Iz+speG+g
	qBd6UEc4OJZR2aH5cHPG2OBapaYd3kMo872XBC/DSJWRs+WBz+MWCBshcQtZtcwFM0/X/5rhm8q
	2NEmL6AHdl6hKbWQA+/BVKVUCrXuLgwkqi9V8F7Hftl3FV6xYVM0mQsyIzNUOBfXUby5ukfSVtZ
	cL7VuUcs/XxmP3h12CSkvn65jnIAmoPsfmvPye1Aqh3FGfCzCI4iL4r6y6yiqTnl5kO156dAZah
	7wz6z0/qCtNOVdbRmjst02CuQGcA2BQacemUpf/d0tiUiPaeDlSm3uRfEINlwk0V2aychIBsvFi
	BHHTzJ4Ri6D03BcJlqq+tkDiHGNBMtE78IxTGx04KHnRNayLZdf9ekDYlptZHhPccemuIBLH5KM
	JS63nd+uUg6Wa4dDxSJJvmOubyMMtmoEtL/GUBsH8VMde98qBFhW6S7NPvu5i/TEiWUtctsNtNR
	cwXMGTV4HCboztgWYxq55BOrmpg1PORCOZRUj10HXR+kHY4tWpOuIOacRNog==
X-Received: by 2002:a05:6000:2884:b0:48e:6eb1:3d02 with SMTP id ffacd0b85a97d-48e6eb13d20mr4529254f8f.0.1793364728190;
        Fri, 30 Oct 2026 05:52:08 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-a479-65ed-4521-39bf.rev.sfr.net. [2a02:8434:fda5:4201:a479:65ed:4521:39bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm3170047f8f.12.2026.10.30.05.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:52:07 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] tools/bootconfig: Preserve tracing settings during export
Date: Fri, 30 Oct 2026 13:51:47 +0100
Message-ID: <cover.1793364709.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Masami,

Here are four more fixes for ftrace2bconf.sh, based on bootconfig/fixes.
They address settings that change or fail to restore after export:

- Event filters containing punctuation are quoted as one bootconfig value.
- Generic trigger counts are written in the syntax accepted by tracefs.
- Histogram variable tracking starts fresh for each tracing instance.
- Paused histograms keep their paused state when restored.

The base includes the trigger-filter and underscore fixes you picked up.
The new sed expression also uses POSIX syntax, following your feedback.

I tested each fix and the full series in temporary tracefs instances on
my Ubuntu machine, running kernel 7.0.0-38-generic, with recording
disabled. The patch emails include the individual reproduction details.
The fixture checks also cover each step of the series.

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (4):
  tools/bootconfig: Quote event filters in ftrace2bconf.sh
  tools/bootconfig: Export replayable event trigger counts
  tools/bootconfig: Reset histogram variable tracking for each instance
  tools/bootconfig: Preserve paused histograms in ftrace2bconf.sh

 tools/bootconfig/scripts/ftrace2bconf.sh | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)


base-commit: 1dc6d173c43e10a1d0ee36b43d0d2f371f4d262a
-- 
2.53.0


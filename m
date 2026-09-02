Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996948A8C7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353467; cv=none; b=seazVx1ZZkS6fo3yhGZYgbELbUiF+byt3XsVp1AgPkeYuS6Be/Mdz0ZYjlK7b3qU7dzCMZcohbNHC7G/ughvR82Ywgb81zs05xMYQghGePcLwVqbMr5WD+fgejtAUOPwTQJYfHa0WvBAYlPmDxfkL0OIn8+77S0FrqJIxt7A1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353467; c=relaxed/simple;
	bh=ecEXFaEnVYmO2e9QRthYzOTSjlkOMF5vYVDqij9XjYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hv2KU49oR/4adV2cMsI/wKMLzjRhMlNwuDzihvb7rmlgu3sYwbaK08r+oiDgrX4J7oMrWyAslWfI/owEyeBFbsbvEfPjjPhj10EqQjbuoZiC1NGcjNaJZR8kYJXlwgpHI6dHXjX7GIu53Qq/hnWMYoU8kWCFWML2mBWmJxdZz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btf7j+4U; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btf7j+4U"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so924873a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353465; x=1788958265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7SlBp/TfciBcHcfPFcBhzWo1fIummbWtE2eKXh7ROA=;
        b=btf7j+4UFuxC8r9oy2GI3vmN7AJcLH+ZVC5qUpgJWnVnrH3eeZYpAa4nN0E6Ck96i0
         ID0ftUa0hkOfzIg6FN447fVMsVs0usUxmeRLlIg1muRyVTwHFIXQbU/gf/bNhkcVdfsC
         gtMJp8fYzxNYjOMJrtrTwUoxtNtLocSOxwehHZo/Qrzc6HO3aoNQ/YdjxqROVdMY+OBT
         70vAtd1JI04F7rcFVTJKdmeH32KwBU9GOSYMBcIWsDnsJEqC8AgxrwTEpxFNGl6EUAY1
         5CFHkIVjuICogANQDEHMVg5Rd6doPNzBGje5QZyvrESCscmAhHFHXTdSi3qLb5NutonU
         rOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353465; x=1788958265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7SlBp/TfciBcHcfPFcBhzWo1fIummbWtE2eKXh7ROA=;
        b=iG5CtgU+D9orITBvnufj2+Kv3R9XXYx2Pq6v4wfG5QMKclotdVdy61Q8MM1PPG/V4M
         TA2E3+u8yi+LR7lhv2XLYbqZ3BjmJSdg7H2wjIXjxRKyKB5Pl+on5CRya43lzzIIXLJQ
         5KxtytEDxb+obeNbSazeFdXHVVbLuFOqPqDLiOCZKmslRzraRmtdL2+7IVW98QD9w3Fk
         K+5b/y3GrS0ii7C+TeKSv3H8pJB7Me3M70dwhQyj1VNs/Vg2b+e6GVqh8xMT7lCLXfhN
         CbyLM782FIh+zUiK9e/J7EQ41tzfUIDdAewLqf3o4OELj7oTPuJH1AzG9+hsd6xJkZrb
         Nbhg==
X-Forwarded-Encrypted: i=1; AKwUvByKj0SiWHBwn3c0FlZhD6QKdVGRU8JBoi9nU133Mk9yc/142rL0GRkp0PkWcV6v6qMvQH6dyuPoORoDDy4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSaOTox60/Ia+DoLfpTvPNcAUu6AojcmE4eSanODYFm4faQdjl
	kWJZg06+Z/a+rdsmQ3VuBlcyWHO4kQPo6PmuNvlWx2UVPZEGHKBBlI3MxvJ3quQs
X-Gm-Gg: AYBFou14K3l2eYmRtTAbL3dlxhD8LAs/8hc3KnmNazKXaWvidfYLoLdKYGfvtuYaIEk
	jaiW2eFYCL1+KMU9+w4MDbax18HlyYewWM6eS9UqdpoSgY+qOSyrn0xYKbPVU3boqrMjogY1WNT
	HvkhUeaykraX030ZKKwMcnivXyUFmC6OQrjasDUYGyNR9752+sUHRhSQryjRsxShglbcTvEbC5J
	KSXSzT6aFACURUwCz44e3tt/bbCEi6oGwXJjg8pRplKgXf1jhdoimXM2ABpxgelnq9JWOaRawbP
	/9YlnPX6O/tOyOdTOIlqrwaKLWjvaWJBqUgLTbwa7Rh3uOh2YWddpCVyC+yajLBqunhmfAWRK9q
	buxn/MbzlfWCZD8lTt+K6bK+hlecDU6CIxP8SmExybNhEkjELpCkOsas5xCsigZ7H6B4e4xKpIH
	TosOQIzfSYT5Reo4BUdw0K0X7kcLSM4bn1CAbzCcaCjLaKh33p/aV/Bo+4oc7CWElXuJGHeYv8v
	WuFDkiS4fEVyEbvU18e/F+GM9/6e4KvicncqpUjEh/Jdep5FEqF
X-Received: by 2002:a17:90b:3b8d:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39aedf55732mr6562063a91.10.1788353464642;
        Wed, 02 Sep 2026 05:51:04 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76463csm11856219a91.9.2026.09.02.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:03 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
Date: Wed,  2 Sep 2026 21:50:58 +0900
Message-ID: <20260902125058.19499-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_rawmidi_input_params() computes err for the three invalid mode
combinations and for resize_runtime_buffer(), applies the new framing
and clock type only when err is zero, and then returns 0 anyway.  A
caller that asked for parameters the kernel rejected is told the change
succeeded, and the substream keeps its old buffer.

The open_mutex conversion turned the early returns into assignments.
It handled the output sibling correctly, which still returns err, and
left this one behind.

Fixes: 94b98194b62e ("ALSA: rawmidi: Take open_mutex around parameter changes")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Reproduced on 6.17.0-35-generic with snd-virmidi:

  INPUT  buffer_size=0  -> ret  0, errno 0
  INPUT  avail_min=0    -> ret  0, errno 0
  OUTPUT buffer_size=0  -> ret -1, EINVAL

The same rejected parameters report success on the input stream and
failure on the output stream.

 sound/core/rawmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index bf504e27f73e..f9cef3c61861 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -782,7 +782,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 		substream->framing = framing;
 		substream->clock_type = clock_type;
 	}
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
 
-- 
2.43.0


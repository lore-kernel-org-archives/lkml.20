Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553705;
	b=x5BkND2unwmDGVisB5jQsZM1A0Ygp1CJHXGLcQP39QlqtpAvMRi40AJDLTK/4saVvJTH
	 J/oCshqDqtGRmv37OPN4fktUP51DkHOz3n3iuDsHsA08tu3bXasXEj8MB5/R7aEw6kB8y
	 76EicMNUnqOxDBkOYaFVTzqeea3zqKRhi3vbFGY7Be4k9sjYE2YKHi0KNZWlvcAbEvNyM
	 Wy6y2q+Bbi8Kh12Y/nhB5r93hH/9hUAW70qmVqzKBFyLG8HwTWPQimZW8fE+r12vmkzC9
	 VIAvyTEQxS7MQARknCAhRHG7qx6+ifcPfMyxzbZe6658HlFUWWJyzZEa6IxCHnsFlhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
	b=d47qoDfuVGzM3On2IBTW10X/NxwAeOkHhbSr1/InubTOSWld8oCKJf8JDn/p7AUN0FCO
	 WkYobYFuKBGUKJOTxAMbKPLawxjsHX+IluDzuRAR0hjiCl8syefnbRPiNjcsFfCt2jVIC
	 R+oRLQ33OF43VZFGgXVJ7nyfzP/iWNqzaPeabS2f4PS3hL+XJkZB/0+sYMI9G1Sg/XlNQ
	 SO3WosacoO9a7nhld0E4bpetXWqiaQZrRqYccgUjrJn0kQd744Wz1l1icvZl1nxYdt0WP
	 6Uy138//dTrGY0GVBPPp+rLJ1Lz32lsyWhmeJxnx0qDQZnntk69ML7YCET3/zMjhCNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iszBT2+n;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30829606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30829606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iszBT2+n
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0dba37a7fso18788847b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553701; x=1794158501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
        b=iszBT2+ng7FqJn+05MOZ0Fqq4Lrw886pC4h1+XEPFO+LTCMR9s0YrcbqRnh4HR17p9
         or6jGJU47KgVRMC6aY21kW8vmC8481U5eQnz/Cs/3LLpvoEqJgiExQbDQg7+ewFIBAAn
         8wKpoSs4BHJPOfj/IptmRRkpRbnu7+0zg+Wtg6Dd0NXj6heTA2BKV6r7cwCA/oIVFiKA
         OUx1x8xtchQbcXB/26TjFvhpgxfw5SeJ3lX22+dbdG3D7vtOn9HyEYr7SXUuzfcjgsDz
         w0dgbuuXZQKOSw1DZZh42R3SizydNNJuDLpY8TclLeyLaScMa8hLZ8GCJJwA3WFtmd4g
         1Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553701; x=1794158501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
        b=2IOOUaHucOX1Cp2SdlfzRxeRPn5sC3nRYzl6/INu8Fv5vSRGzpcW63SF9dQOxt0Zof
         Abjz4oBr8xGljb6Vg3c2Ofcn7yJKDApp2Xv0XWuH4gdGkapMfrVZMd5JzXDk9DnJV0li
         dNwPwqKeTT53L04Ls9fdIHk76AuT+o68fCF5yB7Bj9rghIwOXhbKGJzorBXvSSAGPIiO
         CdKQgykutGtBQVEW7uelToxPuerib4hJS2OBTUFXXLxZTXmO0NCxrPtDy2ukkQkspbbl
         ABNDofeHqx0ArEY2OG83WHtrLSrAe4iHfb3sEIelyU340VqWWRjom9S0jyhdEYjf95H+
         /qxA==
X-Forwarded-Encrypted: i=1; AKwUvBxMHqnzn04ioEiDhjK8aSdmkB4GClOSloe4Vz5erjfbmWYUwSq0m6cVBR6yn042sPYvHj9qEz5aAkUqRV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xda4QtoIkj/bRWiknNT6o/eUACSurrIVthyvv1GR7AcEoG2xG
	BDn41tqDh04uGol9YzHwAbxK+OquGvDLIPPVLU+DPR+6ieanG0jWu10mnO6P86QFbA==
X-Gm-Gg: AYBFou1ctiOO0yymRg02D8XKmLZHmZSoBiiTJzknz/+en3OqMZEZ0cvayYKpdT4wro2
	hWifCV1XGSB0ev9mbUkt0qYLwF77Z9CfJrGgtVBGBmp3s2f4Yo+pfDCXR3KOUvLS8qPSuSqVjec
	tetwEIMQyb+cT4OC55RXmBnuWJk8rljKZCVW9Lfskx2oTEmtqlGvuDdGrsw1B1TmIf/BvQAnCUk
	rM47LenVvYfk9DFuRB8fJXRGELvnvoQjoQolDwf8xt/Pk04rkyr2TM5OBOtvHb1/ddg1TqKVkmV
	v4MQ58OsFYcR67Ow/geDnxefH0mR67yHzilXp0tsA/LKNXZ6s/HZbP02CWy5plK00MZuCmQMFXD
	ko9XM1N+jX6AImKMDSPwnqdkFB8dB/J28LX9Hiorhhs8RJfJy8dqWHosGu+qDU0nygmzmaLiyBU
	svDKnzrj00OamyDdVV6Z8oGrPTcgUJoybfySoMKK/WNIy1J+pgfKTnbG09WrnugB7AC8WZZQvXk
	5HxsGsPXjoCXtjnA0nr2fpzJU4vOkMjoUmSeFv2g32gMVObx4jmfihkWudVAvi0qiw+wWQ=
X-Received: by 2002:a05:690c:389:b0:8b1:447c:cf05 with SMTP id 00721157ae682-8b2b67cd1b4mr43801677b3.67.1793553700742;
        Sun, 01 Nov 2026 09:21:40 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:39 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 0/5] ALSA: Make always-successful helpers return void
Date: Mon,  2 Nov 2026 02:21:29 +0900
Message-Id: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
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

These helpers always return 0, so the error checks on their return
values never trigger. This series makes them return void and removes
the dead checks, one driver per patch.

This follows up on the earlier discussion:
https://lore.kernel.org/all/87jywvyu2q.wl-tiwai@suse.de/

Ingyu Jang (5):
  ALSA: hda: Make snd_hda_multi_out_analog_{prepare,cleanup}() return
    void
  ALSA: ice1712: Make chip_init helpers return void
  ALSA: cs4236: Make snd_cs423x_pnp_init_mpu() return void
  ALSA: vx222: Make put_xilinx_data() return void
  ALSA: ali5451: Make snd_ali_reset_5451() return void

 sound/hda/codecs/generic.c   | 22 +++++++++-------------
 sound/hda/common/codec.c     | 16 +++++++---------
 sound/hda/common/hda_local.h | 14 +++++++-------
 sound/isa/cs423x/cs4236.c    |  9 +++------
 sound/pci/ali5451/ali5451.c  | 10 +++-------
 sound/pci/ice1712/ice1712.c  | 12 +++---------
 sound/pci/ice1712/ice1724.c  | 12 +++---------
 sound/pci/vx222/vx222_ops.c  |  7 +++----
 8 files changed, 38 insertions(+), 64 deletions(-)

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613190;
	b=p5Ua6HLD2S2zC5hYs5+8/wHD1LGySRjMx4VYIbpXU/6CvrA2v2hGkQWXTb29wk+Tk4w4
	 nqkZS1uH5jNaKWuS83rkpdHpZ6IxUYpcdqTbWu32WLQ7Ac16y/Us4vmnOexYpcCF+nGyb
	 1gMfB+l9sJdsH+pTOVFoBIefNOKcTJ5sSZwh6RqUnXxe7Djzzmnq3hpW0yNM+aWQdHF7L
	 oirMrT6mbT1sjr5IsTQiYoYvrcqzpUEgii1MVA6/LTkq3G7/TL+pC8IMFBCIyJS2MluvP
	 n45NSs45lKf75vFLMnwk5olramohcm4KmyoMuu6V+7oUVh0vcztQul30j8oD9ipw5xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwKH1HHqdkQ7zt/Ah5+Ef0sT/6ecww8p/cC3kM3Mwew=;
	b=1FTbtMEikhoGb244KWMROpPVr6WLPcv/Ut6J8zekKY28OF3R6pOw3iw1t/DSoWAA/a1G
	 2LjGEHhE94Ml04dkSAJuupsnsfqXd+se9anbsDn8esrSRCczy0pLk5slKndamimb/K4Td
	 wiROVRvfctHLYGORjmHaTS26x2+jd35YroPfihCQGLFmT4X89dBcEJ1Ij5X1OMcSumFk3
	 1Dy5a6PAuWeyp97STGxnbH3jURjKEcEvJodDjjwWvHvOtBL4S64c/9vZ+O7Rayg6FmyBf
	 ypmvS/XGpA20DuuNMrDDAoWnXSPVEsaVcj4nK6i0j7kmnvc/1YiQQhNQ8KXDN+5Fbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s8OXfRrL;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A957606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A957606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s8OXfRrL
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b18717a193so865645a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794613189; x=1795217989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwKH1HHqdkQ7zt/Ah5+Ef0sT/6ecww8p/cC3kM3Mwew=;
        b=s8OXfRrL1L1xiJZcVdzuZEh8D9oRw8Av2IQr6sMv74zDxldJ2jLVpc4iusN47Q7Rxu
         ATRyJBegvQ3fANP9vMwtdSF8FjyJQFaxgfWaULVq/MVh1yuK3AWi0rkx9SMCupiDJltz
         ZmIRkYpzDYAHf9qXtSdG1UvTKm+Vl3kXv0QY8qWEYp0a1hNKbf44JegHvr5CnxM6QH7t
         zk4klXgbl4j/fDlQV5UD9W/NWRB1dCa7Xk5HtW7bwoOLDZ+ZRrvpuh+EV03WBACcsLXy
         KBXIR7lX8MdRc3BKjafGVGdOc+wZS9FR6UhalrUDixRTCpCqGHiUzNjw9mfZrktvlegJ
         ra4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613189; x=1795217989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwKH1HHqdkQ7zt/Ah5+Ef0sT/6ecww8p/cC3kM3Mwew=;
        b=ntzjwt5GeyE3WhYoQVHblDZy0R4NCmJwbF5IPIpAXgAYO7X89+DzRTxcGrz1t+5yvV
         4fHVv9X9JyqDyVstcE6fyxPOdvks5qxVTVZ2cvWZPqdgROftlxfIDmNIVMgtI4I0+wmN
         +0cOX5481PphooUfwzVEpmGOregiCEzTep3LvjEfqHsozl6XOaM4CJW+UJXJYcOiU3CR
         JkYeL5gmX0FNa1cS7ZBLGXvEts0kSSyIELOxZtlcvHTVhH7mzuCA+Rb9MQaRUewqpsix
         CycOuMeKZXTcWUI1IpHFjvhEgxu6YtBsZcw9dhg+RdujXZJXzTj3JyFMp0j6o+8FYSoQ
         rzwg==
X-Forwarded-Encrypted: i=1; AL+hErFgKDMSiRI8tvBul5TRT/eC/UUp7Qya1OjPpQ20t15/AO4jaMICWJIXK9JiF5CzhGfVpl8QRzA/tqQSxQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q83puKLzzUo70bgjATIUYi6RwwpVe8hwREL9tFz897dg5FjuD
	vrtlqfisx3NefxAHBD/6EvaDYuSiT4l7zFDmUIjKoSarVjZfkDloq+aroMg3Y/elodM116A/Bzq
	eKL3jy9CVtQ==
X-Gm-Gg: AYBFou1mDdSCaeTi54YJV68Nc/JOWAe9RKV0+kbS8eiXaL42d7ADpAVLBw4TgW4dCo3
	5E4SO80i+GhzOa7zFEGxSvVLFESEx0UTwlWlbiJIKE1jSoJvzge3hS62omIygIs9PS8bU0ROaG3
	XKW94ZT/JrEhqeWNsKLzcZiR0IGWrSY89DghfTynAUZyBjCLTNu7k8AN08gub035OUZ0F1Ub6/n
	+D0gqvCJMjNED4IRC2OdrrajWFCIQLxdr3f0LLhBIeDNjqWpdXoKKCfcQ9sTaY3+EBSRWtFIaMG
	k/GgK7a/uQ9V/QbQimYtd+RUN37wLPKI7uTYsqbc6pogB7N1JQUIjZ4OjunUtsPj0vBk+Ugvld2
	X0fKZnhp09DS0xjab/El8i31lqMC0d8ovs1GLfnTfHeU+GFdf30pW0SjSVyn6YT364zsfLLvYvr
	gYvtRlinECGcKnLpm0USNJK10EE6t5uqL64hdRHgQv5Z9u4SYBy1JoLkyCk+HpsduVMAcwRlef6
	CK3vNUyZjBiUFbqDqx8W27yLJkm5JOwmI96xcCTmaUcx+aP8RSGzDifbMzWeEUgSe6JSITFuxZi
	0712DKhzC6X9Um787KDwiTf7pq1dieygm3UFT48B2jPbvQEI9DwSLkEDAb+/O6YiLqfliJXnNcr
	mBuTH7UW1nwMYZtz4J1h8EbJ1VgMDhZmYAaXqIw==
X-Received: by 2002:a17:90b:17d1:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b1b0a3b41cmr4034654a91.29.1794613188872;
        Fri, 13 Nov 2026 15:39:48 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm6442462a91.7.2026.11.13.15.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:39:48 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] scsi: libiscsi: tighten management task completion
Date: Sat, 14 Nov 2026 08:39:36 +0900
Message-ID: <20261113233938.397415-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

1/2 stops the receive path from completing a management task that is still
queued or still being filled in, so a slot cannot be returned to the task
pool while the transmit path still owns it.  2/2 stops it from completing a
NOP-Out sent with RESERVED_ITT, whose single reference belongs to the
transport, so that reference cannot be dropped twice.

v2: no code change.  v1 of 2/2 was sent on its own but depends on 1/2, so
it did not apply; both are now in one series.

v1 of 1/2:
  https://lore.kernel.org/all/20261113145140.282504-1-yhlee@isslab.korea.ac.kr/
v1 of 2/2:
  https://lore.kernel.org/all/20261113232322.395246-1-yhlee@isslab.korea.ac.kr/

The review of 1/2 raised two issues: 2/2 fixes the second one, and the
first - the window between the state store in iscsi_prep_mgmt_task() and
iscsi_get_task() in iscsi_xmit_task() - is not addressed here.

Best regards,
Yehyeong Lee

Yehyeong Lee (2):
  scsi: libiscsi: only complete a task that has been sent
  scsi: libiscsi: do not complete a task sent with a reserved ITT

 drivers/scsi/libiscsi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.43.0


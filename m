Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568959;
	b=yTcYOkBAUbi7mjag4tSHzVTdFKwTJ2VL1vZtYv9keHiIts8kiK9x3j6XVpiShFsCYiWa
	 jVDRIoNtzXE9RUnLZUJYi/9yMJiN/wrFnjqqwHbAhZB7stXQ2ZjVzYdQBmbcKkf0LCtf0
	 L1ZoCybMsWw7PvPu3/7RYKW7ED7dhnykYWTqCNg2CJzCpYeXwyu3IiQfnrKy90Ip8y8ck
	 yK6sBATLLn8ZT7yg7M995JW1M8gg1JYh+zKXCOJrPCtzyrrY4QL915ZobLvkkqmnaUptq
	 udS616HKv4JJ86Y3wX1S+a/rs+K5U/PzqzexbTYTDMMPji2NSq6ctIE3D2lS8rrz5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sbmw4N9ZOrzNpmY4Wy/XZUtKSoT6XgWpn6TeMukDezE=;
	b=zsv72tG81TRqN0r3v1Tbra/oqy4AiWLO/vfNqedkxU1qqfoQnElHh45AU6Nt/+gT4Vw/
	 L38Sb/fGLwnDYlOpdyHM6ukGcCsoq7qooNp35ZmBVThjssyS3vx54RoyuYjXqlcAmXpnx
	 0eNepcId7gz+WWs3HNl5/eWr4BA0ccXA9OIn5OIHHJdPGnRCpgor/37f+YRUgOU/wCQkZ
	 /xANxnaz/S0Eo6rQsQ+gQE5kfrljqJTCtTBLmIgCYiksKle70w04XWtv2idaQ7+UzlXIJ
	 ZVQtVefBhPdh4iPZ2xvw66qbpNkw1jOnhO2Wn5x1cIJB93vhjJpB746L6zfsYxFlP6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20VRQ8q;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787CA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20VRQ8q
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3791619605cso1782726eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794568959; x=1795173759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbmw4N9ZOrzNpmY4Wy/XZUtKSoT6XgWpn6TeMukDezE=;
        b=Q20VRQ8qOgV9X9HGOrJuLcb2+2cJ40HCMkaUTGcg22VvSeVL4A+RbdWBKM5axJ36QE
         HbVSgfTLgsh99hqCGQGMHTK0AfM+1rkYAxMPyq1fHKJB3FWsovdxHkODcw++LVfs2CbA
         eVmmSSDrbcOCs4y0Dmih82RXdGhd/1RjmAc5RHhgMmF9cZhWF2e312quE0GEKdJMENfw
         pKdpVgL4g7/JWTNNRfp1fw2XTDiNsaV4iqSG/8SM8o/ujuHZgbbUAANY9W/Gvc6kKnCW
         sjSeLv1Dw/ewMi2yB+se+bLS3mhq3A1piFPL0twvdLVjbaiGGq93phQGu0AXDWBdE9MM
         eK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568959; x=1795173759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbmw4N9ZOrzNpmY4Wy/XZUtKSoT6XgWpn6TeMukDezE=;
        b=yo2ag26QHChJ9foph1u3KT9HVmqNp0dCYVuDxofusfQS3cTZWBvdTpcwdGCaVOnIMd
         iWMt6iR3zVbiHBlkD8BZl5ZZaOlMf9DKIwOQBZishV3N/PqpePlzDkghfVfr5ltJ7qil
         tnc+36SEOkQjGMNXQhhJeVJsDZBM3M8Az2s7brdoubVq9hnq/iwx6BQdgOUYWmByeqx1
         YsVOpdM16S9qUKkwU5O84d6rpWZTy9GulGX99ScBRQNL5WmxFCS2SZGE3XLmJLfBlMzl
         wWF5f+VRCM2hxUrdKO2+LmCkmYvMxeicFlmn3LbrugIiLGbffRtgu05J5Pnm2mIChk1H
         5Wtw==
X-Forwarded-Encrypted: i=1; AL+hErE3ZheWl3mIfNil3CwLvdMLzhPWs1EjtvIHz/ju8azZrPBACfV+33DuiByQ34UPQHJ14OqS3ZdsgQiztbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MVpWiXpGWj9gvNZ++O16+y/eBz9P2wConFAcRwMQ9UawQBUJS
	uU7+QuaN/6uaqTuWENWSvZzu6cys6VWNDbmX0VDdBYAgStr3yjoe2szY
X-Gm-Gg: AYBFou08BL4FlpMYWqCjiNxAhmt/a4780SFqtddl3AIzMbU9ZKsBoDdB8+0n2PHsTQV
	V698wyUR3RygM8cupgXwWlDfQGNBZYvBeRKt7rQd/4RzD8DlgqlxsAd2VBN7B1qwAE1zxwuGqGF
	/Qy4B+YvdKoyoQrYC44BNV9gLrb4AqLg2+I4RVx8kUo2KZftlaTrd0Xm7W3SNuNffgAasXmpADr
	j7tJhjXqkscMdP3Kb5l3IrWT1tOBj9VyPdbzmvDI9xA+ILJDPZADItoxRmiUzJjoug3ecZLAP8c
	hiWxTj1ypFdhSSZqYfmLCaSRVJttksKAl73lznzevX8c8UXYoOKbKE17zol4XFNz9MsF5VmUn57
	f/L0UAfQAfgVxfItPU0vZsAg37Lqn5N/7V+9b762csU/5MC86MNPDWAu4xkEBZL0b43+wJp+3eu
	r02txPZxfJX25Wk/7ggUyiwhAVSRanB5vg9L2ZA8HuazfYcHzWmOubTXSemGjsmoIqmPIwDVOFK
	eW4qWvbUMP6qF4GA4PfJmmeueNJii/08d3iWWPZS6HR6Fup6OgQob8uRjWulAs0Flw3BF01hJBf
	00EzUyfOUl2zczjCWPx4Hnd5btQ=
X-Received: by 2002:a05:7022:3a8b:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b5031562c3mr2330168c88.43.1794568958594;
        Fri, 13 Nov 2026 03:22:38 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm8374244c88.4.2026.11.13.03.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:22:37 -0800 (PST)
From: Yuan Yao <yaoyuan0329os@gmail.com>
X-Google-Original-From: Yuan Yao <yaoyuan@linux.alibaba.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan Yao <yaoyuan0329os@gmail.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	=?UTF-8?q?Jingle=20Wu=20=E5=90=B3=E9=87=91=E5=9C=8B?= <jingle.wu@emc.com.tw>
Subject: [PATCH v2 0/1] Input/trackpoint: Add new JYT_NDT device variant id 7
Date: Fri, 13 Nov 2026 19:22:01 +0800
Message-ID: <20261113112202.10304-1-yaoyuan@linux.alibaba.com>
X-Mailer: git-send-email 2.56.0
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

The new trackpoint variant id 7 is found on Lenovo Thinkpad X14
Gen1 laptop(Product Name: 21XMA006CD), it belongs to JYT_NDT with
confirmation from Vishnu Sankar in Lenovo. Now it's incorrectly
probed as Generic or Logitech PS/2 mouse.

Add the variant id 7 to match the TP_READ_ID command return
value, probe the device as trackpoint correctly.

I tested the sensitivity/middle button lock/rate/resolution
setting, the trackpoint works well in daily usage and when
resume form system sleeping, no issue is found in my last
weeks usage.

BEFORE:
input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63

AFTER:
psmouse serio1: trackpoint: JYT_NDT TrackPoint firmware: 0xa1, buttons: 3/3
input: TPPS/2 JYT_NDT TrackPoint as /devices/platform/i8042/serio1/input/input8

The patch is rebased to 7.4-rc1.

Changes from v1:

1. Change to correct vendor name JYT_NDT, with many thanks to
Dmitry Torokhov, Jingle Wu, Vishnu Sankar for helping on identify
the real vendor of this device.

v1: https://lore.kernel.org/all/20261102130836.11863-1-yaoyuan0329os@gmail.com/

Yuan Yao (1):
  Input: trackpoint - Add new TP JYT_NDT device variant id 7

 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 1 +
 2 files changed, 3 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--
2.56.0

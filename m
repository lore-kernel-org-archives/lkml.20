Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E330B53F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434095; cv=none; b=s+rFFPUgWOaRyHe6pjeLCFuZOPfOcXA3bMn3troazeJGIZFXydm4sr1Mvva5m9bpeLtIeuBXr1wRX71GChYf85JZzSND/0iGBFNA+7sgDZ4YLJz5yMA+VedWvVkZ9dFR0M0zSBLGxIkdjpaoEeulyfpSxn8ypLAJ1FfNab66Sf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434095; c=relaxed/simple;
	bh=JGYjlMEgD5WnbjjufUoTn4wjOaYAWASOCbxl12i9cy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejvnvlsFKA2TvKOpD+OXBadGEnRXxPONl3+RRlnX3AgJ/4Cef/CdFzIMK44vEm+3d/1vt7LbEIkwOUTw/9QdlzTs7gQEItI8PEFuAsxZLjHwMBBpLqC+BxFuPpBTMB3ePGBhUxyJTDtdFelG96x4vRi/CpYZ2cKfoHuS4WujDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H36ptEX6; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H36ptEX6"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a1118fbb8so239569985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434093; x=1790038893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMu3mYHM8YQYP8LuIfgTNRZj5kYqyGYxw7oJHEX7gg8=;
        b=H36ptEX6C+mgbQhfDc6thTq9DmcL4rSdDKKpVsrfQaNG7gTUfpgeXaw+m/K0e5NoWB
         NxBOgBsfLxRRrBJ1FhxYOVLgaJommJENhWuqlWAhlVF/KXW84H+84VWeobNBLNHWxN1U
         uvbG1SL7VU6jaGN74rEWldJD3YaaAonGnM0I+ohBxI6J7+IIRCEXyko/rAu3V1Sigb9c
         dMNlAVEcUiTdaC6WxeYAl8yt8TttyWezLHKazlW+04W8UVdsdu7YC2bU8PXhsSoVFSCY
         9hURMVyaxyDoVsknkNK1yyPdygtm0SvtijkJU5e2HQFo7fW33bJden+LVEPv/4XXiUtP
         bpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434093; x=1790038893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMu3mYHM8YQYP8LuIfgTNRZj5kYqyGYxw7oJHEX7gg8=;
        b=p0u2BKVB0N09Coz8cM691WKCizT5JrXaFDQjAXlF9chUzQGu8qv6sxsAKkyRDWvqZ+
         U9nrHdjiOv2xEXPONkGQ6sOCQ0PkTwiaRuOxiYSzp45GEjcUkCo3wwyDfqRew6YtkRRO
         jPXDipMFLH2FFQzpoqFMjYU9lGA8KE2nwsI3AxpjYxHDVIBiaTrbshxtqsr+loQOhPPa
         wUcNxnHKngTyGXja19dpSvojRzhGjcMWYKXfY4HeYwyMs9DFNUw3RrRoi+08wi0fhdLI
         0PbAY3qZToYplR1sSU2pecVQ7ATq1o/5V8FGGUFyAc6FaIn0l2vAT17THiBwsA8nLsC6
         ejSA==
X-Forwarded-Encrypted: i=1; AKwUvBydqyUFEgtsKrV+vYBHmi7Ez6UsNZwqb94GhCyY7EKYQLyUpesJ/ifCgdQAM+eWajwT0/2qMrGXL7mJ8uk=@vger.kernel.org
X-Gm-Message-State: AFuF++n7TXFzRlBxNdEHKYiCZfx6riqvg9ctH3yxDMJkb3+c7Xv/KsY9
	1vK2ItAcL/pxvrayXSOObKyCq+j5Mwt3CbpLtu4T+o72m8Jxuqt/WyZ3
X-Gm-Gg: AYBFou3TWwbjHBXdwLIhOsdp4bT9TIYuw4pP030lPDvO7yw51YUaRiarhB11Hrq4UTV
	1KTl2TQ3WY5WvPTsWZX26andi4Din9JNHrME0leAVadYZ7Xw1eF7VW5K7yCT75zcfTF5Y3HbhGI
	7hnhKriWxrB7prdkOB5SaJteqw4kN3TtuN/Tev9JA0qbgaAGOWpQ5AGnN5b0cCvT+MvgXZeePoG
	oLeb90mFRSkY04EIgEHwH0Yw89JSSMStYq8lKVmMB4UVCq5e99Lslzhw1Xyrb3bd/SoaIgKTUH+
	QyYCsLabAucDApVHOgNYzy6GQoBuqMf8/CEVl7b4BN9AJXIaSbsHDeJ29CsJ/pTmOdyAYgcckBd
	OR/By+5sR2pyz0/1o3RA9ZP4Fsye+NCqKR28378fVqszycRe/HgkqaS4iJj8O3/KAPpxx6wtAfe
	dtwecxf0b+nt3XL5uO+CHVdi5JL5puHesBb9oRuqGDq0PjoMgogQz76TIRiFSXoSpDbvEbex1m/
	BejqYEuPsjjh7Iay/s8jaLclxDwfHCYQWGHn+YuZd0DwDxn3A==
X-Received: by 2002:a05:620a:268d:b0:939:993e:bffb with SMTP id af79cd13be357-93a29804240mr793154985a.22.1789434073593;
        Mon, 14 Sep 2026 18:01:13 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm1147705885a.11.2026.09.14.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:01:13 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: hws: fix shared IRQ and video quiesce handling
Date: Mon, 14 Sep 2026 21:01:08 -0400
Message-ID: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HWS quiescence currently disables a shared IRQ descriptor and calls
vb2_streamoff() without the queue's state mutex. This can prevent other
devices on the interrupt line from being serviced and race userspace
capture operations during suspend or shutdown.

Remove diagnostic register accesses first, then restrict IRQ quiescence
to the HWS function and serialize monitor and queue transitions. Runtime
readiness checks report an unready core without resetting shared hardware
while capture buffers may still be owned by another channel.

Based on media-next/next at b38d06ad1e13 ("media: ipu6: Fix up missing
IWYU issue"). Apply the three patches in order.

AI assistance: OpenAI Codex using GPT-6 assisted with this submission.
Each patch includes Assisted-by: Codex:GPT-6 to identify the agent and model.

Validation:
- Applied and built every patch boundary as an external module with W=1
  against the prepared x86_64 kernel, with CONFIG_PM_SLEEP=y.
- Strict checkpatch and git diff --check pass.
- Hardware capture and system-sleep tests have not been run for this
  extracted series.

Ben Hoff (3):
  media: hws: remove debug controls and lifecycle tracing
  media: hws: quiesce interrupts without disabling shared IRQ
  media: hws: serialize video quiesce with queue state

 drivers/media/pci/hws/hws.h            |   2 +
 drivers/media/pci/hws/hws_irq.c        |  84 +-----------
 drivers/media/pci/hws/hws_pci.c        | 181 ++++---------------------
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  14 --
 drivers/media/pci/hws/hws_video.c      | 144 ++------------------
 5 files changed, 44 insertions(+), 381 deletions(-)


base-commit: b38d06ad1e13c32970d58039c154f009b81a3368

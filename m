Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013316;
	b=CiWQUGSKstEf1yWTCaVbhNNOTXu8ELOGzAqmL7G76+d19O7Wu5OkP60OnjM3de1eF5oz
	 MkbC/HWP4bMxdHkcRsQeui15yHakorQ1wlI+bUPtEz1EKcZA2rwRk476ylmyo45pY7w2A
	 qeN1eCaaJjDE/F13mty1tmIti461AB67/gun2im4vrHsZa/+v3Vl2RTXBLNquab0wg8uo
	 aIzV3rfO7HVLHUOZ/YPA31t5xQm15s5nNZHo+otC8MfZG//p+QfEV3qrGu8M/4KsTX6Fi
	 UGfNYj/O83Dtee1ZncGA5wFZ50TMshxNxSFzrafAwhlP5gIW4APqdsUvpqwRJpdidVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
	b=Yq7DEtw2iOsUhwg3aXsIENJHRQLVc44J3AvN0zvwJnnZxm6I+K3e67KOQrMUbO8/rccl
	 mVrk+JGJpIAjO+1sUI1Hjf5D/6JVd5NeFZF4zux4rS+9GagLD/yymus+cGQbW/18//U75
	 q/xqIk9YqOZfMgRsRM5lqbqeWr7hsIlIPhUSlySJO0077f9tPMzW2BkzvHgku64hXdyoy
	 MqaT7ECP4K9DFkS+Q7miWCwvuffhOnLB+ludRuaa+vMofQrpfC/43yvMfqB0DsIr5Nn60
	 4rCFu9FUZa9h4wbR8hk/2lue7aLtbnH3Oz7H+uVsDcOZEyAbY2klhnNTykMfKprOPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SRGpRQFX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BE606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SRGpRQFX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7738135e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013314; x=1794618114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
        b=SRGpRQFXm9zSVjDFtdHcHKivvR/NJIMFHSj8T9ngAoMZQrUXmzTFswGbASyvcwHI23
         Pa0s/Rb3bCgVFKsn5zEurdsKn4h3ylQWA9heXFy5Mhs/OXHGPr3XUgMQ4JPldHz1fdlR
         AJ72wr23VPYe9Zpt8cNBlaifAs+/uWRclfYk0ItVXiIy67AqDv8elL4m1cPs3L8nZbbP
         VWaf23IYTZMqC6G6qYhOX5YXj8ocBMHn+ITPbYXjvtMbkrLU6GU7ykQW+SgG1NTKzOOV
         XwavTErgQel59OZ2gDYR2HQPeEWWZ7DRP5aaHUprc3U2aewBiVWRVMQmm+nm9g7Kz4PA
         Sm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013314; x=1794618114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
        b=jbEMqPtMd+KIloIeOKvWu7y1kSL81fCJuAReVv+zixHYhMEGV0r3MPUEJ2R/qE9m+q
         yIRpH7HB99uGpLe0QhEm+XvaegpCGd9HY9eu2Qz3PkxRZBygsinLsT9VkuFEL+8wupms
         hKbaKVB1XDHrZX9oCDnXdH/myKiQYj6FaAMSbVkG3QFSKDxxcWimhYXw0uXFOlN5Tlwd
         iaKc9r27fSFz3UcWrpDJtj6vUjKMXA+YH9k+ZPCRre6FvLLLRmNuNyt7wwQ0nnNOGqw2
         27tTJlEOFP7D9VceC+O1o8uMnNAbMocJEdEzDNtme0H/7FR8GcqhN6RGVe7ZcY7t4UsN
         F4hg==
X-Forwarded-Encrypted: i=1; AKwUvBxo6sJWo4fDR/Qis4Xtl7Rvdo2QowszNBwN/+VnRLw7ORQ3myOUeEGZJO72LI0cVK8ZRq/952X8Qxp3v18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gIbZyWtelHEP2Q3Yj6F4p9X1etvBB09mS/BI7hoHwHusw9xT+
	SbE+KMmeb/ns3WMx1E6Se9s368EqqtmnxBoAzV1tQ0fp4VIBFG7/L9NXZNlazisdq7g=
X-Gm-Gg: AYBFou01T9bp/b4sjzamiBxlprgTb9d442eIgvkOSkVT+yAVPJ/U/5zdbhFAVJ3iJr2
	ANng4ZFwzFCLc2ph9p0FfzcJTCxzBq0hMjegDF+Uw5yb6q2E85VhjmjO6HC/0rwoomNkjzLmao9
	RHZ7ZtG/q0g4w24hcA3z4NG2JCfEPrqnI6orMtAGny3gUw3r/ek5ACZ6eJgP/yuKvlgcDm5NUbk
	LR9LcWfWte65ANRs2r99FMCVz3t1zvosEUDpy9ZZTirnvTz9Dc75hqj9sIAZBqdKOExai9zf3dY
	behP7bizEjtjNfkOJ6QJ2orgUqyIoxkCYD7wAHxw/x46uGReLQ2QrZhxU5A8cQ1U80xdPdO4gSG
	1uiykstajc/aWj1hgqdVfkJ7EoI3WeSXlzlbPore5yKqVSwocLw/jDTRdR6+lhW6JKPVdgtKo07
	gl5JQoHQZy0Ok7BIp5XvXSXrlaHCHtKdHtlGPeI+4Rzw0pw07aLRtMTJtQLTu0U4+uFSrLuuG2Z
	OXEwghMzx32RHjuShg9zbVb3DNNzvwpUwEDwiPb2OMC0uy8j6nEiWyk4yaP8kZbJ7uaQPFrVMrs
	OQjk0UtdR+v6DMw6REYPkg==
X-Received: by 2002:a05:600c:154a:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4b6dfbac630mr72715075e9.20.1794013313976;
        Fri, 06 Nov 2026 17:01:53 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:53 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v3 00/11] Add SOF sequence logic
Date: Sat, 07 Nov 2026 01:01:43 +0000
Message-Id: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auQrq0pA6XWlfcwLqAdoP4U02IjI
 dzdFhfGGJdv8s0zM/HoDHqyz2biMBhvBhuj2GRE9bXtkBodmwCDKmcgaSivQFtX35D6ySrKdNU
 2sqybCisSr+4OW/NcxePp3f7RnFGNiUmL3vhxcNP6MuRp918POWVUF0JK4Fwqvjtc0Fm8bgfXk
 cQH+ABR+AUgAsBVg1rUQkD7BSzL8gJKO8LgAgEAAA==
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5459; i=bod@kernel.org;
 h=from:subject:message-id; bh=HW+7M+gYjZKVNt79/g6HJ64pp0M5Oy6AG3eJDGTc9WA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh7mUqa5G2eGqvRmaVUmVTqE6en0LdSQrJQs
 aihRGZoZ/GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54ewAKCRAicTuzoY3I
 Oh86D/wJkk5uCftkyfmVBjvjzPLSwRBKiuc0+BhJMAoucD1vaPzY2kOdvDhWad6hlFCMkKLS5XK
 YebcDZJf+HbTVR6jUmpv9XuWmjhvqqYlWsUvPKrdQRH+IBuyD6o9t0Y7hCjYI+3L0u32S5gIqtJ
 r8EZKIjvjQUZLy6s8nIhC6GI5GGXKsWABTPfHN1Asvp61//oevifsG8TsVmps7osuyegj87AUPy
 CwHKf3iDkjsvICTQpsWceLVFluxEb4VZiTG5/pQSsTyVytB4vs7zkrFXv57MEnTkqtnI3lbXfUM
 0+0/zlIjf2fSxmP0juho1x4JLNwf5dokdGKxEoqWHK1Vf/cUtVa/Mvr3r5nVXgkYSJe2ARjAoNg
 TnrJVzeO8wg4IBuR1wGBbhRyFq6tOs8WFy4mK0cATrKJhGxDVrrhvMMFOX6d3mm8F12JcCkNwI0
 z7HkbiJPV11zeC7NpRqnSaWiu605deXTan0Aez3WvuoLDb+dr/6dPc6/3jdvMbVz03aoxp65icq
 eikpDGWrl4326fe48oFATrj3GG5d2DABIpwy0L8o6UOH55hQcUeE/koNbGukKgnZfE5btrK2nKy
 idYqjhBEb8VY006Z5wFUqSc10ZDjTVyt1FIsm7b1tPDHL1cdiUVgOp3G1noxv/HYP35KoTLujJ5
 6x2DWj6R8XOmzFQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v3:
- Added CSID-340 patches from Loic wit permission - Loic
- Explains the initial -1. - Loic
- Drops the .id field enumeration - Gjorgji
- Accumulates RB as indicated.
- Link to v2: https://patch.msgid.link/20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org

v2:
- Amends series title to drop EOF
- Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
- Moves QoS into pm_runtime() callbacks - Loic
- Switches on vb.sequence change for every SoC the silicon enabling code
  supports - bod, Loic
- Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org

v1:

This series enables SOF AND EOF event tracking making use of both events.
Whilst the code is actually very simple the functionality we want to build
off of that simple code is not.

- SOF
  Serves two functions. Firstly. Informing user-space of CSID SOF events.
  Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
  User-space wants to capture this trigger because it allows user-space to
  better align the time a frame begins to events elsewhere such as IMU
  event timestamps.

  That functionality is directly applicable in this series.

  However we will also build on the SOF event in later patches to allow us
  to begin programming of shadow-registers for the next camera frame.

  When the EOF event happens, we switch from one shadow bank to the next.
  This is only possible if you have the SOF event.

  So SOF serves the immediate purpose of timestamp alignment in user-space
  as well as the 'evil plan' to trigger off of it programming camera
  parameters for the next frame.

- EOF
  EOF even on its own is useful because it allows us to increment
  vb.sequence for each frame as per the spec not just when we have
  buffer-data.

There is another purpose to having an SOF and EOF event with sequence
numbers and that is.

User-space submits a parameters buffer. Kernel accepts that parameters
buffer but can make no guarantee about _when_ the entire buffer will be
applied.

So when kernel finishes application of the entire params sequence the
returned buffer contains the sequence number - from the EOF tracking which
informs user-space _which_ frame vb.sequence its given params buffer was
applied.

Similarly when kernel produces a statistics buffer that buffer will have a
sequence number - and that sequence number will align to the frame sequence
number that the statistics describe.

Thus SOF/EOF tracking is fundamental to passing parameters, returning
statistics to user-space and for the IPA algorithm in user-space to
understand which stats, params and frames are related.

The first patch in the series addresses a corner-case when a quiescent
system can take quite a while to wake from idle, too long in fact such that
the SOF event is effectively missed.

On 'normal' systems doing lots of things, this is not a problem we would
see however on my test X1-CRD system running from ramdisk - there's
basically nothing else happening and the wake-time becomes apparent.

This is not strictly speaking a bugfix since right now nothing in CAMSS
cares about SOF or EOF so if we take an additional 2.5 ms to process a
data-buffer on a fully quiescent system, that's not the end of the world.

OTOH as soon as you start to care about SOF/EOF then missing those events
is no bueno.

The CPU latency value chosen is 100% stolen from IPU7 which seems like a
good starting point - the stealing obviously - and happens to also work.

This series is really an enabling series for more work to come but even on
its own is an improvement on the current situation.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (9):
      media: qcom: camss: Introduce CPU latency QoS during streaming
      media: qcom: camss: Introduce SOF sequence tracking
      media: qcom: camss: Use SOF sequence tracking for vb.sequence
      media: qcom: camss: csid-gen3: Enable RDI SOF driving
      media: qcom: camss: csid-680: Enable RDI SOF tracking
      media: qcom: camss: csid-gen2: Enable RDI SOF tracking
      media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
      media: qcom: camss: Switch on frame_sync_en for x1e/x2e
      media: qcom: camss: Switch on frame_sync_en for csid-gen2

Loic Poulain (2):
      media: qcom: camss: csid-340: Enable RDI SOF tracking
      media: qcom: camss: Switch on frame_sync_en for csid-340

 drivers/media/platform/qcom/camss/camss-csid-340.c | 39 ++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss.c          | 65 ++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |  2 +
 11 files changed, 265 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod


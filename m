Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627819;
	b=zN2RKFfb3RezK2vnt5lZgynQL2B9cKSVSQTaS/3glrFYNxeao8eGHxYitkXZ1HKYyve8
	 qdUO7UulqYTlNGflcBvXnyxu0sD7ccDc0P2pQ4vSECbxX4DGZQCOuddiC+eTTmwGduNDe
	 vhm7VjPqj4PX4eO9ZfsHJB2522MmMHjOfHXCKlnIeoBa9ibNwoPlgp20jzuHBvWlVmFWx
	 aJCs+PTwm5MxKKsyJWmxwLYuboB6VEoRA9NynhohsnvxF6oRf7ljNxKTv9148UmYqUJb9
	 TC30FVM/qk9qbeL7wqmU4Jh9swclXCe5G/VT90K2LKTo6IpZiAs6Bt+3osrljQH4cXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
	b=K7ZSbv3E+jeMQsHvoiv6eIdj33GN0m+9Qxz1HZpCIVvkI1LyPXekCFTyim3pzK6ILLgQ
	 ruAOOoAe7BtUZUOpe929QeQVEI2bOJfiwi3MwBTCHMv+T6hNgJF3xjgZXGUSa27xXQi23
	 s4duBX9CbB25hI6qE8axeJDk1ECBzE+VKFTmmOBEH5ONJT9yf3MAAduhqeyRY9J9gBGSA
	 UXfhCayogP3MX1s/bihz1gGrlo3F3LjFIJC38dKT16ko7WBmyIRpovvQSPqKSGbjI43af
	 IPoZwM1X7ic9F1GTRlAhzbKdLhaEAdwmhUocpaFG5Flt7NPPzulLgcljN+TBIf/mqTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pJ4wlQl/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1AA606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1AA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pJ4wlQl/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so27527485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627818; x=1794232618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
        b=pJ4wlQl/Me2ATwWzF3oHtLuPfjXwBefpr5+D0KD8MT10MZw/KS64KNcBi/QWrmbIKw
         b17cqmXFDAC3Fz/Qin4pn61o8Ymmq92u40bVwYuE+hM83JioQoZov/uKamA9CnmtbnNc
         ZSSVMIgUYsUfjgP4laHZ/oQa9IYhsF2lmPBSwXjL6j0sGCzoki5c5/0lQwYMPsIsv5Bf
         ++m9wZ/AlsNTd19jVsytwulihvkiZ1LwJNjg8r3IcvYzwSmEHgr8beOxyMaYXTl7YEJU
         MClSKtbmYa++/tWGkjzln6zXQrl9klD9ibQ1XS6rfrq1HZPpFDNSeBrF9htKVT02F2q+
         TEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627818; x=1794232618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
        b=LX85X5T3hlQkW3ZJSrhUrMP9ZZeSIYKwvOACal2ruXplOihr+wUQf2Rz6RNLy5maPt
         par4YBvTEEW9Xm07FU3eM8MRYzKDlXSBmse7Ckvg5NbBUMKdsXx1lYCKutEE9aIbmpWB
         IQCx14NzTBWO8+LwejitVW0+HmFmZJHvaX43oftpofFD1iszmUfv1x+/v0CJtTN4w/Bl
         cmhoUOAqEHy0IHlGVk39tQW8IKj0DuWbfG3RSsL0aWOUqXn96sOxZyWaDlk/LrPrl93C
         pfE2E7WNg6p1HXcJ3IpvEEJyOWAcHXdeBs8UWKxtiuHIWS6JbC9Os3GSZEWBGxa134Dl
         5I2w==
X-Forwarded-Encrypted: i=1; AKwUvBxQq7V5D+grtfacErIR/XXRr5ZO2Dn7q7I5bk7ha0n95uAhnTCGbi+uxdfqxt5cyxDdlkxR4kfcuqCOQ6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwo7Ztih3oyBdYH8itvmqhsKfEMbm1ZjRGWDuO99bNJ/G1K25f
	WvXwTOGidq9Cx1cRgsy9uIHIaptTbDEdeunPTlZsaPG0TuT25RaloBI2WR8HNfs1ses=
X-Gm-Gg: AYBFou0/emme9WQhOu0DbDl5Ov9bgquDd+WCqju9tq1qFMbPd195jD25T47loQQTE7y
	J5frcBD7xHrERaWH+Qs0zU2bl/py5B58Hbxlze8Wc4Fu06qsv6/aRN3xQq87PpGGWh3vqYG5o13
	tnYGktFRkt9itiMxPY35FKqLMjrPUoq/OJ0FlbYxP9fTWqB6BlZktJCVEbNtUwldi6CDC2U4iuZ
	t9CTngo42pJKancBwmzSaW5+By1V1DB6+aIMPgvVlVU4clBd6k9QZsWvReAH0s7rz4dUxrqHAP2
	yuZE4cq74tju5d21w2/K1GdPTH2JyRRiJQwMzMKuqjB65ANtl9T/o2eluLauNP/5uQtNjOpMhWX
	WnzPYcOSYRBQ1Mg55xH5lExz+v5mMG9hGKLktSk1K/dkAU29UHfIYvu4z82EILQgLfclO4RNYyC
	hVbkfT8GS1KprlJi6XHE2YKRsXYiqwsI7fOI+cIDmUHEU2NRF/iyluYMW0dvS0g69NsK/aKXNjp
	uiuYDv2GPD33gGNtLGleqRfd7Zn/n9l/TX8912nQuwDl2JmBnZjJYxGta6rnQMrxeY/hD872sL7
	rDhGfEB/meraZZvh8g==
X-Received: by 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr221885265e9.32.1793627817835;
        Mon, 02 Nov 2026 05:56:57 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:56:57 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v2 0/9] Add SOF sequence logic
Date: Mon, 02 Nov 2026 13:56:46 +0000
Message-Id: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhSoVpX3sOwgDJAFYqZYiMhv
 buAa5cvef/9BTyxJQ/XZAGmYL0d3QrykIDpStcS2nplkEKqVEiNIeslNlwOhH52BkWtmkpnZaV
 Iwbp6MTX2sxfvxY/9u3qQmbbMZnTWTyPP+2VIN+9/PaQosD6dtZZ5rk1+uT2JHfXHkVsoYoxfT
 aIu2sEAAAA=
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4969; i=bod@kernel.org;
 h=from:subject:message-id; bh=B2LuWUADjK0BpKnOHaWJjWfv7afYZBZdacsyLUUC7vU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JajX9rZkB1r7mLdmBCvw6dF+pKDUnVutmRQT
 fBjK6MqEjKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWowAKCRAicTuzoY3I
 Os2yD/wKaDq4dNDib29ewWY3hrTMDa5+VluTqmDooKZrbnpyawQjh0QIJM21tIerbGjJ9ctYit+
 2q55x1yHm2U81HrlAQaERT0KTmtrRu+LlQNXcoiR3AZs8utmTdtTAtdzAT6cEdR+Op9B2DYRidy
 bbn64LLZS30hLbspChgCfUZbcrwgwie556n9G6Sc82s+GhFYp9Y5nuK5dhva7BT3z83a9OE5Cvk
 RZVmG+0MapSd2uQxxwKEIzn6Njz4wfDy6mbL/GprX1QP/e8ERZ2L2UPm2JdxkmcCSKV3Blus4ac
 BhHXESOywWvjY0f+sxK8LpTAhVjEadpMsAoJa6ymIZCnBseMZV1sRR5PMLKg+PGCgfNFSw5OTmb
 uY4FC5NxAialon6ANt/177iW/slulu6Umo7xNoKep8ps8iRauyCFgNaM6Ev46GK1+4vh0KWdzc+
 ZmulbDh7OPK36nXTnB2FjMCSTnQ4TEVzWDUVXDyMDxrF2V+XB142uvbo7cpRJv+gPMJqVrm9nrA
 SCi1O8w2nrhu7C9ThqKh5HEt93hETBZU7n3AS2cPbhMLHf2/ELKjqUfCS2Cf+590jZ3anJTaQNY
 Ywj9qJoJqIg76hkEXuQUYIDKoRaf2PENRLTORTr/KVE0cdEwKNaIvUZhRU4D9b6/+4WPblUhafs
 lqtubpsXrBLBUsg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

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

 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss.c          | 63 +++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |  2 +
 10 files changed, 225 insertions(+), 4 deletions(-)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod


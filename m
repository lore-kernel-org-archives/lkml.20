Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A451D63E4;
	Sun,  4 Oct 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082734; cv=none; b=MfbdfMki13zJAT1RaZhOwFpyGn60LBYUlK2pPWfGtrysqZMSYOMTpFHplw79X4XNSwaSqpUeRibEsMpMnUyRMCDjRwCjy2nWbjOv0vGJwlTXBp73wS084hnNjMC8PRtOiXrZK6ChSI1UhrxxZ9rncqVbf1TldqwFMO4FOwHLiNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082734; c=relaxed/simple;
	bh=KzjthnmCLYw64a/ikn+1bUYSwFtrdm5q2IQ3Uug6p3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t1/PCt2W81bdtdGBxary7c30ZQM8UDFDN3wVGr+432+HDp12AiIm/LiJGZYHeRyVqtTY4BN6fzlFWTSAS6/w3V5K0G7/rAnIadqpWinjajc4NHqfSWkp5JWe04qfBVbE2T6lqDLA4EluyiWokRnoW6mdPiy3g1YP3ExqE1B1DxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YedIszkT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YedIszkT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5DE7C2BCB9;
	Sun,  4 Oct 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791082733;
	bh=KzjthnmCLYw64a/ikn+1bUYSwFtrdm5q2IQ3Uug6p3U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YedIszkTeDiTxDLJjigozoCGJkjzb0Cckbnmu9uYbIWgTh7Y9lqYhw5Mx5PBCnnmx
	 i9Pg2x86hgbw/lunLsaAG3eg5AxCcdmytcO7CvSzRuuxr/fw7JPbx6LfdFYzc4ItdE
	 42d4qM7B5lCptAXeTMp21GA/g9FaUD0tJZgPLryYxQ/JAk9imjzbTIfdWgSi0eHc2k
	 hyFPyu8FgmllCWoHdYCjx9Ai2JnoJiWoquHWzNy2mWJkhtUJNn1e/xT7VHz9vjsDwX
	 FeVIqa6QwD0A2WKiWhPUlrDDzA92zKeNxm8RsJvW/Mh1H5RYvrasU/8kuqCCGkfKbt
	 o5zdFEAWBCEGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1046CA5FEF;
	Sun,  4 Oct 2026 02:58:53 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH 0/2] usb: typec: tcpm: Make tSenderResponse timer
 configurable
Date: Sun, 04 Oct 2026 02:58:27 +0000
Message-Id: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPAwWoC/x3MQQqDMBBG4avIrDuQRrTaq5QuNP7aWRjDTJCCe
 HeDy2/x3kEGFRi9q4MUu5hsseD5qCj8hriAZSom73zret9zDmllQ5ygrLC0RQNnWcFN6OAx1PP
 4clT6pJjlf78/3/O8AAMMS3lrAAAA
X-Change-ID: 20260929-tcpm-sender-response-time-5c8e2ea3fb70
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791082733; l=1243;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=KzjthnmCLYw64a/ikn+1bUYSwFtrdm5q2IQ3Uug6p3U=;
 b=eDgZfQEI2dz/Oxx5eLj3uKc8L/d9Qia/wBN6f4/T564Ajq/GB+dD5xDZ2hc+RNR8Hy3ypRK4Z
 27FNvV6Sf2EBu890+MLkOnXz3RRTCUY7SA1g2Ip8Rv9jboTlx/A5kmJ
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

TCPM currently uses a fixed, relaxed tSenderResponse value of 60 ms
(PD_T_SENDER_RESPONSE) for all typec ports. This series adds an
optional "sender-response-time-ms" connector property so that platforms
can specify a different value. Ports that don't specify the property
continue to use 60 ms, so the existing behavior is unchanged.

Dependencies:
Patch 2 ("usb: typec: tcpm: Allow configuring tSenderResponse via
fwnode") depends on patch 1 ("dt-bindings: connector: Add time property
for tSenderResponse"), as patch 1 documents the property that patch 2
parses.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Amit Sunil Dhamne (2):
      dt-bindings: connector: Add time property for tSenderResponse
      usb: typec: tcpm: Allow configuring tSenderResponse via fwnode

 .../bindings/connector/usb-connector.yaml          |  9 ++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml    |  1 +
 drivers/usb/typec/tcpm/tcpm.c                      | 35 ++++++++++++++--------
 3 files changed, 32 insertions(+), 13 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260929-tcpm-sender-response-time-5c8e2ea3fb70

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



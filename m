Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FA3C9893;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114305; cv=none; b=VpCZENxqGk4LKh2Z5gjEf0Llv2HSCln7Wq4fLwt54GKLnxnEsLbBoFkRwYrLCttqcCGjtGSeGw7eIDhclHq5UsOiXIBt1RNfI8Y/AeLtNme4w1DazyIR6palBS19tKbhKupQ2AkwaP0QAyGRQRqU0Faudyzn+4WP2YeXAnI/y4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114305; c=relaxed/simple;
	bh=FIAqnorCi9b6ZDIiLe2fPgLdT+wwdwn3qsmraTcLNp4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZiolLf/1PpDfUVbxkuINyGQASaqbhrc5oiurcxsLgA9kiK5DoXBceJyoqf/cgXZLBVipFsKPOLqYrpZb4yWsdDKA0kY8qEXiPrY7cJFpcZgXp0zoyTYcIUFoSNY4iLw+t/P6Vd5CSRxA13OUhDZLqpXbp0w578FeuWFLdZe1Gd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxnozbqK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxnozbqK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EA7AC2BCC7;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788114304;
	bh=FIAqnorCi9b6ZDIiLe2fPgLdT+wwdwn3qsmraTcLNp4=;
	h=From:Subject:Date:To:Cc:From;
	b=PxnozbqKHJRN5H/Gk/P0zpUvVd+NPsXiRc2ZZKXiKlBtJgXa8vwdu1Zj4ftHGSGuS
	 ay93q4tlY/iQiRNAybvlnrd4hXyTVS9sd1edUK8VonVi3AOOrYCabG9o+yrr7vOukX
	 5tsuniS36tfak1uZZuE0IBTyOpTIG6iREaz0ySSiFl+pFgKKfaJpoQRdrqwrmRjPHM
	 xBSmgcSl2XZ1qAjLWs8xSxFXbJL4SSwbX13sq1ss+j1smhq8uHEa+wTyCV3XClgeaH
	 kOLy6aYGP54aN+RV/z8eT32vIicgnjIIHGYWnMJDskAGz526ZwIjTkEWCH8+/CM45/
	 BeG3Fj5sEL5/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534C3C61DB9;
	Sun, 30 Aug 2026 18:25:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/2] dt-check-style support for indented include fragments
Date: Sun, 30 Aug 2026 20:24:53 +0200
Message-Id: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB2IUdrqVcRFkpnWqaCSsUUQ7
 27U5ffg/RsoR2GFJtsg8l9UpjGhyDMIvRs/jELJYI19mFdp0FdIi2LoOQz4lhXJ17X1zrgnEaT
 bHDnNV7LtbuvPfzksZwf2/QDYZuBadAAAAA==
X-Change-ID: 20260830-b4-dts-check-fix-db992ba0a7dd
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, asahi@lists.linux.dev, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=FIAqnorCi9b6ZDIiLe2fPgLdT+wwdwn3qsmraTcLNp4=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aU0oqa+vqt1nl+H7ySd7e5F3vVP+Xf5jczY4Edx5v7B
 QZ6hpM6SlkYxLgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABO5pcPIsGXFjUDm/EcMzXcC
 ytxTrx49/N7AuGS7y74NjI8XHuLMP8rw3/Fg11PRtJNiHxji71te4rF5OiNLIM0/8PN3N+ec8GZ
 LfgA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

Some .dtsi files are included from inside a node and carry the
indentation of that context. This is e.g. used for the multi-die
Apple SoCs and dt-check-style currently interprets that as part
of the indent unit and reports spurious warnings for otherwise
correctly indented Apple and Broadcom fragments.

Teach indent-unit-dts to detect and validate the inherited prefix and
make indent-consistent account for it as well. Also add fixtures to
test this.

With this all arm64 device trees pass the relaxed checks.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (2):
      dt-check-style: Handle indented fragments in indent-unit-dts
      dt-check-style: Handle indented fragments in indent-consistent

 scripts/dtc/dt-check-style                         | 72 +++++++++++++++++-----
 .../dt-style-selftest/bad/dts-fragment-indent.dtsi | 12 ++++
 .../bad/dts-fragment-missing-prefix.dtsi           |  6 ++
 .../bad/dts-indented-ref-node.dtsi                 |  6 ++
 .../expected/dts-fragment-indent.dtsi.txt          |  3 +
 .../expected/dts-fragment-missing-prefix.dtsi.txt  |  2 +
 .../expected/dts-indented-ref-node.dtsi.txt        |  2 +
 .../dtc/dt-style-selftest/good/dts-fragment.dtsi   | 19 ++++++
 8 files changed, 106 insertions(+), 16 deletions(-)
---
base-commit: a23cbb05744b22719efdc34f9e329a120e81e617
change-id: 20260830-b4-dts-check-fix-db992ba0a7dd

Best regards,
--  
Sven Peter <sven@kernel.org>



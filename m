Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFDD3F65E6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885110; cv=none; b=uaft11LcAw5ZmxVUKpjW8ZwQ+yROZ60rrubIj8E6z+EgkOH900shT4xVxN/n+3xj5FBF4BnrRnD8w610IwqtFCMnKExuaPKUGjAMEzjkzlHS308d03XuCXAblbZTqO9NLciqCXAXjB4pxWiOo0xyg7zaa1j4mUI9RuLW20TZA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885110; c=relaxed/simple;
	bh=dHEIKyHkEbmgyD3yGJZEbc8VgVgmEtWsEafFietf1c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKxJ/LcBlAL7vmni/SD0o9a8nnYpe6MfekgDiGdv0FcqzKxt8fIoGGWpi7V6WUVRIT4lht2rlRXZWrYphLkI7Mw0ULLIOjyxLLw4vokEjviQkJN3Rid5gedVkSJI9OBJO6q5ReYsjhI19VRp/L/6xMaNToRpjpmMNaTNlVLiAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POlZuT6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POlZuT6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFBF1F000FF;
	Tue, 13 Oct 2026 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885109;
	bh=GEPnN67xIjNyW6GUfi5rcPqnmAW2zKV/WUat138iIvQ=;
	h=From:To:Cc:Subject:Date;
	b=POlZuT6HZjYjjtaNdYWFU/A8jqiqYRHxPQX+EKEvPMVUVrDhXKX1OVnFzoSRIhNdY
	 90iqCRNeWS3kO6cvdRoqJsfqxbaQOUvRymb0rNSmUMaru6KjLhSbuZA+FiqRm2WEbJ
	 hqqHvPr9oHjtTM1DKr7mqx0rYQWm/on6XL+jNlmAag+8L/jzzSfmFxrIQPx0A0tLaL
	 3RcA/j+T2d0GCikeLdv9IEprvVJiSLZqkQ+TBD2SUzCDtGH3zN78I93S4nKVQI4iyJ
	 CXKRdeg4AKwPk4PdMDPO/0yvbVyVWblirURsakMBADP9cjBv3X9sl04gaBpa5/akDX
	 Vft/9+F/+qZQA==
From: Imre Kaloz <kaloz@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] w1: Search the SGI 1-wire buses only once
Date: Tue, 13 Oct 2026 11:50:44 +0200
Message-ID: <20261013095046.6006-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slaves on the SGI 1-wire buses are soldered to the board, yet the
w1 core rescans each bus every 10 seconds, busy-waiting through the
time slots.

Patch 1 lets a bus master set its search count, and patch 2 has
sgi_w1 search once.

Tested on an Octane.

Imre Kaloz (2):
  w1: Let bus masters set the search count
  w1: sgi_w1: Search the bus only once

 drivers/w1/masters/sgi_w1.c | 3 +++
 drivers/w1/w1_int.c         | 3 +++
 include/linux/w1.h          | 5 +++++
 3 files changed, 11 insertions(+)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3


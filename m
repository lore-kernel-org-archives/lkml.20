Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197115;
	b=5pdmPje7IzGawBtbSO2gmq81052zWtnxCiR1XnjRgVjNg79/cjVlPYIYfgEGnZlS+8c5
	 kWP+O6MxlVnkau6FyRS0juV2hPaz4OUUNJo0DdXyY3HM1NgSnlZHGwMnXoGCs7sSyKjCi
	 erTG7F0Zw7sCd7j62dVDeMIjVEQ8lhQRABQ7wo3MI/VjFUonkG31SJga9EwQxjEjRF7EF
	 FVjmpnYvOnyJTAm7lgAbNwtv6K9V/QR67yu7BVkdUfcEhzeVmZX+NC5vMYd/fhg3LXkaK
	 D2PDvVytvyw3VQnR7UrAHazvQqX/YW/hDh9wIubRfa3jjxn/f7zAQTXg2bGvzmtpw1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
	b=IWoSHSwJMHSvEVDEPT8rS0gHzlCYzEBbMn9r+bCwnzO7p/ALxgpFFK44G08SefvOuFSu
	 F26/C31U6XUjizkM+yjDZ1cRq33oOE6Pueff9EmeOWrWyjWKzub15zRCQJDVXyA9FbNpg
	 BKhMeCw+g3dcfWidoVBG/jCo0KLz1RAtyNdAuoKyLTk3aDY9aaN/IuyBjkQlH8iJalD3z
	 eCC4U5PZUz9uICi+kdk+UhcJoH6hPdo5T8gpHWsLob+2XeY3ZL1EeIhdl9ww2QM7yt7GN
	 luTziDzhWH5gfzCZ4E5e8RykncaHfuFfjHl4KuwCQ/Ap19BMu7zKtYxNVu1xfN+Xk+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91CE606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso190670a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197114; x=1794801914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=I9l0qa+b9zPWr/JhhKeEAAKwqjuR+kYr7IAGO2ddJ05JnT9iVMmY6vOnAhTP5z2ebP
         gCIBOLyz4X4ksd81vXqG8oZmHVV/ESLDgyC+kIw3bYvWihaWClE0qRuawnmmCeEUkacT
         UFuBNut7NmyP1l5w08zLHHJTgOnaA9UtQien7YA+3vvJDQwJdSYaTPOx7ea9IL+CFMGP
         xuLPlh2Zm2RPZaCzdL4kFoT4dv3TT1tAIFgdVUN2NyL3DrdIiLMyOzPbM+g6PlefWAsZ
         mcs8mjT6cRzh00gHHZoBHw+vC0d44q/+5QkBF4UfrZedZmcg8hp6ePfOk46UGNZwS5lw
         53mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197114; x=1794801914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=n+LCi8GdipS4j1NDU/jKE01s9OuXtng1YNT71ExAiUnK2z9D0rSNF0iqU2qeno7u3+
         NIYyZZs1rPshm3Sf9sasUbs4E3xloZZ/8ocdW+oXCIBBzu5uk+g7QSxys0vZLBAwumr9
         b+ugxrpgE8bnc3vvuRHCN3mUuqM7ujNP/iU8c0+0zP6X33oeeWnmlnO8uEvg4ScS/yk2
         v2oZMRpqDhTKCsF4fEG9gWJQ7gx0jEuJoDr4e/wynTH2U6RtxoqpfxhVny3nhqUVhDdD
         JQQjrWvAjPM40FtUr8dwiJp5XvadQbpwIa0afgcOlJDQ0DSOw3+q5R57xE9qPhOTZWkI
         kywg==
X-Forwarded-Encrypted: i=1; AL+hErGJimVl8OD1MkksTUW/lUC9heIQ5dzOdMxiW0xo6m+OYAFDLNk2b1nEewVXEnVBVYNHvjLW0ypjJNa8rgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HRVGa37tr4V27PwfPe5czqdil3aBCx3r0ZHVOkV3hiJUKmZLL
	eDKpgorZftwgZNCTvLqW/x6ry6pqjcFV6L1Lr5OL0JcCpVHY55TOzBq0
X-Gm-Gg: AYBFou1ut+nrKqeqjefaV66ZPd1mbrT4BMqDWHlf5u07CugAlrAYHICM9F+qvNg6lzc
	qDjvZ7s7zLFIUrEj/fVjiPvkRdDj47x1kWIbcgvLpATzQkBjOkJ+wlIxu8tIkkcGil88GJmdlRc
	G3vdrxXRkc9pPppptTwR0kgy9cggrTYDGTaTrhy0FUpw9vroTUzkKWUJyiX2iOdFv06cd7UoBUe
	o1qLDs+5Inwtr+DmVS1PYilHxr2x30ceNtDOUQiVhbs8gvW+goMIyxR4i8eQ8qmhfbdj222YJYR
	IB+2S92yt2Q0uVt0Vf1EdSG8n2ua0aLZ1Sre2n7QSwKZqEg68HhPvRPCD7AoQAOs8EGgZxZHLFv
	lBngTHjjN0YR0W9rdbSyMTK1tcWbTegASBFdHIpWvA6UwWeYAf/EQyXjgI6P55Jyj4tprncDmGH
	J0wrA4uHJFO2MZe9ukkCDD2la5LFdvqtY1IKTsbB52K1vHV04jZCnzCkVFDbuxfblFTjgplnd15
	ff+8AL6Z4e5s9v6TwaKKJx32S73/Y1DDk6hJgliPg7bb9L8YDnA/mn7wLGZxNkJD9qzxPYDe+lo
	cFTYWvc3mGHg3qNX0TLLWffXOYiBfOymWHTLFBwx+JRlc1YqDHk9jWw7Ng7cg/X9nJxIgMYKcZl
	s81zr+YrtxPwoGg8QgJfQKSnEwrGAOF4QTw7hufYL4MEq28RVC77J89PrR8luKjPdiWZlOGWaZw
	yjaw==
X-Received: by 2002:a17:90b:3b50:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b12d0dee33mr2874760a91.5.1794197113782;
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] phy: ath79-usb: support the AR934x+ analog reset
Date: Sun,  8 Nov 2026 20:04:49 -0800
Message-ID: <20261109040451.114135-1-rosenp@gmail.com>
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

From AR934x on, the analog part of the ath79 USB PHY has its own reset,
which the old platform code handled outside the PHY driver. Patch 1
adds the optional third "phy-analog" reset to the binding, along with
AR9340 and QCA9550 compatibles that require it. Patch 2 makes the
driver take and sequence that reset.

Changes in v2:
- Send the binding and driver changes together as one series. v1 sent
  the driver patch alone, so it used a "phy-analog" reset name that the
  binding on the list did not yet document.
- No code changes.

Claude Code (Claude Opus 5.5) was used while preparing this series.
I reviewed and tested every change and take responsibility for it.

Rosen Penev (2):
  dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the
    analog reset
  phy: ath79-usb: support the analog reset

 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 drivers/phy/qualcomm/phy-ath79-usb.c          | 33 ++++++++++++++--
 2 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.56.0


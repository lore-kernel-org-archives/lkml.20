Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EF559C9B;
	Tue, 22 Sep 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090766; cv=none; b=Zr33OHDJnEwT0LFoJMYVWMtDCUJfGY3mdG6UDloaAuYJ7XKhV3W34c9odhJDeYE1D26JBvGCo3f4VSwnpVJVI5vc+6BU9K8w0zK1GuCia7nSrjFTfzlNE7caqZxcU2kmCILpqp8UeBdiVhHVzADTK0qqmjDUs4Fo5OZdtnm2gsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090766; c=relaxed/simple;
	bh=nZRYBjAupT4rZYAF+DUiNaAjwcaOXugwNkN5EhHLglQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERXinLHivHHgXtJsPuD4IfpV8hynDPF/GfcezaQZSFaFfTtEwJVghCqFe5YXmQkPI4c6fsWuJ+0wKzEaPdEHSVs6AyPBXFvFqZYtus3CGFOiqVLdt0xDIgKFU1bcOtVbkOOEN8s7+ZiFB5X39yzKPVkRrpurZjz71o8Ka/UIKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=d2WXEQdm; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="d2WXEQdm"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E852F22B2D;
	Tue, 22 Sep 2026 17:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090759;
	bh=4O1RmEPY9SejqZ5YjxYRppZci7yF3d7r+9+JhGwoYKI=; h=From:To:Subject;
	b=d2WXEQdmC6JvBmrJC8mErz4ZsJ1FNL75OVK7bE52X+ztW58DG0uqAq218lCk/gsDV
	 DP9tEJONo02PJyonJhNlnz11wD4t5LWHsewtqMqvmYsmg75Sywex14c64gOrWbtFUz
	 D1/jAtDy3AMI/DAZlv9Pi+RYsxJvowvs4rs03C6nQef4ZCT08l8tt3E3txtmJ3HiFG
	 BGpJOU4OPeTiuthwOX7cMn/BCPjTW9Bz9t+9KI+/pYMJRQQLWuMOIGz1ljRcgrXRE/
	 5r9RkrTPIO+gsHZ/lg+PW+z+HCEA31VS5eE55g5L5ogqBhUhJYOxeBkdDFMEAUYD2k
	 vP0BwvyLF7NTA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am62-verdin-[ivy|zinnia]: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:47 +0200
Message-ID: <20260922152551.270845-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

zinnia and ivy redefines gpio-line-names for main_gpio0/main_gpio1, sized
87/88 entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

missed from previous https://lore.kernel.org/all/20260914190943.50843-1-francesco@dolcini.it/

Francesco Dolcini (2):
  arm64: dts: ti: k3-am62-verdin-ivy: fix main_gpio0/main_gpio1 line
    names size
  arm64: dts: ti: k3-am62-verdin-zinnia: fix main_gpio0/main_gpio1 line
    names size

 .../arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi | 41 +++----------------
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 41 +++----------------
 2 files changed, 10 insertions(+), 72 deletions(-)

-- 
2.47.3


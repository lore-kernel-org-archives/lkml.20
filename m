Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645721;
	b=I0sPPB/KNCDeWMIjnfvBf3vXz9smCOG7mjx/TkEahcBiR9RBxS9aXD28/7u68ZgW/wdI
	 8RiX6wO7MUzTns+cmjV2JJv490LKMTDBgaJ/iuvHaN7zWHz41kvVFUudykH0BQIMhKGJR
	 Rkcr6wcIx4SwAH0ZqGxAvcqhU4gaFKcu+iRrIVzNt//Xrm/jIdAuaekNVQani0clx+Pvr
	 O+gg0YgwTqyRRj1zjckAhLm3OqeZCX48LAIn74rlgrhA+QJAANSD+CkisSnUUz7s/0V2V
	 yc1FjektGqdOpFdB37EZ2Hh/EuYAM+5mOLwggz34qZVJun1XKn0DHu0LVGdfTNNkWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
	b=xiqq0rmmffHFxHdQg6Vqj77mg2vAJ5tUShkB9wmOZylYxkmSfF9EU8eUZ5ryJeK+tRHt
	 21GQ1eEA6k0H7zgc/H9rYt8ESm0b9+D7/k2eHhiqlxXkcyAfOk+vdxPYfUP0avgmTQCN3
	 0/ejhS+GpckTwUpkIro6zf0QiPMzvrKZgkzEd+0WvxgpMXv7s0PtyP5DSjBWL/dznPVOC
	 0yNKz2x1njXLbyi7yI1t8t5hVL/v4JP7h34EqI89hcyMBBLPA5JsxsHTdyZH7aoehUN2P
	 iLFiTcuykF0PVRYOtWGxFc29h9kiDt6/CeN0a8XsWjQtN4YaSXErf6XX71HK+oQ+zXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYIMQ2QO;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47479606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47479606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYIMQ2QO
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1691757f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645720; x=1794250520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=AYIMQ2QOyom9hvBKw2Z8ci1Fmh5uDweWzMg4XJyBGbxphJjwq9ebj5trX/YSUe3uk1
         V+4KmbombX0NwhNNf2jclf9x2HyOqTLuEBx48ZHidXHtKGuaDnM62FKrjGRgw7A384id
         adB8KrcB3ah3klye/gtbcOJrBJRy3poQtF/jIgxkLb7piS+ts8KW/ZhG+e8uNKiP3N3+
         4S8soDC7E/hPvK49jhBThjjqtrNwwvvjDuZIFf+0ibmPlBwhFCJpdF6VaI8hPL5w25ZN
         JY+1qqEP3VOi21FH6eEdw3pYEn2au7c462ARp0JsqDq9z4L0+Xe0qGWKkWwgTaPsqqjC
         764g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645720; x=1794250520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=trjz2btckgsLMu+iUhFEbqzHiBn3P0qfUKCEPjA6hOFEUeFLBNQpf9FwXC6CeyxmgG
         ukRNmqNRc0vEW0mZvUhWqKx9ifKU9U3JfrZnYufn+fzyudm7uy6jAmjurgct83aAHzFg
         YwKhbdsqAMEQLJ0hTxi/7SIo/ygxTuIZenSa0giGU7oyzy0Ln7Cg77imsOQops4nnnhR
         WcKrkg54sVJ/Kq9rsqIEqYxB8ePjAPfZGSgvg1ILeFONG93bYcdWbnPmoroLqZjFmqIN
         SfYvHeEPklMwcXzc63r0/FVvMQhswVGhdts621GICnNWjUe7bUX3pug4I+LIM5RiAEx0
         mwtA==
X-Forwarded-Encrypted: i=1; AKwUvBwGgQ+l7lMyYzIL9XzOVFFCTo5nIdL38NZ1M1aVmfjbci7/cBRwJiVLsFgJw14x+Yk8nih/y8tVKUcg2Us=@vger.kernel.org
X-Gm-Message-State: APuU4Z93LW0oN5CaeIdvJw5Tse11pFGvAeMMDaHVBJUOYMR3USqDG15e
	NHFKq3PS18TbjpJDb5HdIxRy2D2FK8AnzxLjR6/SmkpuJCHOiRQ3dg21
X-Gm-Gg: AYBFou1XDFkOSLZaMARhb8AK97CbK4tV1S9nFfoeKEMrNqJAsRLYTlvuG+lqTsUSiN9
	R7KSNEpnbu9xwHisSXu2yQMh/JcKg1u2S3VORIGz/LbJzboPXqGJToBzZW6c8JKL18cIt+oTIvq
	JPahoIPK9uKzz0TUp5yVEw6emX5y9jBmdMM3m08BpqZeGBJsROk+GP9HAejSJs5yCu2C9L7QqsF
	eRd3wzVE+2Rih47irO4BRyqOfm7oDvNX1MOfVVTlbxOqlFUKWowM2/Eo8GQURcDbm0mkox4KEi3
	HjW51kZrqsHmkh1LJfUu6Uo7k1ix1bVHeijaBLAwESsQDXbZzztDdXCxWAujqv+DgTtB8A9z/ZG
	/v2S3IZhKdpMoQLt2wwOanMFyCzcJ+sXdwN669FhvhXUTLJVWP+Lkr5S6zmwa3EWZr9PWv32ynB
	ONW6LpvC3G0VYOM95EIyCj6w69idqK3kICR4iC91f15YDhocl4Wb3BoXkDn4wZljR9md+0CCNur
	FRuEx1HiZ1bnMZxzrmRgcDaBq94b35eqL0RxzQFkVKq1RvsPHT6ua+CYey2J7cb5OzdjYfZbIuo
	NEOLB4XrW077BCv8X14bb5r4lHzlF8DQfWXVslOzuMm9qGOyWswXIZUbZDtUH7vEf1jJ5+cEJTY
	D4ATQNNEVrfABYVJvxkWwYotrhiadXGOhR/k6WMLQWIYq+8Pk3vmO4A3LtVQWRgj5OvpeCJd6Lw
	==
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr25328622f8f.31.1793645719465;
        Mon, 02 Nov 2026 10:55:19 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx93: enable UART wakeup on Variscite boards
Date: Mon,  2 Nov 2026 19:55:02 +0100
Message-ID: <cover.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

This series marks the LPUART1 serial console as a wakeup source on the
Variscite DART-MX93 with the Sonata carrier board and VAR-SOM-MX93 with
the Symphony carrier board, allowing console input to wake the system
from suspend.

Stefano Radaelli (2):
  arm64: dts: imx93-var-dart-sonata: enable UART wakeup
  arm64: dts: imx93-var-som-symphony: enable UART wakeup

 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 2 files changed, 2 insertions(+)


base-commit: e20daa6eb46fdb339be122a37211aa408488a3e3
-- 
2.47.3


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517F3D47B4;
	Thu,  3 Sep 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426399; cv=none; b=qTL9Ed1GnQf0/mJ4xWiSHvmX7M4hUhjh7yQ+PPlxhw5XHfcKT1o+EPvL10B17Nl8cubq9AJCZLXlV/KM5tb+I/1+zbCehQor2XX7RnmZ4CgHk3JI8e4k4J5swzsHmgaCWVHTbJXDqpdlX+07dMgylhx2dU6IQC8BdudLyMbNJzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426399; c=relaxed/simple;
	bh=empd1I3pye12Yer9YdrvvpikdTGqNJQmKeox7d4xCIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwNS0jQppLEXM9hKoGs4crFsN3sYjN7Y7qNR0YSxacotqi7clbgUHLwhZuB5SvKJKHIzeVQ4b2GBrzHYaW2ujg+BKA/aNoPWSJV/ua1kIMaPPmdVlEw7yIeZOtIFExDHSzZ0HP+hTDlaUOE2SaA+hSengY+Y0U1uA895oOLM114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB671F000E9;
	Thu,  3 Sep 2026 09:06:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] dt-bindings: interrupt-controller: chrp,open-pic: Miscellaneous fixes
Date: Thu,  3 Sep 2026 11:06:28 +0200
Message-ID: <cover.1788426169.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Just two miscellaneous fixes for the OpenPIC DT bindings.
Don't ask why I looked at that file (my CHRP box died 22y ago)...

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: interrupt-controller: chrp,open-pic: Typo s/pci/pic/
  dt-bindings: interrupt-controller: chrp,open-pic: Fix dangling
    reference

 .../bindings/interrupt-controller/chrp,open-pic.yaml       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

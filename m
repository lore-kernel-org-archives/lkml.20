Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B83DAAB0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462833; cv=none; b=iHmQVwk7bn3w3QvBOFlTVTw5HoIJ99oGHCftNTC1k9PNhENJlPJH0QlUoghyTdDcVaLS1cOonhrfrtL7rIS0MPbLiRN0gND1g8//N+JehAk82hZkwL08r8y+1Pi9oXytGysEThkhA99rEjevLHwNHYbbWddFrn/Z25sRzKGbzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462833; c=relaxed/simple;
	bh=a38zLmnOCRxTfCzU6JuKXvEZ05d9zhYuKPYQ9NR+2DY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MZIfY7VcMqv68toURAa9C8pBzQm7o4XoHJF4aUw6iqHDJeRFOd8X7MS+mqU9oXsH5W+FOYg5RnqFIWBRyv1qik2onf/gxqUT2YsxQueFy6XCAn1dC4SG9Hi43xo/pWuPrJCBQkQonh42g6GyatS1Yg+D44rE4Ke2D47nffB8Kvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLo2h9zB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLo2h9zB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6BB1F00A3D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788462823;
	bh=AviD2jWxYHfZvz61DIoalDQAlzqCBRNm7rLSTMxyOGU=;
	h=From:Date:Subject:To:Cc;
	b=dLo2h9zBwzn2aSFWBsGgy/3NVAkPzEY3hO4HO4DnmRHMYYM/HxhW6258Qhg+E1wlA
	 g9a/8cnX0JLuFjPPxAZrSwRq79XyCw3NHqIppr+OOZaHXRva1a0mUZVoB1ZfyHaQH1
	 4PdOr2bmdC7j2yYWCbOmRK0SK0qluyoQeAyFSbRBUpFIu5ECA2uvFrpPoIOhNfIbRC
	 YJhK4TVFnsolHX5Fy3BrGs9wx+ycsd9P//bn44lOThjbOIssHdndLUyGR6mYifbRNZ
	 I7VOZ/KOUlD4OP63iJRsqnHhhtZkfenmZaseRWEFTZKvestPxByvS6McUUIpbe928h
	 9wruAmSbknS9g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a2b4743936so2985951fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcFMEZOALgYKlYDvXpzdtn+Y94LElyvbXTRWQbMMkSyCsl/13/FGhvgAJz2As0XMB4cQFi5mM9MdJEmFg=@vger.kernel.org
X-Gm-Message-State: AFuF++n0LQbb8iNPL4CkPkD4kNQYlGt2GQYGyZCuKoosx94hzAN2NcA9
	YI2jR3i9A6AGhyaw2OWtpUquq5EpcBISAxPOj7l5zve7ycIQfrDUmDKA8BAAYBIdqiTK+Lgx4t/
	wbLKjz3yxS4Lc9IP3Du+MPj17JC0Nvxw=
X-Received: by 2002:a2e:be89:0:b0:3a3:5a01:a7c1 with SMTP id
 38308e7fff4ca-3a371b8043dmr1483041fa.7.1788462821873; Thu, 03 Sep 2026
 12:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 3 Sep 2026 21:12:44 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j1-NvoTJsKoZ0DONSe+7YzEVde4RUn9V3HsXqAikNQcQ@mail.gmail.com>
X-Gm-Features: AcwNN1WNDc_ThcDCynHjMAmBkNX5IoH_D7pEBmU6kNcc8wagobgEo6PLsTPG-IU
Message-ID: <CAJZ5v0j1-NvoTJsKoZ0DONSe+7YzEVde4RUn9V3HsXqAikNQcQ@mail.gmail.com>
Subject: [GIT PULL] ACPI support update for 7.3-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 acpi-7.3-rc2

with top-most commit 4a819ee5f2834330656d6ac168c4c8cf27fdeec2

 ACPI: bus: Drop two fields from struct acpi_device_pnp

on top of commit cee9395acd8043be0644b25c34bfa86623f2b935

 Linux 7.3-rc1

to receive an ACPI support update for 7.3-rc2.

This drops two structure fields that have no more users after
changes merged recently.

Thanks!


---------------

Rafael J. Wysocki (1):
      ACPI: bus: Drop two fields from struct acpi_device_pnp

---------------

 drivers/acpi/scan.c     |  4 ----
 include/acpi/acpi_bus.h | 11 +++--------
 2 files changed, 3 insertions(+), 12 deletions(-)

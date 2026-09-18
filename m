Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D5149A3B9;
	Fri, 18 Sep 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715257; cv=none; b=UibQqsQ/r06qm3aAOi8h6E5G0OBAIT3COzzvF2t6rlwSS2ArgEA1tZwaKFVBmZwL2hKm1PWLem6cnpW61NX3bxpQTGmwkFrZ2j2U2W7huSPXuzA/l34Lr8oIZFEKhGxko/XbBDpJ8z8vWoZgvqlfAQGSLfe/zLlcLK3TpbSVN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715257; c=relaxed/simple;
	bh=ertT5iwyTnt9E7GD2JBCAa0OSEKWaAWUnkd/EsHQTsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jql/cuWANv2qzGjFXzvliEseroN0qjOCKoFBhLwBqzExleFyrD9+lGsMzEVGlf2LwidCzNaH9jB8fZlblO1QV4a3jBXkU9J31wtPmp0XB6xezyfs+3j4op/09nvrPF8UeTtSd1zPoMmcDHU6NmpGfmMCarMdjLdP0mCYHc6az7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpBm+sLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpBm+sLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8940B1F000FF;
	Fri, 18 Sep 2026 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789715251;
	bh=wCLT9ljJPnFRpRo71AY5Jt9qpjQ9o0VE+CtqLZ/FBfI=;
	h=Date:From:To:Cc:Subject;
	b=IpBm+sLDbzrfWViH9pvthRIA92LkQ8hyhnJ2kDJW74ZYP9XHqv7A1V0UR+q/4oudj
	 907c3oFJGWqYg+/qYD9KuNwu3JLrb7gbcbiMmsO4Xa7Av86pdZUuXhULKDWOlCw5Ad
	 K1/f76gowqm3ETZ+wlniWuqmPJeFPvyFCiWq8LYWV29xpwAdjv02neKRCRnP3YQFc5
	 qalkTaYEfdffNrmFJq7e40/yUgjdmcw1bRSedK/sAtrdQ4CTYdLPvTRROqhY6/xzVK
	 Rm8ycBOaQ9YdjoM6gE5kL1bcUS5KK0D7Hc3MXxFtxBRCVQ9CM1Y4ipxYsTQa7cSFMj
	 aLmo3soC5LJpg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x7Sgz-000000004CF-0Xb0;
	Fri, 18 Sep 2026 09:07:29 +0200
Date: Fri, 18 Sep 2026 09:07:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.3-rc4
Message-ID: <aqzjMWHGKkiL02Ob@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit ae0e61d95677efa778379853e495d748e6efbf95:

  USB: serial: fix ioctl hangup race (2026-09-08 11:00:48 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc4

for you to fetch changes up to ec06546b43b612cefc851558981b4955c0ef9e46:

  USB: serial: quatech2: fix baud rate overflow (2026-09-16 15:24:51 +0200)

----------------------------------------------------------------
USB serial fixes for 7.3-rc4

Here are two fixes for a long-standing baud rate overflow issue in the
two Quatech drivers and a new cp210x device id.

Everything has been in linux-next with no reported issues.

----------------------------------------------------------------
Johan Hovold (2):
      USB: serial: ssu100: fix baud rate overflow
      USB: serial: quatech2: fix baud rate overflow

Jérémy Carrat (1):
      USB: serial: cp210x: add Corsair AX1500i Power Supply

 drivers/usb/serial/cp210x.c   |  1 +
 drivers/usb/serial/quatech2.c | 19 ++++++++++++++++---
 drivers/usb/serial/ssu100.c   | 18 ++++++++++++++++--
 3 files changed, 33 insertions(+), 5 deletions(-)

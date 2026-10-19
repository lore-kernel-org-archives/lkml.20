Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DBA1E0DE8;
	Mon, 19 Oct 2026 00:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792371216; cv=none; b=PinSvZoStf2RnPld8EnlPjqRYf8bl83GBrGuxO+NwfPn22ABhTMTXlWAZmwSRWiAZY4sUcvU5XAPNnaMAB4er0SlK+rvFscqpcvMK7KJ1Kqvmfq+wZzMUmia+yNsEtdvwa+omOkI5zu7At5wCC8q8yE4MILcYuiq0cmX+et2Abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792371216; c=relaxed/simple;
	bh=edmh62LEbEBPp1CiNznLMNE7ABJIbF8JBF3eVU2dvoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6t+8glCtvCh4pbO6Vvx+EJ0Tzs0S0PkKKdTPzqAJljN5KhCUfZTw05KWdax/D9rqcL4TJ2jsxHqQl+nioEKGHGqK/3R5Gy/qTaOslE0xwuutnQwH2y/ojC99K/n49IzcTLhMCWc0AiBSgucityInYTTfsfdnPTgW8iNLfozk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apx0L5uz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apx0L5uz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE70D1F000C4;
	Mon, 19 Oct 2026 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792371214;
	bh=xsoF2bSW4Tu+1RJY2P+rbJwpGfvufTqM5XKMoi8hC2M=;
	h=Date:From:To:Cc:Subject;
	b=apx0L5uzcsWqsRG72MX+3D8HcPugujTvoOaYSUTU3PPcWUSM2u02u+4fkXW1HlB0z
	 /paElFzYKQAjzOvZGKzijbHq0d9FLw2mU7KBTyjGHh8HD0bYA2zSuzz/znXLWB0mHm
	 BAD15BOIKvOoxQOl9HOZmIKgkx1I+oWw/CcMoanZmkUDuveTdmNu0XY3f/w0Bl8BJ8
	 qeC+wdR8YoCh7O6/yW8R7udHAvVdPZzfijl2Utz6ME/6FpEEUe0gcLHJ9A/4puL5HV
	 k53XnXNuuxg2K5YZwpI60QrvT6vko65tH0db+nZOpLh/yaHvqBRTm2x0rKmRKHflCE
	 sl3TSIjTlKY8Q==
Date: Mon, 19 Oct 2026 00:53:31 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v7.4
Message-ID: <atVqC0emrgzIQfAL@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0tzVs6boNBPCYg+h"
Content-Disposition: inline


--0tzVs6boNBPCYg+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform updates for Linux v7.4.

Thanks,
Tzung-Bi
------
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.4

for you to fetch changes up to 2d3ee0bdb321ad84d9cf18d4bfd2b839293a695d:

  platform/chrome: cros_ec_typec: Poll for role swap completion (2026-10-08 02:16:45 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v7.4

* Improvements

  - Poll for role swap completion in cros_ec_typec.

* Fixes

  - Fix wrong returned data and length for deferred response in
    transport protocol.
  - Check boundary for EC-returned data length in cros_ec_typec.
  - Fix a regression for older ChromeOS devices after applying
    db65a06d10b3 ("ACPI: EC: Convert the driver to a platform one").

* Cleanups

  - Fix typos.

----------------------------------------------------------------
Bartosz Szpila (1):
      platform/chrome: cros_ec_typec: Validate SVID and mode counts in discovery data

Daniel Balint (1):
      platform/chrome: cros_ec: Sync host command header with EC

Hemanth Selam (2):
      platform/chrome: Fix typos in comments
      platform/chrome: cros_ec_rpmsg: Fix repeated word 'from' in comment

James Fairweather (1):
      platform/chrome: cros_usbpd_notify: Only use drvdata when parent is GOOG0004

Marek Maslanka (1):
      platform/chrome: cros_ec_typec: Poll for role swap completion

Rob Barnes (1):
      platform/chrome: cros_ec_proto: Fix deferred response

Tzung-Bi Shih (1):
      platform/chrome: cros_ec_proto: Simplify cros_ec_wait_until_complete()

 drivers/platform/chrome/cros_ec_ishtp.c        |   2 +-
 drivers/platform/chrome/cros_ec_proto.c        |  43 +++++--
 drivers/platform/chrome/cros_ec_proto_test.c   | 158 ++++++++++++++++++++++++-
 drivers/platform/chrome/cros_ec_rpmsg.c        |   2 +-
 drivers/platform/chrome/cros_ec_typec.c        | 104 +++++++++++-----
 drivers/platform/chrome/cros_usbpd_notify.c    |  41 ++++---
 include/linux/platform_data/cros_ec_commands.h |  72 +++++++++++
 7 files changed, 357 insertions(+), 65 deletions(-)

--0tzVs6boNBPCYg+h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCatVqCAAKCRArxTEGBto8
9LBmAP94LGd2KRW4WqM6fboie2UaUjvgM5kWdRoHYYLt7V11GAD/cpiuIFv/vdnI
B8L/8aCeuJlR2OVktWQwaaVoBDn6hws=
=5wUz
-----END PGP SIGNATURE-----

--0tzVs6boNBPCYg+h--

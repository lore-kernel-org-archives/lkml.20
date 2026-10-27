Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112053;
	b=4JKikf/OGCSyqmU+GqfqWTQqWN1UX6o4Qtydx3i1BXAEL2+8SS0oQDzRESzJJ1ZsnphE
	 rnGh9XMQlCiz3flF73wHi4V/M4sPl2MaSEyOL5B0nBQYqCwCVRsgf71jvNnU7K8JowNWl
	 0kd0YDMeVFE5Fg5tFFoEVBnY+YlbU5SKeTZGksyW7RhKjFPxkrZjWdAvzDq7hJWOAzw0T
	 fjXlWMJXPCmXyvDWAgNKehO6xcUaweJa+HZ+oyS+Knphc7ZL3EoJxrCxLhWTR3set/zAd
	 V/ni9sLA62BGmIMM3BYE+kXK7cvJu8c+PNyQOmkTtc9HaE/ZfnYjAPNvW6Q7en+8SVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112053;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eiV4ljQDMo6197ymv3MCP7vCrfTwdpsnBI8nI+LJJvk=;
	b=05E3I5vHhvu/KsX5LMl0bWGRel9MUcQnqz5cwVVXtXLXksvG1sbWVsUVbHmGEngFirjq
	 x1twbLrRMu2e8hcTHw7lyPtgbV3BomcPvUeYRE36fGQyubWme2LAbSFm8jDXD+iSbuVlh
	 nVeerrwy12lp+cVwMYzMnYc872nhMb/qAholYWggkKLkW83yuUJ4oRMjpB8TTAChCpE95
	 KMHzg0iQiBQl1B0T63NaRgdQAKRdaXqayGcqBZC3sP8gmpaeLXEsP3J7hglAJceSbHkOm
	 d3EMm9AM4zXyUkG1YdBbpv/LX3g0NdK8EQYyIFZJE/FLy+4MMo4y+yVuW3uJRZJ26rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WOlnuB91;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8220606A326;
	Tue, 27 Oct 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WOlnuB91
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4EB1F01828;
	Tue, 27 Oct 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112052;
	bh=eiV4ljQDMo6197ymv3MCP7vCrfTwdpsnBI8nI+LJJvk=;
	h=From:Subject:Date:To:Cc;
	b=WOlnuB91roxsosCuhFOnlObzpcHJ6scBqgUvo+/SWKB05aMODQnsbSW5XH2dURvFn
	 wv6SwPg8FgfV8yV0zK1D1g0ol/SD45/W4kkufQIFuJJ00RxV98ocwH0yvzisxIA0cy
	 mvkjjZapIvxJL9cACf5xUwWCB3BRPPm9lrNRGUOk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/7] usb: storage: some llm-found patches
Date: Tue, 27 Oct 2026 15:40:43 +0100
Message-Id: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q5EMBSE4VeRc71NqhKsV5G90BocsUgPIhHvr
 rj8Mpn/IIFnCBXRQR4bC09jQPyJyHXV2EJxHUxGmzTWJlPD8FerWCXL5Kswp3ViG7j8qwEKr9m
 j4f0plr/XstoebrkzdJ4XO0A6BHMAAAA=
X-Change-ID: 20261027-llm-usb-storage-6d3bfec890ee
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=eYqZMNvQnlEDkCGlP+RVzdkliGsHCKrgI0Y1COuLikI=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn+yv1CbMTW6x1b6Ek/kz4Oms3l+b5u+nmX35lM7n
 T4yfwnJ74hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJVK5gmB+yXnQ3m2cA8713
 Ij/WP9iRLSNQvJVhnqnDnTwxkzcbjluZujVfOLP/W/TZowA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

Here are some small llm-found patches for the odd usb-storage drivers
that were sent to me.

None of them have been tested, but they seem semi-sane so I thought I'd
submit them for others to see and Sashiko to give a second pass at.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Josef Bacik (7):
      usb: storage: ene_ub6250: fail MS init on card errors
      usb: storage: ene_ub6250: report boot block errors
      usb: storage: ene_ub6250: fix write to unmapped MS block
      usb: storage: ene_ub6250: bound the disabled block walk
      usb: storage: sddr09: bound the unused PBA search
      usb: storage: shuttle_usbat: fix READ CD divide by zero
      usb: storage: shuttle_usbat: bound the READ chunk size

 drivers/usb/storage/ene_ub6250.c    | 18 +++++++++---------
 drivers/usb/storage/sddr09.c        |  2 +-
 drivers/usb/storage/shuttle_usbat.c |  9 +++++++--
 3 files changed, 17 insertions(+), 12 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-llm-usb-storage-6d3bfec890ee

Best regards,
--  
Greg Kroah-Hartman <gregkh@linuxfoundation.org>


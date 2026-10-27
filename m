Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112067;
	b=ngoXg7wkhS7C5Tigebw1Oog91k+J8jFRy0tKGPGWxbcpGcq2EA0yQ7+AvTZu3rZudG19
	 pVw4+En3676QGaGRo/Xgmo06MX99s16Ts6+d5dRyi4BF0pHj7c8r0RdRK5sLk/GZ80ZpJ
	 6X/o9KoMoklJwMk170doXA9BppyZLRBWl0DKYzn9fM8n0+ek9pzIIsD9ZivAEoWL8pIod
	 ju4FtxVb8XjnR7dZmKeclG9pnj+94/TK+H/Jpou750zj/vQ/KAAOmx2ilXJbM6PefbEa2
	 axAo9IrkE+NEnai9XDa9EKokSl+e4GNvuuvJhxsv2NSE09l9pEli/F3J+732//H8d2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112067;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+OG2V33+K2As/QUF4IOJ4RHdPMqstgXLtas2prBDprY=;
	b=txgQ6SVLBIWjRZLJ370tHRobU5wfpp/7QEGE9JzX7HIWDhSpD9c3AYjG60ZF0rmI1pVx
	 ksU97g7qgIEDw43k7sfoDtu6HGXQ4tq5kbyHZjcEsyhxZj/0p5EYk3DMTpbUzF4WMTr8C
	 jYFZvFPcRKLLLEyZMG/3bFii3/GhLbNQ9j8OsybcZcH4IDXWvWR4zFTI0ZkgVGGw4y/Od
	 L9HQHzownPdzvUhWpoYCC8gFlUYov2TU+z4efcl44+UWaDBPCIMCt74fHGGsSHTOxUrmf
	 NYVb/y1hY0kM+Fm8gmHDvYV61jW94Arj1wK0W5jNxpja8Qz7yyLI37p5Vc8sJvhPcOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=d5GVLOCZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79EB60A2611;
	Tue, 27 Oct 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=d5GVLOCZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184961F01829;
	Tue, 27 Oct 2026 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112066;
	bh=+OG2V33+K2As/QUF4IOJ4RHdPMqstgXLtas2prBDprY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d5GVLOCZDlI4kmtsxfroGEvUsDdqc+MsnByJr6zbWT9aAwBQjVzUNJtM/+nIp4WjF
	 2CuyTc4uC6PMxjrOc+py5rF6Wm3Bmivy+uVqOT9oMnTTFnnIsImpBuM1D7Ly56RHlk
	 q3/8lBPM8CBwVhYLaIiFlEfIUTctWNRvLU1yVAxw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:48 +0100
Subject: [PATCH 5/7] usb: storage: sddr09: bound the unused PBA search
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
Message-Id: <20261027-llm-usb-storage-v1-5-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=1Ri5PbeF2RNDLde0Q36PUaZMxWDQt1nnMtbvPxJql28=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn9uSL+467h+oqXYhMOTpUrO/0q58C+/2u7523Tzt
 pUvo5jkOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAifXMZ5nArbFD5a74lvmQ6
 67ySvP9C+lE2dxgWrMt+rZUzT6p67XKBzhnidy7FnFqyBgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

sddr09_find_unused_pba() can read past the end of pba_to_lba[] and hand
out a physical block that does not exist on the card, which is then
recorded in pba_to_lba[] past its end and written to.

The search resumes from lastpba, a function-local static shared by all
SDDR-09 readers and kept across card changes.  The first loop is bounded
by end, the number of blocks in the zone, but the wrap-around loop only
by lastpba:

    for (i = 0; i <= lastpba; i++) {
            if (info->pba_to_lba[zonestart+i] == UNDEF) {

After a write to a card with 1024 blocks per zone has left lastpba at,
say, 700, writing to a 1MB card (256 blocks) whose blocks are all in use
walks pba_to_lba[] from index 256 to 700.  If any of those out-of-bounds
words reads as UNDEF, sddr09_write_lba() stores into pba_to_lba[pba]
and goes on to program that bogus block.

The bug was found by code inspection and has not been reproduced.

Fix by also stopping the wrap-around loop at the end of the zone.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/sddr09.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
index 313313508bde..44197a3a545b 100644
--- a/drivers/usb/storage/sddr09.c
+++ b/drivers/usb/storage/sddr09.c
@@ -838,7 +838,7 @@ sddr09_find_unused_pba(struct sddr09_card_info *info, unsigned int lba) {
 			return zonestart+i;
 		}
 	}
-	for (i = 0; i <= lastpba; i++) {
+	for (i = 0; i <= lastpba && i < end; i++) {
 		if (info->pba_to_lba[zonestart+i] == UNDEF) {
 			lastpba = i;
 			return zonestart+i;

-- 
2.56.0


Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893839F166
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294447; cv=none; b=o1u/G83mqdhCP1lVS5TObR3RlexkYdXMOhbV/eklFv6jFFe9b/91erBOztvGT2T36KvGV9VH4vSaiM9BoFmQFq77STtxYCnXGm0kSvSHgtrW3TGM3uvJVSzuA3Pmot0Ywjoilk+DnBJgF3JA5qM2kF1WcdBZS76P0IPSi06J7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294447; c=relaxed/simple;
	bh=SjBypaz3DT1soCXnhPB0oADSFANbq5oWrPBIawhcEGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXwUwMPVTUG9yHgdY/kravUNS66i0CbQX4GdH1sh68TdvdNaEsN9EtzBm3WdvMV62Kq8SmGaInMf4yn2ePAumTeJpWdXljAwKf4ZjhlwOFh8Epj1rs+cQuND0Mv6FJ5rvcIvhL0hiYH1rHQVic5XuAKhw6kPo7vpAsHOkOO1GUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=j3LiBoCs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rr1r8EnT; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="j3LiBoCs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rr1r8EnT"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id A3245EC019C;
	Sun, 13 Sep 2026 06:14:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 13 Sep 2026 06:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789294444; x=
	1789380844; bh=ka2pH0yigSqDFdhjqx82tjE/cqgf/rVKE6tG8whlXl4=; b=j
	3LiBoCsO9tB22xbFFgqqqW4kw+AVrjJUqVnHyroWA6IQ4JmeaOjLikG+3k7QYmsC
	G13RVHK9dtsJpL6CKl0uG8Lkye1SeIwMo5OqBOSPei1YVH0ALxUzprIRWeNEJPm0
	zZwXQZUDCc+Le4jQ3y++ZCNi5IOO9HQjTPOmy5qVCW0VeJGgLsv79dKW1VThTbX8
	Q41+I4VrsE4+rppMNfhcihFqnh+f0HxjolLTWoITRUexLo/7byVg5yJCVaCWp7lM
	ab4+qlsvNhdqet8nmzyZHknnNNYPJ2U2jFFuTj6tzOVzjwSL32ParK6nnsZ9yEub
	M02pNusdH+/nyWdaMuo0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789294444; x=1789380844; bh=k
	a2pH0yigSqDFdhjqx82tjE/cqgf/rVKE6tG8whlXl4=; b=Rr1r8EnTMCRrtQUhI
	mxlEbCgBxsaeMqzCgbtIZC2yCyz+AfRrvgmGGrqCK/lvqWD3Vc/07cYNHnpuScak
	zlh/TILICzC4YVhuwDxfdn8c066YdNfvMNA3wko0DPtAKG4BfhktLi/q/CvyTEK5
	sO/c9J+cU0nUfpUm0VtvIFMiisJHFlV8aL66JliNQN+qCtY5EtfeLCiyAxGH/6RR
	cYMeCb22C6EL9iIXvQZ2Xo6AFAehgYywFeXLyPGdsmxJZnPfs1f20/LGNBo8cepu
	11p4nGQUWM8bDoFQdZP2lTn5kdm0hDwimh2ApDXJTZ5T/iFRdgDvJLBM00I8CFpN
	tZiFA==
X-ME-Sender: <xms:bHemaocxz_vb3qzcumgEcnwRQz9EkufWR6CzKJoPlaxtLWTx-HMzPw>
    <xme:bHemaoKpBUCSB8EUl05trwO71BAnG8FzH47X1YAvHII2u7zoOvuzROlWTXOThD2-1
    vY831Liql7BNOmCKkSOFaopsO5jQDm1WDjJEapW_BuWZP-bbIK_ivYR>
X-ME-Received: <xmr:bHemahF2UkKUtHDd6uoHyQp3CPuOsXnmP2h30WSV8Xg-4vnZ1ycPvjlNAQqubzrxs7J-CpOmVFqeOnkHhQiZ_BrX-8uRjtoVoRA8ZN0bW19B5w>
X-ME-Proxy-Cause: dmFkZTG2/vy8D0TbaMZOOhOpGNWwOGVtNK7N3/Ngp133it+bhfjOwGH+I3f6TifYcbFCix
    d+aExY2U0cYC7fsd7F/Fw21a1yBHo7Ftaz2iRM2h3gfR5T7dXWR8r+smeEK8E28yK4bIYd
    ixLHKJoqK4EZNfSK1zEMlMFiFzl5g6Jx8QVFNKC3RJa2Os6FyyhShJlD7ix43o2qA7rLeH
    OUwVltsbra+ufek/Q756DmmV1U+01AJ3ER4g0bUtgnCg5AB941tbiwQ3ExpQ4AI1Dh8OQh
    oY6X9VjBXg0YPP0riUEHb6zHa1SaebZS3x/r/3AjkMhIWic2pIMC15GtHju9uGnUtrHKs9
    aieCzosmmdF+0mE1JeoEPcByupysjlh5GwHcdpsJm2MteItWqLs4zWOMG+PNg++zB81aw1
    xyTi/oCXw2eCM0G3skGKknoqa1C50lxVkAhZU4AvEvddOsoq6g8qrn2CwxJLYMsf9PGmD8
    9QCiqCSToC3DpddqKgYflnv2ThzsVGjBbTWsWo/TbJ4TqzGeECH4eW7nmoXVdBXYeCMzke
    zaO/i7Xq9qQEqmCObfw17n/d7wuwHszGd9CVB2NeaFP/PZ31gq6gj/4QONfG/KYUrXLaib
    8VeXNSfzA9bBxHknFhko2N/+OI/knoqok3kinPdrtDCu5G6NlJeSvrchCv9Q
X-ME-Proxy: <xmx:bHemaqp2c4bvipGcmqSoDcTKk4tPI5GlSaHvnCemCzOQMpuq4fBdWQ>
    <xmx:bHemaiT1EqjCgqyKvTzybnjLJcBiooynW8kA-02a1TwMYaJR3A15TQ>
    <xmx:bHemavOvUn8lpKHyrSYFqnXymzs_YbU2Pw51_5yrJqNv92NUYw08iQ>
    <xmx:bHematNEy6JwPyhS7-kzCwAIdYnOBlsGKzy0uQ8r2_uHIIlGwZkTMw>
    <xmx:bHemapyp2vppnr7p5MNp-CPtOlfLZ4llNZANxwCrSyrCCAWDNDJSe3hE>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:14:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] firewire: ohci: refactor multiple calls to fw_fill_response()
Date: Sun, 13 Sep 2026 19:13:54 +0900
Message-ID: <20260913101356.156420-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
References: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handle_local_rom() function calls fw_fill_response() in each
conditional branch. Using local variables for the function parameters
allows the function to be called from a single place.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 290bac5112b7..ec069657ea8b 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1459,7 +1459,8 @@ static void handle_local_rom(struct fw_ohci *ohci,
 			     struct fw_packet *packet, u32 csr)
 {
 	struct fw_packet response;
-	int tcode, length, i;
+	int tcode, rcode, length, i;
+	void *payload = NULL;
 
 	tcode = async_header_get_tcode(packet->header);
 	if (tcode_is_block_packet(tcode))
@@ -1469,16 +1470,18 @@ static void handle_local_rom(struct fw_ohci *ohci,
 
 	i = csr - CSR_CONFIG_ROM;
 	if (i + length > CONFIG_ROM_SIZE) {
-		fw_fill_response(&response, packet->header,
-				 RCODE_ADDRESS_ERROR, NULL, 0);
+		rcode = RCODE_ADDRESS_ERROR;
+		length = 0;
 	} else if (!tcode_is_read_request(tcode)) {
-		fw_fill_response(&response, packet->header,
-				 RCODE_TYPE_ERROR, NULL, 0);
+		rcode = RCODE_TYPE_ERROR;
+		length = 0;
 	} else {
-		fw_fill_response(&response, packet->header, RCODE_COMPLETE,
-				 (void *) ohci->config_rom + i, length);
+		rcode = RCODE_COMPLETE;
+		payload = (u8 *)ohci->config_rom + i;
 	}
 
+	fw_fill_response(&response, packet->header, rcode, payload, length);
+
 	// Timestamping on behalf of the hardware.
 	response.timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
 	fw_core_handle_response(&ohci->card, &response);
-- 
2.53.0


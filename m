Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60C3845CB;
	Sun,  6 Sep 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710218; cv=none; b=BDWm3iSksoO6YKGPhphRgj7ri9SrYLcBnf/gx9wJQCKWQaHajAvwdFbgAjD/71Hm0mgL8bvwpypQnxa8YS5Q7W0HqSNuwft93qpRt/ZxbKf1KlgjZkYAQfzqkuETrHW4+eekGkdkhAHf91DE+vOk0OBRmlSmrQGUqBCJMr1iTMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710218; c=relaxed/simple;
	bh=s/mXdH0RQanOA74m67ML7mjbr9Y/UfGVcbNAhHiSeVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRPr2hsbtfAPC5NhtmLQx2MrrEB4fkuXIk9CrhIiWz7kg5WgukUkDTX703eikCwKTCoZXfWJIgOAGqo3IvJ4NF4FUSRf9JMyd1IjNlcAaLSsl7oay0NQnG8KLG08TQFjyOqUKct9dN+iiUqSQQ+Z1EkqMdKcIwZHHtHtB0BRjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nickpegg.com; spf=pass smtp.mailfrom=nickpegg.com; dkim=pass (2048-bit key) header.d=nickpegg.com header.i=@nickpegg.com header.b=GGmvSPGm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xRh+bnnM; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nickpegg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nickpegg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nickpegg.com header.i=@nickpegg.com header.b="GGmvSPGm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xRh+bnnM"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 078EA14000F2;
	Sun,  6 Sep 2026 11:56:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 06 Sep 2026 11:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nickpegg.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788710212; x=
	1788796612; bh=310dkjKYgblmLe8ncEMuGqbFBWbPgCiWofAH3ycMNu8=; b=G
	GmvSPGmWt3bsSDzY3q7mm3rZ0mBoSP60x793gMtX9EyLPaYSNNHb8uVd6hDa+dTd
	31DmfXlhG9cnSoxAKjHLYTGF3dQ+epwqD9CrFVIT6AobpwyeJ8lbe080fbU+NL4d
	0b23gkiB5jZCqmQ/syRPsvcfqn2UlemwvklqKIUGXXHpjulHRcUnrDQB/V3ryO9k
	DUQNofmIdaCfleDFOX69kdIPQDkLbvNXrAYooVudYBC6jChsltH96c7yyLHVpX1M
	qre2nEAPnC0OJGUlvKbDF/PapY6vkgpCcM8LMetmysOJJKS3vbRms5ZSKA97/HCW
	pe4VbALc3McCJrE80Aq+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788710212; x=1788796612; bh=3
	10dkjKYgblmLe8ncEMuGqbFBWbPgCiWofAH3ycMNu8=; b=xRh+bnnMtD0LRUaGp
	27OBICejh03lct5BkjHespKhS/cgedonTRsGxhhPSulLNIG8EKbUYz987kiK/sy4
	t0ZZiOeix7h09BdIdWe7GlfpTHvej2EWhKWEYqpKp3cM0B/OHF1XGpANKpBOcLr8
	/GWhMxTHHW5meBz5gwzFd5LpCpPVtfzT4nT5b/4kiSpyXWPyjoryp5D+mJKsAq+f
	lmEJ9XOTF8aXae7qu3XeEWx7ODp3q/a1FHyp4AI8rvmSmHff/GNFUE6l+LYe3XpD
	Kjl7Q4f0qIvrpWqJ0GWCbkul8uGRqsf6pQNsbgE8GdFyO3zIaLRqaWougQ2axktq
	oEcMg==
X-ME-Sender: <xms:Q42dalJt-i6_bf9jv1_M2qGkh1d-eF8yJkqARUS_6HyZiRVy68JDbg>
    <xme:Q42daipiEWhIRWH4BcN9R3m2OmUWkVH1z4OhtEIAlKYR9XmfZveSxk1oiTlXbmjj7
    0swn9TxNjzLJgK1bNQx3-GBAMvwjIQN_qQG_jJMTLDnhLqAWTISMFO9PA>
X-ME-Received: <xmr:Q42datxEZg0NVnsVnFg5plMTGQfLNNF5k3LCa3y2GM6tDgw-0vUmpZJh8wR3YaSDGEBVszb5tjQdd6z8mYp0kQvXfK8OsVKwgDKDDjQmZIZbhilq2Knd>
X-ME-Proxy-Cause: dmFkZTGmoFTLymL9TVbj9Ay4wFbnzjOpCbVPqyh1qYdNEcsUQODJBFa2CJ7OesbWR1NhCo
    xLitNDlDz9K028fHAzuGOuHsOoK9cg8SegNBTCypztwjQmrVvV/qKUhl7ZIA5M38yPp4t6
    VKxOzJ+SQ147sMG+CTMWIYfR1TtpIliRwWLYFZeaQrKswf233iBdTan2P5zNRTA7+cbwHP
    a3CcfbJyMN8yCBVQZ5lF+qI+3tEM3zE5HmQTpYkUH6WOvnPG3VmG1yYTu6of9lGJYLeTJx
    YxKdIMtXm0iW5eBO8hhmI7eUOZV/nioLgaO9zLjUNyMBR20AeEPxTWeuLzNpSoi5Vza4JG
    iVKUPleNn3i/yyF97qT5fZz8ZNil5u3xRU2eyHjm7ono0BXSWPsaLRxH4DEpibMOafZyYs
    3iEEMhrF5VeLpxK6I9vTdM86MGhibXrPqhoNvm27tN3loeKWlpi0egQHSXgPnFjhwhPTmd
    KYX6tuKl5nL3n0lAfjoyS8pTDI+X2hZ3sKp7WFdeVOd67fih47Qwiow9lcLz7kwmkpAPRl
    XQJr1UL7hnxzojPEcWTHEbRiePSwKIK567Ly8Vo1VQg6Jd2Cv8gjlAN+xRlNFJNsNB2CeR
    +wL65FTIRm3vN29SC9wU/2LWwAnLPW5ycliquJxDpcTeJBgVCtFHRIh+uC4A
X-ME-Proxy: <xmx:Q42damNTNd0Y3huQwXXr_rXwbCYbcxLf0SVSFLQhDtwcMQw4tPt8UA>
    <xmx:Q42dai67HCg4Gaohvw_i5RKc8xTr3dDFN8__78xHpUvu6ZwF4Wsdmg>
    <xmx:Q42davlHQE6OKeuszKaQBmr3IMFf98SnEOsARq2TOr5tR0zSf6llcQ>
    <xmx:Q42darS1V6Knzsoo-18ea_-gS3QbThyNM1nRuqqBSlu34MuXUUZReg>
    <xmx:RI2dajz3mgQFg3-skoBysuA5lgpr710HefF3-U4eTk33B1XbfPgX_g-Y>
Feedback-ID: i95c946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Sep 2026 11:56:50 -0400 (EDT)
From: Nick Pegg <nick@nickpegg.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	Nick Pegg <nick@nickpegg.com>
Subject: [PATCH v2] ALSA: usb-audio: Add quirk flags for Behringer UV1
Date: Sun,  6 Sep 2026 08:55:37 -0700
Message-ID: <20260906155616.1625465-1-nick@nickpegg.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87jyoy4xdf.wl-tiwai@suse.de>
References: <87jyoy4xdf.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Behringer UV1 is a microphone audio processor with a USB audio
interface, which experiences periodic stutters unless implicit_fb is used.

This seems to be a similar device to the Behringer UMC series, so I
copied the quirks from those. I've confirmed that my own UV1 works great
with these flags set.

Signed-off-by: Nick Pegg <nick@nickpegg.com>
---
v2: Same change as before, but using git-send-email this time since my
mailer mangled v1.


 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4d2957e62fbd..5b27659d3eb7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2388,6 +2388,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x1397, 0x050c, /* Behringer Flow 8 */
 		   QUIRK_FLAG_IFB_SILENCE_ON_EMPTY),
+	DEVICE_FLG(0x1397, 0x0510, /* Behringer UV1 */
+		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
--
2.55.0

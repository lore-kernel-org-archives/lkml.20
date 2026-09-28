Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341A489FD0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.184.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613847; cv=none; b=UNLDdrlA8cHjI3RIKReNRgVeby1FKVV5JNfmMNv4e43xsxS1eeCKX8tzOGvXxDyXzcLetPAbMOIU4N9JDrJHTWF5hv2Q98UlRL7OaMGwtTg6E8eBLFyjdRo/EbwORCbJ4oPJe4EJvP4pB0gV2XX+RBDmZpy7DVGa44frHYQxvFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613847; c=relaxed/simple;
	bh=hNpyhjibfiaXZJa4BYYigem2CrO6VBZo+9dKxUhxqn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/g+CPZN5TXjqNMlYUS5aTtprVSJKfhOzDutr+Uuuwtqfl8GyMFGBnaAwlYXhB0TVKCmkWO9hA7wf9zawcbHa2DiCkvvyGxfGpoSD1hC+82Vw1hhsNsYdBQHVBFo6S+m2rfCz6CqhQ68hDkgGhA1vorAjt54he3yb1HN1rnBw8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu; spf=pass smtp.mailfrom=bobtopus.eu; dkim=fail (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b=QbpCogpj reason="key not found in DNS"; arc=none smtp.client-ip=87.98.184.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b="QbpCogpj"
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.254.29])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4htmQb6T5Xz5y7F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:06:47 +0000 (UTC)
Received: from ghost-submission-c7b579475-t7vw7 (unknown [10.110.101.251])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B0C3980F21;
	Mon, 28 Sep 2026 16:06:46 +0000 (UTC)
Received: from bobtopus.eu ([37.59.142.108])
	by ghost-submission-c7b579475-t7vw7 with ESMTPSA
	id IriGGpaQumqhzREACFZ/tQ
	(envelope-from <bruno.boi@bobtopus.eu>); Mon, 28 Sep 2026 16:06:46 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S002c533a36b-8e65-419c-ab5d-ac36f1bb9d5c,
                    99F57D8295E04052021F6BE73B89593FAD7611CD) smtp.auth=bruno.boi@bobtopus.eu
X-OVh-ClientIp:212.68.233.96
From: Bruno BOI <bruno.boi@bobtopus.eu>
To: Shyam-sundar.S-k@amd.com,
	mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bruno BOI <bruno.boi@bobtopus.eu>
Subject: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
Date: Mon, 28 Sep 2026 18:06:07 +0200
Message-ID: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10418796266196504335
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEblduVIY9IdrxLTN2RzNWIcJ4IglRkvPBMxE7K1WynnXizGwJFzLv32EG2e/g8Wwkh+y+2+9mCka7vqSXlJUGHP1pERe0VigfacXMPvRAjaV8Tan4ZMhQ0vTlPoq+GGzXqvQJ2YC5484VcVPQZ7PWTSSQf5XdAUuvW8MzdrbcwmLRTGvOR6cP1uDQLcjezzP4KVoeokC7a8IsH28XMaFq4UYxkqpnozMMv1nLqJYu+2Ipnc2F+BtCe/7oBVa/pst3KTVVmXmsMAxCqbHjxEN1WgSABrsHBnGCnsVJTr5+BYmcwNWBLTTe5Djdv91XNqfccI+y6O3iNSeR3NiFIT8iZhjS1RXrbmD17FwS8bPGUWZl6hz8dfLR7+KmuNt8lT7tKbvLsGzNxSGIYguSFQbaxzxEEXY32d4/jkuuScE0fGSlmwlRNI/I1DruGt1f6C57EdwcZsmKBLtMBu2J4WzGiyLz4s8kHOUsUOmIHgJpqfAcWdLbzM/tjVQPN5yiEpeI5pAsAi83Hrk6q4ZQKYTramzB1zpVchA7EIxM4mRkhNU+lUMk8KqYaSEFmG4bTfntTwvbLk94XIcCyUAf4ffkrvkL577ZawMU+DPuEUD9ezm9z2rtvDkP+LaZB89A8Bt1E4vuQ6kblnhQMyLhxvYcmGJ+EqRARj8UJn+6yUCh6Yg
DKIM-Signature: a=rsa-sha256; bh=34cG1jnBhpy2sUkvMC6rVoyC5Cl4dYq87dmYhIWL/PE=;
 c=relaxed/relaxed; d=bobtopus.eu; h=From; s=ovhmo3865769-selector1;
 t=1790611607; v=1;
 b=QbpCogpjvbkxrRtnRQnWEKnqhcFzAOiqEPZYPYl1jSY46//7gnDPgKyWzOpUPYkJgX3mlId3
 ocJXdY9Y1RqtuJWFxnFFcXky4cLmjvziTz5Vg/faFvfgkOK/8Cp9ewcUfRox1GkoJRPlMiYF4B6
 VHNetRF6wmc8ELboR9ZwCvbNgPjjuQyM3LtInEjbm04PEpcgzmirDmN73g7rgkPeppqU3OweVEe
 F2W5kkoyAR+ucdQXbyKtYUt08vQHrszYhVwLcL6/2/3I/g2IOplNWxa3Tk1HXbZeVzzLTptnKN1
 uYRxzOULjQYvficqR/I8AmDCBd5S+1trhpG6Sw479ZnMA==

The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
s2idle resume stall as the already listed 21C6 variant: resuming from
s2idle blocks for several seconds before the kernel resumes.

DMI_MATCH() performs substring matching, so a "21C5" entry also covers
SKUs such as 21C5S05800. Add the 21C5 model to the existing
quirk_s2idle_bug table.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
---
Changes in v2: resent with the correct sender address; the patch
content is unchanged from v1.
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 74ddf1d..c3fabc9 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -246,6 +246,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21C6"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
+	{
+		.ident = "Thinkpad L14 Gen3",
+		.driver_data = &quirk_s2idle_bug,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21C5"),
+		}
+	},
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
 	{
 		.ident = "Lenovo Yoga 6 13ALC6",
-- 
2.55.0


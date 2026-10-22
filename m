Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657379;
	b=MI7MCAgzb8cHhqVbqkzpNZI6tBAuIpKTObeCYzbEX0zm3InozDIohkqF2EXVj2HlTlL0
	 gAASkKxUXCMjdt7xCetB2jk0bglx+WSDcfOlDXyPmCqTUN0SRcTl+WNeHV67kb5r8M3Aj
	 n3W5PYVrpDm+Vv5pvlhGKxAO0znDiwH+0bfpCnSNQlrcVmTtVTDtr1gX/6SzageBIvVOg
	 B86zWevMywTyFxa2tjQu5xKO68yc7iuvi53qtMp4BhvlY85G2Xkt59OOKYXdXmesRFflz
	 j1gAgHOq/3Fb9agu9beRWFsFJWmPVFCbiUdatKOLCeprRsltLYJECNQqzTKLyeQj+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657379;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=FhPC0CO4dFgM+feQzuCAeetAYa5SztUioM1cz2L5Jqc=;
	b=NeRP6Lfoy6Hyd+2A5i18f4Z+XR/soMoyNvxPbDekKQw62S7Fs1Zj/bOJygEzPX4PlYUP
	 4dn2Vjk2qhH6bH7OBtrZr5u9hXYV+u4NktR7qm+8NlVAMy4i/SXMfRUbMeVfIrsPz0SWC
	 xbZ50jprNZwFW3hh2Ki9KGqu4Gh41uoom4JCKDhKBfzo5zwRHrtGoON0uzvvx9cEgbvFs
	 rpcTj+tfcFYpLVRMIOc02Pwz/H5bzoQow0q4QRSQs7k0z4QWAGTPxlK/UxdNcS45H6l3J
	 zcg25vyu0ZJy/vDjW7vai50SUsZdMJ+UN/gDHOeMsnNVqQ2igdVBHUPvILtQCwGfsvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idLNOrow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62F060A2620;
	Thu, 22 Oct 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idLNOrow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCCF1F000C1;
	Thu, 22 Oct 2026 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657379;
	bh=FhPC0CO4dFgM+feQzuCAeetAYa5SztUioM1cz2L5Jqc=;
	h=From:To:Cc:Subject:Date;
	b=idLNOrowp8EQ61NeQAXjMCmD+iKWLwvOiz3yrsy7ShcFWR5o5vH7iGs089iupFdhh
	 j4lN/Sz+5qvF1ds6VsOrDnSCf+O9uonwSUsbUctaPpu+BJF3SGZaGpz1wDvyA0XBAL
	 Zr4+fSsU3SI9OyCDmjJalV0ndIhsdsE4gFlLsqB9ge7Db2/NHPkSoZa6MXbtKXoPG/
	 7Bm5mPoFbGRER3AjdjDnf7kYQ36PfMZDVlbaPfvpL+ZVNBOYNeiHB/Vv86giBB2mG2
	 hhEQNPnjnKYZGG6TK1v+QEHMWWmJDDKfthP9Rt8xp6vObJYAggy8WMN5L/BuYRAI7R
	 uIdkFKsBqehaw==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baul Lee <baul.lee@xbow.com>,
	Qingyu Zhang <usupergate@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ump: Use safe_append_string() in snd_ump_update_group_attrs()
Date: Thu, 22 Oct 2026 10:22:47 +0200
Message-ID: <20261022082247.1682-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=blum@kernel.org; h=from:subject; bh=jWKzkD6FgNM9F2pyHQ91YBxx+hccb7BhH3EWYjQWiPg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk3j1/n/PDH310+eaKwi+SWdm2bTww2rufbMjWFhKu+c kZd613aUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABM5eJOR4V5LkfSvpGnMDG5H vGTMvr2/NPVpgv4T6f7dlx4rvy+/uZmRoXtbvdJ+5sdsZtWFoV5BK8SXHNq9WPOFbJm+3uraKSL 1/AA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use the existing
safe_append_string() helper to append the group name separator.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/core/ump.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 3d1a2ed3b476..18780dece1a8 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -559,6 +559,7 @@ static void snd_ump_proc_read(struct snd_info_entry *entry,
 /* update dir_bits and active flag for all groups in the client */
 void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump)
 {
+	static const char separator[] = ", ";
 	struct snd_ump_block *fb;
 	struct snd_ump_group *group;
 	int i;
@@ -598,7 +599,8 @@ void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump)
 			if (!*fb->info.name)
 				continue;
 			if (*group->name)
-				strlcat(group->name, ", ", sizeof(group->name));
+				safe_append_string(group->name, sizeof(group->name),
+						   separator, sizeof(separator));
 			safe_append_string(group->name, sizeof(group->name),
 					   fb->info.name, sizeof(fb->info.name));
 		}

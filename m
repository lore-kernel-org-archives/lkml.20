Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493147;
	b=jbpiqKWXBlEj+OqfoZHMaoupa+bedHi/hD7ctutphp9Xj9YWhLA+vvVhcgFDtZvxj4Cw
	 b26js5lHg2zlyrI4sVT3houQEVbFbHEA7z14h72bIXNBKsADYadXNV5/PKfC2B1gdJmoV
	 O8rcQObk7Oy4RdYDoQ7X6+vYcPMMwVWwf+1cuj+hSHzQ9SseiVnx412jd/PF5P/IvqXC2
	 9+eDFY2o2VWK+6DC9EsBVq6zuyAQOd7xe9U1uA36l6JGvShW8sh1ycGySvResBLNBLiho
	 j+k21WmNig2n7aBVzi/NyD9IttatMm5NCgULxSmPqUf8sRsBQKqKn/fzHWl2JPC71LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493147;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BM99QRLeOHsRkVNOs28if0Z8eVDpr2BN3/xKSM9/ZOE=;
	b=LFkl5gwgyOROkdO2EQ0E3elFi0bJ8XWUFgDGHdbWJVI54kKIPS7idgffUwmd0mAygfw7
	 z6qu7Ev/2xK7rN1xOdB/ikGZObYNEoTgcA4JyzLwUkGcYi6pn42A3pehMA39JwhzXdpAN
	 +PdTMOYC6JAsfsg6rZ53K/lVfuUz+3I+JpZO35iB1eda6B3iixmFoPzoSjO3VI2IcbvoT
	 XGZnwjg4T9iJUtwPganLlN6Rlc0IeSlC+bE4F3P1sn6zc2zO8eYGIPHqx7kuSbH6FiZxu
	 xyf04EBAltXPjAIMeuIJrHw+FofOstgjjNSj6uiHnkSYl0q/tsPMxZYqtn+6SVDamrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOq9qeuJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AE606A319;
	Tue, 20 Oct 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOq9qeuJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CF31F000C8;
	Tue, 20 Oct 2026 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493147;
	bh=BM99QRLeOHsRkVNOs28if0Z8eVDpr2BN3/xKSM9/ZOE=;
	h=From:To:Cc:Subject:Date;
	b=aOq9qeuJr/QvDyyZeCpne5EnF3TUMwjrs0eQdiujQTtIXqydXs3kFEJRkR4pQWuu/
	 ZF+ONhY9eLDmUTD1Lq9vaJgiFnF1L3w+2eaFXYuzI8ECzEBFxXMTia3GcTnxO+YOPc
	 YiGabiDonSpXnPc7w2fifUn2hQpD7SozuypziXdzVVpFeBRiaMVs3BQCdMyK+FFmck
	 sJoGrIC14HaDx8eekT1ynz0/zgkrpbh7oEXc8zGEa94s6xwclNy+s28LTlTg7munu2
	 21aawwupnw2LXmO3RGd4upmdEgV2YmFBfOX0ickP6O3mgWVtfsOA5AW3QC66XwK9T6
	 0m42VOdboftng==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: add ACPI dependency
Date: Tue, 20 Oct 2026 10:46:33 +0200
Message-ID: <20261020084656.2725461-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added acp_asp_mailbox.c file makes no sense without ACPI
and fails to build in that configuration:

sound/soc/sof/amd/acp_asp_mailbox.c: In function 'acp7x_asp_send_cmd':
sound/soc/sof/amd/acp_asp_mailbox.c:59:22: error: invalid use of undefined type 'struct acpi_device'
   59 |         handle = adev->handle;
      |                      ^~

Address this by adding the required Kconfig dependency at the
top level here.

Fixes: cec3598305a6 ("ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index d64f682cfbea..baa0fbf07ab2 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -7,6 +7,7 @@
 config SND_SOC_SOF_AMD_TOPLEVEL
 	tristate "SOF support for AMD audio DSPs"
 	depends on SOUNDWIRE_AMD || !SOUNDWIRE_AMD
+	depends on ACPI
 	depends on X86 || COMPILE_TEST
 	help
 	  This adds support for Sound Open Firmware for AMD platforms.
-- 
2.53.0


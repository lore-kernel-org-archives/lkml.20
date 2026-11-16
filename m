Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803213;
	b=00+AFOQmp5Npy5J4kNfxhjlWuoXQeEG8y7NI6LTlLcLtFok8eomiA2CVgMKsfGSDIATN
	 PzQSutMk+uEWITwl0WlPCZIx1FmE7AOoTbzFeHfVvUfPhArtPJcJDOt3pha9HxJ6OiA+t
	 Xf8jaNMlGRv5bEuTYu1XxCzaxJg5JOd5w/MJl5jMMesvLi3biEWQQrs8gtUvjEqRC3Q0i
	 Ygc+BByVEyAaE9FUUCPDsbxMqsxbd+kSqYtIxi+XASkiA6zBjN7xtf2sPG3GOgAYqrNFg
	 f3NAN8aFV2xHkCmgxEC/ArJZrJ1X6yAR+ce3GOXH9ZiVR6Lo/u378OG5ndy61zV/enA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
	b=qcq3xvMQVA19JV6HObIxmgLseU/CaBOJj61ghrSAB9UqVPHax61ywORVy7lHwG5cA+4X
	 EVSCaUrv3vjmNUQHppBkLr6pgb+maWKrGGiHsuwNS7yxrqQf5ASihC/MdW9itZRbFPkR9
	 90khxEIDaXTqmHroT/1ipXXXWtRHm9kn1EZTOQEsU2R/4/A7vsn3u05iM9Cus13+95x7n
	 negzAnHwQJeUDyaHqVTxNsI4DbGvseJbpzNoXBTdbj0D5C8qZaPBGu3dx3YBLLAxLTgkb
	 vfkkyG4/33BLSHSpjTGdKEFY/B1CG0Op9pjPiWrc/pPFt/P5RnQUtHHSwyjdefNL6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP3Ww7e5;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP3Ww7e5
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e795af1d4so2163252eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803212; x=1795408012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
        b=aP3Ww7e50cv3jnIO7KWkHTl6lutK2933t8INJUv7OZZum7NzMaO/TWusjU69vIFEAu
         yi/42o98IDYPrCmV0UJq29ozY99J+hGkHMUzX8PJSuAuzMpBBFHv/Nb3o08UMP/TcKll
         WWGQFnoFi6iB80+ExcM9KFnRs3VUfRiZZKdRbc7uPaDnbw4JZhjOUtUiVzMuvjHo+YSO
         MQzJ+8FRl9/acM8Mp2G3xcokg76/kjgxl0ckrWQfIMTYbotnCONzlONoeIefhFt8xMeP
         DwW+Pm8fYWpVaSmpVX3QvU86JXOTV/TyTRrrv59KXVoxOSMg31TIql4uWIDNcw2jh1af
         oVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803212; x=1795408012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
        b=pYhZgyviQ4ghKaIX9TglhN9CxPpl45beJxjbK7AGiqkU2pmELYevx+bl8fIgF1Zf8I
         /6cDGDZf+4Hlb6qNw8mFDekAayY83MgTqeNJn3RQvZD/qf+Z/474FNHnD5jvKUe6O1xF
         QxOboUKevkcznkIL3VfAQSBRpm1dGyqOkejQ9JvC1QW2AbbO8hUV2PXef6fm7PqquijC
         sVmZrEJzoPJmLaoFESJQ81gGxX1sXXzpgsmaNWQvAWm4U1IHT3EM4GEaAe42k2To7ekX
         EyoKXWnWleSHMo7HnvJdf4NIKecr1dJMti+nOfHr6gWQn0yEgs3dGAA/VFh4YwNESyy7
         t3/Q==
X-Forwarded-Encrypted: i=1; AL+hErEO75xnOYz97ebutElFSPOX8TBOT0iP9ieUG2jTE/A3i4i5uQYCXy9u114r2xdZflyBC51Hh/IqfAxBcmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mCxuuiXKqsWyPfbckZd82S6lFHyrGMfVA0xuRfu5K53Qtgu7g
	ddWSHDJ32atL+yqG2aDlKuf3LmrgNd402pw1u5XLPWuU8jcx7Y6i1dkP
X-Gm-Gg: AYBFou1er3h2rWzd506M91P4id+RKl3rLodXLurng7Rr1jkBUdg46PEDdvcOs2TWZt1
	0uJxg7w+Gtov1WChXVbuLff/6xqwh64AHTgW2I8ktfmsgL+p+k5kggfm8NRQgd93cRz7j/99TwE
	fo2wIF5Y7UsOnc23f/ihDHnlV91KyvNdmtW5fjz2rzvryk0h8p3xQNoSxou+3y+DL3L+47lVQew
	0SnJ5hAdV3nZ+uswXrc6/jqIQZCkPYyWDUxYYMgnmHbWNsAjgZDMzwK/w5j398tvjBD9QD+ShHd
	jH/0iklFvnoVXU3YYJ59wzzNrk+nBxL3hLyG7iF1LLM+dmEO28qMPE9F1sxBU4gXEKxKDqN9GCZ
	cVIuT2lsx64nY6W/HlsdPgmL8uIZ9tpn318TMWOh7ggu6nIy12O7Do3AYyDdkrdA3usUrdJTBms
	PgzY39Kp2tTxcgf8ucPim3mgpb+1q34JQoryz3h2iNbDmMTslhPl79e6sJSllQWSaKnignr97pj
	EHQIKHt/alzV0TMXO2ZJJJUWoml3oV0EJ3QtYwOtIhhFkmNbFKc8H+fFRn5fwWXNgX1jLAvJ8ds
	aqNQCa3S09X0eC9KAUjDpXXS5O3vQvTegdcWZVFu4amH6BH56d8QVhOOdoR+AAWmFfrvJ1kUnss
	3CJRnss62ULaTWn1ZRb2NkxcMPRz0YYGqL3BQarWCUGEV
X-Received: by 2002:a05:693c:63cd:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-379668667ccmr8906944eec.11.1794803212184;
        Sun, 15 Nov 2026 20:26:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:26:51 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel-classd: Improve clock and probe handling
Date: Mon, 16 Nov 2026 11:26:31 +0700
Message-ID: <20261116042633.497423-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies probe error handling and fixes the 
peripheral clock lifecycle management in the Atmel CLASSD driver.

Link v1 : 
https://lore.kernel.org/all/20261113103727.30449-1-phucduc.bui@gmail.com/

Change in v2:

 - Rebase the patches on the latest for-next branch after checking the 
   Sashiko review page and discovering that the patches could not be 
   applied cleanly.
 - Use dev_err_probe() for devm_regmap_init_mmio() error handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-classd: Simplify probe error handling
  ASoC: atmel-classd: Enable pclk during probe

 sound/soc/atmel/atmel-classd.c | 50 ++++++++++------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

-- 
2.43.0


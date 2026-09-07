Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E503C5DD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774834; cv=none; b=N+V3uBPHr3ITz77xkSA62uhu3wYuQYqQtbon8B33msa/MYxLQHWNBB2JDmaCe+AOCRwOsBu+6b8/OovFR72z2W/BkQFX0UCMsouQvxYfjx+qZ7j0ehrgdbVo+wzWo0u1DMouJHY96olxnSUSbA4/YZrqLSF9FlxZegvbWUGSzaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774834; c=relaxed/simple;
	bh=tY5NnhQZpDSdyWxYoipDRZaMQLSvDSC3Hb6EbUbFWm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y91a+nb2IWWyUH0XIvoLrWo5wYAieZ1k9mX5+SMLCQFbjAElgERVC+6KW76/B6PbeVcLR59rJXSCwYSCogxGLKz0qhVmcCQd2AZWjUrmMv3epHxwatbkH72Adxjwm9fySrOrXSbufy4cOh0LSNmBUqnHhuYfX41zBuBpZmakuRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpZakA6t; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpZakA6t"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbee846deecso4158468a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774833; x=1789379633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPL4aNtiXw+QNEKnkbqTe9V+ETGQlK0apxkr/mZWEXk=;
        b=fpZakA6tcgYr12SoAsuZ5uc8558bWilSjaGa5FMJd/vfGB74NlctEdOI0oFqpk6ijK
         GuyiPwCmAUpR+loLNT8eqmzuKNxK45MLGHA43I1msjfts9ihKiu3H5XSvMpXQ3QQp0Gr
         +Gf0gdM5MshOPRPkkaknxcastbkxGaS+6e+RavwBTaI2+DtTHzGVreBQhbnQqSKGgQDB
         fGcmDNDWsBwRp7s2RI/L9xirN9lmbDxsdl90I5nRO0m+RG27QWChyf2mQyXFszICmkHe
         mPnUJ2cwj7KVaAW/L+EW+1OhRlgkXHSVm/JosEx+iPioTDTN6JmSVbznow5LxrC5NIPL
         vgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774833; x=1789379633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPL4aNtiXw+QNEKnkbqTe9V+ETGQlK0apxkr/mZWEXk=;
        b=g2deUZpdHKZT8JgSQSBehEI5h3Z6GBg02ayD23agmbLZTpaKw1NknviCCuDf2HXCCp
         BfxRT1B34ruIutpDWBYGJG28xC3wjAVaEWrRrBRFHY2xMTkRXB+wzUtxvsnEsKcTmIi3
         votVzu1vWPMvUA9VDOUEz1n4elF2vMB77AVmBLORYXU6lhHYg22eajIg19ekPjBrTVzi
         j//Gg0/0dZvGqGB/LzV35TZ+F1rsiSvWaasGzK6rI8Q33kvvwKHMYs+SQlukl+OFAUkG
         aqobGm//Ac6B+/Fh4HGqwgO3WjgEysNtmk6KPTWK6tKEGyjGYkAcQ7cMLhYVEBHlRdCC
         ltnA==
X-Forwarded-Encrypted: i=1; AKwUvBw+4sFXfLmE0RDSOhejmPQDA/J8u6/Pn8sNn99wWGKg9XRXHuqY2NdfMNMskla/GmNQo/qp26iQpWAD9rg=@vger.kernel.org
X-Gm-Message-State: AFuF++mblFpm9J1BEwGotGDq9hHoERn0cTMHTLlTqlZw8o58/qN935+c
	/tDrncyY47e/IIpx0KGs1FXnWY1uOSfoueBM7VWInfXTyT69+fINoL6JPZS4Eh0zzJY=
X-Gm-Gg: AYBFou09a1Ab7iCqxr+TbK7OAPWIoL6w0dh2J6uiI9D4LGeNLpr0R9G0wne6rd7/wjb
	381kiUcqZrj1GWxhHWecI+rBKDoBtN3IyNvXwmlXOu+URtBneWlgsn1+RS6ak2P78fvoLhRVe2c
	0qc63VEvH8/3HkJfHE04k2JP5lmx1Loa9feNVdLKwJWOjAsghhfOeyl2aZz/3GP7hh9vVp+PUkG
	K7zU3TvaqAiVodBx1gQ0IY/h1LRBIUaE1rHBnbQjKMw/bdquVQ6Ih/Wp3ZpPOatuy98SHyOZTp9
	hdwCOcgUtJftjg0CcaiwBVM9VYAUj4tH2GSv+K3CCHUuGadtQm/tFUW9RptRXjV6BmxrRlzX5Pi
	ZrlIYT2hjSdTnhVArvqahTBk5E2sooDAoSoPh+oXAd3gJz5nEWflp8ompWPBNd2vN01EwmW39VA
	PBczK0VvI+NbJGDd1at8vdkhem8lZDVgNJtJGS2qsKqCnauu6xmQhtTCs5Nk/orj9kgFQFDnwCt
	Be2U75e9/Soww==
X-Received: by 2002:a05:6a20:cfa8:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3da3a0aaa67mr32108608637.16.1788774832692;
        Mon, 07 Sep 2026 02:53:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm30377066eec.21.2026.09.07.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:53:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 0/4] wifi: fix typos in comments
Date: Mon,  7 Sep 2026 15:23:44 +0530
Message-ID: <20260907095348.26094-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comment typos under wireless, split per component.  Found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

v1 went out with a bare [PATCH] and a "net:" subject prefix.  As
maintainer-netdev.rst asks, v2 designates the patches to a tree, and
each subject now names the component it touches instead of "net:".  The
series is rebased onto that tree; the diff is unchanged.

v1: https://lore.kernel.org/all/20260907061417.33729-1-hemanth.selam@gmail.com/


Hemanth Selam (4):
  wifi: nl80211: vendor-cmd: intel: fix typo "firwmare" in comment
  uapi: wireless: fix typos in comments
  wifi: mac80211: fix typo "capabilties" in comment
  wifi: mac80211: fix repeated word 'used' in comment

 include/net/mac80211.h                 | 2 +-
 include/uapi/linux/nl80211-vnd-intel.h | 2 +-
 include/uapi/linux/wireless.h          | 6 +++---
 net/mac80211/cfg.c                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)


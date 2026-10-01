Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E09E457E7F;
	Thu,  1 Oct 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865921; cv=pass; b=KVZF2YVKaDyaHFiiQvPIvG7IhMDQKPmhzMoNjyK4QGSEU7t+ttycPjv8aQz0xtQKefnW7hI09kH63u4wgp1C70CjWCNiHW+Y5nGIJWTa9W43gxliFx9WSIJYKvdtTnRSblZNZG86UPFRUwMQ7OIHdi2rQMXmJwRQOItiAV+fapU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865921; c=relaxed/simple;
	bh=BekAdl4V7Zy1Q0hGuYnmnpejNDblWxGABm9hF/B65sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwU5DlItTBIqCdtoR8BpS613TvaWV/ncSzYR9Twle6Auu1YffeYExIYdN0hZWPn9rOA6QYEqCakjVTxzGlNDwroPCUogWa0Fr78UXXEu3Kwexa0heOU8S9u78MxMuJGQeq20gl+jI8dXwAM/rD8OSKSu9SMCrvJOR5K5QsVWmNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=H3Fv5avl; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="H3Fv5avl"
ARC-Seal: i=1; a=rsa-sha256; t=1790865908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0OoFjwwCBfGU7Jzs7Ue0vADJPz4XTho2Eg759ufRQi3FVKRhzKQInnc952/p/u0p1pyGBoSefkmHlf0WfZlQvMByKdqooAnwoHCJLynNvsVJIV0gaxzMCV/kStR1u3JQJDrGUDkZfVJdP+Pa+t7PdTVg7LoSIPbslUvXB+qofA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790865908; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vylu7oC7KlwaP9epXMPxXOEHT37v5jTpXUVi9RC+ylA=; 
	b=OU9v55DpZRydL22P5i6tNoj6q6iC9VgyV7keOIb+CBmhYsaEP5NSP0XRFiIN1EKbYQzyKDz+7bMTDGIKS+VQ1ALo58uK0+O0oxRS5nk4odKe/s0AupKKHVmtlXrNWBdSD6cPicCqJs4/ti+hkPsY73PDi0tzVT4Ohs3l4A688+Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790865908;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vylu7oC7KlwaP9epXMPxXOEHT37v5jTpXUVi9RC+ylA=;
	b=H3Fv5avlZbAjM7vHN7xu11eRQ8k5AYFu1OhNokTISThG4f0ujLHhFfp0kypcZkJg
	LsDor446qmXax/4NO01Jqymzh/40KJ6aVqENUle3Nt1eBpXx13ItIlAh8QgX8jeAHu7
	PpcSYl2L0xbEI45dyGxXTsdM0YvV4pml2Ur+TLEtBjdQ2kNZUI+qdgY8V0DNw+y7Pcn
	pPldBWAc86oaAXCckqjIAcb1dOeoRO7LwN5DHH0pj/MAhfmPBG+KTemCfesqfhZ8rTR
	tzTB2wXcqqbPxpFd0xkE07PYcyP0AjE3d7j9cn286/ge2fr8+mEmRAfj6UPD/EWienz
	mxmfwOhMwQ==
Received: by smtp.zohomail.com with SMTPS id 1790865905401744.9452129344045;
	Thu, 1 Oct 2026 07:45:05 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 0/1] ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers
Date: Thu,  1 Oct 2026 23:45:00 +0900
Message-ID: <20261001144501.3050667-1-me@harin.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I fixed the memory leakage in dao_clear_input() and successfully
tested this patch on an AMD64 system with an OK0010 card and KASAN
enabled.

However, actually I could not find any evidence for why the original
commit mistakenly removed the kfree() calls.

Please feel free to drop this patch when this change looks like it
has not been verified yet.

Harin Lee (1):
  ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers

 sound/pci/ctxfi/ctdaio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.55.0


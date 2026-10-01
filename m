Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1444A3D40;
	Thu,  1 Oct 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865921; cv=pass; b=A6Vy1JYWk+nd3aVkfxZnWKE7YDGUNJkaUcCVvunNhA+fJ9MOdjGOHB82vpxUJ6EX1ZgFkWdHrtYntFkOShXpXECaFl5rwmykc6Qg/pKNu6EGB5n1QtIdJw8R5uOEJaaxServDJaKiUCJqTUDwXA4RfgtL1QtrzZpwzb3bu7zvOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865921; c=relaxed/simple;
	bh=3v7fp5G5GLL5Q0DRSPb9nWn6V/iIQmg4PN9cHdVUn+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DyXyzlr5Iq9MdFeitmvFeS9LvnVcaLuwu7sHskvoBbFLEpmV0mEp8AkORfM8UG9d4TpLKd0zTTPNQSUSz7uC6cWO2gJ97kuEgBdTseOQORSW19h0Sy/ZJOU5rZsuZLcQJNbVYy/FpaCc7sdAPotcDIqxNSvhFH9e9LKy2BjzBUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=hl//iq+1; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="hl//iq+1"
ARC-Seal: i=1; a=rsa-sha256; t=1790865910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iI7G27HzlrR01gCcG0wmmVLypopcdyk++dq9Ju59bDN7N1AhsmywZlb9EK5FiiQ10in1yNPex2ttmIwb/H5bsAqeC8JGggd4ISghzPOKslXgeoRUFWztcK93OfIDl3S8nMPiLTtjr3OFrl+qUM3KIwSc+TBG4P6JW/R4NlJdl3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790865910; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+rgGwOyD4Vp+uZoFeoFihDByG/7j7YHkaztcZkaw4/Y=; 
	b=DVeNyRlpJQQQ3AkZ21W9QWkSBd/AjdOZ1P77MKKTuMyD9fOfiWLEgMkSA1GpXIBVSdu+JGbZVVNm1qLz05XYOwAwKZpL28bx6uvGQVJz84nnhArRRKHxYCqFaKnyOhiVrXaTcFdI5ly2OIBWfULIdmqr/vm8ZzbDX3O5nsq8ITc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790865910;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+rgGwOyD4Vp+uZoFeoFihDByG/7j7YHkaztcZkaw4/Y=;
	b=hl//iq+1jHtemuThPjxRJtQ2Oul483gDKe3br4KxtRdhXwH62UfEpPeZ9T+mSZuQ
	LPNQSobd0cdnufEeIIpqiZ09ec5uvWfu+b/1DSAQbbuDQL/Rmrbs4xQXoeRkr5YGKDo
	rz2U/2P1PpU8adMHV7SdaQeGUr/uQsfqttVYxe2gMKXDQnfbCic8//vrhkCX4sZLdkT
	YkPBEPUOeOtecosG1Bf5PgMkkVe+Di/plASoJqq1J+OXC98kfVWXXWwNLHb/s8tnn1W
	bcMzr7ys3leoWXQ4P6+yVSc45NsvnCGmaytgFLQSic7/n0h3mrBtxkFd2WCIY6lPMob
	mVjE4+xNQg==
Received: by smtp.zohomail.com with SMTPS id 1790865908035680.8448213802171;
	Thu, 1 Oct 2026 07:45:08 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 1/1] ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers
Date: Thu,  1 Oct 2026 23:45:01 +0900
Message-ID: <20261001144501.3050667-2-me@harin.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001144501.3050667-1-me@harin.net>
References: <20261001144501.3050667-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Commit e576e7843c0d ("ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions")
centralized the DAO input mapper clearing logic in
dao_clear_input(), but omitted the kfree() calls.

It removes the mapper entries from the list and sets their pointers
to NULL without freeing the allocated array. This leaks memory each
time dao_clear_input() is called.

Store the base pointer of the allocation before clearing the mapper
entries and free the array after removing entries from the list.

Fixes: e576e7843c0d ("ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions")
Cc: stable@vger.kernel.org
Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctdaio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 9be70c6862ab..27e502fa493e 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -221,14 +221,18 @@ static int dao_set_right_input(struct dao *dao, struct rsc *input)
 
 static int dao_clear_input(struct dao *dao, unsigned int start, unsigned int end)
 {
+	struct imapper *entry;
 	unsigned int i;
 
-	if (!dao->imappers[start])
+	entry = dao->imappers[start];
+	if (!entry)
 		return 0;
+
 	for (i = start; i < end; i++) {
 		dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
 		dao->imappers[i] = NULL;
 	}
+	kfree(entry);
 
 	return 0;
 }
-- 
2.55.0


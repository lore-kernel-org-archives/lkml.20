Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218128;
	b=HOsm5BQF05DB6GFnGHtBTIr8RM11C95kqIWSGz0x379PydNbzAvaNSMOzOwUlyFfJZ7+
	 oViivAY3d3TJyPA0PfMq1bWp9jdp06w17s4v6xTxX2BidB7i3ZXoBrzp3SsdNT0I4WxNE
	 RdhmF/GF1+RbtAQWceB/Xb1Sf1K9fAuE6LlOAA9YUKKeJyTVMcmrx6cp+bzlc7n4Jx8qT
	 icq3MhuDVQPCvMnyS6FnCXktwBvZzxEpuM/SO65e1toTHA4w3pumd3h3bXCqRG7Om5CSc
	 KBbjWDAftp4CfT6cFo8qUNpbK8ctLLY89Sz1UshHqxgpz9ndrjWuuPr8JkoA6dAc0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1Z0YQafCG/ds8K4nf8XstMQMpN2YG0GXfEJKDLgVft4=;
	b=tBXEeTQUIx18kghDng86sKIlPr+d9ipIIMfshgZtXWLUxDKIPWYkPuhKy0Bd4AnVnlQJ
	 GwW9TF5hyVSNJkfHhhj4EIouf2ZDwtp13nbW0urAaVE1GzCxVUHeAlPuOvBlziFiB8Zho
	 oAPZKvBQb2ts1v4qhOPws1ayFKEYm8PdfVdVO0S4tvQNPYZoVgz4exFI94pV+jzvD5Ajf
	 GcENxwfSvxUDEKgy+fcdPJK0LfFlQ4WgIXVXOfNELbUOBa1JO5Wn9liAU0tEm22IvZQEy
	 /vkWHtSlm5dR+aSnC6TJc2CSfJqPLXMsONQxPv0vY/I8TN1OaNT0NswTUkesj1M2v2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqqflOg4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550D8606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550D8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqqflOg4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso744932f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218127; x=1793822927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z0YQafCG/ds8K4nf8XstMQMpN2YG0GXfEJKDLgVft4=;
        b=oqqflOg4/vH1hCedy0ab+pYyVSsCyDf6kfCImm2ZNIfpuufIYMyu4qqV4z6BQUP2B7
         l19YN+fUGZkvtdD1IqOi97B/VPOn4WIZdb+iOWdVU8zZzyu0i2EDqY8Ft8/c+qN714ld
         i7ZFSgNbVG6twyWRBpqcKEUAkEUEin6n0+rCIT/VyC50vmFyJlO/BjdwYiVVIZUtCOFH
         VhT+L3VizqSK70fjyDl5UdtH0PkouEmQL/z94EcDBF8LjSw2tGTCjiu9hEQpEfNgFReg
         e6TvyGRTFEqi7qAf6WEjtdAyH2JCb7ky9AYFZ27IZ1pBeR611JBmmHQva5TQakQY6m+p
         mKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218127; x=1793822927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Z0YQafCG/ds8K4nf8XstMQMpN2YG0GXfEJKDLgVft4=;
        b=PdtSEuZrAJB1zR0nqjlg8z+/G4wgdQBMytjvEttb5yV+KMpPWU6X7cAojk6LcTIoXV
         p6WjbW9zDmPn8mKHWethpn7PhKhnm2Du7aqLIOclLMo/axGrhVssWp/uYeg2WIdhK2If
         /3E/AAA4VWTwBiDmcmIolbQy2WyrpApuokF0YcUu/tdCrxerjHmhuyUskAUYgwYqrKrf
         96V28XjFqduMEWLNj9pv1BOR5fFRiffcgqL8VV9aPWnOLlbJ/fp/iGa6Yfk4SIH0oHAO
         mU8hVy1djioSJt9fepHMJGy9QQboyFWfd+dKG4K55xcJuh1M4IZ4SmJIxpvMDt6kUm6h
         v8yA==
X-Forwarded-Encrypted: i=1; AKwUvBzMqhuuH0NoDmDOND/E1PIXUH3It6K/WPtAdBV4K7YIItfbvGjzey5T/7Y+OHZwnMXZWqhcGSAuoNko4zM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrlY9JM9Izmak6nkofDj5afECoyZcpU92LAOsAoEJYbzTjbBKw
	T+VrP8ISlNd77mUZsAwJ1ml9tMyGLA6BBwqtOFFOgvWoHgSUXuz5+6kJ
X-Gm-Gg: AYBFou3VGhaFLOy5vU7SuzqeVQEeS+qw1CwvD7jeUcKAL2V0n1DcHA8n+ExGGzet9zz
	bWEHIs9QV3vsn4BrpZbDWI6q7vtCEawHMO1K0G2bBSNko8IY1+0dJku8orsSUPh6N0895tJ1wq5
	9lpO5JfPB2YMgTgnoTOwFqxom/J+zUMUl8yekRQWsrLFszy276ugES5BWlwAM6aXunRt+kWUt0S
	yU92gzZ0GoxAnUYpYBQM33L1n7f/Kxe+KEQwpTqEgHOKK8PIvtYHNR2SwLNN2K4S/STxhO1/sZA
	ws7NZlVPqRPROhZDYI8KkdGmd9E1mYVQ/cbrzuAlBB9iV89gJu3Hp+4OLBoEQQWJJ5FytDavnOC
	u/Y4Vj/4KaslAjgwEgLTePnsapt9rbUFJif/LAQ/9AuiFZIxZqSlbesAHkF8laKU4+VtqZOA3KG
	ils2x6z6B9VQn6WB6PuONt0xFDYPwtS8PyrDEeLr8GQSVSebGReist2rUCMAXu7PkFyWZLHhqM8
	iNVWeqExk0ZhoaKoiTJ/YQw637e6N9AItTbcZ+wvzDFo70a/15MtzOYjH+bqRavL6TYHFIzjvtf
	cUUFdoCsUOEYa5qN/g==
X-Received: by 2002:a05:6000:29cf:b0:487:1575:ebef with SMTP id ffacd0b85a97d-48e5d311eb9mr5672419f8f.47.1793218126745;
        Wed, 28 Oct 2026 13:08:46 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm30134320f8f.4.2026.10.28.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:08:46 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH v2 3/3] HID: logitech-hidpp: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 22:08:39 +0200
Message-ID: <20261028200839.202670-4-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200839.202670-1-mail@taterr.org>
References: <20261028200839.202670-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the force feedback sendqueue.

Use flags=0 as this workqueue only queues outgoing force-feedback

commands and relies on GFP_KERNEL allocations, meaning it is not

depended upon during memory reclaim.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 27d83b8bbaaf..c4c578c42182 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2875,7 +2875,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		error = -ENOMEM;
 		goto err_free_data;
 	}
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	data->wq = alloc_ordered_workqueue("hidpp-ff-sendqueue", 0);
 	if (!data->wq) {
 		error = -ENOMEM;
 		goto err_free_effect_ids;
-- 
2.56.0


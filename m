Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A54518149
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904406; cv=none; b=Whin/vrFj7HJT0mKDz57P60Sd+d+0IQlnMI1BDex4jag5GJncy1wwXleDgkvdTcYSkqW6bEL9NFxYqHSZTWP7RnKb2pLQA84XiN/f7t/PmwAvaJcO5phdEkPo0FNpiDjbLWMrWQ0mQnG8YbSh/oiNmmc7xevhxOkPu/3G1xM5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904406; c=relaxed/simple;
	bh=v1oMUlr0j+OWLBDHKzTtuO91b3I1/3rK/UpKQ22TafQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mmvv98BIpy4b81CofZpWuezsxnRu3uQs617Zw2kiE2sJtT1waDqPpvPaZU+OHopYg2h7gQeqHciO5jcnkZiFR3XfzyALMoBWS0pOIrc3SSlwJ6K2JO2Z8/e2p3VQetrGFrRjB3kjZXEdF5beHR4SonCvY5MP55f232gB0bMVFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=BO/JMK64; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="BO/JMK64"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88a627ce016so979435b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791904405; x=1792509205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xsC6RbLkcpl6vUO8QFll7KRyQolqiQv4TDUNdnm1Dc=;
        b=BO/JMK64Z74MaNO+q7zVPWzD7WKKGsiQ3vTyCGp/RfLfZPfZ/T//OhVTs3ONKwg2FX
         A8WaCm1M01iu8gS+88iYKgL38CsDLs20272kd8u+I3+z+9OCcXYA0PUA1MzPs652aZIj
         2yPupmVDDRExiLYvxY9NdG9TzmYXEm3+qxGhCJokC68LTVnmb34z0JQ50/gbDhkpwZ0a
         2mOYpfTqH/qjQBjvR0i5TtsyJG8Nq5YwlF9ymrjPwRfrFpV99sPD+gPmBVMLpLERkoEZ
         HYuC55kzisFI4KWky9V5Msgl9H4EseUS/78eUwTA0r4IZBrakLh4BCgO9Sg+AX1pYkPN
         YUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904405; x=1792509205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xsC6RbLkcpl6vUO8QFll7KRyQolqiQv4TDUNdnm1Dc=;
        b=RRcO5q4paahh2/KE2eMVjeCb3wVn0KwPhTWH0Fo8iEmjzYAvHL7EeWhS6nZf1P4Cyx
         wJL4kVJ3IOLEwNkoDc/sa5rOUH88KEnRPHxsgUozdbVZwh/3mQLBWV0WPwZszT4ehreA
         +HGhqxIXpgBq4J+lKLd0aI6U1uPE6a3mhvSblci/IE+rWOLvfs5ZUoCP1fLYrhrqDboN
         chJpM47oyrxz2o/YxC69Dfkpss30aaP8Ox0JFcy6PVJfh2grIl0rpy71sWrWSFAC3VT7
         9gptiEL3vajZ1jGfqTAxwX0vZI61ZnZoTqMUVw/LCDFgxbA74yTBU+TLf6IHJJuRsDz0
         MHXQ==
X-Forwarded-Encrypted: i=1; AKwUvByhSkAfxF7Nw83nZnPGO9YOnLaQJ6EtpsFiRi9bPlfJBw92r8jnjHE20R4aLUvg/e7511iZNYQMyeyIXVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtowXrYQAnO7qfTfh9cG/+PN14cEdgbEDZyp5I1Gb2d5YoZwXt
	K8Np2KBTazOgByD42Ar0kITfpIXWHpZGdO24KgsIXPDnB7c8UGoddsSyj+6DZWwYlS0=
X-Gm-Gg: AYBFou0OraJ+OJFdfWRxTF5mg4vm+FsRu2jmHJ6dEPbjL/cWXbgMTa68hdQvPSrlV3a
	coUTXq/hoeM54Nu+lQRNYfVjshfBz0WQn589myyz1iJ2NN4R63GV32hJ654hmgQtt0N4FS1Ce/o
	5JhiAoSjps7sJVvBF5T+RIXmsTHoKH/TTNhwINRFAcQ9gklQ2Rza3CDJrhtiGSJFua8m+igLGWj
	pEtrx87dORGHRHgKhuHPQWegqLpHYe0jEp7nUAQXVqVO3RZMlou+5HRsfkbB17CAwojHSUJ/eE2
	kSxpevvvxeL5mAA5Tvina64SUH551l7o3nDDKjup/bY9s4k7VXpYWxAFmm17wOS7fKEPddus4rO
	0OJ1/ZOfhto+5J2SEJmIUMqme1qjCmkr3a7wgVRnlnGfFobT5lh2kt5X/F+EfOOd8jk/8q08of+
	0LacaNXcmwxbzHh2dfy6z35UGDrP6c+exkZlFo5erbJ3iYZsPqBPDl5Zsuc02caqJ4YNvFqBD8b
	g3qhcdhdKS82cocXZTu
X-Received: by 2002:a05:6a21:8217:b0:3dd:85a9:55b7 with SMTP id adf61e73a8af0-3e16be2b1e4mr12853348637.34.1791904404981;
        Tue, 13 Oct 2026 08:13:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd614dfa382sm1462434a12.26.2026.10.13.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:13:24 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	aacraid@microsemi.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH 1/2] scsi: aacraid: bound the SRB sense data copy to the source buffer
Date: Wed, 14 Oct 2026 00:13:03 +0900
Message-ID: <20261013151303.3169745-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-169890@kernel.org>
References: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr> <20261013140214.3156938-2-yhlee@isslab.korea.ac.kr> <sashiko-outbox-169890@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch only bounds the sense-data copy; it does not touch
scsicmd->result or the srb_status switch.  The result set in the
status != ST_OK block is in fact overwritten unconditionally by that
switch (every case assigns scsicmd->result with '='), so it is
pre-existing and independent of this length change; I have left it alone.
Resent as v2 (with the HBA patch dropped):
https://lore.kernel.org/linux-scsi/20261013150420.3168223-1-yhlee@isslab.korea.ac.kr/

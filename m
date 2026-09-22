Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCC53D9F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092529; cv=none; b=X6GNkkMY7tw36t1tvrlyRE6iDl6xNbVElgjTqPbFdk5KuggHeHInPhucSAJJ6v5nV70XJLM4o5OwgoKpJCblXDro64XGw5WiGAYpu12c9scQV2YbmmixyI5bls/v6129fZDJlKUOWQe2MUiHKGuJm+dBT7qjGxr8OQ2v12YIa+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092529; c=relaxed/simple;
	bh=7msfHNMkfpLZ1KHMsjSAvVGA9heuhV84fUsTNvFtIlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZp+Lg0QIfMqTq82I1Uwf89+ENZZUONTfPVsCLVYiM0CeVyEo91IU2G7XScDOsbILEGDVS0BAR5cAXHZ0tXnQK7X42KYnYBiZFM1XavrdzmpJZeykmqLhQeqyZ0CsFmUqGRyCUWwcffG1+P/kev8JUTle4h5yuHHgKJcrZAkWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVWUsKOn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVWUsKOn"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so61591a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092528; x=1790697328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRArySa0Teo0omwOHf0fDNN56RT6AwwYq14UA/kvV5k=;
        b=NVWUsKOnvz4lNQN1z14H4dCF4UdpN47ygDjrHGzORKbmLRI/6G8bGNLzUycglP6O/0
         tjUdsLkoV4VqiMUztZArQqsN730TWz8JzAzYF1nS5DgtjXKBbQHlvb06zI3Qclb5ytsk
         QrYNx0ExqPQcvlGyy4gpGmheLEIED8i7NM0GLxlPbopWZh9uSrmZHcOWfUrBQ9hEFPMA
         0BPME56FaJWRYeNnBLeTh3wkONEdGuVxXJoyslZgBNBB+ENFckJ+95TCD+dx1JsvdXJo
         LpjWa7NpXy2PxYExl1/KNfriVkJVIxMXgpiMw4D9PIgm3U99yZwmO2ee73YxLeDvSHLv
         nMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092528; x=1790697328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRArySa0Teo0omwOHf0fDNN56RT6AwwYq14UA/kvV5k=;
        b=aD9Iuff0GqNn2/zXG8lk1lBsUhdI04N5gO+P/q1kfiun+C0mOBhHOfRT7Pvg858AUm
         VTGCR88xGq+O3QxdOiymREgsag94tuvOApcTeMERzGW93MpIawidESD+IskBXtUupNBz
         9ClDBerDjnbLAce9jIOokoHMAig4FdsyRmEw9i7d+7NgKdxec6GRTBtN/G5O2g0EeTUz
         M/0jHIzfjh08fqRCC4A1E+9I8uwsUzFu9Ww8bkb3yaolrVekJcjvbw45dKyAQRm+11vV
         XcwU61v63+0qI/DJmihfKkYaoKLTNU1ZZ23ww2VwofoV/Y3Edgv+7WkyYP66soAKy0Kb
         8xNg==
X-Forwarded-Encrypted: i=1; AKwUvBzor4OWZfZRS5MHEwhMeCxzFpPK3mWabq5kqWeGEpezwbj1RayZaP70pQOs6Op/4hFI18v0Y66cX03Ukg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lFhkHM/jHXT/PbfEqNTtGwgpiADCEoa5AaOKJ96JgpNKp8IOQJ
	ppOQF/caP7COszwu6PA4fFVd8dqghDEz+NE7PB6G37TQMIe+2SAKhO/y
X-Gm-Gg: AYBFou2eLaKHzufXiXy4VEsP+suwUS11fVHu619UIo4Ks7cN9xhO0gkdSWU7GgrFb+g
	wiw4RV7Y9vH7gdIW0I/l9xfHfSHvbGf5nPzBIqOqbX9B62dLwpcr1VMoU1dQLG5XqJZ2PU7YPDf
	mlWdOcc7FopMVmghf1jesaQ+arrXxreFufTqbFamFHH3hs/8Rv9ImSSAADnwP7Urm3URLYm6ofC
	WOFJn8TYE/mZuEEs4AOvivLnMR4V2SQIN38NU4z5AxZPLDeVh8Ye7SUkiePAS3ME7O3Hn9O/VqW
	lFso6F5upD/c/rrT2SBIVYVVV5r6FxP928itwolIoqkav6L30E8E7VMUegXpWmo5yTMgJwJWLBS
	Y4/gACFbD4bAH/pFc+mKJJacd8GtGf29OljrlEsAb1+w2pHpgVcTUQB+M7FpBkz45Ya4qKRGvJ6
	Cka7ETFZTsL/2kYXPqf+XKBqA7JqWCFVpzlXFTLANKLz0xVFZ+hxJVJFJfdvxB9VDdbt9dIG9wv
	iWY2TNnUicfDcEPLa3v4hU4JF5PDo2JcZ+U/qbLTcMMPvnH7kx+wyDgxYmQFImmYjV7cpNrnq6r
	Dn+589zkqUrnY86dEpcqqEEumJZ99gmN6xOuOWL8QK522HZyFUzjEn2rNELUtas=
X-Received: by 2002:a17:90b:2588:b0:39e:6c69:f474 with SMTP id 98e67ed59e1d1-3a0732431f3mr2031848a91.51.1790092527799;
        Tue, 22 Sep 2026 08:55:27 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc5451sm83910a91.7.2026.09.22.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:55:27 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] isofs: tie the name conversion buffer to its bound
Date: Tue, 22 Sep 2026 23:55:22 +0800
Message-ID: <20260922155524.1993425-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two cleanups around the scratch buffer isofs_readdir() and
isofs_lookup() hand to the name converters.  No functional change; the
first patch's assertions hold on the current code.

Found while looking at something else: get_joliet_filename() has been
passing PAGE_SIZE as its output bound since b2eb2e288604 shrank the
buffer to 1024, which is safe only because de->name_len is a single
byte.  That seemed worth writing down in a form the compiler checks.

Matthias Goergens (2):
  isofs: size the name conversion buffer from a named constant
  isofs: bound the Joliet iocharset conversion by the output buffer

 fs/isofs/dir.c    |  9 ++++++++-
 fs/isofs/isofs.h  |  9 +++++++++
 fs/isofs/joliet.c | 25 ++++++++++++++++++++-----
 fs/isofs/namei.c  |  2 +-
 fs/isofs/rock.c   |  3 +++
 5 files changed, 41 insertions(+), 7 deletions(-)


base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0


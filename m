Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C33D47DE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164329; cv=none; b=N34Qk9IuNjpqv2SkAXr7omnLk+30p5O/w22NYKEh1qZiPPIWDuwmES0Wov7Zw482sQxAvINeJ8eC0lm0gZP4zBGxF7DuRX0NWwI8K3v8NOlUt5VUZ5G1Ob3DR+d1lW2FqRKL1J6GKME6TPl4pp4N9mlEYsLxstFvqhDW2HjTCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164329; c=relaxed/simple;
	bh=RBZSJSyhphc0oapnManjurn6hUbSIbopJ584e/QSqgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZP2AjA7PWguwymSlzf8UjQ52Wzli7mPUjI4YQkYRwgE8ZuslM84V7sHesNDB+lqATFpMTdXy4jDeLsiPlJZ9aei4PRL9+vsqZQmmPbmonzQpZzpykybUHk9olSgcPbqZJGyTVa2RrTTfmNgD61isR9iCw7Jyz/r9CnBStdDouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NdcoMrXl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NdcoMrXl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so33432405e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788164326; x=1788769126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5plgAl7fGyMCVcg4uMMhNtS6gctUjSwknArd2v2sNA=;
        b=NdcoMrXlamWz5T+vmvPEqSvbnWp04WT5MkbA7gTpx4eA0ZIsf/7b9dfTm7+3VHDtnn
         BXrG9K58J1o+WoySppWOChVwt5PG9gNOeds5EK6KOa/h7NAISo+NgAenZzWf6Dy8RkY0
         sXY4rtiKqwCa7JMUnXtNBgHYm507GlhsKgZtVUD8YBHNX6TjljCFLhsrk5twfu09r5b8
         c7JiM5XWilIAJgid01AOKrlB55ygJpJvvO7MblcWkgOOEtHAxGpa8Ff4QxuLVPwstZk9
         z4VGVGj25O60NYN5fnMB9HylJBwgIOrtgVqdsfY62tSwbkn51OJo4vpQ3KETRLdc/V2h
         RA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164326; x=1788769126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5plgAl7fGyMCVcg4uMMhNtS6gctUjSwknArd2v2sNA=;
        b=NdN4yygQFnaxonO5uknicUVINAsQM64AyRKjVRZS+FviwSeLIRzmEHu19hpy1zu6l/
         p2nTCN+xigdKZjJNtkNktTcqeZMiKRqq6rGLL5kr8g6bF+2KuyZfo/b/dzUcxIO9nuX6
         SONgDW/5hmB/yqg+bgpCLoCC9hlgouXmVe1AqvfgpOtRetnf25QJ6aJtjytQ8gIulSPe
         ckAYclM/gngeercmyzkBAyE+lFg7ndl79sCMusAgJ7J8QnHmgFZzfkoNTszYSx8QT4FX
         Fs6sgeD4yOYV8+JoZCzuShGkwUl/vZpxUris4idFpKcqBbE0QEs9QqLT5QbOwqs5t1l0
         1fjw==
X-Gm-Message-State: AFuF++lxU6Ay8drg6cqX4sDfTLSVrgZ9ICAaoc6ma6xnaIS6vO5js8fu
	dhZz7UtckwyU4unqTiMru0ndEYes4JUKu7n2RFT9bBYtx0t4mvfmKUGbccohnXgFoOmj0ccs6de
	sf98JqJ4=
X-Gm-Gg: AR+sD10H/+M9Y7XGanG9+O2vXVarLqBXDEjTGQApXKV3K+7VhQTW5//8v1wJGpleiIU
	yJDHiTN33+3pAJNGdpe7cWPe6OJzywMAvqBXCvxDnxAHeezy3LHdOXdnqOV/mHc44rCJTbvXymb
	J60qXB2SsTY4LtlEm82fg6Pu2jxS/cR7agG3Zuh2UH+IpPWL1e4WToO8K3tfPYZMlu7yw/cBBra
	xaHRYbQpprA0HP9dUnOTpnxEgyD8ftbX4OVbYMxg0bswZPjPeyxdm+oZ14kEplzIz2Oulwpngly
	YEcXcCC+/4sXlcGz/8AbC2E8Uj15QJy3Cohodz6h6XmPVf70N5okcfQ5UR+wuUVwH2mAR/JheXF
	Es0NYNeQZcS3tg9oelUPRCW7StPmUl9q2UDUYyhC3F0cR64DH97hPD9rCHWsXBZO7S/Rx1Xlven
	GYuweXJmEC0DIrPk1MKFvEDm07KQxdUJnGcptiDyj/5Jbf9VhfnNe1h5o9kSkkydCcIdcKR7eEa
	EVkEg9Ww2Ym
X-Received: by 2002:a05:600c:3f06:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cd9477dc2mr27204415e9.3.1788164325977;
        Mon, 31 Aug 2026 01:18:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm273218065e9.7.2026.08.31.01.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:45 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 0/2] doc: Rename dynticks-testing in cpunoise
Date: Mon, 31 Aug 2026 10:18:07 +0200
Message-ID: <20260831081823.67972-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed to cpunoise,
both the patches reflect this change.

Thanks,


Marco Crivellari (2):
  doc: Change dynticks-testing repository name
  Documentation/no_hz: Change dynticks-testing repository name

 Documentation/admin-guide/cpu-isolation.rst | 2 +-
 Documentation/timers/no_hz.rst              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.55.0


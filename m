Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7293D331A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168093; cv=none; b=uwJTuYV4tJVhTBztbDFdWGd2mr5mPBfDDlCKgjc7BmwoB3y2MckGzOr+WxQppIRd4z8LZHzsYgkKjE5kRYuIXg5lXSyMvslIwLlrTOa+xyJ7PQAEII4eVxQKLaQpW2ten6ZBCkLcBtuWyyxExuASoyQmF+vyVq33NZadmm+eRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168093; c=relaxed/simple;
	bh=Jii8PdsOIpZIIdRiKAExnqrCkL53cGtk6tdaH+cPNhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngMVw1E/OgjGuLs3llnSLUWlg0uFqyfceJZQOcY//EYUvfOPzQJEKRDrkQiwR58oOpDHxI6fOU6CdxVvi6IAdragOc7EMSb/2JiUdbiVMyhc2xT8IVhv8s3c0tiMiCh6xptLjjYdWhLdm9OWNTRWSc91YvLt5AUr7rUdLeQzRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=csGvuUj9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="csGvuUj9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso20468325e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168090; x=1788772890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++AemXZH3wuTYoi6t13CCh4OGNnaD2bSLAST23yN5ks=;
        b=csGvuUj9pX5NfxO2kC0CsapOlk0qRuQWV5sHU1UBONiU5VkTBsq/r2wQ92/l4XNkhI
         rOqAJ12sDyNGTunW6hFKSVqGDSc+0LuP3rOm9mOg5lk/YphUEk8jHcW64hDQUeryc70v
         ZzSh4DgpcMfhN/79pOKXL0ZW2+1ae92fQhGJkm6S2tNkMNzwskDGsUX7ElByC3uleMRX
         WGYajvCVFXY8CrnI3A6P+5NJ+zy5Bs3OVYwuYYZttfWQg3ugSYdO0aNHhRk3x3ae/Jlm
         uS5NqfdOweaM7QiOvJ5jaYAlEnvQx2lJK+x18wDOZo4fVu0gQrzja1+n/+39Gjst90YB
         ROxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168090; x=1788772890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++AemXZH3wuTYoi6t13CCh4OGNnaD2bSLAST23yN5ks=;
        b=jcrYQyvOdNAwlQFYPsWDFBNIhljH0fduRq8qlE9IpPjdS0St7tmuK4941VIxQ3EEgF
         Jmj50OMy4QYIW6NuSczqQJTf56pkaM3QVk6PK1JcHpFbAwbH8b9oXMVtVbKVZ/z+nQIy
         WXVQwExvUtZsVW7Gn/jSOZfpN1M2CH2ylcx9qC/uUlxH57hTMEtx0+ipNmqfjl5j9ft2
         ea9M4HRT1Iz6TCR4lGspdqAK34u/3pBpqAn4E/VWq+I8pavMTaGyJ1SyneL9wRhv8TL3
         Vpx9nVgmhYBh7tXmA5IapkPLeiic6Lcscuqw5Zy6EHdgsCCPaMC8TT2Hzmi2Vah0GvUa
         W4Ag==
X-Gm-Message-State: AFuF++mzr3J1sMbms9UG6F4QNURK2p7/vkFuqYSQDvsUQBuLtvRiwQGF
	Fg89Md9RQqXEKDFpQq47B8U/urK9vKpdNUeuF7MGNHF7Gid4RAVuP7cK14282/Yj0mzA/QGToFT
	CjCujgN0=
X-Gm-Gg: AR+sD13yEJrh/vKi3fR4ojrGvP4xkJwcYoHbi0n3Jap+LAJMMsR7bNoXR2GPNGCRVTP
	b1ZsQt3y+L61l1rmcM6uz2v+qRiFQ27EbAhJNgUgzpN6TtVLwlP57IvnXGG3IlQfURIt3xE1WCR
	lXjpOuxp/20bgqJKKOq3rgk2qjLdVfEhqc2JR5hqGh75+l9Bozy2WB4KdjmplOEThmU2KXQfraD
	hTdMILwdEcNLAH8CIIL1zjxysH7zcSUjoxek9iEh32LKNMgJZiEx+dFEnSty9xkoC2bur1IjUlu
	gUDkmE2rtJb9g2WhreQPzz97LZKIR9NQSN366Wo9yRljLw2FnevdMoA0tus7qMFs3bjtSvd2A0S
	N/8vCcPgCbtXnY3ycl+YmlrtCkTx7qRtPz+IVpuVoLNT/R/btDoq2OaZCrtc7yHt4b4pm0XgcpH
	WWIkgeQq0LHpviu9P++puFbOnmIDiYnpq5941c25Ps9JX0laD5oehJM+o/IBd/lxaNqLyCHJ9f1
	JdOmecfVEJx
X-Received: by 2002:a05:600c:3e1a:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ccee2a541mr225610845e9.16.1788168089818;
        Mon, 31 Aug 2026 02:21:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm150432695e9.3.2026.08.31.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:21:29 -0700 (PDT)
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
Subject: [PATCH v2 0/2] doc: Rename dynticks-testing to cpunoise
Date: Mon, 31 Aug 2026 11:21:11 +0200
Message-ID: <20260831092118.124576-1-marco.crivellari@suse.com>
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

The tool announcement can be found at:

  https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/

Thanks,

---
Changes in v2:
- Link to the tool Announcement added in both the patches and cover letter

- Corrected another occurrence reported by Sebastian

Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  doc: Change dynticks-testing repository name
  Documentation/no_hz: Change dynticks-testing repository name

 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 Documentation/timers/no_hz.rst              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.55.0


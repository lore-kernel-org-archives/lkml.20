Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211BF36B91A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736664; cv=none; b=dhJ1ZhoDPJIUMf2SG+sfZMtK7f0vvmwFaYQaXgJqzWrx8vjzhEtVd24I3eDJZ1AgI1vbZmKKgggGz3czs2kEddKafotBadAJDEOLYQsCxH6GkFQPPM+tLfoabpXICvLMlRQez2hkMoHI4YxR5lTmLEUFL9EKyGyAoliq5X83ZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736664; c=relaxed/simple;
	bh=gZaO9mEV/Y8SsoqAkB7eeTVb5jhEC2I9/HmBQCPEO6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRuEtnYVj+qoo3xvFa7J9+Aw3Ai2EmhZ+HCeOA+JGDc3xUxcU/LGBNo2xH4QxnB7qsqIj4CxEU4A9WkFgFUXBsSvsnQp/ppxNZy3J005KNBMJy85BbQW2HEghhNwNEfi2wUrDB/rLJRp3rzst0iGdPc9ouskUHB18A3W3OaW+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OiEQBRkl; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OiEQBRkl"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34abf779ac9so1311001eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736661; x=1791341461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SN9oSh6pbJF+i0gEecxT72QU0gyfS5+yGpFwKLICvM=;
        b=OiEQBRklilN/yT35l9rgc2fyWb5cDHNVWN96XTjUcwqksBWhKsMS/7q35BE0V73aX+
         s+RWt1J7nIs/ojg1Lk2iwRQmjCgIcorleyA7/GZZQjc44LXTy9mcC5nIc6VURhVirrdf
         RDyVb2l5bWVUayzfr8yZvw1Rflo2/fjIejCks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736661; x=1791341461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SN9oSh6pbJF+i0gEecxT72QU0gyfS5+yGpFwKLICvM=;
        b=NU2UDitZkkH+1FEoW843NfEtnSZyUlXWSyqkGNBkzql9aE9Cg+5GKUmjfcUPTITW6y
         CZUk4QFXXhXgWof4LVZ0mwQOaAq+56GbyC32vYbV3pvRctWCPSKZ6eLWjgWCxt5lLQsb
         sfWEQt14etGRw4YaSBwfkguLe5wGEMKVDLFC1RQberd5hXbrxVkfJAvWCSoC07pToZiH
         oDMFszZQSytHoIAjVD85lJz2x7pk+HS3jFl+pTDorR9jaWmuavxOYrDbSCePst3xiXUO
         5Sx0ogcKLL4banHoQgSnZk+r9jmz0bNNlF3i9NFPpQinWZ2Ti6LamIe2BAsX8vCRpCIb
         Nvxg==
X-Forwarded-Encrypted: i=1; AKwUvBzfqScddXtbrBA3az2Q4TFtjwKu7uLM3Dhij0fR8hwp3KhKEe2lq4H0kjnML20aYym5vursTmUEM9hbNFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfLUkCuosuOYWCBrinrEpaoIdBsOFjHV9gUxUKyo41OofgOOcX
	oBwGDqXnzDY/gT9gquJc15RXd+paAxTaB7XbZ9NWQfk1zQPg7v0P/1RIC7w8P8h6TA==
X-Gm-Gg: AYBFou2G3WF0WuhkhHU2GWU50nc9TMy3fF0UPg6CezLA/gJzUNLKSE5X83xL0j7lSuZ
	u31ieeLA6gM/jmL049u1wC8fjM45omYM4D/AUNO8wlNk2LCIMJJKE8BLJiVu40aR3H4GEZbFHvE
	dBVbpiDcC9RmJRm8CuNvKWRy8vFcyKHV3D4ms/pP38dNOx9vKjEAqYTNDXdJUGBGxSKyfiTXwBV
	GmVBE/ns0Hg7lXVutZcHLXG2kreadCLJomiortv8Q4KNWZ/mO1mNk5Aw42ZAGjerVFjpVS75ESp
	wOwWvis/dv6jT2TEwjAp56gFLjipSY0iMglHR3lLVLbhPhnfITEO03vZqu/TDlzVNwQkReRSPG6
	HCDnSQXV5cLTamc1wVx8LhwzSHIwMd4wlEBNxe1AqGUO93jGz4/SJmobDQ9WoBW3bEVJ2MJ2nTl
	b2rRD/fr1KpXnpAZ81RDdKGgb9hQ6xgzCUbUZuludWIomFzImW7HV0mbVI6RhJty8r9fh0VezJv
	JulaaD79PYL6znBSouPuKtiTqPuqtFt4cnh
X-Received: by 2002:a05:693c:6392:10b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-34cdc3caaaamr236693eec.20.1790736661110;
        Tue, 29 Sep 2026 19:51:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34cf4a63ac9sm605eec.10.2026.09.29.19.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:00 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 0/8] PM: runtime: Overhaul kerneldoc, runtime_pm.rst docs
Date: Tue, 29 Sep 2026 19:49:48 -0700
Message-ID: <20260930025044.104824-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM documentation could use some improvements and additions,
to help guide people less familiar with the main runtime PM concepts and
its internal implementation details.

v1 is here:
https://lore.kernel.org/all/20260904212000.4167880-1-briannorris@chromium.org/

v2 is here:
https://lore.kernel.org/all/20260923174711.1283986-1-briannorris@chromium.org/

The first part of the v1 series has already been applied. For the
remaining work:

 - Formatting and clarity improvements.

 - Clarifying core concepts in the Introduction. (Pretty much all new
   readers I encounter have a hard time with the difference between
   "enabled", "allowed", and "active".)

 - Adding Example driver patterns -- because the API is so large and
   complicated, it can help to try to walk people through standard
   practices, and what everything means in context.

I tried to keep some of the larger changes toward the end, to hopefully
make it easier to rework or reject them while cherry-picking some of the
easier stuff from the first part of the series.

Feel free to add suggestions! Within reason, I'm open to tackling more
here, as I think many people have many valid perspectives on exactly why
and how the docs do or don't serve people well today. Or I can tackle
less, if you think some of my choices are not improvements.

Some possible follow-ups I'm toying with:

 * Slimming down the API might be better than heavily documenting it. A
   smaller API is a more digestible API.

   My only concrete next step: drop __pm_runtime_put_autosuspend(). Its
   last user is nearly gone:
   https://lore.kernel.org/all/20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com/

   I could also see deprecating one of
   pm_runtime_put_sync{,_suspend,_autosuspend}(). They all do slightly
   different things, but I'm not sure every difference is actually fully
   intentional (or at least, not necessary).

 * Tweaking some of the behavior on pm_runtime_barrier(). Today, it's
   very asymmetric, as it prefers resume. But I believe there may be
   value in making it flush (not just cancel) pending suspend too. That
   may be in a future proposal; for now, I just try to make its
   asymmetry more clear in the docs.

 * Sand down some more rough edges on return codes. For example, it's
   very difficult to get any useful meaning out of pm_runtime_put_sync()
   return codes. There's a high chance that anyone trying to treat
   return codes as errors is inviting bugs. (Is -EAGAIN a failure?)

   Of course, the answer there is not "document it better" -- we can
   make it easier to use.

 * Adjust the way devm_pm_runtime_enable() works, specifically for
   remove()/teardown. Currently, this is very hard to use correctly --
   some common driver patterns may assume that a device will tear down
   while RPM_SUSPENDED; but that's not actually guaranteed. Notably,
   this makes some of the "Examples" section fairly tricky/subtle.

Regards,
Brian

Changes in v3:
 * Misc formatting improvements
 * Rewrite Examples to avoid devm_* at first, to highlight correct
   approaches
 * Include error-handling and remove() in any probe() Examples
 * Advise more caution when using devm_*, as ordering issues are subtle

Changes in v2:
 * Major rework on Introduction section, especially regarding "enabled"
   and "active"
 * Add appropriate teardown to "Probe with Hardware Powered Off"
   Example, as the remove() + power-off behavior is subtle here, and
   easy to get wrong
 * Drop changes that are already applied
 * Add a few new fix patches, noticed while reviewing the rest
 * Move Introduction patch near the end of the series, as it is a likely
   target for further discussion and modification.
 * Correct Ulf's email address
 * CC linux-doc

Brian Norris (8):
  PM: runtime: Correct pm_runtime_autosuspend_expiration() doc
  PM: runtime: More kerneldoc formatting
  PM: runtime: Misc improvements to runtime_pm.rst
  PM: runtime: Add "Section" hyperlinks
  PM: runtime: Clarify ->runtime_idle() callback return value handling
  PM: runtime: Clarify driver callback expectations and structure
    Section 2
  PM: runtime: Expand introduction with core concepts and structure
  PM: runtime: Add Example Driver Patterns section

 Documentation/power/runtime_pm.rst | 676 +++++++++++++++++++++++++++--
 drivers/base/power/runtime.c       |  12 +-
 2 files changed, 633 insertions(+), 55 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


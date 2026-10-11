Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F741DA62E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791686419; cv=none; b=ZYDLaGWVLGgfQf6f5u56Lu+JFSZmWqASbPvt52He2QALnzFV2UUwc86kGVx686R4FnXGzsV8HchPKn7+X7vfnK024zh3ElW/5pW79n0h6zxqabIjFuJaa8kpojXexehvcYYkzM6SQxcPJK+w2Ilnnt9/Glk1rP9rg3zcmVawkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791686419; c=relaxed/simple;
	bh=8B/m+tFIl5swqc3QaHR1x/I08ZzDzjGvuWY5IwEIUEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0NkpPdKQfO3lHZ3ci6vC0wAV1b0YVNDfg6U92620Vz5b19aDYtim0opHE/saafAL+BUIGWY0XxBmgLYBeYx8n4SNlXXSUEd3fFmEwxte03jwtF8HQp3suFw9ZtQZdvkGTChVJfveuuFMAaG4DfrmDHPpeF4G7fr3RKQ6XLgMO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtZ5FKsH; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtZ5FKsH"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3515f9a5d25so2498561eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791686417; x=1792291217; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7waTTw4v9ZrLDClx+ykHB4Hqp85xHGsmRCylsMp8dk=;
        b=GtZ5FKsHwJ3qGktr4GyJSATwjW/wJTw5uQnQmG8I7pkntxMqD+CVKI3jHN0xHGHuXQ
         TQyPOB+W8ww4O5ndyXQjoH1cUJM7EPt3vNzrTt7i+pDnfbng+f8rTwqA2S7isdsRkumX
         ypbyYsvbaJOw9FYd8zJchuWeCfmWUHQUCuRRT7gT1b6bf7/udPVWo+dpFjWjmWr0sFao
         yl0uKXeM6teOkcCoh/OnYEi/evbuNA51qQwN+Pt1298Fdu7yIa3slVgOGp3Yu6vy8pzd
         AegUlE1wk4P3NY74KG+e7a3fWyaXU45BbWiln/fp8J2jEIb/QkgDWhnQaK7jPbZeb7VL
         WgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791686417; x=1792291217;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7waTTw4v9ZrLDClx+ykHB4Hqp85xHGsmRCylsMp8dk=;
        b=g5W+nCAk5P0xNihgTZZxMLzI64t/5ceqxd9QDl4e+RZESK9yQoqo83BUj1CIc/pZER
         xtjHOnh/BtxW8g2ptMBe2BlmlpAKLyf2RE4QUHqDzmnlQ/JQEzbU0tS7T8guIx4uykV/
         dicaE0oJI7BJiR5lkNxTXRMTQq9s8PHZyn0f72RIa25E8/Nnvo6osvIueohh3uOP4Ua7
         UG5Yl4bhlCndmnBNSs2/I1ezQ+ejv8HBhA5cnPkn12M4M8q7M7AqXsj5rMcIrFTfRtvf
         KrgXTVKKsU5AWsNQGnNmel4eSvCrloMNK49pu/6cSZQKlhWsJRXXPnv6zvxmtsP5flqV
         348A==
X-Gm-Message-State: AFq9FYLEOeYZ6hXlkYB35QEClE5cETlVnMKElO3cl/zqULrVTvDMnnHR
	syEj9NGGKWBGvOOTACnsOjqNkMojk9EmLKmE1LIv/ek6sQYFUrtQS2kQ
X-Gm-Gg: AYBFou2O3RipK+4DfHiqqvMO8NhofjrxMlbG08zy7a58UPZsxjPc5vUN6PsSatpJ4sk
	3EkBnsPnAJvwhs4gZJaNHPo3hM6gtmjBdMkmqdNWxk9whttaPRcAOSNLLi9LAq+VH9r9yT4wUqy
	M3KXg+5V7D5RShxznS5V/w2olVkVH7YLbAtfGHLrlHEOsLc0tWI9Lu8t7KiDktUBfljcXXFJ0g+
	c26Z79HxA++gLLSPrEvVCxGkjOTAVHZynl4UZ89x6Jjaub6b2PmDoxEuD33OnjZRC2DwXWN78cL
	Uxw5pZAobVzI1Alb3XjHOUUH7ciDpuUMc2KzXtF7yufeN+xBxVz7+PQDgV3ISo3DHgiAxjj6ReE
	aRC8oHCwwvrAzSekb6SesNWQ1LE3ISiTrrXDaHkqyF5sNLrAybhiYOKqXDr04o3Pus8KLyqDPZ8
	2Pzy98UVuyL0Vpcb2i316Mgt+WbYh0WFywTI9y4mML3OehFPqQIK9gz15xkWj5XUToMqpjlQhpz
	1fUyxWkkXIEGy2TQ8vzQ/ETdUH0DRmPUYopBZzNPar7NIP/nHA=
X-Received: by 2002:a05:7300:dd49:b0:358:3426:d601 with SMTP id 5a478bee46e88-3583426df44mr4652937eec.2.1791686416856;
        Sat, 10 Oct 2026 19:40:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:99d7:6eb1:9874:c6be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm18114132eec.6.2026.10.10.19.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:40:16 -0700 (PDT)
Date: Sat, 10 Oct 2026 19:40:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v7.3-rc6
Message-ID: <asr3A-2qdU6MSCTZ@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v7.3-rc6

to receive updates for the input subsystem. You will get:

- A fix for the ati_remote2 sysfs attributes handling, resolving
  type confusion after conversion to dev_groups

- Updates to the xpad joystick driver adding support for the Corsair
  Novablade Pro controller (wired and 2.4 GHz wireless) and a newer
  hardware revision of the 8BitDo Pro 2 Wired Controller for Xbox.

Changelog:
---------

Bihaan Sen (1):
      Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox

Haotian Zhang (1):
      Input: ati_remote2 - fix type confusion in device attribute handlers

Krzysztof Furman (1):
      Input: xpad - add support for Corsair Novablade Pro

Diffstat:
--------

 drivers/input/joystick/xpad.c    |  4 ++++
 drivers/input/misc/ati_remote2.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

Thanks.

-- 
Dmitry

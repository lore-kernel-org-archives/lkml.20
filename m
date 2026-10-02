Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E89361953
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961873; cv=none; b=H+SPYJUHTqgTQyDUq4vFbvS4WCtieVo65ZosUOsfEEP4pp3JSbW+m3VQ+eRFyaBm5wI7YVMp7qWjtThSQJtZK/oLFL9An10MK4CBVPaJyN25AoGEgiV1lTbPx6Z+PKJNIFv2Qpt+ZgkDFQ3Bz++M20suLQxTWxr2AeHSxiRTxR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961873; c=relaxed/simple;
	bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qR5lnyfoScvR7qRUJt2YZwhd0YyXKVHoObtJzsFFt7JRYK7Mywljp0f38muCpK18t8uU+QKStP+kdASyJ95RaRvEg4fpbHyiVw+j6ybBYmGBoBp/NoRPDRxKwqkoWzXJedNMpJXAObnPbHivyGfJQ+SPDHZvt2oMBeLuglPmpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puDW9+52; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puDW9+52"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso347415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961870; x=1791566670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
        b=puDW9+52E1Ix7xfkhDSSejmJKQ+6wEXz4ZQPFlNWkB3bw1F57qWOgEYCj0bHVaNx6v
         BnPKqIEnoIKqVGbARra5aprqLR4FEC050ZmVMFp1jOTwU/1M87PjMA1FbQXOmJ6eHJhT
         SuyAuvEU6zGQAmm4i3VCCU6fLcfGJXOzCn9Xm+aASAHuT5i0vY+2c0t3AWqymsYEFRy9
         L3BJdbHgV4Q3SKBiWrQ7yuXpF21TdIKiuDObMqu1b4RTMOJyHyFHhIugq60b3GK8ZyzW
         k9SXyfOqJa5w957b1ob6deWIJUuTGS8W6OMlh4TvZbO+qEyd0TsCJ8DARe7EW5DpKCNG
         1njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961870; x=1791566670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
        b=dmsDc+pGDPwCD24R0sd0Yiv0EnGfL7lQ5qrmYkD/UX2xwgg+IgNDPbtEwQVNuONCxu
         XhTJi0rAAI4JYrgAcQt4MtgPLeky4m2egvppROk4zu/W4czeWORpknYLLJrQ1KRircSE
         7/eSXCnDJmDA7C3rxbxsXEAgdis7IEge3oCYRwfi6FHUr0kiREah9nxvqMefmwXT6Er2
         x1PpKxEK0PtL87jwK3oP4S64MQCHHo0QsacfaRdKB6X3X/iOxuB0n1KB/20uKgvInNQK
         GiL9IDpMPDBqpUAphNHqqsti/Q/UDJFhbNASn4uK/w421/s1neUCnG5xgNtxIYGMcDEs
         3DHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx73yaj+JbWXrJ67vnDXHoLDKFt7GGZorRKYpataKphVAG7baUyKgd7qWFZFkhL1o2kl8PopmVDcCtTzP4=@vger.kernel.org
X-Gm-Message-State: AFuF++k8cMXJjuG8nlXGcG6ZpqW1bNjyZWuAVYrXJKrHqk1tQ9ELrlkg
	3fiVsNicSbAyA3jw9Mlqh6BfX0kGOFyrwfSyHrbZx07HuvOsB2TPMWki4urd4Q==
X-Gm-Gg: AYBFou0kV1h2teueyByc2ZIAIpnCxB3hV06xbYgZOnarywgQCpqboVLe5Kei0pLmRM1
	K0YhFfGPFhzbwLvIo2cmgcua3QvzHmiAnvY79bGZfUvalMwCUTliOMbVYoOPjRMLNYCrxp/F3lf
	GU3bF+INZdc3fSI/EmQzCSgZjSDgh72uqCKOZitx0bMsiExLg1SxQmSP6V98OiiLcoBJiPs2fi3
	vVw2yc2YFYwE9i1CvuYIaCjHpFet6uF1zYOsTguIITXIbPLHce0rpyozUi+cHAK4i6Vh1rMFT60
	2Vwxz3rAPK2EgcPCwXE7joGxSFMRiTEDe2rm/ruF6njI48822TjPTP2evhF1Q0lwihxjeoDQzkF
	9F08v+/LtAnWmPV5NA3Rub+4AdElAKSHXUG8UiFoIIOegwOcsUklMwHYQpeaQpWNyFwlkpWdO74
	WORCUHPUg0moBmA3eEZ0DnFafK7oasrQwdXP317inkSmMJ+Iy02b55DGq//2SrgdyExDvBOX1qS
	q46Tw==
X-Received: by 2002:a05:600c:6387:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a168105db2mr1745665e9.33.1790961869769;
        Fri, 02 Oct 2026 10:24:29 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm7512539f8f.23.2026.10.02.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:24:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Fri,  2 Oct 2026 19:24:20 +0200
Message-ID: <179096167726.2508.10599420708324219706@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002094913.28722-1-pierre@pinon1.fr>
References: <20261002094913.28722-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pierre,

v2 works here on the Lenovo Yoga Slim 7x Gen 11 (2-lane, libcamera 0.7.2
simple pipeline). A 1920x1080 request selects the binned 1928x1088 mode,
which reports crop (0,120)/3872x2192 within bounds 3872x2432, and the
full-resolution stream uses 3856x2176.

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11

> I can send a separate fix that picks the default mode according to
> mipi_lanes, if that sounds right to you.

Yes, please do. It makes no sense to default to a mode a 2-lane board
can't use.

Oleg

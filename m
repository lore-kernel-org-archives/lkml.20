Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822182;
	b=eI9fobWyO05S2eN/mC1C30Khr+a5QZbDGrX4gpv/7Cg1dUz/FGHMFfFpBU5xM6yYeHdw
	 2xmhhgYGv/Jm+0S1OXW4vzaC1PVst1g3xbvw1Kf77YWe8KVSR03BXQp2os+cbSkq5WwWp
	 xPsm/6OCoZB7lQKBhgCq0l4kMsJh8YdYT2jo7okb+2fETP7RXev18nbzeZv/trBIfac+O
	 qesZAijnWj8iw7wbd2VHcapG7u+YmF9466zyE5YhO8M1yR6PnKN6NxiS+L4HwI9PRGZPX
	 0V2si4vjMPyZMwnjBEUQHRhRXYpdD3SPTZauIiM2HLgb/4fcyaHA1IYggXB58zwFtLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
	b=2Mu9lbvpM+q+RjI5uKeLOdoZuuxh3d8H9CBQvROreH+iXIJM8OSQ2RwZzcr3E/yo7tl4
	 sXNLdN871Bs0wj+o3EM5D1G2f1gz1seZQFeQeQbQL9dcorY1o/nGXE+k5GL1qr06nvocD
	 lJPjytuoj1m5QfGQ6TdA2loq+YFtxjh5u1EuvsR5LCEjpGyJ54vy1qVeqTD7Mo5a0YqEC
	 +qjFCAg9d6n0fFKC2pRnBCbYD+WYWKJr3s/wJ5vu9E2HlwhsGJ9fr2F82HnIgqQzYoHvs
	 VkJOOfFUxYtkURIOpAfJmWKQS3FQURszmvcaF0b+Ek3HSy3NdJl1XPN2rZOTF6Slgiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM0GTDnV;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE37606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM0GTDnV
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1443768b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822181; x=1795426981; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
        b=LM0GTDnVMxKPVB45UkzfAbxEhHH9XmnDNhonX8E7oY7fCsl6PShVyubOXPG4EiXmpo
         04PSQTDMd/l3CdlW6nDFcEWfRjMhBRc8KU4IH0Gib1sFvJ6OpLpKKA0mTiFYm4G1nlmx
         6i4QplVFyiO0e8wPhXtM7Vpalsf2VtQOzmqWASKjj/hxS8gLE1sDPC++Frtyw+jHmH+L
         LY9LMmlgzDrDyPtCCOuEdHNFp4VC9pZGIKGXyxNuxcBgj39B8/TCkiAFhNrVeZQ4LoRC
         X4/iN5tiU+nzC7FHcPJJhf7JXVxDX3/MhvuNwGaHG6C2lmIr7ncbt2q1A5KbPltYLLp9
         f26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822181; x=1795426981;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
        b=dwjO/FMxlhHw+yWz87ZMvH4ckPYEsvo6wIdkt9XVqPu+BVu7yyMBLp0DHExgvA1Lx9
         wgXvfjamATRQf26Wcih4SFkqKhBsfymmf8nlF671WbuUl7l9edU3UMDL9/czi1vtSfwv
         3g8T7UMj+7/yifhOPqKoqJR/ZRenShVeP7a/+JVHO5UEyDJh16azA/KNfebtl9+oOsTG
         M1pR12gq10WFowuhgvivkuZH/xp2+Fjd+UmivEUcQpwdeRGIkcWVV545vNIcLTqyLmY8
         nDTWJO47bPAoQfmHe1RNK4bGO0rZcpLYhkIodzyXnMMXwheB2TyTojmOT2BI5yyStkWr
         pscQ==
X-Forwarded-Encrypted: i=1; AL+hErEdTy/d7KBhBWxagM59h8PtF30Wx6srkbbsh1EwXlJ20LyV35knoDASG7lDNcTH8bDgwyBSokxFKHNKI4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gqphKBjYQgpP6bOqFctniXyzoyRnP7XftQJrArOi2PzKxdts1
	pNI/0P/GdKGnnb3Z4x7JpljYmThrYAAlW0Oua1HGagzZVqCnOjpQzs/F
X-Gm-Gg: AYBFou2UMDePLiFRrodbfSLkmYZkqlL1kIZVYJz3hCbRuzNTzn0Xg2wbmQXpWqMWfRU
	qHaY+OfTp5hCWqfyeLzMWkLS2LSqYmAlsfKVYMLxULQ6a6Qnlr9RE6dBmFhbjMV0962MAZdddOp
	1xAesp962Xwiq2IluP0ROu990zuqNqwza5QwXA7fjmd0IHz0xxEgXPUonLuwVO6TRrIsLX8apj1
	V5B614ziwn2FSQCVNYeLi/L4GEVtsZnvfzxXSx/f6kIU6cjT5+H3w4IztK1x94G/Vi/LL6GqlUQ
	uF/nR0mzX1nPrYLl443SuCJtbJ9XrA7/HeDOGByCdT1l8ybCOVabE0azcZNC0Nmnb7n6Q/sCOH7
	9woXCvhWSxaAhOkzWZvYTAXvp7vbEjvCgCeNjf8MYrYhtb1lbjM1Xuk1YYMJiCfBkBYKUHoiBmZ
	aWkbcW1sLvasr0K4BscKFlf/kvWjIrQy9EhClEUl7rFVCLfkttucaALAjNLJ0lB/LGge/ywYqGr
	qGUnKa3DExAcFvrcH4EFQ5ICQVU54lu46Rom6S4lP0ZPT/XdVelFbbkBcbsB7cNt4bxVyXtCdrB
	2mdQag7QdHn6qZ2SET3HfntKpq7t7qYVbxrHGDZtzPTtL9G8j1uOICUPaRk7sVXlRPaVpKZiN7b
	eBXF5qWZ+hex+eb+chQ==
X-Received: by 2002:a05:6a00:802:b0:8a0:6417:8f9b with SMTP id d2e1a72fcca58-8bd62be6f46mr8425231b3a.32.1794822181479;
        Mon, 16 Nov 2026 01:43:01 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] sysfs: support SYSFS_GROUP_INVISIBLE for unnamed
 groups and ownership updates
Date: Mon, 16 Nov 2026 01:42:52 -0800
Message-Id: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzQ+moC/yXMTQqDMBBA4avIrDuQxD/oVaSLRCc6UqJkalHEu
 xt1+S3e20EoMgm8sx0i/Vl4Cgn6lUE72NATcpcMRplKa12ibOIF+zgtM3K4AvclLIrcWVMr3yk
 LqZ0jeV7vb/N5LIsbqf1dMziOE7UC9GF5AAAA
X-Change-ID: 20261115-sysfs-group-invisible-443ba270fd0a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

DEFINE_SYSFS_GROUP_VISIBLE() and DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()
evaluate the group visibility callback only for the first attribute and
return SYSFS_GROUP_INVISIBLE when the entire group should be hidden.
While internal_create_group() checks for this return value before
creating or updating a named group's subdirectory, it skips that check
for unnamed attribute groups and proceeds directly to create_files(). As
a result, returning SYSFS_GROUP_INVISIBLE for an unnamed group only
skips the first attribute while still creating all remaining regular and
binary attributes, and leaves them behind on sysfs_update_group().

In addition, sysfs_group_change_owner() checks SYSFS_GROUP_INVISIBLE too
late inside sysfs_group_attrs_change_owner(), failing with -ENOENT when
looking up the nonexistent subdirectory of a hidden named group and
falling through to binary attributes when breaking out of the regular
attributes loop. Furthermore, SYSFS_GROUP_INVISIBLE is currently tested
and masked with bitwise operations even though it is a standalone
sentinel value rather than a permission bit.

Switch SYSFS_GROUP_INVISIBLE checks to equality comparisons, and check
group visibility upfront in both sysfs_group_change_owner() and
internal_create_group() for named and unnamed groups alike. Drop the
now-redundant SYSFS_GROUP_INVISIBLE checks from create_files() so that
returning it for attributes after the first one triggers the
invalid-permissions warning, and simplify error cleanup in
create_files().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      sysfs: check for SYSFS_GROUP_INVISIBLE using equality comparison
      sysfs: check group visibility upfront in sysfs_group_change_owner()
      sysfs: support SYSFS_GROUP_INVISIBLE for unnamed attribute groups
      sysfs: simplify error handling in create_files()

 fs/sysfs/group.c      | 93 ++++++++++++++++++++++++++++-----------------------
 include/linux/sysfs.h | 52 ++++++++++++++++------------
 2 files changed, 81 insertions(+), 64 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-sysfs-group-invisible-443ba270fd0a

Thanks.

-- 
Dmitry


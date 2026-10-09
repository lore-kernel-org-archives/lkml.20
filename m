Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4E01A9B46
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581508; cv=none; b=hnh1m+nrJUA9ls8y6cT32LIBtVtTEKi4gqpPbWGrbXmV+uraqGpxV+8jTqAQbE3iP1WimWN/j2ssS0DyzP46GUXlPR85vpai1Qo2X70EInrQ0x7D2oQuToFk8Ig3kNj9KTBRaWfmxdkCA9MQs0qoSCWuAEgN5a6ae1QpzlNqidA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581508; c=relaxed/simple;
	bh=MPGtv2AZ1TP9v9vFwWHrcMX8pWa9xOPUHHn11lgZnRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfY+dQ4J03WiLEJ0mUaKoEK06y9V5x1Viwu1b/3LhP6h+IPlVohuI59imyA68RNt1t46fgCjbsUuIBrs2mzWCHNLT7TvbX4FJS4VmdLu5uU8Hbc/OWviZehB+KjKa7JNF5wNLtIOfB1VVn5BU2tkxpACAltUzumx1YdnWASy288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=ZF+zCTje; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="ZF+zCTje"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ac8a2ac52bso1295177b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1791581506; x=1792186306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4p6ogAoD4/3+XSZTFngUeFwMjFyuyjbsuBs8Y+Bvw8=;
        b=ZF+zCTjeyUHC2rlyUyp3ZmMqqjKnk3rcgiBVY7hlE/O4sJQXqcHSiq0JeOpcKkoQBy
         RuPVzzjsCYsobo75DZoSmb8Yat0GJhmGMaW6vS1EyQFoFTfv+jHfEnKzgDwcxLi7on0W
         +KlhRfA+TQ0RwD8wuhsg7E5DC/T1wdBNo8dScd+bRzdLbDX+WByGRhOqxfHTVm+E2vM5
         hvZdOBhzLBvocsSsVAA4RcXNTjPRSd23VSQUx0+fKllU8z+Tc1NiqVHIEuLvEEeKeYLx
         +oouUZhqYz/DbzynoemC7AUuoEpvX4ib+kHEYA0gg1yMLNQYafDIpS/q3KVOdm3NmoEW
         0QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581506; x=1792186306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4p6ogAoD4/3+XSZTFngUeFwMjFyuyjbsuBs8Y+Bvw8=;
        b=Ng/lYjB0gpBbdb7bp87rRYjOoxgAyUKCpNkPtmmQzlGIbLRkWMJJ6v4rh8HVnkz7aN
         Xqsi4vPnaMOsDwmVR5F90uN1HoR4CqUpyMBsM5Xsovc2j8Fw02dCyaNPBS/eBnrPEyOc
         NSCfvF51CDJwywClrMzs8e06cUdk1rP0C2o1DshTxnqYw7C5fsvsgtzky0HEcReE0wf2
         poKdVRC5wA57lTKi6hd+i/gR66D59d9G/1C6ju2XcdUfby2oBSfX44o5FCY4lXoK07KR
         O5yMj5LT7h/tj6nbfl+Yo81X3pGs7u53AmjXTKiU8Dm/Nd8Qk83ckqKNkVKSjFTmxXvh
         Ex+w==
X-Forwarded-Encrypted: i=1; AKwUvByT2+aV/SeohQyWERqrTJf1/3Es+Hl+OfnpOsjrZOIRkiGgQqgLs/zQPpGUuOykOzaZ3ymI9WqzZtLgHfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJQm5KUUjNtqiKbZT0Zf2IyynUw0S1KhP9fs3nPVExXh/8CKaM
	L0xGDfCxa2RmvOaamJ6iEU1KuDe/txTpmBH5wxdhsdahvgpgeBY1vgclSg2hZjHQ/Bulsbj4ewB
	t8QLdcDs=
X-Gm-Gg: AYBFou143Bk35B/6ksCLCAUJFbw3YKdosnGGKmkBhPuQGzDT7/i/LuU9RSaijA4ukWQ
	Fi+o9ZEM/kg1/60wlhw8QHfOPdQLCHmbZqUOMmV/JChWL9uk3HfVwwq/Re1KZDEIkXAsFBhA0zt
	DqXGmhfoqHTN5t811Jj17rFuKGnNnb83SOgpPlApeOZ+P5sr/6g7aXAEK+tD/Cod+21iCnXAvhB
	6BblBeZYMQY0LzoDdChCjHretlz473w7BxJlb3qy49ya5si2wI6rll6VJJtuAgc40r0D5nHZd4o
	SBB3bzcWJNcrLKHlSK8IZD72gx8u9nul5UdpDQWJpyegzh24EjNGSXRIBoJIRYPsFyFZHQHMn/4
	3g+nbgXGLU7wsOx2Rtog3jIlNbDGdFTco+Z6IPYH0hzPNOW1Sg+rgbRph4yEDtvCXJNxKw0hou0
	U2LBP+Ylo6OQ2fXpRGqqakHWAhP4LAUmPgAgaTJUf2e8SRYUKw0TzgZrghTmBZ0NmOMQ+iMi5Iq
	E6Fv2XPEHSn4WoRBmrFW3iSKuJ7j0fL4XRuufz7i2YSHUPIQSdsaKZUbl/6UFi1TRUfr+fk0Xqu
	QNbctNM=
X-Received: by 2002:a05:690c:5886:b0:87f:32fa:aa08 with SMTP id 00721157ae682-8b07ed55c46mr8287527b3.14.1791581506448;
        Fri, 09 Oct 2026 14:31:46 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b7483sm12296467b3.11.2026.10.09.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:31:44 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v2 0/3] hfsplus: fix timestamp wrapping and support timestamps after 2040
Date: Fri,  9 Oct 2026 14:31:29 -0700
Message-ID: <20261009213132.997851-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HFS+ keeps timestamps in 32-bit unsigned on-disk fields as the number
of seconds since January 1, 1904. Such field can represent the time
range from January 1, 1904 till February 6, 2040.

The current HFS+ driver treats any on-disk timestamp under
HFSPLUS_UTC_OFFSET (January 1, 1970) as a time between 2040 and 2106.
Also, it calculates the on-disk value by means of adding the time
offset to the lower 32 bits of the timestamp. As a result, any
timestamp before January 1, 1970 is converted completely wrong and
xfstests' generic/258 fails.

This patchset fixes the timestamp wrapping issue and extends
the supported time range beyond February 2040.

The first patch corrects the logic of __hfsp_mt2ut() and
__hfsp_ut2mt(). The on-disk timestamp is interpreted as unsigned
number of seconds since January 1, 1904. HFS_UTC_OFFSET,
HFS_MIN_TIMESTAMP_SECS and HFS_MAX_TIMESTAMP_SECS are defined in
include/linux/hfs_common.h, and hfsplus_fill_super() sets
sb->s_time_min, sb->s_time_max and sb->s_time_gran. This patch fixes
generic/258 but it restricts the supported time range by
February 6, 2040.

The second patch stores the timestamps after February 2040 into
internal extended attributes. Such timestamp is stored as the maximal
on-disk value (0xFFFFFFFF) in the catalog record and the real value
is kept in the xattr as big-endian 64-bit number of seconds since
January 1, 1970:

linux_hfs.create_date_u64
linux_hfs.content_mod_date_u64
linux_hfs.attribute_mod_date_u64
linux_hfs.access_date_u64

It is Linux specific extension of HFS+ on-disk layout. However,
it is backward compatible: Mac OS X sees the clamped timestamp
(February 6, 2040) and an extended attribute. If the xattr is absent
(for example, the record has been created by Mac OS X), then
the driver reads the maximal on-disk value as February 6, 2040.
The internal xattrs are hidden from listxattr() and they cannot be
changed by user. The creation date is supported by the same logic,
including the hard link records. Also, the second patch fixes
the issue when the Attributes File, created in the middle of sync
operation, is not recorded into the volume header.

The third patch adds the hfsplus_time KUnit test suite that checks
the date/time conversion logic and the extended timestamp support.

Viacheslav Dubeyko (3):
  hfsplus: fix timestamp wrapped issue
  hfsplus: store timestamps after February 2040 in xattrs
  hfsplus: add KUnit tests for date/time conversion

 fs/hfs/hfs_fs.h            |  13 --
 fs/hfsplus/Makefile        |   2 +-
 fs/hfsplus/attributes.c    |  85 +++++++--
 fs/hfsplus/catalog.c       | 110 ++++++++++--
 fs/hfsplus/dir.c           |  49 ++++-
 fs/hfsplus/hfsplus_fs.h    |  52 +++++-
 fs/hfsplus/inode.c         | 299 +++++++++++++++++++++++++++++--
 fs/hfsplus/super.c         |   8 +
 fs/hfsplus/time_test.c     | 354 +++++++++++++++++++++++++++++++++++++
 fs/hfsplus/xattr.c         | 202 ++++++++++++++++++---
 fs/hfsplus/xattr.h         |  32 +++-
 include/linux/hfs_common.h |  13 ++
 12 files changed, 1118 insertions(+), 101 deletions(-)
 create mode 100644 fs/hfsplus/time_test.c

-- 
2.43.0


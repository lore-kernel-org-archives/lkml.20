Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB71DED42
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485713; cv=none; b=pN9lE5V7OsscZYjQ9G0Y198nwHnklbyOIuAOGJnC0JFD/SvjzP0dTQQNPWgSYmvG00dN/sixd2feo69VZcrK9EIX0/2jQPsAHWMsqklYp3srYBUt0aud80EHblPqM4wWC7ghI7fyGS7EXpRN33lDuyp87tOdm2nLle/ATqKT0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485713; c=relaxed/simple;
	bh=CmbrNXVAYqa3pMRQjrJm0NpRq56JoeKYm+SK3RhWRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jX8lkNHq3pem67+p9uu/r/2VrP6gZDSkmsvddHF/2RpyHydnCU43MGoDHT/X391m+NuBbY9UL6j6DtMx6vYpbmms+kuLm0PoEEkKrHua+SSh336rpIlfn+qPoNQM5Z8d2OtbVzRxiwJ0jNwHWH1zlmT3V9cwKTDryWqaOwwFc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C40K6Xcz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C40K6Xcz"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso13249605ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485711; x=1791090511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MKaxGmfWE+Dz0aKj31pB/k7Jyep9gZ6ZS/k+y564DE=;
        b=C40K6Xczt7pDGZ2gekUXQ2HF4sv2eclYWq5/7aeD6E+9VYW9eH+SK4MrIlCIcB0Qa0
         D60aR+kpzuT90YWVRgjzrbLjFJm+0e+KfUVVo8qbvAx2Rt5K41EMg+bECfCLCHYFcyU9
         pLi/TG3wkBW7b4BDk2TWMtdegWZvzu9qHjXoO9fCJ/voas1iYYL2jkEmOuCMDlWTGw3a
         Wz32s6+DZECsYA68rm5rjMlug1mV8g4mdxs0t8cZnP3cPmnelUy2v13rzAuG6l/edqN1
         Mk9nebQIgGVVwDfz76T+Zgi5ABIca7hDXaxa/reXAikWfp4WUXWoM5PgHlRJ4LRYeOj/
         dvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485711; x=1791090511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MKaxGmfWE+Dz0aKj31pB/k7Jyep9gZ6ZS/k+y564DE=;
        b=R4XsHizc+T2C2xekjeOis3IRn6RRXEB4uJjVc1sz/znleiB8YD6JhPzsi73FvkkT4G
         VlTHwceFSVLovjnNbHxab9mPaB+I+asa1k/ixuWj/QNV8GMm9qFsQUAJqszEYn0yl4If
         Kzxw8XBySnctDc0CCFFg9XDm/bszPykPc2VlJqXkP3lVK0LVeUjM8eu/Pm3Ywj3/+9Wc
         GWEx1bACjLVlfMxwJbKEcy5ihRNrmdUHX1LtW1FyCyRmOaK/mPGMKDkaeRRpgf540WpM
         +zf61yF7v9SlN576oasrC7FMJJMAj4e6sdnEhAIK6FfAyWPC/nm/zG6+vM1iZILiqQvG
         vSQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0Wen39G+IEsdJ8k4ePjEjYJJYD8xmhJgbkKvqPlQ/Vi6XP3x7pvv/GKL0QZH4lwifS8Y/anj4vnR+3Q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWzVek2aCciajEvCMLq0z7Zs/vTphwxTFdhtHCj+1JaRXxLxTL
	pB5ixYZ2FXyDEg081MQw+ptWbAW0n8QsRejVN2tk3LNotGusLSD+HQlJrohaQ78OpzmvPg==
X-Gm-Gg: AYBFou1PNHx35hQYfc9M+vEGUlRHrsrrP9oxt2ax+ULOJ/5oZylpdmHeBmg8ette6M/
	rigxZq6rjy66OPpVid5JMVp2AWdozWZDrLz+WgfZKmv7RnZI7m1IcJ23QoSoqSgV/h+TOWUE0OB
	Ackv+++Tm1lUGX2vvPdiMjg2plR1/XPoTTyMES3qjRPm4JnyAARZeyTXhIbwUL9TH+x9epiiqXL
	YTnl5JWZ3bKMr23BHSPn+uH2IYLynoLWmldsYb0V++LDJmkD2i9td1NAHfsBTahymPTJpjnh83s
	t4OuhQ0tzHfccGZ7zx6ap4O2ZS86Yh0lk1f1uspTL5KdTE3aAeoLV4XXDjwk4dhoaQH5Z4bYO60
	9gEpUi++vfTa/pVOgViTOkWvfSS7DZ99wJJ+0n6oizpvpkfJaCdKZxObFOThbtx1uZrptOr9PnU
	eaWRy02ubhEGPaPGl8k8rxmm5Y812KEAMDhwNzgoNELvbKQv+tQKO4wyII35Xam6Yj95xwzWQJn
	BCSS9Z60KHp7OEyazLMJzXF/6/7xCWgE3dbSmBOye+ej1wh6cu9BEn54FW8YxKByipjqcpbMLVh
	h8B7qIhpdvgWGC0K8KYPyrlDj/Lwo5RmQ712QYR16m1YaHrMlhfUMPwZ5QXy
X-Received: by 2002:a17:902:e88d:b0:2df:a00a:2e3 with SMTP id d9443c01a7336-2dfa00a0543mr38304855ad.14.1790485710858;
        Sat, 26 Sep 2026 22:08:30 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ntfs: fix the $MFT bootstrap hang and reads of unmapped runlist ranges
Date: Sun, 27 Sep 2026 13:08:19 +0800
Message-ID: <cover.1790417653.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arMoap0ZgeORuktT@hyunchul-PC02>
References: <20260922153931.1976405-1-matthias.goergens@gmail.com> <arMoap0ZgeORuktT@hyunchul-PC02>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hyunchul,

This is v2 of "ntfs: fail the mount when $MFT needs its own extent
records", now patch 3.  As you suggested, the mark now stays set for the
whole $DATA enumeration in ntfs_read_inode_mount().  A crafted image
that puts $MFT's second $DATA extent in an extent record the first
extent does not cover hung v1 in that loop; with v2 the mount fails.
One correction to v1: lockdep stayed silent not because of the folio
lock, but because ntfs_fill_super() turns it off for the whole mount.

Patch 3 needs patch 1.  With clusters smaller than a page, patch 3 can
refuse the tail of a folio holding an $MFT record, and without patch 1
the refused range is mapped as a hole and the mount carries on with an
all-zero mft record.

That hole is not specific to $MFT.  Patches 1 and 2 fix it for any file
whose runlist is partly in an extent record that cannot be read: reads
of that range return zeros with no error, and buffered writes into it
report success and are lost.  Patch 4 does the same for a runlist that
ends before allocated_size, which a crafted $MFT used to get past patch
3.  Patch 5 refuses a $MFT whose data_size exceeds its allocation, and
patch 6 requires initialized_size <= data_size <= allocated_size, with
allocated_size a multiple of the cluster size, for every non-resident
attribute, as fs/ntfs3 does.

Tested under qemu with KASAN and the hung-task detector on ntfs-next,
with and without the series.  Nine crafted images that hang or crash the
mount without it fail to mount with it, and six that read zeros that are
not on disk return errors instead.  Eighteen images that mount without
the series, among them eight public test volumes written by Windows or
mkntfs, read every file the same with it, and six small mkntfs images
still mount.  The images and the scripts that generate them are at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist

and, for the ordinary file of patch 4, the unaligned allocated_size of
patch 6 and three of the volumes that mount, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-v2-extra

v1: https://lore.kernel.org/all/20260922153931.1976405-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (6):
  ntfs: do not map an unmappable runlist fragment as a hole
  ntfs: do not turn an unmappable runlist fragment into delalloc on
    write
  ntfs: fail the mount when $MFT needs its own extent records
  ntfs: do not map a vcn as a hole when its runlist lookup failed
  ntfs: fail the mount when $MFT's data size exceeds its allocation
  ntfs: reject non-resident attributes whose sizes exceed their
    allocation

 fs/ntfs/attrib.c   | 54 +++++++++++++++++++++++++++++++++++++++----
 fs/ntfs/attrlist.c |  8 +++++--
 fs/ntfs/inode.c    | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/iomap.c    | 16 +++++++++++--
 fs/ntfs/layout.h   | 13 +++++++----
 fs/ntfs/volume.h   |  3 +++
 6 files changed, 137 insertions(+), 14 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0


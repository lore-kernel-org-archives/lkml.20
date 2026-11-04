Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763981;
	b=l2yP62ZcgWErQHN5vzIwq4xSVa0o1AkUXGuaPx2OGpSAsiVFhFCwSq6IURc8BmcmGrcl
	 V6JslPtkniWIhtf6R91pOcg8ILsOsvsXwS5QAF2tbm1+mk/P41OAzinW4veeH7v2QbSpc
	 kkrslgsuYH/fU8tpXkaajCdWzxuZrQCH/ngWFvDtWmtayAkLAhe3rVVsZfuDGJteb5pHW
	 IiTDt+dhnalE4jakwXbw4YVbHonJPpS8TMlm5S50Ju9lJHKyq11FYhaHDd85t7Nbru7ae
	 xNrZHEI9iAFD0GDBx3kBg5ScXHe2bisTNWRjoRocoF9yALtTVxBg3xSBzGYTFZT6HHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vxJLmV6OXCoxa83sUUnlyhlj59SW1UTBuaKREwaI5xs=;
	b=biPCzvaKuMIQR8vieIVy4t91jXUZiaJ/4zflJD2naOQl8+OhUW17PiO1+aTTC5YBT210
	 Vu5xLrnNj9gvBltDovTzdV4AIRU+mLqfdCB18IHoDeMTfYKCEFLy/31Q+eBikOq1tQ27o
	 vpY807WtkwwCialJsy0x86P7GXP82dyrOMnS6xdLRkKqSLdsqCsIe3l6PSNOSThA6BO8L
	 H2HPmgqJN7xaER3etVjmioPnvBHHFZge/BJsAQ8QKliTaIIOcbHKx4YS4W3rim5rhW0TZ
	 AsN3+s4awa+BFS1X/mOK5duX0MDqTocGPeh926ESKR3B6iNQbyrtuQELpSPaUoFUqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eCwPBjAb;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eCwPBjAb
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b312be5de8so1609557b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793763979; x=1794368779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxJLmV6OXCoxa83sUUnlyhlj59SW1UTBuaKREwaI5xs=;
        b=eCwPBjAb3NxMDUZxnVXXHzzGe4OTamvDv7DRDfxO0hxmggqPvc7mx1hkEjLlr6Q78s
         0BEGtP1o8tbCe8p69PZg47w1P9iYgQXt8vzkc+SZAHzqIaK3ut8DwDAvulLH2FMbsH+V
         Icf0ezrtQMZjUQys1GhKiCWG4/szbEM6jhepnfyuymF23Qb8HyerfvuwbDPo+s3PDcnw
         kg7iAXWgMQsXNbCGF5mJFg3vVlXx0UBPcbcQjG4Ue4gQg2e0gf6qQmG6sKUwwn3UAyPY
         vAolazpUjoi0rxlsyAf9WXnJ4N8PcI0VpmQGBVi3K3jm2cvrfYsOhoA8pbuXH5or3Z9z
         n1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763979; x=1794368779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxJLmV6OXCoxa83sUUnlyhlj59SW1UTBuaKREwaI5xs=;
        b=PJbKmOdU3Af6FpPy1sS+kaTztj5Gj1ySYJXocWFBtCu2PwYkXtLbMrVAzHe1OH7inY
         g8YuwJno0TBtZjLDCCfMNM8g224UefzZSrz9ayU+MRFDRuDs4BzenI3AK63e988JVE15
         Nz28ZkeogUxFX0PHhUB/y0qKX4uWb8zL44l8CtQA04IgzigPOOVa5G+JDkmfpLLZkDRe
         0jiIOqwQ3+ZP8QHn+hAVNsHYFl4GgOIZSpFlsMcr20uJlznUsKRy/nJNadO6lfluwSBy
         ejWxvG1M4Ul/c5Hph5q/KVO1nFUifQ4qJGrbtcSt/zhI213ksU2OOr3StkAHmnFcc5Mn
         nwQg==
X-Forwarded-Encrypted: i=1; AKwUvBzcdIfcSmIVBQgngg/xWUsohYpBVuqtbC8E6oqPHDZEPAlUQ4/MJBrCRSpt4iEGw+FhTqszZyv7xpUQN2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Bae7FeMVeYkefFImnsuHdrmCdCm9NbMgYusxdXcPahkpQRwC
	Vbqr7xkPLSYcc1GvsppstGdiuiqzJXWIBWieMuzIDYSWf0+BoEEwH8Y7dlpR3xM6CEs=
X-Gm-Gg: AYBFou00x+TLDUpPZMyzdVusAyuuZefJ152PNgcxpN67q9NBmSQaR6CYWWOPiXltUI9
	qwZJ2bbaoy3DUN6kKORlIXyE4TXLvyunGklDI1VOoLEcghwu+PIa56xcBkncM8981oh6M0H+wc1
	m0P5dNtV0BPV2ULHRBvYcAe1M/Y4GU68x/rKJvvjj2ovlLfZ/+G7B0fgl5bnXTV4iF2TQUvf7Sh
	KTgLHZfSOSRX17cByoo9aQs5MGaXzmeQeOFqaIHZLWc0FbebYd43gT5e8AedjztR5Ics7QoDWl+
	yR9x24V19RVBP0Twr73C7Z8kYpExRK50GURSri1Ws8qlfwB4b/dfqbh/dClJBibbkliKPk60760
	dap2l+c99HjknA21BDdYX5k2JKJU4wjaZ+WS8E2eWJ0KFIyB35WdSWriynvnyBBdpm8j9OQfwMP
	i+tsTjeSkM4WV91kPOHXUZt7ndOawJ87jxraguigDBeE25y5XY8dq0Y+gCTK5vEjr2//FV7RP/X
	vXxbdaZdxRC+tL5k02jWZOnwrNKEusHu6E0vXvDKiISKy1X3Z952VSGEjP8lEBTUlDsK5svKNhl
	wPS1fNPTL07zVEtFGZ4Zl1HYLbSPmc/ZeEvxaMVhwC4Wyupfgs+9ffabu7oS3dAIheG0QClYb3z
	dqpQOCtXPJjgTKVk3p2iwTyR7HF/BO+s7XT56dimV59RGRGUkJQePCRGKvdWKxCtkbAUITqd+PU
	bKWN0l
X-Received: by 2002:a05:690c:e3eb:b0:8ae:9448:14c2 with SMTP id 00721157ae682-8b2b67dad22mr93460477b3.99.1793763978973;
        Tue, 03 Nov 2026 19:46:18 -0800 (PST)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1921:d22d:3124:a258])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309711412sm10918117b3.3.2026.11.03.19.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:46:18 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/2] hfsplus: make hidden directory name independent from nls
Date: Tue,  3 Nov 2026 19:46:03 -0800
Message-ID: <20261104034605.1582293-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HFS+ keeps the indirect node files of hard links in the hidden
directory of the root folder. On disk, its name is four U+0000 (NUL)
characters followed by "HFS+ Private Data". Currently, the catalog key
of this directory is built from the UTF-8 string HFSP_HIDDENDIR_NAME
by means of the nls table of the mount. hfsplus_fill_super() works
around it by temporarily replacing sbi->nls with utf8 table, but
hfsplus_reconfigure() creates the hidden directory on remount
read-write with the mount's nls table. As a result, with nls=cp437,
for example, the hidden directory is created with garbled name that
neither macOS nor the next mount recognizes.

At first, define the on-disk name of the hidden directory as
constant UTF-16 string hfsplus_hidden_dir_name_utf16, introduces
hfsplus_create_cat_uni() that creates catalog records for already
converted name, and removes the temporary nls replacement from
hfsplus_fill_super(). The length of the name is calculated from named
constants, and the UTF-8 and UTF-16 representations of the name are
distinguished by the HFSP_HIDDENDIR_NAME_UTF8* and
HFSP_HIDDENDIR_NAME_UTF16_LEN macros.

Secondly, add KUnit test that checks that hfsplus_asc2uni()
converts HFSP_HIDDENDIR_NAME_UTF8 with utf8 nls table into exactly
hfsplus_hidden_dir_name_utf16, with decomposition enabled and
disabled.

The hfsplus_unicode KUnit suite passes (35 tests) under UML.

Viacheslav Dubeyko (2):
  hfsplus: make hidden directory name independent from mount's nls
  hfsplus: add KUnit check for hidden directory name

 fs/hfsplus/catalog.c       | 83 ++++++++++++++++++++++++++++++--------
 fs/hfsplus/hfsplus_fs.h    |  6 +++
 fs/hfsplus/super.c         | 68 +++++++++++++++++--------------
 fs/hfsplus/unicode_test.c  | 55 +++++++++++++++++++++++++
 include/linux/hfs_common.h | 20 ++++++++-
 5 files changed, 182 insertions(+), 50 deletions(-)


base-commit: 71d5a8a05c83b61bce1884905c192eed34ed3069
-- 
2.43.0


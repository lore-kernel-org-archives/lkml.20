Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727515;
	b=NHB48rTHMXSvrWbBGIA/SfjGrHt8Z6+xvch5HJTZKI5xR/1pUUA8KTEb3qk6IIAl78EO
	 uTFHEU4Pl9fcoJCmwUVPXvediaqelAF0cHEDVMzCEBFQemP81V9N0oD1PSgfl1Rzu7D2b
	 TwdiPTE6g/Hzzjcvtw6xintDO/ig+QvPPE53wsL4T0J48qyA3Nalzaw5DcH0L0KNyV16G
	 PyUi9rCs0UA8oXMFlWBFj/7+Jsr0tqYOEcpct47//4LitSK18QcsuBsQtwineiFBXpwl7
	 Kvkszv8HgeH+iM+nyKckDT3HEJhB/aMBI9Uep+l8dw23IGcIhmreeQFZ1ZYv6mJjyjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727515;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:X-OQ-MSGID:Date:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=uMAvHJZEF1Q8OY3SKDQ7nLHVkkIo5TZ9PtucqHYyY2Y=;
	b=Zo2iqjtA4tyeX7UYoYCdV9zOpV5JKsn4b8Ti8korM73g25z7bmgbkx4oMYwkNNXZUFNA
	 GfAe8etReIZ2jQGp+Cgr2CPmFQJJmfqZCLHNTkHjg0GmTdKJUW6EN/O2NRz631HXlhYY7
	 77YkkyvzcuyKOA1daV/8xjWyXyBOakpXVmE0bomAfabUUYc7SVNRQuRdla0HWDaDDFJEB
	 0Mpz91oTVU6ZITBkgVvIUvFsZ3szvo2u0nJTnsk5BdkN7NHPyKTlLMqvMDrAHiL5+HqMC
	 ryQXjppL2GsfKhXsDzKfbgusYKHA0Qw/sW7w2waeGRdnpApSvAQhJ0PTsGgKpFOK14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=DFytPb35;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29F8606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=DFytPb35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793727509; bh=uMAvHJZEF1Q8OY3SKDQ7nLHVkkIo5TZ9PtucqHYyY2Y=;
	h=From:To:Cc:Subject:Date;
	b=DFytPb35o4BdENqymacpB6ptG1gueeY2LTznSaEQHJKen7UF5tuJv7gyrvlygkmRd
	 XysE5fzvMAjIvxXLfpcbVWtvUG18/BlW0wrwUY4G2K7vyxTvcxA7lg6XkCOGYSVyCT
	 PHfewtma28AGT6YgRjC1nYybl6znnBu86uy1akP4=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 99B26A55; Wed, 04 Nov 2026 01:38:27 +0800
X-QQ-mid: xmsmtpt1793727507ta37495vl
Message-ID: <tencent_564F695449AAF937D088B9D394E942549106@qq.com>
X-QQ-XMAILINFO: MgvAHZ+V1260JHN4yO1jxt63D0Xj1QAlFw/fZCdDQprJDSxEPVzlZ4WG3pBU2I
	 INag+a/+55KNCpx+1KW0rIkz46GsyuUWQOJzCJcgLj+/oEFLmSu1sYMWUGwH61J0TSqGsWxV6x6e
	 ARg8r7KY/kk876JZwR9WSd8wktwXAWZh2gko2HUhmsxBL8R1ORrFxUr/TVuk+CvTu8Jfzg3Hc9bn
	 OQPY0s8WBXmdG14lamMXOIVYHzwB6ycnmsUwyMjcTVU1y48moYpk983QbxOcXguRk3IXlDqGbJl2
	 f1asC0VYrcWMZ4sNfvdgtlkomDc0i61BcODdCxsdeBxnfspFORZWeELSTDvqCJtwhzPPqd3BJ1yH
	 rfUhmIhRiUFbMg0kjdT8zXi9jsoIUEO16Ug1a/+W0KR91xS5aW6X6W3MySsWFncGYWWUG/DMmAbW
	 mVHrXz2P4l+f0E9Zd/u6mQwRxILSNrHsEw38QxQfVNybF320gbHK2EIbjT2DXuuMR0yC/nUw082b
	 EXnnQqjuOTHKrbvyK1lP1ROdeJw43aBddFv6/RGHf+4D7gIQrHv32BJvbrLUhVoH+W77gcE4/b1H
	 ptVyWbhVpmYwhZdobJgzfXp5UFg9OC/Petb7TATklqL0omHRi7tjROJ00TZYz70EoVY5h0/iWK13
	 gB9TpMChFPa0Xb+Tytr30J7SFvfzUo0YpJwrvrh6WK6Lw/gSckPta/onDmxd2ltpj/d9giGvZ5to
	 v6VBInl5yLgLDlTXtxTD3jsLvbPm2keSPN4mAPzX/KQTLVPmG954E5UHGZkv/oa5PIs4w7YpacdE
	 jEtkp9B6oDZ11qJ5QyNXj8ucQ43rMaAm4dIocjJA8Cvx1qYAZXZkdrsTkSrfGtAXuwqYtK/ZHwit
	 Hxvj+pLRFfen+XrY5jhOJy4p7+zrDtdp5HiIt82KwanRrj361K6lpV7Rd/MNUCwN2GCHd9LSymom
	 sxtx99HB1yfS1/izv7HV+7w1LFn1C+41SBs7VBZadC1MdjXzxvs6EaipU7n/NbzsSmU9GwXxYdDU
	 QoxU9h6zwx9r56VmoN4QwFk44lAZxahzy8aoTjqw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Guikun Yang <yangguikun19@qq.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: f2fs: missing cross-check between NAT entry ino and recovered node
 footer ino in do_recover_data() - kernel BUG at mount with
 CONFIG_F2FS_CHECK_FS
X-OQ-MSGID: <c16-f2fs-nat-ino-mismatch-20261103@qq.com>
Date: Tue, 03 Nov 2026 14:00:00 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Mounting a crafted f2fs image ends in a kernel BUG during fsync data
recovery, before any syscall beyond mount():

  F2FS-fs (vda): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
  F2FS-fs (vda): do_recover_data: start to recover dnode
  kernel BUG at fs/f2fs/recovery.c:696!
  RIP: 0010:f2fs_recover_fsync_data+0x7ce6/0x9730
  Kernel panic - not syncing: Fatal exception

The BUG is the f2fs_bug_on() at fs/f2fs/recovery.c:698:

  err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
  if (err)
          goto err;

  f2fs_bug_on(sbi, ni.ino !=3D ino_of_node(sbi, entry));

ni.ino comes from the NAT, ino_of_node() from the node page footer being
recovered. The two values are read from independent on-disk structures
and nothing on the way to the assertion cross-checks them:

  f2fs_get_node_info()    validates only the blk_addr range
  __get_node_page()       validates nid =3D=3D footer.nid only
  do_read_inode()         no ino cross-check either

So a NAT entry whose ino disagrees with the footer ino of the node the
NAT points at reaches the assertion, which is BUG_ON() under
CONFIG_F2FS_CHECK_FS.

## The two configurations behave differently

Under CONFIG_F2FS_CHECK_FS this is a kernel BUG at mount time. Without
it, f2fs_bug_on() degrades to WARN_ON(1) plus SBI_NEED_FSCK, and
do_recover_data() then proceeds to

  fill_node_footer(sbi, dn.node_entry, dn.nid, ni.ino, ...);

at recovery.c:790 - the NAT's wrong ino is written into the recovered
node's footer. On a production configuration the same input does not
crash; it silently stamps inconsistent metadata into the node page.
The missing cross-check is identical in both configurations.

## The ofs_of_node case was already fixed; the ino case was not

In 2018, a crafted image triggering do_recover_data() through an
inconsistent ofs_of_node was reported (bugzilla 203227) and fixed by
22d61e286e2d ("f2fs: fix to avoid panic in do_recover_data()"): the
ofs mismatch is handled today by the f2fs_warn() + -EFSCORRUPTED +
ERROR_INCONSISTENT_FOOTER path directly below this assertion.

The ino mismatch at the line above it was left as f2fs_bug_on(). It is
the same class of inconsistency, read from the same kind of
independently crafted on-disk state, in the same function, and it still
takes the whole kernel down.

f2fs_sanity_check_node_footer() (node.c:1545) added later checks
nid and the inode/xattr type combination, but not ino either.

## Suggested fix

Treat the ino mismatch the same way the ofs mismatch next to it is
already treated:

  -       f2fs_bug_on(sbi, ni.ino !=3D ino_of_node(sbi, entry));
  +       if (ni.ino !=3D ino_of_node(sbi, entry)) {
  +               f2fs_warn(sbi, "Inconsistent ino_of_node, ino:%llu, nid:%lu=
, %u",
  +                         inode->i_ino, dn.nid, ino_of_node(sbi, entry));
  +               err =3D -EFSCORRUPTED;
  +               f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
  +               goto err;
  +       }

Notes on reproduction that matter: the crafted state needs the
checkpoint version raised and the checkpoint checksums recomputed on
both copies (is_recoverable_dnode() requires the footer cp_ver to match),
and the NAT journal entry has to be updated rather than the NAT page
copies alone, since the journal takes precedence during lookup.

The reproducer (image builder, forged checkpoint/NAT builder, ready-made
image, crash log) is available on request.

Tested on 7.3.0 with CONFIG_F2FS_CHECK_FS=3Dy, deterministic 3/3; the
assertion and the surrounding recovery path are unchanged in current
mainline.

Thanks,
Guikun Yang


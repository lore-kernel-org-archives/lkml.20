Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793819005;
	b=MvLnc3t09cZxyNICkTGKgtiLtpD+CLfLJovhVAqsJU/D8j6eoA2d9COhPkA/nF2JaYa2
	 r0iNdvGP4QdgNagNZNytObx88xwYUujPmPhfsOoRIatc2G1xIHH9D8mYCHZIbEOqtxG1e
	 e73ltLKPXOHI4GVO+lzeh5rV/qozrnjUgC/9XwTt78TfuQfecafWnUF0mPtnnRyDtk33v
	 zlt+sqHltuhnsSQmiWHrI+k850cI1SJpZZm5u3EDcB5ILljKZZF+9Jj1GXAl/utnclcyB
	 LmQKLEzIhKBIPPrpTxJqGLQDrDB/7ht7LS4MsySvABmF9QwFxa3kwzhdzrAafULWu6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XCfh/r1pNC+HkePqhofPM4Oqn3XKbj2GBSYYca0Gv2M=;
	b=NM1tcs4erhxt+aWEFFJgr5S/KHzT3hD85vG8bXXzDzEPvDfZI7tnYqnvGGCe/KXTLUFb
	 YFBaXH4faHHC0gMeTfSJiEHpmx9Mci3h2hkMM8GXUfAttTZkfAEn3IIVVci4+Brr1DTCr
	 J8sA51evw6dPcZNFSo15nXhEXTnb5NQGxxMz4ohfbSaFwgI7g0liB3XV+0VD2yt1OO+Hk
	 lsmFL/pM6eRVgFkiAzOtVRd1PoHHYdxOMGgnI7UMHVeDLv4kbghzzvSt16AgaH/qXwgHU
	 lJ7+ZKiyAIxRbinGz5k3vW81/88HVFWPdpW0Scgij5pZ0EWJ9C1SSOFfsC/y4PGJvkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNJUNa5+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DD606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186DD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNJUNa5+
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so974275c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:03:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793819004; cv=none;
        d=google.com; s=arc-20260327;
        b=N04/VFQEbI1vxOAE32wdSGOQlbM9JUQoQ+a4FwP2kcaVlbsAPvrN6EAKbB4MpvTj8m
         nbXNsBECyPtxCsO3v0H/n94/xpmyT0xogdrnoUy4g2oUBuIBFjFTBljSnOogz83kIB93
         zlCjMgADRftASMf8yNsPvCyvMPpHJRtwfBxmdq5wmi1aNJ8zAY5gsEltwY3bOkzYiT4l
         Pl8uj57eWBDIbQwcktVvZvm6FdD0vesJNRF45/KnIDw0JiPOB0zmiAkwVWHzObT+K/2T
         LpBso0d5DrgUykYqBzcUCttpwGiDzWEsnUsTtrgRau7/lS4UtWAqrIVZM/lFJD2CUGa5
         7vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XCfh/r1pNC+HkePqhofPM4Oqn3XKbj2GBSYYca0Gv2M=;
        fh=4SOmGcX+Mc0wysl59EiHDQL5jtKfJ7OF6Suduu9HtNc=;
        b=jd/yw6jpxZ79bdp7r8jNwPz/BbVeYv3Jmnqfm3SCZ8361vCO61BXD5yimeFPKe5LOY
         NByZ8TsdDWWnO32E3eebbySNAtLkPRiGSLIKIH45Qod7OGh7jPT5bwU57LwTC6xlXg7L
         3UD5/QwDu5yDXMR/fiys4QrXX0mRPmz1fJSJ/NPZsyTppjKXT5ZwYcm3XdDeXC7esVEM
         1p+Dtatmh5FQ7Z8k+Olq5I8S853ozUKsaRKf2LXIp6D/R5mR1yedo/31QTyOCMwCJMSn
         C4lBwkob9DYfMQzUBeW2BkvOVT9WP61sjh0SvJC29BiXvdN5Czntf77oSn8XCn+50D1/
         Gl9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819004; x=1794423804; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCfh/r1pNC+HkePqhofPM4Oqn3XKbj2GBSYYca0Gv2M=;
        b=zNJUNa5+LZP8jhdZzeITjtExZi25kS1D+0da85PEoG4ZDH0NU0CSWyzsH4B9f7CnPR
         Iuulz455yK2gUbgM+RGHOhd79GDIaVqag+wU7ve8AaSaT/IaJPg27d513U4W+usMPZBP
         u3lxAWMGdTP79PDUq6QD0E+38O1AZB5pczonbNBkIJUWlK8WmYMMt/9djs82sG1SKKwV
         WJKbY9YYwoSU9n7EovUYuUv0kj8nJrsAphJov4RJ1+wqEnuaCBhuZ83zTIyMot67kOHw
         Duff9zjkoH6jNDx3gTfWTU8LthUAJ3dlfUFNCPaBqtcftL6Hw0gK2aP8I72UimZNZHTM
         sT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819004; x=1794423804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XCfh/r1pNC+HkePqhofPM4Oqn3XKbj2GBSYYca0Gv2M=;
        b=biNQiwU74esABq1HArgUZwU+UCp1Z+EGVlVqfGD8vQUAdSsZW+jj7P8QThaZY5Lksk
         xXQgzH1ceL0YK+D9k/0ibQb802dtCr6oVF9r62eUSFtt6JzPflPYQDCFIMGfe5Gmg3M+
         v+K4ov1eUjkzuc5bPUkbfi28HT8usE38mIPBLkMcxb0HIaMTXAKFumZlguaIJyNQDf1g
         GB62WSFbR09jj0VmA2EeaMn2KnDy8oaRz5RQGAOYwTVDQpAbhZSyVARmygoRtlfIng7P
         1b4A3F4RAMeaaZzxf4ONNMWsOOXls63zZdi97ogY0LvG4SrvjzPrFKuXzx7GihxmgBWR
         ztDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDUUwRLE4s/qSgQ/URxnSvY6rmL9StNKCcbBleVpnWC+/Wz961t561W/iCEJmT5oF4f4hfWOUhkRPYBtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/do+j0zCKexKw5KzYahohrQHFwtcrat2wveEbCvQKGrxRTvWrY
	uQ5mBB8S5bsYOCOj4CyKns0swRgGCZOPhH15usCuN3WaiRM4agEeQOnXx3MhG5mXwKJjvi4oQ5j
	K+t+GamOLA/kQEhxA2wYB5AX/PD6VY3s=
X-Gm-Gg: AYBFou3Nt8A2gx+HLImwqp1kJ68YhXVqA7i+cwmYIa+OA7TxC3/TTNCf5m6h2bbW1rj
	AES6FIWT/zhHHPaoiavjMQH+g4uRRA4lhe3kPXX0I4PivKp0V7YDj7YzMAXfJ3zknM0HPVhFvYZ
	i7qmXBSAbnzRp+me51vlu+cL+n6ThjEN7SEdXhBWFG+5m8/L6CoshsqF1F7JUVj0cjquAvU22aJ
	LjZbD8a2tHAeha/iBhgMSc4RImo0ajLz1Ia37tSyx4Soy8kV/WszQWszGanW0z4K1fmEm7UbEqM
	bT3spOWPKYAtLPSkOI1Svxmc1akS1VPLGGK6tAm0GQmLrOrD13ZXV2B3Yg9cOLtFaXEcy5drOG5
	roz+715P9b60ANscZ6MtQiCGeiJxr9W/HVerRcXqrjuX0m+KPdS2vHxM8GY4u10DBarTd2ArTMh
	1u+EsrciUqSRqnL/yRhY90eDQWTcmObQk+2OnRJKBd6v7dyVw=
X-Received: by 2002:a05:693c:8803:20b0:369:f0de:259f with SMTP id
 5a478bee46e88-36a424085bemr28275060eec.35.1793819003986; Wed, 04 Nov 2026
 11:03:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-btrfs-sb-read-req-meta-v1-1-e06b4d059897@gmail.com> <20261104172140.GB4186782@suse.cz>
In-Reply-To: <20261104172140.GB4186782@suse.cz>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Date: Thu, 5 Nov 2026 00:03:12 +0500
X-Gm-Features: AclHuK9hRBmH4NMhzWAeAAXoaXyP9CCszpmfue4Ccymk-88feTuPzb2KYVZGwTs
Message-ID: <CAEmTpZGTub1Q-b9G=k4+=+_fG81HitJqFw9kAsBFM6eUoFt8vw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: tag all metadata I/O with REQ_META
To: dsterba@suse.cz
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, Qu Wenruo <wqu@suse.com>, 
	Mark Harmstone <mark@harmstone.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 04, 2026 at 06:21:40PM +0100, David Sterba wrote:
> Remap tree is experimental feature in btrfs-progs, so you'd have to do
> custom build with './configure --enable-experimental', then
> 'mkfs.btrfs -O list-all' will contain 'remapt-ree'.

Thanks, that worked.  I tested the remap part now: btrfs-progs devel
(4f5956a) with --enable-experimental, kernel with
CONFIG_BTRFS_EXPERIMENTAL, a 2 GiB filesystem with remap-tree, DUP
metadata and single data, /usr/include copied in, then "balance -m"
twice and "balance -d" twice.  kprobes on entry and return of
copy_remapped_data_io() mark the bios of each copy.

Both callers of copy_remapped_data() are covered: the first balance
goes through do_remap_reloc_trans(), the second one mostly through
move_existing_remap().

Copy bios, with REQ_META / without:

                      without the patch     with the patch
                      run 1      run 2
  metadata, reads     0 / 56     0 / 74        70 / 0
  metadata, writes    0 / 112    0 / 148      140 / 0
  data, reads         0 / 288    0 / 288        0 / 288
  data, writes        0 / 288    0 / 288        0 / 288

The metadata counts vary from run to run on the same kernel: each
contiguous range of the block group is copied separately, and how
fragmented the metadata ends up after the copy depends on the timing
of the commits.  Writes are twice the reads because of DUP.

btrfs check finds no errors afterwards, no warnings in the log.

One thing on the way: mkfs.btrfs from devel crashes with any
"-O remap-tree".  create_metadata_block_groups() commits a
transaction before setup_remap_tree_root() has created the tree, and
write_ctree_super() then dereferences fs_info->remap_root->node, which
is still NULL.  For the test I skipped the remap root fields in
write_ctree_super() while the node is not there yet.

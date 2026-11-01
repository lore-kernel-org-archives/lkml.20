Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575246;
	b=Ss6+ovC2iSuUspEcybBHXQ+YE9atSt5C5tBiiCttn0WVUz2SGxckMupSIegDE5pJGsGr
	 O/in78n8yj+7StWDmN8sd4t97v7xINQpDQSwL38/IISxpZaqQ3+FRP+8Us/TsqURxBomE
	 neCT9F/d51O8GtO6XwNGHvrWnd9LXUheesGQP8VQtNPxe8jypMVmQFDSg7dAg6xr++rvV
	 F78iqmJkQLlM3+F4ZxSRq3r0KjUddkvJtdAbk2GnI5v0D7vbSkJkx5EpX0fv/rQUUEhGe
	 dszsZjEIyNUlryRoBI0j1WxzoL8LS8fJ4ZTZ2mLc+IkxozyP6X1Z1aZIX5NL9zwTZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575246;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=DN2qS6zGxd+41Wpysh4jKjE7aUcT+0wcXmczyVLoNZ4=;
	b=5GWhE7ue37X1Td+KOqDUAu5S+M6v40Sfs9KmNOXWxaFLfQTug0Kd32OFNdxuMwUrbj8Q
	 shswomLKpA2IZqQUENoxi7SyK/wq8ryCQnhXRwNwjcIa1ayrzkHB8NrEEfxumgpafz6xj
	 8NodESEaq5aFaO4r27b6i+QSjVUkGtXiHBEbOdTYvIRmZ0y1uQWeZ6n4a6zOp9QwWLaZk
	 jFrDMeU414D6Ab/JFsh4qGje+gKduigzuLO7+nQAv82NSlvQ1gXQb20bbcNCtZ7/CKTO+
	 v73A+xtaC5664yjj/4HBGTDC/U+6e+Y5YhAU4gHkvNGIBHwpCJwroa1U8z9XlQbRfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=sur1vkFH;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D2B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D2B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=sur1vkFH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DN2qS6zGxd+41Wpysh4jKjE7aUcT+0wcXmczyVLoNZ4=;
  b=sur1vkFHUFM4tdopFk453RMy0yzNeGFzo15QkmRsOjong5vtylwkc2Mg
   b2acZclxfvTsSwhszQpKDwTsQT97YcvS3/d27hRinjCiHZvg3c02W3BXH
   ViK4uQdDW8dFQnry4i8jpSmnV9m8yI6ot/dBYRKFVWnDv6msSPNJop3Tc
   k=;
X-CSE-ConnectionGUID: seC/1H/YRD2C1QvPGX9PXw==
X-CSE-MsgGUID: 4emA+J89SAm/t9cYuuNo8g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="161430623"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 00:20:41 +0100
Date: Mon, 2 Nov 2026 00:20:41 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
    Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.de
Subject: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid reference to
 the index variable of the iterator on line 553 (fwd)
Message-ID: <a1b79e2b-e960-b6de-9139-fbbd13bfb2b3@inria.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

luo_file may point to something random if the break in the
list_for_each_entry is not taken.

julia

---------- Forwarded message ----------
Date: Mon, 02 Nov 2026 00:06:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid reference to the
    index variable of the iterator on line 553

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: 7c722a7f44e0c1f9714084152226bc7bd644b7e3 liveupdate: luo_file: implement file systems callbacks
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-2103-20261101 (https://download.01.org/0day-ci/archive/20261101/202611012349.RESCKElP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7c722a7f44e0 ("liveupdate: luo_file: implement file systems callbacks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611012349.RESCKElP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid reference to the index variable of the iterator on line 553

vim +558 kernel/liveupdate/luo_file.c

7c722a7f44e0c1 Pasha Tatashin 2025-11-25  517
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  518  /**
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  519   * luo_retrieve_file - Restores a preserved file from a file_set by its token.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  520   * @file_set: The file_set from which to retrieve the file.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  521   * @token:    The unique token identifying the file to be restored.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  522   * @filep:    Output parameter; on success, this is populated with a pointer
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  523   *            to the newly retrieved 'struct file'.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  524   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  525   * This function is the primary mechanism for recreating a file in the new
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  526   * kernel after a live update. It searches the file_set's list of deserialized
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  527   * files for an entry matching the provided @token.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  528   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  529   * The operation is idempotent: if a file has already been successfully
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  530   * retrieved, this function will simply return a pointer to the existing
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  531   * 'struct file' and report success without re-executing the retrieve
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  532   * operation. This is handled by checking the 'retrieved' flag under a lock.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  533   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  534   * File retrieval can happen in any order; it is not bound by the order of
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  535   * preservation.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  536   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  537   * Context: Can be called from an ioctl or other in-kernel code in the new
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  538   *          kernel.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  539   * Return: 0 on success. Returns a negative errno on failure:
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  540   *         -ENOENT if no file with the matching token is found.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  541   *         Any error code returned by the handler's .retrieve() op.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  542   */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  543  int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  544  		      struct file **filep)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  545  {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  546  	struct liveupdate_file_op_args args = {0};
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  547  	struct luo_file *luo_file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  548  	int err;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  549
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  550  	if (list_empty(&file_set->files_list))
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  551  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  552
7c722a7f44e0c1 Pasha Tatashin 2025-11-25 @553  	list_for_each_entry(luo_file, &file_set->files_list, list) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  554  		if (luo_file->token == token)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  555  			break;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  556  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  557
7c722a7f44e0c1 Pasha Tatashin 2025-11-25 @558  	if (luo_file->token != token)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  559  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  560
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  561  	guard(mutex)(&luo_file->mutex);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  562  	if (luo_file->retrieved) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  563  		/*
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  564  		 * Someone is asking for this file again, so get a reference
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  565  		 * for them.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  566  		 */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  567  		get_file(luo_file->file);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  568  		*filep = luo_file->file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  569  		return 0;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  570  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  571
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  572  	args.handler = luo_file->fh;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  573  	args.serialized_data = luo_file->serialized_data;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  574  	err = luo_file->fh->ops->retrieve(&args);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  575  	if (!err) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  576  		luo_file->file = args.file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  577
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  578  		/* Get reference so we can keep this file in LUO until finish */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  579  		get_file(luo_file->file);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  580  		*filep = luo_file->file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  581  		luo_file->retrieved = true;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  582  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  583
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  584  	return err;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  585  }
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  586

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E5413230
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012688; cv=none; b=kvXibNj0Vh6J2aTgmYR4bLW9QRQoxU9RtXw94BtytYpcsgU6Z2CRot4gGim0yZAHwyRaps7/wvqLlzJ3JSXg/9XLu0bFrUpvzYf2YsA8OJI6bLFpwM4hQiFpg4w55ya7evzQ1FW34rRKmkLgscINTtFfr6Ee+5eiogwA6Z5LnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012688; c=relaxed/simple;
	bh=AhLB3fBKlBPnJ1gV5WEgLBxFhHHECIL+vP7ybq8rbLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kYObyU/yFeL2smI+bwxH5PMIOJ2dnF8q61vJJ6aXT3C8pujr2LSfr33Kz4IJEFyBTC8qxwoBLRrLWDYoBPGmzE2/pXglZMVymx1259VcDkQD7QP+rJ2qgZcSDMx8JZJOMC/VjlUwKBSx5rkv/RYtVkU96i8Ygybc7KIEouTtcx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXS086KC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXS086KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792012687; x=1823548687;
  h=date:from:to:cc:subject:message-id;
  bh=AhLB3fBKlBPnJ1gV5WEgLBxFhHHECIL+vP7ybq8rbLw=;
  b=OXS086KCw7iNtw0knEC7Y0vYSSn1crYbujEy/NvbqdoVjJW8InE8JQdY
   wiMxi3dQ09ScMG3QTmtwRvDkav+Kk5ENsRQUR/nPjxBT7t/7HB5eUyaht
   nxgv4muQeQ6iRhgCAqw/TjpUTTIaNiDnSoFM7/rJatWGexkGJBoiKd7AO
   xMP2xe2i4BI3uHAE7IwIH+Nh9W9bG01pZRCh9KKhODk62F//5Y69gYHHt
   Je7/tXRDnJxvNRjL2gAzvy06SlUPLiv/nAsnBJmpwydeu1Y0Eex41LOdf
   P9cOJBAL+4wPP5Yj826A88M/iABaG3wqCIAi1xQ8Eo4DO+YXNyKJKkj6/
   A==;
X-CSE-ConnectionGUID: XBSvzKPzRlaZ/gkeWbHqfQ==
X-CSE-MsgGUID: re/Q7drWQFipWU3AuC+iRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="673038"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="673038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 14:17:59 -0700
X-CSE-ConnectionGUID: UxkysvY9SsCurQYtih+epg==
X-CSE-MsgGUID: 8J7Vnh1ZTnCRV75vyDB70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1635590"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 14:17:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH6MG-00000000BIl-0NHW;
	Wed, 14 Oct 2026 21:17:56 +0000
Date: Wed, 14 Oct 2026 23:17:01 +0200
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/remote_test.c:237:9: error: call to undeclared
 function 'tracefs_create_file'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202610142301.GBepPVmS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: ea908a2b79c84279f06d6c4fa19bf45f113a34d0 tracing: Add a trace remote module for testing
date:   7 months ago
config: hexagon-randconfig-r2110-20261014 (https://download.01.org/0day-ci/archive/20261014/202610142301.GBepPVmS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e1354f31346666c78d758cee13692ea3b1fe3ec2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610142301.GBepPVmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea908a2b79c8 ("tracing: Add a trace remote module for testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610142301.GBepPVmS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/remote_test.c:237:9: error: call to undeclared function 'tracefs_create_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |         return tracefs_create_file("write_event", 0200, d, NULL, &write_event_fops) ?
         |                ^
   1 error generated.
--
>> kernel/trace/trace_remote.c:793:10: error: call to undeclared function 'tracefs_create_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     793 |                 root = tracefs_create_dir(TRACEFS_DIR, NULL);
         |                        ^
>> kernel/trace/trace_remote.c:793:8: error: incompatible integer to pointer conversion assigning to 'struct dentry *' from 'int' [-Wint-conversion]
     793 |                 root = tracefs_create_dir(TRACEFS_DIR, NULL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_remote.c:801:13: error: call to undeclared function 'tracefs_create_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     801 |         remote_d = tracefs_create_dir(name, root);
         |                    ^
   kernel/trace/trace_remote.c:801:11: error: incompatible integer to pointer conversion assigning to 'struct dentry *' from 'int' [-Wint-conversion]
     801 |         remote_d = tracefs_create_dir(name, root);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_remote.c:824:11: error: incompatible integer to pointer conversion assigning to 'struct dentry *' from 'int' [-Wint-conversion]
     824 |         percpu_d = tracefs_create_dir("per_cpu", remote_d);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_remote.c:835:9: error: incompatible integer to pointer conversion assigning to 'struct dentry *' from 'int' [-Wint-conversion]
     835 |                 cpu_d = tracefs_create_dir(cpu_name, percpu_d);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_remote.c:859:3: error: call to undeclared function 'tracefs_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     859 |                 tracefs_remove(root);
         |                 ^
   kernel/trace/trace_remote.c:862:3: error: call to undeclared function 'tracefs_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     862 |                 tracefs_remove(remote_d);
         |                 ^
>> kernel/trace/trace_remote.c:1255:41: error: array has incomplete element type 'struct eventfs_entry'
    1255 |         static struct eventfs_entry dir_entries[] = {
         |                                                ^
   kernel/trace/trace_remote.c:1255:16: note: forward declaration of 'struct eventfs_entry'
    1255 |         static struct eventfs_entry dir_entries[] = {
         |                       ^
   kernel/trace/trace_remote.c:1267:37: error: array has incomplete element type 'struct eventfs_entry'
    1267 |         static struct eventfs_entry entries[] = {
         |                                            ^
   kernel/trace/trace_remote.c:1255:16: note: forward declaration of 'struct eventfs_entry'
    1255 |         static struct eventfs_entry dir_entries[] = {
         |                       ^
>> kernel/trace/trace_remote.c:1282:13: error: call to undeclared function 'eventfs_create_events_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1282 |                 eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
         |                           ^
   kernel/trace/trace_remote.c:1282:13: note: did you mean 'kernfs_create_empty_dir'?
   include/linux/kernfs.h:430:21: note: 'kernfs_create_empty_dir' declared here
     430 | struct kernfs_node *kernfs_create_empty_dir(struct kernfs_node *parent,
         |                     ^
>> kernel/trace/trace_remote.c:1291:13: error: call to undeclared function 'eventfs_create_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1291 |                 eventfs = eventfs_create_dir(remote_name, eventfs, NULL, 0, NULL);
         |                           ^
   kernel/trace/trace_remote.c:1291:13: note: did you mean 'kernfs_create_dir'?
   include/linux/kernfs.h:622:1: note: 'kernfs_create_dir' declared here
     622 | kernfs_create_dir(struct kernfs_node *parent, const char *name, umode_t mode,
         | ^
>> kernel/trace/trace_remote.c:1291:11: error: incompatible integer to pointer conversion assigning to 'struct eventfs_inode *' from 'int' [-Wint-conversion]
    1291 |                 eventfs = eventfs_create_dir(remote_name, eventfs, NULL, 0, NULL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_remote.c:1299:12: error: call to undeclared function 'eventfs_create_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1299 |         eventfs = eventfs_create_dir(evt->name, eventfs, entries, ARRAY_SIZE(entries), evt);
         |                   ^
>> kernel/trace/trace_remote.c:1302:4: error: call to undeclared function 'eventfs_remove_events_dir'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1302 |                         eventfs_remove_events_dir(remote->eventfs);
         |                         ^
   15 errors generated.


vim +/tracefs_create_file +237 kernel/trace/remote_test.c

   234	
   235	static int remote_test_init_tracefs(struct dentry *d, void *unused)
   236	{
 > 237		return tracefs_create_file("write_event", 0200, d, NULL, &write_event_fops) ?
   238			0 : -ENOMEM;
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

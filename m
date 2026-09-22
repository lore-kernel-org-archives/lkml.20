Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B712F545D8C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085894; cv=none; b=MxU44nZJTUTgxI4CEzOHxZfptsTmmuFXnnBtbrYhyO8ppzbf09wMUKmoeS3o1DsOXAz6LipMMwjjnkGwodbKhAGb9d2o7fPodr6X1cNnsHorUYOtSeLr8q4x4DG1+Rl1WLg0Oe4ywbfjb4Xo4Pd2A17k9Yfzm8kZGe36Ac2ENa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085894; c=relaxed/simple;
	bh=RZOSQoLHjExoyHvf2ro3yLewas3siWyvrgEraEJaHtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOLc3ryNyT6b6AnUn1bTQfP9krMY/ZK7XQLuK5/97BhL0mGTp6PfRMst/8+jLPOguHCTGgsQgsiFpV8E9gjEj4vPmn2Rn1gg4s+GjZ7pRfD6TsabL6MeK+qmRgM30ba2Qow8ycaWCGwom8alyalH11NTxp5BTOOy7CJI3Ag0f5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MHaD1beQ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MHaD1beQ"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBZZKB2630942;
	Tue, 22 Sep 2026 13:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=bBSRIjnqJon9OX7xSzf2GOvROJ1aRH
	WFpAtVvlhIl6M=; b=MHaD1beQUrhuVU5vxF+lBIztMNWhflpd5jN9fHyZFHCNh8
	70GvNvidF+hfdNA7tvH/hE0ayYxd8UAx1/qttoiFb4kvyjAFJepg0IlnVDR65Vzn
	OBJNtiut/ZPUoWWnNmtBAQIEigm0Lf6yni13Wv7Vh7BB614Jp+DwfDvVFd9aHY1q
	g75XS0BMcdOCezPVc/NydWPr087nk/bVzoJbSOY5XD59NwlujuED9X6+Sq2dC7FB
	LcrNdaBqdkOJZSU2PctsXSoJYxQyEqByuyCfNVVzSaJLSTR1xMyuamzs5fa4bIyK
	NY5rrZPPpPj0s5+Ezx9WYVq2PD/1ZYUXv+leaTnw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1p3fk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:59:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBWcmN2774668;
	Tue, 22 Sep 2026 13:59:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gt53vj5ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:59:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68MDxRdA46268926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 13:59:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE58D20043;
	Tue, 22 Sep 2026 13:59:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F37F820040;
	Tue, 22 Sep 2026 13:59:25 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.20.139])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Sep 2026 13:59:25 +0000 (GMT)
Date: Tue, 22 Sep 2026 19:29:22 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: Ye Bin <yebin10@huawei.com>, oe-kbuild-all@lists.linux.dev,
        linux-kernel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>,
        Jan Kara <jack@suse.cz>
Subject: Re: fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx' was
 not declared. Should it be static?
Message-ID: <arKJurAdccdfbZCT@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <202609221900.Pgwrcp41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609221900.Pgwrcp41-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: asvrTGGezCIyG6hfs4RFa60OEZndcGi_
X-Authority-Analysis: v=2.4 cv=EOCTQFZC c=1 sm=1 tr=0 ts=6ab289c2 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=7kltmVDV0Umj_0yNpLMA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5NyBTYWx0ZWRfXxIjm4qbPe5N9
 Z6BI0nBJ4ywxSSQ2XqBItfgQlzAKtK1XXLxZ3bFcluHcEx4m0rkErScQZgYHlCkNKRsLgr3A8q/
 11IFib+RezBGsYcWsc9GabOQkZtTaTU=
X-Proofpoint-GUID: asvrTGGezCIyG6hfs4RFa60OEZndcGi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5NyBTYWx0ZWRfX6x6zHAa65/NK
 ZmkMchgc1IGON0qrcwnoLuGLX90d0FII5BVnZwuwBOR7XoAroX87WtGhkGx15he7L42O6b1nLPg
 XCh6jtR5FYYenpODL86OgydLhfK7LP9MvlvJ0rZsc4vSYJwAD1X31znJOd2CfKnixrRPZLHcoxb
 Ve5icwkphDW+iINmVT+rjOH8WzqBdslNXLUF+TsoljeWI+Qmf0VRJduuvc0T3qnqYVpnPutALg3
 0wgP79ffgYUDR71Sd37gtD7mk8FPGPJdBPH0WJFpvzqNurTDIHQwoanrB3sXpNw2s8uCltRPxWq
 Tz6TZ7uQymT4yimp7IPVZAqY0aHtZvIr8QiE4fG+Pcx26hbnUzrSWsd07vLjwRiyJrdoiHmbKwY
 lwd5psttqU3nNf+RvLpbYOxIksQP5bJkcMRC82yA8SpqGJeLw5y7MxVOMeTlkk9lCAO/EYPMZCc
 657Mhs43d2nWilQ1hgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220197

On Tue, Sep 22, 2026 at 07:42:05PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
> commit: 9e1b14320b154094bb2c1bee6d8c6cb851fc3215 ext4: fix extents-test.c is not compiled when EXT4_KUNIT_TESTS=M
> date:   6 months ago
> config: x86_64-randconfig-1300-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221900.Pgwrcp41-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221900.Pgwrcp41-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9e1b14320b15 ("ext4: fix extents-test.c is not compiled when EXT4_KUNIT_TESTS=M")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609221900.Pgwrcp41-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx' was not declared. Should it be static?

Yes, seems like a legit warning when EXT4_KUNIT_TESTS=m. I'll send a
fix.

Thanks,
ojaswin

> 
> vim +/k_ctx +59 fs/ext4/extents-test.c
> 
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  49  
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  50  struct kunit_ctx {
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  51  	/*
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  52  	 * Ext4 inode which has only 1 unwrit extent
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  53  	 */
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  54  	struct ext4_inode_info *k_ei;
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  55  	/*
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  56  	 * Represents the underlying data area (used for zeroout testing)
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  57  	 */
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  58  	char *k_data;
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23 @59  } k_ctx;
> cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  60  
> 
> :::::: The code at line 59 was first introduced by commit
> :::::: cb1e0c1d1fad5bfad90d80c74ebdb53796d8a2db ext4: kunit tests for extent splitting and conversion
> 
> :::::: TO: Ojaswin Mujoo <ojaswin@linux.ibm.com>
> :::::: CC: Theodore Ts'o <tytso@mit.edu>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

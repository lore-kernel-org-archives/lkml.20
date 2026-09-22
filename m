Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96883E171E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096617; cv=none; b=a9DiwLnSP1uzO2pJ+DiNZaYfPqnmgjCpxOwqhuh0YuNCa1kYmWwXN4DvtxU07LtlmaGxkaj7tiO9Rqf/yvvsMW96fKNUEBe5DwdzqL0HhXNZ3DQ/6VYDUviW6TVoZlPy3j9h5000r7em9hYrwyaxNSBNSQMbaUxNEz03bOkxNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096617; c=relaxed/simple;
	bh=vuv3LXP65HtJJDO/jOb2jpgskyphoyKJJGzgUDUNQs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PS8NYXNCu+TvWVDqQTzmhVnXhnppFR1t02Kg+pV6uFddupCTEZkMK4HClt/0+58O8/217mnSYE6t1YegbTqOt/P8a9EKjmlt6StHkA2C53lNefg2C3lQ1lUN4V8pF8LjcubjbKdpdkp/EUbc6N+lLmbtYSEy/28/eOrwU877MJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aehw4cBx; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aehw4cBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790096615; x=1821632615;
  h=date:from:to:cc:subject:message-id;
  bh=vuv3LXP65HtJJDO/jOb2jpgskyphoyKJJGzgUDUNQs8=;
  b=aehw4cBxAph/8/+XVhdrPN1P0ffznJAeRmzM9l+ojO783ezgCcdqlCPz
   H4k16/3jYqm699jkHr80HCnsigkhZCyqltSxw0kQKVjBDSe65dJJW37SF
   g8CgfRHOjcHtKUxXdu1Tn+fNTN8pqCjfT9v7VnolVQYoMLuF9EnQgz4w6
   DE48N13Svv5r8D02Zl2tD9iFGwberWQu0+7gk15aMTtUf8KQ9DzT1Pe7P
   nUMwf5P9K68qX3n4k0VvGWacamdCEDf0UaugoKefgh2HfqdfWNs1znpmS
   VejI76kPbuzRRBHAMvwIHoBNMbV/a76JtfD5eTPKkyOVl9ZN84lCIlT8A
   A==;
X-CSE-ConnectionGUID: 8hu7ZAyDQ3uuZkZJ8VABRw==
X-CSE-MsgGUID: VYxZK64oTseQZ8pzp20KpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1223655"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1223655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:03:34 -0700
X-CSE-ConnectionGUID: S9ejweXlS824zg/UW0bGIA==
X-CSE-MsgGUID: adVUItJJSw+cPZ8f5oEayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277975662"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 10:03:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x93tx-00000000FmI-2QIo;
	Tue, 22 Sep 2026 17:03:29 +0000
Date: Wed, 23 Sep 2026 01:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: drivers/nvme/target/tcp.c:1325:46: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202609230152.YAKhcW2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: dbbd07d0a7020b80f6a7028e561908f7b83b3d5a nvmet-tcp: Fix potential UAF when ddgst mismatch
date:   4 months ago
config: microblaze-randconfig-r1307-20260922 (https://download.01.org/0day-ci/archive/20260923/202609230152.YAKhcW2K-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230152.YAKhcW2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbbd07d0a702 ("nvmet-tcp: Fix potential UAF when ddgst mismatch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230152.YAKhcW2K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/tcp.c:1325:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] status @@     got int @@
   drivers/nvme/target/tcp.c:1325:46: sparse:     expected restricted __le16 [usertype] status
   drivers/nvme/target/tcp.c:1325:46: sparse:     got int

vim +1325 drivers/nvme/target/tcp.c

  1288	
  1289	static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
  1290	{
  1291		struct nvmet_tcp_cmd *cmd = queue->cmd;
  1292		int ret, len;
  1293		char cbuf[CMSG_LEN(sizeof(char))] = {};
  1294		struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
  1295		struct kvec iov = {
  1296			.iov_base = (void *)&cmd->recv_ddgst + queue->offset,
  1297			.iov_len = queue->left
  1298		};
  1299	
  1300		if (queue->tls_pskid) {
  1301			msg.msg_control = cbuf;
  1302			msg.msg_controllen = sizeof(cbuf);
  1303		}
  1304		len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
  1305				iov.iov_len, msg.msg_flags);
  1306		if (unlikely(len < 0))
  1307			return len;
  1308		if (queue->tls_pskid) {
  1309			ret = nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
  1310			if (ret < 0)
  1311				return ret;
  1312		}
  1313	
  1314		queue->offset += len;
  1315		queue->left -= len;
  1316		if (queue->left)
  1317			return -EAGAIN;
  1318	
  1319		if (queue->data_digest && cmd->exp_ddgst != cmd->recv_ddgst) {
  1320			pr_err("queue %d: cmd %d pdu (%d) data digest error: recv %#x expected %#x\n",
  1321				queue->idx, cmd->req.cmd->common.command_id,
  1322				queue->pdu.cmd.hdr.type, le32_to_cpu(cmd->recv_ddgst),
  1323				le32_to_cpu(cmd->exp_ddgst));
  1324			if (!(cmd->flags & NVMET_TCP_F_INIT_FAILED)) {
> 1325				cmd->req.cqe->status = NVME_SC_CMD_SEQ_ERROR;
  1326				nvmet_req_uninit(&cmd->req);
  1327			}
  1328			nvmet_tcp_free_cmd_buffers(cmd);
  1329			ret = -EPROTO;
  1330			goto out;
  1331		}
  1332	
  1333		if (cmd->rbytes_done == cmd->req.transfer_len)
  1334			nvmet_tcp_execute_request(cmd);
  1335	
  1336		ret = 0;
  1337	out:
  1338		nvmet_prepare_receive_pdu(queue);
  1339		return ret;
  1340	}
  1341	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4128381B1D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518830; cv=none; b=CmbQEGfCTb/luk2vD4OXepLYrkkSrlToB+tpIrcH/t6Ta7rLhXUYxzP+BepQxkQhV/f3hLfJCZj6B093jnn+SdqFc3tvcvDCesj0WFKFrvzv3g73jZ23OFc+ujywhIv6GxwbG5Rzrc6eurLwh+ipschXL24tuX49isSjMCQYO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518830; c=relaxed/simple;
	bh=XhHEcK7iaaGdxJZOGDsUvvirQE/8KlFPULiYG+6lkCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7abdmd05JlqeeSFED3PKdk4qz2/gkYx07ZUHHfPt2RDtXUx7blurMyK97+95a6vdE8FcwFH1N1q7XIUHoOLGHeofyMcPe4xoZclZFpg/UVU/Lf0rAQIUZli8B4cHf9RPknJsvOr93m4kZFWRjwvZgl35rPGI1G2ZYkzub+a2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NisnuPp7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NisnuPp7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso818457a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518826; x=1789123626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J6o/zZhgP9G23RfgDZuucDuAsCMoCgCycGb2JjyoYo=;
        b=NisnuPp7ANHiMNHxMJa0WY5IqhF+h653vqQCKToJT6EoYc9Qp2COMWs04XF5QAuWyj
         gcczgkCAk9z7xWsYIRxQ42AKCyhpBcBFCebiw+V9iB7xY5dp9t2JJn/Xmm/02CAsYA9l
         5LQm3O9ru0pOIw+OUUiWo8yUAtNhLFvlmEeFAkr6fjIa4T3MEeR8usMfpuuTmt+IbT7c
         0wEeFetV8QPOgKIAn87Lm/n5aR2VmhM+6z46LwnvxLvom7UNdMeJg9zhP4aavWNHX8C9
         CVWi+/KQfhL1XZbn4imFPQDQq8K4GwCDkt6NCvNjDHuHhDPgqU/P9vScvWLRqdFai1gS
         iwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518826; x=1789123626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2J6o/zZhgP9G23RfgDZuucDuAsCMoCgCycGb2JjyoYo=;
        b=tXJkO+MkcUylvnjrZVkakIQAhrVS0Kb05Cy/WC1hbQqFI+ZUE0MXVaspTK0N957wF0
         Gh+dKo0TOZrMjjUVR0ic1KLRxAqVaCr7qry5o5bJZrj2G1oLhzyZFgFOfZQh0EU6NUqg
         FnwFpyfcsW8YzWDsNuhtAbwGzAjkneU8zXQk3dzScLsAcFXoHX+0If+8zKOB8RXyhHqe
         DdGb2gIV5EsmztpPNyS0qFmFnaSsFxhnt4W/Z8HH948ILfiXRpLCXYdUB6+PCXlQGJpa
         1xQbfOXXbQEfntIBUJvoSe0jK4KcuG+aaVIB4fWlAfxovbAk6C3KX/7q8nOyo6Lmlo3/
         BQGA==
X-Gm-Message-State: AFuF++kig0xY4K1rGtnLquO0hBpYjM+R+GzBio0AexqO/K9JrYGGGmx2
	E3N16cWGzNh1/xI8ig8lZzBLVFZkYXu2krOBbjYh/9X3vhUh01ZFGT8a
X-Gm-Gg: AYBFou22SixUybe+HTjqsv07ITC4BUpi+83KWcTmK87nFOsYF3/CVOGQbul5BdQjHvy
	9IN0mvq/+38A1eFSCxA8Wn4Bi1RWDITgrvnIuPbBoyJYvlne35svB7JNvn+1pMRjlDm99XJsfb1
	GdZtRzzUufVoqa5f1RzH6Z2DBbE1Ss0chPQwjgKvdLmFUS6Iu+feZxVajsvV8adaOVgAnaV0LJR
	387Py10dqJncpTL6wbpMn8ewcaqGOgRxjMzZJtMdtmnRd9qr9kU9hEvbUdr5DKySILLWb4ftzDO
	YoEEX9TG9RYruwwsTLZaoT45hqtQJJxaPYotgf9D9lMV2Ngc/6tVLyP9caGJbpKeue/QfAuBFYV
	Tk4f+LOAyFjgTrkBPZKS3ngHIkm3NzE6uXLFCsS+/MoAV0dXK1giaCWLhWP0WAV3wrD1D7pgxWG
	CcrihD+FPiFDpUJn+Kz2Hk13Xj45iwy4GcZXDywosX4Nk7eiLhGkUU5lcy6wJ03ixFummuEYoWL
	/pZTlbO+S9wGoA=
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr8590530a91.16.1788518825426;
        Fri, 04 Sep 2026 03:47:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8536223eec.15.2026.09.04.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:47:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Anders Larsen <al@alarsen.net>,
	Jan Kara <jack@suse.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Fei Li <fei1.li@intel.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Jason Xing <kerneljasonxing@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] treewide: fix typos in comments
Date: Fri,  4 Sep 2026 16:16:25 +0530
Message-ID: <20260904104639.21537-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104639.21537-1-hemanth.selam@gmail.com>
References: <20260904104639.21537-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/cdrom/cdrom.c                        | 4 ++--
 drivers/cdrom/gdrom.c                        | 2 +-
 drivers/comedi/drivers/comedi_parport.c      | 8 ++++----
 drivers/comedi/drivers/pcl812.c              | 4 ++--
 drivers/firmware/memmap.c                    | 2 +-
 drivers/parport/parport_pc.c                 | 2 +-
 drivers/w1/masters/ds2482.c                  | 2 +-
 drivers/w1/w1.c                              | 2 +-
 fs/qnx4/namei.c                              | 2 +-
 fs/qnx6/inode.c                              | 2 +-
 fs/qnx6/qnx6.h                               | 2 +-
 fs/udf/inode.c                               | 4 ++--
 fs/udf/super.c                               | 2 +-
 include/clocksource/timer-ti-dm.h            | 2 +-
 include/linux/amba/pl022.h                   | 4 ++--
 include/linux/amba/pl08x.h                   | 2 +-
 include/linux/average.h                      | 2 +-
 include/linux/backing-dev-defs.h             | 2 +-
 include/linux/iov_iter.h                     | 4 ++--
 include/linux/journal-head.h                 | 2 +-
 include/linux/most.h                         | 2 +-
 include/linux/msi.h                          | 4 ++--
 include/linux/platform_data/pxa_sdhci.h      | 6 +++---
 include/linux/prime_numbers.h                | 4 ++--
 include/linux/rmi.h                          | 2 +-
 include/linux/rseq.h                         | 2 +-
 include/linux/rseq_entry.h                   | 2 +-
 include/linux/sxgbe_platform.h               | 2 +-
 include/linux/ti_wilink_st.h                 | 2 +-
 include/uapi/linux/acrn.h                    | 2 +-
 include/uapi/linux/chio.h                    | 2 +-
 include/uapi/linux/genwqe/genwqe_card.h      | 2 +-
 include/uapi/linux/magic.h                   | 2 +-
 include/uapi/linux/pmu.h                     | 2 +-
 include/uapi/linux/serial_reg.h              | 4 ++--
 include/uapi/linux/um_timetravel.h           | 4 ++--
 kernel/acct.c                                | 2 +-
 kernel/async.c                               | 2 +-
 kernel/compat.c                              | 2 +-
 kernel/context_tracking.c                    | 2 +-
 kernel/exit.c                                | 2 +-
 kernel/latencytop.c                          | 2 +-
 kernel/panic.c                               | 2 +-
 kernel/pid.c                                 | 2 +-
 kernel/ptrace.c                              | 2 +-
 kernel/relay.c                               | 2 +-
 kernel/signal.c                              | 6 +++---
 kernel/user_namespace.c                      | 2 +-
 samples/trace_events/trace_custom_sched.h    | 2 +-
 scripts/check_extable.sh                     | 6 +++---
 tools/arch/x86/include/asm/cmpxchg.h         | 2 +-
 tools/arch/x86/include/uapi/asm/kvm.h        | 2 +-
 tools/include/linux/filter.h                 | 2 +-
 tools/include/uapi/asm-generic/mman-common.h | 2 +-
 tools/include/uapi/linux/elf.h               | 2 +-
 tools/include/uapi/linux/fs.h                | 2 +-
 tools/include/uapi/linux/seccomp.h           | 2 +-
 57 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 4f1fd389260f..81cf66776d63 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -1810,7 +1810,7 @@ static int dvd_read_physical(struct cdrom_device_info *cdi, dvd_struct *s,
 
 	/*
 	 * place the data... really ugly, but at least we won't have to
-	 * worry about endianess in userspace.
+	 * worry about endianness in userspace.
 	 */
 	memset(layer, 0, sizeof(*layer));
 	layer->book_version = base[0] & 0xf;
@@ -3141,7 +3141,7 @@ static noinline int mmc_ioctl_cdrom_volume(struct cdrom_device_info *cdi,
 		
 	/* originally the code depended on buffer[1] to determine
 	   how much data is available for transfer. buffer[1] is
-	   unfortunately ambigious and the only reliable way seem
+	   unfortunately ambiguous and the only reliable way seem
 	   to be to simply skip over the block descriptor... */
 	offset = 8 + be16_to_cpu(*(__be16 *)(buffer + 6));
 
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 4ba4dd06cbf4..a30933a9e69c 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -443,7 +443,7 @@ static int gdrom_getsense(short *bufstring)
 		pr_info("%s\n", sense_texts[sense_key].text);
 	else
 		pr_err("Unknown sense key: %d\n", sense_key);
-	if (bufstring) /* return addional sense data */
+	if (bufstring) /* return additional sense data */
 		memcpy(bufstring, &sense[4], 2);
 	if (sense_key < 2)
 		err = 0;
diff --git a/drivers/comedi/drivers/comedi_parport.c b/drivers/comedi/drivers/comedi_parport.c
index 57ee3f9dfba2..18a25b96cb02 100644
--- a/drivers/comedi/drivers/comedi_parport.c
+++ b/drivers/comedi/drivers/comedi_parport.c
@@ -254,7 +254,7 @@ static int parport_attach(struct comedi_device *dev,
 	if (ret)
 		return ret;
 
-	/* Digial I/O subdevice - Parallel port DATA register */
+	/* Digital I/O subdevice - Parallel port DATA register */
 	s = &dev->subdevices[0];
 	s->type		= COMEDI_SUBD_DIO;
 	s->subdev_flags	= SDF_READABLE | SDF_WRITABLE;
@@ -264,7 +264,7 @@ static int parport_attach(struct comedi_device *dev,
 	s->insn_bits	= parport_data_reg_insn_bits;
 	s->insn_config	= parport_data_reg_insn_config;
 
-	/* Digial Input subdevice - Parallel port STATUS register */
+	/* Digital Input subdevice - Parallel port STATUS register */
 	s = &dev->subdevices[1];
 	s->type		= COMEDI_SUBD_DI;
 	s->subdev_flags	= SDF_READABLE;
@@ -273,7 +273,7 @@ static int parport_attach(struct comedi_device *dev,
 	s->range_table	= &range_digital;
 	s->insn_bits	= parport_status_reg_insn_bits;
 
-	/* Digial Output subdevice - Parallel port CONTROL register */
+	/* Digital Output subdevice - Parallel port CONTROL register */
 	s = &dev->subdevices[2];
 	s->type		= COMEDI_SUBD_DO;
 	s->subdev_flags	= SDF_WRITABLE;
@@ -283,7 +283,7 @@ static int parport_attach(struct comedi_device *dev,
 	s->insn_bits	= parport_ctrl_reg_insn_bits;
 
 	if (dev->irq) {
-		/* Digial Input subdevice - Interrupt support */
+		/* Digital Input subdevice - Interrupt support */
 		s = &dev->subdevices[3];
 		dev->read_subdev = s;
 		s->type		= COMEDI_SUBD_DI;
diff --git a/drivers/comedi/drivers/pcl812.c b/drivers/comedi/drivers/pcl812.c
index 98b75792c09b..972d96d816ff 100644
--- a/drivers/comedi/drivers/pcl812.c
+++ b/drivers/comedi/drivers/pcl812.c
@@ -32,7 +32,7 @@
  *	A-823PGH (a823pgh), A-823PGL (a823pgl), A-826PG (a826pg)
  * Updated: Mon, 06 Aug 2007 12:03:15 +0100
  * Status: works (I hope. My board fire up under my hands
- *	       and I cann't test all features.)
+ *	       and I can't test all features.)
  *
  * This driver supports insn and cmd interfaces. Some boards support only insn
  * because their hardware don't allow more (PCL-813/B, ACL-8113, ISO-813).
@@ -732,7 +732,7 @@ static int pcl812_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 		devpriv->ai_dma = 1;
 		for (i = 1; i < cmd->chanlist_len; i++)
 			if (cmd->chanlist[0] != cmd->chanlist[i]) {
-				/*  we cann't use DMA :-( */
+				/*  we can't use DMA :-( */
 				devpriv->ai_dma = 0;
 				break;
 			}
diff --git a/drivers/firmware/memmap.c b/drivers/firmware/memmap.c
index 5862fbae9b78..f7acbab3b292 100644
--- a/drivers/firmware/memmap.c
+++ b/drivers/firmware/memmap.c
@@ -275,7 +275,7 @@ firmware_map_find_entry_bootmem(u64 start, u64 end, const char *type)
  *
  * Adds a firmware mapping entry. This function is for memory hotplug, it is
  * similar to function firmware_map_add_early(). The only difference is that
- * it will create the syfs entry dynamically.
+ * it will create the sysfs entry dynamically.
  *
  * Return: 0 on success, or -ENOMEM if no memory could be allocated.
  */
diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
index bccfe75fe6e5..8a79a3172199 100644
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -1722,7 +1722,7 @@ static int intel_bug_present_check_epp(struct parport *pb)
 				break;
 			}
 		}
-		/* return ECR into the inital state */
+		/* return ECR into the initial state */
 		ECR_WRITE(pb, ecr);
 	}
 
diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index cbd11bc61274..70854336a173 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -425,7 +425,7 @@ static u8 ds2482_w1_set_pullup(void *data, int delay)
 
 	/* if delay is non-zero activate the pullup,
 	 * the strong pullup will be automatically deactivated
-	 * by the master, so do not explicitly deactive it
+	 * by the master, so do not explicitly deactivate it
 	 */
 	if (delay) {
 		/* both waits are crucial, otherwise devices might not be
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index c16946642789..c40dc5153b8e 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -1182,7 +1182,7 @@ int w1_process(void *data)
 
 		__set_current_state(TASK_INTERRUPTIBLE);
 
-		/* hold list_mutex until after interruptible to prevent loosing
+		/* hold list_mutex until after interruptible to prevent losing
 		 * the wakeup signal when async_cmd is added.
 		 */
 		mutex_unlock(&dev->list_mutex);
diff --git a/fs/qnx4/namei.c b/fs/qnx4/namei.c
index bb8db6550ca5..382e35dc75d4 100644
--- a/fs/qnx4/namei.c
+++ b/fs/qnx4/namei.c
@@ -21,7 +21,7 @@
  * check if the filename is correct. For some obscure reason, qnx writes a
  * new file twice in the directory entry, first with all possible options at 0
  * and for a second time the way it is, they want us not to access the qnx
- * filesystem when whe are using linux.
+ * filesystem when we are using linux.
  */
 static int qnx4_match(int len, const char *name,
 		      struct buffer_head *bh, unsigned long *offset)
diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 6de49333acad..5983fe13e52a 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -107,7 +107,7 @@ static void qnx6_readahead(struct readahead_control *rac)
 
 /*
  * returns the block number for the no-th element in the tree
- * inodebits requred as there are multiple inodes in one inode block
+ * inodebits required as there are multiple inodes in one inode block
  */
 static unsigned qnx6_block_map(struct inode *inode, unsigned no)
 {
diff --git a/fs/qnx6/qnx6.h b/fs/qnx6/qnx6.h
index 56ed1367499e..b7c0f3788922 100644
--- a/fs/qnx6/qnx6.h
+++ b/fs/qnx6/qnx6.h
@@ -32,7 +32,7 @@ struct qnx6_sb_info {
 	int			s_blks_off;	/* blkoffset fs-startpoint */
 	int			s_ptrbits;	/* indirect pointer bitfield */
 	unsigned long		s_mount_opt;	/* all mount options */
-	int			s_bytesex;	/* holds endianess info */
+	int			s_bytesex;	/* holds endianness info */
 	struct inode *		inodes;
 	struct inode *		longfile;
 };
diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index e45e546a739a..4ca998b5ccc6 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -915,7 +915,7 @@ static int inode_getblk(struct inode *inode, struct udf_map_rq *map)
 			iinfo->i_lenExtents += inode->i_sb->s_blocksize;
 	}
 
-	/* if the extent the requsted block is located in contains multiple
+	/* if the extent the requested block is located in contains multiple
 	 * blocks, split the extent into at most three extents. blocks prior
 	 * to requested block, requested block, and blocks after requested
 	 * block */
@@ -2210,7 +2210,7 @@ void udf_write_aext(struct inode *inode, struct extent_position *epos,
 }
 
 /*
- * Only 1 indirect extent in a row really makes sense but allow upto 16 in case
+ * Only 1 indirect extent in a row really makes sense but allow up to 16 in case
  * someone does some weird stuff.
  */
 #define UDF_MAX_INDIR_EXTS 16
diff --git a/fs/udf/super.c b/fs/udf/super.c
index 2ba5973ef4dd..f058502c4514 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1341,7 +1341,7 @@ static int udf_load_partdesc(struct super_block *sb, sector_t block)
 	 * PHYSICAL partitions are already set up
 	 */
 	type1_idx = i;
-	map = NULL; /* supress 'maybe used uninitialized' warning */
+	map = NULL; /* suppress 'maybe used uninitialized' warning */
 	for (i = 0; i < sbi->s_partitions; i++) {
 		map = &sbi->s_partmaps[i];
 
diff --git a/include/clocksource/timer-ti-dm.h b/include/clocksource/timer-ti-dm.h
index dcc1712f75e7..495b339944b8 100644
--- a/include/clocksource/timer-ti-dm.h
+++ b/include/clocksource/timer-ti-dm.h
@@ -9,7 +9,7 @@
  *
  * Copyright (C) 2005 Nokia Corporation
  * Author: Lauri Leukkunen <lauri.leukkunen@nokia.com>
- * PWM and clock framwork support by Timo Teras.
+ * PWM and clock framework support by Timo Teras.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License as published by the
diff --git a/include/linux/amba/pl022.h b/include/linux/amba/pl022.h
index d7b07d0311e1..cf1f714e97aa 100644
--- a/include/linux/amba/pl022.h
+++ b/include/linux/amba/pl022.h
@@ -62,7 +62,7 @@ struct ssp_clock_params {
 };
 
 /**
- * enum ssp_rx_endian - endianess of Rx FIFO Data
+ * enum ssp_rx_endian - endianness of Rx FIFO Data
  * this feature is only available in ST versionf of PL022
  */
 enum ssp_rx_endian {
@@ -71,7 +71,7 @@ enum ssp_rx_endian {
 };
 
 /**
- * enum ssp_tx_endian - endianess of Tx FIFO Data
+ * enum ssp_tx_endian - endianness of Tx FIFO Data
  */
 enum ssp_tx_endian {
 	SSP_TX_MSB,
diff --git a/include/linux/amba/pl08x.h b/include/linux/amba/pl08x.h
index 3100e0debcdd..d7883a68bc69 100644
--- a/include/linux/amba/pl08x.h
+++ b/include/linux/amba/pl08x.h
@@ -42,7 +42,7 @@ enum {
  * @max_signal: the maximum DMA signal number to be muxed in for
  * the channel. Set to the same as min_signal for
  * devices with static assignments
- * @muxval: a number usually used to poke into some mux regiser to
+ * @muxval: a number usually used to poke into some mux register to
  * mux in the signal to this channel
  * @addr: source/target address in physical memory for this DMA channel,
  * can be the address of a FIFO register for burst requests for example.
diff --git a/include/linux/average.h b/include/linux/average.h
index a1a8f09631ce..0cb77b3e483c 100644
--- a/include/linux/average.h
+++ b/include/linux/average.h
@@ -11,7 +11,7 @@
  *
  * This implements a fixed-precision EWMA algorithm, with both the
  * precision and fall-off coefficient determined at compile-time
- * and built into the generated helper funtions.
+ * and built into the generated helper functions.
  *
  * The first argument to the macro is the name that will be used
  * for the struct and helper functions.
diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
index 4f1084937315..09639da3a21e 100644
--- a/include/linux/backing-dev-defs.h
+++ b/include/linux/backing-dev-defs.h
@@ -93,7 +93,7 @@ struct wb_completion {
  * using memcg's page ownership for attributing writeback IOs, and every
  * memcg - blkcg combination can be served by its own wb by assigning a
  * dedicated wb to each memcg, which enables isolation across different
- * cgroups and propagation of IO back pressure down from the IO layer upto
+ * cgroups and propagation of IO back pressure down from the IO layer up to
  * the tasks which are generating the dirty pages to be written back.
  *
  * A cgroup wb is indexed on its bdi by the ID of the associated memcg,
diff --git a/include/linux/iov_iter.h b/include/linux/iov_iter.h
index f9a17fbbd398..2661bfeea6db 100644
--- a/include/linux/iov_iter.h
+++ b/include/linux/iov_iter.h
@@ -284,7 +284,7 @@ size_t iterate_discard(struct iov_iter *iter, size_t len, void *priv, void *priv
  * @priv2 and the amount of data so far iterated over (which can, for example,
  * be added to @priv to point to the right part of a second buffer).  The step
  * functions should return the amount of the segment they didn't process (ie. 0
- * indicates complete processsing).
+ * indicates complete processing).
  *
  * This function returns the amount of data processed (ie. 0 means nothing was
  * processed and the value of @len means processes to completion).
@@ -353,7 +353,7 @@ size_t iterate_and_advance(struct iov_iter *iter, size_t len, void *priv,
  * @priv2 and the amount of data so far iterated over (which can, for example,
  * be added to @priv to point to the right part of a second buffer).  The step
  * functions should return the amount of the segment they didn't process (ie. 0
- * indicates complete processsing).
+ * indicates complete processing).
  *
  * This function returns the amount of data processed (ie. 0 means nothing was
  * processed and the value of @len means processes to completion).
diff --git a/include/linux/journal-head.h b/include/linux/journal-head.h
index 75bc56109031..15c9ca668a99 100644
--- a/include/linux/journal-head.h
+++ b/include/linux/journal-head.h
@@ -40,7 +40,7 @@ struct journal_head {
 	 * Journalling list for this buffer [b_state_lock]
 	 * NOTE: We *cannot* combine this with b_modified into a bitfield
 	 * as gcc would then (which the C standard allows but which is
-	 * very unuseful) make 64-bit accesses to the bitfield and clobber
+	 * very useless) make 64-bit accesses to the bitfield and clobber
 	 * b_jcount if its update races with bitfield modification.
 	 */
 	unsigned b_jlist;
diff --git a/include/linux/most.h b/include/linux/most.h
index 4aeed08f816e..6439a8fefb98 100644
--- a/include/linux/most.h
+++ b/include/linux/most.h
@@ -300,7 +300,7 @@ void most_deregister_interface(struct most_interface *iface);
 void most_submit_mbo(struct mbo *mbo);
 
 /**
- * most_stop_enqueue - prevents core from enqueing MBOs
+ * most_stop_enqueue - prevents core from enqueuing MBOs
  * @iface: pointer to interface
  * @channel_idx: channel index
  */
diff --git a/include/linux/msi.h b/include/linux/msi.h
index a4613de11960..a7052bc4286d 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -132,7 +132,7 @@ struct pci_msi_desc {
  * @iobase:	Domain specific IOmem pointer
  *
  * The content of this data is implementation defined and used by the MSI
- * domain to store domain specific information which is requried for
+ * domain to store domain specific information which is required for
  * interrupt chip callbacks.
  */
 union msi_domain_cookie {
@@ -373,7 +373,7 @@ static inline void msi_free_msi_descs(struct device *dev)
 
 /*
  * The arch hooks to setup up msi irqs. Default functions are implemented
- * as weak symbols so that they /can/ be overriden by architecture specific
+ * as weak symbols so that they /can/ be overridden by architecture specific
  * code if needed. These hooks can only be enabled by the architecture.
  *
  * If CONFIG_PCI_MSI_ARCH_FALLBACKS is not selected they are replaced by
diff --git a/include/linux/platform_data/pxa_sdhci.h b/include/linux/platform_data/pxa_sdhci.h
index 899457cee425..313391fbb1a5 100644
--- a/include/linux/platform_data/pxa_sdhci.h
+++ b/include/linux/platform_data/pxa_sdhci.h
@@ -32,9 +32,9 @@
  * @clk_delay_enable: enable clk_delay or not, used on pxa910
  * @max_speed: the maximum speed supported
  * @host_caps: Standard MMC host capabilities bit field.
- * @quirks: quirks of platfrom
- * @quirks2: quirks2 of platfrom
- * @pm_caps: pm_caps of platfrom
+ * @quirks: quirks of platform
+ * @quirks2: quirks2 of platform
+ * @pm_caps: pm_caps of platform
  */
 struct sdhci_pxa_platdata {
 	unsigned int	flags;
diff --git a/include/linux/prime_numbers.h b/include/linux/prime_numbers.h
index 2b8e99c948d3..8f9b29ca1ab7 100644
--- a/include/linux/prime_numbers.h
+++ b/include/linux/prime_numbers.h
@@ -8,7 +8,7 @@ bool is_prime_number(unsigned long x);
 unsigned long next_prime_number(unsigned long x);
 
 /**
- * for_each_prime_number - iterate over each prime upto a value
+ * for_each_prime_number - iterate over each prime up to a value
  * @prime: the current prime number in this iteration
  * @max: the upper limit
  *
@@ -22,7 +22,7 @@ unsigned long next_prime_number(unsigned long x);
 	for_each_prime_number_from((prime), 2, (max))
 
 /**
- * for_each_prime_number_from - iterate over each prime upto a value
+ * for_each_prime_number_from - iterate over each prime up to a value
  * @prime: the current prime number in this iteration
  * @from: the initial value
  * @max: the upper limit
diff --git a/include/linux/rmi.h b/include/linux/rmi.h
index ab7eea01ab42..882baa72981d 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -75,7 +75,7 @@ enum rmi_sensor_type {
  * (touchscreen).  This is useful when F11_2D_QUERY14 register is not
  * available.
  * @disable_report_mask - Force data to not be reported even if it is supported
- * by the firware.
+ * by the firmware.
  * @topbuttonpad - Used with the "5 buttons touchpads" found on the Lenovo 40
  * series
  * @kernel_tracking - most moderns RMI f11 firmwares implement Multifinger
diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index 7ef79b25e714..2fc607ef6550 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -57,7 +57,7 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
 	/*
 	 * Only apply the user_irq optimization for RSEQ ABI V2 registrations.
 	 * Legacy users like TCMalloc rely on the original ABI V1 behaviour
-	 * which updates IDs on every context swtich.
+	 * which updates IDs on every context switch.
 	 */
 	if (rseq_v2(t)) {
 		/*
diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 31ce349ed42c..3a98e2b4eb1f 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -165,7 +165,7 @@ static __always_inline bool __rseq_grant_slice_extension(bool work_pending)
 		if (likely(!(usr_ctrl.request)))
 			return false;
 
-		/* Grant the slice extention */
+		/* Grant the slice extension */
 		usr_ctrl.request = 0;
 		usr_ctrl.granted = 1;
 		unsafe_put_user(usr_ctrl.all, &rseq->slice_ctrl.all, efault);
diff --git a/include/linux/sxgbe_platform.h b/include/linux/sxgbe_platform.h
index 966146f7267a..55c332e02738 100644
--- a/include/linux/sxgbe_platform.h
+++ b/include/linux/sxgbe_platform.h
@@ -20,7 +20,7 @@
 #define SXGBE_CSR_350_400M	0x4	/* MDC = clk_scr_i/162 */
 #define SXGBE_CSR_400_500M	0x5	/* MDC = clk_scr_i/202 */
 
-/* Platfrom data for platform device structure's
+/* Platform data for platform device structure's
  * platform_data field
  */
 struct sxgbe_mdio_bus_data {
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index 10642d4844f0..0f7a3e7a8b87 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -108,7 +108,7 @@ extern long st_unregister(struct st_proto_s *);
  * @list: the list of protocols registered, only MAX can exist, one protocol
  *	can register only once.
  * @rx_state: states to be maintained inside st's tty receive
- * @rx_count: count to be maintained inside st's tty receieve
+ * @rx_count: count to be maintained inside st's tty receive
  * @rx_skb: the skb where all data for a protocol gets accumulated,
  *	since tty might not call receive when a complete event packet
  *	is received, the states, count and the skb needs to be maintained.
diff --git a/include/uapi/linux/acrn.h b/include/uapi/linux/acrn.h
index 79e7855a8c42..9eaa58c48cf3 100644
--- a/include/uapi/linux/acrn.h
+++ b/include/uapi/linux/acrn.h
@@ -264,7 +264,7 @@ struct acrn_descriptor_ptr {
  * @cr4:		Value of register CR4
  * @cr3:		Value of register CR3
  * @ia32_efer:		Value of IA32_EFER MSR
- * @rflags:		Value of regsiter RFLAGS
+ * @rflags:		Value of register RFLAGS
  * @reserved_64:	Reserved and must be 0
  * @cs_ar:		Attribute field of code segment selector
  * @cs_limit:		Limit field of code segment selector
diff --git a/include/uapi/linux/chio.h b/include/uapi/linux/chio.h
index e1cad4c319ee..5201d7349e7f 100644
--- a/include/uapi/linux/chio.h
+++ b/include/uapi/linux/chio.h
@@ -24,7 +24,7 @@
  * CHIOVGPARAMS
  *    query vendor-specific element types
  *
- *    accessing elements works by specifing type and unit of the element.
+ *    accessing elements works by specifying type and unit of the element.
  *    for example, storage elements are addressed with type = CHET_ST and
  *    unit = 0 .. cp_nslots-1
  *
diff --git a/include/uapi/linux/genwqe/genwqe_card.h b/include/uapi/linux/genwqe/genwqe_card.h
index bc779a5d258d..ae2caeb68b14 100644
--- a/include/uapi/linux/genwqe/genwqe_card.h
+++ b/include/uapi/linux/genwqe/genwqe_card.h
@@ -487,7 +487,7 @@ struct genwqe_mem {
  *         -EINVAL: Invalid parameters (ASIV_LEN, ASV_LEN, illegal fixups
  *                  no mappings found/could not create mappings
  *         -EFAULT: illegal addresses in fixups, purging failed
- *         -EBADMSG: enqueing failed, retc != DDCB_RETC_COMPLETE
+ *         -EBADMSG: enqueuing failed, retc != DDCB_RETC_COMPLETE
  */
 #define GENWQE_EXECUTE_DDCB					\
 	_IOWR(GENWQE_IOC_CODE, 50, struct genwqe_ddcb_cmd)
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index fd5f0e95648e..9de3eff9e51a 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -9,7 +9,7 @@
 #define CEPH_SUPER_MAGIC	0x00c36400
 #define CODA_SUPER_MAGIC	0x73757245
 #define CRAMFS_MAGIC		0x28cd3d45	/* some random number */
-#define CRAMFS_MAGIC_WEND	0x453dcd28	/* magic number with the wrong endianess */
+#define CRAMFS_MAGIC_WEND	0x453dcd28	/* magic number with the wrong endianness */
 #define DEBUGFS_MAGIC          0x64626720
 #define SECURITYFS_MAGIC	0x73636673
 #define SELINUX_MAGIC		0xf97cff8c
diff --git a/include/uapi/linux/pmu.h b/include/uapi/linux/pmu.h
index f2fc1bd80017..a21e95bdaa5f 100644
--- a/include/uapi/linux/pmu.h
+++ b/include/uapi/linux/pmu.h
@@ -70,7 +70,7 @@
 #define PMU_INT_WAITING_CHARGER	0x01	/* ??? */
 #define PMU_INT_AUTO_SRQ_POLL	0x02	/* ??? */
 
-/* Bits in the environement message (either obtained via PMU_GET_COVER,
+/* Bits in the environment message (either obtained via PMU_GET_COVER,
  * or via PMU_INT_ENVIRONMENT on core99 */
 #define PMU_ENV_LID_CLOSED	0x01	/* The lid is closed */
 
diff --git a/include/uapi/linux/serial_reg.h b/include/uapi/linux/serial_reg.h
index 9c987b04e2d0..a0f3f8f01afc 100644
--- a/include/uapi/linux/serial_reg.h
+++ b/include/uapi/linux/serial_reg.h
@@ -122,8 +122,8 @@
  * Access to some registers depends on register access / configuration
  * mode.
  */
-#define UART_LCR_CONF_MODE_A	UART_LCR_DLAB	/* Configutation mode A */
-#define UART_LCR_CONF_MODE_B	0xBF		/* Configutation mode B */
+#define UART_LCR_CONF_MODE_A	UART_LCR_DLAB	/* Configuration mode A */
+#define UART_LCR_CONF_MODE_B	0xBF		/* Configuration mode B */
 
 #define UART_MCR	4	/* Out: Modem Control Register */
 #define UART_MCR_CLKSEL		0x80 /* Divide clock by 4 (TI16C752, EFR[4]=1) */
diff --git a/include/uapi/linux/um_timetravel.h b/include/uapi/linux/um_timetravel.h
index fa7c75334f2e..512ae9b32ef1 100644
--- a/include/uapi/linux/um_timetravel.h
+++ b/include/uapi/linux/um_timetravel.h
@@ -151,8 +151,8 @@ enum um_timetravel_ops {
 	/**
 	 * @UM_TIMETRAVEL_BROADCAST: Send/Receive a broadcast message.
 	 *	This message can be used to sync all components in the system
-	 *	with a single message, if the calender gets the message, the
-	 *	calender broadcast the message to all components, and if a
+	 *	with a single message, if the calendar gets the message, the
+	 *	calendar broadcast the message to all components, and if a
 	 *	component receives it it should act based on it e.g print a
 	 *	message to it's log system.
 	 *	(calendar <-> host)
diff --git a/kernel/acct.c b/kernel/acct.c
index c440d43479ca..b92cee1e3817 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -26,7 +26,7 @@
  *  XTerms and EMACS are manifestations of pure evil. 21/10/98, AV.
  *
  *  Fixed a nasty interaction with sys_umount(). If the accounting
- *  was suspeneded we failed to stop it on umount(). Messy.
+ *  was suspended we failed to stop it on umount(). Messy.
  *  Another one: remount to readonly didn't stop accounting.
  *	Question: what should we do if we have CAP_SYS_ADMIN but not
  *  CAP_SYS_PACCT? Current code does the following: umount returns -EBUSY
diff --git a/kernel/async.c b/kernel/async.c
index 0e3a783dc991..79c07e8ceb3a 100644
--- a/kernel/async.c
+++ b/kernel/async.c
@@ -351,7 +351,7 @@ void __init async_init(void)
 {
 	/*
 	 * Async can schedule a number of interdependent work items. However,
-	 * unbound workqueues can handle only upto min_active interdependent
+	 * unbound workqueues can handle only up to min_active interdependent
 	 * work items. The default min_active of 8 isn't sufficient for async
 	 * and can lead to stalls. Let's use a dedicated workqueue with raised
 	 * min_active.
diff --git a/kernel/compat.c b/kernel/compat.c
index fb50f29d9b36..a439174e8c43 100644
--- a/kernel/compat.c
+++ b/kernel/compat.c
@@ -2,7 +2,7 @@
 /*
  *  linux/kernel/compat.c
  *
- *  Kernel compatibililty routines for e.g. 32 bit syscall support
+ *  Kernel compatibility routines for e.g. 32 bit syscall support
  *  on 64 bit kernels.
  *
  *  Copyright (C) 2002-2003 Stephen Rothwell, IBM Corporation
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c0..1b71fe9b3b7a 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -538,7 +538,7 @@ void ct_user_enter(enum ctx_state state)
 	unsigned long flags;
 
 	/*
-	 * Some contexts may involve an exception occuring in an irq,
+	 * Some contexts may involve an exception occurring in an irq,
 	 * leading to that nesting:
 	 * ct_irq_enter() rcu_eqs_exit(true) rcu_eqs_enter(true) ct_irq_exit()
 	 * This would mess up the dyntick_nesting count though. And rcu_irq_*()
diff --git a/kernel/exit.c b/kernel/exit.c
index 97686af89501..29023905b0cf 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -212,7 +212,7 @@ static void __exit_signal(struct release_task_post *post, struct task_struct *ts
 	write_sequnlock(&sig->stats_lock);
 
 	/*
-	 * Ensure that all preceeding state is visible. Pairs with
+	 * Ensure that all preceding state is visible. Pairs with
 	 * the smp_acquire__after_ctrl_dep() in the sighand == NULL
 	 * path of lock_task_sighand().
 	 */
diff --git a/kernel/latencytop.c b/kernel/latencytop.c
index d4281d1e13a6..16abcff2d42c 100644
--- a/kernel/latencytop.c
+++ b/kernel/latencytop.c
@@ -152,7 +152,7 @@ account_global_scheduler_latency(struct task_struct *tsk,
 	if (i >= MAXLR)
 		return;
 
-	/* Allocted a new one: */
+	/* Allocated a new one: */
 	memcpy(&latency_record[i], lat, sizeof(struct latency_record));
 }
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..3492575a70d8 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -704,7 +704,7 @@ void vpanic(const char *fmt, va_list args)
 	 * buffer.  Try to acquire the lock then release it regardless of the
 	 * result.  The release will also print the buffers out.  Locks debug
 	 * should be disabled to avoid reporting bad unlock balance when
-	 * panic() is not being callled from OOPS.
+	 * panic() is not being called from OOPS.
 	 */
 	debug_locks_off();
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
diff --git a/kernel/pid.c b/kernel/pid.c
index 95b8ccfa8269..a9d38a6ebaba 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -241,7 +241,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 				       tid + 1, GFP_ATOMIC);
 			/*
 			 * If ENOSPC is returned it means that the PID is
-			 * alreay in use. Return EEXIST in that case.
+			 * already in use. Return EEXIST in that case.
 			 */
 			if (nr == -ENOSPC)
 
diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d041645d9d17..43ed10169d08 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -533,7 +533,7 @@ static int ptrace_traceme(void)
 }
 
 /*
- * Called with irqs disabled, returns true if childs should reap themselves.
+ * Called with irqs disabled, returns true if children should reap themselves.
  */
 static int ignoring_children(struct sighand_struct *sigh)
 {
diff --git a/kernel/relay.c b/kernel/relay.c
index 62b059ff2759..90a898111dcb 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -765,7 +765,7 @@ static int relay_file_mmap_prepare(struct vm_area_desc *desc)
  *	@filp: the file
  *	@wait: poll table
  *
- *	Poll implemention.
+ *	Poll implementation.
  */
 static __poll_t relay_file_poll(struct file *filp, poll_table *wait)
 {
diff --git a/kernel/signal.c b/kernel/signal.c
index a5e15bf09d31..71f852fdad41 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1359,7 +1359,7 @@ struct sighand_struct *lock_task_sighand(struct task_struct *tsk,
 			/*
 			 * Pairs with the smp_store_release() in
 			 * __exit_signal().  It ensures that all state
-			 * modifications to the task preceeding the store are
+			 * modifications to the task preceding the store are
 			 * visible to the callers of lock_task_sighand().
 			 */
 			smp_acquire__after_ctrl_dep();
@@ -2409,7 +2409,7 @@ static int ptrace_stop(int exit_code, int why, unsigned long message,
 
 	/*
 	 * If @why is CLD_STOPPED, we're trapping to participate in a group
-	 * stop.  Do the bookkeeping.  Note that if SIGCONT was delievered
+	 * stop.  Do the bookkeeping.  Note that if SIGCONT was delivered
 	 * across siglock relocks since INTERRUPT was scheduled, PENDING
 	 * could be clear now.  We act as if SIGCONT is received after
 	 * TASK_TRACED is entered - ignore it.
@@ -3557,7 +3557,7 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
  *
  * Note: This function does not work properly for the SIGCHLD on x32, but
  * fortunately it doesn't have to.  The only valid callers for this function are
- * copy_siginfo_to_user32, which is overriden for x32 and the coredump code.
+ * copy_siginfo_to_user32, which is overridden for x32 and the coredump code.
  * The latter does not care because SIGCHLD will never cause a coredump.
  */
 void copy_siginfo_to_external32(struct compat_siginfo *to,
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 0bed462e9b2a..b08e94956257 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -911,7 +911,7 @@ static bool verify_root_map(const struct file *file,
 
 	if (map_ns == file_ns) {
 		/* The process unshared its ns and is writing to its own
-		 * /proc/self/uid_map.  User already has full capabilites in
+		 * /proc/self/uid_map.  User already has full capabilities in
 		 * the new namespace.  Verify that the parent had CAP_SETFCAP
 		 * when it unshared.
 		 * */
diff --git a/samples/trace_events/trace_custom_sched.h b/samples/trace_events/trace_custom_sched.h
index 951388334a3f..b3fe79801d9f 100644
--- a/samples/trace_events/trace_custom_sched.h
+++ b/samples/trace_events/trace_custom_sched.h
@@ -89,7 +89,7 @@ TRACE_CUSTOM_EVENT(sched_waking,
 #define TRACE_INCLUDE_PATH .
 
 /*
- * It is requred that the TRACE_INCLUDE_FILE be the same
+ * It is required that the TRACE_INCLUDE_FILE be the same
  * as this file without the ".h".
  */
 #define TRACE_INCLUDE_FILE trace_custom_sched
diff --git a/scripts/check_extable.sh b/scripts/check_extable.sh
index 4b380564cf74..20556db67aef 100755
--- a/scripts/check_extable.sh
+++ b/scripts/check_extable.sh
@@ -41,7 +41,7 @@ function find_symbol_and_offset_from_reloc()
     # Extract symbol and offset from the objdump output
     eval $(echo $reloc | sed 's/\([^+]\+\)+\?\(0x[0-9a-f]\+\)\?/symbol="\1"; symbol_offset="\2"/')
 
-    # When the relocation points to the begining of a symbol or section, it
+    # When the relocation points to the beginning of a symbol or section, it
     # won't print the offset since it is zero.
     if [ -z "${symbol_offset}" ]; then
 	symbol_offset=0x0
@@ -77,7 +77,7 @@ function handle_suspicious_generic_reloc()
 {
     if is_executable_section ${section}; then
 	# We've got a relocation to a non white listed _executable_
-	# section, print a warning so the developper adds the section to
+	# section, print a warning so the developer adds the section to
 	# the white list or fix his code.  We try to pretty-print the file
 	# and line number where that relocation was added.
 	echo "Warning: found a reference to section \"${section}\" in __ex_table:"
@@ -114,7 +114,7 @@ function diagnose()
 	# When there's a global symbol at the place of the relocation,
 	# objdump will use it instead of giving us a section+offset, so
 	# let's find out which section is this symbol in and the total
-	# offset withing that section.
+	# offset within that section.
 	find_section_offset_from_symbol ${symbol} ${symbol_offset}
 
 	# In this case objdump was presenting us with a reloc to a symbol
diff --git a/tools/arch/x86/include/asm/cmpxchg.h b/tools/arch/x86/include/asm/cmpxchg.h
index 0ed9ca2766ad..9a0b36dc14a2 100644
--- a/tools/arch/x86/include/asm/cmpxchg.h
+++ b/tools/arch/x86/include/asm/cmpxchg.h
@@ -5,7 +5,7 @@
 #include <linux/compiler.h>
 
 /*
- * Non-existant functions to indicate usage errors at link time
+ * Non-existent functions to indicate usage errors at link time
  * (or compile-time if the compiler implements __compiletime_error().
  */
 extern void __cmpxchg_wrong_size(void)
diff --git a/tools/arch/x86/include/uapi/asm/kvm.h b/tools/arch/x86/include/uapi/asm/kvm.h
index 1585ec804066..79bfd945e5c4 100644
--- a/tools/arch/x86/include/uapi/asm/kvm.h
+++ b/tools/arch/x86/include/uapi/asm/kvm.h
@@ -551,7 +551,7 @@ struct kvm_nested_state {
 	} hdr;
 
 	/*
-	 * Define data region as 0 bytes to preserve backwards-compatability
+	 * Define data region as 0 bytes to preserve backwards-compatibility
 	 * to old definition of kvm_nested_state in order to avoid changing
 	 * KVM_{GET,PUT}_NESTED_STATE ioctl values.
 	 */
diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
index 4ead4e72097c..9a901af39c21 100644
--- a/tools/include/linux/filter.h
+++ b/tools/include/linux/filter.h
@@ -66,7 +66,7 @@
 		.off   = 0,					\
 		.imm   = IMM })
 
-/* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
+/* Endianness conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
 
 #define BPF_ENDIAN(TYPE, DST, LEN)				\
 	((struct bpf_insn) {					\
diff --git a/tools/include/uapi/asm-generic/mman-common.h b/tools/include/uapi/asm-generic/mman-common.h
index ef1c27fa3c57..cf1418649b3a 100644
--- a/tools/include/uapi/asm-generic/mman-common.h
+++ b/tools/include/uapi/asm-generic/mman-common.h
@@ -62,7 +62,7 @@
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
 #define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicitly exclude from the core dump,
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/elf.h
index 5834b83d7f9a..a529c2a4a99e 100644
--- a/tools/include/uapi/linux/elf.h
+++ b/tools/include/uapi/linux/elf.h
@@ -390,7 +390,7 @@ typedef struct elf64_shdr {
 #define NT_AUXV		6
 /*
  * Note to userspace developers: size of NT_SIGINFO note may increase
- * in the future to accomodate more fields, don't assume it is fixed!
+ * in the future to accommodate more fields, don't assume it is fixed!
  */
 #define NT_SIGINFO      0x53494749
 #define NT_FILE		0x46494c45
diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index f0a26309b6d5..2d7effeeea0a 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -77,7 +77,7 @@ struct fstrim_range {
  * We include a length field because some filesystems (vfat) have an identifier
  * that we do want to expose as a UUID, but doesn't have the standard length.
  *
- * We use a fixed size buffer beacuse this interface will, by fiat, never
+ * We use a fixed size buffer because this interface will, by fiat, never
  * support "UUIDs" longer than 16 bytes; we don't want to force all downstream
  * users to have to deal with that.
  */
diff --git a/tools/include/uapi/linux/seccomp.h b/tools/include/uapi/linux/seccomp.h
index dbfc9b37fcae..6d9158152360 100644
--- a/tools/include/uapi/linux/seccomp.h
+++ b/tools/include/uapi/linux/seccomp.h
@@ -104,7 +104,7 @@ struct seccomp_notif {
  * SECCOMP_IOCTL_NOTIF_SEND from earlier filters, essentially allowing all
  * such filtered syscalls to be executed by sending the response
  * SECCOMP_USER_NOTIF_FLAG_CONTINUE. Note that SECCOMP_RET_TRACE can equally
- * be overriden by SECCOMP_USER_NOTIF_FLAG_CONTINUE.
+ * be overridden by SECCOMP_USER_NOTIF_FLAG_CONTINUE.
  */
 #define SECCOMP_USER_NOTIF_FLAG_CONTINUE (1UL << 0)
 
-- 
2.48.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712639;
	b=fyrnr8K4NfqWlyUhhtis4TRIWMQHm65eHZOQBI5Mmnfu3M7CbayqM22AkIF8xgeCACjQ
	 WGlgHp1ul6Y0KIkDUv/KwuaEV8lJQgXbfCX7c4e0odLHoymwXdkuua19yyT5I+DhwsVae
	 X6B4SwfxBLv0FyD1c/l3jaO/6sw3rjiitMzMcYEswsAn94yGMtmZD8eeZpNj/dA/wlRV/
	 sH5h0StLSQVAdkC9B9+R+9mNpjutDjSE4AkWs+oPuPAJ1uRPO9q5y55cyu8uhz/EI0bmK
	 0+Uc/pf7AZHErEj571XtNzz4A6HYExRN9ufme/dDfqiicDBvBjrlubFyVNvtSh1v8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fnh9YUI73W9upwsx2dI+MC9ZPKD79q7rWiJ2BDXOpW4=;
	b=fnGhsIeJo9Xb4npQ9dtCUQuycSAlrWod9jpYYts3s4xCWgWZzXk+1KP7y1MkehqwrVqT
	 hCqejpVA2N163zGeSJoqN47AfF9GsWDdBrrcfn8TobvbWYOqkuIeU7E6jyESB5mmWOSzc
	 EJHua9Uni4IGIMDyj11X+p2kxdh4edxVO77jGL/Hu0wp4I8O1aeujY+5vUNKDpov25YyX
	 ABw+SYICRnywg1ng+X2KTpHBBts9zsbupIzWlSrTFdIyPQdoC5eiU9SUkLGRMYrZNc7J7
	 30bnaX1vtcdQ8cuJBClelkepmdbeuVIexMygC5G63f4yijloEbmcMZO2iFbOb5uPw0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF1606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DF1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso224175a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792712636; x=1793317436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fnh9YUI73W9upwsx2dI+MC9ZPKD79q7rWiJ2BDXOpW4=;
        b=cTfKnNjMEmAgpuZnqXhLUjkKjK3844IAJCQv2wWy/JwTOnrXtVZQbSowCKiGyEkIHA
         Qa8JfTFhW6YvaJq9DjbTQ8XbwvIphm2K5iSoC2+CEu595RM6bt7yIyPbKNqYapeGh6qy
         RUQ0up8/jeY0I/4dimnPNaohzdkhN2m8OtF3KkjvNypzw2YFDFNUXn2BT0yx3Y1Duw5n
         V6HT5xmmSP0cQ2edvHHEm9M+1f4bCnHxeCrORxB3BuTnPh0uD5kUC6PUvJJ2oyOGubzx
         aLoFhLeOVhgU90/LrlTc7KK76TX+JLYuw+72xKSQC4GeMg74qOZ2XNIx7LSoC4QMGcQi
         GuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712636; x=1793317436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fnh9YUI73W9upwsx2dI+MC9ZPKD79q7rWiJ2BDXOpW4=;
        b=m1jHXZgTbWv3A8Iz+yQwg7qQFqoo2pAzw3PR7YE9kbuNfba049fxeOAJIbmrtgqcTA
         pinUl8ay/Nso+PT+0kY8vGUG51TLF348FtQ9+SzM8o9GDg8nnLjsaabQoxgvVFvkARwr
         nFAhjdkkzpz0DeHkmPrxF0irav8xNecRTptugiHLwxhE6arZ7eATSWqhexg0ioCpkm4q
         sCsEHK+b8dNShEk0gVuDXjpW98jUrLleFcrpMVu3mUcjCjxg/5JABedXfGS2AZQBbMj+
         a52V3jDiTubuUPyzpb93XCXL+2V14gsVlj2zSPBG+MyKivEPJp8SmvLlPGoUXAQMoCfj
         iTDA==
X-Forwarded-Encrypted: i=1; AKwUvBy4xGx1+OalNMqbjUmFZpgqNynV0xjm0yz0Ta3YoL8gWaDFFEU0IeiH+j1JOb5D52bKibS+NAPRgmDhBDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYItwpj86Jgz/MzzBCbyvTFhJlFXWdwmpszTey3uALRDA1BUz04h
	OPBztMUbKLxL0+UnnM5S0zwb8+QAa+Js6gaHVaEyZf1zZk6goJPdBUGkNJXd42zTd98=
X-Gm-Gg: AYBFou0KNaxB3CXuCLsN8TTRlanYcZ8Q8Nbivv5hjZCoOIJHuO+OJPEFXcgpn16HFMP
	ygPELzQT7gxarxcSsicCODBAJrsRLQxsHkGoJFZTY9EgsDHE32Vm2pnkZUsWvN4tkcd5N7jjEiJ
	V09atd017DJ6Uwz2R8A606VscZtR4yDgklpH7GSQyqttZlTpbQzFocVhPndeFfiBh4/gdShopLc
	B+MVj/UXzaKMTWpX2gO3HTAfN/SNxwBROCwaCkq/E9IWM84sXlfxvP1lWSXwdN2AOwlk5R8q5fw
	Ix6IfR8h8biSfrWew8pWtpWR/Z91Tj1sSfHNMYkzs0Byd6tRuBpCcs/ksWrmfDTWbcA+abWTAU6
	wLkrpssL+jmg5uZ4MjPyoKLWobdT9yEhwQOP655VgZ6zUxjoitXaHQ9jQCobZUJeNihXLIavjim
	Z+5pPbKWKwNCUvRirBrwtyKSdEbhAKBD+bAWnmuHD/lHw1acydiBmvFeqqlUMjGwG74Z743Yx89
	6x+v32hW4GJXxlLlm1pcQpU1aei5BFV9b/Z4wFb9SJP0HT0yh/FyegcPMO3OHFxdZ5Rd/DOaqcU
	9MHO
X-Received: by 2002:a05:6a20:7349:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-3e37668deebmr388484637.29.1792712635638;
        Thu, 22 Oct 2026 16:43:55 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:13e0:b266:5a7d:e119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8dd328dsm137866b3a.29.2026.10.22.16.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:43:54 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Ram Vegesna <ram.vegesna@broadcom.com>,
	Daniel Wagner <dwagner@suse.de>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: James Smart <jsmart2021@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Mike Christie <michael.christie@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3] scsi: elx: efct: fix target session lifetime against node teardown
Date: Fri, 23 Oct 2026 08:43:39 +0900
Message-ID: <20261022234339.3046449-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021142818.2782104-1-yhlee@isslab.korea.ac.kr>
References: <20261021142818.2782104-1-yhlee@isslab.korea.ac.kr>
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

Please drop this patch. The node use after free it describes is real, but I
no longer think a correct fix fits in efct_lio.c alone, and I would rather
withdraw it than have a partial fix carry a Fixes tag. What follows is what
I found, in case it is useful. Line numbers are against f47d223627f8.

efct_scsi_new_initiator() hands a bare struct efc_node to
efct_lio_setup_session() through lio_wq and returns EFC_SCSI_CALL_ASYNC, so
the node state machine keeps running while the work is queued. A peer LOGO,
an FC link down, a fabric change or target teardown during that window frees
the node under the work, which then reads it:

  BUG: KASAN: slab-use-after-free in efct_lio_setup_session+0x934/0xa30
  Read of size 8 at addr ffff888002d538a0 by task kworker/u4:0/12

  CPU: 0 UID: 0 PID: 12 Comm: kworker/u4:0 Tainted: G                 N  7.3.0-00342-g66b1ae16db8c-dirty #7 PREEMPT(lazy)
  Tainted: [N]=TEST
  Workqueue: efct-kunit-wq efct_lio_setup_session
  Call Trace:
   <TASK>
   print_report+0xcd/0x620
   ? efct_lio_setup_session+0x934/0xa30
   ? __virt_addr_valid+0x208/0x3f0
   ? efct_lio_setup_session+0x934/0xa30
   kasan_report+0xfb/0x130
   ? efct_lio_setup_session+0x934/0xa30
   efct_lio_setup_session+0x934/0xa30
   ? __pfx_efct_lio_setup_session+0x10/0x10
   ? lock_acquire+0x100/0x2d0
   ? process_one_work+0x835/0x1c40
   ? process_one_work+0x735/0x1c40
   ? lock_release+0xc3/0x250
   process_one_work+0x88b/0x1c40
   ? __pfx_process_one_work+0x10/0x10
   ? lock_acquire+0x100/0x2d0
   ? worker_thread+0x2c7/0x11b0
   ? lock_is_held_type+0x84/0xf0
   ? __pfx_efct_lio_setup_session+0x10/0x10
   worker_thread+0x649/0x11b0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x3aa/0x550
   ? _raw_spin_unlock_irq+0x23/0x40
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x493/0x940
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x22/0xdc0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x19/0x30
   </TASK>

  Allocated by task 33:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_noprof+0x23b/0x580
   mempool_alloc_noprof+0x143/0x230
   efct_kt_node_alloc.isra.0+0x38/0x4b0
   efct_kt_uaf_after_cb+0x7a/0x370
   kunit_try_run_case+0x1ca/0x4c0
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x3aa/0x550
   ret_from_fork+0x493/0x940
   ret_from_fork_asm+0x19/0x30

  Freed by task 12:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0x119/0x490
   mempool_free+0xbc/0x100
   efc_node_free+0x311/0x4a0
   efct_lio_setup_session+0x6f1/0xa30
   process_one_work+0x88b/0x1c40
   worker_thread+0x649/0x11b0
   kthread+0x3aa/0x550
   ret_from_fork+0x493/0x940
   ret_from_fork_asm+0x19/0x30

  The buggy address belongs to the object at ffff888002d53800
   which belongs to the cache kmalloc-1k of size 1024
  The buggy address is located 160 bytes inside of
   freed 1024-byte region [ffff888002d53800, ffff888002d53c00)

Taking a reference on the node for the life of the work stops the slab use
after free, but it does not stop the driver faulting on the same ordering.
efc_node_free() clears node->nport before it drops the reference, so
efct_get_vport_tpg() and efct_session_cb() still dereference a NULL nport
unless they check it under efc->lock. I measured that: with the reference
held and nothing else changed, the same case moves from a
slab-use-after-free to a NULL pointer dereference in efct_session_cb().

The reason I stopped is one step below that. libefc does not guarantee the
backend is told to delete a session before it frees the node that owns it.
efc_node_free() makes no backend upcall at all, and scsi_del_node is reached
only from __efc_d_initiate_shutdown(), efc_device.c:225, :241, :255 and
:264, and from __efc_d_device_gone(), efc_device.c:1451 to :1475. The first
of those picks a branch from node->init and node->targ, and when both are
false it falls through to efc_device.c:293 and goes to cleanup with no upcall
at all. A remote initiator can arrange that, because
efc_process_prli_payload() takes both flags straight from the PRLI service
parameters at efc_device.c:366, and __efc_d_device_ready() accepts a further
PRLI and re-runs that at efc_device.c:1355, after a session is registered.
__efc_node_paused() is a second such path, setting node->req_free on
EFC_EVT_SHUTDOWN at efc_node.c:916 with no upcall either. On both, a
registered se_session and its efct->lookup entry outlive the struct efc_node
they belong to, and efct_node_find(), efct_unsol.c:22, hands that entry out
and takes a reference on it at efct_unsol.c:34 for every inbound FCP or BLS
frame.

Three smaller things nearby, which I am not proposing to fix either. The
node->refound block in efc_node_free() calls
efc_node_find(node->nport, FC_FID_DIR_SERV) at efc_node.c:137, above the
"Node already Freed" guard at efc_node.c:140 that would have caught a NULL
nport. __efc_d_device_ready() discards the scsi_new_node() return value at
efc_device.c:1312, so an EFC_SCSI_CALL_ASYNC there is never completed. And
the target branch of __efc_d_initiate_shutdown() tests only
rc == EFC_SCSI_CALL_COMPLETE at efc_device.c:244, :258 and :267, while the
initiator branch at :228 also accepts a negative return, so a negative
return in the target branch leaves the node in __efc_d_wait_del_node,
efc_device.c:82, with nothing left to wake it.

What I think it wants is both halves together, a reference held on the node
for the life of the setup work, and an invariant in libefc that a node for
which scsi_new_node() succeeded gets exactly one scsi_del_node() before
efc_node_free(), independent of init and targ. The second half changes the
node state machine contract, including how the two delete completion events
pair up and what a re-attach does, so that is your call and not something I
should decide from the backend. I have a KUnit harness that reproduces the
use after free, the session leak and the stale lookup entry, and I am happy
to write patches or test whatever shape you prefer.

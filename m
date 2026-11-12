Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502023;
	b=CjbAMNAPA1V2mwRMKLgYd5wAeLQKCwvDirr7AvoNbpesFOrpoBP8CXrGKyqzYzYcM6/V
	 pH4WPb2+m38QSCVymxl0t/9PUMFmWcNxq8ehEMXh45D+azmGtQpEBcw5+ubZpq/yJmf3d
	 IkHGDS41ZEXMVVyIjwksev4c5E2owr+3ZnX0w/momDY/O7GNxJND/QAFSOvfFc62DR4i2
	 DsKheGpO7yoek6no+WXZIK07nW1WQZeg6V4otphAvpaTs6qsRXZw5OQ4B6LMQnZDapOHe
	 qSz2/gu4QpHDUF7SPPj1dOpvvQMlJbAlFy0oCQW3R0ItF3NsieLv3fdAZ1RTDvun+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0dKN0COIptcZp6LUQ9g82bvQApFBYtce8GNc+voVkvk=;
	b=GMp8Z+u+dRk51YTEIlRYnBh9aIw0rDvpI9f3zq7tu3uNxO2SDPvDawVx7wTNxt9OYvHs
	 PyZXwwdqV6m3DlfQ4xnqzNvvBxjwGm9Uj/IYUb2u0NdvJgGzRKDkMzR9XNSmc8+0XKHM0
	 N/ydWOcTJKvuIhIf9fx3lfuNZTZMRWPFot7LvL8W9FGp7bplfb/Q+2qT4+XXAu+dNo829
	 2ydyZa0LSVAbVAjknc1wUyBN7XuHHopBiUeZ+bs/DmweobUCHeZhWxfSHRn7TkwNI7dpP
	 MAb/+20u+nG5zUtxPG9JwuSJQuZm+m0INzgbYJaycdgKZqYRKcdO79kJrOpK9vcNnrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsqY8lYz;
	arc=none smtp.remote-ip=74.125.224.133
Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F960A3826
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399F960A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsqY8lYz
Received: by mail-yx2-f5.google.com with SMTP id 956f58d0204a3-679b4ca950fso1966639d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502021; x=1795106821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dKN0COIptcZp6LUQ9g82bvQApFBYtce8GNc+voVkvk=;
        b=hsqY8lYznBH3gIYkyiZkkuZiQkrM6H1lhVgYqe30w/vDk8HG4Q+uO/FCjldXo52eKb
         NYEo3VJmpwiPMRUS/8raEeRnOsR/NH8y17D0Tr5wuHXLgICydFxJOWuUlc++/Yns9zWY
         CefwHHvIre4c3D0g0gmHrctfCZdMaJWXrcB8vOy/34Aa8bUNsA3H6Arjlq6Eu8kDjr0i
         E/7o8EVMdJVu24a5O0bA4iSWtoKT5z/k0eVs72i7EdEKOJZdVa2WdIlSjPWLxqLe48sg
         ATkSRvZPhE4KmiM7cArbL3JAYizcFmPw3ww5gsfHzFv8LsNyM/9K4KfVtNgllIBmrs9d
         PkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502021; x=1795106821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dKN0COIptcZp6LUQ9g82bvQApFBYtce8GNc+voVkvk=;
        b=I1ewwXaIDmYPIDufH6dSG25MALzoSQI0bZ+ynQiYdypLNADnmjXQbeXOzSTM3R2Cje
         KoyYFDMSdylZyYxe9vlBMmlmHOQorFgQLtLuSTkriJmgE3G9Dez+m7Pqjv+uqjUJIl9z
         62KZLPYPxXN0fyGl1Mavmlbq5kr0oVQPg71RJne9Y8/Zqtl4FexeuMcc8JlVj5oZHxb5
         /BNsg5lvaBXwnsZFcprrOwT8o4RP+y9VKzqekFZpbVPe8rpnLoiEMDbtCOW9di15oSMg
         nl5k7RBQSRNB8vfzvoX8qzedPO9yyHcyafZpTtLTeWHLsqRMbQg2MYxj5zTFugHdAgX5
         zWTg==
X-Forwarded-Encrypted: i=1; AL+hErFc5KogZO7tM06wzsToujjBeXj9a28eYqnKW+5wmk20l79dy6p8vlNdmq+ZJWI1i+nRMrUf5M4FShHOwbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KS5Rnzwq5u642zncJoUr7TfTA8hQtuKalSIHqbGF146SRDfhn
	H14jyTG4hX+EcMnAHeug1u4WL0lll/Vqf4GqYRqld+tAy4N/i8kPkC5g
X-Gm-Gg: AYBFou3ORS4cJOQbQT7ICg81xR6SFSLuvDHBSxJeoraVdpvMn77kUqlf9NEr8K9mbeG
	mAXo+1w4rpDu8ritiC5qrBSf+fvGAxDsiFaPZHXYWfU4qMtF0pcpnjuJ5dM/t1GjF55s5iSs0Ru
	K38dSycBBAZh8KiB0OIFIExEN2pIqXARkKo/KVQ0paO/MamaEOExxngYOtKiUN8UyYwP2PmYL5h
	Pn9crIs3b6ZEuiAz0WIccHa3a677kcvy56rkD21Sgt1XVp0G8Ip5guSgigIQDpakpkdhX7oggm1
	XqkfdXoSbz5+9/YepSAzTZADEuLmFUYRwY/VqXa6kmQGfQQ776cmIq8rdOMN2MWhMnf7T4NYlXJ
	PVYQl3KSSHyrQYx2BCvU+xaQCVVQlNnqU8KH62naurSmbqrz1zX5P7ZFeSWTVaCyqinq7eObkXX
	2axNL6yw17rmcvcoCm592afHJhyEg6mqD4AlGECmKy9GRDKme3evx4BYLrD1eoL71L5SYmvIosz
	VWqaH+oAb4jfLu0XFJJW5z0M0BvtiwnsO5VFY6+b6Hy7K5tXlGnRh4zPjiyjMRkDw5Ma35EDs09
	vzjx2dAQV1u0SGR11veB3VmNwg3zeQNrkZ0TAxfmSg==
X-Received: by 2002:a05:690e:b87:b0:67d:83c7:ddd2 with SMTP id 956f58d0204a3-67d895e51afmr1023d50.37.1794502020995;
        Thu, 12 Nov 2026 08:47:00 -0800 (PST)
Received: from athenadria-developer.attlocal.net ([2600:1700:1350:96b0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589ea7acsm7787339d50.14.2026.11.12.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:47:00 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: atomisp: Remove unneeded return statements
Date: Thu, 12 Nov 2026 10:46:42 -0600
Message-ID: <20261112164642.38692-1-hmjm081106@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Remove the bare return statements at the end of void functions
throughout the driver, along with the blank lines before them. They
have no effect and checkpatch.pl warns about them:

  WARNING: void function return statements are not generally useful

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
v2:
 - Cover the whole driver instead of only irq.c (Andy Shevchenko)

v1: https://lore.kernel.org/r/20261112011025.101375-1-hmjm081106@gmail.com

 .../hive_isp_css_common/host/event_fifo_private.h    |  1 -
 .../pci/hive_isp_css_common/host/fifo_monitor.c      |  5 -----
 .../hive_isp_css_common/host/fifo_monitor_private.h  |  3 ---
 .../atomisp/pci/hive_isp_css_common/host/gp_device.c |  1 -
 .../pci/hive_isp_css_common/host/gp_device_private.h |  1 -
 .../pci/hive_isp_css_common/host/gpio_private.h      |  1 -
 .../pci/hive_isp_css_common/host/input_formatter.c   |  8 --------
 .../host/input_formatter_private.h                   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c | 12 ------------
 .../pci/hive_isp_css_common/host/irq_private.h       |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/isp.c |  1 -
 .../pci/hive_isp_css_common/host/isp_private.h       |  6 ------
 .../media/atomisp/pci/hive_isp_css_common/host/mmu.c |  2 --
 .../pci/hive_isp_css_common/host/sp_private.h        |  8 --------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c       |  2 --
 .../media/atomisp/pci/isp2400_input_system_private.h |  4 ----
 .../media/atomisp/pci/runtime/binary/src/binary.c    |  1 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c        |  1 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c     |  9 ---------
 .../media/atomisp/pci/runtime/frame/src/frame.c      |  4 ----
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c      |  2 --
 .../staging/media/atomisp/pci/runtime/isys/src/rx.c  |  7 -------
 drivers/staging/media/atomisp/pci/sh_css.c           |  4 ----
 23 files changed, 85 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
index e77d7cf61356..f9823b9c2246 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
@@ -20,7 +20,6 @@ STORAGE_CLASS_EVENT_C void event_wait_for(const event_ID_t ID)
 	assert(ID < N_EVENT_ID);
 	assert(event_source_addr[ID] != ((hrt_address) - 1));
 	(void)ia_css_device_load_uint32(event_source_addr[ID]);
-	return;
 }
 
 STORAGE_CLASS_EVENT_C void cnd_event_wait_for(const event_ID_t ID,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
index f0de78815456..9aee5ebb2004 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
@@ -492,8 +492,6 @@ void fifo_channel_get_state(
 		assert(0);
 		break;
 	}
-
-	return;
 }
 
 void fifo_switch_get_state(
@@ -514,8 +512,6 @@ void fifo_switch_get_state(
 	state->is_none = (data == HIVE_ISP_CSS_STREAM_SWITCH_NONE);
 	state->is_sp = (data == HIVE_ISP_CSS_STREAM_SWITCH_SP);
 	state->is_isp = (data == HIVE_ISP_CSS_STREAM_SWITCH_ISP);
-
-	return;
 }
 
 void fifo_monitor_get_state(
@@ -537,7 +533,6 @@ void fifo_monitor_get_state(
 		fifo_switch_get_state(ID, sw_id,
 				      &state->fifo_switches[sw_id]);
 	}
-	return;
 }
 
 static inline bool fifo_monitor_status_valid(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
index 53a3fb796aab..123cb89cf3ee 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
@@ -31,8 +31,6 @@ STORAGE_CLASS_FIFO_MONITOR_C void fifo_switch_set(
 	(void)ID;
 
 	gp_device_reg_store(GP_DEVICE0_ID, FIFO_SWITCH_ADDR[switch_id], sel);
-
-	return;
 }
 
 STORAGE_CLASS_FIFO_MONITOR_C hrt_data fifo_switch_get(
@@ -56,7 +54,6 @@ STORAGE_CLASS_FIFO_MONITOR_C void fifo_monitor_reg_store(
 	assert(FIFO_MONITOR_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(FIFO_MONITOR_BASE[ID] + reg * sizeof(hrt_data),
 				   value);
-	return;
 }
 
 STORAGE_CLASS_FIFO_MONITOR_C hrt_data fifo_monitor_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
index b934d20c88ea..35366da05390 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
@@ -96,5 +96,4 @@ void gp_device_get_state(
 				   _REG_GP_SYNCGEN_FRAME_CNT_ADDR);
 	state->soft_reset = gp_device_reg_load(ID,
 					       _REG_GP_SOFT_RESET_ADDR);
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
index 71f20992ee98..f43e79a39f4d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_GP_DEVICE_C void gp_device_reg_store(
 	assert(GP_DEVICE_BASE[ID] != (hrt_address) - 1);
 	assert((reg_addr % sizeof(hrt_data)) == 0);
 	ia_css_device_store_uint32(GP_DEVICE_BASE[ID] + reg_addr, value);
-	return;
 }
 
 STORAGE_CLASS_GP_DEVICE_C hrt_data gp_device_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
index bcf6538ac0dc..27809117dde6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
@@ -18,7 +18,6 @@ static inline void gpio_reg_store(
 	OP___assert(ID < N_GPIO_ID);
 	OP___assert(GPIO_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(GPIO_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 static inline hrt_data gpio_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index c353461dcdf2..d2ac87fdfb4a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -64,8 +64,6 @@ void input_formatter_rst(
 	 */
 	if (!HIVE_IF_BIN_COPY[ID])
 		input_formatter_reg_store(ID, addr, rst);
-
-	return;
 }
 
 unsigned int input_formatter_get_alignment(
@@ -87,7 +85,6 @@ void input_formatter_set_fifo_blocking_mode(
 		input_formatter_reg_store(ID,
 					  HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS, enable);
 	}
-	return;
 }
 
 void input_formatter_get_switch_state(
@@ -120,8 +117,6 @@ void input_formatter_get_switch_state(
 					   _REG_GP_IFMT_input_switch_fsync_lut);
 	state->if_input_switch_ch_id_fmt_type = gp_device_reg_load(GP_DEVICE0_ID,
 						_REG_GP_IFMT_input_switch_ch_id_fmt_type);
-
-	return;
 }
 
 void input_formatter_get_state(
@@ -201,8 +196,6 @@ void input_formatter_get_state(
 				HIVE_IF_FSM_VECTOR_SUPPORT);
 	state->sensor_data_lost = input_formatter_reg_load(ID,
 				  HIVE_IF_FIFO_SENSOR_STATUS);
-
-	return;
 }
 
 void input_formatter_bin_get_state(
@@ -230,5 +223,4 @@ void input_formatter_bin_get_state(
 			 HIVE_STR2MEM_DUAL_BYTE_INPUTS_ENABLED_REG_ADDRESS);
 	state->en_status_update = input_formatter_reg_load(ID,
 				  HIVE_STR2MEM_EN_STAT_UPDATE_ADDRESS);
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
index 6b6ba49656e5..823861f2abe3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_INPUT_FORMATTER_C void input_formatter_reg_store(
 	assert(INPUT_FORMATTER_BASE[ID] != (hrt_address)-1);
 	assert((reg_addr % sizeof(hrt_data)) == 0);
 	ia_css_device_store_uint32(INPUT_FORMATTER_BASE[ID] + reg_addr, value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_FORMATTER_C hrt_data input_formatter_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea386361a..6ca8fcd61b36 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -60,7 +60,6 @@ void irq_clear_all(
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
-	return;
 }
 
 /*
@@ -104,8 +103,6 @@ void irq_enable_channel(
 		      _HRT_IRQ_CONTROLLER_MASK_REG_IDX, mask);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 void irq_enable_pulse(
@@ -120,7 +117,6 @@ void irq_enable_pulse(
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
-	return;
 }
 
 void irq_disable_channel(
@@ -150,8 +146,6 @@ void irq_disable_channel(
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, me);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status irq_get_channel_id(
@@ -212,7 +206,6 @@ void irq_raise(
 			    (unsigned int)addr, 1);
 	gp_device_reg_store(GP_DEVICE0_ID,
 			    (unsigned int)addr, 0);
-	return;
 }
 
 bool any_virq_signal(void)
@@ -251,7 +244,6 @@ void cnd_virq_enable_channel(
 			irq_disable_channel(IRQ0_ID, IRQ_NESTING_ID[ID]);
 		}
 	}
-	return;
 }
 
 void virq_clear_all(void)
@@ -260,8 +252,6 @@ void virq_clear_all(void)
 
 	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status
@@ -302,8 +292,6 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-
-	return;
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
index ae0a8466a70a..5e27f053f00c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_IRQ_C void irq_reg_store(
 	assert(ID < N_IRQ_ID);
 	assert(IRQ_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(IRQ_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_IRQ_C hrt_data irq_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3fca..17a04ac623ff 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -27,7 +27,6 @@ void cnd_isp_irq_enable(
 		isp_ctrl_clearbit(ID, ISP_IRQ_READY_REG,
 				  ISP_IRQ_READY_BIT);
 	}
-	return;
 }
 
 /* ISP functions to control the ISP state from the host, even in crun. */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
index 177770a9bc1d..b699a1c3af0b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
@@ -30,7 +30,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_store(
 #else
 	hrt_master_port_store_32(ISP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C hrt_data isp_ctrl_load(
@@ -64,7 +63,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_setbit(
 	hrt_data	data = isp_ctrl_load(ID, reg);
 
 	isp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_ctrl_clearbit(
@@ -75,7 +73,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_clearbit(
 	hrt_data	data = isp_ctrl_load(ID, reg);
 
 	isp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_store(
@@ -91,7 +88,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_store(
 #else
 	hrt_master_port_store(ISP_DMEM_BASE[ID] + addr, data, size);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_load(
@@ -107,7 +103,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_load(
 #else
 	hrt_master_port_load(ISP_DMEM_BASE[ID] + addr, data, size);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_store_uint32(
@@ -123,7 +118,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_store_uint32(
 #else
 	hrt_master_port_store_32(ISP_DMEM_BASE[ID] + addr, data);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C uint32_t isp_dmem_load_uint32(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 70d118fe1e70..87d89eab7f2c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -12,7 +12,6 @@ void mmu_set_page_table_base_index(
     const hrt_data		base_index)
 {
 	mmu_reg_store(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX, base_index);
-	return;
 }
 
 hrt_data mmu_get_page_table_base_index(
@@ -25,7 +24,6 @@ void mmu_invalidate_cache(
     const mmu_ID_t		ID)
 {
 	mmu_reg_store(ID, _HRT_MMU_INVALIDATE_TLB_REG_IDX, 1);
-	return;
 }
 
 void mmu_invalidate_cache_all(void)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
index c69778411f2f..b03ae6658df3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_store(
 	assert(ID < N_SP_ID);
 	assert(SP_CTRL_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(SP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_SP_C hrt_data sp_ctrl_load(
@@ -51,7 +50,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_setbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
@@ -62,7 +60,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store(
@@ -74,7 +71,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_load(
@@ -86,7 +82,6 @@ STORAGE_CLASS_SP_C void sp_dmem_load(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_load(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
@@ -98,7 +93,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint8(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
@@ -110,7 +104,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint16(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
@@ -122,7 +115,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint32(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C uint8_t sp_dmem_load_uint8(
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1ca1..4ceb8cb41156 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -483,7 +483,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -957,7 +956,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 	}
 
 	mutex_unlock(&bo->mutex);
-	return;
 }
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
index a6762683a0ac..00e6574f186a 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void input_system_reg_store(
 	assert(INPUT_SYSTEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(INPUT_SYSTEM_BASE[ID] + reg * sizeof(hrt_data),
 				   value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data input_system_reg_load(
@@ -43,7 +42,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void receiver_reg_store(
 	assert(ID < N_RX_ID);
 	assert(RX_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(RX_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data receiver_reg_load(
@@ -67,7 +65,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void receiver_port_reg_store(
 	assert(MIPI_PORT_OFFSET[port_ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(RX_BASE[ID] + MIPI_PORT_OFFSET[port_ID] + reg *
 				   sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data receiver_port_reg_load(
@@ -95,7 +92,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void input_system_sub_system_reg_store(
 	assert(SUB_SYSTEM_OFFSET[sub_ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(INPUT_SYSTEM_BASE[ID] + SUB_SYSTEM_OFFSET[sub_ID] +
 				   reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data input_system_sub_system_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc..8ee20947b20e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -345,7 +345,6 @@ ia_css_binary_dvs_stat_grid_info(
 {
 	(void)pipe;
 	sh_css_binary_common_grid_info(binary, info);
-	return;
 }
 
 int ia_css_binary_3a_grid_info(const struct ia_css_binary *binary,
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 0f0d16f4ce7c..51f7c9d6f378 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -176,7 +176,6 @@ static void map_buffer_type_to_queue_id(
 	}
 
 	assert(i != SH_CSS_MAX_NUM_QUEUES);
-	return;
 }
 
 static void unmap_buffer_type_to_queue_id(
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..f9be7743d006 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -136,7 +136,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
@@ -315,7 +314,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 			    state->fifo_valid);
 	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
 			    state->sink_accept);
-	return;
 }
 
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
@@ -364,7 +362,6 @@ void ia_css_debug_dump_all_fifo_state(void)
 	for (i = 0; i < N_FIFO_CHANNEL; i++)
 		debug_print_fifo_channel_state(&state.fifo_channels[i],
 					       "squepfstqkt");
-	return;
 }
 
 static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
@@ -386,7 +383,6 @@ static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
 	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
 	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
 	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
 }
 
 void ia_css_debug_binary_print(const struct ia_css_binary *bi)
@@ -441,7 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
 }
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
@@ -526,7 +521,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -808,8 +802,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 #endif
 
 #if SP_DEBUG != SP_DEBUG_NONE
-
-	return;
 }
 #endif
 
@@ -823,7 +815,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 #endif
 	ia_css_bufq_dump_queue_info();
 	ia_css_pipeline_dump_thread_map_info();
-	return;
 }
 
 /* this function is for debug use, it can make SP go to sleep
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..ae952df03cc6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -525,7 +525,6 @@ static void frame_init_nv_planes(struct ia_css_frame *frame,
 	frame_init_plane(&frame->planes.nv.y, y_width, y_stride, y_height, 0);
 	frame_init_plane(&frame->planes.nv.uv, uv_width,
 			 uv_stride, uv_height, y_bytes);
-	return;
 }
 
 static void frame_init_yuv_planes(struct ia_css_frame *frame,
@@ -558,7 +557,6 @@ static void frame_init_yuv_planes(struct ia_css_frame *frame,
 		frame_init_plane(&frame->planes.yuv.v, uv_width, uv_stride,
 				 uv_height, y_bytes + uv_bytes);
 	}
-	return;
 }
 
 static void frame_init_rgb_planes(struct ia_css_frame *frame,
@@ -575,7 +573,6 @@ static void frame_init_rgb_planes(struct ia_css_frame *frame,
 			 width, stride, height, 1 * bytes);
 	frame_init_plane(&frame->planes.planar_rgb.b,
 			 width, stride, height, 2 * bytes);
-	return;
 }
 
 static void frame_init_qplane6_planes(struct ia_css_frame *frame)
@@ -599,7 +596,6 @@ static void frame_init_qplane6_planes(struct ia_css_frame *frame)
 			 width, stride, height, 4 * bytes);
 	frame_init_plane(&frame->planes.plane6.b_at_r,
 			 width, stride, height, 5 * bytes);
-	return;
 }
 
 static int frame_allocate_buffer_data(struct ia_css_frame *frame)
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..9739ab25000c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -471,8 +471,6 @@ static void ifmtr_set_if_blocking_mode(
 			input_formatter_set_fifo_blocking_mode(id, block[id]);
 		}
 	}
-
-	return;
 }
 
 static int ifmtr_start_column(
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..5d90587bac73 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -43,8 +43,6 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 	 * The CSI is nested into the Iunit IRQ's
 	 */
 	ia_css_irq_enable(IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR, true);
-
-	return;
 }
 
 /* This function converts between the enum used on the CSS API and the
@@ -196,8 +194,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 	receiver_port_reg_store(RX0_ID,
 				port,
 				_HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, bits);
-
-	return;
 }
 
 static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
@@ -637,8 +633,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 *                INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
-
-	return;
 }
 
 void ia_css_isys_rx_disable(void)
@@ -650,5 +644,4 @@ void ia_css_isys_rx_disable(void)
 					_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX,
 					false);
 	}
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc384ca..5b12ff8ec32d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2928,8 +2928,6 @@ ia_css_get_crop_offsets(
 	in_frame->crop_info.start_line = row;
 
 	IA_CSS_LEAVE_PRIVATE("void start_col: %u start_row: %u", column, row);
-
-	return;
 }
 
 static int
@@ -3326,8 +3324,6 @@ static void send_raw_frames(struct ia_css_pipe *pipe)
 							    pipe->continuous_frames[i], pipe->cont_md_buffers[i]);
 		}
 	}
-
-	return;
 }
 
 static int
-- 
2.56.0


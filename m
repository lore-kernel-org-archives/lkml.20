Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501453;
	b=PaUf0vw0xqO0dCi9Gy8ah6Ha0jQTr3jvFdhhrKm0bMxpJeg45SwLcA0U++WjWX/LWZGA
	 2qdhk10IdAIkdMNxvJoyJOcuCZ5MTaJEWIXF4o7UIHR4nyiNaX26zzScYoGVelQ4H2vjl
	 UDgNLc/QlfARrKVCyD8mY+mGGbRy8CYkCqRDWpMZh8GmEFZfhQYD01peRhg4bx2YuEs2i
	 UgonW+lMZjEQi3TgzeruqM7W0ecQ914iV5XW4XbARRbMbaXME77Fz2FVACrQR1q2E98Hq
	 sAT91iQzw10hoxnoA+RXBFIGLmFizSHMz0W4s22KK9hHMrp/VZR3DoYaAN0BjbQ7uMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PYSPbfibjCMAgfbLhUn692RCNw6C4KcKQJGM8L0iQ9Y=;
	b=eMtNYn3UKssCCtv6tBNb/GOWYNgWAPoeN2ed//Elwo1aOtqciUaSct+jAuWJM/zsOsJ7
	 Xokbu19VkIbDDDvqxAVI+yW/feJeC3bFVESUQz0Lop01LAZADMPj6nuCJAN+/8Ek8bJOY
	 IyZCkDC67W/3iwEOq4X2BM2AC1/+dJRS8175UyBONYfGlyF108P9bNKNfZYvZmPiYVH71
	 eXYUpObFi4r5E4PQOj2F1hCxCXeSTSeFVT3IXLwT7UVTf229cpoPAtgIgae7hNfVlJJuG
	 oAqHe1HGnMuo0XEt71MAjvO3Ja1lRBUK4IWqdwkRLPikNvS37viNaz0Kyzm6IRGQQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jtB4Jpwb;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA49606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA49606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jtB4Jpwb
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso658268b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501453; x=1793106253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYSPbfibjCMAgfbLhUn692RCNw6C4KcKQJGM8L0iQ9Y=;
        b=jtB4JpwbtpM84Qy4/o7CDdW6xIRk7avAnch7hBBWwUrksYoNL7Gf2RlT0uhlsyi82S
         +YbP5kx+4M0oBdhKuioIvGE0LC7AZ6EZ1jLCxu5EEXUEUHcATHJ0YOKJHiFQdDVHqoa6
         ZYYG7egW60rcz6K3HTk5ruRNHCPlCFGTcLvuTvHdC/RNiambefyungV8exr3qonhBEGx
         rDC7N0VhYYghC8mNG07Onfa0Fn8kgS7I/1L35OMkQTe3p8qGdGHP0oDe3K5jxOeAJqRa
         64EnDQfIScnWf3XMfxfTeSb9eM7g+wexutZQmMJhIfPS6TVeWYwL6emX7oCOT1oS/tSw
         drVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501453; x=1793106253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYSPbfibjCMAgfbLhUn692RCNw6C4KcKQJGM8L0iQ9Y=;
        b=rCKsU10fy0O/nifcxkaaEWLsTu+hMQ6o+fSbaKv4cHHmQo5CabRDkTowFS8gP6GFGm
         bVktnCciOOvati2HT1W84GnNIPVK7FQQg3+pul9LGGmHfqcfSmEXugnLkyS5LITWK4VX
         qB/VRZXojeleA7HXUrUa2+8ccJeQM/Ti3h//CE+nLxqjmFYud266YvqghvlPLEi3eW8r
         HxwnI3+6yypPN7DXO/7VXoWqKV1wtT8t4fjRcQ1XNNtqkv6317D/gpTt7OXa3PjG9EoT
         D3SQ6Q99dkbZFIFaqEOo5nk0W8rKt9C2EHDt0clk5+9tzhaZFwdkC312oZrlUnT5AclX
         0pww==
X-Forwarded-Encrypted: i=1; AKwUvBywiZOZe7dD/CaroYXS9UKmz5QAk4HM6zZcXvogwjQ0DLDQqfES2y5VLEEaJnekDSBm3biZcfbKuaAUVMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxdtWNxHOSrVZuzTCBnS2orYA3FGPBiXhdhTGy7kE9giSgmNXY
	ZCXjYfjZenxQzZa96RXcB2/OC15t7caQmgM5dvaadAk5YHNKlqQY0D8M
X-Gm-Gg: AYBFou20iS48CsHLZGqkocwzwulGoC+A5Vvn2N6J6Lkghw6Z8ONF2CyfTdrzu6mtRvn
	MheyFq09vaTapfW13sHzBcZ9rMgFQfckWwQRoarEpAzxgBYxT8hIRYBRpU6avNz/wEzVHY3vRod
	ZohRVRBdvXTLLVNbXHw0jEl/CqQDiVcVEmrsT01M3/OAmhad1fOD0cGlkf3zmTZRDhiOJDN9CMl
	7wnSWvewyB+Jf86H72ci9JD4tSE8pcs3nchtpxFNpT7joS4Db2D7lyFNCNxTyyrgstJlR83de5J
	WmeLjkqK42W55S09gr4EqGZjmbrdTK3NqnFeJSbadEBvnfNlO7nDZB3e7eUHlg0P8mhDaiUJPUn
	kqRw8WgBUrNOUSgL0LFx2+RU8kp6fmuY9oGEIDp5gbC4n7iqsem9jzNUITvpN4j4kKISIXVMh3k
	H6V11PwqSmLsvIaUpmS9MCAkVkxtudTKJnm7dMum+73E7Nk0RwnJhIB9aGJRacHDyV9A==
X-Received: by 2002:a05:6a21:3949:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3e225f34c37mr8453562637.11.1792501452699;
        Tue, 20 Oct 2026 06:04:12 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm5267685a12.22.2026.10.20.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:04:12 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2/dlm: drain join handlers before releasing module text
Date: Tue, 20 Oct 2026 21:04:04 +0800
Message-Id: <pm-ocfs2-objects-candidate-0076-v5-dd198d8a9358ad81f70e@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The code for a registered DLM handler must remain resident until its
last invocation finishes. dlm_unregister_net_handlers() only removes
dlm_join_handlers from the o2net registry. o2net_handler_get() takes a
kref on the wrapper, but that reference does not pin ocfs2_dlm text.
o2net_process_message() calls nh_func after dropping o2net_handler_lock.

With CONFIG_OCFS2_FS_O2CB=m, ocfs2_dlm can be loaded independently of
ocfs2_stack_o2cb while nodemanager continues handling messages from a
configured, heartbeating peer. If no dependent module or module reference
prevents normal unload, the following ordering is possible:

  Receive worker                       Module unload
  --------------                       -------------
  o2net_handler_get()
    take wrapper kref
    drop handler lock
  <preempted>
                                       dlm_exit()
                                         unregister handlers
                                       release DLM module text
  call saved nh_func
    in released module text

Use o2net_unregister_and_flush_handler_list() in the shared DLM
unregister helper. It first prevents new lookups, then waits for the
ordered o2net workqueue to drain, including a concurrent destruction of
that queue. The acquired invocation therefore finishes before dlm_exit()
returns and the loader releases the callback code. The same helper also
covers partial registration and dlm_init() error unwind before module
memory is released.

Oops report as below:

    Oops: int3: 0000 [#1] SMP KASAN NOPTI
    CPU: 2 UID: 0 PID: 54 Comm: kworker/u16:3 Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)

Hardware identification omitted.

    Workqueue: o2net o2net_rx_until_empty [ocfs2_nodemanager]
    RIP: 0010:0xffffffffc0423871
    Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <cc> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc

Register dump omitted.

    Call Trace:
     <TASK>
     ? o2net_rx_until_empty+0x19b1/0x3300 [ocfs2_nodemanager]
     ? __pfx_o2net_rx_until_empty+0x10/0x10 [ocfs2_nodemanager]
     ? lock_acquire+0x190/0x300
     ? process_one_work+0x935/0x1b40
     ? process_one_work+0x834/0x1b40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? process_one_work+0x9a8/0x1b40
     ? __pfx_process_one_work+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x177/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     ? kthread+0x351/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ? ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf70
     ? __pfx_kthread+0x10/0x10
     ? ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in: ocfs2_nodemanager [last unloaded: ocfs2_dlm]
    ---[ end trace 0000000000000000 ]---

Fixes: 6714d8e86bf4 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: <stable@vger.kernel.org>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
 fs/ocfs2/dlm/dlmdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
index 97bb9400e24b..0f4d29cbce81 100644
--- a/fs/ocfs2/dlm/dlmdomain.c
+++ b/fs/ocfs2/dlm/dlmdomain.c
@@ -2215,7 +2215,7 @@ static LIST_HEAD(dlm_join_handlers);
 
 static void dlm_unregister_net_handlers(void)
 {
-	o2net_unregister_handler_list(&dlm_join_handlers);
+	o2net_unregister_and_flush_handler_list(&dlm_join_handlers);
 }
 
 static int dlm_register_net_handlers(void)

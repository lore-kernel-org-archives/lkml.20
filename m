Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674809;
	b=Xy7NfFrJCh6oD1iMU+SSuqLf3UmOdcGz+YVgqtoUxslLFohsdgJBPBmdjC8pBoEbJbfx
	 sWiLvZRQwlXJIl0uEstm2cZK/VRMSndw3UUdInVAy0FflRTTbjySvmui2ud43wdDkTH4I
	 dabJf/puYYnk9TDh4HfUUsIK15AeXhDslWy9ocSCQjaBNrhgsMdMjewP36qx4mAchHxHQ
	 OWRIFX7CAl4qVKBMR1LXfLX2d/o18D8oh+PoCu0jksVrIcMWIdGjQTPVY9XNt56euq/0h
	 OKIbUPREWIFxNsQNTPuoWoJgxr9pgM5hfWSRK03hnbXtnprhRWp0J+EUf2Fgtf7ecSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=yVOQ1L8O+8jKxtIQtsjnk6fzaZoe6ThQio4f1IPG6QM=;
	b=Yuy+vs6BOe0ZOlg0Hu2JTFMbW3zOYshHjwM+xO+iYM5ePpgyohhg3Ler89JVFoCEfttE
	 YnwqXloGdQ3W06HIFCJAhhuNbSjcPDFto3wbn/ZTSeAcDtsp0Aih1HxE63Z6YD3+ch07s
	 BWYmtzdkoZ1uDIU3fIkhoGYMkhyQPNyRhAtWRIs0fPGHOUyB1NxzGlT+Mm9pUILG0i4g3
	 pWw7lS3CVQ9Y7/eUoSBDHz0hQJ73BVgCeNWJBAEU+D19PKTBboZx4wGmDCVTW+v1M8Zf/
	 tmvZGQMN0oilZH5ATtE5Xo5I8Wq/K0EZ6HeRftrOcQbGeKc5l08DK8jq4RkEVqTuAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWKww995;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25920606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25920606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWKww995
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4036759a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674808; x=1794279608; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVOQ1L8O+8jKxtIQtsjnk6fzaZoe6ThQio4f1IPG6QM=;
        b=IWKww995EvtZZoHiYy/wXjTGbmZog9wtq5/Jc+an6R2jG84GS2Eu2YsnzdYVWofwPs
         bUsKacRZmhscQLX7lCKMlB1X35QGKhrzLjgI0T1/jdPT6t8PiY5S4UqsU75X5nzusTAi
         x+TZLy+OUgvncCeMHBiNtzX6Lrq3PFus696BRDfhNOTyaPbV62l6MbtvOIweI3UjeTto
         NyGBxB1mjUU9xbF/bV2+kogfkJKfWhjLgB1t8K3KcHpwx00x7lZ+sCOo0l46m9i9NE5/
         F+ZdWWPD5/2ErfBXCvZPeYWK32peHv24HTt0AJgMm/ZDr4ouChLdJ4tD9nP/JKIecR+a
         St4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674808; x=1794279608;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVOQ1L8O+8jKxtIQtsjnk6fzaZoe6ThQio4f1IPG6QM=;
        b=Y7v7Ta7UylDN7hoOwXhTVj8LesXuuYTYP0gkVkJOW3SNJWOd5vy/slTwDCGF9wmOIm
         qtaotDu/MZ6FrTUseuOrVvw2DbsvnfAnUxYcDaEyUtg1XDeDY9VcvfWfRPI8LY1EH/+C
         iIWCOHkA+Cn5Kire4N608n0tA+rYejqKv046gqHHbNyuPNhvIRAuBggXdur43G3gaoOy
         2HdpoPx1Ahggdh74MwBFCBIg5CY16JRCbT+oOqxFtUPWWD9GN4f8SUCsJ5kGHFOKonqI
         raz1IpwWG7lRwzZ3JuBa/cg60R/xiN9ZLOMIPTyZ8vvfwaBpdxtJUlcLmRWikBzZpeQE
         eW7A==
X-Forwarded-Encrypted: i=1; AKwUvBzpRo/e9A6DodF3qeP9bRLiXVwokuRnb2LIOkeGj9UNRjdtVKtcq5geuv/G+Wlj+OlKkXXqshUDi05CD38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wh0QLOWxNooRbLf16qKbHkxoPVDtuNDVQfEWP65wj7uyHQvWy
	7qqfWTr/MozuJ5IspfXLkbXwlwN5p7ApBWdjRpiYj7E53EKHmLQukXdT
X-Gm-Gg: AYBFou122rKgOJp9kCVQ8/Pn+KFsH5ArNFmZo/hu9wBxlp1Rl81k1S3M7+pagAGcNEr
	xqKEAFN1b4eCAWKU7fG1OFUXUbatRw+7BHMI8rRsloJveB1YzkIb5Wtps4TFjzqUa9fPkFAiSgg
	wyAB4PDgxYbumXuf+4CgIMpX2qVa4uGGfJ80fzl485Bxv4PY6eYl5Cv6x2HrTccZe/KghbqR6N2
	jm72m1wO+5C5kA03PksapHr8Qdk1QSPxXrE2+YJHf0ggtxG5DF+UGIOqoAKU2kCWVjt3XX74SVo
	4/YwHtjAE/N3ZwVDKOSvx+mNJZjmIqswIA9FKB6U3+Tng3KMLaaaQDrAiuX7fhnqYfRZvKvn9o9
	5F7CHQJXvNPUkZb4LULwXQy+2XHz67wZ4/vVJ08dTwkbdL/vIW5b/dqjmNjm8pd8tmWhjHiAsBD
	uO2grTN/6hIBSb2eLSQU7OzjXnCiE8xhcyBGoefZnI0d84/d8gHuenxLDCkuNaIocV/+Bshn6gu
	I3vP/HoDhrDfOwZLj4lKrQmvfPPNrWcZ4fRDHVlsrvA7YRiNIcHgEnJC9QbuaiXkkVyf+uvyoBC
	1zXd7AWQojyIu3vHXPHlDuy638/ICWGPFJi3F8CBw+e9/rmmGQTHWX7Y+PfK0fvGiBBc+z2obEH
	njg3sD5v2fDxkwaIBQWnfX3Mb/eoO03JHNg==
X-Received: by 2002:a17:90b:1d03:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ae8984de33mr10126233a91.60.1793674808172;
        Mon, 02 Nov 2026 19:00:08 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5adc33sm1790498a91.1.2026.11.02.19.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 19:00:07 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 03:00:07 +0000
Message-Id: <DML8NIYTERIZ.1GLZ1R1VJPLUG@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yifan Zhang" <yfzhang23@stu.pku.edu.cn>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 <linux-input@vger.kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] HID: bpf: synchronize hardware operations with
 device destruction
In-Reply-To: <179367391951.8187.17327354719079930667@stu.pku.edu.cn>
References: <179367391951.8187.14164894863012056170@stu.pku.edu.cn> <179367391951.8187.17327354719079930667@stu.pku.edu.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 06:45 PM Yifan Zhang <yfzhang23@stu.pku.edu.cn> wrote:
> Add a lifetime lock that serializes admission of HID-BPF hardware
> operations with device destruction.  Take an SRCU read lock while holding
> the lifetime lock before accessing the report tables or the low-level
> driver.  Destruction marks the device destroyed under the same lock and
> waits for the SRCU readers before cleaning up the SRCU state.

The lifetime lock is needed only because hid_bpf_destroy_device() calls
cleanup_srcu_struct(). After that a reference to hid_device is not
enough to call srcu_read_lock().
The splat in patch 2 has the same cause. So does
commit 578e1b96fad7 ("HID: bpf: abort dispatch if device destroyed").

Lets keep hdev->bpf.srcu valid until hiddev_free().
Then the check of 'destroyed' goes inside the SRCU section.
No need for the 2nd mutex.

The dispatchers have the same race and this patch leaves it.
hid_bpf_destroy_device() runs before hidraw_disconnect():

  hidraw ioctl                        hid_destroy_device()
  dispatch_hid_bpf_raw_requests()
    destroyed == false
                                      destroyed = true
                                      synchronize_srcu()
                                      cleanup_srcu_struct()
    srcu_read_lock()   <- use after free

hid_close_report() also runs on unbind and on device_reprobe().
SRCU doesn't cover that. Neither this patch nor the diff below fixes it.

Instead of patches 1 and 2:

and Pls wait for Benjamin before sending v3.

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index 6b467c7..6c2b136 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -99,13 +99,15 @@ int dispatch_hid_bpf_raw_requests(struct hid_device *hdev,
 	struct hid_bpf_ops *e;
 	int ret, idx;

-	if (unlikely(hdev->bpf.destroyed))
-		return -ENODEV;
-
 	if (rtype >= HID_REPORT_TYPES)
 		return -EINVAL;

 	idx = srcu_read_lock(&hdev->bpf.srcu);
+	if (unlikely(hdev->bpf.destroyed)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
 				 srcu_read_lock_held(&hdev->bpf.srcu)) {
 		if (!e->hid_hw_request)
@@ -139,10 +141,12 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
 	struct hid_bpf_ops *e;
 	int ret, idx;

-	if (unlikely(hdev->bpf.destroyed))
-		return -ENODEV;
-
 	idx = srcu_read_lock(&hdev->bpf.srcu);
+	if (unlikely(hdev->bpf.destroyed)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
 				 srcu_read_lock_held(&hdev->bpf.srcu)) {
 		if (!e->hid_hw_output_report)
@@ -423,6 +427,11 @@ hid_bpf_hw_request(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz,
 	if (ctx_kern->from_bpf)
 		return -EDEADLOCK;

+	/* hid_bpf_destroy_device() waits for us before the transport goes away */
+	guard(srcu)(&ctx->hid->bpf.srcu);
+	if (ctx->hid->bpf.destroyed)
+		return -ENODEV;
+
 	/* check arguments */
 	ret = __hid_bpf_hw_check_params(ctx, buf, &size, rtype, true);
 	if (ret)
@@ -483,6 +492,10 @@ hid_bpf_hw_output_report(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz)
 	if (ctx_kern->from_bpf)
 		return -EDEADLOCK;

+	guard(srcu)(&ctx->hid->bpf.srcu);
+	if (ctx->hid->bpf.destroyed)
+		return -ENODEV;
+
 	/* check arguments */
 	ret = __hid_bpf_hw_check_params(ctx, buf, &size, HID_OUTPUT_REPORT, true);
 	if (ret)
@@ -641,13 +654,9 @@ void hid_bpf_destroy_device(struct hid_device *hdev)
 	if (!hdev)
 		return;

-	/* mark the device as destroyed in bpf so we don't reattach it */
-	hdev->bpf.destroyed = true;
-
 	__hid_bpf_ops_destroy_device(hdev);

 	synchronize_srcu(&hdev->bpf.srcu);
-	cleanup_srcu_struct(&hdev->bpf.srcu);
 }
 EXPORT_SYMBOL_GPL(hid_bpf_destroy_device);

@@ -659,6 +668,13 @@ int hid_bpf_device_init(struct hid_device *hdev)
 }
 EXPORT_SYMBOL_GPL(hid_bpf_device_init);

+/* A reference to hdev is enough to use hdev->bpf.srcu */
+void hid_bpf_device_free(struct hid_device *hdev)
+{
+	cleanup_srcu_struct(&hdev->bpf.srcu);
+}
+EXPORT_SYMBOL_GPL(hid_bpf_device_free);
+
 static int __init hid_bpf_init(void)
 {
 	int err;
diff --git a/drivers/hid/bpf/hid_bpf_struct_ops.c b/drivers/hid/bpf/hid_bpf_struct_ops.c
index c90b689..f3bbe11 100644
--- a/drivers/hid/bpf/hid_bpf_struct_ops.c
+++ b/drivers/hid/bpf/hid_bpf_struct_ops.c
@@ -197,10 +197,13 @@ static int hid_bpf_reg(void *kdata, struct bpf_link *link)
 	if (IS_ERR(hdev))
 		return PTR_ERR(hdev);

-	ops->hdev = hdev;
-
 	mutex_lock(&hdev->bpf.prog_list_lock);

+	if (hdev->bpf.destroyed) {
+		err = -ENODEV;
+		goto out_unlock;
+	}
+
 	count = list_count_nodes(&hdev->bpf.prog_list);
 	if (count >= HID_BPF_MAX_PROGS_PER_DEV) {
 		err = -E2BIG;
@@ -222,6 +225,7 @@ static int hid_bpf_reg(void *kdata, struct bpf_link *link)
 			goto out_unlock;
 	}

+	ops->hdev = hdev;
 	if (ops->flags & BPF_F_BEFORE)
 		list_add_rcu(&ops->list, &hdev->bpf.prog_list);
 	else
@@ -324,6 +328,8 @@ void __hid_bpf_ops_destroy_device(struct hid_device *hdev)
 	int count = 0;

 	mutex_lock(&hdev->bpf.prog_list_lock);
+	/* mark the device as destroyed in bpf so we don't reattach it */
+	hdev->bpf.destroyed = true;
 	list_for_each_entry(e, &hdev->bpf.prog_list, list) {
 		e->hdev = NULL;
 		count++;
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b4fd482..827a0ee 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -768,6 +768,7 @@ void hiddev_free(struct kref *ref)

 	hid_close_report(hid);
 	hid_free_bpf_rdesc(hid);
+	hid_bpf_device_free(hid);
 	kfree(hid->dev_rdesc);
 	kfree(hid);
 }
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index 19fffa4..0db7f67 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -213,6 +213,7 @@ int hid_bpf_connect_device(struct hid_device *hdev);
 void hid_bpf_disconnect_device(struct hid_device *hdev);
 void hid_bpf_destroy_device(struct hid_device *hid);
 int hid_bpf_device_init(struct hid_device *hid);
+void hid_bpf_device_free(struct hid_device *hid);
 const u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc, unsigned int *size);
 #else /* CONFIG_HID_BPF */
 static inline u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type,
@@ -232,6 +233,7 @@ static inline int hid_bpf_connect_device(struct hid_device *hdev) { return 0; }
 static inline void hid_bpf_disconnect_device(struct hid_device *hdev) {}
 static inline void hid_bpf_destroy_device(struct hid_device *hid) {}
 static inline int hid_bpf_device_init(struct hid_device *hid) { return 0; }
+static inline void hid_bpf_device_free(struct hid_device *hid) {}
 static inline const u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc,
 						 unsigned int *size) { return rdesc; }


pw-bot: cr

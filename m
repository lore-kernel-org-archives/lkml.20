Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831088;
	b=0KHP5/15SfpN4CaQZBLOgGgEdhrT0T9tLF2rlpcJnzkPCvA8RJD3O0CDPAkQ15XjTW5R
	 v8pnK0FY25iSv3bg2Am+2kqEbu/076CqLjm70DXTnShgEMuTiXTJhrvj+MIlVb5CZMeU7
	 md3Unx/oI/l16z4+zr1pitYtblgd7RMh4vegCYTA2n/rCMlcdo+C14rR5tV7CnxlXahPb
	 28QCFfWcIpswofua2tOs1EqDuB6aIVpmBF4dZ6XUQQBh+9Pf7QSgp0PmRW8zSb7ZqtdNS
	 9FwAJMiKqWK2RNMZYBNGnvAMgIxoDgqH4DeUH2VczdVAOiejOAhUxJKCHkTjXHpe7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
	b=2/eO8kasApjljMUSGDt1Qh2b2Ehx5ThHTzOEJjI/YCUTEAjQo9IqqWLaVvwh3XlTXn+5
	 vwiweF8EHQArEBwBWONdwCYxD1O5F2L0T4EBANMd54jeUB+OsF9yUtbacf8JUgdTuH5Wa
	 9KqKwM622qe4jllwDS9UyGA3gq7Ft6wV6vFlYb1oM+PQ9sz3e1vajD3mBsCb1LuY2Gunm
	 ql3zYd8mmJvTHBn3i47olKqYNLB6lFoivmAvlef3hAvOMUa3DoGVwUq+z1fUXMbr0v6EG
	 JENH/m7KQEjYe3fydPQCtyYHsU38pu01n64T/jK/5wSglJU4Xf5bTcwJah7XwTGm9+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLMuBOBH;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FABA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FABA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLMuBOBH
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4fea434bso2210595e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831087; x=1793435887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
        b=iLMuBOBHWJFg453Jpz9ZxWwyULw3uRF4CDdHiWyWb2IShq0ecwM2MoTwTOmQrSVLAh
         ix8QJ+GRjMastfznE9JRbjLTwfZL2f9mA5UJ+VFSKDMtTsQw3tC3jQImNR89ENmIflFZ
         fcV+s3MASpXaRTY8S2c1rBoDEfaI2xSd7LST1d90bZ1/rgyYdEaVIM0jSQrrydCEex2U
         rkXA6/4Gq6ycci2ac376WkMcdTqf/dxl8r18n81LJdx9Q+IaT/1RWnPtOCfBpa05sCDp
         8zwo7TUIaWddxDKU4RSFs8TQpz2DWS2QRceLZtD77O3vinGI5lV7DpmnT08kY560mrfZ
         CWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831087; x=1793435887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
        b=tppUwL6PJi7SEdbj7WFB38C9vAewQ6T7BnoYn9F12LeDKy/SXNMdThl0bzwfygjetU
         r+aM8sJaezS4tW02WByBzRKH9FRdv3avPNJV/vEFPYHrqr/ltkrzLeFuz+b4teanQsv6
         yEzBAZ+o7fYnXX7uTj9vW5opBUYPWyQwHWYEZV0qCAnTxOiDoCW8y4WQxOj9t+Qx760t
         neTTJ0uajQmlET8gk9Gk3ghkxttvwL/A1wBdLoPLJ9LftBgCeXx0pMIZ9JNBa9+F3bT3
         ge4gy4DRq9Z7O0O9nKQWdCipzcSfrXw8n8zHqGPbmtRtCirHkMuunZ6+OoT0MzU+GbzJ
         DfNA==
X-Forwarded-Encrypted: i=1; AKwUvBy67CWpDTo0mJlVqP5pKtMjkZvkgnJkr5L2TguJEBtdi40t7vfar550lBSJ2NxpJogE8GYkijbH0WeP4Jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnpLVMl1m5P3JKkEVtccIrSKAK91OrISAZKRgnugqLJetdJ4v/
	z4FtWd8wxpI7CKMFyyY/QvEhBx0+mlEz0mWZZefg+SsDo5ConmMzdPJA
X-Gm-Gg: AYBFou2UA/JnkBbOYTtMrf6wL/DzuvlMrSpNObHfDgNtshrtFfAyPn3H6m9HWc2AEKH
	AAkR26RqLoYCbplZZtc0Eu3y3HluBiuV9pzW7hY2EGCx7zUqt0lpiwZCPnQWqDBTtYX+Nmlc1t9
	dKBcQMumkdXwSP8ztoSFRZO54HV0J6DHYKScMABbAvQQ5sKfOYx3LKHneag5SGoyslIkwYm5wMG
	xYCW39I+/rBWkHbwbau5/+xD9sBrp0wei/KNIZf9EftoLwNAbBMx6HqMKk1QqsIvPd6g0I9HNsb
	F3NsFlAQlCn4Orr/y7Krd2jbVmWPXkCK7KRmJOZyqql5eXcyKJLHbAdlQl/wqH8V8Ty1P0m6cpH
	gSOOUCO3mdhNI2lTErZZDEWxqYp1mNII0RiH9w60t5HaofwYYZCUEAZOtyn0eI7Q3myN3qYBePm
	AiMo3PkLQIZZ7gGhVNOy/IOQydEGX5Zz6Yb2vUndaM4vU1P7bp8Badjcz2wFXMSzIs+OmfJ9epW
	TYcGvhjawHg+KJvVUFcq84rT+Oo6hy1F94Df9v2STRF7VAiDuUvrEkWY2Fk+takevrdxJbQ0MB+
	TGhCurFSbdTz6wiykWg6h0NFS/NNq2Jq8I9HUaD6lx/eZlhyF3szflZ+PbvG
X-Received: by 2002:a2e:bc27:0:b0:3ac:4f4c:8da2 with SMTP id 38308e7fff4ca-3ac6fd3234amr3217541fa.17.1792831085835;
        Sat, 24 Oct 2026 01:38:05 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a2d324sm3122591fa.33.2026.10.24.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:38:05 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2] usb: core: hcd: flush giveback work on stop
Date: Sat, 24 Oct 2026 11:36:47 +0300
Message-ID: <20261024083647.2599-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
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

When an HCD is stopped/removed (either during module unload, driver
unbind, or an error path in probe), pending URBs are unlinked and
completed. However, for root hubs or HCDs with giveback done in BH
context, the work function usb_giveback_urb_bh() may still be executing
on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
and wakes up waiters in usb_kill_urb().

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
completing_ep or clearing the running flag) after the memory has been
freed, triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work has fully completed in usb_stop_hcd() by calling
flush_work() on both high and low priority BHs before deallocating.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() to ensure no pending
  work items are dropped, as suggested by Alan Stern.
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..e6854d67ed8c 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2787,6 +2787,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	flush_work(&hcd->high_prio_bh.bh);
+	flush_work(&hcd->low_prio_bh.bh);
 }
 
 /**
-- 
2.47.3


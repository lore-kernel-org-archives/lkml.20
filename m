Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CE1CD2C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483353; cv=pass; b=V+yx7VHE0h+478zPMDlvT+fVL9tDcXcB7WlEwq4jh0iI5nsJg8FraCFaww9we3uWsWpzFhrw1hOri//I1LbGTAhCL+ojb0q6tLzveGa6/bth42XW+3VrlJ/pFn7yDGlS9ZfcsPsvEIfzek1cZVVrlPR1q7QPN4xjoHAcyux2Ooc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483353; c=relaxed/simple;
	bh=0lpYs+0SMd/t3rfQna2KQK7enevRVV/qjLJ50LWU4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEbb9KJvKkIkWPUAixG1cRmzWg2mWp6itCJOZ5W63VgBZ9x2/xoXVKxVJNXct/4ajHvhoAdkE3XyCmLT+8inwcapLDzKGlqd+Za+fq7sEE1mvgyZzcPa4zgeswFW4Ml5F2i07a8Hd1MdT+JREQDGItgpbLDbo55a/xRxWyTQLNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdKYKksf; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdKYKksf"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f64ea07036so415432a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788483350; cv=none;
        d=google.com; s=arc-20260327;
        b=Kc/42E3Lk5R9CIyefyiARUu1LNk9FQEa7zBZBpnV7A/xEPxyq+G4RVQXsj1oFLan9U
         cra5uI0sHXpGxkVNHfGTIPcyDRsxLGB0pS9nEKUkLdpqBNhAmJsHmLCqpxIXOZu8qm4W
         laxfn3Mnyc9BR2aENVoZCHhdA4lVnWQh1kU0HnbgZyax4Ik2lxGPtOpPtdct8AG9Azjw
         c/JTw9poO4LpQwMQOi/sfTwRYYisPoVD/mNHc3WFp5ZAUo143yZhLQ2X0gIcp6l/glTt
         y2rSgiXQNQ1tYO6TZuid7nCi+/QsTEwjmEy7auu35cfZMikhJaF3XaZ3OuXH4PmgUNBS
         MPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b2FWJKV2IGmtFNZcy7f2OIRNyu0QStHoGtkGvfLTgac=;
        fh=0VBPSNOphdUKEBwdntpYwLTV6Zct2Zcwk3jEx/LRvcM=;
        b=ImodiNbHX9jwFUr+jywhlBzXS169ZKFJN3hMIvk9QFg8ohckx/ivvIT9QrFuKFV2PV
         4y/OtHmG3wbt+TTmKNq3T6oMg/0Yqyw3HYaJP280W47RfbAfvCtrnDJ2x0Dt7iEsR2VH
         XGn0ev4yasXlRuX+MhKI2u7iR2+0d8x8i3S9sV3uqN81hHILnIQNSGJQYClFsBAZsE7f
         gtLNeATRo2quzzfRNoft9X62KqVMMrBSkmqQuyMEuzXH2sjkqn2vQun+D5+GkScOzYXc
         bu7hlH7rfcyxVcrDZayfIC5ntNubeyuBXeoSFV6xlMGlMtktwoYDUiBFbxDK7T3YShyF
         Oqyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788483350; x=1789088150; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2FWJKV2IGmtFNZcy7f2OIRNyu0QStHoGtkGvfLTgac=;
        b=ZdKYKksfGPsxluG10GxS+51S6PCzcL6rSHJCKljYU0n8OtyhIbKXzlvbp5r4OhHoD7
         Oq7wE2zzZYxN3l5WA954WnElyHQhNsS6HpEUMde+R9nqWNcriY4kZANTWMSawUDF8dJU
         qrul8FPhDRRA9UE9MTmXO3H+Zh7FLjvFcJXwPGQv7Zry+5dgTZRcriRA3gEBDkoE8tB6
         egz044Fi/XeKvowMpJQ4OXwO9E+kGTjWBsxNnMdXexBlKZvOTX8hkUaKd9/eKRGVJ7lp
         bTMJmbGdpjeCQLscy3AUon/tNhp8QtbOTrVeNMlRT6Ria5M3dgtl9U89zpmWKII++WYC
         U1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788483350; x=1789088150;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b2FWJKV2IGmtFNZcy7f2OIRNyu0QStHoGtkGvfLTgac=;
        b=Ip9sDt0vO7lb/LZbHYOAvvmIj4C6BeKKXJAf+DG+rTaQiFqo9IxDJVHCsR37IMczkC
         s+SRrGzRrvilX+9iOYubzMrRDsYtFG2/Cj7Gzys1arvIxBH/bk9hDgJbxeSZRFsimFxu
         lYscUFr1v/VNnbBXrxIgfpfAZ9ZUcgLLNceNzlY1crp9u6aB+kNk1KYfU/bwMx0x98Du
         BPAK67OTQ+XCtuk1cPcwqEjEg2IPwuenf+2Yc1E1zBmxQj/N4XTzg8qP//5tWv1hB6X5
         Apo6ln13dFJBqhrHgW+GSJDyrRt6q9BMDvf8LZcVoFZ48JSrMqXO78AHohuyzQzxMgSy
         URlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlKn+tCYI0ocdR93rCBErywBuYKbmUelFzwm00c3CQdDPT2Hb12xtKCSA3ZgaRQ6c7p4NlzLH2q5gph8M=@vger.kernel.org
X-Gm-Message-State: AFuF++mAE+/Fbj86GlSXnI7Hn/aBoVFh1PispiXyuw8lcRXpw4bQ1SL0
	zVAG93agPRu6ea8AhkSjRcrv5viy44WoHgJJnVTyk2tkF7bC8RuzxS3BY3HHYxY23lpoVAaKtU/
	oKy5fHqnaGFVHr7HercvkAoNdx0lSTQY=
X-Gm-Gg: AYBFou1qhiUJfYsmcfMYpjHJkDnYuOnjOT2mVdlsM8rWziIVC0c7+FXr1JkF4mv5u9G
	YOPgphF64BQcWJq1F5useFdQiwLSDnIpf3oJByN0t5IAsLRe5gqu4kBI5Lrl+qmp29eu+9xMNNN
	+IrCTo+UW9UVIQVPXyCWZ0q02ZfEa36OLKAZh/FWOM6dcK8bMtL5aCgeyVIYvqjIl2WQ+cYxSdc
	UudFl5ICqgsDo8kfSUlecAy5kEhEKkFSMgb45SjimZkKlG7wsyjNGRMKjFogU5motY7nKnhu1hE
	TqvjofCHZEGBhsNC6UvkOlExRba7xRQfJrRkgEjJxASsZ9xLDHRafMmWbte13Wxnu++ynD14VzD
	neidZDrZtha/DmQTOGa0FYMLJ6MBZGhaI9YlTcamLB/8=
X-Received: by 2002:a05:6830:838a:b0:7fa:5c49:524f with SMTP id
 46e09a7af769-7fa5c495490mr620783a34.22.1788483350487; Thu, 03 Sep 2026
 17:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902235132.453044-1-mikhail.v.gavrilov@gmail.com> <947b663be7dded8a00aad6a277bb82eb8a9069be.camel@iki.fi>
In-Reply-To: <947b663be7dded8a00aad6a277bb82eb8a9069be.camel@iki.fi>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 4 Sep 2026 05:55:38 +0500
X-Gm-Features: AcwNN1Xi_wVYD0L91JvsounBFuKRljXsI-H3wpipPx0WFetbJvnCDU3JzHFgzCU
Message-ID: <CABXGCsMuYKVXyDN5avoxJTGf5-VPud7EctuZn7Z4p4wCbJq=JQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: RFCOMM: defer security confirmation to krfcommd
To: Pauli Virtanen <pav@iki.fi>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, nicoyip.dev@gmail.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Pauli,
thanks for the review.

> Sashiko review comment that security_cfm() cleanup should be run in
> rfcomm_init() after hci_unregister_cb(), appears correct.

Correct, and rfcomm_init() is exactly where it matters: the error path
runs kthread_stop() at the stop: label and hci_unregister_cb() only at
unregister:, so a confirmation queued in between would have outlived the
thread that frees it.  v2 has rfcomm_flush_security_cfm(), which just
drops the queued entries, called after hci_unregister_cb() in
rfcomm_init() and after kthread_stop() in rfcomm_exit().  The drain at
the end of rfcomm_run() is gone.

> However, rfcomm_session_get() could return a different session if
> processing is delayed. Is this a concern? ABA issue?

It is.  Nothing keeps a session alive while the confirmation waits:
__rfcomm_dlc_close() can drop the last DLC and rfcomm_dlc_open() can
create a new session to the same peer, both from a syscall, without
krfcommd running in between.  The lookup is by (src, dst), so the new
session matches and a stale RFCOMM_AUTH_ACCEPT can be set on a DLC that
asked for BT_SECURITY_HIGH while the current link is weaker.

v2 compares the session's hci_conn with the one the confirmation was
reported for and skips the session if they differ.  Comparing pointers
is safe because the entry holds a reference on the connection, so the
object cannot be freed and reused while it is queued.

> This patch introduces data race in read of conn->cfm->sec_level,
> probably benign, but these are not marked with READ_ONCE/WRITE_ONCE.
>
> I'd maybe take hdev_lock in rfcomm_process_security_cfm instead.

Done that way in v2: the entry pins the controller with hci_dev_hold()
and krfcommd takes hdev->lock around applying the confirmation, so
conn->sec_level is read in the same context as before the change and
nothing needs new READ_ONCE()/WRITE_ONCE() annotations.  rfcomm_mutex ->
hdev->lock is the order rfcomm_dlc_open() already uses, so this does not
bring the cycle back.

> Context analysis annotations would be useful here:

Added __guarded_by(&security_cfm_lock) on security_cfm_list and
__must_hold(&rfcomm_mutex) on __rfcomm_security_cfm().

I left the list_head member of struct rfcomm_sec_cfm unannotated:
rfcomm_process_security_cfm() moves the whole queue to a local list with
list_splice_init() and from then on the entries are private to that
thread, so the list_del() and the free happen without the spinlock and
__guarded_by(&security_cfm_lock) on the member would flag correct code.

I could not build with LLVM here - no clang 23 - so the annotations are
by inspection only, gcc W=1 and checkpatch --strict are clean.  If you
have the checker at hand a run on net/bluetooth/rfcomm/ would be
welcome.

-- 
Thanks,
Mikhail

Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4BE372691
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789250977; cv=pass; b=RMcJzEltpI4dJxEWnSn11ztD3Vqyoim92P2K2cA37Z9ZmUV/RvxKDj6QNb42siAE3LQOz7m48Cg8u6wv708DrZOLqx72zKdq2RU4wWnNxjmMHvt7YxJfbtp3fHUDCRbPHUo/IlcPl21jjl1bubYmg6/G2Vp9AvPB4uUQuqAQEx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789250977; c=relaxed/simple;
	bh=euNMuiJihVbGssVFL3EzLBt/V0FkgWJXXjT61R3oxVY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrXUTbYXK8gXTjHOnGkBo7Qsf81BcUGyzSfzejndTMYLfvGyJejwVFvpRPIp+pskAcJHs6J+efsNAe/ky2YVJZm2S4xytm9Kkc/VYtRDRrs9fIJl1sX4eyUVpkae0mRjtWThRnGO1RbFVeSTNIqHUlcc3vTRle6SXYnNpEjSwQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=DSRxWtkk; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="DSRxWtkk"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso18127241fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789250974; cv=none;
        d=google.com; s=arc-20260327;
        b=liU1d/jxsTA8TU8t1mQrhwHtCC93Sf+EBbvtr/pZGiHZi8DDZ2CqUrdmP9JFe6YCfR
         dyZtGuxnZQ14p+GhnrsTV03Evn8CDTJRuCbW07UbzglYjTDAmyaAd/aRk7NmcSgiwDCC
         hW5I8pu3e3YQbZgl59pa9kiRkY72++uvWGlrxagOHhcTSzLjTerg/wn0dqiDxedCgzlU
         9WvQDiSn6LRIzql9hzWQcG4jg2sCgpt3Nk2a8xlo6WtLdPgXP4Nvmh9uCZiguY3EdTd0
         to+Q+7LpR/9337vT4Hvkn28CTo3RTAF6UqaL9y5pBk8INcS6EDFymBky+e+xyZoPG66S
         KPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=RZbmvP+qAHLIy4TizlwHYTL6WfRhtQ5q2w+eUJNpL84=;
        fh=YU0/z453XAdCWbqO6IJpNWeYknQFaZVPTYoWdFs6LIs=;
        b=REMq3wMCCpm36CUdP6NAUIZkMG2PnG4ZoG1KRcml7C+DgHYjhwwM467BOAGCKQXguq
         M9HOnY+jNvug7TjtWS7oO3kwefTRdyE2VnifIMWUTV6xKtVQFTcy0dLfYDL4FwL8XlBf
         Qc2A7AauxvMlqxcKwJKgnr/T4t/IVPLM9xQwePx1utaIJOnL3YdkoixbkPKYAG/VQpT5
         JYYPMxQIzi3kRkNuyoSCcVu61WSKuQUkHgDkgid43qLQ5FtGHFaK5D7vFZdOsCNnJdMn
         cs0owe+vR7FBXYqgs6EX7XK8616LS5X0wpjaaiGo9IgcgfcS9FCpnluU7hbwP//6QEUL
         abgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789250974; x=1789855774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZbmvP+qAHLIy4TizlwHYTL6WfRhtQ5q2w+eUJNpL84=;
        b=DSRxWtkktBq5eN+ZupzhvQrZe4iI6BqmQ+kyo0yLvrCF46ngOfLuGPx9XoIVVZoSWU
         KHAGhoG5zyaaNSvC7G/piegfzeM+kRgyFhtqoWLqcVI72E5WMvnO/R87PRdBGY0uPE/N
         U3p/mCOflWHIRSGbq1DyA8P5nCTickK6BdDFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789250974; x=1789855774;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZbmvP+qAHLIy4TizlwHYTL6WfRhtQ5q2w+eUJNpL84=;
        b=ZIFB0yHFaV24sARC8xa0zsqEDdVYvUuDOY+c4zUuKiO8XOgfTv5JliimXN55/1xcvc
         gmYxzXs/wezZxRu5AoImipa6F/1heU5GmXYQsdpqFeB5UjrR9gJSRxCOYqW0slanXUhV
         dTR5zsAd67+gLCKaQdbcYS1tODuCqsF384Lxyrhe7TzWXDUBSohkhuwuetiNqI4MegvD
         Aq1ZMWEfOVGipqJ1lVcBEVSGT8ZbmBii96/vFeD2Bq6DDyIBdN/yjl25sB/T4KDKWItB
         rVk3YAEOJLDjvrxYn7Yht7An+fgUZLoRXrWxeDG+TnyAZ06SZP3uj84uthOLnOi9QbzM
         GJdw==
X-Forwarded-Encrypted: i=1; AKwUvBzPFl+AtSCccga4AgZbxY6o2O9EEjcQH3wK83JgeI2HFA7BN5rcYyCq18JOvJ3LSSVO+eUWN3NnLd/7fCE=@vger.kernel.org
X-Gm-Message-State: AFuF++lCtZk0SMZBAyjkGcZtqHOPGlhMPTx1NF9eOEl8UW4pKom4Zm2T
	kyTlMWm7hNeX5pgLuGLiKsvSgZeyC6ZZOIx/vbCb8hqrDGH4OIr5OUEJH7uJE24ecZEfsrV5sy6
	ymHC/ozMfAnSZeXqDzaBYx3GarZXUaXBTZ97vqUTW3Q==
X-Gm-Gg: AYBFou076Uw+HrBD2c5z05exgI5CSXoufysA1QyfkPk9QwQblRXGRKkiedd4kEiNvLH
	EoKEXa0irIIFEnxA//7JV1envwNVfiH+A7myRRlBH2IPJsSMIvmjH1UuRTnpKhIR90XM/iu+hZ0
	C8DTDGlI2dAt7Pg146KZ7h4D/zDSY8C/Lk0DVXRuXrtOboD3Wv5cv4ehLLRS5/dDlXFp0onSENs
	qC7cEWi0CpdC4lfVjsCIyflgMoiPBgUmjJhJux3BvXE2yIQ7oUJODtgevUbFwc2l8YnmvLTjO31
	o/z2eCPgWNS9jSBOE8CuTEMjtWhNOsx8i5J88WgcJuQW9xW2zUqJ
X-Received: by 2002:a05:651c:1507:b0:3a4:82b7:bfcf with SMTP id
 38308e7fff4ca-3a5be03fbe1mr44171fa.0.1789250973557; Sat, 12 Sep 2026 15:09:33
 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 18:09:32 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 15:09:28 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 15:08:21 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 14:39:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: kimwooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <CAH1Bc_yJ1e_nHk9tP2qP_4D8MHEve1R2EF5cYCEXRwc+1xVAxw@mail.gmail.com>
References: <CAH1Bc_yJ1e_nHk9tP2qP_4D8MHEve1R2EF5cYCEXRwc+1xVAxw@mail.gmail.com>
Date: Sat, 12 Sep 2026 18:09:32 -0400
X-Gm-Features: AcwNN1VkoWc6yOIu-iP_4EECwaDJOmBbluOYtYWHQpuN-MgHe2ykg9w1FFygbkM
Message-ID: <CAH1Bc_zqe_a93WcmksWBfmBkW2JGdhuRHcLECpLtznXA_dTWEA@mail.gmail.com>
Subject: [PATCH RESEND wireless 1/4] wifi: rtl8xxxu: free RX skb when URB
 submission fails
To: linux-wireless@vger.kernel.org
Cc: Jes.Sorensen@gmail.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b18dc1065b5074df"

--000000000000b18dc1065b5074df
Content-Type: text/plain; charset="UTF-8"

A failed RX URB submission can leak the skb allocated for that attempt.
rtl8xxxu_submit_rx_urb() allocates the buffer and stores it in urb.context,
but if usb_submit_urb() fails, it only unanchors the URB. The RX worker
queues ENOMEM/EAGAIN failures for retry with that buffer still attached.

On the next attempt, rtl8xxxu_submit_rx_urb() allocates another skb and
overwrites urb.context, losing the reference to the previous buffer.
Stopping before the retry also leaks the buffer because pending-request
cleanup frees only the URB.

Fix the leak at the submission failure by making rtl8xxxu_submit_rx_urb()
responsible for both allocating the skb and releasing it when submission
fails. Free the newly allocated skb and clear urb.context before returning
the error, so neither retry nor stop receives a pending URB that still
owns a buffer. Remove the caller-side skb cleanup from start and the RX
worker; those callers now handle only whether to retry or release the URB.

Fixes: 26f1fad29ad9 ("New driver: rtl8xxxu (mac80211)")
Assisted-by: GPT-6 Astra
Signed-off-by: kimwooseok <5mghybrid@khu.ac.kr>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

--000000000000b18dc1065b5074df
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-wifi-rtl8xxxu-free-RX-skb-when-URB-submission-fails.patch"
Content-Disposition: attachment; 
	filename="0001-wifi-rtl8xxxu-free-RX-skb-when-URB-submission-fails.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: a064dd4dfd1042e1_0.1

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5j
IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGw4eHh4dS9jb3JlLmMKaW5kZXggYmRk
YmQwOTkwZGU3Mi4uNzk1YTVlYzJmOGNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvcmVhbHRlay9ydGw4eHh4dS9jb3JlLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVh
bHRlay9ydGw4eHh4dS9jb3JlLmMKQEAgLTU4NjQsNyArNTg2NCw2IEBAIHN0YXRpYyB2b2lkIHJ0
bDh4eHh1X3J4X3VyYl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAlzdHJ1Y3QgcnRs
OHh4eHVfcHJpdiAqcHJpdjsKIAlzdHJ1Y3QgcnRsOHh4eHVfcnhfdXJiICpyeF91cmIsICp0bXA7
CiAJc3RydWN0IGxpc3RfaGVhZCBsb2NhbDsKLQlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOwogCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CiAJaW50IHJldDsKIApAQCAtNTg5Niw4ICs1ODk1LDYgQEAgc3RhdGlj
IHZvaWQgcnRsOHh4eHVfcnhfdXJiX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQlk
ZWZhdWx0OgogCQkJZGV2X3dhcm4oJnByaXYtPnVkZXYtPmRldiwKIAkJCQkgImZhaWxlZCB0byBy
ZXF1ZXVlIHVyYiB3aXRoIGVycm9yICVpXG4iLCByZXQpOwotCQkJc2tiID0gKHN0cnVjdCBza19i
dWZmICopcnhfdXJiLT51cmIuY29udGV4dDsKLQkJCWRldl9rZnJlZV9za2Ioc2tiKTsKIAkJCXVz
Yl9mcmVlX3VyYigmcnhfdXJiLT51cmIpOwogCQl9CiAJfQpAQCAtNjU5Niw4ICs2NTkzLDExIEBA
IHN0YXRpYyBpbnQgcnRsOHh4eHVfc3VibWl0X3J4X3VyYihzdHJ1Y3QgcnRsOHh4eHVfcHJpdiAq
cHJpdiwKIAkJCSAgc2tiX3NpemUsIHJ0bDh4eHh1X3J4X2NvbXBsZXRlLCBza2IpOwogCXVzYl9h
bmNob3JfdXJiKCZyeF91cmItPnVyYiwgJnByaXYtPnJ4X2FuY2hvcik7CiAJcmV0ID0gdXNiX3N1
Ym1pdF91cmIoJnJ4X3VyYi0+dXJiLCBHRlBfQVRPTUlDKTsKLQlpZiAocmV0KQorCWlmIChyZXQp
IHsKIAkJdXNiX3VuYW5jaG9yX3VyYigmcnhfdXJiLT51cmIpOworCQlkZXZfa2ZyZWVfc2tiKHNr
Yik7CisJCXJ4X3VyYi0+dXJiLmNvbnRleHQgPSBOVUxMOworCX0KIAlyZXR1cm4gcmV0OwogfQog
CkBAIC03NDEwLDcgKzc0MTAsNiBAQCBzdGF0aWMgaW50IHJ0bDh4eHh1X3N0YXJ0KHN0cnVjdCBp
ZWVlODAyMTFfaHcgKmh3KQogCXN0cnVjdCBydGw4eHh4dV9wcml2ICpwcml2ID0gaHctPnByaXY7
CiAJc3RydWN0IHJ0bDh4eHh1X3J4X3VyYiAqcnhfdXJiOwogCXN0cnVjdCBydGw4eHh4dV90eF91
cmIgKnR4X3VyYjsKLQlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
CiAJaW50IHJldCwgaTsKIApAQCAtNzQ2MSwxMyArNzQ2MCw4IEBAIHN0YXRpYyBpbnQgcnRsOHh4
eHVfc3RhcnQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcpCiAJCXJ4X3VyYi0+aHcgPSBodzsKIAog
CQlyZXQgPSBydGw4eHh4dV9zdWJtaXRfcnhfdXJiKHByaXYsIHJ4X3VyYik7Ci0JCWlmIChyZXQp
IHsKLQkJCWlmIChyZXQgIT0gLUVOT01FTSkgewotCQkJCXNrYiA9IChzdHJ1Y3Qgc2tfYnVmZiAq
KXJ4X3VyYi0+dXJiLmNvbnRleHQ7Ci0JCQkJZGV2X2tmcmVlX3NrYihza2IpOwotCQkJfQorCQlp
ZiAocmV0KQogCQkJcnRsOHh4eHVfcXVldWVfcnhfdXJiKHByaXYsIHJ4X3VyYik7Ci0JCX0KIAl9
CiAKIAlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJnByaXYtPnJhX3dhdGNoZG9nLCAyICogSFopOwot
LSAKMi40OC4xCgo=
--000000000000b18dc1065b5074df--

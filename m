Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85E511E7F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542180; cv=none; b=t+U+tIAJ+Y2whfYDTQx6qhoKt9Q8kuPQWux0i+gc0QBVDwr9q0kR1RyfErzhyMF6o+o5nUjkdqvAZZSmvjzZck/6b1ddmAPDVKp+c+8nmCj90FrwNYF9IWgumgOIWQECR3tqJC5mqlj+BIoThEvWgI+B51u0r5Xngu6oVsv7FPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542180; c=relaxed/simple;
	bh=G+GFIjnCZ3YyuiaSWyY0S/quGmILiAjsmkVR5HblglM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=prBbYPcY4gpdC5/R94SNgyqnCfWElzWs71SU00yQfEJEc+NcOJnC+wCXuTPw0GP7bxl2kAcny9Qja32anpyyQl78j6tEuQMIJqChroN0cESBIIWsEUwvljSSvZh9zp8QXJlAL09QhY4O3gRmYRxZQzw8Oko+NBgbSB6vTY8j4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFf5VU8r; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFf5VU8r"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a5d46edd1eso1285282a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542175; x=1789146975; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g3ixuSdmQCpOEGBBcnV25oj0cDJNzVy8Tk+QtmySWs=;
        b=RFf5VU8rvFCBmxsEt3H4FrmL6qsHiOj5t2IeDhLiLKgsez9wdHgNQlRAc9EQqInwCM
         1U35WwB571Q+M3S52yddUPJmNkNPJi51VCzpL+ISNSJWi6hglutQ728qhoP6CqjfSRj/
         3uYwhZnjkh5eF5WvUaxnIBNRk4e+SP8PdEagjxCEKu2AZAJ47FMcG7LCKnCHNN+WX4nn
         3rYHSAOdd4JE6QvqCz8GTtt7KpUGQTsIEmzyd2A6pOospuqnNwexrR5y2zEAiMhogQQ0
         e+ETQ3hbLBXU6d//RlNdap/3FoPugbqa20Wzf2Qh8vogpl2O8AGjrbYAMv0vSlVMUJ+/
         sDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542175; x=1789146975;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g3ixuSdmQCpOEGBBcnV25oj0cDJNzVy8Tk+QtmySWs=;
        b=aQM5pL4RWz6jAQiRuAh7xLyrYd6TGK1fk789He78FupK+yhZrtrtVRRSBkgirxS+eA
         U+JwlYk0eXRH3Ax8DogLIb5ppNIVP6Ysa5ryMUZBOKU/WVgopB7WXj5hQe6dtcBsaPv8
         WF3wXTS1knyFvo+fr7M2zfrCgfwHBQ8eSGOUyOn5uGXec5oMtUS1Lfc02rqwlGdEfUUm
         0jLWzoWV7T9ObZOkW1ipviDvFs9xaTkNL0eeEarrmpGVm62EPp7hx0CCjeeDwSm2ayxM
         KFTII4kPBKIMNqzgo8/yMdqQv3vO/N4kMKTLNBiGmZu4ZAOPy70Dw+anHvQ6EMyrtNFX
         EMfw==
X-Forwarded-Encrypted: i=1; AKwUvBzmDMV6GQnC6zmzAfYq6ziM7AZAoV5PfgDiKgcfxLBzMq6KTeZDGEuZMjNFv1KtiaU41N7k5E4bEp5O9zM=@vger.kernel.org
X-Gm-Message-State: AFuF++lTz4tOvW8GzKYg3uRhr1aKjcXCii2+AZd5gHdZYWOgDW2AWJbR
	oTezTUjR17MX+r90VE9wxfaCa3X1T2M5momrSECRiTWgxdBVY0pdvJ+TcfDXyVgPAspx2jDNGPo
	o9gzGzkJWvApqvd9/MQ==
X-Received: from edgi4-n2.prod.google.com ([2002:a05:6402:a584:20b0:6a5:f01e:c622])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3203:b0:6a5:f9ab:bdfd with SMTP id 4fb4d7f45d1cf-6a7e8cb104fmr3745516a12.0.1788542175250;
 Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:08 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-3-tarunsahu@google.com>
Subject: [PATCH v4 2/3] firmware: edd: Fix kobject reference leak on
 registration failure
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Per kobject_init_and_add() kernel-doc, calling kfree() directly on
error bypasses reference counting and skips the kobject's release
callback, leaking the reference.

Use kobject_put() instead of kfree() on registration failure to fix
this.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/firmware/edd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index f980c5b56858..763e7b16d517 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
-- 
2.55.0.979.g7e5102b832-goog


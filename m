Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646578;
	b=2+Ii6k/TP5ryyEGZzdqGu7fvKklICh0mFno9bUn8ndDCmJPT9v2h2FDwQklr6WDQ6VgI
	 jg9gC5PVpVev+KQ8mPy/PgsAOxFJ6dR8qYVJHZ5RX5McXiF4JwcKr+jvc3ljmwyoSy5Li
	 lBGbN6NPOXUu2mIdrY8n5RPCUNVuf1hLOVfD0fIh1xMINC/9tDVCSCfiKL6YLgU3ow2tV
	 ArmQPcni0EaqFVoedCpUYND0YLMyx9MIhqR+qF6RCOzwhfEqUPpe6CghRRS2/6tH2NSEv
	 /o9cswSi+1k+R/IWhLNRJZrSmXNTsxSN7WVUCUUnAedIIizvlKY1IDsGz5n0Schq4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
	b=rged0SNN2lIVN0ROG8sd1OT11XL9iVwohPcqWmnn1OLfhwf4wEnpCTqg0Na8uRkqqVp5
	 8Hy+lZjnWw+ravVZJCvffW1wBnuthMq53StVX5lb7styHVojb/ld8bV02+OaKX/lgUfQJ
	 RulVmtJQQQZ57N7Rdw77PDdBA8ys3zNr0XQ/4/zpVK9vgdw6HiVvX8RLbGbLTikH3StiI
	 xZxWDL0qrnL0UkDQq/OVB5NEYHCa4RDfvLAAjz5SCCHzwxcwQUa0HwE/Hn3QzRSP+faX2
	 TgL7Hc0NZLG2gYBl5EkeRk4Zb7VlMXyKsYxZgt4cTYypNr7vWGtOfNqoPrD6X0TaiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hidp6np1;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF425606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF425606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hidp6np1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso952542a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792646577; x=1793251377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
        b=hidp6np1w4lB6HvB4Si8+x6PctJhO0E1dOFcIJFC2o0MHK9y7sji6ZxtWZgEyEOyDq
         nbxODKk3yS0bz5HTvgEb9IanfwRBTH6Sp9h5CHXgVtzFHRD9Q8j9HuXwkHauQlyrbGre
         VMKzhVwi51OLIvLOc1Yx6zt6nyYykDcjSPma84qMJppCtocQNdOzKUORpcf455JdGo9W
         hUe6DLPXuvxvXG8PZxhQBfGtON7/6Pv5qJj9HXIzH3rC1UwS7wEFOskqW9I2tYmD91XB
         WHcF22ffR1ywWpz9OV05MScfYOEfwjh2VUQJ52wy47CJHcogaqKegEF6xeN9gVLK72dF
         /NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646577; x=1793251377;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
        b=c/LT6WlNh0L1zOfMCuy6/yuC3qibWekLdDVDm+6+Gxz/4i78opPQ4et89rsqAxSkkQ
         GoA5GyZC74YkhYjuvpWsPO44UNqSQyIiZnSanZGBBKEFy00Al8hdfDbAIJ5XOk+k5lfC
         JfkIafBbHjzQRc3RnVUdwo0l1kj6eNUGmXuCgMNYy35L2DAv0SS5Cg35Y9HiaI840d7V
         atVugSExvUgVU73IRmSmnq0eNuLxq7aje6rbSYqr++G/GSZvvrYXsbOG233b2n1o6oSy
         TUFxCKQR487/+DAx/ouY7WEH5hBIarp7EvZxeyglE4mbo64BYHac03VgucH26+zXHi0Y
         jRzw==
X-Forwarded-Encrypted: i=1; AKwUvBzXIzuDhzHyxDCwsTI2eP0xA4hdXKCCeM3k6v8pl4CU8dlXgC+PM8C8fl2kpmAhOWotcuJzc0U3PGaFdsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcvbiyLEEFJF3oRtQk02wHSdOcJwEmMilO0ILMPWS+deKAFhBv
	eL4K8206yNTKthBi/lkjDMWPGTpJDDXRa4EBWHqMdUPGBMTQOUGxl2l/mc3jobRimw5mTA7p5qT
	7gaoAYGcdQlaPp5rXmA==
X-Received: from pgme24-n1.prod.google.com ([2002:a05:6a02:6c98:10b0:cc7:4919:5ed9])
 (user=chihsheng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6e86:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e287b9dddamr2850752637.2.1792646576926;
 Wed, 21 Oct 2026 22:22:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:22:45 +0000
In-Reply-To: <20261022052245.1138709-1-chihsheng@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022052245.1138709-1-chihsheng@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022052245.1138709-2-chihsheng@google.com>
Subject: [PATCH 2/2] selftests/memory-hotplug: Use $(id -u) instead of $UID
 for root check
From: Darren Chang <chihsheng@google.com>
To: shuah@kernel.org, david@kernel.org, osalvador@suse.de
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Darren Chang <chihsheng@google.com>
Content-Type: text/plain; charset="UTF-8"

$UID is a bash-specific variable and is not defined in other shells such
as Android's /system/bin/sh (mksh) or POSIX sh. When running this test
on environments without bash (e.g. Android), $UID is unset and
'[ $UID != 0 ]' expands to '[ != 0 ]', causing a syntax error.

Replace $UID with "$(id -u)" so the root privilege check works across
different shells.

Signed-off-by: Darren Chang <chihsheng@google.com>
---
 tools/testing/selftests/memory-hotplug/mem-on-off-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index 611be86eaf3d..11fb70bf1833 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -10,7 +10,7 @@ prerequisite()
 {
 	msg="skip all tests:"
 
-	if [ $UID != 0 ]; then
+	if [ "$(id -u)" -ne 0 ]; then
 		echo $msg must be run as root >&2
 		exit $ksft_skip
 	fi
-- 
2.56.0.257.gf7497c7d27-goog


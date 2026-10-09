Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E053EA976
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571272; cv=none; b=D2WgP++D9YNwZqBz2wadcNxUE2OkKBQE/GJCjOiEgiJbYImDZoCjZANGz5lF0NUoH/W2kShOtVaSgUHtcURbadBEcKEZI0PoXEjbVUr47ioc6Wae3Rh1f6efEIC5fv6XJRKwXHG8zizEcpARRH0BVwAQi+0irn2r951OPbpkvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571272; c=relaxed/simple;
	bh=51IUJ7oH2GDK0isWUJ8WivKZY3H+6fuok9bV/QpC9Rc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=nf5kyYSeNX/Vh4Fbn7CME6UpI8iKUn4tQMB7DeQTjjQZhjAEr9kzzEPuwE2g0jxdwePlz8v/ysCWwpXSM0ER/fKaNvpXO97LJiuJ1XEafcZ432jNpYxA/0r5teQet9K7ns+EdZV+VdC/wP52dkFNQ6IJwY0HFL6NmNBIAVM5UGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA3j6mVD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA3j6mVD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2189a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571261; x=1792176061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7IaqPQoEOi+imp/PK24+/AW3BiTVn/zY6gW+WBVBCE=;
        b=BA3j6mVD5e+PCI8eZX4xwf0R+z3JEUR4vmzNqItQ9Ec/YBmpkbSJgX6qnm07C9YgP2
         pzLILEDo6wyHmbjB/NW7/Wyqnyg5ISfZHiF65M/27KSHzxhKHdS7s/nLI1BChRDrQdwj
         IX42spVLHKhguGVXnUnNRXdxjH4lBOSDfs4UjcVzQbxxfJd6DdrhoeqFVK4kf3eVTkAY
         jtHFN2lVGsehCJWqKtEZyvRgA/azXYGYeYE52wu8KOj2ufjJlpaQAKH7T4X08s9gswmD
         oHMdk/EgrtqX7JnJENcB/M6XaEewa7NlX6h9qJVs02YxV7ICni0jrJ8Pdo014LqxMxbB
         yoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571261; x=1792176061;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7IaqPQoEOi+imp/PK24+/AW3BiTVn/zY6gW+WBVBCE=;
        b=UW4eaFN6w9jjTLAMfRybUFOr9+459JxBNB81VJ2bDvFzoy/FI2NkFj4WYy13g4nXRF
         CZ3f3U16c6JEdVnj+jUfUCYnOJ6CgEewmQNxzVdnppiJHa4tPRkt0JrqAwbsAy1pSqZF
         1mUU2M1dOiPHALibYfjSgaapHPORwROYKsCTD6nB0FnE99Od+wOs62pj1yFaIapr/lwW
         6BTkX/Q/Ot3fjBPDXcCzdgI32w8nwzf5tDxxpLFpWRLv4e10lbRuJbq1weypCymzZxwb
         vwxg51DqhvFWylBKsUlWncg8dzuDJ8D1UOjmgxGCkh1JWLxiSjvTadW1Zqzqp519S2TL
         o2TQ==
X-Forwarded-Encrypted: i=1; AKwUvBymlZnTbWxd5aYWO0ztS4mTH1L8AGviJjYoVahaB8n5vNZ3SdbwS3pJjrUvHA/g53wAJ1hLHurCxZ7e+2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm8GU84CWtCx28jjaRxkX7yQB+F1B0MynWTlmuQvQq16NDc2ka
	aDgCYzAqG8tZ2ZnZ508C61iuZ0ertx0CDWsRaxcxwAEv7rbjozOumci7
X-Gm-Gg: AYBFou2/BME/7f8bUCfPjhIJUty0clETHcxgNU1Yo3KpDd2ycHNSoVK+JGRAxXembCb
	WMs5Du/X9veIiNoUSlLm9rnKsIOsLGKyiA47ThJVQfWgef2laLRHcqblrOYc8JQsKVDbsztWiYj
	T0RX6bo8IHeAIST18CI1D3uF6UhAWm4wluFTzV5ytikG/vGr8u9NcR5v9zG1dmbAQjbg3+WYyaX
	1xCqWt/GuRi0Xn6fB+gRh2bIjzXtiwXRFmMfqCtIelPUhMsgxKmSt0/1CuOR4j4GU+Rp0zxiYgQ
	4NzCUt+nVdgExGHb1U/22rzjX8O2dC7YPUFmeTF8MATBnqVySoPCnnpQL2UzD6STtQQqczn1DLZ
	7UgCubauAYOL/OtMIrcLOrpbH+Ug1xBMGYXUmMUKH4hvp3Fb9aSFDkLhvyhfeLq8UXMDgyEgTfX
	MJqaTt9eY2ElzPduGS7mjddTb/YVLXcdQnlx4bUxeFWXTyu8uSMRO47UOsRam+jqh8nDs/40BPT
	JJ5MNP7+mhwZ2KOnUa4URsblvVH5JJid71ImCaTDoTfinjGyeOJiPuGJCiPjdChyBYYxEyiFu28
X-Received: by 2002:a05:6a21:70cb:b0:3de:b120:bbad with SMTP id adf61e73a8af0-3e16be898a4mr2712134637.15.1791571261345;
        Fri, 09 Oct 2026 11:41:01 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1ee81sm1513576a12.12.2026.10.09.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:01 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Fri,  9 Oct 2026 11:40:56 -0700
Message-Id: <20261009184056.7382-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have changed.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. vmbus_sendpacket_getid()
has been added. Update the documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2:
* Add vmbus_sendpacket_getid() to the documentation. [Naman Jain]

 Documentation/virt/hyperv/vmbus.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..9c5b712c6e39 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -141,14 +141,15 @@ Three functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_getid(): Similar to vmbus_sendpacket() but returns
+   a transaction ID that is matched against a reply from the Hyper-V
+   host. Useful when the struct completion (or other rendezvous data)
+   must reside on the caller's stack. By invalidating the transaction
+   ID before exiting the function due to a timeout or other error, a
+   late arrving interrupt is assured to not trash the stack.
+3. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1


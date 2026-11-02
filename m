Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628752;
	b=DCNeABVYhMp0oJEbGUaFRHvDQf1EudBANDoDOYzIP7Hi+o1ctYO/wzMpof3f/mV9xrgo
	 J12t/JSeD0K275/GrgtuSvSMp52p4BX0zRrWUrudJJKwjON/zfdYiLRq2gyHDMAGv3JXp
	 FyTq1v5nzDRLSSEdrw3cNucPL70pHl3wzLCnxcWgWC+WmbDnS4R5CiMPj32Y4RSezqkFX
	 BnGUwSxfF4nsDVDxXWe5vbWCf6XjAFJg0O4SLPMu48n6Tvt8KZU4od9wgqfKGL5bMdAkE
	 7SHXwS0LveTOzQVFjgYHl9oIZ5FGxiJYQY0/kEaxnKn1S7o9c30Wg0aHP1rWmz3yQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
	b=lMzw713hOD30tf0dhmt51jhVDaQr2lzZ20rlcVsqDRSm4eYe6K1I2sDEx9Rr3AqBlNB0
	 91MCd3L6NSUReDd9z1sObuXfBhny9vsD5lXqY4Y6iguJjQhEFGGnzYWWIyIzobpD8Ki/Y
	 7qkhqiNgFu9p1ROHgFhwA+t5Ks2N1g5RfMTHkKxK3t76KblKcd2od6QKgglLND8BNYvr2
	 rrq8d2TAvCciH/tMH3l8t2o0djHQ3SmaPsJQiu3BYSovfQvWVkxHCo9fSOIANwWxDeYFR
	 NCckwaVIJ5s2tompt0ro3ixUymSgWYtZvML/6DMQaEF5n9AFhPkxvr6KEWFtspO8ihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjBr1QvG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1A606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC1A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjBr1QvG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so29229305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628750; x=1794233550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
        b=MjBr1QvGw/hSP+7fmOIv/+UqxRzouqXeL5Rc9wi0vwXc8Gw9jT1k2KvqwvZbrNlecV
         Gn90XCo0DxTXIB7ea1vWy2ah0C2kr0/DVWldbk7wpllypNV8yb+tAPOO6fY08CJjfQmF
         vJv3IYocml4n39C4eO471IR/h31593CfU9WeDKMzLQxsK8Q4xOQJvNDejx0zPLfb1i2c
         /kSgh3XzidqVz511zR9applROIlHNDWHsDfrAZm7hHjdDkEEeeGWNS9vj2R3FYe+BQ24
         PNCpiNzs9NDyL9BrHWMqg9kkQ8Mng7u7jGKtB8/DQ/Qc46f5XkUgpGXfrsBbgy2UvkLi
         pfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628750; x=1794233550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
        b=yWNCnBnOiUNPlaW0sfKkho+XRApK97xhmSTEqDjh4w6o9DIeH2AAhxzNW8JrQWaI5d
         rIt4+0idwOTHkjeukl8V2KwzWi7FZhKHuXBDHebqY3dXSc9Ia0vWAhC0v1SWVD1BQdoS
         EoOf8pziPFcQu5K/71sfPByqfFALg7LNgCNzNmSra0o3qgfhHrYswlvfAJU2K5RiayjA
         GDuZsygS7S2o6Ij5Z+CZK0pjxJsc/RnctCi2YJNRxHIqy34YNaWGFyHiGs9QIQg7ZvEb
         82iAKgryrt8H6TCf0mLkvexoIHTa949DmCSMioMO5/Ie1FRnAHVZzX9zkbVKuzyGU99F
         /1Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxOBgtwwphNNA5tOyMgOnQn74WNUNdL2dellKfebR0Q2lPyLWfB2l+19p3rvyNRV3bW+X1Nnbu8pnu7YJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjMbyqx58s2If3YT5cCvlIGvFN1i1sZTYMu79c7JUvvwLYUUoh
	rI5VisvlUlhNqvQBaB2WqQhQbusIpeqxKBNtJTjCJ2mjo7O5pkxCdS29WZB8oDp5
X-Gm-Gg: AYBFou0jZk9UGfuXywpk10ln5Fl8QIlhlKrfQnerHBUS8f1yk+eq29bIGF4iz1TFP8X
	jsZ0asPugikwDpohNNeSTk5Z8CufXevZTaTVef/8Gtq4HW+Ok9i0oF8LXIhc5lmtkEpq1AsDfPO
	mueQNdwCv/EN0JNw/a/g3bFy597SK+B69VmKK+hARGVIWYR4RVCB1oVz20IsxCIso01rcx8rNGu
	Wy3Fl+XhKawaesTCC+BcSUZWStID1Gc+vZXWepWWNzNFUht0ZtJThF7DrVE03P3RtPHoFWmQaD1
	2vLPJcKEMrK39eCVt/cynjBIyeiOvKOefONQhqH6V7bxgV+y2N7QDLJP6cROp97tA0YYWyuN2Mt
	D7StMO8Tc1gVMtQppESaAvFNDqTghwTe9QrqyL/Nc9VSsg6hAtrRJVP0FY8T72UPVlikibhN00x
	tZUFSmByMh5FmHqv0VwZUxdF6ioT1Q/AH2uwAt7P2Rceg1AjGKH9zkM0zwrDQByqgn/zWzw2lbe
	bR9ZHil8SUuVboPWW0GeclOlnyuZnrnsiBv5CMK2T4RMutn4KsnFuDQYthysd/z5bKS2NRBq40C
	zvb8m2BLrmD2bAPzfLrIxLuyPc9+lZTX2ztZVmBlC3kBxMtO5g/QN1FJdFZ7/YHb7/ugcgyadeM
	WVTrfjWOaO3NS+CVbIt4ZxqcJ2JfTNngs9xRj
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr219933115e9.32.1793628749862;
        Mon, 02 Nov 2026 06:12:29 -0800 (PST)
Received: from x1e ([196.189.89.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm301441565e9.15.2026.11.02.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:12:29 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: vireshk@kernel.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: greybus: fw-management: validate firmware_tag is NUL-terminated
Date: Mon,  2 Nov 2026 17:12:21 +0300
Message-ID: <20261102141221.87646-1-marehone12@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fw_mgmt_ioctl() copies struct fw_mgmt_ioc_get_backend_version,
struct fw_mgmt_ioc_intf_load_and_validate and
struct fw_mgmt_ioc_backend_fw_update directly from userspace via
copy_from_user(). Each of these contains a fixed-size
firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE] array that is never checked
for NUL-termination before being used.

While the array is eventually copied into a Greybus request via
strscpy_pad(), which safely bounds its read and always NUL-terminates
its destination, three error paths print the original, unterminated
userspace buffer directly with "%s":

  fw_mgmt_backend_fw_version_operation():
    dev_err(..., "failed to get version of %s backend firmware (%d)\n",
            fw_info->firmware_tag, ret);
    dev_err(..., "Firmware with tag %s is not supported by Interface\n",
            fw_info->firmware_tag);

  fw_mgmt_backend_fw_update_operation():
    dev_err(..., "backend %s firmware update request failed (%d)\n",
            tag, ret);

If a caller supplies exactly GB_FIRMWARE_U_TAG_MAX_SIZE non-NUL bytes,
"%s" has no terminator inside the array and reads past it into
adjacent kernel stack memory until it happens to find a zero byte,
leaking that memory into dmesg.

Reject the ioctl up front when firmware_tag is not NUL-terminated,
mirroring the existing check already used for the equivalent
Greybus-module-supplied field in fw_download_find_firmware().

Fixes: 013e66537273 ("greybus: fw-management: Add firmware-management protocol driver")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..2ee609dd67fb 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -419,6 +419,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 				   sizeof(backend_fw_info)))
 			return -EFAULT;
 
+		if (strnlen(backend_fw_info.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_backend_fw_version_operation(fw_mgmt,
 							   &backend_fw_info);
 		if (ret)
@@ -433,6 +438,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 		if (copy_from_user(&intf_load, buf, sizeof(intf_load)))
 			return -EFAULT;
 
+		if (strnlen(intf_load.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
 				intf_load.load_method, intf_load.firmware_tag);
 		if (ret)
@@ -457,6 +467,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 				   sizeof(backend_update)))
 			return -EFAULT;
 
+		if (strnlen(backend_update.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_backend_fw_update_operation(fw_mgmt,
 							  backend_update.firmware_tag);
 		if (ret)
-- 
2.43.0


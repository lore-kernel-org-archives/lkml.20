Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46DC36196F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852721; cv=none; b=tLip253F5gl0MgMpW6cborPw6l2KTzE3lXY2W0AgSM+eSqlFFVqC2Bqs8GsZMALx0tO0ATaOvijLNmXOkg8UK2ARB+WXedRnEzrHL0r9BekEDuelTQqzHf69GV8yINQofwtFAl29qjBMYKI1NPb70xQNx/7ST629vWRgrLGa9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852721; c=relaxed/simple;
	bh=lqdZGDTB4L0Ao1dxI8JkrdZ9qxvRDQT85KWSJ1iE+pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SItGXuxlUXVYhGmTRVTFjd395W6+7QE7Ek+rEmm6ZPWPDyKa81BGUEplJCc3Guc2g5ktHl9o7vK6FFtdO/WNtLdLxcfX7wCuTLm+Az6Pyw9qekWbfee2ZjvgJn/lfofnOE9n9+Q1XOx+vvaqyUFB/ylLc8m86Hsv9dXUJshQTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnzuHOy/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnzuHOy/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d91ded8174so33191145ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788852720; x=1789457520; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/czle5egijXcWYNpVpE/ZR2lQD0b3NyL5+H5JuNtgXU=;
        b=WnzuHOy/j0pqrN253W1IcqDhN7Uwvnu9syk+BA1Dtqi3uBYDA1ppQLlhI7WzI5VYpB
         PiFv2YFJlKJDx7HSGyorOCdNPHCvcYbx2aVJ9aD87X0lfWYYL6++dbEaxvSUaoAeOH/E
         6xHxzDnvfTtR3dTjnn9JSEZ3RhB8/GGu+VWrFKsuZ+UKacldhXLGWB3awo00NF5Dyzd6
         dHAQsQsAJFyOxNeBO2WaqRpucqXJ8LJC/zCE6CdfsQqwh7is4/M7ztW3rkqB61bW2FqN
         nrfWMjFouGSANQ3tKZPnOnkeAuo3UELCeO+0ClYUiurvaIYO98nGoLoU9ogg1E7v+4PK
         KicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852720; x=1789457520;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/czle5egijXcWYNpVpE/ZR2lQD0b3NyL5+H5JuNtgXU=;
        b=inRHztyVkH7CPwmNay2yo4RW1DZ+AchW8Tys3DqYvy6KMsvP/djZr1E7OVcHIpI7U/
         a54p/QfRChtl4mfC9uEmu+7Z8ou6MIR7Ikt1ZCEzXHYgBSzrdBze45tLDInu5hDaQhMs
         HkcBBAO6hhYK6dgwuybH0jyr4o57lrVmUAg7Pj1DUJ1KdBKDmnqQkuLsSRJTVpeDXkZz
         brjUOb06OhtXhzzcYL0NmbHvgRUUWgykwfZcWncMT+hQhMhmQF2YBAY7xiM47/0e0JbA
         x7hGVtonix2dmnlblkao31M0qd2nHTqm0FjslXyoZHWXslSX+1tAw9+bR2f+F0WPar//
         a4BQ==
X-Forwarded-Encrypted: i=1; AKwUvBysWm4gFJOSljhpTyEkQw+9fDMM7DQVVVA5BkPOEhk1HviEbNVqXli6Vacl9PMlBIbqyKaOGqKgymly+h8=@vger.kernel.org
X-Gm-Message-State: AFuF++nh62mjZPbmWHg7dtAQWqf/L0O1xj4t+2A+d8HM5iubyUxEH7GO
	6MqZZ85eedT4tmJwQpV16xpafB7RKrT8Jc0fz5/wlYy4hz/dDVumI5Il
X-Gm-Gg: AYBFou3U1IFWSyJvK+P/706IT4QdsPB4uV7CsVZNYLWw038Fe31QrHzv5ZpitnX3I+Q
	eVP+tHUI+rRHueIjhq5QmJeWCwIdfvqxIhYJZVqFIwJ8dgfMYOf/LXGU6Njt2khjkMYMPIzW+0S
	3g7bx1TNBlFUvZgpsUG7dqyvgP8pCL+xN7U3+zbBGTb1wj2Xf3qtzMxRJrIrUZtRjazcDc/QVk8
	l5ktX7gbuVbg1eESiVTNv62x0eHLEAixN4w6FqR+9t9IGY9co2LGIxisSD65DGbAL0zQC9wM025
	hUuzNfeTKYtHR/+tQXXIpqrYy0UrnqIJbhh+kBxZjg08VmKR8PdrDD2+tVR4ITPmB7QyFoCA71L
	HmzqwCQwnpbXsVqDwG7YeLah10jEC9Esaw7gLG4TXLKswhwXi4VcXdPFymkKeVAMuSOlKRkuFrA
	1mX9Dq0SwfYpaG/PlVP6bUUNtShGnh48LB+W/t8vK3LEI2kvAyfLSGgD7vGrS1G5YFut11Q7Ic
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr37624902a91.17.1788852719900;
        Tue, 08 Sep 2026 00:31:59 -0700 (PDT)
Received: from [192.168.66.6] ([218.108.80.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62bd7acsm10916555a91.1.2026.09.08.00.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:31:59 -0700 (PDT)
From: Linfeng Sun <linfeng.sun.dev@gmail.com>
Date: Tue, 08 Sep 2026 15:31:51 +0800
Subject: [PATCH] vduse: return compat ioctl results directly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fix-vduse_dev_compat_ioctl-v1-1-62264d9bfb8d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBBF0a2U+TYQg63WrUgJTfLUEW1KJg1C6
 d6N+nngclcSJIbQuVkpobBwnCr2u4b8fZxuUByqyWjT6V6f1JXfqoRFYAOK9fE1j9ly9PmpOhM
 Oum2PzqGnOpgTav2bX4a/ZXEP+Pw90rZ9AEwv5tB+AAAA
X-Change-ID: 20260908-fix-vduse_dev_compat_ioctl-62d40557bbe9
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Linfeng Sun <linfeng.sun.dev@gmail.com>
X-Mailer: b4 0.16.0

The compat handler handles VDUSE_IOTLB_GET_FD and VDUSE_VQ_GET_INFO, but
then calls the native handler. Their different command sizes make native
dispatch return -ENOIOCTLCMD.

For GET_FD, this overwrites receive_fd()'s return value after the
descriptor is installed, leaking one fd per call. Return handled compat
results directly and use native dispatch only for other commands.

Fixes: 455a2a1af926 ("vduse: fix compat handling for VDUSE_IOTLB_GET_FD/VDUSE_VQ_GET_INFO")
Signed-off-by: Linfeng Sun <linfeng.sun.dev@gmail.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 4dea4d6a3855..49a231bdf948 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1882,11 +1882,11 @@ static long vduse_dev_compat_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}
 	default:
-		ret = -ENOIOCTLCMD;
-		break;
+		return vduse_dev_ioctl(file, cmd,
+				       (unsigned long)compat_ptr(arg));
 	}
 
-	return vduse_dev_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+	return ret;
 }
 #else
 #define vduse_dev_compat_ioctl compat_ptr_ioctl

---
base-commit: d7808b37da0a619cf1fa541c2384e783fecc2480

Best regards,
-- 
Linfeng Sun <linfeng.sun.dev@gmail.com>


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E3155C97
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697182; cv=none; b=f9PXQRG2Ups4MH3FEkXPA4VoQToznN4q3g1P+FOOgjmkco+USbrtxtbTUbrMrYsJzNxJzDqU0ogFhj2zaSSKcFNbZv5azabJ/cusqscmzeNgIBEDCxh5dkG8yowPY2BBTVmSKa8bEnyRNtLEAzOSDdq6jBEdRJE4P3v0zIKApR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697182; c=relaxed/simple;
	bh=WHkdijCBirwJQxGUkjmL74/GZgWdwkOAT7bacyLe+ko=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXnFCsWrg5v5KztOoHKH5p3cJtVF/yVP1w3ml0HPwNDPc+xNqJCQj6lF7CEY4yHqVK8vyY7BYJPm/lqL0NrKYfs/gUEXrwmVHj+QNHfpi3ZLFierVPMvLu7xibh07k2DCPkgpAVl8+tHICl789Iuuo0oKgoaNtgS43f3awArRNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHDMnLNa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHDMnLNa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d942c7cc2fso19782055ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788697178; x=1789301978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpdcKrJLKQFKxdneH8MEpLcde77LFmEiZubVtCmbqlQ=;
        b=aHDMnLNaeNONukYG34MsQIDJ33KU8dE5tSUYFpBD7d9ToVlQpw07o7xfWFmnmuO6Lj
         tE3hp4N57nf9HpUr+CZL7hPkwnTKM8NspkMLHycA1bj9D+LaSC4E1mkXd4rVkuS1pYPR
         +Mg7kKkrMvyGcJTQ6DP5sBiqMg1v6zD26ts2Jj2gpbcuz6XtULvDCrR0J7hPdUoRpJ/Q
         DwU1OsOb9yUgkMf2x1oMNSuV1ERGlrZGAPuUsgeiHYRhV8rx/88LtzenKD/zHIfE5TqE
         gaBZ4Kpm1re3y+uvqlWe2th4cy8ZbJ5G9M5iqZKVy+LvHA0lkxV2YNIw/K2tS5sF8IDS
         7IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788697178; x=1789301978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FpdcKrJLKQFKxdneH8MEpLcde77LFmEiZubVtCmbqlQ=;
        b=KAZsb78nzorksLz7DBrZeWXccuQzNiS1e6MRPXb7sPzb6qnEy9YtTiXdoKLO3CIGSE
         3I46AvavgoL6oejZHDKkHU5nVMybVQC46zNRM68dQT8KqQd+xE+3OeR02xjc11kVD9Bk
         o8wSzUc5IDpwbf5IUz52al4odJs2d04Aw5sMhZdz2QVHzzEK6C1Lyf9OWTW3k6rWcjc+
         hzvZxDnAZW5aDt4N16BpS0PLFd+o6421vnUibFEc0vq8F8+awBVexJF64W0DQ6emLr3u
         /TS+5XDkzOVa5TG/cpa6kYktWcJ2RqrhqE8H0wjgE5J0AxNenqg6CBiAGAV3r75eE8Oa
         5OcQ==
X-Forwarded-Encrypted: i=1; AKwUvByYMgAjRoyWe1zD9U0/bT7ulS+y4W06NEZDTtoTGx1XIDqbjt3IsfGiGaiRxgAiT4LZm6aXKwgTO2Q7qkc=@vger.kernel.org
X-Gm-Message-State: AFuF++l8oE3A/7rzV1cN+R5jgRk8nBXZXAWSBPRAIdreZfDjAZTLeg8b
	o9kw46xm6W1d7M7URFD5xCMV1/dO7PdqdjnVw/3AMEF/MQcg29cvoUjN
X-Gm-Gg: AYBFou1qFliZibLFPzYkAeQXNZZqK5OXfI+pVO8AW5bejRh02ZGCUtu8Ru8n35YfpPV
	Nd04bhzW3qU2lFbKxQUhJu/OTFzQhJOMco/VbzLHIVtgHyEu80VELpVDBSa3voOsxi+iml+pQRW
	WkDlW5IqlpDyzrceTh3NUskmjA+Fjwz8Eyo3iXGYaf/J9W5Zl+yQdZULSdjAUCPuOHJQ41kVvxp
	MltGbtBiuchD9FG11EbZ3HXah9MSx0BKI51yntGswVUiznpSsZcwtbdBLCXPi5dtLhiQtOS22i8
	nhv2za75JplAbWNerUYb9ZCnGP5rItSg5LSzZixQ3ll9npz+vg+2NHTz9dh5NQ5Lj4JLWgJZV/k
	cu9xJkyTs1CqXbeMn2U+i9YGSZpC21JkFqaDEKiiEns5AuDVFmUOEwMuCHKGwmGh/tyK7c6eKwF
	K+e8bRScHVOVD7rAeWk3/jwIy0EyKUAURp/oW2DfIrPhDtt1WgZmDSLT97uWMvWmKzE1nSdQ==
X-Received: by 2002:a17:903:3b51:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2db1250d4e4mr167739125ad.2.1788697177605;
        Sun, 06 Sep 2026 05:19:37 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:61d3:d76a:f196:4cf:cc30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm20462005eec.27.2026.09.06.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:19:36 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Sun, 6 Sep 2026 20:18:23 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] crash_dump: Disallow writing to dm-crypt configfs
 during kexec_file_load syscall
Message-ID: <ap1US-aayjZTm1UG@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-3-coiby.xu@gmail.com>
 <86f3b10d-6fc2-4dbc-a20b-5d2365601be2@linux.ibm.com>
 <apLKk_P9wHc9uSZQ@Rk>
 <ccf3c0ae-f04b-4d81-b09e-daa5c785ec10@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccf3c0ae-f04b-4d81-b09e-daa5c785ec10@linux.ibm.com>

On Sun, Aug 30, 2026 at 11:07:30AM +0530, Sourabh Jain wrote:
>
>
>On 29/08/26 17:47, Coiby Xu wrote:
>>On Sat, Aug 29, 2026 at 12:32:46PM +0530, Sourabh Jain wrote:
>>>
>>>
>>>On 28/08/26 14:18, Coiby Xu wrote:
>>>>If writing to the configfs group happens concurrently during
>>>>kexec_file_load syscall, it may lead to the following issues,
>>>>  - buffer overflow if dm-crypt keys are added after allocation
>>>>  - stale total_keys if dm-crypt keys are removed during iteration
>>>>  - keys_header will not be freed if config/crash_dm_crypt_key/reuse is
>>>>    set true
>>>>
>>>>So hold config_keys_subsys.su_mutex for the entire sequence during the
>>>>kexec_file_load syscall to ensure a consistent snapshot. To have serial
>>>>access to config/crash_dm_crypt_key/reuse, use the kexec lock as 
>>>>we also
>>>>need to access kexec_crash_image serially.
>>>>
>>>>Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump 
>>>>reserved memory")
>>>>Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>>>---
>>>> kernel/crash_dump_dm_crypt.c | 28 ++++++++++++++++++++++++----
>>>> 1 file changed, 24 insertions(+), 4 deletions(-)
>>>>
>>>>diff --git a/kernel/crash_dump_dm_crypt.c 
>>>>b/kernel/crash_dump_dm_crypt.c
>>>>index 4335b6cb1fc4..026c7de4ad85 100644
>>>>--- a/kernel/crash_dump_dm_crypt.c
>>>>+++ b/kernel/crash_dump_dm_crypt.c
>>>>@@ -7,6 +7,7 @@
>>>> #include <linux/configfs.h>
>>>> #include <linux/module.h>
>>>> #include <linux/sysfs.h>
>>>>+#include "kexec_internal.h"
>>>> #define KEY_NUM_MAX 128    /* maximum dm crypt keys */
>>>> #define KEY_SIZE_MAX 256    /* maximum dm crypt key size */
>>>>@@ -296,14 +297,20 @@ static ssize_t 
>>>>config_keys_reuse_store(struct config_item *item,
>>>>     bool val;
>>>>     int r;
>>>>+    if (!kexec_trylock()) {
>>>>+        r = -EBUSY;
>>>>+        goto unlock;
>>>
>>>
>>>Are we unlocking a lock that we didn't acquire? How about 
>>>returning -EBUSY directly instead?
>>
>>Ah, thanks for catching my mistake! And also thanks for prioritizing
>>reviewing my patch!
>
>No worries at all! Happy to help, and thanks for the patch.

Thank you:)

>
>
>>
>>>
>>>
>>>>+    }
>>>>+
>>>>+    r = -EINVAL;
>>>>     if (!kexec_crash_image || 
>>>>!kexec_crash_image->dm_crypt_keys_addr) {
>>>>         kexec_dprintk(
>>>>             "dm-crypt keys haven't be saved to crash-reserved 
>>>>memory\n");
>>>>-        return -EINVAL;
>>>>+        goto unlock;
>>>>     }
>>>>     if (kstrtobool(page, &val) || !val)
>>>>-        return -EINVAL;
>>>>+        goto unlock;
>>>>     if (is_dm_key_reused) {
>>>>         pr_info("Already got dm-crypt keys, please continue 
>>>>with kexec_file_load syscall\n");
>>>>@@ -311,12 +318,15 @@ static ssize_t 
>>>>config_keys_reuse_store(struct config_item *item,
>>>>         r = get_keys_from_kdump_reserved_memory();
>>>>         if (r) {
>>>>             pr_warn("Failed to get dm-crypt keys from reserved 
>>>>memory\n");
>>>>-            return r;
>>>>+            goto unlock;
>>>>         }
>>>>         is_dm_key_reused = true;
>>>[...]
>>>>     }
>>>>-    return count;
>>>>+    r = count;
>>>>+unlock:
>>>>+    kexec_unlock();
>>>>+    return r;
>>>> }
>>>> CONFIGFS_ATTR(config_keys_, reuse);
>>>>@@ -421,6 +431,8 @@ static int build_keys_header(void)
>>>>     return 0;
>>>> }
>>>>+static bool mutex_acquired;
>>>>+
>>>> int crash_load_dm_crypt_keys(struct kimage *image)
>>>> {
>>>>     struct kexec_buf kbuf = {
>>>>@@ -432,6 +444,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>>>     };
>>>>     int r = 0;
>>>>+    mutex_lock(&config_keys_subsys.su_mutex);
>>>>+    mutex_acquired = true;
>>>>+
>>>>     if (key_count <= 0) {
>>>>         kexec_dprintk("No dm-crypt keys\n");
>>>>         return 0;
>>>>@@ -481,6 +496,11 @@ void 
>>>>kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>>>
>>>I explored the kexec_file_load syscall entry path and noticed
>>>that there is a path where the call to
>>>kimage_file_post_load_cleanup() can be skipped.
>>>
>>>For example, if kexec_file_load is called and everything goes well
>>>but kexec_post_load() fails, we skip
>>>kimage_file_post_load_cleanup(), and consequently
>>>kexec_file_post_load_cleanup_dm_crypt() as well.
>>>
>>>If that happens, the config_keys_subsys.su_mutex remains locked,
>>>which could cause problems with the next kexec load, right?
>>
>>Thanks for exploring the kexec_file_load syscall entry path! I took a
>>further look at it. Even though kimage_file_post_load_cleanup can be
>>skipped, kimage_free will be called regardless which will in turn call
>>kimage_file_post_load_cleanup.
>
>Ah yes, I missed that. That said, we are calling
>kimage_file_post_load_cleanup() twice for every kexec_file_load, so this
>needs to be looked into separately.

Thanks for the reminder! I have a further look at
kimage_file_post_load_cleanup and can confirm repeatedly calling
kexec_file_post_load_cleanup_dm_crypt won't cause any trouble.

Btw, I think there is no need to call kimage_file_post_load_cleanup
twice because kimage_free is to be called for sure. I also notice
kimage_file_alloc_init also calls kimage_file_post_load_cleanup which
seems unnecessary as well. kimage_file_alloc_init even calls
kfree(image) which may lead to UAF. Anyways these are separate issues
thus shall be addressed in separate patches.


-- 
Best regards,
Coiby
